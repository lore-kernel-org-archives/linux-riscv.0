Return-Path: <SRS0=gYAW=T2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FSL_HELO_FAKE,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8649AC282E3
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 26 May 2019 14:42:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CF682070D
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 26 May 2019 14:42:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nyu9Q0G1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZqY6/9U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CF682070D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M6nzQ32mgNnyo+lBKzK8L4Wuni158dduA5vycve7pVc=; b=nyu9Q0G1Sjlyfl
	i+VUDHF9uliVtwMQ5N0940ctx4oURIVf/hiMiggEwCy7HSyQqvLQehutat4DjG2BoFPbSRCUEYRD1
	ftKoywJ0wU6EnECuUjjxrFmgh2MbG7UfhhR4yZnVE5hi3PQyn5MLXJX/tnQdmAhHka5AjJjZwa8ta
	2WoXi4f22jU9ZiQywj8yIyh4ED6YcYunp2S5zx8GQNC1+axJhs+0w5kMw1KllfAMDIBRxerpZ+ihp
	k5HMCn4DyrrZ3QuMPJHcOfFUK8vH71RqJk4YipXP81gewFtK2XQWrCpSmY8JzfRPrHepDrmOJLuYJ
	Z0xddpXNPB4+Vj7d8iaA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hUuMH-00084i-Ap; Sun, 26 May 2019 14:42:45 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hUuM9-0007yd-DV; Sun, 26 May 2019 14:42:39 +0000
Received: by mail-wm1-x342.google.com with SMTP id 15so13326325wmg.5;
 Sun, 26 May 2019 07:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4Jc4sO30EHRrfMknAHHzVrJgrARHyBdt4KcFxsTnWW4=;
 b=kZqY6/9U2aXYB0+PivvRG/0EZvp1fvoxyT3c45tkGVmfC4/e9dy+hrfcgmrZGRLy8F
 GZn5Fcdv9W6+EG0+HpnNhGPu6ty3tLYFsHWvLtMY2+EOTbbWUnKaTEFIOR3FJMAzoGBb
 wIeiMRIAQ1A5tWu9BW4gOY1PulRcSsWcZlHOUeHQ2RTxRA9hMUQxxq6/p9ube593cCVk
 /YnBMNZnytvf3lfK7f+NYW8NEi5zVf5dVcvQtFM/byZPraz13zyJIDKyH5gPQLZAtyDG
 KnNvz+K4mLyV8PnoXkWKCmA2hon1TqOOBoqQNp3OjuoeHSNQgKi062bLW0O3WC+y/vHs
 iS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=4Jc4sO30EHRrfMknAHHzVrJgrARHyBdt4KcFxsTnWW4=;
 b=cxikc2xWseQJmSkBR4i1KRv4H3Y337T3Er86Q9sQZenosK7tTq4UcITpfYlABfa7YH
 ehcPwtpmVeR+TY/F+pLGYEeGLOI7go21egjAtzgfV6anavtjjH5NzhE1lvQeMHI9f3xM
 vpJoxCnjSnPeHonf2Yk713Tjh3z8zONeY8woLg1mSnwydqdO3+f5uV4zRS9QsYByy7X7
 r/d06sJ3pt20JErtz8sScynwkP3Z5IdXkMSTBF/uR1+yb0k/ySta8nXY73cheK+qow+l
 VYqQmksngy7+6ESYIUMBraXUsx3PrZ6l3f0LoN2MMMhYTUTxMzaci7BT1kTbrDJE14RZ
 YtYg==
X-Gm-Message-State: APjAAAV6d8qCxVWbnfjnwlEkgoGS7H9wgbgpX4Lgs+7sWaoYGX/dq281
 5R92N2zsTAwCs2MaEc0zVm8=
X-Google-Smtp-Source: APXvYqw5Ns1JM3P7xKflG+zD8xW+7XcRAC9D5p29qkjHX4kJkAZxEFsVfB+lfQo6LcL9QNKTSE8P5g==
X-Received: by 2002:a1c:6342:: with SMTP id x63mr24065933wmb.58.1558881753913; 
 Sun, 26 May 2019 07:42:33 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
 by smtp.gmail.com with ESMTPSA id o20sm8014462wro.2.2019.05.26.07.42.32
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 26 May 2019 07:42:32 -0700 (PDT)
Date: Sun, 26 May 2019 16:42:30 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Subject: Re: [PATCH REBASE v2 1/2] x86, arm64: Move ARCH_WANT_HUGE_PMD_SHARE
 config in arch/Kconfig
Message-ID: <20190526144230.GA13220@gmail.com>
References: <20190526125038.8419-1-alex@ghiti.fr>
 <20190526125038.8419-2-alex@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190526125038.8419-2-alex@ghiti.fr>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190526_074237_480840_01F7773E 
X-CRM114-Status: GOOD (  13.65  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H . Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org


* Alexandre Ghiti <alex@ghiti.fr> wrote:

> ARCH_WANT_HUGE_PMD_SHARE config was declared in both architectures:
> move this declaration in arch/Kconfig and make those architectures
> select it.
> 
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> ---
>  arch/Kconfig       | 3 +++
>  arch/arm64/Kconfig | 2 +-
>  arch/x86/Kconfig   | 4 +---
>  3 files changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index c47b328eada0..d2f212dc8e72 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -577,6 +577,9 @@ config HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
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
> index 4780eb7af842..dee7f750c42f 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -70,6 +70,7 @@ config ARM64
>  	select ARCH_SUPPORTS_NUMA_BALANCING
>  	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION
>  	select ARCH_WANT_FRAME_POINTERS
> +	select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || (ARM64_16K_PAGES && !ARM64_VA_BITS_36)
>  	select ARCH_HAS_UBSAN_SANITIZE_ALL
>  	select ARM_AMBA
>  	select ARM_ARCH_TIMER
> @@ -884,7 +885,6 @@ config SYS_SUPPORTS_HUGETLBFS
>  	def_bool y
>  
>  config ARCH_WANT_HUGE_PMD_SHARE
> -	def_bool y if ARM64_4K_PAGES || (ARM64_16K_PAGES && !ARM64_VA_BITS_36)
>  
>  config ARCH_HAS_CACHE_LINE_SIZE
>  	def_bool y
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 2bbbd4d1ba31..fa021ec38803 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -93,6 +93,7 @@ config X86
>  	select ARCH_USE_QUEUED_SPINLOCKS
>  	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
>  	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
> +	select ARCH_WANT_HUGE_PMD_SHARE
>  	select ARCH_WANTS_THP_SWAP		if X86_64
>  	select BUILDTIME_EXTABLE_SORT
>  	select CLKEVT_I8253
> @@ -301,9 +302,6 @@ config ARCH_HIBERNATION_POSSIBLE
>  config ARCH_SUSPEND_POSSIBLE
>  	def_bool y
>  
> -config ARCH_WANT_HUGE_PMD_SHARE
> -	def_bool y
> -
>  config ARCH_WANT_GENERAL_HUGETLB
>  	def_bool y

Acked-by: Ingo Molnar <mingo@kernel.org>

Thanks,

	Ingo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
