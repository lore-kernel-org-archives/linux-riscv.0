Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C772C77B7A
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 19:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kIVepZ800WbdryJceES2oM/FDjlAuN2Bb5P5V2oiAZ0=; b=Y8o8TsuYovspcm
	Kg57xD04WZENL/kryGHoH4gZEPJzMIfEtoMPNm6FNq+xIPiGvY6RNe5MWQb9ggp+Hsk6PjLeGZasr
	7XdUEklglV/3ssN05TuzRwZaATLu77xnQEdUOHogYN0TPCqIWBUd44rijZv77CkUzMXHA9wvCJfHj
	4e2D3PRTjoBLsIx+bfhmKf3zm+z3juN0GRmIHBBfUOP7u817kcK6kSKEJEjwAdbplmq51zgSQnAIv
	QKckNr4NqrfLEhtmAlD4fyB9QuqY+jvHOnMPu6MiBDXEIBv0uPEk3gIuxj8v14Dvqf0V3Mh8UUFwx
	DH+zncO8xlnsos7aLpKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3iWj-00BVbN-1c;
	Mon, 29 May 2023 19:27:33 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3iWf-00BVXu-1b;
	Mon, 29 May 2023 19:27:30 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1685388433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kl0ODdCeKiDH/b09sXJZwrPwGLdocmdMEThYYertZKo=;
	b=Vxb6resa0Cee8qKiX40iLmpLbizKny04GkH5PE3gewsxqPqAzhTPcwc8GkVpD7IYkBdOob
	kldM9lYeqBeHeuVdf1n1uSRqpZ8thZOUUpxSgDMIWLmXNRAjjAYL9XB4nCkRJyP2BNBrgs
	+LjDC7xzihRAukwVXXSnFrbgcjETfKlxcQ0f7eAmLBfEur7iq3CkzZd7Fv+C3xIIfX9Oqn
	UDvSgGVwTUuYApQRu8CALqoBA3mLboEZWctl8SJ4zwTlaLr0WQyCLTztU3yg0BGhcD0i4q
	r0GC5zQfvpRfIKFDunUCoMLmRn5jMSReNtV5bplMpx4cZ9Wq3FpYR24PpP9nqg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1685388433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Kl0ODdCeKiDH/b09sXJZwrPwGLdocmdMEThYYertZKo=;
	b=2dl6kWdCmqa//U1xNID+wwwyKgUQy1Ux9vDUW+tt7QyZfM5CWCbMX54JcFWLtsOWsuy9ZI
	CACTmSWLwHX7odAw==
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
Subject: Re: [patch v3 31/36] x86/apic: Provide cpu_primary_thread mask
In-Reply-To: <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.962208640@linutronix.de>
 <20230524204818.3tjlwah2euncxzmh@box.shutemov.name> <87y1lbl7r6.ffs@tglx>
 <87sfbhlwp9.ffs@tglx> <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name>
Date: Mon, 29 May 2023 21:27:13 +0200
Message-ID: <87bki3kkfi.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_122729_695535_502D933E 
X-CRM114-Status: GOOD (  13.45  )
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

On Mon, May 29 2023 at 05:39, Kirill A. Shutemov wrote:
> On Sat, May 27, 2023 at 03:40:02PM +0200, Thomas Gleixner wrote:
> But it gets broken again on "x86/smpboot: Implement a bit spinlock to
> protect the realmode stack" with
>
> [    0.554079] .... node  #0, CPUs:        #1  #2
> [    0.738071] Callback from call_rcu_tasks() invoked.
> [   10.562065] CPU2 failed to report alive state
> [   10.566337]   #3
> [   20.570066] CPU3 failed to report alive state
> [   20.574268]   #4
> ...
>
> Notably CPU1 is missing from "failed to report" list. So CPU1 takes the
> lock fine, but seems never unlocks it.
>
> Maybe trampoline_lock(%rip) in head_64.S somehow is not the same as
> &tr_lock in trampoline_64.S. I donno.

It's definitely the same in the regular startup (16bit mode), but TDX
starts up via:

trampoline_start64
  trampoline_compat
    LOAD_REALMODE_ESP <- lock

That place cannot work with that LOAD_REALMODE_ESP macro. The untested
below should cure it.

Thanks,

        tglx
---
--- a/arch/x86/realmode/rm/trampoline_64.S
+++ b/arch/x86/realmode/rm/trampoline_64.S
@@ -37,12 +37,12 @@
 	.text
 	.code16
 
-.macro LOAD_REALMODE_ESP
+.macro LOAD_REALMODE_ESP lock:req
 	/*
 	 * Make sure only one CPU fiddles with the realmode stack
 	 */
 .Llock_rm\@:
-        lock btsl       $0, tr_lock
+        lock btsl       $0, \lock
         jnc             2f
         pause
         jmp             .Llock_rm\@
@@ -63,7 +63,7 @@ SYM_CODE_START(trampoline_start)
 	mov	%ax, %es
 	mov	%ax, %ss
 
-	LOAD_REALMODE_ESP
+	LOAD_REALMODE_ESP tr_lock
 
 	call	verify_cpu		# Verify the cpu supports long mode
 	testl   %eax, %eax		# Check for return code
@@ -106,7 +106,7 @@ SYM_CODE_START(sev_es_trampoline_start)
 	mov	%ax, %es
 	mov	%ax, %ss
 
-	LOAD_REALMODE_ESP
+	LOAD_REALMODE_ESP tr_lock
 
 	jmp	.Lswitch_to_protected
 SYM_CODE_END(sev_es_trampoline_start)
@@ -189,7 +189,7 @@ SYM_CODE_START(pa_trampoline_compat)
 	 * In compatibility mode.  Prep ESP and DX for startup_32, then disable
 	 * paging and complete the switch to legacy 32-bit mode.
 	 */
-	LOAD_REALMODE_ESP
+	LOAD_REALMODE_ESP pa_tr_lock
 	movw	$__KERNEL_DS, %dx
 
 	movl	$(CR0_STATE & ~X86_CR0_PG), %eax


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
