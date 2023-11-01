Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97870C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Nov 2023 11:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pR5wj6rfm22KG42RK9S0IKk1akvnYHQNrSgEvBvmTXs=; b=wsVGOGdg7xDTaY
	9JiYWCPawHUb4+9iYT6GVp8SJOD7jQV9eTNu73xdqIXKYxaVbrKehm0dFQjsWRJ4bW9R0HVT/dOUh
	9kroKA77Gk/FGbq860p/qwHiXrkZFfzfBWKYZIWheT5wJYrtXQemDrCPUOLqPvHvPwp8XD/Mn+EAD
	E2NI6zvZVBjG6PHJbHQYLJF87DTCC0oEmkAVlE6GoATGEwqFHan4tNeErqptqOBc7Z67OZkTW9eky
	yCFZo7QVt1W8Tp4jRnupU/c05kyIM3W/CxeFxTqVw8SkaWewL04H0npjCJ6uA+5CuaoYv+M4sVFCF
	zmMoRxdiPQVadL4Cqesw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qy9dr-007Hst-0V;
	Wed, 01 Nov 2023 11:44:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qy9do-007HrR-1I
	for linux-riscv@lists.infradead.org;
	Wed, 01 Nov 2023 11:44:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id BAE61B80B23;
	Wed,  1 Nov 2023 11:44:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70FE9C433C7;
	Wed,  1 Nov 2023 11:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698839046;
	bh=+a3hNejyp4HZMjQsHPW/cfQ7BJWexJetpS73VMdMRwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SCMyExs6Zidse0QDMfPkM31ezH/ybXj6xUXupFRwOSxRM1pZbMEyZk9Gaq1/6yXgL
	 PtwazttdLEK/aDbhVXXGmRiicusnrJxYO0+crz9Ucd9eDgvf2ckBiRnOvpQFk9gF0O
	 ckA5YCkTbwksG3WhHe61i0EsuG2+PM5QJN7v3AI+GjQEqtSN2iFz3G7QQRCab7lLke
	 mXzv7MAgP7+y7Xo6VvUW3OeO5HcDRnBBP/+l6qKozitGM1vCBzW6s2t+jXo8h+q/iw
	 SYQiB4VpFI5eiE98QqraWj12AzlAQf8rgXPAVQ3aNud6JAVlgvsYDgQskgyvr3aJNy
	 pZBxluKN7ixAg==
Date: Wed, 1 Nov 2023 19:31:48 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Evan Green <evan@rivosinc.com>
Subject: Re: [PATCH] RISC-V: Probe misaligned access speed in parallel
Message-ID: <ZUI3JKff9SgsA3Z/@xhacker>
References: <20230915184904.1976183-1-evan@rivosinc.com>
 <ZQVp1PJb+HuEdu4L@xhacker>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZQVp1PJb+HuEdu4L@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_044408_725229_A7217B46 
X-CRM114-Status: GOOD (  41.01  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Sep 16, 2023 at 04:39:54PM +0800, Jisheng Zhang wrote:
> On Fri, Sep 15, 2023 at 11:49:03AM -0700, Evan Green wrote:
> > Probing for misaligned access speed takes about 0.06 seconds. On a
> > system with 64 cores, doing this in smp_callin() means it's done
> > serially, extending boot time by 3.8 seconds. That's a lot of boot time.
> > 
> > Instead of measuring each CPU serially, let's do the measurements on
> > all CPUs in parallel. If we disable preemption on all CPUs, the
> > jiffies stop ticking, so we can do this in stages of 1) everybody
> > except core 0, then 2) core 0.
> > 
> > The measurement call in smp_callin() stays around, but is now
> > conditionalized to only run if a new CPU shows up after the round of
> > in-parallel measurements has run. The goal is to have the measurement
> > call not run during boot or suspend/resume, but only on a hotplug
> > addition.
> > 
> > Signed-off-by: Evan Green <evan@rivosinc.com>
> 
> Reported-by: Jisheng Zhang <jszhang@kernel.org>

Hi Evan, Palmer,

This patch seems missing in v6.6, I dunno what happened.

And this patch doesn't fix the boot time regression but also fix a real
bug during cpu hotplug on and off.

Here is the reproduce script:

while true
do
echo 0 > /sys/devices/system/cpu/cpu1/online
echo 1 > /sys/devices/system/cpu/cpu1/online
done


Here is the BUG log on qemu:

[   20.950753] CPU1: failed to come online
[   20.951875] ------------[ cut here ]------------
[   20.952070] kernel BUG at kernel/time/hrtimer.c:2227!
[   20.952341] Kernel BUG [#1]
[   20.952366] Modules linked in:
[   20.952515] CPU: 0 PID: 46 Comm: sh Not tainted 6.6.0 #3
[   20.952607] Hardware name: riscv-virtio,qemu (DT)
[   20.952695] epc : hrtimers_dead_cpu+0x22e/0x230
[   20.952808]  ra : cpuhp_invoke_callback+0xe4/0x54e
[   20.952844] epc : ffffffff8007d6c0 ra : ffffffff8000f904 sp : ff600000011ebb30
[   20.952863]  gp : ffffffff80d081d0 tp : ff6000000134da00 t0 : 0000000000000040
[   20.952880]  t1 : 0000000000000000 t2 : 0000000000000000 s0 : ff600000011ebbb0
[   20.952895]  s1 : 0000000000000001 a0 : 0000000000000001 a1 : 000000000000002c
[   20.952911]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : 0000000000000000
[   20.952926]  a5 : 0000000000000001 a6 : 0000000000000538 a7 : 0000000000000000
[   20.952941]  s2 : 000000000000002c s3 : 0000000000000000 s4 : ff6000003ffd4390
[   20.952957]  s5 : ffffffff80d0a1f8 s6 : 0000000000000000 s7 : ffffffff8007d492
[   20.952972]  s8 : 0000000000000001 s9 : fffffffffffffffb s10: 0000000000000000
[   20.952987]  s11: 00005555820dc708 t3 : 0000000000000002 t4 : 0000000000000402
[   20.953002]  t5 : ff600000010f0710 t6 : ff600000010f0718
[   20.953016] status: 0000000200000120 badaddr: 0000000000000000 cause: 0000000000000003
[   20.953124] [<ffffffff8007d6c0>] hrtimers_dead_cpu+0x22e/0x230
[   20.953226] [<ffffffff8000f904>] cpuhp_invoke_callback+0xe4/0x54e
[   20.953241] [<ffffffff80010fb8>] _cpu_up+0x200/0x2a2
[   20.953254] [<ffffffff800110ac>] cpu_up+0x52/0x8a
[   20.953266] [<ffffffff80011654>] cpu_device_up+0x14/0x1c
[   20.953279] [<ffffffff8029abb6>] cpu_subsys_online+0x1e/0x68
[   20.953296] [<ffffffff802957de>] device_online+0x3c/0x70
[   20.953306] [<ffffffff8029587a>] online_store+0x68/0x8c
[   20.953317] [<ffffffff802909ba>] dev_attr_store+0xe/0x1a
[   20.953330] [<ffffffff801df8aa>] sysfs_kf_write+0x2a/0x34
[   20.953346] [<ffffffff801def06>] kernfs_fop_write_iter+0xde/0x162
[   20.953360] [<ffffffff8018154a>] vfs_write+0x136/0x320
[   20.953372] [<ffffffff801818e4>] ksys_write+0x4a/0xb4
[   20.953383] [<ffffffff80181962>] __riscv_sys_write+0x14/0x1c
[   20.953394] [<ffffffff803dec7e>] do_trap_ecall_u+0x4a/0x110
[   20.953420] [<ffffffff80003666>] ret_from_exception+0x0/0x66
[   20.953648] Code: 7c42 7ca2 7d02 6de2 4501 6109 8082 c0ef 7463 bd1d (9002) 1141
[   20.953897] ---[ end trace 0000000000000000 ]---
[   20.954068] Kernel panic - not syncing: Fatal exception in interrupt
[   20.954128] SMP: stopping secondary CPUs
[   22.749953] SMP: failed to stop secondary CPUs 0-1
[   22.803768] ---[ end Kernel panic - not syncing: Fatal exception in interrupt ]---


> > 
> > ---
> > 
> > Jisheng, I didn't add your Tested-by tag since the patch evolved from
> > the one you tested. Hopefully this one brings you the same result.
> > 
> > ---
> >  arch/riscv/include/asm/cpufeature.h |  3 ++-
> >  arch/riscv/kernel/cpufeature.c      | 28 +++++++++++++++++++++++-----
> >  arch/riscv/kernel/smpboot.c         | 11 ++++++++++-
> >  3 files changed, 35 insertions(+), 7 deletions(-)
> > 
> > diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> > index d0345bd659c9..19e7817eba10 100644
> > --- a/arch/riscv/include/asm/cpufeature.h
> > +++ b/arch/riscv/include/asm/cpufeature.h
> > @@ -30,6 +30,7 @@ DECLARE_PER_CPU(long, misaligned_access_speed);
> >  /* Per-cpu ISA extensions. */
> >  extern struct riscv_isainfo hart_isa[NR_CPUS];
> >  
> > -void check_unaligned_access(int cpu);
> > +extern bool misaligned_speed_measured;
> > +int check_unaligned_access(void *unused);
> >  
> >  #endif
> > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > index 1cfbba65d11a..8eb36e1dfb95 100644
> > --- a/arch/riscv/kernel/cpufeature.c
> > +++ b/arch/riscv/kernel/cpufeature.c
> > @@ -42,6 +42,9 @@ struct riscv_isainfo hart_isa[NR_CPUS];
> >  /* Performance information */
> >  DEFINE_PER_CPU(long, misaligned_access_speed);
> >  
> > +/* Boot-time in-parallel unaligned access measurement has occurred. */
> > +bool misaligned_speed_measured;
> 
> This var can be avoided, see below.
> 
> > +
> >  /**
> >   * riscv_isa_extension_base() - Get base extension word
> >   *
> > @@ -556,8 +559,9 @@ unsigned long riscv_get_elf_hwcap(void)
> >  	return hwcap;
> >  }
> >  
> > -void check_unaligned_access(int cpu)
> > +int check_unaligned_access(void *unused)
> >  {
> > +	int cpu = smp_processor_id();
> >  	u64 start_cycles, end_cycles;
> >  	u64 word_cycles;
> >  	u64 byte_cycles;
> > @@ -571,7 +575,7 @@ void check_unaligned_access(int cpu)
> >  	page = alloc_pages(GFP_NOWAIT, get_order(MISALIGNED_BUFFER_SIZE));
> >  	if (!page) {
> >  		pr_warn("Can't alloc pages to measure memcpy performance");
> > -		return;
> > +		return 0;
> >  	}
> >  
> >  	/* Make an unaligned destination buffer. */
> > @@ -643,15 +647,29 @@ void check_unaligned_access(int cpu)
> >  
> >  out:
> >  	__free_pages(page, get_order(MISALIGNED_BUFFER_SIZE));
> > +	return 0;
> > +}
> > +
> > +static void check_unaligned_access_nonboot_cpu(void *param)
> > +{
> > +	if (smp_processor_id() != 0)
> > +		check_unaligned_access(param);
> >  }
> >  
> > -static int check_unaligned_access_boot_cpu(void)
> > +static int check_unaligned_access_all_cpus(void)
> >  {
> > -	check_unaligned_access(0);
> > +	/* Check everybody except 0, who stays behind to tend jiffies. */
> > +	on_each_cpu(check_unaligned_access_nonboot_cpu, NULL, 1);
> > +
> > +	/* Check core 0. */
> > +	smp_call_on_cpu(0, check_unaligned_access, NULL, true);
> > +
> > +	/* Boot-time measurements are complete. */
> > +	misaligned_speed_measured = true;
> >  	return 0;
> >  }
> >  
> > -arch_initcall(check_unaligned_access_boot_cpu);
> > +arch_initcall(check_unaligned_access_all_cpus);
> >  
> >  #ifdef CONFIG_RISCV_ALTERNATIVE
> >  /*
> > diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
> > index 1b8da4e40a4d..39322ae20a75 100644
> > --- a/arch/riscv/kernel/smpboot.c
> > +++ b/arch/riscv/kernel/smpboot.c
> > @@ -27,6 +27,7 @@
> >  #include <linux/sched/mm.h>
> >  #include <asm/cpu_ops.h>
> >  #include <asm/cpufeature.h>
> > +#include <asm/hwprobe.h>
> >  #include <asm/irq.h>
> >  #include <asm/mmu_context.h>
> >  #include <asm/numa.h>
> > @@ -246,7 +247,15 @@ asmlinkage __visible void smp_callin(void)
> >  
> >  	numa_add_cpu(curr_cpuid);
> >  	set_cpu_online(curr_cpuid, 1);
> > -	check_unaligned_access(curr_cpuid);
> > +
> > +	/*
> > +	 * Boot-time misaligned access speed measurements are done in parallel
> > +	 * in an initcall. Only measure here for hotplug.
> > +	 */
> > +	if (misaligned_speed_measured &&
> > +	    (per_cpu(misaligned_access_speed, curr_cpuid) == RISCV_HWPROBE_MISALIGNED_UNKNOWN)) {
> 
> I believe this check is for cpu not-booted during boot time but hotplug in
> after that, if so I'm not sure whether
> misaligned_speed_measured can be replaced with
> (system_state == SYSTEM_RUNNING)
> then we don't need misaligned_speed_measured at all.
> 
> > +		check_unaligned_access(NULL);
> > +	}
> >  
> >  	if (has_vector()) {
> >  		if (riscv_v_setup_vsize())
> > -- 
> > 2.34.1
> > 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
