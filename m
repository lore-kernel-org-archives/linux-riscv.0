Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00400CFD31D
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 10:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=vThg079JxeT0HdfhBHTQUks6oWgWhnhi5ExPLfJxlXI=; b=KgZ
	VNn5j6GDPby3cqssmdgpTj7qD6YiHZQFtXOET/89v5GPx9uoNGpgdTc5fvpoE7qeeGoAE9WBeBZBh
	cTjnmTSFyJqXlomGeOe7EJD6jluvh28liiaWhD6IYWj0uxDBdpiEts2qyF4JWJR7g/kbp2JHEGsFn
	Mj6TfAPZkMR2RAbEPF5ABrjJaZDl6a2FLwZHg8hGLAfSi5mHn2yiOxs3jzM8XkcMKy4GjADyzd59a
	9wPJqlmiL2Irj9Xe0341UV4qz7HPH2caUD9xPKy/w+HH6pJ+b0X7C7gSNZFaGwOSNuP1Hp4bQgnIT
	XtOuA+pIK458Se3hm7XgMS7I26OAveg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szCf4-0000000FvoC-37mJ;
	Fri, 11 Oct 2024 10:14:18 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szCf0-0000000Fvly-2SUz
	for linux-riscv@lists.infradead.org;
	Fri, 11 Oct 2024 10:14:16 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-37d4af408dcso622680f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 11 Oct 2024 03:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728641652; x=1729246452; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YqmLw89kv+70r2n1GZXjvAu/2a/8pOGUjfwht5K81kA=;
        b=Q5tK356yBdYe4mkpD2pg3yz9tEL2vVBVoHv5IMD8/cYXin47dJy7GH5+8HI/3hTEVg
         53OIgKUPpULYGP4ElzXYlkUa+BLTiDZXl9xJKVIoH1J3p9Ke9gJ1jVU8uf1F0TitInZb
         V3VsLPwbAZsg3o2grnroo4V+NhDcVRgH1u6nmlpJBh82LFVqu7qYyqPp+/hpdZym2JGo
         s2/tiftqSTxo3Ru/TYlj3lrcHp8vi2zhAPPHQxVJrfzIWhBJbDg72cP1d1GYonBwbW5+
         eWSsH1UJlzMdil1Q3MMWlaHKMwurnZ++zaowcJtaxLJzpQE8MaL04Kn6ubkw3kFB5APO
         Ew6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728641652; x=1729246452;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YqmLw89kv+70r2n1GZXjvAu/2a/8pOGUjfwht5K81kA=;
        b=WnA2uoo0FToJJ8Ef6aU8iQx2XSWCzplRX/BXEEh80QCbK0brYYmMoEwD28CZHLCLoO
         zdxcp7W+8OENvh25g7bz6IrZISbglbytnNYq/A7jDEXEhXuzn89mFRzBHyrouoxgTFSR
         fpmyre4wn+Qkc+03Nrkex6lLqUms9s+/G6zA6rHbOO3pZCsUsXPhYByy/EwBZt3xsw11
         xt+dq0rAuf3baI9fV1mx+40h46/7WcGvp6QGmUXL1Ym0ql5/dNtWbjt9yGD3Bk01jUDD
         oNHpQa/Q8UEWoAGYzA+MEXbl5q+vqYk1q+t0rzmLK4LQIXtXJw5LJpa5xY8Sai1kYv1X
         wxVw==
X-Forwarded-Encrypted: i=1; AJvYcCX44ACcDzRLaDQ8LrWhfymIbz4hRevTTx55JY2TWlH9dRmWLPJhUkMy/8VK2et/trw94dFSi5gaRxfgZQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOBcEd/W1D3r7aKGEiqeP+uDDbyAO8weGWNWcbaP9NSrtkHLEH
	9QhB0HjCaFXKo819xcDzQmzM6/W7z3HGFO9vHnxBmIqIEEquPrRxCc4ULRDWhSMbOw4sjq4pu0d
	Kg+tjf5FcKzQfRA==
X-Google-Smtp-Source: AGHT+IFtgnpEUW2ZoJRODr8N1xgS5hqcNtu1XqDpceEGhPx4xKUwvMd2IcN0XcaRHW0T1BjDO8MrG3v//BSqW8A=
X-Received: from aliceryhl.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:35bd])
 (user=aliceryhl job=sendgmr) by 2002:a5d:53d0:0:b0:37d:4f54:78b0 with SMTP id
 ffacd0b85a97d-37d54e0a2e0mr1254f8f.0.1728641652009; Fri, 11 Oct 2024 03:14:12
 -0700 (PDT)
Date: Fri, 11 Oct 2024 10:13:33 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAE36CGcC/23QzU6EMBAH8FfZ9Cxmpl+0e/I9jIeWDmwTpRsgR
 LPh3S0clFqPM8nvPx8PNtMUaWbXy4NNtMY5pjEXCE8X1t3cOFATQ24wDlyCBt0sk+vonuK4NAI
 JlbdAskWWwX2iPn4eaa9vub7FeUnT1xG+4t79N2bFBhqtFGre+l6hfxlSGt7puUsfbM9Z+ckiF
 JZn2zvyLhj0QqnKipPlWFiRrSUpichxb2orz9YUVmYrlAiKC2c7rK36tQZ4YdWxs0MtpZWhq+/
 VZ1vO1dk6LnoD0CMaW9n2ZLH8c5tt0GC9Re0N1tacLC93NvvO0CljLek+iMraH4sA5Z9ttuiC8 G1ojftz77Zt3+NIQT2GAgAA
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=5548; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=FP3RovVjR4irGr3jP6vUXxndvpuA7NEv0/txLET0mHQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBnCPpniPeIwqgEuk/wGxh0598bU5Q9DgyAgYKpm
 MX2oWO4t36JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCZwj6ZwAKCRAEWL7uWMY5
 RhWwEACs0OXBFfJtW43IKHvGkXLy+mvxx7t667jbK4AkGgh6baxutrhEOvj5dzw9CiM2vBo8Jo5
 bV84js4+G00haOO8izLKJOR9HIGw3gn3V86/Tm87/cAxN1vwueznoUsWb268jq4Jl9qZgcMp8HC
 h2sk2atFc7Q8TBUkdh9I7zDPb/GNmaVMrGGzDMXN6HKCkGQBs7BJFu58vKRXZxltDuIlTupP4ao
 7EJdMM4Okshvsihp5Gf6ob2WbwRTzngdWXENZIZEX1QiV8ld33m6NeyzV2n75MPCKkbEr4U4xuA
 8CMeRvsAQ/sd9a7J5T0mfF+sGN62NreShpQMUGl76wDXYBHY6OGMgKSg4jZffEXFtQpYFUkuYpy
 7PdYA6bU8keCh54L0O2HJ8bKHPpCB47CffHjVYtYoQ39TZLXfkMtic/+G7+CNApvh9BeXU4/sfm
 LmngShoTXxglA/gvC7EZMNd6kmomEUAPiqHsdPfZzJ2ByEBe/2/LbXKQBw4LO8fHCqFQuyXAn0+
 nHFy1c4klz3yenA9pnhwoWXj6L2ZRJiJM2pRoX1sHwdr76deQ3msQJ7UCPs2VZPK/9mFJb4dZQl
 u6InmXsHrd6AKRU9I4DjFrjDxBoO0eQ7HqrskkvqxBYAsBRtBMQOqpIHdjjd7mVQMLjmMlLbK5H 7hu9n/3xEhnyScw==
X-Mailer: b4 0.13.0
Message-ID: <20241011-tracepoint-v10-0-7fbde4d6b525@google.com>
Subject: [PATCH v10 0/5] Tracepoints and static branch in Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>
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
X-CRM114-CacheID: sfid-20241011_031414_654166_E654C4DF 
X-CRM114-Status: GOOD (  24.92  )
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

This series includes a patch that adds a user of tracepoits to the
rust_print sample. Please see that sample for details on what is needed
to use this feature in Rust code.

This is intended for use in the Rust Binder driver, which was originally
sent as an RFC [1]. The RFC did not include tracepoint support, but you
can see how it will be used in Rust Binder at [2]. The author has
verified that the tracepoint support works on Android devices.

This implementation implements support for static keys in Rust so that
the actual static branch happens in the Rust object file. However, the
__DO_TRACE body remains in C code. See v1 for an implementation where
__DO_TRACE is also implemented in Rust.

Based on top of commit eb887c4567d1 ("tracing: Use atomic64_inc_return()
in trace_clock_counter()") from trace/for-next, which is in turn based
on top of v6.12-rc2.

Link: https://lore.kernel.org/rust-for-linux/20231101-rust-binder-v1-0-08ba9197f637@google.com/ [1]
Link: https://r.android.com/3119993 [2]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Changes in v10:
- Rebase on trace/for-next.
- Use static_branch_unlikely as of [PATCH] tracepoints: Use new static branch API.
- Update second patch as of [PATCH] tracing: Declare system call tracepoints with TRACE_EVENT_SYSCALL.
- Link to v9: https://lore.kernel.org/r/20241001-tracepoint-v9-0-1ad3b7d78acb@google.com

Changes in v9:
- Rebase on v6.12-rc1.
- Add some Reviewed-by tags from Boqun.
- Link to v8: https://lore.kernel.org/r/20240822-tracepoint-v8-0-f0c5899e6fd3@google.com

Changes in v8:
- Use OBJTREE instead of SRCTREE for temporary asm file.
- Adjust comments on `asm!` wrapper to be less confusing.
- Include resolution of conflict with helpers splitting.
- Link to v7: https://lore.kernel.org/r/20240816-tracepoint-v7-0-d609b916b819@google.com

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
      rust: add static_branch_unlikely for static_key_false
      rust: add tracepoint support
      rust: samples: add tracepoint to Rust sample
      jump_label: adjust inline asm to be consistent
      rust: add arch_static_branch

 MAINTAINERS                             |  1 +
 arch/arm/include/asm/jump_label.h       | 14 +++--
 arch/arm64/include/asm/jump_label.h     | 20 ++++---
 arch/loongarch/include/asm/jump_label.h | 16 +++---
 arch/riscv/include/asm/jump_label.h     | 50 ++++++++++--------
 arch/x86/include/asm/jump_label.h       | 39 ++++++--------
 include/linux/tracepoint.h              | 28 +++++++++-
 include/trace/define_trace.h            | 12 +++++
 include/trace/events/rust_sample.h      | 31 +++++++++++
 rust/Makefile                           |  5 +-
 rust/bindings/bindings_helper.h         |  3 ++
 rust/helpers/helpers.c                  |  1 +
 rust/helpers/jump_label.c               | 15 ++++++
 rust/kernel/.gitignore                  |  3 ++
 rust/kernel/arch_static_branch_asm.rs.S |  7 +++
 rust/kernel/jump_label.rs               | 92 +++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs                      | 37 +++++++++++++
 rust/kernel/tracepoint.rs               | 49 ++++++++++++++++++
 samples/rust/Makefile                   |  3 +-
 samples/rust/rust_print.rs              | 18 +++++++
 samples/rust/rust_print_events.c        |  8 +++
 scripts/Makefile.build                  |  9 +++-
 22 files changed, 394 insertions(+), 67 deletions(-)
---
base-commit: eb887c4567d1b0e7684c026fe7df44afa96589e6
change-id: 20240606-tracepoint-31e15b90e471

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
