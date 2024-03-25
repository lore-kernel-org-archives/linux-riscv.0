Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A598BC54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 19:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9ZvLTD4pgyEzDul9lNyl8cZQUQNUT816nO/+QAYZVes=; b=wDaJlEB6N9hd0F
	wFNNYOR0Du1OdlnBCUWgw7g6aLaJ62KHTc6EMgZB4wg6LELI2GHHRAbhmV2YpzDX291BZw4MND4zi
	p0Js3lN5D0fTrnsTkfyzgaQ7N0E61HbYrwaQ5LGi+qMu+/XtYS3v2+IVwEv3tD61sDyJyxAuxEw2r
	5YZwcKrwtRta9GYM31mckuMEUsxaSt0qcH7JXYyAyP0h3EZkKrXZ+ZfQS+4Od1uIuugejIPRkzmmV
	9ZDomzJhOeiGKlGCf8OSrb0R2kkK8jM2O2oyHjGRY9EUe5//Pl3R5ZQrPfgX5zmKadKLqoKVT2+6Z
	6POMCICBEt0KMHN+kCyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ropwA-00000001aQk-3hd2;
	Mon, 25 Mar 2024 19:24:50 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ropw4-00000001aMq-2LR3;
	Mon, 25 Mar 2024 19:24:46 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5cf2d73a183so3616109a12.1;
        Mon, 25 Mar 2024 12:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711394683; x=1711999483; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P8SlcQVDmaEWiOte6mDmefSXrzEKVOFtuPmb7V2Kzic=;
        b=L21HxG/A+5rrVWDt6wYWXZS9uGSbRaqVX2nkPTmJaZog6ouRpNR8+bzeGN4/wtik7b
         RB7FPio91pAeQl198YFy5pz7I1+xcmzAwUkX0Pp3r3mgqf8xV3jdK/ZA+HQWwnzz6e84
         nMJg3LFnN36X6aN2hDLZPptkbd34TJt6eWZZcNFWP4GVw8kC2Qnj3g6rx/x4bgg7tTNc
         rJmRndpE0hf+Y4IwBUG4Bkt/pIX0vF05JdXxhXG05nryNEWS4NtE1JZSFHAZiQ2V7C4n
         MFZFBYMb2lJRNTag64Y4gEwsJj0EPmrY279VYHa2WHba/FSRsr6zU31dvYY3iHVyDcz/
         gleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711394683; x=1711999483;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P8SlcQVDmaEWiOte6mDmefSXrzEKVOFtuPmb7V2Kzic=;
        b=sQLB+z7Kfg4TtlF4Lw8TBWOicSCJpFgKrlhCFkR+zJS8bTCyUf6JcI3+ax3ckufL9t
         HeVFRQFANF4ySJd154NO3GHCWckkftpyYBddIqkLMgw/0VI7eKirSiYFzZdVli5YJsLj
         6HhYAsURsnmsQNXWXxHztQ6zj8ndJr5Bk+1xFG1PjrCLjzYTDDChPUbTaMCCibRBGFNr
         85Yj5Tg3CabmeVE2p+fk1eGpAVm0uSsydjqxdaB+Y2lGtYN3JOLKqlcOoZNUBUrHSJ7o
         rZ0YXrMt/tg0kONC0PsGR6eym9fjAFiQXoFI2WJLr8WKqP9Z139rTjpKwmB1AfF2LZSj
         GM3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXp3wihykk2L1Eh30s+slB/A4onpKcmbqbYpZhXUOT+Uc2nmCe2h/ZymO8yHabLz0OxV6ZQ3RziEwWzroJCXwJYzcS6OeabsUFOAFlGKSllPCgV3fZqeE2g5ifSaZAkp5vWDJWf5YTjSXcYlD2LI3ZwS/nEA0=
X-Gm-Message-State: AOJu0YyTdyUSI4Z9p/Tq4oJstVFo93h4H4PjRcD036rIjDFBlAG9h6W8
	hNZzzi75unwS7I/rOe39l7pedsl6JfLM4Bg1o1DS4vpLb8BACse7
X-Google-Smtp-Source: AGHT+IFwrImv53xAJXZaDSLJtn5nAAXYRWdj5wAShxC6nIYkDeejlGCGK79rEKa0DnGROBP9wWQclw==
X-Received: by 2002:a17:90b:3d8:b0:29b:a345:620a with SMTP id go24-20020a17090b03d800b0029ba345620amr10896738pjb.20.1711394683229;
        Mon, 25 Mar 2024 12:24:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q7-20020a17090a304700b0029bf9969afbsm10113710pjl.53.2024.03.25.12.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 12:24:42 -0700 (PDT)
Date: Mon, 25 Mar 2024 12:24:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, loongarch@lists.linux.dev,
	netdev@vger.kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: Re: [PATCH v2 05/14] drm: Suppress intentional warning backtraces in
 scaling unit tests
Message-ID: <e880828b-552e-488e-9f31-3989bec276ae@roeck-us.net>
References: <20240325175248.1499046-1-linux@roeck-us.net>
 <20240325175248.1499046-6-linux@roeck-us.net>
 <0729b218-53f1-4139-b165-a324794a9abd@igalia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0729b218-53f1-4139-b165-a324794a9abd@igalia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_122444_658814_C75469EB 
X-CRM114-Status: GOOD (  21.26  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

On Mon, Mar 25, 2024 at 04:05:06PM -0300, Ma=EDra Canal wrote:
> Hi Guenter,
> =

> On 3/25/24 14:52, Guenter Roeck wrote:
> > The drm_test_rect_calc_hscale and drm_test_rect_calc_vscale unit tests
> > intentionally trigger warning backtraces by providing bad parameters to
> > the tested functions. What is tested is the return value, not the exist=
ence
> > of a warning backtrace. Suppress the backtraces to avoid clogging the
> > kernel log.
> > =

> > Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> > - Rebased to v6.9-rc1
> > - Added Tested-by:, Acked-by:, and Reviewed-by: tags
> > =

> >   drivers/gpu/drm/tests/drm_rect_test.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> > =

> > diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/te=
sts/drm_rect_test.c
> > index 76332cd2ead8..75614cb4deb5 100644
> > --- a/drivers/gpu/drm/tests/drm_rect_test.c
> > +++ b/drivers/gpu/drm/tests/drm_rect_test.c
> > @@ -406,22 +406,28 @@ KUNIT_ARRAY_PARAM(drm_rect_scale, drm_rect_scale_=
cases, drm_rect_scale_case_desc
> >   static void drm_test_rect_calc_hscale(struct kunit *test)
> >   {
> > +	DEFINE_SUPPRESSED_WARNING(drm_calc_scale);
> >   	const struct drm_rect_scale_case *params =3D test->param_value;
> >   	int scaling_factor;
> > +	START_SUPPRESSED_WARNING(drm_calc_scale);
> =

> I'm not sure if it is not that obvious only to me, but it would be nice
> to have a comment here, remembering that we provide bad parameters in
> some test cases.

Sure. Something like this ?

        /*
         * drm_rect_calc_hscale() generates a warning backtrace whenever bad
         * parameters are passed to it. This affects all unit tests with an
         * error code in expected_scaling_factor.
         */

Thanks,
Guenter

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
