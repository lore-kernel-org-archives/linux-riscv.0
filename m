Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B02C7EE22
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 11:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N6+yHQLrMqRc1BiiUgUHcRKaxak7e7qKM5anUKJvuGw=; b=iW3kVkZTAnVgsz
	486jxyeptmE/KciAUAMWwTmygdIbwzJGDBCcZA3csVs0YPVM3F6fWr/c90pSOIuoPGoy2u5i4gcXu
	BOKV7lCL3VVGKOu8o60LKEj1Fm3UB5xtONWVc0ve63pdla/DqiZzaVsFQ/tlexjdtpt+86OC+Cz0l
	X0SBOprSOV8dy4elt6lih+WzI6n2U7+35faHyR37LfKM3xAKgkv9Tt6l83gfQV9zr+g5KkQM/aTbB
	WzDFO0wbQP8iAVA/r0pJZDgZTCGxrJHUA1ExL/bOpgSwbNiv+5iccH+oQk4rfOwuDN76lGwzdoC/C
	rbacD8ihWmcO3iOhA8vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwLdU-0039bL-1G;
	Tue, 09 May 2023 11:36:04 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwLdT-0039ah-01;
	Tue, 09 May 2023 11:36:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9uy06VylNOBEAiDOc+c/ggtZsNSxY44p/M1PWpIHlTo=; b=AdPs8XtYEpkR3G25UQ9/ynnaJQ
	yoQ7TJHtTer78qTxQSruGfUSIJdNhTXt+0UcvF9ygN5qgsE6skCGKlKdAU+XGBlszdQLENogWL1pZ
	XLDEoXkr1kINeJ7StBwuvXlWsxIhr3i/RPNAsp79LBG8KMNp3MRdGeYKSudMDFtBS86uE8nzWEe5v
	a8CfaEawnbrmqXklNcksitW8TUN0x1wEip6a7zDZlkdKaRBllociBadnbaExT9c9ou3QCvpRH4AgG
	bSH5gSP2c1D5dxXxDWXZkTYGeRAN4a/hJ1z/YW9bJKB/4Im2NbAtVPF75WnxH6OHWaCKH0GsK31IY
	N6mfY+UQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pwLdH-00678Y-0c;
	Tue, 09 May 2023 11:35:52 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8F613302F3D;
	Tue,  9 May 2023 13:35:48 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6D04F20C342B1; Tue,  9 May 2023 13:35:48 +0200 (CEST)
Date: Tue, 9 May 2023 13:35:48 +0200
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
Message-ID: <20230509113548.GD38236@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.240871842@linutronix.de>
 <20230509110722.GZ83892@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230509110722.GZ83892@hirez.programming.kicks-ass.net>
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

On Tue, May 09, 2023 at 01:07:23PM +0200, Peter Zijlstra wrote:
> On Mon, May 08, 2023 at 09:43:55PM +0200, Thomas Gleixner wrote:
> 
> > +static inline void cpuhp_ap_update_sync_state(enum cpuhp_sync_state state)
> > +{
> > +	atomic_t *st = this_cpu_ptr(&cpuhp_state.ap_sync_state);
> > +	int sync = atomic_read(st);
> > +
> > +	while (!atomic_try_cmpxchg(st, &sync, state));
> > +}
> 
> Why isn't:
> 
> 	atomic_set(st, state);
> 
> any good?

Hmm, should at the very least be atomic_set_release(), but if you want
the full barrier then:

	(void)atomic_xchg(st, state);

is the much saner way to write the above.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
