Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79B4CCD1297
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2024 08:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:
	To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JV2kXI0TXiXb25JZ+hERL6wpM2nHBQNwDr9V128WW4=; b=B/OAdjhjrVdjY3MCcIDdPvOLhE
	ECEsF8pw56ejTY5bh8EYv+5QY7CleY6grA9wKr7esI5wMzI8uowObBdk3lSta6ATI/abFDVcy+U8g
	lAW0NTZjeL6BfPlqBxHyvFdoWC5gbWTVZ4UHtzWP/InxRSHfEA96tson0y8ah0trgofMEVnTFBPMN
	Zm2mrgVpHa68nAHQAfN8GAwYxy1dBtGWZap2SAEvntNUld05oG4DcJaRiUv42zghsV0358PVLwUbs
	deOHSUBj+ttVZRuXvYhroyKlggamelQXzwSdJMmI+A3n3MCpsC/tUEjVN6ebt58GjX56VFzXALzdi
	DYEno8jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru6s8-00000000yUh-080M;
	Tue, 09 Apr 2024 08:30:28 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru6rd-00000000y9u-2Bq4
	for linux-riscv@lists.infradead.org;
	Tue, 09 Apr 2024 08:30:03 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-56e2e851794so11490a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 Apr 2024 01:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712651395; x=1713256195; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bbxvxR2kTsZrGDzp7wpPaeoomAXH4lu1Zzi61j4kVso=;
        b=pVdro15vpIIB+F0NRiaA0GhcvirhO31x7GEYnuHBCFOdiveKpypYbjWG+RJqwy1KtV
         T9XSx+cwTX6H6jv3cvaP58xpShrXTBqoItJ9d3fj0n2RuCYZ5eXlWYbIBWU8uyDMg7MF
         9j2ahw0RlRKr7sLTrJVUCbj4kToh0ReIS45mr6JilebIfV0HyNSESqRzDKeganE1OdsD
         27FtYr8rQfVun61n42rVUeHOjFAJmsj0aWdzr/ZihFh9s8zaIpqIky74iRuyK9MQPdxr
         g+NK9EGOGMLfX3LHqVUqn+60spDTSBHo09zqj0DU0vsjOjtsVAddKNARLkLdn+8adNrE
         BIyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712651395; x=1713256195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bbxvxR2kTsZrGDzp7wpPaeoomAXH4lu1Zzi61j4kVso=;
        b=X/ZsKKpVI0Sw4E7RtUpjci6uuZaxZVrPkgNn3mAQT8+X8Ac5/+ySCV4ihYBRZYcP7J
         4oWHiyjJiQlMDiOx+eJ1WN2HbmRNvQiwDw9LTf4ZpQVPGmHMN8L+nu3SEBw1efetZK5q
         fLkGJsfxVUUKhnLfQMWmS4ezR9VdQEqa5vIIbLASbBxAVKxCvYNNQgbl/lPjtvIUzzu5
         Lw8ZSLTcfR0WJWetNGeMPc+Kzna4OIY53HqKz3n96ArDGezZvmpz74YIUkNPf06Oi/IP
         W7maYyO6L1Lrcnld1jOTH+GN0RkWh5I5kRFL858b6IgjvrF+90KGKF6I4e8qQ3jlUOg2
         3Htw==
X-Forwarded-Encrypted: i=1; AJvYcCUeBDOeCBbTowF7IIJmBZyy1Yhoi2RY7ZB/yFb9Y0QwvWfE+wokhZS8VD4kbYhDbJpkLP3skCPNbMzHmWgv92aPuztScU2XvGDfTQk2Yyv1
X-Gm-Message-State: AOJu0YwTJuRFBF2Nbs+oJLI1Zp4QDYKir1q+2NTg4eDYP6p2uXK5rHaC
	rUiSOym1952IwJXwQJ5ZjrXhZVOjhL2JYH05oukp7l8c22Kjc9i2V0m/PKAEzX54I8P7fLoVN3A
	nAI6zH/s3zpIwTWslhrELeuMyWpeJJ7SpWSlo
X-Google-Smtp-Source: AGHT+IFedxUzZzJQZFWpk7PfjqCQe9MhHK9GR/n/K6RNRHxDWuxNRkZZ6+vtRGlle1WaVfFOtzERy2T1KT4gdhzUBGE=
X-Received: by 2002:aa7:d157:0:b0:56e:2b67:a2f8 with SMTP id
 r23-20020aa7d157000000b0056e2b67a2f8mr88428edo.7.1712651394704; Tue, 09 Apr
 2024 01:29:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240403131936.787234-1-linux@roeck-us.net> <20240403131936.787234-4-linux@roeck-us.net>
In-Reply-To: <20240403131936.787234-4-linux@roeck-us.net>
From: David Gow <davidgow@google.com>
Date: Tue, 9 Apr 2024 16:29:42 +0800
Message-ID: <CABVgOSknXkT=WU-fwi5wP4bWv04DKByxSYAPmhYhC--FaQH-PQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/15] kunit: Add test cases for backtrace warning suppression
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook <keescook@chromium.org>, 
	Daniel Diaz <daniel.diaz@linaro.org>, Arthur Grillo <arthurgrillo@riseup.net>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard <mripard@kernel.org>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	kunit-dev@googlegroups.com, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	loongarch@lists.linux.dev, netdev@vger.kernel.org, x86@kernel.org, 
	Linux Kernel Functional Testing <lkft@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_012959_362332_74C298CF 
X-CRM114-Status: GOOD (  28.08  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1213758628045272579=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1213758628045272579==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000000789b80615a5ba67"

--0000000000000789b80615a5ba67
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Apr 2024 at 21:19, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Add unit tests to verify that warning backtrace suppression works.
>
> If backtrace suppression does _not_ work, the unit tests will likely
> trigger unsuppressed backtraces, which should actually help to get
> the affected architectures / platforms fixed.
>
> Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---

There's a typo in the Makefile, which stops this from being built at
all. Otherwise, it seems good to me.

-- David

> v2:
> - Rebased to v6.9-rc1
> - Added Tested-by:, Acked-by:, and Reviewed-by: tags
> - Introduced KUNIT_SUPPRESS_BACKTRACE configuration option
> v3:
> - Rebased to v6.9-rc2
>
>  lib/kunit/Makefile                     |   7 +-
>  lib/kunit/backtrace-suppression-test.c | 104 +++++++++++++++++++++++++
>  2 files changed, 109 insertions(+), 2 deletions(-)
>  create mode 100644 lib/kunit/backtrace-suppression-test.c
>
> diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
> index 545b57c3be48..3eee1bd0ce5e 100644
> --- a/lib/kunit/Makefile
> +++ b/lib/kunit/Makefile
> @@ -16,10 +16,13 @@ endif
>
>  # KUnit 'hooks' and bug handling are built-in even when KUnit is built
>  # as a module.
> -obj-y +=                               hooks.o \
> -                                       bug.o
> +obj-y +=                               hooks.o
> +obj-$(CONFIG_KUNIT_SUPPRESS_BACKTRACE) += bug.o
>
>  obj-$(CONFIG_KUNIT_TEST) +=            kunit-test.o
> +ifeq ($(CCONFIG_KUNIT_SUPPRESS_BACKTRACE),y)

s/CCONFIG_/CONFIG_/ ?




> +obj-$(CONFIG_KUNIT_TEST) +=            backtrace-suppression-test.o
> +endif
>
>  # string-stream-test compiles built-in only.
>  ifeq ($(CONFIG_KUNIT_TEST),y)
> diff --git a/lib/kunit/backtrace-suppression-test.c b/lib/kunit/backtrace-suppression-test.c
> new file mode 100644
> index 000000000000..47c619283802
> --- /dev/null
> +++ b/lib/kunit/backtrace-suppression-test.c
> @@ -0,0 +1,104 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * KUnit test for suppressing warning tracebacks
> + *
> + * Copyright (C) 2024, Guenter Roeck
> + * Author: Guenter Roeck <linux@roeck-us.net>
> + */
> +
> +#include <kunit/test.h>
> +#include <linux/bug.h>
> +
> +static void backtrace_suppression_test_warn_direct(struct kunit *test)
> +{
> +       DEFINE_SUPPRESSED_WARNING(backtrace_suppression_test_warn_direct);
> +
> +       START_SUPPRESSED_WARNING(backtrace_suppression_test_warn_direct);
> +       WARN(1, "This backtrace should be suppressed");
> +       END_SUPPRESSED_WARNING(backtrace_suppression_test_warn_direct);
> +
> +       KUNIT_EXPECT_EQ(test, SUPPRESSED_WARNING_COUNT(backtrace_suppression_test_warn_direct), 1);
> +}
> +
> +static void trigger_backtrace_warn(void)
> +{
> +       WARN(1, "This backtrace should be suppressed");
> +}
> +
> +static void backtrace_suppression_test_warn_indirect(struct kunit *test)
> +{
> +       DEFINE_SUPPRESSED_WARNING(trigger_backtrace_warn);
> +
> +       START_SUPPRESSED_WARNING(trigger_backtrace_warn);
> +       trigger_backtrace_warn();
> +       END_SUPPRESSED_WARNING(trigger_backtrace_warn);
> +
> +       KUNIT_EXPECT_EQ(test, SUPPRESSED_WARNING_COUNT(trigger_backtrace_warn), 1);
> +}
> +
> +static void backtrace_suppression_test_warn_multi(struct kunit *test)
> +{
> +       DEFINE_SUPPRESSED_WARNING(trigger_backtrace_warn);
> +       DEFINE_SUPPRESSED_WARNING(backtrace_suppression_test_warn_multi);
> +
> +       START_SUPPRESSED_WARNING(backtrace_suppression_test_warn_multi);
> +       START_SUPPRESSED_WARNING(trigger_backtrace_warn);
> +       WARN(1, "This backtrace should be suppressed");
> +       trigger_backtrace_warn();
> +       END_SUPPRESSED_WARNING(trigger_backtrace_warn);
> +       END_SUPPRESSED_WARNING(backtrace_suppression_test_warn_multi);
> +
> +       KUNIT_EXPECT_EQ(test, SUPPRESSED_WARNING_COUNT(backtrace_suppression_test_warn_multi), 1);
> +       KUNIT_EXPECT_EQ(test, SUPPRESSED_WARNING_COUNT(trigger_backtrace_warn), 1);
> +}
> +
> +static void backtrace_suppression_test_warn_on_direct(struct kunit *test)
> +{
> +       DEFINE_SUPPRESSED_WARNING(backtrace_suppression_test_warn_on_direct);
> +
> +       if (!IS_ENABLED(CONFIG_DEBUG_BUGVERBOSE) && !IS_ENABLED(CONFIG_KALLSYMS))
> +               kunit_skip(test, "requires CONFIG_DEBUG_BUGVERBOSE or CONFIG_KALLSYMS");
> +
> +       START_SUPPRESSED_WARNING(backtrace_suppression_test_warn_on_direct);
> +       WARN_ON(1);
> +       END_SUPPRESSED_WARNING(backtrace_suppression_test_warn_on_direct);
> +
> +       KUNIT_EXPECT_EQ(test,
> +                       SUPPRESSED_WARNING_COUNT(backtrace_suppression_test_warn_on_direct), 1);
> +}
> +
> +static void trigger_backtrace_warn_on(void)
> +{
> +       WARN_ON(1);
> +}
> +
> +static void backtrace_suppression_test_warn_on_indirect(struct kunit *test)
> +{
> +       DEFINE_SUPPRESSED_WARNING(trigger_backtrace_warn_on);
> +
> +       if (!IS_ENABLED(CONFIG_DEBUG_BUGVERBOSE))
> +               kunit_skip(test, "requires CONFIG_DEBUG_BUGVERBOSE");
> +
> +       START_SUPPRESSED_WARNING(trigger_backtrace_warn_on);
> +       trigger_backtrace_warn_on();
> +       END_SUPPRESSED_WARNING(trigger_backtrace_warn_on);
> +
> +       KUNIT_EXPECT_EQ(test, SUPPRESSED_WARNING_COUNT(trigger_backtrace_warn_on), 1);
> +}
> +
> +static struct kunit_case backtrace_suppression_test_cases[] = {
> +       KUNIT_CASE(backtrace_suppression_test_warn_direct),
> +       KUNIT_CASE(backtrace_suppression_test_warn_indirect),
> +       KUNIT_CASE(backtrace_suppression_test_warn_multi),
> +       KUNIT_CASE(backtrace_suppression_test_warn_on_direct),
> +       KUNIT_CASE(backtrace_suppression_test_warn_on_indirect),
> +       {}
> +};
> +
> +static struct kunit_suite backtrace_suppression_test_suite = {
> +       .name = "backtrace-suppression-test",
> +       .test_cases = backtrace_suppression_test_cases,
> +};
> +kunit_test_suites(&backtrace_suppression_test_suite);
> +
> +MODULE_LICENSE("GPL");
> --
> 2.39.2
>

--0000000000000789b80615a5ba67
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPqgYJKoZIhvcNAQcCoIIPmzCCD5cCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg0EMIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
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
7xDrOPfX3COqq162RFg/MFcGA1UdIARQME4wCQYHZ4EMAQUBATBBBgkrBgEEAaAyASgwNDAyBggr
BgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wDAYDVR0TAQH/
BAIwADCBmgYIKwYBBQUHAQEEgY0wgYowPgYIKwYBBQUHMAGGMmh0dHA6Ly9vY3NwLmdsb2JhbHNp
Z24uY29tL2NhL2dzYXRsYXNyM3NtaW1lY2EyMDIwMEgGCCsGAQUFBzAChjxodHRwOi8vc2VjdXJl
Lmdsb2JhbHNpZ24uY29tL2NhY2VydC9nc2F0bGFzcjNzbWltZWNhMjAyMC5jcnQwHwYDVR0jBBgw
FoAUfMwKaNei6x4schvRzV2Vb4378mMwRgYDVR0fBD8wPTA7oDmgN4Y1aHR0cDovL2NybC5nbG9i
YWxzaWduLmNvbS9jYS9nc2F0bGFzcjNzbWltZWNhMjAyMC5jcmwwDQYJKoZIhvcNAQELBQADggEB
AK0lDd6/eSh3qHmXaw1YUfIFy07B25BEcTvWgOdla99gF1O7sOsdYaTz/DFkZI5ghjgaPJCovgla
mRMfNcxZCfoBtsB7mAS6iOYjuwFOZxi9cv6jhfiON6b89QWdMaPeDddg/F2Q0bxZ9Z2ZEBxyT34G
wlDp+1p6RAqlDpHifQJW16h5jWIIwYisvm5QyfxQEVc+XH1lt+taSzCfiBT0ZLgjB9Sg+zAo8ys6
5PHxFaT2a5Td/fj5yJ5hRSrqy/nj/hjT14w3/ZdX5uWg+cus6VjiiR/5qGSZRjHt8JoApD6t6/tg
ITv8ZEy6ByumbU23nkHTMOzzQSxczHkT+0q10/MxggJqMIICZgIBATBoMFQxCzAJBgNVBAYTAkJF
MRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFzIFIz
IFNNSU1FIENBIDIwMjACEAHS+TgZvH/tCq5FcDC0n9IwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZI
hvcNAQkEMSIEIEYJ92tMQt1mLZYqUzFbjlRJnCW5B3EIBXcLly2sk0FjMBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MDQwOTA4Mjk1NVowaQYJKoZIhvcNAQkPMVww
WjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkq
hkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQBplz+p
lHrF075AA3Dg264/7JsidsEuMH8LUuD/nhtJfIRePel9iinmyz3Pt0SHKta1ZisckWpcyZBUeLUH
L9Yl5yKfQrGvmEm6CsKybVt8o0j7oQNg77ZGWNYNWKl+Ff/FrTD2W6r61cCtyEXBEDwcswc4UpjK
pnXKHLQND2+g/2bQNDdgKN/EJY5538GJg3KL4KcLrAzvc2yXb/X4LemO9o+DFOISDuRRozuHWrzy
+JhEobM2fnXkDgwX+Zw3cYWq4xjZHMgzjFgd8hDOGM53gDSGkE+3ZLc1z7ilc/49hbGL++hVrf4B
IgY0FfUEYjqaoYvtSGBxMVSnLGFL83E3
--0000000000000789b80615a5ba67--


--===============1213758628045272579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1213758628045272579==--

