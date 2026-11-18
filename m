Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB60606A333
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 16:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uN3HebKX;
	dkim=temperror header.d=mobileye.com header.i=@mobileye.com header.a=rsa-sha256 header.s=MoEyIP header.b=bxbyJN/D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3/GqENplgSKTJ2aHPDh3UzbEKHiQ/JUxaAFlEI95KpQ=; b=uN3HebKXmS4RAlK+A74IJw3id2
	gejrdVsSb/oRo3CRvcotXwQigsIrALnCqiGk7ti64atRoY2yhnD6STSWW/XQRT+mZm1F3R9SYFjMn
	kT518Ct6TCt737T1j25feVN7bkRTSnKbJ9Ma2oLQLWOXl8ujkdlfjqPuHJ8Ak5tGljHH3ebYYvQ+h
	HvwgF0SG2nCNRUPPWulrcMmFLdHXIoHlBHu91aVnpP0nafNgmyUjNZrhtT0yjR1gRdOQyJxNxBYz0
	WzYLivGvW6dxcMggWCRzgZJ9O+8gpJUTZPAF6Tm44kFIMwT+wvZRAAnB+kWoR9RfCyHJw45ZCsOyg
	fDttM1lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiSe-00000009SoQ-3owi;
	Wed, 18 Nov 2026 16:24:40 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTiSM-00000009SWi-244Q
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 16:24:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1795019062; x=1826555062;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=yr2kQJNeyn3uaFWqSqXQR1aynTUwhHQ6ShSXTCKHmRc=;
  b=bxbyJN/DcA3SymkzKOOZWlg8Q8+tf0D82Vtzz0bUlWOyCl6NC59Ease4
   hp6o9gFLy05PMt31xlDr0syaWZwfJ3VP+4KXRXMNAPfUXRilpijI0xU+h
   opVlO13YqeE2hUZ0ITfY0oa8T+yhwjFANT1La7+wzL/FiUbXXyrobYMJg
   cUbkQynOX9eF3qjXUhjl88iF2Nu58xoVbhva44QAOErTl5PiSycxS9SIQ
   Oj0nHqMVvj7XD4IbNsLZ1YYMD+J0EHVxC9qxVJNuleokoRgIMSkZtTqOa
   o+XXIzBKAaeSXly6Zxz2+5ntl/IOdXYYhlbqtD0uC7/yCS15qYccrajIe
   Q==;
X-CSE-ConnectionGUID: Yw/ltHEJRrygCHWi3lgHsg==
X-CSE-MsgGUID: kpuP2ZjKSla64HE0EyEVSA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces02_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 18:24:16 +0200
X-CSE-ConnectionGUID: FrFXV3NYTwCT7xQ0UBOVZg==
X-CSE-MsgGUID: ON26Kt2CQbOpeTJvDmw0/A==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.3])
  by ces02_data.me-corp.lan with SMTP; 18 Nov 2026 18:32:30 +0200
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Wed, 18 Nov 2026 18:24:14 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Wed, 18 Nov 2026 18:24:02 +0200
Subject: [PATCH v7 6/6] riscv: hwprobe: report whether AMO is faster than
 LR/SC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261118-lrsc-only-v7-6-602dcf4c1921@mobileye.com>
References: <20261118-lrsc-only-v7-0-602dcf4c1921@mobileye.com>
In-Reply-To: <20261118-lrsc-only-v7-0-602dcf4c1921@mobileye.com>
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
 Randy Dunlap <rdunlap@infradead.org>, 
 Andrew Jones <ajones@ventanamicro.com>, Boqun Feng <boqun@kernel.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Vladimir.Kondratiev@mobileye.com, 
 bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Nam Cao <namcao@linutronix.de>, rust-for-linux@vger.kernel.org, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Jesse Taube <jtaubepe@redhat.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_082424_719227_54919EB6 
X-CRM114-Status: GOOD (  34.30  )
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

On a CPU that traps AMO instructions into firmware and emulates them
there, such as MIPS P8700, an uncontended AMO costs about 600 cycles
where the equivalent LR/SC sequence costs about 40. Userspace built for
the A extension uses AMO for every atomic and pays that on every one.
It cannot tell from the ISA string: such a CPU still has Zaamo, and
correctly so.

Give userspace the same kind of hint the kernel gives for misaligned
access. At boot, time AMO_SPEED_ITERS amoadd.w against the same number
of lr.w/addi/sc.w loops on each CPU, take the best sample from an 8 ms
window of each, and report the result through a new hwprobe key,
RISCV_HWPROBE_KEY_AMO_PERF:

  RISCV_HWPROBE_AMO_FAST         AMO is at least as fast as LR/SC
  RISCV_HWPROBE_AMO_SLOW         LR/SC is faster; use it where possible
  RISCV_HWPROBE_AMO_UNSUPPORTED  the CPU has no Zaamo
  RISCV_HWPROBE_AMO_UNKNOWN      not measured, or differs across CPUs

Only the direction of the difference is reported, not its size: the
question a program can act on is which sequence to pick. Each CPU logs
its ratio, and a kernel whose own atomics are AMO warns once when the
CPU turns out to be slow, pointing at RISCV_ISA_ZAAMO.

The amoadd.w is spelled with .insn through a new AMOADD_W() in
insn-def.h, so the file assembles when -march has no Zaamo, and the
probe is skipped on a CPU whose ISA lacks the extension. CPUs that come
online later are measured by a hotplug callback. amo_speed={slow|fast}
on the command line skips the measurement, as unaligned_scalar_speed=
does; a CPU without Zaamo is reported unsupported either way. The
probe runs at the same initcall level as the misaligned access probe,
for the same reasons, and refreshes the vDSO hwprobe data when done.

Tested on the eyeq7h hardware, with the DT advertising "a":

  [    0.163714] cpu10: AMO speed is 0.07x LR/SC speed (slow)
  [    0.163727] cpu11: AMO speed is 0.07x LR/SC speed (slow)
  [    0.163724] cpu6: AMO speed is 0.07x LR/SC speed (slow)

and, with CONFIG_RISCV_ISA_ZAAMO set:

  [    0.163729] AMO is slow but kernel atomics use it, consider disabling RISCV_ISA_ZAAMO

Reviewed-by: Jesse Taube <jtaubepe@redhat.com>
Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 Documentation/admin-guide/kernel-parameters.txt |   7 +
 Documentation/arch/riscv/hwprobe.rst            |  18 +++
 arch/riscv/Kconfig                              |  13 ++
 arch/riscv/include/asm/cpufeature.h             |   4 +
 arch/riscv/include/asm/hwprobe.h                |   2 +-
 arch/riscv/include/asm/insn-def.h               |   5 +
 arch/riscv/include/uapi/asm/hwprobe.h           |   5 +
 arch/riscv/kernel/Makefile                      |   1 +
 arch/riscv/kernel/amo_speed.c                   | 183 ++++++++++++++++++++++++
 arch/riscv/kernel/sys_hwprobe.c                 |  37 +++++
 10 files changed, 274 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e75344f4e0cd..9bc5baff20ff 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -513,6 +513,13 @@ Kernel parameters
 			Format: <a>,<b>
 			See also Documentation/input/joydev/joystick.rst
 
+	amo_speed=	[RISCV]
+			Format: {slow | fast}
+			Allow skipping the AMO instruction speed test. This is
+			useful for testing alternative code paths and to skip
+			the test in environments where it runs too slowly. All
+			CPUs must have the same AMO speed.
+
 	analog.map=	[HW,JOY] Analog joystick and gamepad support
 			Specifies type or capabilities of an analog joystick
 			connected to one of 16 gameports
diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 63d7ef028bf8..84aef6a0a79c 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -425,3 +425,21 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZA64RS`: The Za64rs extension is supported,
     as defined in the RISC-V Profiles specification starting from commit
     b1d80660 ("Updated to ratified state.")
+
+* :c:macro:`RISCV_HWPROBE_KEY_AMO_PERF`: An enum value describing the
+  performance of the AMO instructions of the Zaamo extension, relative to
+  the equivalent LR/SC sequence, on the selected set of processors.
+
+  * :c:macro:`RISCV_HWPROBE_AMO_UNKNOWN`: The performance of AMO instructions
+    is unknown.
+
+  * :c:macro:`RISCV_HWPROBE_AMO_SLOW`: An uncontended AMO instruction takes
+    longer than the equivalent LR/SC sequence. This is the case when AMO
+    instructions are trapped and emulated by firmware. Code that can choose
+    should use LR/SC.
+
+  * :c:macro:`RISCV_HWPROBE_AMO_FAST`: An uncontended AMO instruction is at
+    least as fast as the equivalent LR/SC sequence.
+
+  * :c:macro:`RISCV_HWPROBE_AMO_UNSUPPORTED`: AMO instructions are not
+    supported, the Zaamo extension is absent.
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 3c3679701a60..dfd6237f879b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -764,6 +764,19 @@ config RISCV_ISA_ZAAMO
 
 	  If you don't know what to do here, say Y.
 
+config RISCV_PROBE_AMO_SPEED
+	bool "Probe AMO instruction speed at boot"
+	default y
+	help
+	  During boot, time an uncontended AMO instruction against the
+	  equivalent LR/SC sequence on every CPU, and report which one is
+	  faster to userspace through the hwprobe syscall, as
+	  RISCV_HWPROBE_KEY_AMO_PERF. On a CPU that traps AMO instructions
+	  into firmware and emulates them there, LR/SC is much faster, and
+	  code that can choose should use it.
+
+	  If you don't know what to do here, say Y.
+
 config TOOLCHAIN_HAS_ZBB
 	bool
 	default y
diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 5efa72823475..92cab4a7a0f1 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -83,6 +83,10 @@ static inline bool unaligned_ctl_available(void)
 }
 #endif
 
+#ifdef CONFIG_RISCV_PROBE_AMO_SPEED
+DECLARE_PER_CPU(long, amo_speed);
+#endif
+
 #if defined(CONFIG_RISCV_MISALIGNED)
 DECLARE_PER_CPU(long, misaligned_access_speed);
 bool misaligned_traps_can_delegate(void);
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 1cc83cecbc05..a7eb17c8180f 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -8,7 +8,7 @@
 
 #include <uapi/asm/hwprobe.h>
 
-#define RISCV_HWPROBE_MAX_KEY		16
+#define RISCV_HWPROBE_MAX_KEY		17
 
 static inline bool riscv_hwprobe_key_is_valid(__s64 key)
 {
diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index 8fcc848c196e..5ca5c0b8ad66 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -219,6 +219,11 @@ ALTERNATIVE("nop", "fence rw, rw", SIFIVE_VENDOR_ID,			\
 	__ASM_STR(.error "hlv.d requires 64-bit support")
 #endif
 
+/* Spelled out so that it assembles when -march lacks Zaamo */
+#define AMOADD_W(dest, addr, val)				\
+	INSN_R(OPCODE_AMO, FUNC3(2), FUNC7(0),			\
+	       RD(dest), RS1(addr), RS2(val))
+
 #define LB_AQ(dest, addr)					\
 	INSN_R(OPCODE_AMO, FUNC3(0), FUNC7(26),			\
 	       RD(dest), RS1(addr), __RS2(0))
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index e6a394fbe7fc..a5f726f94204 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -122,6 +122,11 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICCIF	_BITULL(3)
 #define		RISCV_HWPROBE_EXT_ZICCRSE	_BITULL(4)
 #define		RISCV_HWPROBE_EXT_ZA64RS	_BITULL(5)
+#define RISCV_HWPROBE_KEY_AMO_PERF	17
+#define		RISCV_HWPROBE_AMO_UNKNOWN	0
+#define		RISCV_HWPROBE_AMO_SLOW		1
+#define		RISCV_HWPROBE_AMO_FAST		2
+#define		RISCV_HWPROBE_AMO_UNSUPPORTED	3
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index ebe1c3588177..fc935c877e82 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -79,6 +79,7 @@ obj-$(CONFIG_RISCV_MISALIGNED)	+= traps_misaligned.o
 obj-$(CONFIG_RISCV_MISALIGNED)	+= unaligned_access_speed.o
 obj-$(CONFIG_RISCV_PROBE_UNALIGNED_ACCESS)		+= copy-unaligned.o
 obj-$(CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS)	+= vec-copy-unaligned.o
+obj-$(CONFIG_RISCV_PROBE_AMO_SPEED)	+= amo_speed.o
 
 obj-$(CONFIG_FPU)		+= fpu.o
 obj-$(CONFIG_FPU)		+= kernel_mode_fpu.o
diff --git a/arch/riscv/kernel/amo_speed.c b/arch/riscv/kernel/amo_speed.c
new file mode 100644
index 000000000000..8cd66941c3a6
--- /dev/null
+++ b/arch/riscv/kernel/amo_speed.c
@@ -0,0 +1,183 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Measure whether AMO instructions are faster than the equivalent LR/SC
+ * sequence. They are not on a CPU that traps them into firmware and
+ * emulates them there, such as MIPS P8700, where an AMO costs hundreds of
+ * cycles and LR/SC tens. The result goes to userspace through hwprobe,
+ * so code that can choose between the two knows which one to use.
+ */
+
+#include <linux/cpu.h>
+#include <linux/smp.h>
+#include <linux/timekeeping.h>
+#include <asm/cpufeature.h>
+#include <asm/hwprobe.h>
+#include <asm/insn-def.h>
+#include <asm/timex.h>
+
+/* Time window for each measurement, and atomics per sample within it */
+#define AMO_SPEED_NS		8000000
+#define AMO_SPEED_ITERS		1024
+
+DEFINE_PER_CPU(long, amo_speed) = RISCV_HWPROBE_AMO_UNKNOWN;
+
+static DEFINE_PER_CPU_ALIGNED(u32, amo_speed_word);
+static long amo_speed_param = RISCV_HWPROBE_AMO_UNKNOWN;
+
+static void amo_speed_amo(u32 *word, unsigned long n)
+{
+	unsigned long tmp;
+
+	asm volatile(
+		"1:\n"
+		AMOADD_W(%[tmp], %[word], %[one])
+		"	addi %[n], %[n], -1\n"
+		"	bnez %[n], 1b\n"
+		: [tmp] "=&r" (tmp), [n] "+&r" (n), "+m" (*word)
+		: [word] "r" (word), [one] "r" (1UL)
+		: "memory");
+}
+
+static void amo_speed_lrsc(u32 *word, unsigned long n)
+{
+	unsigned long tmp;
+
+	asm volatile(
+		"1:	lr.w %[tmp], (%[word])\n"
+		"	addi %[tmp], %[tmp], 1\n"
+		"	sc.w %[tmp], %[tmp], (%[word])\n"
+		"	bnez %[tmp], 1b\n"
+		"	addi %[n], %[n], -1\n"
+		"	bnez %[n], 1b\n"
+		: [tmp] "=&r" (tmp), [n] "+&r" (n), "+m" (*word)
+		: [word] "r" (word)
+		: "memory");
+}
+
+/*
+ * For a fixed amount of time, repeatedly run func and take the best time
+ * in cycles as the measurement.
+ */
+static u64 amo_speed_measure(void (*func)(u32 *word, unsigned long n),
+			     u32 *word)
+{
+	u64 start_cycles, end_cycles, cycles = -1ULL;
+	u64 start_ns;
+
+	/* Do a warmup. */
+	func(word, AMO_SPEED_ITERS);
+
+	preempt_disable();
+
+	start_ns = ktime_get_mono_fast_ns();
+	while (ktime_get_mono_fast_ns() < start_ns + AMO_SPEED_NS) {
+		start_cycles = get_cycles64();
+		/* Ensure the CSR read can't reorder WRT to the atomics. */
+		mb();
+		func(word, AMO_SPEED_ITERS);
+		/* Ensure the atomics end before the end time is snapped. */
+		mb();
+		end_cycles = get_cycles64();
+		if ((end_cycles - start_cycles) < cycles)
+			cycles = end_cycles - start_cycles;
+	}
+
+	preempt_enable();
+
+	return cycles;
+}
+
+/*
+ * Settle the speed of one CPU: unsupported without Zaamo, the command
+ * line value if one was given, otherwise measure. Runs on that CPU.
+ */
+static void check_amo_speed(void *unused)
+{
+	int cpu = smp_processor_id();
+	u32 *word = this_cpu_ptr(&amo_speed_word);
+	u64 amo_cycles, lrsc_cycles;
+	long speed;
+	int ratio;
+
+	if (per_cpu(amo_speed, cpu) != RISCV_HWPROBE_AMO_UNKNOWN)
+		return;
+
+	if (!riscv_cpu_has_extension_unlikely(cpu, RISCV_ISA_EXT_ZAAMO)) {
+		per_cpu(amo_speed, cpu) = RISCV_HWPROBE_AMO_UNSUPPORTED;
+		return;
+	}
+
+	if (amo_speed_param != RISCV_HWPROBE_AMO_UNKNOWN) {
+		per_cpu(amo_speed, cpu) = amo_speed_param;
+		return;
+	}
+
+	amo_cycles = amo_speed_measure(amo_speed_amo, word);
+	lrsc_cycles = amo_speed_measure(amo_speed_lrsc, word);
+
+	/* Don't divide by zero. */
+	if (!amo_cycles || !lrsc_cycles) {
+		pr_warn("cpu%d: rdtime lacks granularity needed to measure AMO speed\n",
+			cpu);
+		return;
+	}
+
+	if (amo_cycles <= lrsc_cycles)
+		speed = RISCV_HWPROBE_AMO_FAST;
+	else
+		speed = RISCV_HWPROBE_AMO_SLOW;
+
+	ratio = div64_u64(lrsc_cycles * 100, amo_cycles);
+	pr_info("cpu%d: AMO speed is %d.%02dx LR/SC speed (%s)\n",
+		cpu, ratio / 100, ratio % 100,
+		speed == RISCV_HWPROBE_AMO_FAST ? "fast" : "slow");
+
+	per_cpu(amo_speed, cpu) = speed;
+
+	if (speed == RISCV_HWPROBE_AMO_SLOW && IS_ENABLED(CONFIG_RISCV_ISA_ZAAMO))
+		pr_warn_once("AMO is slow but kernel atomics use it, consider disabling RISCV_ISA_ZAAMO\n");
+}
+
+static int amo_speed_online_cpu(unsigned int cpu)
+{
+	check_amo_speed(NULL);
+	return 0;
+}
+
+static int __init set_amo_speed_param(char *str)
+{
+	if (!strcmp(str, "slow"))
+		amo_speed_param = RISCV_HWPROBE_AMO_SLOW;
+	else if (!strcmp(str, "fast"))
+		amo_speed_param = RISCV_HWPROBE_AMO_FAST;
+	else
+		return 0;
+
+	return 1;
+}
+__setup("amo_speed=", set_amo_speed_param);
+
+static int __init check_amo_speed_all_cpus(void)
+{
+	if (amo_speed_param != RISCV_HWPROBE_AMO_UNKNOWN)
+		pr_info("AMO speed set to '%s' (%lu) by command line\n",
+			amo_speed_param == RISCV_HWPROBE_AMO_FAST ? "fast" : "slow",
+			amo_speed_param);
+
+	on_each_cpu(check_amo_speed, NULL, 1);
+
+	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:amo_speed",
+				  amo_speed_online_cpu, NULL);
+
+	/* The vDSO was filled before the probe ran; give it the result. */
+	riscv_hwprobe_update_vdso_data();
+
+	return 0;
+}
+
+/*
+ * Same level as the unaligned access probe: after clocksource_done_booting()
+ * so that amo_speed_measure() uses a stable clocksource, but before
+ * rootfs_initcall() enables usermode helpers that can reach hwprobe.
+ */
+fs_initcall_sync(check_amo_speed_all_cpus);
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 2c64a13c5155..32ce3ac8bc4a 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -269,6 +269,39 @@ static u64 hwprobe_misaligned(const struct cpumask *cpus)
 }
 #endif
 
+#ifdef CONFIG_RISCV_PROBE_AMO_SPEED
+static u64 hwprobe_amo(const struct cpumask *cpus)
+{
+	int cpu;
+	u64 perf = -1ULL;
+
+	for_each_cpu(cpu, cpus) {
+		int this_perf = per_cpu(amo_speed, cpu);
+
+		if (perf == -1ULL)
+			perf = this_perf;
+
+		if (perf != this_perf) {
+			perf = RISCV_HWPROBE_AMO_UNKNOWN;
+			break;
+		}
+	}
+
+	if (perf == -1ULL)
+		return RISCV_HWPROBE_AMO_UNKNOWN;
+
+	return perf;
+}
+#else
+static u64 hwprobe_amo(const struct cpumask *cpus)
+{
+	if (!hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZAAMO))
+		return RISCV_HWPROBE_AMO_UNSUPPORTED;
+
+	return RISCV_HWPROBE_AMO_UNKNOWN;
+}
+#endif
+
 #ifdef CONFIG_RISCV_VECTOR_MISALIGNED
 static u64 hwprobe_vec_misaligned(const struct cpumask *cpus)
 {
@@ -345,6 +378,10 @@ static void hwprobe_one_pair(struct riscv_hwprobe *pair,
 		pair->value = hwprobe_vec_misaligned(cpus);
 		break;
 
+	case RISCV_HWPROBE_KEY_AMO_PERF:
+		pair->value = hwprobe_amo(cpus);
+		break;
+
 	case RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE:
 		if (hwprobe_ext0_has(cpus, RISCV_HWPROBE_EXT_ZICBOZ))
 			pair->value = riscv_cboz_block_size;

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
