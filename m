Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F9EC3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Aug 2024 17:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=e8rJ7MNAarHMJA3AAAY/9hL5c7vhm5a/Ki5+SPiHueI=; b=zYI
	Fsr/zsznMyCdv24x1H9wFdrU23fjm4qFz0MFut9CVAm/IoSxMQNNibCVvSQXHW+wKe1s3mc8mgCeb
	FYz4Pij5UAhX2cLhyMkrk/cmNLF1jrRgf5WHcUHh2SP9WoPqWZzRGzM1/V9f7c9keMF+zxZMkaSjT
	ORVyqbNHQ11TvazKwGF1xca02o6ojWMZ51dIy1WG3Uil00aJwbquAaZ+x0is6uW7EFtXq9Gt46Iai
	iV2kKv9abVzxenqd+Wzb+y3+teQgMyhaK3q/xRVDuS626bWNlOwXYeQf+Lnbuo4CwEieeAsTkpd1s
	ckUxSfHtqx686z5licFt3J8PgfI+fvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc6re-000000094re-0Qnw;
	Thu, 08 Aug 2024 17:23:50 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc6ra-000000094qD-3PC0
	for linux-riscv@lists.infradead.org;
	Thu, 08 Aug 2024 17:23:48 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-368374dc565so425920f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 08 Aug 2024 10:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723137825; x=1723742625; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0lj5cEaK01DMF+Ts55tD11YdG34VpHT9zpqu9sa/BQA=;
        b=R3lAbh7h/FePL9uoCq8MzqopZvbNjqY1hgD1uJw1LZfcBx5h9U9uMvA50uYb48iASJ
         fnmxACDNgGikP/RE9NF4nrxpuq99UAVF0rhA2Yp3PgTAXCl99Q6r6AuLLWMJGqgexSAO
         l4tyLLCTGjpcCWVrSuozo7z//cFbaygbQpdn+5GGMdUbUtpajDQMwXaKafKoUtWN3Xc5
         y7Orodh5O5sxZ5EqxYLTVtRRkkaSzokcB/vEZ3mYiV80cwehIPw42uNCsYbJKuoWkPuq
         LfWTdP9VFqzXyTqbZ68KZVxVQPprgVi0OqYleSdHqVxxsUL2xfmMqUNeSwudjzv/lSIe
         b/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723137825; x=1723742625;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0lj5cEaK01DMF+Ts55tD11YdG34VpHT9zpqu9sa/BQA=;
        b=OBlVSxWkDCxM16/qSsSy8fi/CCKQkTMoc2BTGloifBgCp7Ad06/GCnE8Ga53Ub4b/h
         8sa3xMVWVbgFK+FMREBaWOUd3S7BWBAI5/eeeDnHCM47rQfvK4HSygqiysuknFNOuauO
         LJ/Nhq92J+3swCPaR9fh/XFruxa+kHOgxy/eVB8h2ap5X7RYxZAVakgW3kd8x+tmSWPR
         yXvtbn0+10ig1YJ/UjiuRGcFcQ0kzHoo5VgetPZgoWOXeSn+2QqICF2rVAS1n+58mxoi
         Nza/UbcSYN3Ak7Vczdj9pFC74eO1VZiCKGAxdYpdd/x7+Ky2kfteGORXxWexwQiq3CzI
         eqjg==
X-Forwarded-Encrypted: i=1; AJvYcCUt6gcPORriH4Bzk4S4KkszoISuGl4/VdREwJMwYkpcE0ayUmAPAo/IMFTiuHeA6rarrKDNkPnn7YdcBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxcCW0P8AwOkJKjW0qXkqPJWTiQSVxGwb5h30dZHVuX6oDks2rz
	GHI/yoI/G9xiQY8aytAM6x4ueIezPGrtIYplS9ReePQrauaNTlsKmDfyxRdXXk1M5/FHwo2stwQ
	kue8GxrHhe7ka2A==
X-Google-Smtp-Source: AGHT+IFUyUu+65lTZkbGz5xkESYfzEgxbLVm+RbfRwHdwMW5RdJRZNPPWyqzUyct2N0zKQrC5Yb9Bug/AQUUIsY=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:6000:4014:b0:367:9812:b7e3 with SMTP
 id ffacd0b85a97d-36d2758eba5mr4651f8f.12.1723137824521; Thu, 08 Aug 2024
 10:23:44 -0700 (PDT)
Date: Thu, 08 Aug 2024 17:23:36 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABj/tGYC/23PQW7DIBCF4atErEvFDAyxs+o9qi4Ajx2k1kTYs
 hJFvnuJNzVylw/p+zU8xcQ58iQup6fIvMQpprEM+3YS4erGgWXsyhao0CirrJyzC3xLcZylBgb
 yrWJzBlHALXMf71vs86vsa5zmlB9be4HX67+ZBaSSlggsnn1P4D+GlIZvfg/pR7w6C+4sqMpis
 b1j77oGvCY6WL2zCJXVxbZsDDM79M3Rmr1tKmuK1aQ7Qu3aAEdLf7ZRWFnabnZgjWlNF+r/ruv 6CxPXLhWVAQAA
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6191; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=EXrTZ5R7zXGaTHEthIw+hSVSLI3+CtkeI6b60UAGLWU=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmtP8apye15CDPjep8a4sKbnjhVshmQj6bqmEpn
 FY/clEVV4iJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZrT/GgAKCRAEWL7uWMY5
 Rn6pEACJelIjUYMObVtpvs7JKcQ/GkHNHGNbyVCyd2s7wibhbrfX1MYZ22uey8alwOOYoAABCnX
 oVYjkJUUFisP4QR9yOy4cgV+2SPewumv8vEPfIm/46xYfbvkPwM2d4kUJrsFKsJY17ljll2L5br
 IBsGTTcBscKsnI96M1/kBhykao3Ba6wcjc1CKbePG1XNHOwIIwURIMNQP2JltG1syenoCRVbb6J
 UPAKXNYPb+eDt8kNMRBpKzD+q+6aQcDUB5Il2VgQAvhV0B11G0rVkBgJ3UrUOnuIcbpWGhb6wfn
 BEFrvyEk2A2PuDz5QmkBGym1Ts9uEV1/JzQDr6UH1m6Z5jzy3aZ0XrVrkMN0uAxRQxebID41Cok
 6qfFbFF12H4ygvaSrCCcbo9vB4ws2pAOa5G8rsNuqUl67UL8BJzdulss1MieqD3o5JnzLlKhTk2
 UasU3G9XTc2+xzyfmoXvmH6ZWCnKWTxc0D0B5AsH0yxrMdVbW6ymo9GGsAOEyBlbOKEADCCcQuA
 etl5yY6SvHpw69V5tOpSGGot2s6wwZ7JZZ+j/ZpjOTmC6PZNvPdWb3vvS5k1U85231d5zkrH7fm
 hK/wpLZM7TZAtS70qsbbJAda95xy1x1S8DtiMCUgN4/8J6vs3Qe43wguoau5p81BS9fda7sl/aB +AA7X+swvP8JnCw==
X-Mailer: b4 0.13.0
Message-ID: <20240808-tracepoint-v6-0-a23f800f1189@google.com>
Subject: [PATCH v6 0/5] Tracepoints and static branch in Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@samsung.com>
Cc: linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-riscv@lists.infradead.org, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Andrew Morton <akpm@linux-foundation.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>, Carlos Llamas <cmllamas@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_102346_879474_2308F4A1 
X-CRM114-Status: GOOD (  27.90  )
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

An important part of a production ready Linux kernel driver is
tracepoints. So to write production ready Linux kernel drivers in Rust,
we must be able to call tracepoints from Rust code. This patch series
adds support for calling tracepoints declared in C from Rust.

To use the tracepoint support, you must:

1. Declare the tracepoint in a C header file as usual.

2. Add #define CREATE_RUST_TRACE_POINTS next to your
   #define CREATE_TRACE_POINTS.

2. Make sure that the header file is visible to bindgen.

3. Use the declare_trace! macro in your Rust code to generate Rust
   functions that call into the tracepoint.

For example, the kernel has a tracepoint called `sched_kthread_stop`. It
is declared like this:

	TRACE_EVENT(sched_kthread_stop,
		TP_PROTO(struct task_struct *t),
		TP_ARGS(t),
		TP_STRUCT__entry(
			__array(	char,	comm,	TASK_COMM_LEN	)
			__field(	pid_t,	pid			)
		),
		TP_fast_assign(
			memcpy(__entry->comm, t->comm, TASK_COMM_LEN);
			__entry->pid	= t->pid;
		),
		TP_printk("comm=%s pid=%d", __entry->comm, __entry->pid)
	);

To call the above tracepoint from Rust code, you must first ensure that
the Rust helper for the tracepoint is generated. To do this, you would
modify kernel/sched/core.c by adding #define CREATE_RUST_TRACE_POINTS.

Next, you would include include/trace/events/sched.h in
rust/bindings/bindings_helper.h so that the exported C functions are
visible to Rust, and then you would declare the tracepoint in Rust:

	declare_trace! {
	    fn sched_kthread_stop(task: *mut task_struct);
	}

This will define an inline Rust function that checks the static key,
calling into rust_do_trace_##name if the tracepoint is active. Since
these tracepoints often take raw pointers as arguments, it may be
convenient to wrap it in a safe wrapper:

	mod raw {
	    declare_trace! {
	    	/// # Safety
		/// `task` must point at a valid task for the duration
		/// of this call.
	        fn sched_kthread_stop(task: *mut task_struct);
	    }
	}
	
	#[inline]
	pub fn trace_sched_kthread_stop(task: &Task) {
	    // SAFETY: The pointer to `task` is valid.
	    unsafe { raw::sched_kthread_stop(task.as_raw()) }
	}

A future expansion of the tracepoint support could generate these safe
versions automatically, but that is left as future work for now.

This is intended for use in the Rust Binder driver, which was originally
sent as an RFC [1]. The RFC did not include tracepoint support, but you
can see how it will be used in Rust Binder at [2]. The author has
verified that the tracepoint support works on Android devices.

This implementation implements support for static keys in Rust so that
the actual static branch happens in the Rust object file. However, the
__DO_TRACE body remains in C code. See v1 for an implementation where
__DO_TRACE is also implemented in Rust.

Link: https://lore.kernel.org/rust-for-linux/20231101-rust-binder-v1-0-08ba9197f637@google.com/ [1]
Link: https://r.android.com/3119993 [2]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v6:
- Add support for !CONFIG_JUMP_LABEL.
- Add tracepoint to rust_print sample.
- Deduplicate inline asm.
- Require unsafe inside `declare_trace!`.
- Fix bug on x86 due to use of intel syntax.
- Link to v5: https://lore.kernel.org/r/20240802-tracepoint-v5-0-faa164494dcb@google.com

Changes in v5:
- Update first patch regarding inline asm duplication.
- Add __rust_do_trace helper to support conditions.
- Rename DEFINE_RUST_DO_TRACE_REAL to __DEFINE_RUST_DO_TRACE.
- Get rid of glob-import in tracepoint macro.
- Address safety requirements on tracepoints in docs.
- Link to v4: https://lore.kernel.org/rust-for-linux/20240628-tracepoint-v4-0-353d523a9c15@google.com

Changes in v4:
- Move arch-specific code into rust/kernel/arch.
- Restore DEFINE_RUST_DO_TRACE at end of define_trace.h
- Link to v3: https://lore.kernel.org/r/20240621-tracepoint-v3-0-9e44eeea2b85@google.com

Changes in v3:
- Support for Rust static_key on loongarch64 and riscv64.
- Avoid failing compilation on architectures that are missing Rust
  static_key support when the archtectures does not actually use it.
- Link to v2: https://lore.kernel.org/r/20240610-tracepoint-v2-0-faebad81b355@google.com

Changes in v2:
- Call into C code for __DO_TRACE.
- Drop static_call patch, as it is no longer needed.
- Link to v1: https://lore.kernel.org/r/20240606-tracepoint-v1-0-6551627bf51b@google.com

---
Alice Ryhl (5):
      rust: add generic static_key_false
      rust: add tracepoint support
      rust: samples: add tracepoint to Rust sample
      jump_label: adjust inline asm to be consistent
      rust: add arch_static_branch

 MAINTAINERS                             |  1 +
 arch/arm/include/asm/jump_label.h       | 14 +++--
 arch/arm64/include/asm/jump_label.h     | 20 +++++---
 arch/loongarch/include/asm/jump_label.h | 16 +++---
 arch/riscv/include/asm/jump_label.h     | 50 ++++++++++--------
 arch/x86/include/asm/jump_label.h       | 38 ++++++--------
 include/linux/tracepoint.h              | 22 +++++++-
 include/trace/define_trace.h            | 12 +++++
 include/trace/events/rust_sample.h      | 31 +++++++++++
 rust/Makefile                           |  5 +-
 rust/bindings/bindings_helper.h         |  3 ++
 rust/helpers.c                          |  9 ++++
 rust/kernel/.gitignore                  |  3 ++
 rust/kernel/arch_static_branch_asm.rs   |  1 +
 rust/kernel/arch_static_branch_asm.rs.S |  7 +++
 rust/kernel/jump_label.rs               | 91 +++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs                      | 32 ++++++++++++
 rust/kernel/tracepoint.rs               | 49 ++++++++++++++++++
 samples/rust/Makefile                   |  3 +-
 samples/rust/rust_print.rs              | 18 +++++++
 samples/rust/rust_print_events.c        |  8 +++
 scripts/Makefile.build                  |  9 +++-
 22 files changed, 375 insertions(+), 67 deletions(-)
---
base-commit: 58e218fe517eff550f8a6cd5f2179d973b006d10
change-id: 20240606-tracepoint-31e15b90e471

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
