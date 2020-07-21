Return-Path: <SRS0=tQi0=BA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C229C433E3
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 01:17:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B7BF20658
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2020 01:17:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HXJ7BqCh";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="Kd2f1DpQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B7BF20658
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=bvw/pIgnU+H7DV8c2HOpqXP2JqaY01kHOa4+dZaC8vA=; b=HXJ7BqCht0Q0y6rqEZDbal0dA
	XTZTX0Iuy2/isPmReDLB1vGbj4klQCngOiKILkCaiO49JvJST3dG4jsW9rpI1OiyJSNFgwBhejQPL
	TusAm0vsfI/fz+YEjAWxGozXwFsrIbU9q2G84kbJbIxmzcximNRQqPP3fzxOVasFqMIqy90vcWUmE
	YlR+dabizuWHoQWQeKz0gYmCBZT1IM3Vd5VY+NSp9vZJc4GA23fP/4xL1siUZAO9NBuK3TpZ9WIEc
	kFwXXCFkTJLUFkYL7iaaj1B2jTNjZXxS065SVxeMJRT2cV153XEQf8Ji5poq74Ruoz5MSQvnbU7C1
	Tu+L6nRmA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jxguj-0002Qr-Kh; Tue, 21 Jul 2020 01:17:49 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jxgug-0002Pf-Tk
 for linux-riscv@lists.infradead.org; Tue, 21 Jul 2020 01:17:48 +0000
Received: by mail-pl1-x644.google.com with SMTP id x8so9507401plm.10
 for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2020 18:17:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=/n872cM2M3CLkRHUgVO55nk5U5BBIV7BrPLcG211bhQ=;
 b=Kd2f1DpQAICU8hxcTKxIt59+qYM3UA0c492sd8XUrW/ph+nhKdOyCFFtJUT4wgoemm
 7Xu6UZtnu/A9GUS8HmPZEHyMXYnE0l77ZrZDvmRHWFURz48wW3Txed71f+K2Xd4O/s4v
 J7RblJMknVcIeTYRZZzesbWmF1qTJ5F7R8mjGjC3hPFe31HJdxYyEmR+AaRi9VsvYgNj
 fbOQWXDCwtBcI2R+POQ1SDx18v9wAxcc6vn+EGsHuXbQ/UXxQMvNf6HrgduKQdyxnnGi
 PDSWiZNqoIeGptGSzIR2yfmp27Qk+aq80JP1S/+jaccP0uII5jlI7yjzEkuvYuGc4PFe
 Eawg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=/n872cM2M3CLkRHUgVO55nk5U5BBIV7BrPLcG211bhQ=;
 b=fkHHNwtUoQJTFnkfBISXuEj4E3DmvwwiNdtV0oFXUikK+vMSVWd6jVzdWqxr1YWMkh
 FcfJGr/gogiJMbrFSzYkSk3igtajsrrSs86rRxMrfTK72jsY7pBzMJRtksWjLmGyF8ks
 OsPbnmth9IfQTIHoUakV9qKMcW2X2gsMZ7sRje3fVK1jTUNf6Rcs8Zi9H397vgCzVWmR
 tplI5rIQ98M5soKAyr9so+A/+Dhwo4f5dUxHpq/ZvwpOShe5Ynz/OYVecBV50SD69F5b
 r2rQW1jl5++TIiEDzFb4Xj48PUo9UGJtju7ASwdz6l3xSIm7ZC2uiD+mEsNv9H17/N6d
 Sjsw==
X-Gm-Message-State: AOAM5315lo5P/ysRQzjuGOY8uBYoPtadAg/EP1zQO8NRaf0ZhwTRDKht
 omxyysZuRe/1LB6xsSHLEoqzU4w1fu0=
X-Google-Smtp-Source: ABdhPJyZDnF0IgmpupMMlaGLLmbAiAkmqi/pDJEdE7GNxD7OYpkKqAPoSVxXLay5KCsO4CZQXtsokw==
X-Received: by 2002:a17:90a:784b:: with SMTP id
 y11mr2144112pjl.51.1595294264663; 
 Mon, 20 Jul 2020 18:17:44 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id o23sm18965104pfd.126.2020.07.20.18.17.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 18:17:44 -0700 (PDT)
Date: Mon, 20 Jul 2020 18:17:44 -0700 (PDT)
X-Google-Original-Date: Mon, 20 Jul 2020 18:17:42 PDT (-0700)
Subject: Re: [PATCH 1/1] riscv: Enable ARCH_HAS_FAST_MULTIPLIER for RV64I
In-Reply-To: <20200709051922.13110-1-maochenxi@eswin.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: maochenxi@eswin.com
Message-ID: <mhng-e8fe18f0-e6d7-4ee2-8a9b-a00dbf0b338b@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200720_211747_203719_8C8BE38A 
X-CRM114-Status: GOOD (  17.74  )
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

On Wed, 08 Jul 2020 22:19:22 PDT (-0700), maochenxi@eswin.com wrote:
> Enable ARCH_HAS_FAST_MULTIPLIER on RV64I
> which works fine on GCC-9.3 and GCC-10.1
>
> PS2: remove ARCH_SUPPORTS_INT128 because of RV64I already enabled.
>
> Signed-off-by: Chenxi Mao <maochenxi@eswin.com>
> ---
>  arch/riscv/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 128192e14ff2..84e6777fecad 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -202,6 +202,7 @@ config ARCH_RV64I
>  	bool "RV64I"
>  	select 64BIT
>  	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128 && GCC_VERSION >= 50000
> +	select ARCH_HAS_FAST_MULTIPLIER
>  	select HAVE_DYNAMIC_FTRACE if MMU
>  	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
>  	select HAVE_FTRACE_MCOUNT_RECORD

Ah, thanks -- this one didn't show up when I was looking at the last one.  I
think we can put the fast multiplier on rv32 and rv64, there shouldn't be any
difference there.  I guess in theory we should be sticking this all in some
sort of "platform type" optimization flags, but that's probably bit much for
now.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
