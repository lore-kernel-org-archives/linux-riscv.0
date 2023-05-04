Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083FEC77B73
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 21:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:Subject:Cc
	:To:From:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=nAE8c1hj/0LCnP41044qqmGr6U9dkMFE/Kt2m6wsAVA=; b=VFTKhtBt4JR1sh
	JdIt2SsCcuf0nfjgKdrHzwuC5TN/mCZKLQ6zELrsJPR8r/6vBBIXXjQFOPVpVFNkxFDUlZfLFBphI
	YmEM2klWzM7wVsnUejRUN2VhHF/SUHX3ewgpfEEQk3YtvweRBuIuKyxa83eHOAR0Mya+P9r5b3mt2
	wtbHlfY7wuGX2eGf0oSRGbN7fKSngLCrJPUlkcg2yLzT0mrUXRTvNm3yiWcMV0t6IybajHDTaISix
	pL+kARpV6IPHaeXeU1qQNZk5UP1yPfGjho85puLnAltM7gueOVuKV3KXY1qiiptS90pddvXvkVhu2
	zWC8EofXsPiO2W7qyxqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pugIn-0090xA-0u;
	Thu, 04 May 2023 21:15:49 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pueDT-008dHM-33;
	Thu, 04 May 2023 19:02:14 +0000
Message-ID: <20230504185936.696863260@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683226930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=oNktQrwN+fatH513QPoGkxuTXmWxbBJSO1kVQSmt5aw=;
	b=gBya4Wdiox20HXnYxId2o92/cZNTV4kT8ZfWJZEW8ITXjndCeX8dDH5GHwnbCKYq4N2LZ7
	1Vliet33ezvFZfT7hZ49SRcTQY9GGkgXhlSt5j4FLFBbo8w2LMXaeiXjsd9i1J9IMUzHg1
	sJN1go/y7aKDt6GemaqC60gjrJ2Y/O06s8spq6n5PMT68ouOvPdBNo/CzyJcNIvXElJXAl
	XdjDvEAOi1DHoGQz2s+P9J0LaJZ0aZZ0+hC8ebSl7akG4yKA5FQhYbj1MWyqNbSv7kr//g
	wKJSvQLOs5Ac6Rvs5KHpecAWJnrhruw0ihD4m2E9ZObgEFCoaikI3NMnkVCBlA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683226930;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=oNktQrwN+fatH513QPoGkxuTXmWxbBJSO1kVQSmt5aw=;
	b=ne/7c8UNDxt/B5By5H8OrJEC2F33AGALC1UJsqUQEjBRB84Yn90Pp71hqA5iKSc8E1YfLo
	xVfQnGoIgwAl59BQ==
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
 "Michael Kelley (LINUX)" <mikelley@microsoft.com>
Subject: [patch V2 07/38] x86/smpboot: Restrict soft_restart_cpu() to SEV
References: <20230504185733.126511787@linutronix.de>
MIME-Version: 1.0
Date: Thu,  4 May 2023 21:02:09 +0200 (CEST)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_120212_431843_8E03FF52 
X-CRM114-Status: GOOD (  12.28  )
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

Now that the CPU0 hotplug cruft is gone, the only user is AMD SEV.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Tom Lendacky <thomas.lendacky@amd.com>

---
 arch/x86/kernel/callthunks.c |    2 +-
 arch/x86/kernel/head_32.S    |   14 --------------
 arch/x86/kernel/head_64.S    |    2 +-
 3 files changed, 2 insertions(+), 16 deletions(-)
---
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
