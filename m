Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09E1C5473F
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Aug 2024 23:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xY9JKEL/zzBZmCmQpHCcmvUs83QsckfMBP1PVvgKd2I=; b=NjicqmcznB/PBv
	jjW/j1Qveqi0Wa1gJKHIO8K8EE49NlslJo+2mxL2NQS70Fz4SLkG+kap0O1E+iS8S8oih1Z6myCgU
	emRTYa16+GSSP3SbyNh7gKyQv3o28gK44j99nKgPhYeU507m0gSWawqKqI+mZSS0ZvmoQvR3IXnGy
	riDunEMFtfoAYog/LCiI7GMDxCYHJNeug3g7KA95h/FyevmPrXrURuGcI/JbdiJVB43DDYQkjl7gj
	k9qe4KCmS8jblEZiydGuSkzgYUSWfC5u5QdsCtVyzDsUpdKk3kfCOU3XoTug/aCb7ALOL9WSmHZRA
	FGHJliNGFZCoJCmAFOkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj5KV-0000000D61a-1WQ2;
	Tue, 27 Aug 2024 23:10:27 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj5KS-0000000D60z-0E4R
	for linux-riscv@lists.infradead.org;
	Tue, 27 Aug 2024 23:10:25 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-71431524f33so5121379b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 27 Aug 2024 16:10:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1724800222; x=1725405022; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W32QRSPB+v/v1hZB3DM0yi6GVvOLbgl8fIqle8GTQRg=;
        b=avZ4Md5PEyYuOBIPPWVwyTkZVfjfFcu/N0RA/Gsi17b35hyGzzHvKedn3z9QcBPS+a
         sWdAu8H9FpBSpF33fXNSMD/9On6LL03ZD5y1bh/TENhfwqCtXAt3k39kue3keda/2LH7
         pg1NGpLx1VuW0i3EHy+/sPgGfh4jtgr8+OJKOVTTGl4Mb6kUrTvZOb6ABoFvuBt8NMe0
         Q0adclUhIxxgu9U9ukWh3oGNz+zcyyOXweHOxpzA7PyUIb6P92CHTVlfEd+SNExnEL9+
         4kvAudpchjmGtglbloSGM7fFZpGZDC4S4tO9TepukV40s+QgmD/ZOsumvex9a7R+RrVH
         Iz5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724800222; x=1725405022;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W32QRSPB+v/v1hZB3DM0yi6GVvOLbgl8fIqle8GTQRg=;
        b=mrksiXISB+OfzrTTYrV5h6HuSlnXW98QijtXnhP2tY+ERTs8klS6xERA5SRv1We7Y/
         fdUsnBwID75rA0ev9tFjg5teFHJrEor/v9ko3LLOnkH6JqZ4QwdUc0iKhTQEMyaHZM2Q
         DOKIun5zBVoh2K2UdL+FQsSTq11bKEpFIBhBmwP5AHszlPV6n+3ap5fUmPl5q7fOipRi
         mICnyV5t4PHxz+Hc2HnkNaQJymcXC0EnWv3qV6Ov1OVlRixFWuhSb1VD09aD0vBtPKeR
         BAxl2Db9T6tl88JCDfZ6Jpg7159UdhkPc9bqDMCugHapAZCSQJy+YqQ5Y1jdPP92vRSz
         Q1tQ==
X-Forwarded-Encrypted: i=1; AJvYcCXB9Lpw9SCwPalR0FVq5tjC3NhofJq0KuBAs3E+u7LtLlOBWbcYHGribgnOQzouZ3La7MSxetjYlxzjgg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5kwlEmhYeGRI1n/0Gzjqmzpm+dbhGoNZpt35/VbDYTyX7ujEt
	4bCi5+nGdLDlcrRks7+s6Vwhwoh97hi6neuAmuTcbWHwPCnBHw0VjzPHmjJb4AA=
X-Google-Smtp-Source: AGHT+IEroGkXS6DzUhuTL3usdmL+nViyF25HwRxsfbE8sxGqcjS2RSN8mHQbCRPygBZgO5SnMudlIw==
X-Received: by 2002:a05:6a20:c6ce:b0:1ca:dbec:c5d2 with SMTP id adf61e73a8af0-1ccd28675a7mr85752637.5.1724800222214;
        Tue, 27 Aug 2024 16:10:22 -0700 (PDT)
Received: from x1 (75-164-215-68.ptld.qwest.net. [75.164.215.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143430c407sm9369816b3a.178.2024.08.27.16.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 16:10:21 -0700 (PDT)
Date: Tue, 27 Aug 2024 16:10:20 -0700
From: Drew Fustini <dfustini@tenstorrent.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] riscv: make ZONE_DMA32 optional
Message-ID: <Zs5c3KJR41AUVyEv@x1>
References: <20240827113611.537302-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240827113611.537302-1-vladimir.kondratiev@mobileye.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_161024_178909_AB9FA4F1 
X-CRM114-Status: GOOD (  19.79  )
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

On Tue, Aug 27, 2024 at 02:36:11PM +0300, Vladimir Kondratiev wrote:
> It is not necessary any RISCV platform has ZONE_DMA32.
> 
> Example - if platform has no DRAM in [0..4G] region,
> it will report failure like below each boot.
> 
> [    0.088709] swapper/0: page allocation failure: order:7, mode:0xcc4(GFP_KERNEL|GFP_DMA32), nodemask=(null),cpuset=/
> [    0.088832] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.0-rc5 #30
> [    0.088864] Call Trace:
> [    0.088869] [<ffffffff800059f2>] dump_backtrace+0x1c/0x24
> [    0.088910] [<ffffffff805f328c>] show_stack+0x2c/0x38
> [    0.088957] [<ffffffff805fd800>] dump_stack_lvl+0x52/0x74
> [    0.088987] [<ffffffff805fd836>] dump_stack+0x14/0x1c
> [    0.089010] [<ffffffff801a23a8>] warn_alloc+0xf4/0x176
> [    0.089041] [<ffffffff801a3052>] __alloc_pages_noprof+0xc28/0xcb4
> [    0.089067] [<ffffffff80086eda>] atomic_pool_expand+0x62/0x1f8
> [    0.089090] [<ffffffff8080d674>] __dma_atomic_pool_init+0x46/0x9e
> [    0.089115] [<ffffffff8080d762>] dma_atomic_pool_init+0x96/0x11c
> [    0.089139] [<ffffffff80002146>] do_one_initcall+0x5c/0x1b2
> [    0.089158] [<ffffffff8080127c>] kernel_init_freeable+0x214/0x274
> [    0.089190] [<ffffffff805fefd8>] kernel_init+0x1e/0x10a
> [    0.089209] [<ffffffff8060748a>] ret_from_fork+0xe/0x1c
> 
> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
> ---
>  arch/riscv/Kconfig | 2 +-
>  mm/Kconfig         | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 0f3cd7c3a436..94a573112625 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -50,6 +50,7 @@ config RISCV
>  	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>  	select ARCH_HAS_UBSAN
>  	select ARCH_HAS_VDSO_DATA
> +	select ARCH_HAS_ZONE_DMA_SET if 64BIT
>  	select ARCH_KEEP_MEMBLOCK if ACPI
>  	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if 64BIT && MMU
>  	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
> @@ -200,7 +201,6 @@ config RISCV
>  	select THREAD_INFO_IN_TASK
>  	select TRACE_IRQFLAGS_SUPPORT
>  	select UACCESS_MEMCPY if !MMU
> -	select ZONE_DMA32 if 64BIT
>  
>  config CLANG_SUPPORTS_DYNAMIC_FTRACE
>  	def_bool CC_IS_CLANG
> diff --git a/mm/Kconfig b/mm/Kconfig
> index b72e7d040f78..97c85da98e89 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -1032,7 +1032,7 @@ config ZONE_DMA
>  config ZONE_DMA32
>  	bool "Support DMA32 zone" if ARCH_HAS_ZONE_DMA_SET
>  	depends on !X86_32
> -	default y if ARM64
> +	default y if ARM64 || (RISCV && 64BIT)
>  
>  config ZONE_DEVICE
>  	bool "Device memory (pmem, HMM, etc...) hotplug support"
> -- 
> 2.37.3
> 

Reviewed-by: Drew Fustini <dfustini@tenstorrent.com>

Thanks for sending this patch as I've also encountered that annoying
error on systems with DRAM above 4GB.

I tested this patch by changing the qemu virt machine to have DRAM
starting at 2^32:

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index cef41c150aaf..3033a2560edb 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -87,7 +87,7 @@ static const MemMapEntry virt_memmap[] = {
     [VIRT_IMSIC_S] =      { 0x28000000, VIRT_IMSIC_MAX_SIZE },
     [VIRT_PCIE_ECAM] =    { 0x30000000,    0x10000000 },
     [VIRT_PCIE_MMIO] =    { 0x40000000,    0x40000000 },
-    [VIRT_DRAM] =         { 0x80000000,           0x0 },
+    [VIRT_DRAM] =        { 0x100000000,           0x0 },
 };
 
 /* PCIe high mmio is fixed for RV32 */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
