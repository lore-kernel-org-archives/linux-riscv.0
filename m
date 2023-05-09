Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA0B1C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 11:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WZAqkB3aCBGyAh1Zhs1GGsSsiVPHM+DE7rBO0vq7rew=; b=Bu53aGuffvMmTQ
	hH+TdyCxN4zk2VEYh4tJ8/4yInvkHRQ6vk04hGIo6f0V2M7jxDFaW/gx6P2jd0tzsThteGG4AJA5M
	4SP4m1DGYMTw9BDb+RG7xh+XwLtvhMXieiK4AiYnwoksKdz6a0arWL7jL9KvLnkdpN1/ooAqyZxKP
	BFmRCn3EXlVE5CUUdXIa/C5G+Sj3dxcfC8fr6DdWDvofX03c1VcwRhA9zmVR0FaiUlKAxSm0FpK4A
	2ocxd6byh5tWY21lPZHy+AIjV3o+wKz0dfIZvBEEijLm71KHXP0TSI6uPvXH88dXOPwjEhHiiUK0V
	uKBcU0yP+Ze5NMb4+tag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwLBw-0035Zd-0I;
	Tue, 09 May 2023 11:07:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwLBu-0035Yi-0F;
	Tue, 09 May 2023 11:07:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jRJqPjkZDLfU3CkfoL3myLBABJzadgOWoNWDI32Y8LI=; b=vSapig8PT+X9FleUgN3U0CZtui
	relRtn1zPe77P0WIAsoYme9WGw5tkGy2jBjW361caFHw1VfseDENIJEioGXGsAlXDL56EYU9zLoKK
	sYtsAQy08WKeWKCMyQFs1KJSr/OyChBFdzqL/MxK7qab9fpOnk7H5jh5WbiYQN/4wFh+Pj/AmUjtw
	QaFbJledlkQi5f022TKkXoXPhIOBe4yd/n6XLOTCL2wmgcVNokN/6W7o9qCPn/qVvfH0K0rQjHZ6A
	RGMSVi/rBgBEn6a8OS6m8fLIOlG3fUbF/IUlHnmjqIk+2Iwkmd+PWpBK1wBJ3ULFWthvylMJrnGnM
	mBfXf0KA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pwLBl-00FBZV-VA; Tue, 09 May 2023 11:07:26 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 20197300023;
	Tue,  9 May 2023 13:07:23 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 0504E20B0882C; Tue,  9 May 2023 13:07:22 +0200 (CEST)
Date: Tue, 9 May 2023 13:07:22 +0200
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
	"Michael Kelley (LINUX)" <mikelley@microsoft.com>
Subject: Re: [patch v3 18/36] [patch V2 18/38] cpu/hotplug: Add CPU state
 tracking and synchronization
Message-ID: <20230509110722.GZ83892@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.240871842@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230508185218.240871842@linutronix.de>
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

On Mon, May 08, 2023 at 09:43:55PM +0200, Thomas Gleixner wrote:

> +static inline void cpuhp_ap_update_sync_state(enum cpuhp_sync_state state)
> +{
> +	atomic_t *st = this_cpu_ptr(&cpuhp_state.ap_sync_state);
> +	int sync = atomic_read(st);
> +
> +	while (!atomic_try_cmpxchg(st, &sync, state));
> +}

Why isn't:

	atomic_set(st, state);

any good?


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
