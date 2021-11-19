Return-Path: <SRS0=zkJ7=QG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30604C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 07:11:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5CF661AD2
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Nov 2021 07:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E5CF661AD2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=WQS9Gq9enILq5qcUlh01YzcVdDHjrEOS5NGUeuOPc1o=; b=Ft0UcxUYZHdqSKfFeAltjlLE4D
	vU3sR8zBDclfZgXUo+oQqMvEIEsE4yhKiXpNb/xG73gpiu9VVLCQvGimYIlXF5NB6XIsMnflcwl19
	Xk5QOf449UocFWCh+yzWLVSd+JWIPPAXD0pdjaPlbVttu21oeaDizfENUf9mDgqJ04nxxgserpx1s
	4F29RW50ce8eksRqad/OORTyE985dUVrhZA8bALUTdzj4MlldtfRPjGmgnFqYO8z3/6z9JmEw74TP
	LY0/4Ac7DiFoNJ3HF+5dGWWFmEQbAFLvPpmwEmGGuaZd9lDK1LWL4LQg3nNuCyUeRglCJy6liVQap
	yXiyZGcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mny3E-009Zan-Qx; Fri, 19 Nov 2021 07:11:12 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mny35-009ZYk-Pv
 for linux-riscv@lists.infradead.org; Fri, 19 Nov 2021 07:11:10 +0000
Received: by mail-pl1-x62e.google.com with SMTP id n8so7452548plf.4
 for <linux-riscv@lists.infradead.org>; Thu, 18 Nov 2021 23:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=p1eOarTU7vFn4QPFb7iBA1/Wh2WEiqkaaZtB0EXNIbg=;
 b=n0557Xpy2MZDEwOCBv48cUPpw/kWOtrMnxUBlIoJFQ8vAvvkFzUUadY805EUsLA/Gu
 Dl2lz3irhjVgZhaiTM12sAR/I84EFzzV3hJYWKZ65YuRk4zVt01fTdgTahAPBT4x53RO
 Ql+GWy/Guc2s5eFVNl37oIxV6lWiikDmcVNj8hqWiqRTX7CraAalS+xINAE/N2Lqjwn9
 VejiIdeCb4X3vVwWJ7RW1jyoUjYHKKW/YN+WF/n+/7AbqD7xyFexwuS+OfskzCDTHoYG
 7kUxs8obqM5s50Y4g8Hjuy1cHdA8GnGcDNe0D+KKZQwFoDRp5c1FQa+sDmqwJknlovIO
 S8XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=p1eOarTU7vFn4QPFb7iBA1/Wh2WEiqkaaZtB0EXNIbg=;
 b=CyJxLcWuLm3ANYR4961MiUnkRq5VlImPUk/AO0Tnvwbke0b6TYSYcAmWo//NsqLva0
 ORdUzT4mDNivoGiEbMpzgr8wdvndEG0V2xM9cJG7LfbwmClTwG1JsuI1bJhxY2ZhIhc9
 22IyUfbrh7pRI7KFaqP4qq0ND6KlBSJq1GXrqU2xwN/uIATX5NXITNTzJ6TExl5VT9fP
 MtMX1GzRSnGhcIl7n7swIRyFaVBsZEuq14SF+kKeLOiI45y8GAhqAHPUb7EoHOfeSNsz
 /QqpDoiBZ5hXMSGf/ndsgECDlEq2yXNP/UyMWI3n1Dn1u06o5jmQQoZSaMEdRf/YCKxM
 QN/Q==
X-Gm-Message-State: AOAM533gN0cqB6PD4OdnlKeEg+0+Ys7o2aQBxG1t+5RKsAAeU08fEQCl
 AjF60IjPUQJmqRWLVzZDMfPwUduucLhKuA==
X-Google-Smtp-Source: ABdhPJwzp5ErLpKo7gRGQ3ynTLhW//0js/26Li6JKEiANpMVB02o+STzwmjrCFk975ykqRnfXr7N8A==
X-Received: by 2002:a17:903:4043:b0:142:4f21:6976 with SMTP id
 n3-20020a170903404300b001424f216976mr74448503pla.62.1637305861199; 
 Thu, 18 Nov 2021 23:11:01 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id u32sm1754055pfg.220.2021.11.18.23.11.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 23:11:00 -0800 (PST)
Date: Thu, 18 Nov 2021 23:11:00 -0800 (PST)
X-Google-Original-Date: Thu, 18 Nov 2021 23:10:54 PST (-0800)
Subject: Re: [PATCH] riscv: fix building external modules
In-Reply-To: <mvma6imr1ww.fsf@suse.de>
CC: linux-riscv@lists.infradead.org, abdulras@google.com,
 linux-kernel@vger.kernel.org, nathan@kernel.org, ndesaulniers@google.com,
 morbo@google.com, clang-built-linux@googlegroups.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: schwab@suse.de
Message-ID: <mhng-797195d8-b49e-418b-af9a-013d36194662@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_231103_871327_50E71397 
X-CRM114-Status: GOOD (  14.64  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 02 Nov 2021 08:51:43 PDT (-0700), schwab@suse.de wrote:
> When building external modules, vdso_prepare should not be run.  If the
> kernel sources are read-only, it will fail.
>
> Fixes: fde9c59aebaf ("riscv: explicitly use symbol offsets for VDSO")
> Signed-off-by: Andreas Schwab <schwab@suse.de>
> ---
>  arch/riscv/Makefile | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
> index 0eb4568fbd29..41f3a75fe2ec 100644
> --- a/arch/riscv/Makefile
> +++ b/arch/riscv/Makefile
> @@ -108,11 +108,13 @@ PHONY += vdso_install
>  vdso_install:
>  	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso $@
>
> +ifeq ($(KBUILD_EXTMOD),)
>  ifeq ($(CONFIG_MMU),y)
>  prepare: vdso_prepare
>  vdso_prepare: prepare0
>  	$(Q)$(MAKE) $(build)=arch/riscv/kernel/vdso include/generated/vdso-offsets.h
>  endif
> +endif
>
>  ifneq ($(CONFIG_XIP_KERNEL),y)
>  ifeq ($(CONFIG_RISCV_M_MODE)$(CONFIG_SOC_CANAAN),yy)

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
