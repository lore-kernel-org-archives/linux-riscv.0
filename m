Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC91C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 10:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k+hJzK4nMZXHq1xbJC2SxBUsO+uOspNCvHnmb9DfKjQ=; b=v3rKxxl3kLjD2l
	H67+2efgV72C+mm873/aPNp8M7n42gQ/4+40iedMeVLfyffiyuuMr7884wusoHHIPIYII4/T9sf+f
	jkWJcz6dQ6UIw2/CqTZ7Q6o8mDev0/uyRj9uThbcHZTsMKQKA479cxXj5EgaHlAAgqUdaS7jMc33p
	htVcbXyleM7thwxe6rr9NIJhek6O+KgU8Mp2neVuc8sXUHugq65iTA9vxwNP+Z0l9WJOTaX8qMAGT
	fXfKeMy9OvLK1I+gkW6NWP9zviAG/pL0QHE6ZZB+qCbqKIn6PQdrweBDAFJGNOqeBdu9DrW6AcTHv
	XvxnWdCFV8vxbB1dGzuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKR7-002qq6-3D;
	Tue, 09 May 2023 10:19:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKR6-002qpg-13;
	Tue, 09 May 2023 10:19:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PKLh6UaLISIjcUauhr3iF6UlbMhF5g8Vn0HXFbC39j0=; b=K8SrgFC3k1Pze4pOS36EiCmG5X
	E4mGhrJh8Tp4MMzIggJmmXSFDZoSRoQqK8ZUoW5YCSL9s//gW2n7gBpJeQTN7vOfD2LUm3mpTdcjL
	DTdVl75NGlZb4DOM8Wve9/AenoFUKmgzoAxcsYqONDoeb7PPUXjOxPipqJ24L4IRLmGatnmIZpg2K
	HOlNGraQ3bkXrLYD9MfaMGh6bgWxWd7JPQwv1bSEkvzLwsfu5SOyXdDbvpO1kezDEFG52JV23LZ25
	KZPTC+yVvXc+uJTxC9FqAeTMucXuRrB9TjfoerWv5xB7Ih77dPE2yMPM9BF4mN/7ksbc1OfszoqR+
	0x9nU15w==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pwKQx-00F95R-HR; Tue, 09 May 2023 10:19:03 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 4B1FF300451;
	Tue,  9 May 2023 12:19:02 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 29A6F20B21BBE; Tue,  9 May 2023 12:19:02 +0200 (CEST)
Date: Tue, 9 May 2023 12:19:02 +0200
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
Subject: Re: [patch v3 08/36] x86/smpboot: Split up native_cpu_up() into
 separate phases and document them
Message-ID: <20230509101902.GV83892@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185217.671595388@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230508185217.671595388@linutronix.de>
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


Again, not really this patch, but since I had to look at this code ....

On Mon, May 08, 2023 at 09:43:39PM +0200, Thomas Gleixner wrote:
> @@ -1048,60 +1066,89 @@ static int do_boot_cpu(int apicid, int c

	/*
	 * AP might wait on cpu_callout_mask in cpu_init() with
	 * cpu_initialized_mask set if previous attempt to online
	 * it timed-out. Clear cpu_initialized_mask so that after
	 * INIT/SIPI it could start with a clean state.
	 */
	cpumask_clear_cpu(cpu, cpu_initialized_mask);
	smp_mb();

^^^ that barrier is weird too, cpumask_clear_cpu() is an atomic op and
implies much the same (this is x86 after all). If you want to be super
explicit about it write:

	smp_mb__after_atomic();

(which is a no-op) but then it still very much requires a comment as to
what exactly it orders against what.


	/*
	 * Wake up a CPU in difference cases:
	 * - Use a method from the APIC driver if one defined, with wakeup
	 *   straight to 64-bit mode preferred over wakeup to RM.
	 * Otherwise,
>  	 * - Use an INIT boot APIC message
>  	 */
>  	if (apic->wakeup_secondary_cpu_64)
> +		return apic->wakeup_secondary_cpu_64(apicid, start_ip);
>  	else if (apic->wakeup_secondary_cpu)
> +		return apic->wakeup_secondary_cpu(apicid, start_ip);
>  
> +	return wakeup_secondary_cpu_via_init(apicid, start_ip);
> +}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
