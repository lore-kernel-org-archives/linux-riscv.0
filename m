Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30EFCF649E
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 10:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=voeP03+0ozcmyL1W4agRRV+fBvHpNu/3va6W/WNkCrA=; b=wKrwBizuQhO1J9
	GTVxV2DUIfSene3HdFowTbXqLGqMK14FYZSwX+laGEk5bVipo7/dVjVbkDLJ5GOpwn+x4o1Q3uUs7
	NQkijLc44dogcYboURpeWXJfcDy0IJuhcpSNkyfNmP/pv1ulpGo7FWsqpwlunidkDdc2FsKBLejWq
	/UXrh9JEFjPDuBQ+lTKCotc6fwK5f1kBPIyOZhHgYEqNrRyXFdqNYVmIRxt3keUf1Z2ilUQvmKIgt
	52AwZf+hI+wnJ1M0B9A3xcMsypD+tgGgNAul2zNLpJOPbQfG3fYKYNzsLl5vX2jsjRVk9ACfWO7GN
	hhF/YKZjiHRZPRPfY4EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svDHS-0000000Ge0M-40am;
	Mon, 30 Sep 2024 10:05:26 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svD7t-0000000Gb2G-2bj5
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 09:55:35 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC5201BF205;
	Mon, 30 Sep 2024 09:55:28 +0000 (UTC)
Message-ID: <e8f6ed93-d47c-4c07-963c-8f16f498abed@ghiti.fr>
Date: Mon, 30 Sep 2024 11:55:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: make ZONE_DMA32 optional
Content-Language: en-US
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20240827113611.537302-1-vladimir.kondratiev@mobileye.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240827113611.537302-1-vladimir.kondratiev@mobileye.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_025533_824476_A9D478A1 
X-CRM114-Status: GOOD (  15.06  )
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

Hi Vladimir,

On 27/08/2024 13:36, Vladimir Kondratiev wrote:
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
>   arch/riscv/Kconfig | 2 +-
>   mm/Kconfig         | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 0f3cd7c3a436..94a573112625 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -50,6 +50,7 @@ config RISCV
>   	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>   	select ARCH_HAS_UBSAN
>   	select ARCH_HAS_VDSO_DATA
> +	select ARCH_HAS_ZONE_DMA_SET if 64BIT
>   	select ARCH_KEEP_MEMBLOCK if ACPI
>   	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if 64BIT && MMU
>   	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
> @@ -200,7 +201,6 @@ config RISCV
>   	select THREAD_INFO_IN_TASK
>   	select TRACE_IRQFLAGS_SUPPORT
>   	select UACCESS_MEMCPY if !MMU
> -	select ZONE_DMA32 if 64BIT
>   
>   config CLANG_SUPPORTS_DYNAMIC_FTRACE
>   	def_bool CC_IS_CLANG
> diff --git a/mm/Kconfig b/mm/Kconfig
> index b72e7d040f78..97c85da98e89 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -1032,7 +1032,7 @@ config ZONE_DMA
>   config ZONE_DMA32
>   	bool "Support DMA32 zone" if ARCH_HAS_ZONE_DMA_SET
>   	depends on !X86_32
> -	default y if ARM64
> +	default y if ARM64 || (RISCV && 64BIT)
>   
>   config ZONE_DEVICE
>   	bool "Device memory (pmem, HMM, etc...) hotplug support"


I'm wondering how distro kernels will deal with that since some 
platforms will need the ZONE_DMA32 and some others will break when 
enabled as you have shown.

Is there a way to make it optional at runtime instead?

Thanks,

Alex


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
