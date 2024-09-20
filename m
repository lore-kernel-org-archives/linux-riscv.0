Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D47E6CF58F4
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Sep 2024 09:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=xa08PDLJXupTiq3HIZT+AhM0suVmAG6sL5dsqE0DMUU=; b=GmWK+GlwPg3Kb5uo9EJEbXIxQW
	128x86VfTNHJCW3cm7sY9JQnosIwE6E8/pAI3oS84lwUfK+/vjbrz8S986lZ/YXurmmiGaHvUv2go
	AIxqTCVUF7DNF32Xj5VznKhOBPwinC/Zu09kcT/8WQqAfr2TCZ+X6G5cICwUEHLe8DXeihz/vAHic
	JpUEpCir+oQxWwE4ADBl7w9MzjXmEdknRVR/MTkZtzfiZs4Tzc62yU3YRYFte7InRpnZWWYqdmzJa
	scIM6fccLDNJUxTJiErCzxzKnVuXggIt3XVmtLPywu6nQM6fbKS7zXI1kT14ySxPmZwtttxFcShx6
	O5BOn5Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srZVN-0000000Bs1q-1miH;
	Fri, 20 Sep 2024 09:00:45 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srZT6-0000000BrRi-2t6V
	for linux-riscv@lists.infradead.org;
	Fri, 20 Sep 2024 08:58:26 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2d8818337a5so2152446a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 20 Sep 2024 01:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1726822704; x=1727427504; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1/PwlrtjlNSmeYLWhd72xmzvu8WtL1wEwRjHNhxr9dA=;
        b=Pc76TptohLvMENXY6gsMVTo/M/UkEaEtAlMkBQ6FSGkR3eZKmZlPZuED7E1Yfg6sHw
         Mb1bOvO+P7HXmdn0ND5JunmK+TuuTmC8djvOlzub7zLWMcEO0FxLvUkckmD5GZhji0Rq
         SD3JKi0JKrWLLj+m/qgB0ykXot5CnByKOKy+g/5WLWlPYgIghrh3u/g11EDdb7VLXMNW
         NcsbNXZNUJBNFmgCZb6x70DFVml9ERbz22WXhFSJ/KxZ11Ywyo8tgC4ixEqoqlmy5e5U
         hXeZgMw8XpomnJScWfIEU0atNZrCMEolrKNFsT/onNmtnDoloPUCp00ZMUyTWj/AVlXr
         6ayA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726822704; x=1727427504;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1/PwlrtjlNSmeYLWhd72xmzvu8WtL1wEwRjHNhxr9dA=;
        b=HlDCCNGXDaQHHRJWnG5tlS/Vk9At/CixOMz/nrlF3dCYH39nG7iAVAOBmQ950HpWJB
         20y/G/gGyDb/NzvWPgE+RRe6sdYNkW0RsBQ5mGuwRMCT/QSPWDrIoNV4wdpKfa/XlF6n
         u03twgxSt1dWuyWIOTPs7hhGprpDRIZ0Sqy4YSMlciNMQeLjUpDRbo2yssLcYfrBRvNk
         pmwaTHAF/GyIUtA7yE7xKfMCyhxJLgL4FAKk638HcV7FvUQEjTd71awm8svaBkaOM/2p
         /o/BXTKwhY4z9iEx74OTy1Eki7oGafjKN4+00Y3yBTIZUb9ukzGuvM94rhBl4PSlIZR/
         3bvg==
X-Forwarded-Encrypted: i=1; AJvYcCVYLpiKCJ1goFd7zzyM6WRHZqdkoNhcWMRLu38AUHnNtLrY6O+5Ehl0JQNcMBASxJDajlvwVOolY58OvA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1051vP1rTILWHFKj7pOSLhSOhrL8Wm1c0wgcXf6ulD/NH3VNJ
	KqhBmSLG3tUM3cD11LJ4/P8jqSu8uqSr+k6aCFI3eCVIFE59cVX1T98jm6gpgc8=
X-Google-Smtp-Source: AGHT+IGY4mUINDatBTGE4l8Jfn0u9GfoIA4KWyA7TWO6T/LKxZHGtq1vizvHcmT/bPLPkL6rcUs0bQ==
X-Received: by 2002:a17:90a:7345:b0:2d8:8a3a:7b88 with SMTP id 98e67ed59e1d1-2dd6cdfaefcmr9547372a91.6.1726822703616;
        Fri, 20 Sep 2024 01:58:23 -0700 (PDT)
Received: from localhost ([83.68.141.146])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2dd50c054d8sm4250330a91.0.2024.09.20.01.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Sep 2024 01:58:23 -0700 (PDT)
Date: Fri, 20 Sep 2024 01:58:23 -0700 (PDT)
X-Google-Original-Date: Fri, 20 Sep 2024 01:58:17 PDT (-0700)
Subject: Re: [PATCH] riscv: make ZONE_DMA32 optional
In-Reply-To: <Zs5c3KJR41AUVyEv@x1>
CC: vladimir.kondratiev@mobileye.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, akpm@linux-foundation.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, linux-mm@kvack.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: dfustini@tenstorrent.com, Conor Dooley <conor@kernel.org>
Message-ID: <mhng-ff7311d0-a1e2-4487-af68-130a7efb6040@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_015824_839914_81352F1E 
X-CRM114-Status: GOOD (  23.34  )
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

On Tue, 27 Aug 2024 16:10:20 PDT (-0700), dfustini@tenstorrent.com wrote:
> On Tue, Aug 27, 2024 at 02:36:11PM +0300, Vladimir Kondratiev wrote:
>> It is not necessary any RISCV platform has ZONE_DMA32.
>>
>> Example - if platform has no DRAM in [0..4G] region,
>> it will report failure like below each boot.
>>
>> [    0.088709] swapper/0: page allocation failure: order:7, mode:0xcc4(GFP_KERNEL|GFP_DMA32), nodemask=(null),cpuset=/
>> [    0.088832] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.0-rc5 #30
>> [    0.088864] Call Trace:
>> [    0.088869] [<ffffffff800059f2>] dump_backtrace+0x1c/0x24
>> [    0.088910] [<ffffffff805f328c>] show_stack+0x2c/0x38
>> [    0.088957] [<ffffffff805fd800>] dump_stack_lvl+0x52/0x74
>> [    0.088987] [<ffffffff805fd836>] dump_stack+0x14/0x1c
>> [    0.089010] [<ffffffff801a23a8>] warn_alloc+0xf4/0x176
>> [    0.089041] [<ffffffff801a3052>] __alloc_pages_noprof+0xc28/0xcb4
>> [    0.089067] [<ffffffff80086eda>] atomic_pool_expand+0x62/0x1f8
>> [    0.089090] [<ffffffff8080d674>] __dma_atomic_pool_init+0x46/0x9e
>> [    0.089115] [<ffffffff8080d762>] dma_atomic_pool_init+0x96/0x11c
>> [    0.089139] [<ffffffff80002146>] do_one_initcall+0x5c/0x1b2
>> [    0.089158] [<ffffffff8080127c>] kernel_init_freeable+0x214/0x274
>> [    0.089190] [<ffffffff805fefd8>] kernel_init+0x1e/0x10a
>> [    0.089209] [<ffffffff8060748a>] ret_from_fork+0xe/0x1c
>>
>> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
>> ---
>>  arch/riscv/Kconfig | 2 +-
>>  mm/Kconfig         | 2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 0f3cd7c3a436..94a573112625 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -50,6 +50,7 @@ config RISCV
>>  	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>>  	select ARCH_HAS_UBSAN
>>  	select ARCH_HAS_VDSO_DATA
>> +	select ARCH_HAS_ZONE_DMA_SET if 64BIT
>>  	select ARCH_KEEP_MEMBLOCK if ACPI
>>  	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if 64BIT && MMU
>>  	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
>> @@ -200,7 +201,6 @@ config RISCV
>>  	select THREAD_INFO_IN_TASK
>>  	select TRACE_IRQFLAGS_SUPPORT
>>  	select UACCESS_MEMCPY if !MMU
>> -	select ZONE_DMA32 if 64BIT
>>
>>  config CLANG_SUPPORTS_DYNAMIC_FTRACE
>>  	def_bool CC_IS_CLANG
>> diff --git a/mm/Kconfig b/mm/Kconfig
>> index b72e7d040f78..97c85da98e89 100644
>> --- a/mm/Kconfig
>> +++ b/mm/Kconfig
>> @@ -1032,7 +1032,7 @@ config ZONE_DMA
>>  config ZONE_DMA32
>>  	bool "Support DMA32 zone" if ARCH_HAS_ZONE_DMA_SET
>>  	depends on !X86_32
>> -	default y if ARM64
>> +	default y if ARM64 || (RISCV && 64BIT)
>>
>>  config ZONE_DEVICE
>>  	bool "Device memory (pmem, HMM, etc...) hotplug support"
>> --
>> 2.37.3
>>
>
> Reviewed-by: Drew Fustini <dfustini@tenstorrent.com>
>
> Thanks for sending this patch as I've also encountered that annoying
> error on systems with DRAM above 4GB.
>
> I tested this patch by changing the qemu virt machine to have DRAM
> starting at 2^32:
>
> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
> index cef41c150aaf..3033a2560edb 100644
> --- a/hw/riscv/virt.c
> +++ b/hw/riscv/virt.c
> @@ -87,7 +87,7 @@ static const MemMapEntry virt_memmap[] = {
>      [VIRT_IMSIC_S] =      { 0x28000000, VIRT_IMSIC_MAX_SIZE },
>      [VIRT_PCIE_ECAM] =    { 0x30000000,    0x10000000 },
>      [VIRT_PCIE_MMIO] =    { 0x40000000,    0x40000000 },
> -    [VIRT_DRAM] =         { 0x80000000,           0x0 },
> +    [VIRT_DRAM] =        { 0x100000000,           0x0 },
>  };
>
>  /* PCIe high mmio is fixed for RV32 */

IIRC the ZONE_DMA32 stuff existed for some of the early SiFive systems, 
where the expansion daughterboard's PCIe controller (via a Xilinx FPGA) 
could only handle 32-bit DMA addreses.  I think there's a similar quirk 
in the Microsemi PCIe controller on the PolarFire boards, but Conor 
would know for sure.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
