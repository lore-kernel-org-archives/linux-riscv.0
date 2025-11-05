Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBAECCF9F8
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 17:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b55sGna+qyi5CqGzVXqIoT1gWhOdxwM7WLOy5iFMUE0=; b=e5jmq2wUsg/DnT
	5VE1VdDgfg6i22uwRI3AKLw9/JyJosZbYjo9aR2HQqPnF2jE3mUj47HqJjelVGdO0i4IxtqcW8IzV
	nvGvMlYkWzApI2CuO2Xa21LYFlVakh2NX3V9QBlPlDKt2Qr+hG7LYsbST97Ouv190T/JUl5d0eQQN
	M23rPZNn3HRHQDQ3i4gaRU9/JbiwngpKgTKSyvsXwZUkd3bnG6P+ZglFdoxG2ivF8OluO1SgRgoTM
	iCxqtUXIMTHDeJCLpEC9ZDANdT4CopQ4BlUvfuiKnhBK5EEbVRxjy5DOTaXUTVrUnCdwXl5aydmCl
	rbIgpu4rcEr7vgGTSjGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhad-0000000ECWX-14rN;
	Wed, 05 Nov 2025 17:46:35 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGhaa-0000000ECVy-2Mk6;
	Wed, 05 Nov 2025 17:46:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AF14441943;
	Wed,  5 Nov 2025 17:46:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1533CC4CEF5;
	Wed,  5 Nov 2025 17:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762364791;
	bh=woawi0pKo/kryyYybe6UTBTWMoVsh5qziqijASjnREk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X7Mf6l0akmdIq5iKgqrPQJacdZIwvZNDplWJ7ZFAiTj1m5jo/r4RZiwBnuufL7FJz
	 rvjLuH5kIUsBewW58/KIJ4AtGpjFM65vgcq5Mq40hqFViVaFYaMO3B+3S2DJBgREr8
	 Ydhgli/Ewi5GXUbKU7XplIRtFLKzGALUr+LrfoBKdNnCob1uuo8LERCMDso+bO1Ogb
	 2kFxvq6vNnlZJHsASSZyjiY4DFFHKnlLj9M1sIw8Xs7M5lI6s7rwKH+tP57RLGeYQo
	 I7shlbbDQcR6rzKbVlqZcx0moVDvOcKmF1aICmG6LscQYeQvqFcaYK64Yfrix1vGrk
	 oPe9jn359SAFw==
Date: Wed, 5 Nov 2025 18:46:28 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: Phil Auld <pauld@redhat.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, rcu@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
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
Subject: Re: [PATCH v6 00/29] context_tracking,x86: Defer some IPIs until a
 user->kernel transition
Message-ID: <aQuNdOEmPYkI03my@localhost.localdomain>
References: <20251010153839.151763-1-vschneid@redhat.com>
 <aQDuY3rgOK-L8D04@localhost.localdomain>
 <xhsmhzf9aov51.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <aQJLpSYz3jdazzdb@localhost.localdomain>
 <xhsmh8qgk5txe.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <xhsmh8qgk5txe.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_094632_642562_7AF2B524 
X-CRM114-Status: GOOD (  22.92  )
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

Le Wed, Nov 05, 2025 at 05:24:29PM +0100, Valentin Schneider a =E9crit :
> On 29/10/25 18:15, Frederic Weisbecker wrote:
> > Le Wed, Oct 29, 2025 at 11:32:58AM +0100, Valentin Schneider a =E9crit :
> >> I need to have a think about that one; one pain point I see is the con=
text
> >> tracking work has to be NMI safe since e.g. an NMI can take us out of
> >> userspace. Another is that NOHZ-full CPUs need to be special cased in =
the
> >> stop machine queueing / completion.
> >>
> >> /me goes fetch a new notebook
> >
> > Something like the below (untested) ?
> >
> =

> Some minor nits below but otherwise that looks promising.
> =

> One problem I'm having however is reasoning about the danger zone; what
> forbidden actions could a NO_HZ_FULL CPU take when entering the kernel
> while take_cpu_down() is happening?
> =

> I'm actually not familiar with why we actually use stop_machine() for CPU
> hotplug; I see things like CPUHP_AP_SMPCFD_DYING::smpcfd_dying_cpu() or
> CPUHP_AP_TICK_DYING::tick_cpu_dying() expect other CPUs to be patiently
> spinning in multi_cpu_stop(), and I *think* nothing in the entry code up =
to
> context_tracking entry would disrupt that, but it's not a small thing to
> reason about.
> =

> AFAICT we need to reason about every .teardown callback from
> CPUHP_TEARDOWN_CPU to CPUHP_AP_OFFLINE and their explicit & implicit
> dependencies on other CPUs being STOP'd.

You're raising a very interesting question. The initial point of stop_machi=
ne()
is to synchronize this:

    set_cpu_online(cpu, 0)
    migrate timers;
    migrate hrtimers;
    flush IPIs;
    etc...

against this pattern:

    preempt_disable()
    if (cpu_online(cpu))
        queue something; // could be timer, IPI, etc...
    preempt_enable()

There have been attempts:

      https://lore.kernel.org/all/20241218171531.2217275-1-costa.shul@redha=
t.com/

And really it should be fine to just do:

    set_cpu_online(cpu, 0)
    synchronize_rcu()
    migrate / flush stuff

Probably we should try that instead of the busy loop I proposed
which only papers over the problem.

Of course there are other assumptions. For example the tick
timekeeper is migrated easily knowing that all online CPUs are
not idle (cf: tick_cpu_dying()). So I expect a few traps, with RCU
for example and indeed all these hotplug callbacks must be audited
one by one.

I'm not entirely unfamiliar with many of them. Let me see what I can do...

Thanks.

-- =

Frederic Weisbecker
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
