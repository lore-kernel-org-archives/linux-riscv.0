Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9089C369D9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 19:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ei5ccckxagYR3pmAACyizaoO+BwzwO58Az+Qhq/zpA=; b=JPdqRApS0UsNYF
	UybBCTVCZxjg3wa9OFjBNQQ6brl2l6UvJc3q5OslagilfopbsScAlGDPiz+pbHPaHAYkH4ChuIoBL
	wE25tYrs7E3IsUXabxHmgGs5sIW1Vkw6XaYneCOrMytt/Hmii+1SXpASpKNN9FU8nPP1tYMp5L/oL
	lKgQuOQ6d+lDMEW+cfhz/g+CDZz+8PXyiuDESabG1HAEuxVcVrgXbLkh+SiQWP71VaKlQpiKQHQqc
	yJCa6rLFExA/IHiXoEqhlkoIugPa6KiFKri6R0rVrORhSoY4NwEO6Cy3gOUAanlQsjsebL4FeK7gM
	LQjgtyi8IzosgJ45ytDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uADLR-0000000DpCR-2CN7;
	Wed, 30 Apr 2025 19:43:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uADKH-0000000Doqr-1aqw;
	Wed, 30 Apr 2025 19:42:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 70FD45C4A07;
	Wed, 30 Apr 2025 19:40:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A76CC4CEE7;
	Wed, 30 Apr 2025 19:42:24 +0000 (UTC)
Date: Wed, 30 Apr 2025 15:42:28 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Valentin Schneider <vschneid@redhat.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-perf-users@vger.kernel.org, kvm@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, rcu@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-kselftest@vger.kernel.org,
 bpf@vger.kernel.org, Juri Lelli <juri.lelli@redhat.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>, Josh Poimboeuf
 <jpoimboe@kernel.org>, Daniel Wagner <dwagner@suse.de>, Petr Tesarik
 <ptesarik@suse.com>, Nicolas Saenz Julienne <nsaenz@amazon.com>, Frederic
 Weisbecker <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, Sean Christopherson
 <seanjc@google.com>, Juergen Gross <jgross@suse.com>, Ajay Kaher
 <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.amakhalov@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar
 <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H.
 Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim
 <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa
 <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, Adrian Hunter
 <adrian.hunter@intel.com>, "Liang, Kan" <kan.liang@linux.intel.com>, Pawan
 Gupta <pawan.kumar.gupta@linux.intel.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Jason Baron
 <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen
 <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, Naveen N
 Rao <naveen@kernel.org>, Anil S Keshavamurthy
 <anil.s.keshavamurthy@intel.com>, "David S. Miller" <davem@davemloft.net>,
 Masami Hiramatsu <mhiramat@kernel.org>, Neeraj Upadhyay
 <neeraj.upadhyay@kernel.org>, Joel Fernandes <joel@joelfernandes.org>, Josh
 Triplett <josh@joshtriplett.org>, Boqun Feng <boqun.feng@gmail.com>,
 Uladzislau Rezki <urezki@gmail.com>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Zqiang <qiang.zhang1211@gmail.com>, Vincent Guittot
 <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Kees Cook
 <kees@kernel.org>, Shuah Khan <shuah@kernel.org>, Masahiro Yamada
 <masahiroy@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda
 <ojeda@kernel.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, Rong Xu
 <xur@google.com>, Rafael Aquini <aquini@redhat.com>, Song Liu
 <song@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, Brian Gerst <brgerst@gmail.com>, "Kirill A.
 Shutemov" <kirill.shutemov@linux.intel.com>, Benjamin Berg
 <benjamin.berg@intel.com>, Vishal Annapurve <vannapurve@google.com>, Randy
 Dunlap <rdunlap@infradead.org>, John Stultz <jstultz@google.com>, Tiezhu
 Yang <yangtiezhu@loongson.cn>
Subject: Re: [PATCH v5 00/25] context_tracking,x86: Defer some IPIs until a
 user->kernel transition
Message-ID: <20250430154228.1d6306b4@gandalf.local.home>
In-Reply-To: <019f6713-cfbd-466b-8fb5-dcd982cf8644@intel.com>
References: <20250429113242.998312-1-vschneid@redhat.com>
	<fefcd1a6-f146-4f3c-b28b-f907e7346ddd@intel.com>
	<20250430132047.01d48647@gandalf.local.home>
	<019f6713-cfbd-466b-8fb5-dcd982cf8644@intel.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_124237_500330_1F8C1DD6 
X-CRM114-Status: GOOD (  37.70  )
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

On Wed, 30 Apr 2025 11:07:35 -0700
Dave Hansen <dave.hansen@intel.com> wrote:

> On 4/30/25 10:20, Steven Rostedt wrote:
> > On Tue, 29 Apr 2025 09:11:57 -0700
> > Dave Hansen <dave.hansen@intel.com> wrote:
> >   
> >> I don't think we should do this series.  
> > 
> > Could you provide more rationale for your decision.  
> 
> I talked about it a bit in here:
> 
> > https://lore.kernel.org/all/408ebd8b-4bfb-4c4f-b118-7fe853c6e897@intel.com/  

Hmm, that's easily missed. But thanks for linking it.

> 
> But, basically, this series puts a new onus on the entry code: it can't
> touch the vmalloc() area ... except the LDT ... and except the PEBS
> buffers. If anyone touches vmalloc()'d memory (or anything else that
> eventually gets deferred), they crash. They _only_ crash on these
> NOHZ_FULL systems.
> 
> Putting new restrictions on the entry code is really nasty. Let's say a
> new hardware feature showed up that touched vmalloc()'d memory in the
> entry code. Probably, nobody would notice until they got that new
> hardware and tried to do a NOHZ_FULL workload. It might take years to
> uncover, once that hardware was out in the wild.
> 
> I have a substantial number of gray hairs from dealing with corner cases
> in the entry code.
> 
> You _could_ make it more debuggable. Could you make this work for all
> tasks, not just NOHZ_FULL? The same logic _should_ apply. It would be
> inefficient, but would provide good debugging coverage.
> 
> I also mentioned this earlier, but PTI could be leveraged here to ensure
> that the TLB is flushed properly. You could have the rule that anything
> mapped into the user page table can't have a deferred flush and then do
> deferred flushes at SWITCH_TO_KERNEL_CR3 time. Yeah, that's in
> arch-specific assembly, but it's a million times easier to reason about
> because the window where a deferred-flush allocation might bite you is
> so small.
> 
> Look at the syscall code for instance:
> 
> > SYM_CODE_START(entry_SYSCALL_64)
> >         swapgs
> >         movq    %rsp, PER_CPU_VAR(cpu_tss_rw + TSS_sp2)
> >         SWITCH_TO_KERNEL_CR3 scratch_reg=%rsp  
> 
> You can _trivially_ audit this and know that swapgs doesn't touch memory
> and that as long as PER_CPU_VAR()s and the process stack don't have
> their mappings munged and flushes deferred that this would be correct.

Hmm, so there is still a path for this?

At least if it added more ways to debug it, and some other changes to make
the locations where vmalloc is dangerous smaller?

> 
> >> If folks want this functionality, they should get a new CPU that can
> >> flush the TLB without IPIs.  
> > 
> > That's a pretty heavy handed response. I'm not sure that's always a
> > feasible solution.
> > 
> > From my experience in the world, software has always been around to fix the
> > hardware, not the other way around ;-)  
> 
> Both AMD and Intel have hardware to do it. ARM CPUs do it too, I think.
> You can go buy the Intel hardware off the shelf today.

Sure, but changing CPUs on machines is not always that feasible either.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
