Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F30E3CF9C6F
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Sep 2024 09:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LbjOaUSwW3FMYYWmnr5pTW/MOVp0BlG+ovy9gexWp/Q=; b=zCFu7tTmW9IM0z
	2wZYc4RiD3JAJwUgCHhojwmgKgtI/NIjSYRYCo91GJIask9lakqSbGQqjuAil4isG5iT1JyMOaDBG
	Cdd4ce1XsIEksBl0dEx1Ae01TnlZNREhcFh32tSMHRpkRJLgG8MEAujttHANTrj5OwnHyRr5OAw0O
	W1v5Yik2FWuqSg+A9VUSl9UlIMZMmqnuL78hx0GDlOYf33wSLBxJ22z4qIY9EuUqo3VmQ7/9U4GzP
	ySgnAMAIP0FR9upqdtUc96wuxF2/fjlbzJJG5Kiw2A/qnpq4yvdaIthXqEEY46v6pyOBJQFtJO+zM
	+/k0O8k3sm54sU3mBi6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfeI-0000000Gs2L-2Tis;
	Mon, 23 Sep 2024 09:46:30 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfeF-0000000Gs1k-2TVG
	for linux-riscv@lists.infradead.org;
	Mon, 23 Sep 2024 09:46:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=M4vBfdM0E+Q1Eqn0D2bifpyInvcBhY39m5Q1LBNvNiI=; b=ZRWpPwx15apUUlQepYIIJSHtdD
	X8nDeTPMqwoXUHxEIjHY1E908ND0DWfxNjbqmTRVb0rN4Z80y5jqu/WCZy1oN+2mRd7G42FxGqH4B
	bcONh82F6NIXyqTw2dD9yYM4hFV+pDMd6SpEGXg2xa7cb7N1267m9/nVtf+YaF1s7x0eXDhwYBcAa
	HnD9xHHg6rtecBYrpksR4mb2huHwju+FeTaZUykTLldykV/O6AH2yWJORlnFGfyLue7QL/oV1mGi3
	lQ8n2UGWzAPF8xz+PptuCI4CjjjW6GC3BvgP+OETSEBERI+OknKictpggopydZw5NuTjdx1ywH0PV
	YrYsdaYQ==;
Received: from [167.98.27.226] (helo=[10.35.6.157])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1ssfe0-002GGl-P0; Mon, 23 Sep 2024 10:46:13 +0100
Message-ID: <575583c5-5a52-461b-944a-5e32bd4b627b@codethink.co.uk>
Date: Mon, 23 Sep 2024 10:46:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: make ZONE_DMA32 optional
To: Drew Fustini <drew@pdp7.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: dfustini@tenstorrent.com, Conor Dooley <conor@kernel.org>,
 vladimir.kondratiev@mobileye.com, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, akpm@linux-foundation.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <Zs5c3KJR41AUVyEv@x1>
 <mhng-ff7311d0-a1e2-4487-af68-130a7efb6040@palmer-ri-x1c9>
 <Zu12G+Px2E+d26aD@x1>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <Zu12G+Px2E+d26aD@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_024627_757770_F499CBD5 
X-CRM114-Status: GOOD (  24.84  )
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

On 20/09/2024 14:18, Drew Fustini wrote:
> On Fri, Sep 20, 2024 at 01:58:23AM -0700, Palmer Dabbelt wrote:
>> On Tue, 27 Aug 2024 16:10:20 PDT (-0700), dfustini@tenstorrent.com wrote:
>>> On Tue, Aug 27, 2024 at 02:36:11PM +0300, Vladimir Kondratiev wrote:
>>>> It is not necessary any RISCV platform has ZONE_DMA32.
>>>>
>>>> Example - if platform has no DRAM in [0..4G] region,
>>>> it will report failure like below each boot.
>>>>
>>>> [    0.088709] swapper/0: page allocation failure: order:7, mode:0xcc4(GFP_KERNEL|GFP_DMA32), nodemask=(null),cpuset=/
>>>> [    0.088832] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.0-rc5 #30
>>>> [    0.088864] Call Trace:
>>>> [    0.088869] [<ffffffff800059f2>] dump_backtrace+0x1c/0x24
>>>> [    0.088910] [<ffffffff805f328c>] show_stack+0x2c/0x38
>>>> [    0.088957] [<ffffffff805fd800>] dump_stack_lvl+0x52/0x74
>>>> [    0.088987] [<ffffffff805fd836>] dump_stack+0x14/0x1c
>>>> [    0.089010] [<ffffffff801a23a8>] warn_alloc+0xf4/0x176
>>>> [    0.089041] [<ffffffff801a3052>] __alloc_pages_noprof+0xc28/0xcb4
>>>> [    0.089067] [<ffffffff80086eda>] atomic_pool_expand+0x62/0x1f8
>>>> [    0.089090] [<ffffffff8080d674>] __dma_atomic_pool_init+0x46/0x9e
>>>> [    0.089115] [<ffffffff8080d762>] dma_atomic_pool_init+0x96/0x11c
>>>> [    0.089139] [<ffffffff80002146>] do_one_initcall+0x5c/0x1b2
>>>> [    0.089158] [<ffffffff8080127c>] kernel_init_freeable+0x214/0x274
>>>> [    0.089190] [<ffffffff805fefd8>] kernel_init+0x1e/0x10a
>>>> [    0.089209] [<ffffffff8060748a>] ret_from_fork+0xe/0x1c
>>>>
>>>> Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
>>>> ---
>>>>   arch/riscv/Kconfig | 2 +-
>>>>   mm/Kconfig         | 2 +-
>>>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>>>> index 0f3cd7c3a436..94a573112625 100644
>>>> --- a/arch/riscv/Kconfig
>>>> +++ b/arch/riscv/Kconfig
>>>> @@ -50,6 +50,7 @@ config RISCV
>>>>   	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
>>>>   	select ARCH_HAS_UBSAN
>>>>   	select ARCH_HAS_VDSO_DATA
>>>> +	select ARCH_HAS_ZONE_DMA_SET if 64BIT
>>>>   	select ARCH_KEEP_MEMBLOCK if ACPI
>>>>   	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if 64BIT && MMU
>>>>   	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
>>>> @@ -200,7 +201,6 @@ config RISCV
>>>>   	select THREAD_INFO_IN_TASK
>>>>   	select TRACE_IRQFLAGS_SUPPORT
>>>>   	select UACCESS_MEMCPY if !MMU
>>>> -	select ZONE_DMA32 if 64BIT
>>>>
>>>>   config CLANG_SUPPORTS_DYNAMIC_FTRACE
>>>>   	def_bool CC_IS_CLANG
>>>> diff --git a/mm/Kconfig b/mm/Kconfig
>>>> index b72e7d040f78..97c85da98e89 100644
>>>> --- a/mm/Kconfig
>>>> +++ b/mm/Kconfig
>>>> @@ -1032,7 +1032,7 @@ config ZONE_DMA
>>>>   config ZONE_DMA32
>>>>   	bool "Support DMA32 zone" if ARCH_HAS_ZONE_DMA_SET
>>>>   	depends on !X86_32
>>>> -	default y if ARM64
>>>> +	default y if ARM64 || (RISCV && 64BIT)
>>>>
>>>>   config ZONE_DEVICE
>>>>   	bool "Device memory (pmem, HMM, etc...) hotplug support"
>>>> --
>>>> 2.37.3
>>>>
>>>
>>> Reviewed-by: Drew Fustini <dfustini@tenstorrent.com>
>>>
>>> Thanks for sending this patch as I've also encountered that annoying
>>> error on systems with DRAM above 4GB.
>>>
>>> I tested this patch by changing the qemu virt machine to have DRAM
>>> starting at 2^32:
>>>
>>> diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
>>> index cef41c150aaf..3033a2560edb 100644
>>> --- a/hw/riscv/virt.c
>>> +++ b/hw/riscv/virt.c
>>> @@ -87,7 +87,7 @@ static const MemMapEntry virt_memmap[] = {
>>>       [VIRT_IMSIC_S] =      { 0x28000000, VIRT_IMSIC_MAX_SIZE },
>>>       [VIRT_PCIE_ECAM] =    { 0x30000000,    0x10000000 },
>>>       [VIRT_PCIE_MMIO] =    { 0x40000000,    0x40000000 },
>>> -    [VIRT_DRAM] =         { 0x80000000,           0x0 },
>>> +    [VIRT_DRAM] =        { 0x100000000,           0x0 },
>>>   };
>>>
>>>   /* PCIe high mmio is fixed for RV32 */
>>
>> IIRC the ZONE_DMA32 stuff existed for some of the early SiFive systems,
>> where the expansion daughterboard's PCIe controller (via a Xilinx FPGA)
>> could only handle 32-bit DMA addreses.  I think there's a similar quirk in
>> the Microsemi PCIe controller on the PolarFire boards, but Conor would know
>> for sure.

The Fu740 SoC has a mirror of part of DRAM in 32bit space specifically
I think for PCIe where something may be attached via a PCIe-PCI bridge.

> I don't think this patch would affect those systems that need ZONE_DMA2.
> I believe it just makes it possible to disable it in the kernel config.
> The platform I'm working on has no memory below 4GB and all the PCIe
> devices that I care about are not 32-bit constrained. Therefore I just
> want to be able to turn it off in my .config.
> 
> Thanks,
> Drew

I tried this a while ago and IIRC you run into issues with DMA
allocations from certain drivers that expect this to exist.

With new platforms that don't have any memory in DMA32 space
this may become more common. I've already had to deal with this
for an internal dev project, and it ended up having a couple of
hacks into the allocation code to silence warnings/errors.

This of course may have been fixed, given this was last year.

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
