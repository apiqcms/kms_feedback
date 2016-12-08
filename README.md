## KMS Feedback

This extension allows submitting contact/callback/feedback forms from frontend side and having it under "Messages" section in [KMS](https://github.com/webgradus/kms). When ActionMailer settings setup, it notifies selected users about new messages by email as well.

## Installation

1. Add to Gemfile:

        gem "kms_feedback"
        # or for edge version:
        gem "kms_feedback", github: "webgradus/kms_feedback"

2. Run generator:

        rails g kms_feedback:install

3. Copy migrations:

        rails kms_feedback:install:migrations

4. Migrate:

        rails db:migrate

5. Recompile assets:

        rails assets:precompile

6. Restart KMS instance

## Usage

Your form on webpage should look like this:

    <form action="/feedbacks" method="post">
        <input type="hidden" name='authenticity_token' value='{{ request.form_authenticity_token }}'>

        <input type="text" name="feedback[name]" placeholder="Name">
        <input type="tel" name="feedback[phone]" placeholder="Phone">
        <input type="email" name="feedback[email]" placeholder="Email">
        <textarea name="feedback[message]" placeholder="Message"></textarea>
        <input type="submit">
    </form>

IMPORTANT!
Necessary to have form's action and method exactly like above (as well as inputs names).
And don't forget about `authenticity_token`.

Form validation should happen completely on client side (you could use HTML5 attrs or parsley.js or something similar).
You can use only some of fields - only `name` and `phone` for example.

To make AJAX submit you would have something like this JavaScript code:

    <script>
      $(document).ready(function(){
        $('input[type="button"]').click(function(){
          $.post('/feedbacks', $('form[action="/feedbacks"]').serialize());
        });
      });
    </script>

and add validation as well.

This extension also provides adding Recaptcha to forms. For adding validation with Recaptcha:

1. Insert this fragment before closing </head> in your HTML:

        <script src='https://www.google.com/recaptcha/api.js'></script>

2. Insert this fragment at the bottom of <form> contents (where you need to place reCAPTCHA widget):

        <div class="g-recaptcha" data-sitekey="RECAPTCHA_PUBLIC_KEY"></div>

3. Enable Recaptcha under "Settings" (check dropdown menu on avatar clicking)

This project rocks and uses MIT-LICENSE.
