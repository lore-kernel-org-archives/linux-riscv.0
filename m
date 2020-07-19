Return-Path: <SRS0=z8rc=A6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65A38C433E2
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jul 2020 04:45:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31A212064C
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jul 2020 04:45:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1eQSxR+Q";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="hrJ7LWeC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31A212064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=wQrWmTyX87csUh0d2gOIVVx02Nf5TCEnwD+WJbfiD60=; b=1eQSxR+QOvvnOTPVmOmjxN9FW
	xna34VWU1H0QP2mvSY4XL/2zmC5DKbxPW0K+p/z3jEDueGFozLlrsP9Z9GgloMWMgIhtO21PfLLiN
	RGVS53/VDoAS/Smc4KpAggZiFTNw8I4Me1tnw2fm+1MMuXANBmJmNydeJYYnHpxlImauyeH2aznYb
	wwuDd7wQpU0pM1D5KpGpIQzSOeO9hqsXUoUgd4q0IixumAMAieQpdZI3BzKJrTrA4EbiovzAcX2d2
	ZWtD0vYguu+oIuT4QqZ69vMhihonas6BNEcfvlAhFJFppVIrpA/ragF3ObgQLFbBXF2LwADsmP1Hx
	mHfAqDEMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jx1Ce-0001YI-9P; Sun, 19 Jul 2020 04:45:32 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jx1CZ-0001Xj-1K
 for linux-riscv@lists.infradead.org; Sun, 19 Jul 2020 04:45:28 +0000
Received: by mail-pj1-x1044.google.com with SMTP id f16so8290684pjt.0
 for <linux-riscv@lists.infradead.org>; Sat, 18 Jul 2020 21:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=FEoJHD8hLAwDISEozbsWN4K8QUnQ9MVeLY2tTbYM424=;
 b=hrJ7LWeCm+YQ69Xb47AIhO5dpMNdzPX71K6khpcnhJMpjt0trlngYgwgk7hGYbZ/qZ
 l2n93XcHxwCsQ3CEtTMuWHZRUN5wTr1T/kGZK38Pi+NyXKpk3wPoQ2HUzYn1CvcXEipU
 0tzFrzapWEUm/GDHl3EeieMfjwEILRTlcg7n/hc3j56TQgZbVvzy1fDB5ZmheEEOxI+Q
 vfGaCjd5xUuKG9iAPSIJ5K5rrsL0ZKAXU+erh+mzEpQSb3oINWYA/iSIX1bIxJxqgkcM
 OWm/B1jFz7muRwkqUQxmc0W0kIGdd7hETLOIYpJx4xtI2S5SLgNY+VTJNSTIyw1qv0BH
 IA/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=FEoJHD8hLAwDISEozbsWN4K8QUnQ9MVeLY2tTbYM424=;
 b=D1xjtS8wCG8R7SisTjHiTB0sdV/sIcSCb4747y/dwhV+TRN9/5Tyc4AHczYNEp93BI
 j4pV4pP46+DLpzXJHXHWRsRMgcgZv2HW9pE0VPka4embXzzFfT0OqDcaSOfrflDUYn+M
 M8macGIbNk3PGKeyj6WOUH5ghPKwYyhYcbo3xFJlg8+EKr6ROdgn8mIpLzCO9sZOQ6ct
 xlhupQ+Bnx2ZxkchVr4fikruQ3l06bB0QUY509JuVcE4Vwg4XwjjFGtMhSUvc/AZL5Zz
 q14fOysYqWNnxIFIjknVc+Vz+Bn1Sz65WRZmniPPFo4ZzxpUFHDU7x69efgTIfALUFPX
 5/cQ==
X-Gm-Message-State: AOAM531WyVdeTjEVJH9kwwNE5xBDA3RnmtwhPOoqQq3dm7gR8WQraDlx
 iZVM1UX4bb65OOOZaL2v3+WGXQ==
X-Google-Smtp-Source: ABdhPJySzpejiPW0r9WWYNVbeaCmq3CLZqSUN2F55p6OiLGs3a/e8F6Qog9L2sHgvhtzgEE7Ph4Tyg==
X-Received: by 2002:a17:90a:21c3:: with SMTP id
 q61mr17252158pjc.207.1595133924391; 
 Sat, 18 Jul 2020 21:45:24 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id i66sm11639093pfc.12.2020.07.18.21.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jul 2020 21:45:23 -0700 (PDT)
Date: Sat, 18 Jul 2020 21:45:23 -0700 (PDT)
X-Google-Original-Date: Sat, 18 Jul 2020 21:45:20 PDT (-0700)
Subject: Re: [PATCH 1/1] riscv: Enable compiler optimizations
In-Reply-To: <20200708054354.25283-1-maochenxi@eswin.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: maochenxi@eswin.com, ardb@kernel.org
Message-ID: <mhng-8695bbb1-2ef2-409f-a458-3eb68d87495f@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200719_004527_242719_651E5B18 
X-CRM114-Status: GOOD (  16.65  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, maochenxi@eswin.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 chenxi.mao2013@gmail.com, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 07 Jul 2020 22:43:54 PDT (-0700), maochenxi@eswin.com wrote:
> Enable ARCH_HAS_FAST_MULTIPLIER and ARCH_SUPPORTS_INT128 for better
> code generation.
> These 2 configurations works fine on GCC-9.3 and GCC-10.1
>
> Signed-off-by: Chenxi Mao <maochenxi@eswin.com>
> ---
>  arch/riscv/Kconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 128192e14ff2..f21b7e5188ca 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -26,6 +26,8 @@ config RISCV
>  	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>  	select ARCH_WANT_FRAME_POINTERS
>  	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
> +	select ARCH_HAS_FAST_MULTIPLIER
> +	select ARCH_SUPPORTS_INT128 if GCC_VERSION >= 50000 || CC_IS_CLANG

IIRC int128 is only supported on 64-bit targets, and we already have this under
RV64I but with a different set of requirements.  It looks like everyone has a
different set of requirements, but I feel like CC_HAS_INT128 is the right way
to go.  I'm not sure why we have the version check there.  Ard: do you know why
we would need both?

The fast multiplier one looks fine to me.  They're supposed to stay
alphabetical, though.

>  	select CLONE_BACKWARDS
>  	select COMMON_CLK
>  	select EDAC_SUPPORT

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
