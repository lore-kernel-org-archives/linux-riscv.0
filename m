Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABD6C77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 10:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1rSFA48vFyEdzHlLIVnBbKYknKj3XnCQzlirU9Mj7m0=; b=ClNEM5lXaAhTNA
	x9LnSstUmlHM5qeDrItx7R3dhSoPIdxXHOLOwv1G/RBCg/cDREizLhlcWZ7XIzUnMZTTykgWBvxUw
	cRKs19rsE4pvxTZ4tyV6MnIgS2h0+aMXO/FF5rjxcYCTU0DiF903ryKfwuOWhWEKFoLDXqe3semjr
	0nI7Su7cTVg6ejX4JZ+1ACD1QrRniOhsoh0QLljb4UH5NPq6YLFHjhpOKdDdTeRl7Gb5l78padFYZ
	pVa6JSjPs3cGRXrNo4yH2pkfJhS6E+qOIAcyQUMXwCwpsFtH8QaZAt+WhM0yCy9c+O9gI+o+98djP
	k0kI3zQ3Q863AdjHq5yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3ws3-00DQTA-1M;
	Tue, 30 May 2023 10:46:31 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3wrz-00DQSF-22;
	Tue, 30 May 2023 10:46:29 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1685443583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aczuPZRXM/3T3zeRyckgFz17tXnOXBoIRzMvbCKmwP4=;
	b=jtpE+gCbIAd5N53RxGc6sgaT2si80ubO5trdzq0YZPJgj0u0uGxnEtLhxrdtPRPKOaDE18
	ztu5b4k5XEjvK/fjpfaluMv16JvaD5E4Z3L+jqW7tLBl5pCr13VXjUoqvtgyKLd/Y/xqu/
	84SV1UbOvwmhndn5fFxZSGrnlbePrrHSpEQPGnffMATrvpt3ZAkTXG6ylWpzmAYhS4dUem
	FTBfKKPOVhev4++C/nR20YRFt6jyNNtCz9uhzfOoHg4olSWAigaKti8fg/vEQYtVI0MLbc
	gP2h3BhbdhTtPHPbM7xx+svbc8m0rHw4UqvtNs/L/faaOGodmpnGf4MovXV/Gg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1685443583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aczuPZRXM/3T3zeRyckgFz17tXnOXBoIRzMvbCKmwP4=;
	b=Hfhdo2/Q/3z4khc8VnhVtRu45XjAYTmDIx3ynzUXbEbUuJzXZUdsmlA0kYxl32RnfB9UKw
	25lgiYCSG2Kzr+Dw==
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
 <seanjc@google.com>, Oleksandr Natalenko <oleksandr@natalenko.name>, Paul
 Menzel <pmenzel@molgen.mpg.de>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Piotr Gorski <lucjan.lucjanov@gmail.com>, Usama
 Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>, "Michael Kelley (LINUX)"
 <mikelley@microsoft.com>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: [patch] x86/realmode: Make stack lock work in trampoline_compat()
In-Reply-To: <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.962208640@linutronix.de>
 <20230524204818.3tjlwah2euncxzmh@box.shutemov.name> <87y1lbl7r6.ffs@tglx>
 <87sfbhlwp9.ffs@tglx> <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name>
 <87bki3kkfi.ffs@tglx> <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
Date: Tue, 30 May 2023 12:46:22 +0200
Message-ID: <87h6rujdvl.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_034627_847234_E76F1984 
X-CRM114-Status: GOOD (  11.66  )
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

The stack locking and stack assignment macro LOAD_REALMODE_ESP fails to
work when invoked from the 64bit trampoline entry point:

trampoline_start64
  trampoline_compat
    LOAD_REALMODE_ESP <- lock

Accessing tr_lock is only possible from 16bit mode. For the compat entry
point this needs to be pa_tr_lock so that the required relocation entry is
generated. Otherwise it locks the non-relocated address which is
aside of being wrong never cleared in secondary_startup_64() causing all
but the first CPU to get stuck on the lock.

Make the macro take an argument lock_pa which defaults to 0 and rename it
to LOCK_AND_LOAD_REALMODE_ESP to make it clear what this is about.

Fixes: f6f1ae9128d2 ("x86/smpboot: Implement a bit spinlock to protect the realmode stack")
Reported-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 arch/x86/realmode/rm/trampoline_64.S |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

--- a/arch/x86/realmode/rm/trampoline_64.S
+++ b/arch/x86/realmode/rm/trampoline_64.S
@@ -37,12 +37,16 @@
 	.text
 	.code16
 
-.macro LOAD_REALMODE_ESP
+.macro LOCK_AND_LOAD_REALMODE_ESP lock_pa=0
 	/*
 	 * Make sure only one CPU fiddles with the realmode stack
 	 */
 .Llock_rm\@:
+	.if \lock_pa
+        lock btsl       $0, pa_tr_lock
+	.else
         lock btsl       $0, tr_lock
+	.endif
         jnc             2f
         pause
         jmp             .Llock_rm\@
@@ -63,7 +67,7 @@ SYM_CODE_START(trampoline_start)
 	mov	%ax, %es
 	mov	%ax, %ss
 
-	LOAD_REALMODE_ESP
+	LOCK_AND_LOAD_REALMODE_ESP
 
 	call	verify_cpu		# Verify the cpu supports long mode
 	testl   %eax, %eax		# Check for return code
@@ -106,7 +110,7 @@ SYM_CODE_START(sev_es_trampoline_start)
 	mov	%ax, %es
 	mov	%ax, %ss
 
-	LOAD_REALMODE_ESP
+	LOCK_AND_LOAD_REALMODE_ESP
 
 	jmp	.Lswitch_to_protected
 SYM_CODE_END(sev_es_trampoline_start)
@@ -189,7 +193,7 @@ SYM_CODE_START(pa_trampoline_compat)
 	 * In compatibility mode.  Prep ESP and DX for startup_32, then disable
 	 * paging and complete the switch to legacy 32-bit mode.
 	 */
-	LOAD_REALMODE_ESP
+	LOCK_AND_LOAD_REALMODE_ESP lock_pa=1
 	movw	$__KERNEL_DS, %dx
 
 	movl	$(CR0_STATE & ~X86_CR0_PG), %eax

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
