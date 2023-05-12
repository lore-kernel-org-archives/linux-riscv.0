Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD8BBC7EE25
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 21:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=n4qdgQ8EegTDQs14LjEA7OWX894PTvtKM8C8a7uAs4Y=; b=ujt1rO1aTUxic9
	nuAKWMcrIPzSXBeOmHTOIvu2V4lQySe5GlrqAe3bRrRAtqkWazxzUUuO8j/7psn9TCxzoq7CJ06gV
	rCyBPVjaaCHLgmap7CUSsxzWFR0MBXEpm1xmCIfeRyQuoewhOOAu1qub0s4dfe3p9S9vcf77dnUgb
	PY1zyBR3ncNWTu7BM4x1/lrPrSKi6jMapc8dIOuAvsfyGAAkxnXMlwb9ZkV8tZLBwGvLSY+GBzO7a
	0+xra4exS+/CXT6C4bsh1TZ9UEMkBSWV6DZVeFUOxw7GDwBgHIV9M7mD1D280PEZEq1nRWLy+UzlD
	QOCVYZqPzsZw6zavuwww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxa2L-00D1vd-1F;
	Fri, 12 May 2023 21:10:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxZzb-00CzEm-2F;
	Fri, 12 May 2023 21:07:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:In-Reply-To;
	bh=IP4bdlmLdqVc3LCZrNxGXTkJh6c/m5h1IVAGFT7rdmU=; b=MEJ7aAwwVqEpNJd4bn5q8xXj1D
	L+CtUjYBk+Y8NmZjn8FQLkHt02xCfkF5XPcGUQQTfGYqNFzrT3x2r/OQcmad9Pe+yykmrDmBvUbWl
	XW2CCPoRGckSnCS3rAL64XFq2KpE2C8/djgkvb5LoI3Vh3hYJJJZ5buKWbUlmw2tlXDDcrYIX7YYf
	BqAnsOvYcKTvl+KcR2SkpcB/3dYhiNsVzSjg3NDrR6mUn9Zd/PmUtNQEBHamUkUUx+XJr8t9qIAmM
	dldNr7cmN1UcKkF6CL+4MPVKYil0S1Dmutxud0xRtfwXKJLs91kJ93I++Cckj3S07aO0Mj6JZyUO2
	UfaiSWQw==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxZzX-009JBO-0C;
	Fri, 12 May 2023 21:07:57 +0000
Message-ID: <20230512205257.355425551@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683925674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=IP4bdlmLdqVc3LCZrNxGXTkJh6c/m5h1IVAGFT7rdmU=;
	b=r7gtP8cd7Oi46e4lE/ByHI+khRt47Q1tdhvFutLNb1nZ0EzY0luf/WbDQ0k8nKgYTLl4fZ
	6jVUGYKF/8lveenjXvvre5ndfySMPCdjlJpKvZns1rWXPEqcXr6eVN8NK8cZAbmnCQ6yQp
	Yx3aUoQDw2kxMWvLVB4RoPcVQxwMr1TEQt/JyflnlrUKkC5yB1WXFRYeLO2qGcavmQy/xb
	TWM6HpGmz8K6kbaRe7K69Mm4B+cOxkraoO55h4/F16N4d4HFqv7paqDclFhhm777QOq+fn
	+XmNnPyatRLfjMogFbBl6Kr8xcpvcs8sEUSklzYMFqy5aqxV2atkp8bBibVO7g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683925674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=IP4bdlmLdqVc3LCZrNxGXTkJh6c/m5h1IVAGFT7rdmU=;
	b=jvsTBFPAx2r/a9Hm2XoIkmPwImha2AedATS4Qf2wMfcTkLbpvnlZqm6V6xCv2m4a7aeYFX
	WwQng/2elbC/s/DA==
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
 Ross Philipson <ross.philipson@oracle.com>,
 David Woodhouse <dwmw@amazon.co.uk>
Subject: [patch V4 35/37] x86/smpboot: Implement a bit spinlock to protect the
 realmode stack
References: <20230512203426.452963764@linutronix.de>
MIME-Version: 1.0
Date: Fri, 12 May 2023 23:07:53 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_220756_016533_D6F6BD76 
X-CRM114-Status: GOOD (  17.30  )
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

Parallel AP bringup requires that the APs can run fully parallel through
the early startup code including the real mode trampoline.

To prepare for this implement a bit-spinlock to serialize access to the
real mode stack so that parallel upcoming APs are not going to corrupt each
others stack while going through the real mode startup code.

Co-developed-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Michael Kelley <mikelley@microsoft.com>
---
V4: Simplify the lock implementation - Peter Z.
---
 arch/x86/include/asm/realmode.h      |    3 +++
 arch/x86/kernel/head_64.S            |   12 ++++++++++++
 arch/x86/realmode/init.c             |    3 +++
 arch/x86/realmode/rm/trampoline_64.S |   23 ++++++++++++++++++-----
 4 files changed, 36 insertions(+), 5 deletions(-)
--- a/arch/x86/include/asm/realmode.h
+++ b/arch/x86/include/asm/realmode.h
@@ -52,6 +52,7 @@ struct trampoline_header {
 	u64 efer;
 	u32 cr4;
 	u32 flags;
+	u32 lock;
 #endif
 };
 
@@ -64,6 +65,8 @@ extern unsigned long initial_stack;
 extern unsigned long initial_vc_handler;
 #endif
 
+extern u32 *trampoline_lock;
+
 extern unsigned char real_mode_blob[];
 extern unsigned char real_mode_relocs[];
 
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -252,6 +252,16 @@ SYM_INNER_LABEL(secondary_startup_64_no_
 	movq	TASK_threadsp(%rax), %rsp
 
 	/*
+	 * Now that this CPU is running on its own stack, drop the realmode
+	 * protection. For the boot CPU the pointer is NULL!
+	 */
+	movq	trampoline_lock(%rip), %rax
+	testq	%rax, %rax
+	jz	.Lsetup_gdt
+	movl	$0, (%rax)
+
+.Lsetup_gdt:
+	/*
 	 * We must switch to a new descriptor in kernel space for the GDT
 	 * because soon the kernel won't have access anymore to the userspace
 	 * addresses where we're currently running on. We have to do that here
@@ -433,6 +443,8 @@ SYM_DATA(initial_code,	.quad x86_64_star
 #ifdef CONFIG_AMD_MEM_ENCRYPT
 SYM_DATA(initial_vc_handler,	.quad handle_vc_boot_ghcb)
 #endif
+
+SYM_DATA(trampoline_lock, .quad 0);
 	__FINITDATA
 
 	__INIT
--- a/arch/x86/realmode/init.c
+++ b/arch/x86/realmode/init.c
@@ -154,6 +154,9 @@ static void __init setup_real_mode(void)
 
 	trampoline_header->flags = 0;
 
+	trampoline_lock = &trampoline_header->lock;
+	*trampoline_lock = 0;
+
 	trampoline_pgd = (u64 *) __va(real_mode_header->trampoline_pgd);
 
 	/* Map the real mode stub as virtual == physical */
--- a/arch/x86/realmode/rm/trampoline_64.S
+++ b/arch/x86/realmode/rm/trampoline_64.S
@@ -37,6 +37,20 @@
 	.text
 	.code16
 
+.macro LOAD_REALMODE_ESP
+	/*
+	 * Make sure only one CPU fiddles with the realmode stack
+	*/
+.Llock_rm\@:
+        lock btsl       $0, tr_lock
+        jnc             2f
+        pause
+        jmp             .Llock_rm\@
+2:
+	# Setup stack
+	movl	$rm_stack_end, %esp
+.endm
+
 	.balign	PAGE_SIZE
 SYM_CODE_START(trampoline_start)
 	cli			# We should be safe anyway
@@ -49,8 +63,7 @@ SYM_CODE_START(trampoline_start)
 	mov	%ax, %es
 	mov	%ax, %ss
 
-	# Setup stack
-	movl	$rm_stack_end, %esp
+	LOAD_REALMODE_ESP
 
 	call	verify_cpu		# Verify the cpu supports long mode
 	testl   %eax, %eax		# Check for return code
@@ -93,8 +106,7 @@ SYM_CODE_START(sev_es_trampoline_start)
 	mov	%ax, %es
 	mov	%ax, %ss
 
-	# Setup stack
-	movl	$rm_stack_end, %esp
+	LOAD_REALMODE_ESP
 
 	jmp	.Lswitch_to_protected
 SYM_CODE_END(sev_es_trampoline_start)
@@ -177,7 +189,7 @@ SYM_CODE_START(pa_trampoline_compat)
 	 * In compatibility mode.  Prep ESP and DX for startup_32, then disable
 	 * paging and complete the switch to legacy 32-bit mode.
 	 */
-	movl	$rm_stack_end, %esp
+	LOAD_REALMODE_ESP
 	movw	$__KERNEL_DS, %dx
 
 	movl	$(CR0_STATE & ~X86_CR0_PG), %eax
@@ -241,6 +253,7 @@ SYM_DATA_START(trampoline_header)
 	SYM_DATA(tr_efer,		.space 8)
 	SYM_DATA(tr_cr4,		.space 4)
 	SYM_DATA(tr_flags,		.space 4)
+	SYM_DATA(tr_lock,		.space 4)
 SYM_DATA_END(trampoline_header)
 
 #include "trampoline_common.S"


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
