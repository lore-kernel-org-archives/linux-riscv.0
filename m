Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBECCC7EE2A
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 23:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=9TU5osFFMWWf604tDyBtxjZJGjz7WeUeQMJBrPVeCo4=; b=ZiqF+8TY/f0adm
	M7/U6rlwQAbtIA09Jl9GfGfCFdzPMbMS+80gXWW2DbFxL35+fP3KzJcjHBgehkIjPkbSDReOrWYHO
	5nzuIb6A2YNrq+lOYObcysSK1nQH6JHvvXNk26/J58l3/ydad2joQ920/tpzMvJpCsOFSkFmbl1pJ
	2IKQTb3kZzNOPsdd9iM6l9VjMGhDzAN6w9g2aZVCBVvbvOHkklByGJHZZgTIKWFw+lO1gbPDKSv9R
	+ugdefymVcQXh34qsldypVKGCjmP/BLFyy9PkZs4xRKMYT6T1cV5CbLdwRvTZ8V8PSI34o4U34bcr
	JbZ+Zfty2EX7B/tcePFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnT5n-00AkAb-06;
	Fri, 14 Apr 2023 23:44:35 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnT5Z-00Ak0E-1l;
	Fri, 14 Apr 2023 23:44:23 +0000
Message-ID: <20230414232309.448345494@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681515860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=SRk3RrJ8+RSaiZTRwxMk0fG1NuTGaGpFKdBZXu8mJKE=;
	b=TenZelvKdY6Tx+OsImAHk36b4tbQIR+z0M1WnFpjy8y+51j9W5eVFc7Of6Sf8s0X5uq+xc
	6SLC+/lL+CpUg+kTVvDAN1gjqSax0V+tVQNmmxi4coTX5o01NqKtoGfLSsdE0lb320KW1r
	QEHnIVRUnqLfhZgK+7fQTY+n7WOGwL6ll+eunwu5W5z5A2qnT1aRW5PuasQXgjsBUf/jBU
	7xOQ39cpNhzE0/XOurXN0gDhM1Ox280g/R6YyoZtAiatQnNAao3G3M3vKjSts9mlj9G6qX
	S7eGW9eMYE6lWwqIwp+CRBO4mI9eSSdxCdQI74WXa5fo3DgjCo/bZ5Uwga1FYg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681515860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=SRk3RrJ8+RSaiZTRwxMk0fG1NuTGaGpFKdBZXu8mJKE=;
	b=GpdL477IqUbVLYXts40m+nkntEs4l/SFSgjl8WTxVs9fG2Y4NeqfbJbNj3fY+ekDTnUTf2
	CVV1j8YeN8LpbeAA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org,
 David Woodhouse <dwmw@infradead.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Brian Gerst <brgerst@gmail.com>,
 "Arjan van de Veen" <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>,
 Sean Christopherson <seanjc@google.com>,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Paul Menzel <pmenzel@molgen.mpg.de>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Piotr Gorski <lucjan.lucjanov@gmail.com>,
 David Woodhouse <dwmw@amazon.co.uk>,
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
 Sabin Rapan <sabrapan@amazon.com>
Subject: [patch 04/37] x86/smpboot: Rename start_cpu0() to soft_restart_cpu()
References: <20230414225551.858160935@linutronix.de>
MIME-Version: 1.0
Date: Sat, 15 Apr 2023 01:44:19 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_164421_891709_F0CB040E 
X-CRM114-Status: GOOD (  13.55  )
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

This is used in the SEV play_dead() implementation to re-online CPUs. But
that has nothing to do with CPU0.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
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
 	UNWIND_HINT_EMPTY
 
@@ -390,7 +390,7 @@ SYM_CODE_START(start_cpu0)
 	movq	TASK_threadsp(%rcx), %rsp
 
 	jmp	.Ljump_to_C_code
-SYM_CODE_END(start_cpu0)
+SYM_CODE_END(soft_restart_cpu)
 #endif
 
 #ifdef CONFIG_AMD_MEM_ENCRYPT
--- a/arch/x86/kernel/sev.c
+++ b/arch/x86/kernel/sev.c
@@ -1326,7 +1326,7 @@ static void sev_es_play_dead(void)
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
