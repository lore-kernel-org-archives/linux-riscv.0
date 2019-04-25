Return-Path: <SRS0=WcIC=S3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EC5EC43219
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 17:42:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E650D20675
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2019 17:42:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DjHONLTm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="HCieBeQn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E650D20675
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=amsxjzqbCC7Yq2DCxZ271mtJGWp4FmO8gs2YT4GuZBs=; b=DjHONLTmsqDksOJgELTcuFRNS
	2FcCJFYlySbT1DFC8h5MC6lcaR7VEkkdIIjjk22wd1Dyv8Lp6PBSyGRV0gOX8loteQXX5MVBuciQk
	bsz0fPLDCjM0jJbaJIEjjneqGScnWq39wtsTCfPA8hoWVJy3IJ/KnCU8Q+uFabW98tF8ubNlZ6viN
	uQr++wclUeV4k3gILdYPJyxLD9+awOY5EQkXj0/Vz/3qKVx1+URWbwqy0wSKLWw8yedbyTM3Kwbmr
	VMDtuVGS9F/AwqrKdYhqCnjnSt9dWnDxds31vNZRMAtW7QgdozNduSAbqp44L4tuFnB2dxMjawsIW
	DtdWgznEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hJiOW-0003sM-Om; Thu, 25 Apr 2019 17:42:48 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hJiOT-0003r8-Hh
 for linux-riscv@lists.infradead.org; Thu, 25 Apr 2019 17:42:46 +0000
Received: by mail-pg1-x543.google.com with SMTP id n2so181621pgg.13
 for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2019 10:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=86BiqtuaE9Uuzh6uQTzGh9piSST8UhnDgUvET+cCroc=;
 b=HCieBeQn5i/68nu0Wldu/PGMV3yIGWHhqHc7ygCuzWkbpZX8mT4yoSzf84TUqvUhp+
 N1IxYNXPpNf8FTSQZIARmPEBlzX18NwCxXzoixJX7ZIRRRajtp6Huvs3/OmtQ+G/tcdc
 wvoUrFySlutusERjTfH/I7cUsTTOBMheQHaRLm6K7EkpXFvH4ckzdLtoBqI0vEx6wv/1
 rqFEFH7MnvIrP3JR7yjLBzPAKzwT0ykYdI/xDlw5aMJvG1W67MEId+Gvj31KJsPKM4DK
 6J+YfAChCQWfEk1VdxLFOaejHsyuwbvgMIoZEeiaR2gsHZd3Xmb8KfcvlSoCjW10xya5
 h+4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=86BiqtuaE9Uuzh6uQTzGh9piSST8UhnDgUvET+cCroc=;
 b=VQ5cEirvwPdFt/n9LaJjUX19QMReSwCtg4W0f1vZlzqJEgy1oEXKLut9p4aSYZECS+
 /niMDlwpPIrqej6QVEuCh7jN1PM+0yzA9034My1cFbWOT2weFCQCn8zezJY7peD8FfGO
 W5IAK0ccV9iZpkTlpwF2jFFef1n3sZq09SgAubxl8GgMqIETtCfTAm0THJg87hatCdiz
 XLnqD3w7BHTXIZRUwr5GvwgWN9kgcXB4YNEblYHLok+TXoGf+z0nYoVToF/68eUWQZEt
 8eedu7sg9KWPnrCExn1fTUpZz0XXAIFrrBgAc+OfW6aqoLfuQzUaGf+hgaTTebuiTLpH
 65VA==
X-Gm-Message-State: APjAAAVXH/i65Mc72TgvqTCpupA8mTVYfvsQALI0SYIWhkai1zJxR/Ta
 qpdIX/OWBr6sBI7mi6MAeu45ig==
X-Google-Smtp-Source: APXvYqwZh3jLz2nak9BgfuoKLyG2XmvcfvwtoluyObn7I08ywB1zpsk+47kwzWfpQJRqmBXZrCfTmA==
X-Received: by 2002:a62:524e:: with SMTP id g75mr41211465pfb.106.1556214164330; 
 Thu, 25 Apr 2019 10:42:44 -0700 (PDT)
Received: from localhost ([134.134.139.92])
 by smtp.gmail.com with ESMTPSA id 4sm3975816pfj.45.2019.04.25.10.42.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 25 Apr 2019 10:42:43 -0700 (PDT)
Date: Thu, 25 Apr 2019 10:42:43 -0700 (PDT)
X-Google-Original-Date: Thu, 25 Apr 2019 09:28:24 PDT (-0700)
Subject: Re: [PATCH v2 1/2] x86,
 arm64: Move ARCH_WANT_HUGE_PMD_SHARE config in arch/Kconfig
In-Reply-To: <20190409061449.5083-2-alex@ghiti.fr>
From: Palmer Dabbelt <palmer@sifive.com>
To: alex@ghiti.fr, catalin.marinas@arm.com, Will Deacon <will.deacon@arm.com>, 
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de
Message-ID: <mhng-4d1d4acb-f65f-4ed4-bc86-85a14b7c3e16@palmer-si-x1e>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190425_104245_621131_849DBC01 
X-CRM114-Status: GOOD (  11.51  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, alex@ghiti.fr, x86@kernel.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 hpa@zytor.com, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, mike.kravetz@oracle.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 08 Apr 2019 23:14:48 PDT (-0700), alex@ghiti.fr wrote:
> ARCH_WANT_HUGE_PMD_SHARE config was declared in both architectures:
> move this declaration in arch/Kconfig and make those architectures
> select it.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  arch/Kconfig       | 3 +++
>  arch/arm64/Kconfig | 2 +-
>  arch/x86/Kconfig   | 4 +---
>  3 files changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 8c858bb133c9..273cefc6b787 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -567,6 +567,9 @@ config HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
>  config HAVE_ARCH_HUGE_VMAP
>  	bool
>
> +config ARCH_WANT_HUGE_PMD_SHARE
> +	bool
> +
>  config HAVE_ARCH_SOFT_DIRTY
>  	bool
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 870ef86a64ed..8b7870974961 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -68,6 +68,7 @@ config ARM64
>  	select ARCH_SUPPORTS_NUMA_BALANCING
>  	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION
>  	select ARCH_WANT_FRAME_POINTERS
> +	select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || (ARM64_16K_PAGES && !ARM64_VA_BITS_36)
>  	select ARCH_HAS_UBSAN_SANITIZE_ALL
>  	select ARM_AMBA
>  	select ARM_ARCH_TIMER
> @@ -885,7 +886,6 @@ config SYS_SUPPORTS_HUGETLBFS
>  	def_bool y
>
>  config ARCH_WANT_HUGE_PMD_SHARE
> -	def_bool y if ARM64_4K_PAGES || (ARM64_16K_PAGES && !ARM64_VA_BITS_36)
>
>  config ARCH_HAS_CACHE_LINE_SIZE
>  	def_bool y
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 0f2ab09da060..fd5fc2d288be 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -82,6 +82,7 @@ config X86
>  	select ARCH_USE_QUEUED_SPINLOCKS
>  	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
>  	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
> +	select ARCH_WANT_HUGE_PMD_SHARE
>  	select ARCH_WANTS_THP_SWAP		if X86_64
>  	select BUILDTIME_EXTABLE_SORT
>  	select CLKEVT_I8253
> @@ -298,9 +299,6 @@ config ARCH_HIBERNATION_POSSIBLE
>  config ARCH_SUSPEND_POSSIBLE
>  	def_bool y
>
> -config ARCH_WANT_HUGE_PMD_SHARE
> -	def_bool y
> -
>  config ARCH_WANT_GENERAL_HUGETLB
>  	def_bool y

Reviewed-by: Palmer Dabbelt <palmer@sifive.com>

Let me know if you want this via my tree, as I'd also like patch 2 which
depends on this one.  I've tenatively added both to my for-next tree for now.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
