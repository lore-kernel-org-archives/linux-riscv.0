Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBDE5C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 13:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sMW6UJwxWoYYU1aes/BXO2h3hPN3e4mtDW1wA0menzw=; b=gSORImKOZ42qX6
	0YFSS4GfIEgTtMEuVcNNV7x+YrhqYORcTheiNltWyefPd3pGdxIe+U4n8QcyAYsvcR0QD8s0fpEPS
	ZTkTFNDEuS98hngC6QEZXqd7DBTtLxQWVdOiyOWyHEbL3c/zwZvjr8UBf1FowtbPMKQ571Kyct9JL
	ZfhdULugpuIlFEkDilpE6Aq3mbITDahezjJVASyr5WsnTS0QNt9c2SpK+rAzAdn58Se9tEz6AOPnM
	uQ72a2R93UZ81dDvrWB+dHBBKY7dTl91eG/iDY2CGgXzs2GEgo0j5mktoPisgVdgz8578GbgcXLN0
	1m02ENs8omVUAW76g0cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwNqt-003T6g-26;
	Tue, 09 May 2023 13:58:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwNqs-003T6I-0z;
	Tue, 09 May 2023 13:58:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hI8/gqpI8woXdIossg1TLqD9QGRFHNBoUAZE5mW3mjQ=; b=GG2RnOQApmwDBLG6Gsm3njtVQf
	QxqK9VGUrgp9oG3wZracPmQrcB+PBRcVxw73VjgtK1EMmZyecLmKDRZHvAfJpdPcc5RHZtTaq4xJD
	Mbjqc7jH+sKLynVrQ64G6thUi4zwqh8rCYsg9Lp1iTW79Slo5Qe2L9QpI3n9DvhT3p7bA6TVmgAX9
	8FkXE5EqF+OkD2XK8OFB/cQwLHDQ75opJ0AVpsGCIfoG/ikF4CYJw/Z3nYXvLfqJ6eD5BtnvJz2Bw
	RLxcdIrVYS3ih1v97QwYZHxN2Pa2PpFaGa3IzYQuFTqIQDj8U8Z4tCDPnIp0p0jNTeEO6UhbNFTql
	XWuyju0w==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pwNqk-0069ad-04;
	Tue, 09 May 2023 13:57:54 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 51BE730026A;
	Tue,  9 May 2023 15:57:49 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3402820B08835; Tue,  9 May 2023 15:57:49 +0200 (CEST)
Date: Tue, 9 May 2023 15:57:49 +0200
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
Subject: Re: [patch v3 35/36] x86/smpboot: Support parallel startup of
 secondary CPUs
Message-ID: <20230509135749.GB83892@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185219.176824543@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230508185219.176824543@linutronix.de>
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

On Mon, May 08, 2023 at 09:44:23PM +0200, Thomas Gleixner wrote:
> +	/*  APIC ID not found in the table. Drop the trampoline lock and bail. */
> +	movq	trampoline_lock(%rip), %rax

Again:

	movl	$0, (%rax)

is sufficient for unlock.

> +	lock
> +	btrl	$0, (%rax)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
