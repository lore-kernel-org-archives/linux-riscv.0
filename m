Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF80606A743
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 13:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ttaBZUl5;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=e+eLpHmH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=LFr1lnGsRXM/ko7MHtBW0aQd9jlI4Asde4NL5K89nDA=; b=ttaBZUl5USryTd90LxZHbqkbFo
	6fmbWS9chLv8VGAPEHEkndEBSAKKI9ss0YrfMv9tmT+KhrajP8NQl/CP/lLnlYp7cMnJTXOWEsiX/
	6fi+wbpU8Gke8k1Mz4SGS5Zf239zjsEeDEYS5gOo8MSRSKB84swC2dqDvBAUAMdr3YJ+uEEHO2RzU
	4Yg7jH6AYQ7IbMooMiIA68j3qXl2QI+MB8JR3GvS+2hOP68R/YfXKkPSI0asTbko+b5u23Qp95Kes
	9JO51d+0K5Jg0YybjNxJqmPbHfj46FjSGOsrVe/XqaVMHD0zaoefuRDT3P8YdJn4vjfM/n5mja7l5
	8Hvn4MXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlsH-000000043KA-3n8g;
	Tue, 10 Nov 2026 13:26:57 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQlsE-000000043JG-2alc
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 13:26:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1794317214; x=1825853214;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=qxIEV334y6g+Esme3fGjY9OI+Q/y/cHPKzSPAq+HTVw=;
  b=e+eLpHmHJX62+fxTmiJiFDDldhGPLNZwe1gjGxsRyalZqpIrkxPp3xL+
   syRCCfZBbN1bZNjaEAOOR98wp2zF65nuJubcSKCsuJYsRvo4p2IjUaODz
   xPzZh2rl0bMIx2RdlL5U7lrs0xoJh0xvDRcyFh/avUdURWMM+XfBQLNss
   Y3Ige0wBptyhkxtjLp+2sLY4nAI28iYXG7J9/V5OpQbeOHr6lo0i1D4oe
   NH7waamv1jEJuwrZcLbNvBi8/n95v2sPtuQLpKobxBTPLKcyErqWQUMwr
   tKmtG1GsEW6XOUUyB9o+W38buN7chYkPOmwRdXkByuk6pTRvCw72NQttc
   g==;
X-CSE-ConnectionGUID: 4y27xc3ASUaU8PslZ4P4WA==
X-CSE-MsgGUID: SX3xVjkUTaaB7Ec/vollpg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 15:22:52 +0200
X-CSE-ConnectionGUID: YORbQvFuRaCxS+lZwqw9qA==
X-CSE-MsgGUID: 8uon9bWISS2zxiLTME+BrQ==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.2])
  by ces01_data.me-corp.lan with SMTP; 10 Nov 2026 15:31:01 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 10 Nov 2026 15:22:50 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v6 0/6] riscv: restrict the ISA used for atomics to avoid
 unsupported or slow AMO
Date: Tue, 10 Nov 2026 15:20:57 +0200
Message-Id: <20261110-lrsc-only-v6-0-bafc3cc0fcae@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADka82oC/22PQQ6CMBBFr0K6tmamtAiuvIdxYctUmgA1rSESw
 t0tbGyMi1n8ybw3+QuLFBxFdi4WFmhy0fkxhepQMNPdxwdx16bMBIgKUADvQzTcj/3MjYFKCmG
 V1sjS/TOQde/ddb2l3Ln48mHe1VO5bXcLpsksU8mBkxGNqbEBq/EyeO16mulo/MA20SS/MALms
 EywJGwBQValLv/AKodVDqsE29ShtuqkBf1+Xtf1A7m7HtYfAQAA
X-Change-ID: 20260120-lrsc-only-cc06422f5bb1
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>, 
 Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Chao-ying Fu <chao-ying.fu@globalfoundries.com>, 
 Conor Dooley <conor.dooley@microchip.com>, torvalds@linux-foundation.org, 
 olof@lixom.net, aleksa.paunovic@htecgroup.com, arikalo@gmail.com, 
 Boqun Feng <boqun@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 Emil Tsalapatis <emil@etsalapatis.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>, 
 Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
 Miguel Ojeda <ojeda@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Boqun Feng <boqun@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Vladimir.Kondratiev@mobileye.com, bpf@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Jonathan Corbet <corbet@lwn.net>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Nam Cao <namcao@linutronix.de>, rust-for-linux@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_052655_121922_97F1071C 
X-CRM114-Status: GOOD (  31.63  )
X-Spam-Score: -4.0 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The A extension is Zaamo (AMO*.w/d) plus Zalrsc (LR/SC). The kernel
requires all of it: -march has "a", atomic_add, bitops, xchg and the
like are AMO instructions, cmpxchg is an LR/SC loop.

This series lets the kernel restrict the ISA it uses for atomics to
Zalrsc, when the toolchain can express that, for CPUs where AMO is
missing or slow. MIPS P8700 [1] traps every AMO instruction into
M-mode and emulates it there. The extension is formally present, but a
typical uncontended atomic increment costs:

  native AMO                                    2..5 cycles
  LR/SC, private L1 reservation monitor        6..12 cycles
  LR/SC, PoC (L2) reservation monitor       about 40 cycles
  AMO emulated by an M-mode trap           about 600 cycles

The last two were measured on Mobileye's eyeq7h, which is built on
this CPU for ADAS and autonomous driving. Kernel atomics are on its
scheduling, memory-management and driver paths, so the emulated AMO
cost is not acceptable there. perf bench on eyeq7h, same tree built
with RISCV_ISA_ZAAMO=y and =n, same userspace, built with LR/SC
atomics in both cases so that only the kernel changes:

                                     ZAAMO=y     ZAAMO=n
  sched messaging, 400 processes     0.653 s     0.536 s    -18%
  futex hash, 24 threads          64131 op/s  79142 op/s    +23%
  futex wake, 24 threads            0.221 ms    0.168 ms    -24%
  futex requeue, 24 threads         0.064 ms    0.036 ms    -44%
  futex lock-pi, 24 threads         435 op/s    478 op/s    +10%

futex wake-parallel swings by an order of magnitude between runs on
both kernels and is left out. With the ZAAMO=y kernel the firmware
counter of emulated instructions, fw_illegal_insn, runs at about
4000 per second per CPU at idle, and at about 85000 per second on
CPU0, where network Rx runs, under iperf3 Rx traffic.

Patch 1 makes kprobes and uprobes reject a probe inside an LR/SC
sequence, where the breakpoint trap drops the reservation and the loop
never completes. Both scan forward from the probed instruction using
the constrained-sequence rules of the ISA. The problem exists today,
since cmpxchg is already LR/SC. The patch is independent of the others
and can be merged on its own.

Patch 2 adds RISCV_ISA_ZAAMO, default y, with no change to the default
build. With it off, -march carries _zalrsc instead of "a" and every
kernel atomic is an LR/SC loop, selected with the preprocessor like
the other ISA options. The loops use the ordering convention of the
existing LR/SC code: lr, sc.rl and a full fence when fully ordered,
lr.aq for acquire, sc.rl for release. The choice is made at compile
time rather than with alternatives, so the many kernels for CPUs with
native AMO do not pay for nop padding at every atomic site. Such a
kernel runs on any hart with A, so there is no NONPORTABLE dependency.
It needs a compiler that accepts _zaamo and _zalrsc in -march, GCC
15.1 or later; TOOLCHAIN_HAS_ZALRSC_ZAAMO keeps the option fixed at y
otherwise. Zabha, Zacas, userspace CFI and Rust emit AMO instructions
and depend on RISCV_ISA_ZAAMO. Zalrsc stays mandatory: cmpxchg, the
conditional atomics and futex CAS are LR/SC sequences. Zaamo plus
Zacas, with CAS loops as on x86, would also provide every atomic and
is left for whoever has such hardware.

Patch 3 makes the boot-time check accept a hart that lists "zalrsc"
alone, or "zaamo" and "zalrsc" instead of "a", when the kernel was
built for that. Userspace sees whatever the hart advertises.

Patch 4 sets A when a hart lists "zaamo" and "zalrsc" instead of "a",
so ELF hwcap and /proc/cpuinfo report the same ISA either way.

Patch 5 makes the BPF JIT emit LR/SC loops when Zaamo is off, so BPF
programs do not trap either.

Patch 6 measures at boot whether an uncontended AMO is faster than the
equivalent LR/SC sequence on each CPU and reports the answer to
userspace through a new hwprobe key, RISCV_HWPROBE_KEY_AMO_PERF, the
way the misaligned access speed is reported. On P8700 it says "slow";
a program or a runtime that can choose then knows to use LR/SC. This
patch is optional. eyeq7h does not need it: it is an embedded platform
whose userspace is built for the hardware, not a generic distribution
that has to find out at run time. It is here for whoever has to run
generic userspace on such a CPU.

How the pieces fit together, with "..." for the rest of -march:

  Hardware AMO  DT, cpuinfo  RISCV_ISA_ZAAMO  Userspace -march
  ------------  -----------  ---------------  ---------------------------
  native        a            y (default)      ...a, unchanged
  native        a            n                ...a; only the kernel
                                              switches to LR/SC
  emulated      a            y                ...a or ..._zalrsc; the
                                              kernel traps on every
                                              AMO. This is today.
  emulated      a            n                ...a runs but traps on
                                              every AMO; ..._zalrsc
                                              does not
  emulated      zalrsc       n (y: hart       ..._zalrsc; ...a still
                             rejected)        runs, slowly
  absent        zalrsc       n (y: hart       ..._zalrsc; ...a dies
                             rejected)        with SIGILL

The kernel expands "a" to zaamo and zalrsc, and with patch 4 folds
the two back into "a", so userspace sees the same ISA in hwcap,
hwprobe and /proc/cpuinfo whether the DT lists "a" or both
sub-extensions. For an emulating CPU the firmware chooses between
"a", which is formally true and keeps every existing binary running,
and "zalrsc" alone, which lets userspace that checks hwcap or hwprobe
know not to use AMO; with patch 6, hwprobe says so in either case.
Nothing in the series depends on the last column:
a kernel built without Zaamo runs userspace built either way. Building
userspace without "a" needs the same GCC 15.1 as the kernel and an
-march that spells out the base, e.g. rv64imfdc_zicsr_zifencei_zalrsc,
since "g" implies "a".

Tested on the eyeq7h hardware running locktorture for a several hours.

Conor Dooley NAKed the v5 Kconfig option [2] on the grounds that
Zalrsc-only hardware does not exist and the kernel should not carry
an option for an emulation workaround. The trailer is kept on patch 2.
The option is for hardware that exists, P8700 based eyeq7h, where the
alternative is a kernel that is unusably slow; the series is small,
compile-time only and leaves the default build untouched.

[1] https://mips.com/products/hardware/p8700/
[2] https://lore.kernel.org/linux-riscv/20261106-smock-headband-d6a7d568c228@spud/

Changes in v6:
- Fully ordered LR/SC loops in atomic_fetch_*, test_and_*_bit, xchg
  and futex are now lr, sc.rl and a trailing fence rw,rw, following
  commit 5ce6c1f3535f ("riscv/atomic: Strengthen implementations with
  fences"), instead of lr.aqrl/sc.aqrl.
- test_and_set_bit_lock uses lr.aq with a plain sc, and
  clear_bit_unlock and xor_unlock_is_negative_byte use a plain lr
  with sc.rl, instead of putting the ordering bit on both.
- Bound the futex LR/SC loop to 128 retries and return -EAGAIN, as
  arm64 does; futex_wake_op() retries.
- RISCV_ISA_ZABHA, RISCV_ISA_ZACAS, RISCV_USER_CFI and
  RUSTC_SUPPORTS_RISCV depend on RISCV_ISA_ZAAMO, since Zabha, Zacas,
  ssamoswap and the Rust target emit AMO instructions.
- Drop RISCV_ISA_ZALRSC and RISCV_ISA_A. The Makefile and the boot
  check key on RISCV_ISA_ZAAMO alone.
- kprobes scan forward with the same constrained-sequence rules as
  uprobes, so an lr without an sc, as in __cmpwait(), no longer
  rejects every later probe in the function.
- Move the probes patch first.
- Bring back the boot-time extension check as patch 3, keyed on
  RISCV_ISA_ZAAMO. A hart may list "zalrsc" alone, or "zaamo" and
  "zalrsc" instead of "a".
- Add patch 4: a hart that lists "zaamo" and "zalrsc" gets A set,
  so hwcap and /proc/cpuinfo match a hart that lists "a".
- Add patch 6: probe AMO speed against LR/SC at boot and report it
  through hwprobe, RISCV_HWPROBE_KEY_AMO_PERF.
- Record Conor Dooley's NAK on patch 2.
- Rewrite the cover letter; add perf bench results and a table of
  hardware, DT, Kconfig and userspace combinations.
- Link to v5: https://patch.msgid.link/20261105-lrsc-only-v5-0-f0648f57b2e1@mobileye.com

Changes in v5:
- Treat Zaamo as supported but slow rather than absent. The hart keeps
  advertising "a" and the kernel keeps accepting it, so the boot-time
  extension check patch is dropped.
- Drop the NONPORTABLE dependency. A kernel built without Zaamo runs
  on any hart that implements A.
- Rename TOOLCHAIN_HAS_ZALRSC to TOOLCHAIN_HAS_ZALRSC_ZAAMO and test
  both _zaamo and _zalrsc in -march.
- Explain why RISCV_ISA_ZALRSC and RISCV_ISA_A exist, and why the
  choice is made at compile time rather than with alternatives.
- Add the BPF JIT patch. Without Zaamo the JIT emits LR/SC loops for
  the BPF read-modify-write atomics on RV32 and RV64, and reserves a
  second exception-table entry for the sc of an arena atomic.
- Reject kprobes and uprobes on lr and sc, and on any instruction
  between them.
- Link to v4: https://patch.msgid.link/20261101-lrsc-only-v4-0-4e1d010463b3@mobileye.com

Changes in v4:
- Require a compiler that accepts _zalrsc in -march before Zaamo can
  be disabled. GCC 15.1 introduces that support. Older compilers keep
  Zaamo enabled and -march keeps "a".
- Link to v3: https://patch.msgid.link/20261026-lrsc-only-v3-0-ec29c8190fb1@mobileye.com

Changes in v3:
- Make Zalrsc mandatory. cmpxchg and the conditional atomics already
  use LR/SC, so RISCV_ISA_ZALRSC can no longer be turned off.
- Check AMO and LR/SC support independently. A kernel that emits both
  requires "a", or both "zaamo" and "zalrsc".
- Put the LR/SC bitop sequence in its own block so two inlined
  set_bit or clear_bit calls compile.
- Remove the LR/SC loop that ran after the hart lottery and accessed
  address 1. Build the lottery increment with add so RV32 assembles.
- Add an exception-table entry for sc as well as lr in the futex
  LR/SC helper.

Changes in v2:
- Switch from a runtime choice of atomic implementation to a
  compile-time one, gated by NONPORTABLE.

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
Vladimir Kondratiev (6):
      riscv: probes: reject probes inside an LR/SC sequence
      riscv: build kernel atomics from LR/SC when Zaamo is disabled
      riscv: accept the atomic extensions this kernel was built with
      riscv: report the A extension when Zaamo and Zalrsc are both present
      riscv, bpf: emit LR/SC loops when Zaamo is disabled
      riscv: hwprobe: report whether AMO is faster than LR/SC

 Documentation/admin-guide/kernel-parameters.txt |   7 +
 Documentation/arch/riscv/hwprobe.rst            |  18 +++
 arch/riscv/Kconfig                              |  49 +++++++
 arch/riscv/Makefile                             |  15 +-
 arch/riscv/include/asm/atomic.h                 |  53 ++++++-
 arch/riscv/include/asm/bitops.h                 |  76 +++++++++-
 arch/riscv/include/asm/cmpxchg.h                |  39 ++++-
 arch/riscv/include/asm/cpufeature.h             |   4 +
 arch/riscv/include/asm/futex.h                  |  58 ++++++++
 arch/riscv/include/asm/hwprobe.h                |   2 +-
 arch/riscv/include/asm/insn-def.h               |   5 +
 arch/riscv/include/asm/insn.h                   |  28 ++++
 arch/riscv/include/uapi/asm/hwprobe.h           |   5 +
 arch/riscv/kernel/Makefile                      |   1 +
 arch/riscv/kernel/amo_speed.c                   | 183 ++++++++++++++++++++++++
 arch/riscv/kernel/cpu.c                         |  23 ++-
 arch/riscv/kernel/cpufeature.c                  |   9 ++
 arch/riscv/kernel/entry.S                       |   7 +
 arch/riscv/kernel/head.S                        |  12 ++
 arch/riscv/kernel/probes/decode-insn.c          |  94 ++++++++++++
 arch/riscv/kernel/probes/decode-insn.h          |   7 +
 arch/riscv/kernel/probes/kprobes.c              |  15 +-
 arch/riscv/kernel/probes/uprobes.c              |  31 ++++
 arch/riscv/kernel/sys_hwprobe.c                 |  37 +++++
 arch/riscv/net/bpf_jit.h                        |   1 +
 arch/riscv/net/bpf_jit_comp32.c                 |  81 ++++++++++-
 arch/riscv/net/bpf_jit_comp64.c                 | 108 +++++++++++++-
 arch/riscv/net/bpf_jit_core.c                   |  29 ++++
 28 files changed, 969 insertions(+), 28 deletions(-)
---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20260120-lrsc-only-cc06422f5bb1

Best regards,
--  
Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
