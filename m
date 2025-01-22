Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27DC8C02182
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 00:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NLI4P7DGSN+E45xpXsaz2hHo5z4kjsv0uwjWf3P2Uwg=; b=Z70QYBNal4E+qx
	fdcJxHodp8OR5N3DsTsPtPeEizivdba0+8wmJ/4pGdcKxjxGQgk3hChihVvN10pXlJqToQdziFVGW
	1iglrg61PPzF+wSde5O7ndYP3vWUtFk+2U8S/FFPtprNpgfw5IN0/gH1yKzP3FSMOmUMoEj8gUjZe
	DQb5NppovAo8gq3KAD6VQ2Hc36GjMUmvx75w3GKUnmARkT7mlvp9r52IQoKIX3+GHBBNvcdeIIpBf
	Lx1Al05wWw8ThR3I7qla+7G2JISkmqptAbkD2YqBub4KP4getmcZykXy8SZPu6xbNTePw29gF2IZ+
	CClzvA7hBlSevaQ0RB1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taOWO-000000091dV-1VGQ;
	Wed, 22 Jan 2025 00:23:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taOVd-000000091Up-0okf;
	Wed, 22 Jan 2025 00:22:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5B5B6A42598;
	Wed, 22 Jan 2025 00:20:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A0ECC4CEDF;
	Wed, 22 Jan 2025 00:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737505335;
	bh=/jGFli4cvz5GuKwl53vdKodQbbfB6lqGAT1IVg71WEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m6yz2ru+LXXh5xzgW1nRGofBLoFG1mOtZGKi5a///oNnHCh2ZlX7+dcv8uCWMxNTP
	 NYc7Ip5HhxveoM1UG1zbALPWHqlghrr9FWkgxzL4ynzknjr2qzRJNXR0bvmmp0LFhV
	 2OSMqyc+t3WixyaNjJpsZ4FqrFQOpqBUkDbXqnD8oIRzHSRo6BI6S0PtYY51ka7mXT
	 F/aNHCRlDP27nrL0iFxyIILAmTVs3KAxdOxLI4Oy09Y/BLpA3KwnyrjprYZYiv2vA6
	 /XRCO70HAGc/N4UdSrMWqxSo9SxN0390mZcC3+duriCj1eGd6MeQlfVWwQxOpCa2cX
	 9AeBV3eiLnmoQ==
Date: Wed, 22 Jan 2025 01:22:12 +0100
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
Message-ID: <Z5A6NPqVGoZ32YsN@pavilion.home>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-23-vschneid@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250114175143.81438-23-vschneid@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_162217_360512_26DC9D64 
X-CRM114-Status: GOOD (  14.53  )
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

Le Tue, Jan 14, 2025 at 06:51:35PM +0100, Valentin Schneider a =E9crit :
> ct_nmi_{enter, exit}() only touches the RCU watching counter and doesn't
> modify the actual CT state part context_tracking.state. This means that
> upon receiving an IRQ when idle, the CT_STATE_IDLE->CT_STATE_KERNEL
> transition only happens in ct_idle_exit().
> =

> One can note that ct_nmi_enter() can only ever be entered with the CT sta=
te
> as either CT_STATE_KERNEL or CT_STATE_IDLE, as an IRQ/NMI happenning in t=
he
> CT_STATE_USER or CT_STATE_GUEST states will be routed down to ct_user_exi=
t().

Are you sure? An NMI can fire between guest_state_enter_irqoff() and
__svm_vcpu_run(). And NMIs interrupting userspace don't call
enter_from_user_mode(). In fact they don't call irqentry_enter_from_user_mo=
de()
like regular IRQs but irqentry_nmi_enter() instead. Well that's for archs
implementing common entry code, I can't speak for the others.

Unifying the behaviour between user and idle such that the IRQs/NMIs exit t=
he
CT_STATE can be interesting but I fear this may not come for free. You would
need to save the old state on IRQ/NMI entry and restore it on exit.

Do we really need it?

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
