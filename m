Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93925C7EE25
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 21:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=qoj/Xxjrq9ZcuZ5WPJaoURCfIaTBLUWci/dmX7TR4O0=; b=Fvz7PPfWb8hEd6
	H1d1cP9q8YlQGXVBF09lC1TBAnI+w54r/7xVMI6m2FopJQcF8kJm72HM48xffXfruvQokvTAMoJuj
	XEV/0XsZ9jjc4VzzioVmjh+HjWZs1PzGojBAVVoOlaL+XZ2NNAfJIM3WZe4S3hQ8lRuza+9thBmoQ
	jDVOhO1f5CfSyIUp4/4wJ3Tuxt9ixmcRKggrlUEvKII+jmhh5UAEF6cEIay/A0t5e9CNZ6eOiex7F
	Yk4GZntvDHFeBVJXUZKxMSa+c7ob8K38G9kGIWDF68B6vgLzifW0Tv1HUvep9uVWQFT+61Oe8N1VO
	s65OMgqetJlKAHJgpJlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxZz2-00CyeI-23;
	Fri, 12 May 2023 21:07:24 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxZyo-00CyMt-1q;
	Fri, 12 May 2023 21:07:13 +0000
Message-ID: <20230512205255.662319599@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683925623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=10aHqiRf10a+4x+F15wqO9TaNeOMM+gljY64qYOf8Og=;
	b=LjbBQ3NLEkvc7e9R5u6yBkYS0iiwraQZmIUY+HCWYnQqRfXsTowBnBHcG1TtxBH3fAVoSQ
	ljm3T3p6GDG72K8bcRQxW8UQ8AFnJeYuwF6m3Rwl3xWoi8H8/BSIRJj1rVH+ip9//Ks2CE
	fFJHEmdVTk7moIEGWYEDWyAQEPoRHcgoEnf4wiilyclEx5NIwOXSKAxL/OmHZ9Qn9T7BaW
	lI3CrJ+EKcygt3YU47C0WJLEJrKKGyf0mIoV0OZUtQJOG6t2eGddOZYBHYJSTeG44wWBqW
	Kw9bLLMDxF8/F1fqZSwBPeGdCY5b1uQ6aFc1HXUNFM0V7oRK2uI9i5ZDa5ctow==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683925623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=10aHqiRf10a+4x+F15wqO9TaNeOMM+gljY64qYOf8Og=;
	b=WOpc7uYL/VidVOZn4G/ZP/A8TyN4gZsLcoALEzP0CZGwamlcMyB4G3NO+AsTxWEolHIdoB
	1lO2LOlMtVeUdXAg==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org,
 David Woodhouse <dwmw2@infradead.org>,
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
 Usama Arif <usama.arif@bytedance.com>,
 Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>,
 Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>,
 linux-csky@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>,
 "Michael Kelley (LINUX)" <mikelley@microsoft.com>,
 Ross Philipson <ross.philipson@oracle.com>
Subject:  [patch V4 04/37] x86/smpboot: Rename start_cpu0() to soft_restart_cpu()
References: <20230512203426.452963764@linutronix.de>
MIME-Version: 1.0
Date: Fri, 12 May 2023 23:07:03 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_140710_928434_43876758 
X-CRM114-Status: GOOD (  14.77  )
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

From: Thomas Gleixner <tglx@linutronix.de>

This is used in the SEV play_dead() implementation to re-online CPUs. But
that has nothing to do with CPU0.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>
---
 arch/x86/include/asm/cpu.h   |    2 +-
 arch/x86/kernel/callthunks.c |    2 +-
 arch/x86/kernel/head_32.S    |   10 +++++-----
 arch/x86/kernel/head_64.S    |   10 +++++-----
 arch/x86/kernel/sev.c        |    2 +-
 5 files changed, 13 insertions(+), 13 deletions(-)

--- a/arch/x86/include/asm/cpu.h
+++ b/arch/x86/include/asm/cpu.h
@@ -30,7 +30,7 @@ struct x86_cpu {
 #ifdef CONFIG_HOTPLUG_CPU
 extern int arch_register_cpu(int num);
 extern void arch_unregister_cpu(int);
-extern void start_cpu0(void);
+extern void soft_restart_cpu(void);
 #ifdef CONFIG_DEBUG_HOTPLUG_CPU0
 extern int _debug_hotplug_cpu(int cpu, int action);
 #endif
--- a/arch/x86/kernel/callthunks.c
+++ b/arch/x86/kernel/callthunks.c
@@ -134,7 +134,7 @@ static bool skip_addr(void *dest)
 	if (dest == ret_from_fork)
 		return true;
 #ifdef CONFIG_HOTPLUG_CPU
-	if (dest == start_cpu0)
+	if (dest == soft_restart_cpu)
 		return true;
 #endif
 #ifdef CONFIG_FUNCTION_TRACER
--- a/arch/x86/kernel/head_32.S
+++ b/arch/x86/kernel/head_32.S
@@ -140,16 +140,16 @@ SYM_CODE_END(startup_32)
 
 #ifdef CONFIG_HOTPLUG_CPU
 /*
- * Boot CPU0 entry point. It's called from play_dead(). Everything has been set
- * up already except stack. We just set up stack here. Then call
- * start_secondary().
+ * Entry point for soft restart of a CPU. Invoked from xxx_play_dead() for
+ * restarting the boot CPU or for restarting SEV guest CPUs after CPU hot
+ * unplug. Everything is set up already except the stack.
  */
-SYM_FUNC_START(start_cpu0)
+SYM_FUNC_START(soft_restart_cpu)
 	movl initial_stack, %ecx
 	movl %ecx, %esp
 	call *(initial_code)
 1:	jmp 1b
-SYM_FUNC_END(start_cpu0)
+SYM_FUNC_END(soft_restart_cpu)
 #endif
 
 /*
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -377,11 +377,11 @@ SYM_CODE_END(secondary_startup_64)
 
 #ifdef CONFIG_HOTPLUG_CPU
 /*
- * Boot CPU0 entry point. It's called from play_dead(). Everything has been set
- * up already except stack. We just set up stack here. Then call
- * start_secondary() via .Ljump_to_C_code.
+ * Entry point for soft restart of a CPU. Invoked from xxx_play_dead() for
+ * restarting the boot CPU or for restarting SEV guest CPUs after CPU hot
+ * unplug. Everything is set up already except the stack.
  */
-SYM_CODE_START(start_cpu0)
+SYM_CODE_START(soft_restart_cpu)
 	ANNOTATE_NOENDBR
 	UNWIND_HINT_END_OF_STACK
 
@@ -390,7 +390,7 @@ SYM_CODE_START(start_cpu0)
 	movq	TASK_threadsp(%rcx), %rsp
 
 	jmp	.Ljump_to_C_code
-SYM_CODE_END(start_cpu0)
+SYM_CODE_END(soft_restart_cpu)
 #endif
 
 #ifdef CONFIG_AMD_MEM_ENCRYPT
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -1328,7 +1328,7 @@ static void sev_es_play_dead(void)
 	 * If we get here, the VCPU was woken up again. Jump to CPU
 	 * startup code to get it back online.
 	 */
-	start_cpu0();
+	soft_restart_cpu();
 }
 #else  /* CONFIG_HOTPLUG_CPU */
 #define sev_es_play_dead	native_play_dead




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
