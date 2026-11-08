Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2655606A333
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 11:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=MlCoHjfT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=dLktAXPj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8wzjVX3/QdtXjWnMFKx3/V+ll0fGtdBirR1BOJZRBw4=; b=MlCoHjfTjwWWNKaDwe6iAVyY9p
	RS0TeQwUX7UpxBVJ8jWZChaVC8v+zY8PPFD0Ao4vlJ+AExc9h8GEGDniYLw4/M2ZHnHojIhMnBquM
	yt1tx5jCuUgo8MEKnKQTOutaHVECcoLRpDDImOUf5wJSPaGdpKFieawtBJDEI8mY0EhzvAoN1iHec
	zft2+CE1AbzVPgQfj7ONkyQp+vt7S+z8phvdJD8TLOnLdl+iq5Vsq7D+WJ5j0H7IASleKI4/C4XBY
	zI+08pPdVyZ+b6rOMSYl3mFyWMCEqR5Rm4MuBdGkMJVi/XSosiHUZSiJbwVKv6AY0uIS+5JbF+meQ
	6fLVgkew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0iB-0000000G1c7-3m8f;
	Sun, 08 Nov 2026 11:05:23 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ0i8-0000000G1b2-3JS4
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 11:05:22 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-cdb9d5c1c8eso6709a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 03:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794135920; x=1794740720; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UknItJXowOcjQfrYZmm9v6E5iZPTnDdyntGmdyqaylQ=;
        b=dLktAXPjzVAG4Jnm90DgpuAfEiSvcN+8OTtsS9tu8Ipb3e/hBVBhKvsnZvwmxskl65
         XOCGW6Udv1FQ/GnTkDTWDrgShD0OmgA0fY/7C+Drkz7vgUiED3xj97vj4v1HkeM4QmmB
         oBRBcnr5Sf79zY/kZ4Rs71ckfUIh4w1BX5OLUvwO1Z4DsQ1nx/sEnPN4STaDIcNmdkGD
         WfgR1KFKazdUHt+fuOGAocQ9VVV7vcE3O91140m9tZgBQpYSgtX8maysj+S2NijjXpN5
         Y1h37uwDlBEKfR6hsbpD0+Rl+cFJnhCEapCwunZKbWErG/LMlbeBWG9oJXiH7q7agHM0
         sYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794135920; x=1794740720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UknItJXowOcjQfrYZmm9v6E5iZPTnDdyntGmdyqaylQ=;
        b=mMuwjrECMy1MMk+fplmm7vKrtJega6siki/9Y+bCYK4ZowsAyQWXKZt8jVcVXGESHr
         YCmzTpBe3bQAMTykuJ22qbcKBZeWvdB0jGWHw7UJZhdEWEPzQlB5/8q3MfsuUli1nrPA
         JENvARhGfqNv+4HVzOy11OCPoaWiRv5LEkqmFerSAg3Iubw+u0KGNc8dyj4M0y15Kq7p
         /ws4OCgyuG3JFfaIn6YbHcgIDM/FY5XunZ797VIybhN57VIw/tmDlHbfb/o092MjmYWo
         5tXy25B277VsIgOfv3MMU5cm+n1nlUwWNJUkUPsDTklHK84PL4UCHoWXOL5n/aUg5f2n
         VH9g==
X-Forwarded-Encrypted: i=1; AL+hErE5TJwegRRe0JWFmxDY5z5MvnBTMyl6nbA43iSJJukrMVKD+rte8WP/WaRv4fZjXHUdkO4QUWiSx8sIxQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+Tit+q9sGMmozqmFNZHCMk6vN4I7OGRwFIFcrR8m3Yx+1EU4ne
	Skg3NiKwTMKBnIkGhGaYZbUVqErN17S1j8hwJJ4DNixD1jkc7fI+YiTx112BYTgX+aI=
X-Gm-Gg: AYBFou1FYmULdZDXuOLpIxmSpwSAPeb0AIW5NRTVDv8FHUGYO6e9aciU5cVuuqtnVTn
	T0zpB5t8vvWN3qHMaPyYqGtweR2nd/KE5cKsQSzmdtFC7fWvr9xOxZLf8DWUNpF9ZSREOV5m+Rh
	VjAErUtd3WhNGmqi56AIFnh0F69HyDBV3MQGOTxiZL/0K75crpfW53uIZhC98uB4CcWGyhq998a
	hSrh/aQC4pNqUFUptdFBYikYWljTKdO2co52SEUTVQTBV3DsT45EdW6DyIyTfpjWxtvZRXykprE
	RWqi3vL1l8S6uZX7mHqiFZ3dnrGvH0tcn2VItEB9MyP9k0i+k2h10w1fwtyAjX3dpG7jCl99zFZ
	g1YnL57UjwgIuYq5E1Xc7UrnLeLqKVG88VIQwh8lHtmOFP4mnhSj8RkspeIa+1DgNqA4DZANlum
	3e43+I3HuqWTLcJuHRYuDsz2NAbW4P+NVE2Q8DFblJzjpG/ozW4cbfoxdF20zfSd4Gn+GFvFYzP
	odwOhwTeUdaTRqKrWf39Bvc4IORXpIxJcKoMI63mxW4Q9FSimAQwcUvxnG/B2kh7F7ONr3duF/z
	JdFtjmD8lC1Pv7mpmSOxbPQhiBUVbdsrsJOU+yF6/st4eQuvh0MTJJOV+c0U640=
X-Received: by 2002:a17:90b:39cc:b0:3a6:e901:e79b with SMTP id 98e67ed59e1d1-3b12d3e6f4dmr989964a91.15.1794135919750;
        Sun, 08 Nov 2026 03:05:19 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.233])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1278918f4sm2609818a91.6.2026.11.08.03.05.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 08 Nov 2026 03:05:18 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	bjorn@kernel.org,
	pulehui@huawei.com,
	puranjay@kernel.org,
	thuth@redhat.com,
	ajones@ventanamicro.com,
	ben.dooks@codethink.co.uk,
	rkrcmar@ventanamicro.com,
	samuel.holland@sifive.com,
	zong.li@sifive.com,
	conor.dooley@microchip.com,
	tglx@kernel.org,
	debug@rivosinc.com,
	seanwascoding@gmail.com,
	andybnac@gmail.com,
	menglong8.dong@gmail.com,
	cyrilbur@tenstorrent.com,
	wangruikang@iscas.ac.cn,
	atishp@rivosinc.com,
	apatel@ventanamicro.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	arnd@arndb.de,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	morbo@google.com,
	justinstitt@google.com,
	qingfang.deng@siflower.com.cn,
	linux-arch@vger.kernel.org,
	llvm@lists.linux.dev,
	dave@stgolabs.net,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	broonie@kernel.org,
	cuiyunhui@bytedance.com
Subject: [PATCH v9 1/3] riscv: implement this_cpu operations
Date: Sun,  8 Nov 2026 19:04:04 +0800
Message-Id: <20261108110406.97495-2-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20261108110406.97495-1-cuiyunhui@bytedance.com>
References: <20261108110406.97495-1-cuiyunhui@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_030520_857573_04859235 
X-CRM114-Status: GOOD (  15.22  )
X-Spam-Score: -2.1 (--)
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

RISC-V has no asm/percpu.h, so this_cpu_*() read-modify-write
operations use generic implementations that disable local interrupts.

Implement RISC-V-specific this_cpu operations with preemption disabled
to keep accesses on the current CPU. Native-width read-modify-write
operations use relaxed AMOs, while 8-bit and 16-bit read-modify-write
operations use Zabha when available or a local 32-bit LR/SC sequence
otherwise.

Link: https://lore.kernel.org/r/20260826010748.zphu3wh2hlm4t4o2@offworld
Tested-by: Davidlohr Bueso <dave@stgolabs.net>
Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/percpu.h | 569 ++++++++++++++++++++++++++++++++
 1 file changed, 569 insertions(+)
 create mode 100644 arch/riscv/include/asm/percpu.h

diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
new file mode 100644
index 0000000000000..280b122b9fe69
--- /dev/null
+++ b/arch/riscv/include/asm/percpu.h
@@ -0,0 +1,569 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef __ASM_PERCPU_H
+#define __ASM_PERCPU_H
+
+#include <linux/bits.h>
+#include <linux/preempt.h>
+
+#include <asm/alternative-macros.h>
+#include <asm/cmpxchg.h>
+#include <asm/cpufeature-macros.h>
+#include <asm/hwcap.h>
+#include <asm/irqflags.h>
+
+#define PERCPU_RW_OPS(sz)						\
+static inline unsigned long __percpu_read_##sz(void *ptr)		\
+{									\
+	return READ_ONCE(*(u##sz *)ptr);				\
+}									\
+									\
+static inline void __percpu_write_##sz(void *ptr, unsigned long val)	\
+{									\
+	WRITE_ONCE(*(u##sz *)ptr, (u##sz)val);				\
+}
+
+PERCPU_RW_OPS(8)
+PERCPU_RW_OPS(16)
+PERCPU_RW_OPS(32)
+
+#ifdef CONFIG_64BIT
+PERCPU_RW_OPS(64)
+#endif
+
+/*
+ * Use a real destination register instead of x0 even when the result is
+ * unused. Implementations may execute rd=x0 AMOs at a memory controller
+ * without returning the old value to the CPU. Value-returning AMOs are
+ * more likely to execute near the CPU, for example in the L1 cache. This
+ * better suits per-CPU data, which is typically accessed repeatedly by
+ * the same CPU.
+ *
+ * https://lore.kernel.org/r/e7d539ed-ced0-4b96-8ecd-048a5b803b85@paulmck-laptop
+ */
+#define __PERCPU_AMO_OP_CASE(sfx, name, sz, amo_insn)			\
+static inline void							\
+__percpu_##name##_amo_case_##sz(void *ptr, unsigned long val)		\
+{									\
+	u##sz tmp;							\
+									\
+	asm volatile (							\
+		"amo" #amo_insn #sfx " %[tmp], %[val], %[ptr]"	\
+		: [ptr] "+A" (*(u##sz *)ptr), [tmp] "=r" (tmp)	\
+		: [val] "r" ((u##sz)(val)));				\
+}
+
+__PERCPU_AMO_OP_CASE(.w, add, 32, add)
+__PERCPU_AMO_OP_CASE(.w, and, 32, and)
+__PERCPU_AMO_OP_CASE(.w, or, 32, or)
+
+#ifdef CONFIG_64BIT
+__PERCPU_AMO_OP_CASE(.d, add, 64, add)
+__PERCPU_AMO_OP_CASE(.d, and, 64, and)
+__PERCPU_AMO_OP_CASE(.d, or, 64, or)
+#endif
+
+static inline u32 __percpu_add_return_amo_case_32(void *ptr, unsigned long val)
+{
+	register u32 ret;
+
+	asm volatile ("amoadd.w %[ret], %[val], %[ptr]"
+		: [ptr] "+A" (*(u32 *)ptr), [ret] "=r" (ret)
+		: [val] "r" ((u32)(val)));
+
+	return ret + val;
+}
+
+#ifdef CONFIG_64BIT
+static inline u64 __percpu_add_return_amo_case_64(void *ptr, unsigned long val)
+{
+	register u64 ret;
+
+	asm volatile ("amoadd.d %[ret], %[val], %[ptr]"
+		: [ptr] "+A" (*(u64 *)ptr), [ret] "=r" (ret)
+		: [val] "r" ((u64)(val)));
+
+	return ret + val;
+}
+#endif
+
+#define PERCPU_8_16_GET_SHIFT(ptr)	(((unsigned long)(ptr) & 0x3) * BITS_PER_BYTE)
+#define PERCPU_8_16_GET_MASK(sz)	GENMASK((sz) - 1, 0)
+#define PERCPU_8_16_GET_PTR32(ptr)	((u32 *)((unsigned long)(ptr) & ~0x3))
+
+static inline void __percpu_add_amo_case_8(void *ptr, unsigned long val)
+{
+	u8 tmp;
+
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {
+		asm volatile (".option push\n"
+			".option arch, +zabha\n"
+			"amoadd.b %[tmp], %[val], %[ptr]\n"
+			".option pop"
+			: [ptr] "+A" (*(u8 *)ptr), [tmp] "=r" (tmp)
+			: [val] "r" ((u8)(val & PERCPU_8_16_GET_MASK(8))));
+	} else {
+		u32 *ptr32 = PERCPU_8_16_GET_PTR32(ptr);
+		const unsigned long shift = PERCPU_8_16_GET_SHIFT(ptr);
+		const u32 mask = PERCPU_8_16_GET_MASK(8) << shift;
+		const u8 val_trunc = val & PERCPU_8_16_GET_MASK(8);
+		u32 old, new;
+		u8 field;
+
+		asm volatile ("0: lr.w %0, %2\n"
+			"and %3, %0, %4\n"
+			"srl %3, %3, %5\n"
+			"add %3, %3, %6\n"
+			"and %3, %3, %8\n"
+			"sll %3, %3, %5\n"
+			"and %1, %0, %7\n"
+			"or %1, %1, %3\n"
+			"sc.w %1, %1, %2\n"
+			"bnez %1, 0b\n"
+			: "=&r"(old), "=&r"(new), "+A"(*ptr32), "=&r"(field)
+			: "r"(mask), "r"(shift), "r"(val_trunc), "r"(~mask),
+			  "r"(PERCPU_8_16_GET_MASK(8)));
+	}
+}
+
+static inline void __percpu_add_amo_case_16(void *ptr, unsigned long val)
+{
+	u16 tmp;
+
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {
+		asm volatile (".option push\n"
+			".option arch, +zabha\n"
+			"amoadd.h %[tmp], %[val], %[ptr]\n"
+			".option pop"
+			: [ptr] "+A" (*(u16 *)ptr), [tmp] "=r" (tmp)
+			: [val] "r" ((u16)(val & PERCPU_8_16_GET_MASK(16))));
+	} else {
+		u32 *ptr32 = PERCPU_8_16_GET_PTR32(ptr);
+		const unsigned long shift = PERCPU_8_16_GET_SHIFT(ptr);
+		const u32 mask = PERCPU_8_16_GET_MASK(16) << shift;
+		const u16 val_trunc = val & PERCPU_8_16_GET_MASK(16);
+		u32 old, new;
+		u16 field;
+
+		asm volatile ("0: lr.w %0, %2\n"
+			"and %3, %0, %4\n"
+			"srl %3, %3, %5\n"
+			"add %3, %3, %6\n"
+			"and %3, %3, %8\n"
+			"sll %3, %3, %5\n"
+			"and %1, %0, %7\n"
+			"or %1, %1, %3\n"
+			"sc.w %1, %1, %2\n"
+			"bnez %1, 0b\n"
+			: "=&r"(old), "=&r"(new), "+A"(*ptr32), "=&r"(field)
+			: "r"(mask), "r"(shift), "r"(val_trunc), "r"(~mask),
+			  "r"(PERCPU_8_16_GET_MASK(16)));
+	}
+}
+
+static inline void __percpu_and_amo_case_8(void *ptr, unsigned long val)
+{
+	u8 tmp;
+
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {
+		asm volatile (".option push\n"
+			".option arch, +zabha\n"
+			"amoand.b %[tmp], %[val], %[ptr]\n"
+			".option pop"
+			: [ptr] "+A" (*(u8 *)ptr), [tmp] "=r" (tmp)
+			: [val] "r" ((u8)(val & PERCPU_8_16_GET_MASK(8))));
+	} else {
+		u32 *ptr32 = PERCPU_8_16_GET_PTR32(ptr);
+		const unsigned long shift = PERCPU_8_16_GET_SHIFT(ptr);
+		const u32 mask = PERCPU_8_16_GET_MASK(8) << shift;
+		const u8 val_trunc = val & PERCPU_8_16_GET_MASK(8);
+		u32 old, new;
+		u8 field;
+
+		asm volatile ("0: lr.w %0, %2\n"
+			"and %3, %0, %4\n"
+			"srl %3, %3, %5\n"
+			"and %3, %3, %6\n"
+			"and %3, %3, %8\n"
+			"sll %3, %3, %5\n"
+			"and %1, %0, %7\n"
+			"or %1, %1, %3\n"
+			"sc.w %1, %1, %2\n"
+			"bnez %1, 0b\n"
+			: "=&r"(old), "=&r"(new), "+A"(*ptr32), "=&r"(field)
+			: "r"(mask), "r"(shift), "r"(val_trunc), "r"(~mask),
+			  "r"(PERCPU_8_16_GET_MASK(8)));
+	}
+}
+
+static inline void __percpu_and_amo_case_16(void *ptr, unsigned long val)
+{
+	u16 tmp;
+
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {
+		asm volatile (".option push\n"
+			".option arch, +zabha\n"
+			"amoand.h %[tmp], %[val], %[ptr]\n"
+			".option pop"
+			: [ptr] "+A" (*(u16 *)ptr), [tmp] "=r" (tmp)
+			: [val] "r" ((u16)(val & PERCPU_8_16_GET_MASK(16))));
+	} else {
+		u32 *ptr32 = PERCPU_8_16_GET_PTR32(ptr);
+		const unsigned long shift = PERCPU_8_16_GET_SHIFT(ptr);
+		const u32 mask = PERCPU_8_16_GET_MASK(16) << shift;
+		const u16 val_trunc = val & PERCPU_8_16_GET_MASK(16);
+		u32 old, new;
+		u16 field;
+
+		asm volatile ("0: lr.w %0, %2\n"
+			"and %3, %0, %4\n"
+			"srl %3, %3, %5\n"
+			"and %3, %3, %6\n"
+			"and %3, %3, %8\n"
+			"sll %3, %3, %5\n"
+			"and %1, %0, %7\n"
+			"or %1, %1, %3\n"
+			"sc.w %1, %1, %2\n"
+			"bnez %1, 0b\n"
+			: "=&r"(old), "=&r"(new), "+A"(*ptr32), "=&r"(field)
+			: "r"(mask), "r"(shift), "r"(val_trunc), "r"(~mask),
+			  "r"(PERCPU_8_16_GET_MASK(16)));
+	}
+}
+
+static inline void __percpu_or_amo_case_8(void *ptr, unsigned long val)
+{
+	u8 tmp;
+
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {
+		asm volatile (".option push\n"
+			".option arch, +zabha\n"
+			"amoor.b %[tmp], %[val], %[ptr]\n"
+			".option pop"
+			: [ptr] "+A" (*(u8 *)ptr), [tmp] "=r" (tmp)
+			: [val] "r" ((u8)(val & PERCPU_8_16_GET_MASK(8))));
+	} else {
+		u32 *ptr32 = PERCPU_8_16_GET_PTR32(ptr);
+		const unsigned long shift = PERCPU_8_16_GET_SHIFT(ptr);
+		const u32 mask = PERCPU_8_16_GET_MASK(8) << shift;
+		const u8 val_trunc = val & PERCPU_8_16_GET_MASK(8);
+		u32 old, new;
+		u8 field;
+
+		asm volatile ("0: lr.w %0, %2\n"
+			"and %3, %0, %4\n"
+			"srl %3, %3, %5\n"
+			"or %3, %3, %6\n"
+			"and %3, %3, %8\n"
+			"sll %3, %3, %5\n"
+			"and %1, %0, %7\n"
+			"or %1, %1, %3\n"
+			"sc.w %1, %1, %2\n"
+			"bnez %1, 0b\n"
+			: "=&r"(old), "=&r"(new), "+A"(*ptr32), "=&r"(field)
+			: "r"(mask), "r"(shift), "r"(val_trunc), "r"(~mask),
+			  "r"(PERCPU_8_16_GET_MASK(8)));
+	}
+}
+
+static inline void __percpu_or_amo_case_16(void *ptr, unsigned long val)
+{
+	u16 tmp;
+
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {
+		asm volatile (".option push\n"
+			".option arch, +zabha\n"
+			"amoor.h %[tmp], %[val], %[ptr]\n"
+			".option pop"
+			: [ptr] "+A" (*(u16 *)ptr), [tmp] "=r" (tmp)
+			: [val] "r" ((u16)(val & PERCPU_8_16_GET_MASK(16))));
+	} else {
+		u32 *ptr32 = PERCPU_8_16_GET_PTR32(ptr);
+		const unsigned long shift = PERCPU_8_16_GET_SHIFT(ptr);
+		const u32 mask = PERCPU_8_16_GET_MASK(16) << shift;
+		const u16 val_trunc = val & PERCPU_8_16_GET_MASK(16);
+		u32 old, new;
+		u16 field;
+
+		asm volatile ("0: lr.w %0, %2\n"
+			"and %3, %0, %4\n"
+			"srl %3, %3, %5\n"
+			"or %3, %3, %6\n"
+			"and %3, %3, %8\n"
+			"sll %3, %3, %5\n"
+			"and %1, %0, %7\n"
+			"or %1, %1, %3\n"
+			"sc.w %1, %1, %2\n"
+			"bnez %1, 0b\n"
+			: "=&r"(old), "=&r"(new), "+A"(*ptr32), "=&r"(field)
+			: "r"(mask), "r"(shift), "r"(val_trunc), "r"(~mask),
+			  "r"(PERCPU_8_16_GET_MASK(16)));
+	}
+}
+
+static inline u8 __percpu_add_return_amo_case_8(void *ptr, unsigned long val)
+{
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {
+		register u8 ret;
+
+		asm volatile (".option push\n"
+			".option arch, +zabha\n"
+			"amoadd.b %[ret], %[val], %[ptr]\n"
+			".option pop"
+			: [ptr] "+A"(*(u8 *)ptr), [ret] "=r"(ret)
+			: [val] "r"((u8)(val & PERCPU_8_16_GET_MASK(8))));
+		return ret + (u8)(val & PERCPU_8_16_GET_MASK(8));
+	}
+
+	{
+		u32 *ptr32 = PERCPU_8_16_GET_PTR32(ptr);
+		const unsigned long shift = PERCPU_8_16_GET_SHIFT(ptr);
+		const u32 mask = PERCPU_8_16_GET_MASK(8) << shift;
+		const u32 inv_mask = ~mask;
+		const u8 val_trunc = val & PERCPU_8_16_GET_MASK(8);
+		u32 old, new, field;
+
+		asm volatile ("0: lr.w %0, %3\n"
+			"and %1, %0, %4\n"
+			"srl %1, %1, %5\n"
+			"add %1, %1, %6\n"
+			"and %1, %1, %7\n"
+			"sll %1, %1, %5\n"
+			"and %2, %0, %8\n"
+			"or %2, %2, %1\n"
+			"sc.w %2, %2, %3\n"
+			"bnez %2, 0b\n"
+			: "=&r"(old), "=&r"(field), "=&r"(new), "+A"(*ptr32)
+			: "r"(mask), "r"(shift), "r"(val_trunc),
+			  "r"(PERCPU_8_16_GET_MASK(8)), "r"(inv_mask));
+		return field >> shift;
+	}
+}
+
+static inline u16 __percpu_add_return_amo_case_16(void *ptr, unsigned long val)
+{
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZABHA) &&
+	    riscv_has_extension_unlikely(RISCV_ISA_EXT_ZABHA)) {
+		register u16 ret;
+
+		asm volatile (".option push\n"
+			".option arch, +zabha\n"
+			"amoadd.h %[ret], %[val], %[ptr]\n"
+			".option pop"
+			: [ptr] "+A"(*(u16 *)ptr), [ret] "=r"(ret)
+			: [val] "r"((u16)(val & PERCPU_8_16_GET_MASK(16))));
+		return ret + (u16)(val & PERCPU_8_16_GET_MASK(16));
+	}
+
+	{
+		u32 *ptr32 = PERCPU_8_16_GET_PTR32(ptr);
+		const unsigned long shift = PERCPU_8_16_GET_SHIFT(ptr);
+		const u32 mask = PERCPU_8_16_GET_MASK(16) << shift;
+		const u32 inv_mask = ~mask;
+		const u16 val_trunc = val & PERCPU_8_16_GET_MASK(16);
+		u32 old, new, field;
+
+		asm volatile ("0: lr.w %0, %3\n"
+			"and %1, %0, %4\n"
+			"srl %1, %1, %5\n"
+			"add %1, %1, %6\n"
+			"and %1, %1, %7\n"
+			"sll %1, %1, %5\n"
+			"and %2, %0, %8\n"
+			"or %2, %2, %1\n"
+			"sc.w %2, %2, %3\n"
+			"bnez %2, 0b\n"
+			: "=&r"(old), "=&r"(field), "=&r"(new), "+A"(*ptr32)
+			: "r"(mask), "r"(shift), "r"(val_trunc),
+			  "r"(PERCPU_8_16_GET_MASK(16)), "r"(inv_mask));
+		return field >> shift;
+	}
+}
+
+/*
+ * Put arch_cmpxchg_relaxed() behind a function boundary to isolate its macro
+ * locals from those at the call site. asm-generic implements
+ * this_cpu_try_cmpxchg_N() using this_cpu_cmpxchg_N() and a local named __old.
+ * RISC-V's _arch_cmpxchg() also declares __old, so expanding it in the caller's
+ * scope would turn its initializer into "__old = (__old)" and read the
+ * uninitialized inner variable.
+ *
+ * __always_inline avoids an out-of-line call.
+ * _pcp_protect_cmpxchg_return() provides the instrument_atomic_read_write()
+ * hook that cmpxchg_relaxed() would otherwise provide.
+ */
+#define PERCPU_CMPXCHG_OP(sz)						\
+static __always_inline unsigned long					\
+__percpu_cmpxchg_case_##sz(void *ptr, unsigned long old,		\
+			   unsigned long new)				\
+{									\
+	return arch_cmpxchg_relaxed((u##sz *)ptr, (u##sz)old,		\
+				    (u##sz)new);			\
+}
+
+PERCPU_CMPXCHG_OP(8)
+PERCPU_CMPXCHG_OP(16)
+PERCPU_CMPXCHG_OP(32)
+
+#ifdef CONFIG_64BIT
+PERCPU_CMPXCHG_OP(64)
+#endif
+
+#define _pcp_protect(op, pcp, ...)					\
+({									\
+	preempt_disable_notrace();					\
+	op(raw_cpu_ptr(&(pcp)), __VA_ARGS__);				\
+	preempt_enable_notrace();					\
+})
+
+#define _pcp_protect_return(op, pcp, args...)				\
+({									\
+	typeof(pcp) __retval;						\
+	preempt_disable_notrace();					\
+	__retval = (typeof(pcp))op(raw_cpu_ptr(&(pcp)), ##args);	\
+	preempt_enable_notrace();					\
+	__retval;							\
+})
+
+#define _pcp_protect_cmpxchg_return(op, pcp, old, new)			\
+({									\
+	typeof(pcp) __retval;						\
+	typeof(pcp) *__pcp_ptr;						\
+									\
+	preempt_disable_notrace();					\
+	__pcp_ptr = raw_cpu_ptr(&(pcp));				\
+	instrument_atomic_read_write(__pcp_ptr, sizeof(*__pcp_ptr));	\
+	__retval = (typeof(pcp))op(__pcp_ptr, (unsigned long)(old),	\
+				     (unsigned long)(new));		\
+	preempt_enable_notrace();					\
+	__retval;							\
+})
+
+#define this_cpu_read_1(pcp)		_pcp_protect_return(__percpu_read_8, pcp)
+#define this_cpu_read_2(pcp)		_pcp_protect_return(__percpu_read_16, pcp)
+#define this_cpu_read_4(pcp)		_pcp_protect_return(__percpu_read_32, pcp)
+
+#ifdef CONFIG_64BIT
+#define this_cpu_read_8(pcp)		_pcp_protect_return(__percpu_read_64, pcp)
+#endif
+
+#define this_cpu_write_1(pcp, val)	_pcp_protect(__percpu_write_8, pcp, (unsigned long)val)
+#define this_cpu_write_2(pcp, val)	_pcp_protect(__percpu_write_16, pcp, (unsigned long)val)
+#define this_cpu_write_4(pcp, val)	_pcp_protect(__percpu_write_32, pcp, (unsigned long)val)
+
+#ifdef CONFIG_64BIT
+#define this_cpu_write_8(pcp, val)	_pcp_protect(__percpu_write_64, pcp, (unsigned long)val)
+#endif
+
+#define this_cpu_add_1(pcp, val)	_pcp_protect(__percpu_add_amo_case_8, pcp, val)
+#define this_cpu_add_2(pcp, val)	_pcp_protect(__percpu_add_amo_case_16, pcp, val)
+#define this_cpu_add_4(pcp, val)	_pcp_protect(__percpu_add_amo_case_32, pcp, val)
+
+#ifdef CONFIG_64BIT
+#define this_cpu_add_8(pcp, val)	_pcp_protect(__percpu_add_amo_case_64, pcp, val)
+#endif
+
+#define this_cpu_add_return_1(pcp, val)		\
+_pcp_protect_return(__percpu_add_return_amo_case_8, pcp, val)
+
+#define this_cpu_add_return_2(pcp, val)		\
+_pcp_protect_return(__percpu_add_return_amo_case_16, pcp, val)
+
+#define this_cpu_add_return_4(pcp, val)		\
+_pcp_protect_return(__percpu_add_return_amo_case_32, pcp, val)
+
+#ifdef CONFIG_64BIT
+#define this_cpu_add_return_8(pcp, val)		\
+_pcp_protect_return(__percpu_add_return_amo_case_64, pcp, val)
+#endif
+
+#define this_cpu_and_1(pcp, val)	_pcp_protect(__percpu_and_amo_case_8, pcp, val)
+#define this_cpu_and_2(pcp, val)	_pcp_protect(__percpu_and_amo_case_16, pcp, val)
+#define this_cpu_and_4(pcp, val)	_pcp_protect(__percpu_and_amo_case_32, pcp, val)
+
+#ifdef CONFIG_64BIT
+#define this_cpu_and_8(pcp, val)	_pcp_protect(__percpu_and_amo_case_64, pcp, val)
+#endif
+
+#define this_cpu_or_1(pcp, val)	_pcp_protect(__percpu_or_amo_case_8, pcp, val)
+#define this_cpu_or_2(pcp, val)	_pcp_protect(__percpu_or_amo_case_16, pcp, val)
+#define this_cpu_or_4(pcp, val)	_pcp_protect(__percpu_or_amo_case_32, pcp, val)
+
+#ifdef CONFIG_64BIT
+#define this_cpu_or_8(pcp, val)	_pcp_protect(__percpu_or_amo_case_64, pcp, val)
+#endif
+
+#define this_cpu_xchg_1(pcp, val)	_pcp_protect_return(xchg_relaxed, pcp, val)
+#define this_cpu_xchg_2(pcp, val)	_pcp_protect_return(xchg_relaxed, pcp, val)
+#define this_cpu_xchg_4(pcp, val)	_pcp_protect_return(xchg_relaxed, pcp, val)
+
+#ifdef CONFIG_64BIT
+#define this_cpu_xchg_8(pcp, val)	_pcp_protect_return(xchg_relaxed, pcp, val)
+#endif
+
+#define this_cpu_cmpxchg_1(pcp, o, n)					\
+	_pcp_protect_cmpxchg_return(__percpu_cmpxchg_case_8, pcp, o, n)
+
+#define this_cpu_cmpxchg_2(pcp, o, n)					\
+	_pcp_protect_cmpxchg_return(__percpu_cmpxchg_case_16, pcp, o, n)
+
+#define this_cpu_cmpxchg_4(pcp, o, n)					\
+	_pcp_protect_cmpxchg_return(__percpu_cmpxchg_case_32, pcp, o, n)
+
+#ifdef CONFIG_64BIT
+#define this_cpu_cmpxchg_8(pcp, o, n)					\
+	_pcp_protect_cmpxchg_return(__percpu_cmpxchg_case_64, pcp, o, n)
+
+#define this_cpu_cmpxchg64(pcp, o, n)	this_cpu_cmpxchg_8(pcp, o, n)
+#endif
+
+#ifdef system_has_cmpxchg128
+static inline u128 __percpu_generic_cmpxchg128(void *ptr, u128 old_val,
+						      u128 new_val)
+{
+	unsigned long flags;
+	u128 *p = ptr;
+	u128 ret;
+
+	flags = arch_local_irq_save();
+	ret = *p;
+	if (ret == old_val)
+		*p = new_val;
+	arch_local_irq_restore(flags);
+
+	return ret;
+}
+
+#define this_cpu_cmpxchg128(pcp, o, n)					\
+({									\
+	u128 old__ = (o), new__ = (n), ret__;				\
+	typeof(pcp) *ptr__;						\
+									\
+	preempt_disable_notrace();					\
+	ptr__ = raw_cpu_ptr(&(pcp));					\
+	if (system_has_cmpxchg128())					\
+		ret__ = cmpxchg128_local(ptr__, old__, new__);		\
+	else								\
+		ret__ = __percpu_generic_cmpxchg128(ptr__, old__, new__); \
+	preempt_enable_notrace();					\
+	ret__;								\
+})
+#endif
+
+#undef PERCPU_RW_OPS
+#undef __PERCPU_AMO_OP_CASE
+#undef PERCPU_8_16_GET_SHIFT
+#undef PERCPU_8_16_GET_MASK
+#undef PERCPU_8_16_GET_PTR32
+#undef PERCPU_CMPXCHG_OP
+
+#include <asm-generic/percpu.h>
+
+#endif /* __ASM_PERCPU_H */

base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
