Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43833C77B7A
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 15:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PeHpwx9Qat/uZTOqag/Yjio/v1OmN9HBlAZGjZANHtU=; b=tZdVEbGcMKwA6+
	37L27fvhTmRSKMazucdbA0rdvYF9N8y0qRgaLlVbRDjuES2UKE7z5wLa54Wf6Mz+GmRnox0Tyisc+
	c6x8+2FMsnN00KQo/uNZ6AwTTLFUk5MlLN8ecg9QqnCnDC6nE/tstKh07SpTlhFXTY1jMczlrb6Bh
	2wkkQomMoEg/dCkuoeaxlVO63DHZdlP/JHqEZS6UQ2IrjDbZU3T272Jei/inwlXhJF9LYVTS3Ia6U
	Ndki+DOxgVLYDr9kudhGFFYu4I1EX19XxJtY8Z6k42dwNr9aCnfYTlY+l46l9gCYTTHQwjPMluv6d
	i8WQr40omXmoBVJHTOKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poR8G-00GxE1-2y;
	Mon, 17 Apr 2023 15:51:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poR8C-00GxCM-0L;
	Mon, 17 Apr 2023 15:51:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 748271691;
	Mon, 17 Apr 2023 08:51:45 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.19.253])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99D093F5A1;
	Mon, 17 Apr 2023 08:50:56 -0700 (PDT)
Date: Mon, 17 Apr 2023 16:50:53 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
	David Woodhouse <dwmw@infradead.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Brian Gerst <brgerst@gmail.com>,
	Arjan van de Veen <arjan@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul McKenney <paulmck@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Sean Christopherson <seanjc@google.com>,
	Oleksandr Natalenko <oleksandr@natalenko.name>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Piotr Gorski <lucjan.lucjanov@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	David Woodhouse <dwmw@amazon.co.uk>,
	Usama Arif <usama.arif@bytedance.com>,
	Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	xen-devel@lists.xenproject.org,
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Sabin Rapan <sabrapan@amazon.com>
Subject: Re: [patch 22/37] arm64: smp: Switch to hotplug core state
 synchronization
Message-ID: <ZD1q3TF2ixVD1f2M@FVFF77S0Q05N>
References: <20230414225551.858160935@linutronix.de>
 <20230414232310.569498144@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230414232310.569498144@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_085104_240693_12AF5A77 
X-CRM114-Status: GOOD (  23.79  )
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

On Sat, Apr 15, 2023 at 01:44:49AM +0200, Thomas Gleixner wrote:
> Switch to the CPU hotplug core state tracking and synchronization
> mechanim. No functional change intended.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org

I gave this a spin on arm64 (in a 64-vCPU VM on an M1 host), and it seems to
work fine with a bunch of vCPUs being hotplugged off and on again randomly.

FWIW:

Tested-by: Mark Rutland <mark.rutland@arm.com>

I also hacked the code to have the dying CPU spin forever before the call to
cpuhp_ap_report_dead(). In that case I see a warning, and that we don't call
arch_cpuhp_cleanup_dead_cpu(), and that the CPU is marked as offline (per
/sys/devices/system/cpu/$N/online).

As a tangent/aside, we might need to improve that for confidential compute
architectures, and we might want to generically track cpus which might still be
using kernel text/data. On arm64 we ensure that via our cpu_kill() callback
(which'll use PSCI CPU_AFFINITY_INFO), but I'm not sure if TDX and/or SEV-SNP
have a similar mechanism.

Otherwise, a malicious hypervisor can pause a vCPU just before it leaves the
kernel (e.g. immediately after the arch_cpuhp_cleanup_dead_cpu() call), wait
for a kexec (or resuse of stack memroy), and unpause the vCPU to cause things
to blow up.

Thanks,
Mark.

> ---
>  arch/arm64/Kconfig           |    1 +
>  arch/arm64/include/asm/smp.h |    2 +-
>  arch/arm64/kernel/smp.c      |   14 +++++---------
>  3 files changed, 7 insertions(+), 10 deletions(-)
> 
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -216,6 +216,7 @@ config ARM64
>  	select HAVE_KPROBES
>  	select HAVE_KRETPROBES
>  	select HAVE_GENERIC_VDSO
> +	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
>  	select IRQ_DOMAIN
>  	select IRQ_FORCED_THREADING
>  	select KASAN_VMALLOC if KASAN
> --- a/arch/arm64/include/asm/smp.h
> +++ b/arch/arm64/include/asm/smp.h
> @@ -99,7 +99,7 @@ static inline void arch_send_wakeup_ipi_
>  
>  extern int __cpu_disable(void);
>  
> -extern void __cpu_die(unsigned int cpu);
> +static inline void __cpu_die(unsigned int cpu) { }
>  extern void cpu_die(void);
>  extern void cpu_die_early(void);
>  
> --- a/arch/arm64/kernel/smp.c
> +++ b/arch/arm64/kernel/smp.c
> @@ -333,17 +333,13 @@ static int op_cpu_kill(unsigned int cpu)
>  }
>  
>  /*
> - * called on the thread which is asking for a CPU to be shutdown -
> - * waits until shutdown has completed, or it is timed out.
> + * Called on the thread which is asking for a CPU to be shutdown after the
> + * shutdown completed.
>   */
> -void __cpu_die(unsigned int cpu)
> +void arch_cpuhp_cleanup_dead_cpu(unsigned int cpu)
>  {
>  	int err;
>  
> -	if (!cpu_wait_death(cpu, 5)) {
> -		pr_crit("CPU%u: cpu didn't die\n", cpu);
> -		return;
> -	}
>  	pr_debug("CPU%u: shutdown\n", cpu);
>  
>  	/*
> @@ -370,8 +366,8 @@ void cpu_die(void)
>  
>  	local_daif_mask();
>  
> -	/* Tell __cpu_die() that this CPU is now safe to dispose of */
> -	(void)cpu_report_death();
> +	/* Tell cpuhp_bp_sync_dead() that this CPU is now safe to dispose of */
> +	cpuhp_ap_report_dead();
>  
>  	/*
>  	 * Actually shutdown the CPU. This must never fail. The specific hotplug
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
