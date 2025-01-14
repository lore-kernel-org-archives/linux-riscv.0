Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611E6C02183
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 21:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VrbQ9gjTBNO1dCZ98UooveSsHx94gYzHiwYfndUADjs=; b=t8gawAWS6PV9MvTCwy7kAZ+FR7
	XRkA8kYLQxrI7uvilhwrk+1n5CXDRp/t0F7rIf2NftIzWT1cYIiE7CZ68Wv6wuMjIS7sIQSlWgh3Q
	E7Ir2+gGcCGLfXR1OyDKOkBcPVFvKpq6pbTYcSxz6eH66XxA3WjDz/HJsPfQsId5jOf576Hp5Vtxw
	1BdU8q/LjH1TBxq8A+e6vzvcUxbDbD8xxOf/jtLPLdOa4FB/a02kPNZY4elvB/60vuv/Ib/H8WXHH
	hy2/Jd6JK8edMx758AXZIAK4vXNw1n5dAIsIGpT0Nt0/lmrxmTFQ2ekam2byELAwFprCMaVjSAJ3B
	nbS1LbIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXoR9-00000009nsu-09YR;
	Tue, 14 Jan 2025 21:26:59 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXoR6-00000009nrw-05Si
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 21:26:57 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ef79d9c692so15506257a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 13:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736890015; x=1737494815; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V8zpuNawVjToL3i20ZYrbUddkmOaJHAfbCZJnZQ478w=;
        b=fZ3iO33RLS6O01a6AGwjjjmTEOty8Jim1iZCi1rOKBz/oygkMpuEBrp7lBlouUm1RV
         u2fBd8btvh0UeMkHLXZkew4iQ+I61YTQPrUNm3/dG5zfsoKAblDwHfdPkP9WzhMknnZ1
         PEbX4daD/1lbvLBFRC6Z96h9EhWpOPCQpqXfs8k9WM/ZY0wuoiPlMohZRFSRm3m06Os3
         ILNg/eorXKQgS+gAwIVWDkU9ACS7AzQwddw/BwT69Hz7qIkCOKZ2fKyOCO1rdu7R/2xz
         IWW5UywynhRGCbrFVvoIUKPuXs+aWCoSdbRLw7sT4zZiZns6q4uKp+ngpCd0ZxkWFcFb
         e/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736890015; x=1737494815;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V8zpuNawVjToL3i20ZYrbUddkmOaJHAfbCZJnZQ478w=;
        b=wnXUqtw24khTLt9Cv+nl8eufhUMp0CqoXG6BcQuCU0QCDt8r+IIWDwVd1mfldcl/rQ
         IifATb5X+XOpRFojFO5jFOz30RFnqauIuffwYutqjdXNf+a9pqNxg/9XB9tFGa2XsJWR
         ZbOHkh/x8JXCeJrH4sHE7V5KLqx49y3Fm/zZqnZvKuenkDJ9y+YLop0farBdpNEfhexa
         4txCjiz0h43fcXbsbRvt1LeAfkeP8uN1WWP28AJkVnhwP88NOnOsJ0NkfRQNRlHOPRxE
         bo4ocVyoGcQuDhInyIHSeaEeulRu+XWYVcEFUQRJZb0LFwqxQ2jIGZkbnev51V3Cu5Yz
         I0Mw==
X-Forwarded-Encrypted: i=1; AJvYcCUrpBLKY/SwtziG6yAj3QNBJhwNGIetv8j773qmLblYvUOJFSk665mkWad7ZohRG0Z/RIZXaDfkMhHSlw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGrxBYYH0h3UEV18/w9fRfteKaJ5ot5cQqhSHCpsfmKRW4kqMG
	hdq91O/yyXLItC92Qc56t9hqePZrHrJbh8mLMIW2LCUIjYjSYMiO4q56fTGMBshc0a/NpQORg/2
	QNQ==
X-Google-Smtp-Source: AGHT+IGDv4Ej+tMoSohr/AoTazwT/WbetgA7Nr8qE8BLNxmtc1cUUDk0TRGuDLxFKlrZpHzOjZy+L7iCKdA=
X-Received: from pjbsx15.prod.google.com ([2002:a17:90b:2ccf:b0:2ef:8ef8:2701])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:544b:b0:2ee:9902:18b4
 with SMTP id 98e67ed59e1d1-2f548f61fe6mr37131771a91.27.1736890015061; Tue, 14
 Jan 2025 13:26:55 -0800 (PST)
Date: Tue, 14 Jan 2025 13:26:53 -0800
In-Reply-To: <20250114175143.81438-26-vschneid@redhat.com>
Mime-Version: 1.0
References: <20250114175143.81438-1-vschneid@redhat.com> <20250114175143.81438-26-vschneid@redhat.com>
Message-ID: <Z4bWnWYqu1LaD-JG@google.com>
Subject: Re: [PATCH v4 25/30] context_tracking,x86: Defer kernel text patching IPIs
From: Sean Christopherson <seanjc@google.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	virtualization@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, xen-devel@lists.xenproject.org, 
	kvm@vger.kernel.org, linux-arch@vger.kernel.org, rcu@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, bpf@vger.kernel.org, 
	bcm-kernel-feedback-list@broadcom.com, Peter Zijlstra <peterz@infradead.org>, 
	Nicolas Saenz Julienne <nsaenzju@redhat.com>, Juergen Gross <jgross@suse.com>, 
	Ajay Kaher <ajay.kaher@broadcom.com>, Alexey Makhalov <alexey.amakhalov@broadcom.com>, 
	Russell King <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Frederic Weisbecker <frederic@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
	Joel Fernandes <joel@joelfernandes.org>, Josh Triplett <josh@joshtriplett.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Zqiang <qiang.zhang1211@gmail.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Clark Williams <williams@redhat.com>, Yair Podemsky <ypodemsk@redhat.com>, 
	Tomas Glozar <tglozar@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, 
	Mel Gorman <mgorman@suse.de>, Kees Cook <kees@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@infradead.org>, 
	Shuah Khan <shuah@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Rong Xu <xur@google.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Yosry Ahmed <yosryahmed@google.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Jinghao Jia <jinghao7@illinois.edu>, 
	Luis Chamberlain <mcgrof@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_132656_059892_89D4D469 
X-CRM114-Status: GOOD (  11.76  )
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

On Tue, Jan 14, 2025, Valentin Schneider wrote:
>  static __always_inline void arch_context_tracking_work(enum ct_work work)
>  {
>  	switch (work) {
> -	case CT_WORK_n:
> -		// Do work...
> +	case CT_WORK_SYNC:
> +		sync_core();

Not your bug, but serialize() needs to be __always_inline.  Not sure what exactly
caused it to be uninlined, but this is the obvious new usage.

vmlinux.o: warning: objtool: __static_call_update_early+0x4e: call to serialize() leaves .noinstr.text section
vmlinux.o: warning: objtool: ct_work_flush+0x69: call to serialize() leaves .noinstr.text section

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
