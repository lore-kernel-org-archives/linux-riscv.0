Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91941C7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 08:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9HuUMXdNuCrh09hSmO3oIrEMYg+9EJCvNxtsUr3TgaY=; b=3guvODG2aXLinp
	lc5V2vkFjzmYbP4rlJSGMRDxWwuT+6IhKjS1Fw8/CCzkX/ExIfYqixW2omMy2/S2q6ahmliFN6q/B
	aM68uzkwkS0Y9j8VS4z5XSuyOEBXLiY4o0ZKS9J82YzkgZbmWn7R2XO/gE5YiIBBRX6Tz2aVChpHX
	8jNSpomwWZ/dJvluWDkEl2ZuInuMFNQlxG6F8nQMU57oLnM7HZ4KthQrfyhhkbZ3sY9oujNV5wbUU
	I9DzfXH953xv6SibJm48phEVnoxYASZNazKKpHf40Rof2fPFkD+hHfSWSxUuDk8g9v+ef57bUCDJW
	xM4k8Cb1oWimRgvIPHGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwfMN-005Yug-0r;
	Wed, 10 May 2023 08:39:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwfMK-005Yto-31;
	Wed, 10 May 2023 08:39:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kxXv2WqVS/N/AXpDGiSycxgzS2fMDzLbIFoszm9gQVI=; b=fruh6dMZerc8uTfAzuh9A7hIbP
	VvgdR1RS3pjBRGcpa6fHyCQvCR0Aq9ej79UowH+YJhhpMQFyqHZlLAYo85qDixs7AYee0NKygZtCT
	6hOzrcLL6lgbJ6CDMnHBTG+URFob7oahukW020DEiWDlSZvO3aCqWhyjd0R6lOQ+0xUt6NrsA7nY+
	t53+xab78Blhuyo9AdcouXah9dFIKssJhlWxI1vvizbNnJh1T+Up3Djmr8Kx45ZXR0w42rN3xa+Wj
	vQG7RFMGQeTTvgV6Pll4zRWoLGjolJBp4/QvccMTRYfaN+G127v+dF7n6q9sjrP5Au/LmGKAAaAB2
	nqiPFvtw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pwfM6-00G6ee-Fz; Wed, 10 May 2023 08:39:26 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 3F365300338;
	Wed, 10 May 2023 10:39:24 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2636720B04BA2; Wed, 10 May 2023 10:39:24 +0200 (CEST)
Date: Wed, 10 May 2023 10:39:24 +0200
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
Message-ID: <20230510083924.GI4253@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185217.671595388@linutronix.de>
 <20230509100421.GU83892@hirez.programming.kicks-ass.net>
 <87fs85z2na.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87fs85z2na.ffs@tglx>
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

On Tue, May 09, 2023 at 10:11:05PM +0200, Thomas Gleixner wrote:
> On Tue, May 09 2023 at 12:04, Peter Zijlstra wrote:
> > On Mon, May 08, 2023 at 09:43:39PM +0200, Thomas Gleixner wrote:
> > Not to the detriment of this patch, but this barrier() and it's comment
> > seem weird vs smp_callin(). That function ends with an atomic bitop (it
> > has to, at the very least it must not be weaker than store-release) but
> > also has an explicit wmb() to order setup vs CPU_STARTING.
> >
> > (arguably that should be a full fence *AND* get a comment)
> 
> TBH: I'm grasping for something 'arguable': What's the point of this
> wmb() or even a mb()?
> 
> Most of the [w]mb()'s in smpboot.c except those in mwait_play_dead()
> have a very distinct voodoo programming smell.

Oh fully agreed, esp. without a comment these things are hugely suspect.
I could not immediately see purpose either.

My arguably argument was about IF it was needed at all, then it would
make more sense to me to also constrain loads. But I'd be more than
happy to see the whole thing go. But perhaps not in this series?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
