Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC7CC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 11:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=NDVI1nA29hTlVB5spNWT6A+ZqS+7Dqo73gQVnSPR8Ig=; b=SY6
	zlxujzHxqyRBQjfKc07BYY3m2apOux6Cgi6LUHuiii8Y9MaOmZOkH+/X48uUxSktdxODY2mf9t3qa
	RUHKmttNBEqs/ZVg0nzMHAcSDyKtkMYfaxJWTb5Kgdtvj4+DqM3d4MQBo9deRSakMKvkyp/GwBkH9
	5/xbHuV4kJlPm06qHV5eNoXaeBA3MXmK5BZTARmCJb8zfh1xOhA0txL5ZDdY5/DjnGj5XHWPqp/1B
	AE93E2EdgqN9HBc6LXPxC4QVstEymOWueVHQqB5pe+5riav+YF2SpZVfeoLAgu+uF2IrQXRuOSOso
	zC4sqhsrO9gAKXDyx9p5RRFP9UytBAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seuoj-0000000ChOD-1peE;
	Fri, 16 Aug 2024 11:08:25 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seuoe-0000000ChML-2z8W
	for linux-riscv@lists.infradead.org;
	Fri, 16 Aug 2024 11:08:22 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e02a4de4f4eso3181926276.1
        for <linux-riscv@lists.infradead.org>; Fri, 16 Aug 2024 04:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1723806498; x=1724411298; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GBSVjeF7/vjpC1dXeVG0LVGAvDGvE8sdoN+9xc5O6HU=;
        b=ksphJW+tSE5/8hZ85MUSzxrfCQ0cImPFKyb/fmPZIYzb2K5dILbQYEHDbkJ03g3ajM
         v3OlgxE2aLato/oifRVhw3+UjnJJVknClcsvd0UcycMmu2ZPPFwoSykVYDxt4j8IHrD8
         x50FIv/JHKrLhZPCZPIsNc1TRGhI1DTUIq+FrLwXicKsCs2DAPUJge7gHvHwjBY6xeF9
         +3k/cdM17+ybEB4RCmVJ3XYy/CTTtSv5IZqE5i0z9QLTDF7uadje99IW5qtgVF0IM8g+
         qQm08SjPEN30o75xPN2sikcPdEkgawTiupAmf4wrThfKB8iWOFvHDv+yRa2aR72/5Do3
         NAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723806498; x=1724411298;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GBSVjeF7/vjpC1dXeVG0LVGAvDGvE8sdoN+9xc5O6HU=;
        b=DWgSySRcwlxRjpICieKaSMO0ztGVfTB7tpmyhCqUuqHzoFhpeRonmFARHI3ysI/QEI
         v2jhTYIOoV4/oevwhrqfsQBacP/KzbTAy6iBAirPNLL3HZuoYoPYw3sccgws8V7eqkXG
         fRkUz8bc3o+hukj0ygLvjG/KLcinpmRXf+WOxdVO+64fOxT42wPbJPS3BRKtfd5R6aR1
         UsqiXhh6e3baR721nWHXjJvl6pp0gYxDrufXy/xX0WHq4beAFyHaGG7uk092tvPzg1fi
         ZiWkrwg+NAe5s/3TXcDedm3TkJY/R/rO9hmEH9cksXK9bxL0QVLGbrPvShyIVovbuzBQ
         0JcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnJJeWmiu6Q+zGAESc7ZlSImt39kXTCqcG3I7v0fUHExYwYgT/lK6XZo/yK/AAwJkVLtQ/Wa8N6aX2qMYxnsonEhVtFjlvNwsjLnd+ZO3T
X-Gm-Message-State: AOJu0YxY4GVZPD81p0A+1cF9IYQ6xB+L5iUMh5I+VxoxS1mRLfdqu376
	faQW/YcVc4vSMWMqbqTxpcS85R/F2ldVqWqY5YmltKieikrDEQhKYOY/VDGiwJ9IyS8v/puibZH
	jSah/dWOV7C448Q==
X-Google-Smtp-Source: AGHT+IHxFvy1KqAYn0MvS6oUKrhauQESgORV1h/F83xZuq+N5sGLBg0AYPrvpVQZa7Oof89hGa3nC7SROwJGVts=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a5b:c44:0:b0:e0b:cce3:45c7 with SMTP id
 3f1490d57ef6-e1180f5614dmr4437276.9.1723806498310; Fri, 16 Aug 2024 04:08:18
 -0700 (PDT)
Date: Fri, 16 Aug 2024 11:07:37 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPkyv2YC/23PQW7EIAwF0KuMWJcKAyZkVr1H1QUQk0Fqw4hEU
 atR7l4mmwaly2/pfdsPNlNJNLPr5cEKrWlOeaqhe7mwcHPTSDwNNTMppBZGGL4UF+ie07RwBQT
 oe0G6A1bBvVBM33vZ+0fNtzQvufzs3Ss8p//WrMAFN4hgZOcjgn8bcx4/6TXkL/bsWeXBgmisr
 DY68m6w4BXiyaqDldBYVW1PWhORk96erT5a21hdrUI1oFSuD3C2+GetkI3F/WYHRuteD+H8rzn adq+p1kkVrRARwPaN3bbtFzZxMCLRAQAA
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6427; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=4pZVFpJRO3MHz/DoPuIAKSdqaAhQNfTKgM2dcrTjI3I=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBmvzMAqI6madHbK+l0LjW2ZBvrusxLNCk6x5EZ7
 WANKcWB+32JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZr8zAAAKCRAEWL7uWMY5
 Rqn6EACyr/SU1Cs0JgS1mWu3IE4tKJlLJ7t8RzY9m/fnuo+2ZYJ6uHwfQgOsBGxb2JzzwZil4z7
 jO3XGovFP0HdmRKVeByL3LsRh9S97IsqWkqDNK2TIODg1iYw/6CNSEfetZeAdUihQeKi7iIQdhs
 2DGQsWFhgwNsVPCuZOMwM1Gmmw5oFN/KVNyAaNKrVJM7X7qwqUVD8odlBtgfxpFKkoHk6N35L5x
 Ocp3Z6taLtD/DugADvFcAR+MasYiF1AJIkqkaxobWlO8wcPV6eY4BDjtHJoIP+7O/lRitkUlvBP
 qciD6i59r8k9Zc5+BdVGadx8kHWQ74LrdVQTSXgw9VfSCsGmTwew1Zbkh7zqI/oqTjVpHpBee4c
 6WIXRSHmJKmYpdqQbqpfJdpzQNjr6V6eXgHjA1iAQlaLPUXXL7ri3zXOH/t9m9iQ2dtzpMQpiuA
 y37vprsoWs75OBHsiO+uiqdDImGQnvJswCk8ZZpHXqtBMGwIfZkNCy85wKpkavMnXqjOqFvnU8E
 wKcsDU6bbKOdkHJTDs0DDAdCzpB8eFi+wpzSmkh+PK8AQOec7WWRMyvkvfGnFgdj32mwlAsIqQ7
 hmbIzTMzBWI2WzBM5Zxr5jtwcGokL6zADXDbs6N+MXML9wAakwurMhv7SWG9+eB47zHgIcXNm83 Ry8aemcFhD4M8Ug==
X-Mailer: b4 0.13.0
Message-ID: <20240816-tracepoint-v7-0-d609b916b819@google.com>
Subject: [PATCH v7 0/5] Tracepoints and static branch in Rust
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
X-CRM114-CacheID: sfid-20240816_040820_762673_8E92F1FC 
X-CRM114-Status: GOOD (  27.92  )
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

3. Make sure that the header file is visible to bindgen.

4. Use the declare_trace! macro in your Rust code to generate Rust
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
Changes in v7:
- Fix spurious file included in first patch.
- Fix issue with riscv asm.
- Fix tags on fourth patch to match fifth patch.
- Add Reviewed-by/Acked-by tags where appropriate.
- Link to v6: https://lore.kernel.org/r/20240808-tracepoint-v6-0-a23f800f1189@google.com

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
 rust/kernel/arch_static_branch_asm.rs.S |  7 +++
 rust/kernel/jump_label.rs               | 91 +++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs                      | 32 ++++++++++++
 rust/kernel/tracepoint.rs               | 49 ++++++++++++++++++
 samples/rust/Makefile                   |  3 +-
 samples/rust/rust_print.rs              | 18 +++++++
 samples/rust/rust_print_events.c        |  8 +++
 scripts/Makefile.build                  |  9 +++-
 21 files changed, 374 insertions(+), 67 deletions(-)
---
base-commit: 65ae9c6348cc15f77e2ce2ff41c2bb14de9460d6
change-id: 20240606-tracepoint-31e15b90e471

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
