Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A439FCCF9F0
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 14:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FvwSnT49e0+2vuwmFyOM6JuMLIWuM/7dcywK93xHuR8=; b=BQc6VDVun/ZBAw
	2bWAo0gCF3a6wWpHhje5nghxO5HcfOJsS35ZW861Pv0rK8U3PRkzK7U7pIMG6taV+Uca+6ltaEtXr
	q4+Dd08/9H3xnjfZCLdtgETqusLJ1oOzo1GYS1ufLVyHfjPSAn0iBBKCQ+7QBzAk2Tv8XkJFPoVkE
	f7smGZb6LKlVXxmFuYSmJ8zZsLUUGlJNghx7BPROpuelXaYXlAS2P7J62XWWI4fvjK2akHOqr1gM1
	PFUBgMjUfN57CBog2MkBtGYAig9ylKSyfYheMnXvPCAVG3Pxyr95FT9UfNZRldky7iHT5zCEJor10
	MYxBz/TYPsEGmCkSqaLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7U5-00000001ebF-3wy1;
	Wed, 29 Oct 2025 14:49:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE7U3-00000001eaT-3TYb;
	Wed, 29 Oct 2025 14:49:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A44E661E65;
	Wed, 29 Oct 2025 14:49:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA588C4CEF7;
	Wed, 29 Oct 2025 14:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761749346;
	bh=HxTqJgI/0X/CEmspyZav8h3FXPWX3qB1qsKFzsoN4as=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tlja5Mq4eRWp697QA/xQ+7a9KJbcnrMdob9cxsXt9OIQA755+bFzbNzRv16bZ4K7i
	 B9LDftZXKO7gStpMqGdXCVrWsVQ+ROKQ4K+QvkxPz38VTj++u90ce6yRHNCsPSi5pD
	 v/JhE3LMKbYoWFWsQEzSVXb3Hm7XB2z8+8xOj7ZC7Xvnlx4rEDqU8ejlyTgLe/T9R2
	 3vUJArOhgOLb46RZqe+pCWQx7olKyL6EJb+OqaocNuhbMh3d/KGFm/ek9z7wlrO99H
	 rF7V3yVMeDSwqgzEw1be+gsJR70/J/KwRrqpNcrj62az9WVQF5F5bIT1qWPQ84EK24
	 yw1IH2IxbPQpw==
Date: Wed, 29 Oct 2025 15:49:03 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, rcu@vger.kernel.org,
	x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mel Gorman <mgorman@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Han Shen <shenhan@google.com>, Rik van Riel <riel@surriel.com>,
	Jann Horn <jannh@google.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Oleg Nesterov <oleg@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Daniel Wagner <dwagner@suse.de>, Petr Tesarik <ptesarik@suse.com>
Subject: Re: [RFC PATCH v6 27/29] x86/mm/pti: Implement a TLB flush
 immediately after a switch to kernel CR3
Message-ID: <aQIpXyX-z8ltB1i5@localhost.localdomain>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <20251010153839.151763-28-vschneid@redhat.com>
 <aQDoVAs5UZwQo-ds@localhost.localdomain>
 <xhsmh3472qah4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <aQHtBudA4aw4a3gT@localhost.localdomain>
 <xhsmhwm4dpzh4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <xhsmhwm4dpzh4.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Le Wed, Oct 29, 2025 at 03:13:59PM +0100, Valentin Schneider a =E9crit :
> On 29/10/25 11:31, Frederic Weisbecker wrote:
> > Le Wed, Oct 29, 2025 at 11:16:23AM +0100, Valentin Schneider a =E9crit :
> >> On 28/10/25 16:59, Frederic Weisbecker wrote:
> >> > Le Fri, Oct 10, 2025 at 05:38:37PM +0200, Valentin Schneider a =E9cr=
it :
> >> >> @@ -171,8 +172,27 @@ For 32-bit we have the following conventions -=
 kernel is built with
> >> >>      andq    $(~PTI_USER_PGTABLE_AND_PCID_MASK), \reg
> >> >>  .endm
> >> >>
> >> >> -.macro COALESCE_TLBI
> >> >> +.macro COALESCE_TLBI scratch_reg:req
> >> >>  #ifdef CONFIG_COALESCE_TLBI
> >> >> +	/* No point in doing this for housekeeping CPUs */
> >> >> +	movslq  PER_CPU_VAR(cpu_number), \scratch_reg
> >> >> +	bt	\scratch_reg, tick_nohz_full_mask(%rip)
> >> >> +	jnc	.Lend_tlbi_\@
> >> >
> >> > I assume it's not possible to have a static call/branch to
> >> > take care of all this ?
> >> >
> >>
> >> I think technically yes, but that would have to be a per-cpu patchable
> >> location, which would mean something like each CPU having its own copy=
 of
> >> that text page... Unless there's some existing way to statically optim=
ize
> >>
> >>   if (cpumask_test_cpu(smp_processor_id(), mask))
> >>
> >> where @mask is a boot-time constant (i.e. the nohz_full mask).
> >
> > Or just check housekeeping_overriden static key before everything. This=
 one is
> > enabled only if either nohz_full, isolcpus or cpuset isolated partition=
 (well,
> > it's on the way for the last one) are running, but those are all niche,=
 which
> > means you spare 99.999% kernel usecases.
> >
> =

> Oh right, if NOHZ_FULL is actually in use.
> =

> Yeah that housekeeping key could do since, at least for the cmdline
> approach, it's set during start_kernel(). I need to have a think about the
> runtime cpuset case.

You can ignore the runtime thing and simply check the static key before rea=
ding
the housekeeping mask. For now nohz_full is only enabled by cmdline.

> Given we have ALTERNATIVE's in there I assume something like a
> boot-time-driven static key could do, but I haven't found out yet if and
> how that can be shoved in an ASM file.

Right, I thought I had seen static keys in ASM already but I can't find it
anymore. arch/x86/include/asm/jump_label.h is full of reusable magic
though.

Thanks.

-- =

Frederic Weisbecker
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
