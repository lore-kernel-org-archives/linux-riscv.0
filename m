Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3873FC77B75
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 13:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fS2Vt94k26SeGBNXejs5YuAZuiqtxeIU1FvN1bZ0FMM=; b=FWauGzgByfQdJl
	vhI4wRs7HCUs4H0pC86pmZd5+B2TU/wrlVyHG+VgrT7IR2wCvD54heg0aR9ke89tI5DYRBrEb0SO3
	hAe+tW8Tj16zjOHKyOYnkEwjhFPBFqJYbL/iQwhg+bHqi+T05Wwcn4He9yYjXdUQE+gYXpzliqaBD
	ISRhVySq8kq6lJ5Bw/9KDwj0EoD3D4hwjFpPDopyo4h7972AXmc5LP6g4TFd0Q4HZ/BDvHXlnzusQ
	goAl5ZrCsXhUoVbI5IfGlip4rn/tqNRPPBNZA4HIa/OYnfsAGZUBWwkePV9MGjwPMydYhiv6QX4gi
	ReB8wBppzcQffQflHBuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwNAD-003Ne8-0k;
	Tue, 09 May 2023 13:13:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwNAB-003Nde-0r;
	Tue, 09 May 2023 13:13:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=khqr0MrXgdTVdwiWa8T0MGcDfR6bo4jGzZcTutjT+jQ=; b=AEUW7P6wHkheamaa+eBuAM5GlC
	HfXe2ylLtWfcka1eSHoTdooMv0rHLwy/4UXXJfZaPtCYmRmGdjmuMt/FClhve6qLhrukTIXm+8N+x
	nnGp+Vzv9Hegi36E8Rf/r4OzxVgdZvlwWMFCYnhPsYrrh5BHtNngH7k2UHSRocxMaqFkCSuUYHGyM
	EsKfIzE5XcxVl6vZOctnKdun9FsIUQbYBW2M+Z1E/CAIBnpced8CJq1O4rRlwdi1xMIKktEKJ2RfE
	L+hwPaIMMTATJdkHhod0l8xSQ9RsSKpUEP7+RkcJIh1jBJKJkRFGUcEM0nLnU4e2CbQIrer3yhEJm
	rDt36aIw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pwNA0-00FGci-C9; Tue, 09 May 2023 13:13:44 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B23CD30026A;
	Tue,  9 May 2023 15:13:40 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9497920B41FB2; Tue,  9 May 2023 15:13:40 +0200 (CEST)
Date: Tue, 9 May 2023 15:13:40 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org,
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
	Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	linux-csky@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Sabin Rapan <sabrapan@amazon.com>,
	"Michael Kelley (LINUX)" <mikelley@microsoft.com>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [patch v3 34/36] x86/smpboot: Implement a bit spinlock to
 protect the realmode stack
Message-ID: <20230509131340.GA83892@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185219.123719053@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230508185219.123719053@linutronix.de>
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

On Mon, May 08, 2023 at 09:44:22PM +0200, Thomas Gleixner wrote:

> @@ -252,6 +252,17 @@ SYM_INNER_LABEL(secondary_startup_64_no_
>  	movq	TASK_threadsp(%rax), %rsp
>  
>  	/*
> +	 * Now that this CPU is running on its own stack, drop the realmode
> +	 * protection. For the boot CPU the pointer is NULL!
> +	 */
> +	movq	trampoline_lock(%rip), %rax
	movl	$0, (%rax)

> +.Lsetup_gdt:
> +	/*
>  	 * We must switch to a new descriptor in kernel space for the GDT
>  	 * because soon the kernel won't have access anymore to the userspace
>  	 * addresses where we're currently running on. We have to do that here

> --- a/arch/x86/realmode/rm/trampoline_64.S
> +++ b/arch/x86/realmode/rm/trampoline_64.S
> @@ -37,6 +37,24 @@
>  	.text
>  	.code16
>  
> +.macro LOAD_REALMODE_ESP
> +	/*
> +	 * Make sure only one CPU fiddles with the realmode stack
> +	 */
> +.Llock_rm\@:
> +	btl	$0, tr_lock
> +	jnc	2f
> +	pause
> +	jmp	.Llock_rm\@
> +2:
> +	lock
> +	btsl	$0, tr_lock
> +	jc	.Llock_rm\@

Do we really care about performance here; or should we pick the simpler
form? Also, 'lock' is a prefix, not an instruction.

.Llock_rm\@:
	lock btsl	$0, tr_lock;
	jnc		2f
	pause
	jmp		.Llock_rm\@
2:

> +
> +	# Setup stack
> +	movl	$rm_stack_end, %esp
> +.endm
> +
>  	.balign	PAGE_SIZE

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
