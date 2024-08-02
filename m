Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49018C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Aug 2024 09:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=RJRUTOKxdFG+w06WcHP+fmLuMC/UcUHcKN+iP72y2LU=; b=Huu
	/LRbV8DgEU/ZHZnUoh8sAHp5gKXZSZpy1286J9CV+QlafTkFeTfA+mx+EEUlRiBuHFtQtVBzEQtmw
	P+mathmtGyXXWCXCUeBdqRvVDT/ysrH1mm9LWYTp3G+M02+4TmzbuIV5A1eJ4c/BIgAbTLRsCjbdN
	jMLRRRdE370yhs44WeKxE6YOuAuMoOr3lwZjD40LRFbtPEu0G+Sny+t1Jit2yEusjCFrV6HNkjklF
	1JN4vdOs6oc7OZ33UJqVg+4+PL8ydO+zUx6UBH5xSY3UE6e3H00bASY8U1S9gVJBkfkl7oaQ0GlCp
	XpTyCObxTRW3RHjr7w4rVMyFqKmb+jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZoeV-00000008I9h-3Ood;
	Fri, 02 Aug 2024 09:32:47 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZodf-00000008Hxt-1CIP
	for linux-riscv@lists.infradead.org;
	Fri, 02 Aug 2024 09:32:46 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e035949cc4eso12889595276.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Aug 2024 02:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722591113; x=1723195913; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RB3WNrleQAM+G8VZ5UON6+iAnj1EW7T948JJOLSla1M=;
        b=QOFnyTm58kQhvo2LwIEhs6EQIlI4dJov5C0N0WqKJ9w5xy7BT/6CmNYUeP5ZF43H0j
         tPCnHICkiZat3I/tUXMKk+506+91RJbFiRRYZd1xdr019F3bWBMmDKOQjJRK4EMO7U92
         SxGK0c+F3r5E0NDgarWgnDYfquSCvw5RmciOIfNpG49q7cfR7lkVp1JKm3l4k/ebPny5
         3iZj53jrOH3sUmzsvoT801aKqQp27ETsHo8hVc466GUFxjB+BMIctWtPr2AW/euQo7vL
         b9pNPfVjvP5SJ9Uq/Q3SjrJHJt/MduPhZDiJ3XjbfUDY+V+jjZkzwn0hJh6P3igaFm4R
         KnhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722591113; x=1723195913;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RB3WNrleQAM+G8VZ5UON6+iAnj1EW7T948JJOLSla1M=;
        b=A/5TyySLuAVosJ0+LewcFiShT8UCllCLr/qdY8OnJ1tJxgean4m23lCutA5Hk8p3zq
         KQ2tFK2ZrwXTk6JwzcCEyLv/Xi8qiTeRPPmQA1Uk4Oejsipt3md0MmjV1PJIJccCzYXG
         x6sCw4R2bq98GJKy53NRLn3mK9mEvPkcnu6F91uz9B5YJOMxhr/rCh+4SCLRipnJTnZJ
         c9SRXz10aEzYEk/o+8aoTKNBZfaT1lzjxhcDlV3KRsPZF1hIzv9XsyYwCDmAaTQpqLr1
         k+j1s6zEg9dHQsf8WW/QDl1tq+CWAC9Vw9NW/aE0kv/POxen7V1exroy+JKXNwRNraFh
         fY4A==
X-Forwarded-Encrypted: i=1; AJvYcCUZ9eXn7vAPiVpj9wUfdaoisYJDxZ7ijJ5GMQfT9Uu9wf/Rq/beeBy6Ej5ohpuPHgDE9o373PqWb0fnwx9GnWSn2XRiwl1Oeh/ejzLVBhGA
X-Gm-Message-State: AOJu0YwEjtA0kIZjRYBhj++2jsYg6c9sgK9OMx/yYCBCuF/peJoBc37t
	U/wRHIUaw+Rp72Wl789wFrf8kMLI3COdJcK5dMLXxR7ygJw8qobs2Fhuq6LndNZWEnlDkdhsJ3G
	fPrx5n03tKzsTjQ==
X-Google-Smtp-Source: AGHT+IH2SpPyciT6fSHCADXNwAw+3O5Dddl/hDZQ/ZAbwThOiynggNtR8Jb6ii0WHgf1CQZJNfb+sDHyDgWAtjU=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a05:6902:2b8f:b0:dfb:b4e:407a with SMTP
 id 3f1490d57ef6-e0bde42f736mr101860276.9.1722591113252; Fri, 02 Aug 2024
 02:31:53 -0700 (PDT)
Date: Fri, 02 Aug 2024 09:31:26 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAG6nrGYC/23MSwqDMBSF4a1Ixk3JTXJ9dNR9lA4SvWqgNRJFW
 sS9NzpS7PAc+P6ZDRQcDeyWzCzQ5AbnuzjwkrCyNV1D3FVxMymkFqlI+RhMSb133cgVEKAtBOk
 MWAR9oNp9ttjjGXfrhtGH79aeYH3/ZibggqeIkMrM1gj23njfvOha+jdbO5PcWRAHK6OtDVlT5 WAV4smqnZVwsCragrQmIiNtfrZ6b/OD1dEqVBVKZYoSjnZZlh9hikQHWQEAAA==
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5489; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Lq8/8nOedBDzGVATWs1OYBNxhNXFDJ3hob4IMvf7KlE=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmrKd5qxNN60MM9Isjj5Ozq2KvtpES0WddiLx4u
 o/HqJe9DzyJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZqyneQAKCRAEWL7uWMY5
 Rif5D/4/vw17knMOrEm4mmFX3Sfx6OQs0LSlcl21lcHjy6j3fghqzlcApxtxBOUw1QLNf1ftRy/
 GoW1KcNfX/5rPYP3S6hA6Sz2cDxKENAMFnDnPgYFO3A1w959iOSTq4VUtp4VHEKditqFinhmWAs
 rkcZsorqa8vMgsehYSiH0eaLBX//u85RKWrYXdfKcw0S4hRTPN9okvD15zNuWsrAJEw5ONgjWly
 VZ7Y2NZpMKcpb8qUoO+xRAEgqW9jq5OoQ4HWhmBCPV9RDBEH0tI0v+BGOlfXXL8dJ7HU00mpM+7
 OnTclmtrDRfCTV2TMIzvtYbP/XKQJJeYNe03zFKg9RQ/khmeoaaawzd3pgizqlLu5H8MXGEYpMV
 6oSfZvXuQJjBafgtG6tPSjibHd5K1yNHsf3BjAoBLRT7qPTxo/UZREVafvywDqnDMdKCw0FBvZp
 NILBX/3fD0duKMlB4eGkX0Lf6P7UwiH2gdD7tdSH0TT3Pc+XK3FrD0P0KoBsRNs/3pWIWD+fOGV
 RBzogcxgZ3Q0vcciS3ftotHwRi7RjKDdO1wQ9A43xdZIb9ZQ7NKJGghX3RjbpSAhhsWCG/feTpQ
 issvvAxk6x4/DXDsJW38TzatdwnTLsCuvTJxTBJqF/Omh4BMZgjbN2Xd4fY2z+/hz3w3f6zSMCt EjNDWJ8TKpPsG4g==
X-Mailer: b4 0.13.0
Message-ID: <20240802-tracepoint-v5-0-faa164494dcb@google.com>
Subject: [PATCH v5 0/2] Tracepoints and static branch in Rust
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
	Alice Ryhl <aliceryhl@google.com>, WANG Rui <wangrui@loongson.cn>, 
	Carlos Llamas <cmllamas@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240802_023155_382705_DCC7BD0E 
X-CRM114-Status: GOOD (  26.17  )
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
Alice Ryhl (2):
      rust: add static_key_false
      rust: add tracepoint support

 arch/arm64/include/asm/jump_label.h      |  1 +
 arch/loongarch/include/asm/jump_label.h  |  1 +
 arch/riscv/include/asm/jump_label.h      |  1 +
 arch/x86/include/asm/jump_label.h        |  1 +
 include/linux/tracepoint.h               | 22 +++++++++++++-
 include/trace/define_trace.h             | 12 ++++++++
 rust/bindings/bindings_helper.h          |  1 +
 rust/kernel/arch/arm64/jump_label.rs     | 34 ++++++++++++++++++++++
 rust/kernel/arch/loongarch/jump_label.rs | 35 +++++++++++++++++++++++
 rust/kernel/arch/mod.rs                  | 24 ++++++++++++++++
 rust/kernel/arch/riscv/jump_label.rs     | 38 +++++++++++++++++++++++++
 rust/kernel/arch/x86/jump_label.rs       | 35 +++++++++++++++++++++++
 rust/kernel/lib.rs                       |  3 ++
 rust/kernel/static_key.rs                | 32 +++++++++++++++++++++
 rust/kernel/tracepoint.rs                | 49 ++++++++++++++++++++++++++++++++
 scripts/Makefile.build                   |  2 +-
 16 files changed, 289 insertions(+), 2 deletions(-)
---
base-commit: 8400291e289ee6b2bf9779ff1c83a291501f017b
change-id: 20240606-tracepoint-31e15b90e471

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
