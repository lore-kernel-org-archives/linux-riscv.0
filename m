Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F333CC02194
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 18:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3YXLvSb1/xFx3KIK3INVnjslFB2zQeEVY3efu6i2hsg=; b=x4AjEsc4u3Geyd
	J6OJFyBvibtpgetsi9u7WY9vY2tFHyI07IgF/xXMQHujNZp1ZNiPqIU+qBag3OWqjCrUH+OJHj8FZ
	BJ+CDXjKbgY0tXQq1zmRkyPkFObVNLCboJ6XNnBZbxwGpMaIcPSGCSYJOGZCcdkwFG840+PzEK7/v
	9kgm2mYt1upd/L2UMfy6BXF1bjNqe/G35cTzqFIBT/KVmlIuDmpVO2MamMKlXYyPqmhPqoZq2J4bl
	WgaRmBwmHUmONz+r4WAyFyEuj02mH6Ub4mefTy2d7C/xYWR3KW8jFeIFV5cDN7QxHY+0ugvx5zczo
	oAs/nVjx9Dov1iqzwVFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgTFo-0000000Ajy2-2Tky;
	Fri, 07 Feb 2025 18:39:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgTEo-0000000Ajii-0bKB;
	Fri, 07 Feb 2025 18:38:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BA41AA439E4;
	Fri,  7 Feb 2025 18:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4FB8C4CED1;
	Fri,  7 Feb 2025 18:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738953480;
	bh=nKtIeXe1WybNWDzZwu5Tk8fpz5emsmZs04c0W6ceGA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NlQrJCswb2tfBHdOL//Nqi1duhWdmo0hhnvyFyfXR+kDIctwxBbNZGMh0uVXpdrpn
	 VtrsS32dlVeABXURIIGFmPTMZ88JEy/aky3D6z70pfkEKIebKtTmA3OIqxmZ3iDcEH
	 trWQP7mjMuGosKO+a09FIi/HB1+rytKm2YepWGLYPhGRvhc49fQbsTVEVzSz1vy8KY
	 6YWoxRaVR88tPNIw47TXvof69pWZuIN0NCuUntVn/ixzcMSAUzD+pD+us46BW7ocRi
	 X6a7pzBJZI/SEPEJ2Eua3jvdWjb6R21icBFzIt4mEif2XISSYrHb7WAcNTWLbqa0Er
	 f0yIWw7KhrZxA==
Date: Fri, 7 Feb 2025 19:37:57 +0100
From: Frederic Weisbecker <frederic@kernel.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org,
	virtualization@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org,
	xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
	linux-arch@vger.kernel.org, rcu@vger.kernel.org,
	linux-hardening@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com,
	Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Tomas Glozar <tglozar@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Rong Xu <xur@google.com>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Jinghao Jia <jinghao7@illinois.edu>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v4 22/30] context_tracking: Exit CT_STATE_IDLE upon
 irq/nmi entry
Message-ID: <Z6ZTBXUiEOLVcSKp@pavilion.home>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-23-vschneid@redhat.com>
 <Z5A6NPqVGoZ32YsN@pavilion.home>
 <xhsmh5xm0pkuo.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
 <xhsmhbjvdk7kq.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <xhsmhbjvdk7kq.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_103802_305745_249B0591 
X-CRM114-Status: GOOD (  26.48  )
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

Le Fri, Feb 07, 2025 at 06:06:45PM +0100, Valentin Schneider a =E9crit :
> On 27/01/25 12:17, Valentin Schneider wrote:
> > On 22/01/25 01:22, Frederic Weisbecker wrote:
> >> And NMIs interrupting userspace don't call
> >> enter_from_user_mode(). In fact they don't call irqentry_enter_from_us=
er_mode()
> >> like regular IRQs but irqentry_nmi_enter() instead. Well that's for ar=
chs
> >> implementing common entry code, I can't speak for the others.
> >>
> >
> > That I didn't realize, so thank you for pointing it out. Having another
> > look now, I mistook DEFINE_IDTENTRY_RAW(exc_int3) for the general case
> > when it really isn't :(
> >
> >> Unifying the behaviour between user and idle such that the IRQs/NMIs e=
xit the
> >> CT_STATE can be interesting but I fear this may not come for free. You=
 would
> >> need to save the old state on IRQ/NMI entry and restore it on exit.
> >>
> >
> > That's what I tried to avoid, but it sounds like there's no nice way ar=
ound it.
> >
> >> Do we really need it?
> >>
> >
> > Well, my problem with not doing IDLE->KERNEL transitions on IRQ/NMI is =
that
> > this leads the IPI deferral logic to observe a technically-out-of-sync =
sate
> > for remote CPUs. Consider:
> >
> >   CPUx            CPUy
> >                     state :=3D CT_STATE_IDLE
> >                     ...
> >                     ~>IRQ
> >                     ...
> >                     ct_nmi_enter()
> >                     [in the kernel proper by now]
> >
> >   text_poke_bp_batch()
> >     ct_set_cpu_work(CPUy, CT_WORK_SYNC)
> >       READ CPUy ct->state
> >       `-> CT_IDLE_STATE
> >       `-> defer IPI
> >
> >
> > I thought this meant I would need to throw out the "defer IPIs if CPU is
> > idle" part, but AIUI this also affects CT_STATE_USER and CT_STATE_GUEST,
> > which is a bummer :(
> =

> Soooo I've been thinking...
> =

> Isn't
> =

>   (context_tracking.state & CT_RCU_WATCHING)
> =

> pretty much a proxy for knowing whether a CPU is executing in kernelspace,
> including NMIs?

You got it!

> =

> NMI interrupts userspace/VM/idle -> ct_nmi_enter()   -> it becomes true
> IRQ interrupts idle              -> ct_irq_enter()   -> it becomes true
> IRQ interrupts userspace         -> __ct_user_exit() -> it becomes true
> IRQ interrupts VM                -> __ct_user_exit() -> it becomes true
> =

> IOW, if I gate setting deferred work by checking for this instead of
> explicitely CT_STATE_KERNEL, "it should work" and prevent the
> aforementioned issue? Or should I be out drinking instead? :-)

Exactly it should work! Now that doesn't mean you can't go out
for a drink :-)

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
