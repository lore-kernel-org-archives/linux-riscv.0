Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43570C0218B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 13:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Opx8tqc77QRARA4ePDqmeEErIvRivhNaH65GfOo1/14=; b=dJatGCeptFE0nC
	GrlQmryxdOzY+7LLxiua+QxyMOISx4nOUhKQUK6ucNMtsAnvd/MKrKe8wAWmg4U+b8i2Kqg7hXtap
	wjK3OB39wf3C5s+o8TaHpJePmY4mn1DIym2J7a0sYPWMZAVDMSZa4/CdmYNgLho6cS4qUdBcmy9+Y
	p94DOFF6Asm6vzLTkjl0Nh4O9JKvEtqgZXKDuxVtxsUCBASXJ/y+En6Dn0HdREbZVPRmhyqvJh7sX
	GmBk88mskDuJOncyVs0NuTnQwQMwqQC5W9XTneLT0aJuwY0vA6CscSVtHsaQ48IaUM2rnnL09IKek
	fZCF8QnlahuDQGkTPopA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taEkR-000000080sH-3Uw0;
	Tue, 21 Jan 2025 13:56:55 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taEkP-000000080ql-03zB;
	Tue, 21 Jan 2025 13:56:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7F01AA41972;
	Tue, 21 Jan 2025 13:55:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13D92C4CEDF;
	Tue, 21 Jan 2025 13:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737467810;
	bh=MqI6lrWOZQoTFNws7n2UwUgsmLRqEZNZodv6GljplcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=isvlPBsQ7TrI9disQI4ep5AL0JttTMJYCjeOXU0i2Ch/ZJhKtfxYn7noZla1QkDqv
	 en2cxtzrpb+ySn8gOB8ZoZV2S+K1n5H3W3i1NokW2jFX5MYZAQKEGHyjcd+04RPzL6
	 fTPenbokZbubnqvnOZIUv59tCiByEKKxVUoJRCVR2ClnBGXpdDVbmRMbF5RR0kls7U
	 7c4EikX8Q0rBg27nmXW8SWsbwke1FjZREhy6DgcwG1U+Sf6B+2s64Bk1dTdAxFB7Uo
	 aEgg3mljv5NxhaLk6HLG7ru2QC2RXk1FcHRWMYbZ4w1F80Cti9sUorhTjzrFo4+wEW
	 S4aA+5YxpaHVg==
Date: Tue, 21 Jan 2025 14:56:47 +0100
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
	"Paul E . McKenney" <paulmck@kernel.org>,
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
Subject: Re: [PATCH v4 03/30] rcu: Add a small-width RCU watching counter
 debug option
Message-ID: <Z4-nn8snXYyzocQW@localhost.localdomain>
References: <20250114175143.81438-1-vschneid@redhat.com>
 <20250114175143.81438-4-vschneid@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250114175143.81438-4-vschneid@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_055653_187697_6FBFB526 
X-CRM114-Status: GOOD (  14.60  )
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

Le Tue, Jan 14, 2025 at 06:51:16PM +0100, Valentin Schneider a =E9crit :
> A later commit will reduce the size of the RCU watching counter to free up
> some bits for another purpose. Paul suggested adding a config option to
> test the extreme case where the counter is reduced to its minimum usable
> width for rcutorture to poke at, so do that.
> =

> Make it only configurable under RCU_EXPERT. While at it, add a comment to
> explain the layout of context_tracking->state.
> =

> Link: http://lore.kernel.org/r/4c2cb573-168f-4806-b1d9-164e8276e66a@paulm=
ck-laptop
> Suggested-by: Paul E. McKenney <paulmck@kernel.org>
> Signed-off-by: Valentin Schneider <vschneid@redhat.com>
> Reviewed-by: Paul E. McKenney <paulmck@kernel.org>

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
