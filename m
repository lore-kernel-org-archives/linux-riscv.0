Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22EBFCD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 21:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=22WfdNIa2NK4m8dC4GvWvSVZEYfQR8NhLSPfVGM47P0=; b=EKK4GWGyFtR6AR
	V00EKP05KJNrBlBiyHtxMy7QtKSQoF1/BoU7dM71m7TVnPC0cKVFBzhGZIuDMSYbAGf0R3g3lga1l
	LtP/+llBCyRiigFhaIpPu5VLNDeUQ5ex2v4xPU1HY6JPb0EnMbDj5cwna+KdFoCSl8iSFuD2AgLzV
	8ZRitYT1dhMjrs6Mo5rUlGrjZRjTp1O9WYOYprNrzTuidinaGpHInpBif2R/wA7aAvI6nhQ4gxk2B
	4L9l8WJylTKK6fanIe73VerxPPknbZN5rLApna/74iBDRevjecrEdsH0bgllO6uTBsFL1NsXvrMzE
	t1k5VJNPDArR7gvlZBxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs82C-00000000Dqg-2PO7;
	Wed, 03 Apr 2024 21:20:40 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs829-00000000DpE-1xi0
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 21:20:39 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1e28be94d32so2255285ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 14:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712179236; x=1712784036; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gk/7t8bB/vPp5RYyhmHYp9/pKPIZpl1c0Hpc1VIArKM=;
        b=iV6M+BjbffPsvjXLc7Ib5SdMwD+9L0QB7Xu1fsajx9liG6pxsLWW+3DOyp1P4RtUCf
         wKSykj4zgb+JsSIN0wTfMwQP+l/pW7w6jzrSjXJP0cADB9g6njcVALlOzTWURrsgY/Lt
         vJOdwPsplxPo8oWRey0XA3XQwETpWZ5wHk7p4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712179236; x=1712784036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gk/7t8bB/vPp5RYyhmHYp9/pKPIZpl1c0Hpc1VIArKM=;
        b=U2zA714Qz2YMxTVareqfjTMgOCbnMQFj3uNRo2vDtZCmOMka4a+WOcMPnTNq53+hFN
         6O/uyY+ULDCDPTIkufo51xxBArGgmoeN7RR5AJiGHgs/uPD+V7+/6p4Xd3Ngblo2JDN5
         brc+vx0yllf1hVUMpo6Xe5mL5/yKeoDvkTHfDalAhd1E9tP1pTeoSDIh6sfISbEK8zVd
         Tpc7U86iI0E6aSatDO6NSmtny2Y6q7KgGbJcn7zUleC+/qBRM0Xmyd8fiBEykA+ZHpuc
         +g93/hp99uKHxEhy7AQQBVppHSrxyKaudcwUyNOpet2cCEAr5djI5ZFtl+35vs8EiKak
         8shw==
X-Forwarded-Encrypted: i=1; AJvYcCVCki+7/RQyly8otZO4bboD1ec5HosBnUbxn0cv0XpEEVR+dIi8CrMwTW6Zk64E1raonymNcIC9Ye2NU+5ki4PLSLeC0DP5KH1BXYQ5g6iE
X-Gm-Message-State: AOJu0YzNiQJ+TpMWEAjWgjr8hgHbPh0tnzeXRF7OYoXmLe220HESn09e
	p8jE0lOXqnFdtEyGsmq1pGvBScHrY4gJDwr+CNLEtJVpBQWumEf1dfLgXVlm0g==
X-Google-Smtp-Source: AGHT+IFNWSt+grv0aoo3QXgpCvCZ7QxZ9IBnA1B4gdZs5eLtWkdhNXO9ogb9Q/XDMKHoC6MfZl34Wg==
X-Received: by 2002:a17:903:110f:b0:1e0:f25b:e795 with SMTP id n15-20020a170903110f00b001e0f25be795mr509491plh.11.1712179236057;
        Wed, 03 Apr 2024 14:20:36 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id m16-20020a170902bb9000b001e2a87d7d2dsm163988pls.253.2024.04.03.14.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 14:20:35 -0700 (PDT)
Date: Wed, 3 Apr 2024 14:20:34 -0700
From: Kees Cook <keescook@chromium.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
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
	netdev@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v3 00/15] Add support for suppressing warning backtraces
Message-ID: <202404031414.645255D868@keescook>
References: <20240403131936.787234-1-linux@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240403131936.787234-1-linux@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_142037_720890_BAE532C2 
X-CRM114-Status: GOOD (  36.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 03, 2024 at 06:19:21AM -0700, Guenter Roeck wrote:
> Some unit tests intentionally trigger warning backtraces by passing bad
> parameters to kernel API functions. Such unit tests typically check the
> return value from such calls, not the existence of the warning backtrace.
> 
> Such intentionally generated warning backtraces are neither desirable
> nor useful for a number of reasons.
> - They can result in overlooked real problems.
> - A warning that suddenly starts to show up in unit tests needs to be
>   investigated and has to be marked to be ignored, for example by
>   adjusting filter scripts. Such filters are ad-hoc because there is
>   no real standard format for warnings. On top of that, such filter
>   scripts would require constant maintenance.
> 
> One option to address problem would be to add messages such as "expected
> warning backtraces start / end here" to the kernel log.  However, that
> would again require filter scripts, it might result in missing real
> problematic warning backtraces triggered while the test is running, and
> the irrelevant backtrace(s) would still clog the kernel log.
> 
> Solve the problem by providing a means to identify and suppress specific
> warning backtraces while executing test code. Support suppressing multiple
> backtraces while at the same time limiting changes to generic code to the
> absolute minimum. Architecture specific changes are kept at minimum by
> retaining function names only if both CONFIG_DEBUG_BUGVERBOSE and
> CONFIG_KUNIT are enabled.
> 
> The first patch of the series introduces the necessary infrastructure.
> The second patch introduces support for counting suppressed backtraces.
> This capability is used in patch three to implement unit tests.
> Patch four documents the new API.
> The next two patches add support for suppressing backtraces in drm_rect
> and dev_addr_lists unit tests. These patches are intended to serve as
> examples for the use of the functionality introduced with this series.
> The remaining patches implement the necessary changes for all
> architectures with GENERIC_BUG support.
> 
> With CONFIG_KUNIT enabled, image size increase with this series applied is
> approximately 1%. The image size increase (and with it the functionality
> introduced by this series) can be avoided by disabling
> CONFIG_KUNIT_SUPPRESS_BACKTRACE.
> 
> This series is based on the RFC patch and subsequent discussion at
> https://patchwork.kernel.org/project/linux-kselftest/patch/02546e59-1afe-4b08-ba81-d94f3b691c9a@moroto.mountain/
> and offers a more comprehensive solution of the problem discussed there.
> 
> Design note:
>   Function pointers are only added to the __bug_table section if both
>   CONFIG_KUNIT_SUPPRESS_BACKTRACE and CONFIG_DEBUG_BUGVERBOSE are enabled
>   to avoid image size increases if CONFIG_KUNIT is disabled. There would be
>   some benefits to adding those pointers all the time (reduced complexity,
>   ability to display function names in BUG/WARNING messages). That change,
>   if desired, can be made later.
> 
> Checkpatch note:
>   Remaining checkpatch errors and warnings were deliberately ignored.
>   Some are triggered by matching coding style or by comments interpreted
>   as code, others by assembler macros which are disliked by checkpatch.
>   Suggestions for improvements are welcome.
> 
> Changes since RFC:
> - Introduced CONFIG_KUNIT_SUPPRESS_BACKTRACE
> - Minor cleanups and bug fixes
> - Added support for all affected architectures
> - Added support for counting suppressed warnings
> - Added unit tests using those counters
> - Added patch to suppress warning backtraces in dev_addr_lists tests
> 
> Changes since v1:
> - Rebased to v6.9-rc1
> - Added Tested-by:, Acked-by:, and Reviewed-by: tags
>   [I retained those tags since there have been no functional changes]
> - Introduced KUNIT_SUPPRESS_BACKTRACE configuration option, enabled by
>   default.
> 
> Changes since v2:
> - Rebased to v6.9-rc2
> - Added comments to drm warning suppression explaining why it is needed.
> - Added patch to move conditional code in arch/sh/include/asm/bug.h
>   to avoid kerneldoc warning
> - Added architecture maintainers to Cc: for architecture specific patches
> - No functional changes
> 
> ----------------------------------------------------------------
> Guenter Roeck (15):
>       bug/kunit: Core support for suppressing warning backtraces
>       kunit: bug: Count suppressed warning backtraces
>       kunit: Add test cases for backtrace warning suppression
>       kunit: Add documentation for warning backtrace suppression API
>       drm: Suppress intentional warning backtraces in scaling unit tests
>       net: kunit: Suppress lock warning noise at end of dev_addr_lists tests
>       x86: Add support for suppressing warning backtraces
>       arm64: Add support for suppressing warning backtraces
>       loongarch: Add support for suppressing warning backtraces
>       parisc: Add support for suppressing warning backtraces
>       s390: Add support for suppressing warning backtraces
>       sh: Add support for suppressing warning backtraces
>       sh: Move defines needed for suppressing warning backtraces
>       riscv: Add support for suppressing warning backtraces
>       powerpc: Add support for suppressing warning backtraces

Tested-by: Kees Cook <keescook@chromium.org>

(for x86 and um)

I was planning to add warning suppression for the "overflow" KUnit
tests, but it seems the vmalloc routines aren't calling warn_alloc() any
more for impossible sizes. So, I think, no patches needed for
lib/overflow_kunit.c, but at the end of the day, I've tested this series
is working for me. :P

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
