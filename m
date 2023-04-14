Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB1AC77B77
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Apr 2023 23:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=oda7gLFr6uY7PnMO8qmJqtdOLd97YUzzVNuJXHKMXes=; b=nWTN0c8Pzc4y25
	XnuPEl7TiwS7gApxUSCl8WEI3dUcX2kiapdrKuy/NxIkr1HUcZ7ZQ1vLH2n03djC7g+S9HukoS2P3
	2WM9xksxP7mCkdLnTt1Lo2FGm4a6KCOTpR6b7koN5ZE/aCxSAzs5etfaDxjlqadyIUCMRHfXjiZGg
	wLIfI9R8Nwmn20sxsHjWQnBLMnRk7QF0+tJfLS+Jl5LBeYpPuMbEkgsU0CNWFPs1Usddp1GXsETGk
	EtrLi01tQKldBbTTClj8VR8hcXkcGbvpVURxoblImN+27zYpy+w2cG+9I4aeQtfXEM8QXTljv1/6J
	eI6wUPp9NxV6Iuu6PySQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnT5x-00AkLj-1Y;
	Fri, 14 Apr 2023 23:44:45 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnT5e-00Ak39-2I;
	Fri, 14 Apr 2023 23:44:28 +0000
Message-ID: <20230414232309.634953473@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1681515865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=yXU88DPM4+gDgwwKQLancKUxDjIhod/zoYFzhLlkywE=;
	b=uB/cdoo+FiKgxcyt6ua+eofd7Uy6FRsG6/M919LHeLaRDCm0uyHoc5a1FuwimG9z0Kg1xr
	I101+cnRHFikD4fqEm6lZOTxsA3yV9LXW61rrHUVlF3AiOWiBC00yRq0VhWdSwUelUpctI
	5IcE3x4R3zXRKbqt7SSBKBa4oYiQTpXazjMN/L2oMlO9K+07Nyr22exnb4k00l3spzvmVc
	9LRa6JkEMAonr+NJM4O1ggTmXWPqwz4bV0FKYjWVuxuelWC7S0/bYUbnT566jHXu359fFE
	1kF7NH3ihq64cycQYcnuOz7AxFm2QZeP5t1J5QjP8JiYPJKiwyKDhh8WCXeClA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1681515865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=yXU88DPM4+gDgwwKQLancKUxDjIhod/zoYFzhLlkywE=;
	b=MdNuozlhNGUku1R1Tw5i7+TfSWnt88h5jzNnGTOji+filOi1PFWkM9UpldmpxTl1Bs6qoB
	RP/SXlqo2sMOuJDA==
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
Subject: [patch 07/37] x86/smpboot: Restrict soft_restart_cpu() to SEV
References: <20230414225551.858160935@linutronix.de>
MIME-Version: 1.0
Date: Sat, 15 Apr 2023 01:44:24 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_164426_895001_04C0E332 
X-CRM114-Status: GOOD (  10.61  )
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

Now that the CPU0 hotplug cruft is gone, the only user is AMD SEV.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
---
 arch/x86/kernel/callthunks.c |    2 +-
 arch/x86/kernel/head_32.S    |   14 --------------
 arch/x86/kernel/head_64.S    |    2 +-
 3 files changed, 2 insertions(+), 16 deletions(-)

--- a/arch/x86/kernel/callthunks.c
+++ b/arch/x86/kernel/callthunks.c
@@ -133,7 +133,7 @@ static bool skip_addr(void *dest)
 	/* Accounts directly */
 	if (dest == ret_from_fork)
 		return true;
-#ifdef CONFIG_HOTPLUG_CPU
+#if defined(CONFIG_HOTPLUG_CPU) && defined(CONFIG_AMD_MEM_ENCRYPT)
 	if (dest == soft_restart_cpu)
 		return true;
 #endif
--- a/arch/x86/kernel/head_32.S
+++ b/arch/x86/kernel/head_32.S
@@ -138,20 +138,6 @@ SYM_CODE_START(startup_32)
 	jmp .Ldefault_entry
 SYM_CODE_END(startup_32)
 
-#ifdef CONFIG_HOTPLUG_CPU
-/*
- * Entry point for soft restart of a CPU. Invoked from xxx_play_dead() for
- * restarting the boot CPU or for restarting SEV guest CPUs after CPU hot
- * unplug. Everything is set up already except the stack.
- */
-SYM_FUNC_START(soft_restart_cpu)
-	movl initial_stack, %ecx
-	movl %ecx, %esp
-	call *(initial_code)
-1:	jmp 1b
-SYM_FUNC_END(soft_restart_cpu)
-#endif
-
 /*
  * Non-boot CPU entry point; entered from trampoline.S
  * We can't lgdt here, because lgdt itself uses a data segment, but
--- a/arch/x86/kernel/head_64.S
+++ b/arch/x86/kernel/head_64.S
@@ -375,7 +375,7 @@ SYM_CODE_END(secondary_startup_64)
 #include "verify_cpu.S"
 #include "sev_verify_cbit.S"
 
-#ifdef CONFIG_HOTPLUG_CPU
+#if defined(CONFIG_HOTPLUG_CPU) && defined(CONFIG_AMD_MEM_ENCRYPT)
 /*
  * Entry point for soft restart of a CPU. Invoked from xxx_play_dead() for
  * restarting the boot CPU or for restarting SEV guest CPUs after CPU hot


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
