Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7080C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 19:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+wff0rs6vHYnkOUkq6ddcp5LUQMRk8/H0rjpAzfZ+LA=; b=DBUT+JZPdxkmdw
	oAgKPjH6cGarUIpaU9ZsQht312blaYoNhiUNnUl5A1ag+trxkdRWPb25/KDPJ9Wu/SxBr2ztX4701
	JzkdD0vqgBPUgZ8freLdIsyrGfcpzWsBXO3OaN1VDLKy14l8jJa8StYl/07Vhy0m3FnX4ys+zs95/
	hnCyX1zAHDrb9DK7gq87qUN+pjZoGyIuyuZoctiiqQ9knGIe6vy0IKx/GlZyNt3pB5Ic+SfVCVFXt
	/18r3dXSwBS2LdQz1l34GhAeTdztGRpLE8JdvYigBK0UR9QnZb3SJAC1wYh7XIYEdEjkK8aOMPMgu
	LYopGOvZmsuak45Wo35A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpC5E-000000063bt-3kSe;
	Tue, 26 Mar 2024 19:03:40 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpC5A-000000063Zu-1v5F
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 19:03:38 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9277320002;
	Tue, 26 Mar 2024 19:03:25 +0000 (UTC)
Message-ID: <9f9eea13-f36b-4aa7-bcb4-d2759826305e@ghiti.fr>
Date: Tue, 26 Mar 2024 20:03:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arch/riscv: Enable kprobes when CONFIG_MODULES=n
Content-Language: en-US
To: Jarkko Sakkinen <jarkko@kernel.org>, linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 linux-modules@vger.kernel.org, "Naveen N . Rao"
 <naveen.n.rao@linux.ibm.com>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 "David S . Miller" <davem@davemloft.net>,
 Masami Hiramatsu <mhiramat@kernel.org>
References: <20240325215502.660-1-jarkko@kernel.org>
 <20240325215502.660-2-jarkko@kernel.org>
 <474ed846-672a-4ff0-9d53-cbf8192fee5f@ghiti.fr>
 <D03U3UZ4XBOW.66TLKVR1PKPH@kernel.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <D03U3UZ4XBOW.66TLKVR1PKPH@kernel.org>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_120336_834362_8D2F1980 
X-CRM114-Status: GOOD (  37.23  )
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

On 26/03/2024 17:49, Jarkko Sakkinen wrote:
> On Tue Mar 26, 2024 at 3:57 PM EET, Alexandre Ghiti wrote:
>> Hi Jarkko,
>>
>> On 25/03/2024 22:55, Jarkko Sakkinen wrote:
>>> Tacing with kprobes while running a monolithic kernel is currently
>>> impossible due the kernel module allocator dependency.
>>>
>>> Address the issue by implementing textmem API for RISC-V.
>>>
>>> Link: https://www.sochub.fi # for power on testing new SoC's with a minimal stack
>>> Link: https://lore.kernel.org/all/20220608000014.3054333-1-jarkko@profian.com/ # continuation
>>> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
>>> ---
>>> v5:
>>> - No changes, expect removing alloc_execmem() call which should have
>>>     been part of the previous patch.
>>> v4:
>>> - Include linux/execmem.h.
>>> v3:
>>> - Architecture independent parts have been split to separate patches.
>>> - Do not change arch/riscv/kernel/module.c as it is out of scope for
>>>     this patch set now.
>>> v2:
>>> - Better late than never right? :-)
>>> - Focus only to RISC-V for now to make the patch more digestable. This
>>>     is the arch where I use the patch on a daily basis to help with QA.
>>> - Introduce HAVE_KPROBES_ALLOC flag to help with more gradual migration.
>>> ---
>>>    arch/riscv/Kconfig          |  1 +
>>>    arch/riscv/kernel/Makefile  |  3 +++
>>>    arch/riscv/kernel/execmem.c | 22 ++++++++++++++++++++++
>>>    3 files changed, 26 insertions(+)
>>>    create mode 100644 arch/riscv/kernel/execmem.c
>>>
>>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>>> index e3142ce531a0..499512fb17ff 100644
>>> --- a/arch/riscv/Kconfig
>>> +++ b/arch/riscv/Kconfig
>>> @@ -132,6 +132,7 @@ config RISCV
>>>    	select HAVE_KPROBES if !XIP_KERNEL
>>>    	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
>>>    	select HAVE_KRETPROBES if !XIP_KERNEL
>>> +	select HAVE_ALLOC_EXECMEM if !XIP_KERNEL
>>>    	# https://github.com/ClangBuiltLinux/linux/issues/1881
>>>    	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !LD_IS_LLD
>>>    	select HAVE_MOVE_PMD
>>> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
>>> index 604d6bf7e476..337797f10d3e 100644
>>> --- a/arch/riscv/kernel/Makefile
>>> +++ b/arch/riscv/kernel/Makefile
>>> @@ -73,6 +73,9 @@ obj-$(CONFIG_SMP)		+= cpu_ops.o
>>>    
>>>    obj-$(CONFIG_RISCV_BOOT_SPINWAIT) += cpu_ops_spinwait.o
>>>    obj-$(CONFIG_MODULES)		+= module.o
>>> +ifeq ($(CONFIG_ALLOC_EXECMEM),y)
>>> +obj-y				+= execmem.o
>>> +endif
>>>    obj-$(CONFIG_MODULE_SECTIONS)	+= module-sections.o
>>>    
>>>    obj-$(CONFIG_CPU_PM)		+= suspend_entry.o suspend.o
>>> diff --git a/arch/riscv/kernel/execmem.c b/arch/riscv/kernel/execmem.c
>>> new file mode 100644
>>> index 000000000000..3e52522ead32
>>> --- /dev/null
>>> +++ b/arch/riscv/kernel/execmem.c
>>> @@ -0,0 +1,22 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +
>>> +#include <linux/mm.h>
>>> +#include <linux/execmem.h>
>>> +#include <linux/vmalloc.h>
>>> +#include <asm/sections.h>
>>> +
>>> +void *alloc_execmem(unsigned long size, gfp_t /* gfp */)
> Need to have the parameter name here. I guess this could just as well
> pass through gfp to vmalloc from the caller as kprobes does call
> module_alloc() with GFP_KERNEL set in RISC-V.
>
>>> +{
>>> +	return __vmalloc_node_range(size, 1, MODULES_VADDR,
>>> +				    MODULES_END, GFP_KERNEL,
>>> +				    PAGE_KERNEL, 0, NUMA_NO_NODE,
>>> +				    __builtin_return_address(0));
>>> +}
>>
>> The __vmalloc_node_range() line ^^ must be from an old kernel since we
>> added VM_FLUSH_RESET_PERMS in 6.8, see 749b94b08005 ("riscv: Fix
>> module_alloc() that did not reset the linear mapping permissions").
>>
>> In addition, I guess module_alloc() should now use alloc_execmem() right?
> Ack for the first comment. For the 2nd it is up to arch/<arch> to choose
> whether to have shared or separate allocators.
>
> So if you want I can change it that way but did not want to make the
> call myself.


I'd say module_alloc() should use alloc_execmem() then since there are 
no differences for now.


>>
>>> +
>>> +void free_execmem(void *region)
>>> +{
>>> +	if (in_interrupt())
>>> +		pr_warn("In interrupt context: vmalloc may not work.\n");
>>> +
>>> +	vfree(region);
>>> +}
>>
>> I remember Mike Rapoport sent a patchset to introduce an API for
>> executable memory allocation
>> (https://lore.kernel.org/linux-mm/20230918072955.2507221-1-rppt@kernel.org/),
>> how does this intersect with your work? I don't know the status of his
>> patchset though.
>>
>> Thanks,
>>
>> Alex
> I have also made a patch set for kprobes in the 2022:
>
> https://lore.kernel.org/all/20220608000014.3054333-1-jarkko@profian.com/
>
> I think this Calvin's, Mike's and my early patch set have the same
> problem: they try to choke all architectures at once. And further,
> Calvin's and Mike's work also try to cover also tracing subsystems
> at once.
>
> I feel that my relatively small patch set which deals only with
> trivial kprobe (which is more in the leaf than e.g. bpf which
> is more like orchestrator tool) and implements one arch of which
> dog food I actually eat is a better starting point.
>
> Arch code is always something where you need to have genuine
> understanding so full architecture coverage from day one is
> just too risky for stability. Linux is better off if people who
> work on a  specific arch proactively will "fill the holes".
>
> So the way I see my patch set is "lowest common denominator"
> in both architecture axis and tracing subsystem axist. It should
> not interfere that much with the other work (like bpf).


I understand your point. But is there any consensus among you on how to 
deal with this issue? I'm not opposed at all to your patch, and it's 
small enough that we can revert it later on if that's not the right 
solution anyway.


>
> BR, Jarkko
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
