Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEA8606A33F
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 06:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M6+NU17y;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=cIKgCTqt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T51EoU4/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=gPECyxXH9rf/XSp7XFuYfzcVMQ+qWRUwReJ9S3d5YXg=; b=M6+NU17yT7kYA92HICy7d19bs/
	shmm7K2+sIqugZb47LBzbLrcxmbW+a2pus3RX420sp5pLbRxn9kfBQ3nlW1UsGipWhE6zPp+0+lBM
	PEcrm6Ntq1NOyQQoO7shC+qcFWMoIeMwWPiPXbvMPcJm0afM7hvJzzu+GwM/Emkmk0IQH6iGM3rTA
	5s11MntgbZTwCEe0pmujvnSkcW0n0k5zyyKihTWxS+/IbIEivHbM7aMIuX8u7B7G8nMDB3yH7Iba9
	A6AzxYjotebZGNHsDrIsINFzSnCgzq8em8Pc9DU8Fao120+JQHn6R2aCET9toe4/0+ihkxOune1jA
	j4hwbmSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6L8-00000008cDt-492W;
	Wed, 25 Nov 2026 06:18:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6JM-00000008ZIn-2yNl
	for linux-riscv@bombadil.infradead.org;
	Wed, 25 Nov 2026 06:16:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=opbvbiqLtMKnZidmW1akDPMoAVRaFGJF5QXg9EIzgwM=; b=cIKgCTqt0+8/2d+eB33LhSL751
	7N9Pgd+Dxt4b1OSMoMaePu/Gx4hXn4egGPjB9GD/E+p6UaekRQTTrI1QdmT0Df5C9r0olMw19e5tI
	NY77E5O9dUiJNGT5tiMnyY0uHfFYV57oGaCvSA5q4b0ySOg1YoFqKhidnFxVFzk9sYBa30ezthns4
	6QciQRi3sjHgoo2LoPCJ+5dtCoMgq1sTb/Ng1fr5ZA8s/2ofgBbIv7QEmb8zeSRmgirXxouUfMjl0
	ofCMLG5/G/PQ6hXfEKkWh9DyPjDgIaVutEx1JdJszu96EgfIDuq/LjiZXO7PosDqjL1Rblbjnft3R
	ml3JTthg==;
Received: from mail-oi1-x247.google.com ([2607:f8b0:4864:20::247])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6JH-00000004u5B-3CpZ
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 06:16:55 +0000
Received: by mail-oi1-x247.google.com with SMTP id 5614622812f47-4b37620eb73so7025344b6e.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 22:16:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795587406; x=1796192206; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=opbvbiqLtMKnZidmW1akDPMoAVRaFGJF5QXg9EIzgwM=;
        b=T51EoU4/CZqq2Dw585WNDMxBOcro+OAZiZxo7UOrOGPtCxt8dSe8nI3cMymZETO/NZ
         kmO2cqovwmKOiolCWjTydt5eW2uIcjqOeSaO6rs5Qj1zirw/549L7354PHLo1YLittEm
         D2mtqGREx5vWFBUcrsV742XiJvYQns6X2lb/4nSEvHXOKlJqUcr9VtEAfA9zZXrc2nVx
         gd41SlhEnP3NtOvQrYm4RbVere8KvKR00XaC1wxOpc1lHnaJ2T3kDaKyeZGBYqhKrMk/
         bnaXb4VN0+22yNYA9VKFG1PxjkaMtGR32SJ4d+QZwH09GO5zTF4G4FfradBtchIparxl
         /OkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587406; x=1796192206;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=opbvbiqLtMKnZidmW1akDPMoAVRaFGJF5QXg9EIzgwM=;
        b=EwB09tb/wuVziTGXpu9U1dmI5j5cPQqXzsWzFLsYJdiOW4/VDPlzfxvN3bd7Tapaz+
         1O7BOZPhFmfyUx7nT+TVWpeJlq9DxT9IXSOuRJjJEtEIGhbDvb+WhS9w/+Ul6RZKdrP0
         xu78FrKTP3MohpNSr4udeNvEUdcQcQp084XCPlIj6z/mOEZ6IM7ZvlospFXVO8aTE757
         sUhNRbmL7/tSjal+nBGO4kKGdgRKknAeATZFHfA5bJhCbxg1FjG+rn0eSOi8jgmYemro
         MyfGpHpl1gGuoa2QoNeEHkOWEYcU11IzJQnQKGAbPE5471bLLI1dXGIZcQv6Pn40rdUc
         UuQw==
X-Forwarded-Encrypted: i=1; AL+hErGYjY/N50LsZri6lBFk5jn2zkT5Lb7UbfdkxG2bftOA1FxkJnaqMdC9yPAmL3j7Z7f93a+v9inGFE/LYQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z95sa/b4DUF+lmSKkDs5xQrzm7v3efHP0zbqnmo9jLVU6wBvHeo
	HY2U0JprEppoQEzSlnI70quMjfLtyarHdY6cX2t0aAxJBR0YG4oEF/PwmK4Dgh0exak6fIW62CG
	vhe0qaUfvDw==
X-Received: from oigu20-n1.prod.google.com ([2002:a05:6809:5d4:10b0:4f5:740:2bcf])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:319b:b0:4f5:eaac:5173
 with SMTP id 5614622812f47-57a0b84fa3dmr15864618b6e.57.1795587405164; Tue, 24
 Nov 2026 22:16:45 -0800 (PST)
Date: Tue, 24 Nov 2026 22:15:17 -0800
In-Reply-To: <20261125061523.1540234-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125061523.1540234-25-irogers@google.com>
Subject: [RFC PATCH v2 24/30] tools headers: Add linux/unwind_dwarf_cfi.h copy
 from the kernel sources
From: Ian Rogers <irogers@google.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org, rostedt@goodmis.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com, Ian Rogers <irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_061651_668358_485DCF7A 
X-CRM114-Status: GOOD (  22.53  )
X-Spam-Score: -7.6 (-------)
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
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Copy include/linux/unwind_dwarf_cfi.h to
tools/include/linux/unwind_dwarf_cfi.h for host unwinding verification
tools under tools/, and add it to tools/perf/check-headers.sh.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/include/linux/unwind_dwarf_cfi.h | 181 +++++++++++++++++++++++++
 tools/perf/check-headers.sh            |   1 +
 2 files changed, 182 insertions(+)
 create mode 100644 tools/include/linux/unwind_dwarf_cfi.h

diff --git a/tools/include/linux/unwind_dwarf_cfi.h b/tools/include/linux/unwind_dwarf_cfi.h
new file mode 100644
index 000000000000..3530794c8543
--- /dev/null
+++ b/tools/include/linux/unwind_dwarf_cfi.h
@@ -0,0 +1,181 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+#ifndef _LINUX_UNWIND_DWARF_CFI_H
+#define _LINUX_UNWIND_DWARF_CFI_H
+
+#include <linux/types.h>
+
+/*
+ * Minimal DWARF Call Frame Information (CFI) unwinder subset.
+ *
+ * Evaluates a strictly bounded, non-Turing-complete subset of .eh_frame and
+ * .eh_frame_hdr tables matching SFrame's stack-unwinding state model (plus
+ * fixed-pattern DRAP stack-realignment and signal-frame expressions):
+ *  - Advances PC monotonically through a single FDE (no backward jumps)
+ *  - Tracks CFA = (SP | FP | scratch) + cfa_off or *(FP/SP + cfa_off)
+ *  - Tracks stack save offsets for SP, FP, and RA (ignoring callee-saved GPR
+ *    spills)
+ *  - Rejects general DWARF expressions, register-to-register rules on SP/FP/RA,
+ *    and DW_EH_PE_indirect FDE/table pointer encodings (skipping CIE
+ *    personality and LSDA fields without dereferencing).
+ */
+
+/* Hard safety bounds enforced on CIE/FDE lengths, offsets, and state stack */
+#define DWARF_CFI_MAX_CIE_LEN		128U
+#define DWARF_CFI_MAX_FDE_LEN		4096U
+#define DWARF_CFI_MAX_CIE_DELTA		(64U * 1024U * 1024U)
+#define DWARF_CFI_MAX_FDE_COUNT		(4U * 1024U * 1024U)
+#define DWARF_CFI_MAX_STATE_STACK	4U
+
+/**
+ * enum dwarf_cfi_base - Base register or addressing mode for computing the CFA
+ * @DWARF_CFI_BASE_UNDEFINED: CFA rule has not been established yet.
+ * @DWARF_CFI_BASE_SP: CFA = stack pointer + cfa_off.
+ * @DWARF_CFI_BASE_FP: CFA = frame pointer + cfa_off.
+ * @DWARF_CFI_BASE_FP_INDIRECT: DRAP stack realignment: CFA = *(FP + cfa_off).
+ * @DWARF_CFI_BASE_SP_INDIRECT: Signal trampoline frame: CFA = *(SP + cfa_off).
+ * @DWARF_CFI_BASE_REG: Transient prologue/epilogue scratch register:
+ *                      CFA = reg(cfa_reg) + cfa_off.
+ */
+enum dwarf_cfi_base {
+	DWARF_CFI_BASE_UNDEFINED = 0,
+	DWARF_CFI_BASE_SP,
+	DWARF_CFI_BASE_FP,
+	DWARF_CFI_BASE_FP_INDIRECT,
+	DWARF_CFI_BASE_SP_INDIRECT,
+	DWARF_CFI_BASE_REG,
+};
+
+/**
+ * enum dwarf_cfi_rule - Recovery rule for caller's SP, FP, or return address
+ * @DWARF_CFI_RULE_SAME: Register retains its value from the current frame
+ *                       (or defaults to CFA for SP).
+ * @DWARF_CFI_RULE_OFFSET: Saved on the stack at *(CFA + off).
+ * @DWARF_CFI_RULE_FP_OFFSET: Saved relative to FP at *(FP + off) (DRAP frame).
+ * @DWARF_CFI_RULE_SP_OFFSET: Saved relative to SP at *(SP + off) (sigframe).
+ * @DWARF_CFI_RULE_UNDEFINED: Explicitly undefined (DW_CFA_undefined); marks
+ *                            the bottom of a stack (e.g. _start or clone).
+ */
+enum dwarf_cfi_rule {
+	DWARF_CFI_RULE_SAME = 0,
+	DWARF_CFI_RULE_OFFSET,
+	DWARF_CFI_RULE_FP_OFFSET,
+	DWARF_CFI_RULE_SP_OFFSET,
+	DWARF_CFI_RULE_UNDEFINED,
+};
+
+/**
+ * struct dwarf_cfi_arch - Architecture DWARF register numbers and word size
+ * @ws: Target address/word size in bytes (4 or 8).
+ * @sp_reg: DWARF register number for the stack pointer.
+ * @fp_reg: DWARF register number for the frame pointer.
+ * @ra_reg: Default DWARF return-address column number.
+ */
+struct dwarf_cfi_arch {
+	u8 ws;
+	u8 sp_reg;
+	u8 fp_reg;
+	u8 ra_reg;
+};
+
+/**
+ * struct dwarf_cfi_row - Evaluated Minimal DWARF unwind state at a target PC
+ * @cfa_off: Byte offset added to the CFA base register before or as the CFA.
+ * @sp_off: Byte offset used to load the saved SP when @sp_rule is an offset.
+ * @fp_off: Byte offset used to load the saved FP when @fp_rule is an offset.
+ * @ra_off: Byte offset used to load the saved RA when @ra_rule is an offset.
+ * @cfa_base: CFA computation mode (&enum dwarf_cfi_base).
+ * @cfa_reg: DWARF register number when @cfa_base is %DWARF_CFI_BASE_REG.
+ * @sp_rule: Recovery rule for the stack pointer (&enum dwarf_cfi_rule;
+ *           %DWARF_CFI_RULE_SAME indicates caller SP equals CFA).
+ * @fp_rule: Recovery rule for the frame pointer (&enum dwarf_cfi_rule).
+ * @ra_rule: Recovery rule for the return address (&enum dwarf_cfi_rule).
+ * @signal: True if the CIE carries the 'S' signal/interrupt frame augmentation,
+ *          indicating that the saved PC points directly to the interrupted
+ *          instruction rather than after a call instruction.
+ * @ra_signed: True on AArch64 when DW_CFA_AARCH64_negate_ra_state indicates
+ *             that the saved return address carries a PAC signature.
+ */
+struct dwarf_cfi_row {
+	s32 cfa_off;
+	s32 sp_off;
+	s32 fp_off;
+	s32 ra_off;
+	u8 cfa_base;
+	u8 cfa_reg;
+	u8 sp_rule;
+	u8 fp_rule;
+	u8 ra_rule;
+	bool signal;
+	bool ra_signed;
+};
+
+/**
+ * struct eh_frame_hdr_entry - Binary-search index entry for an FDE
+ * @start_off: Signed 32-bit offset from the table base (or entry field) to the
+ *             FDE's initial PC location.
+ * @fde_off: Signed 32-bit offset from the table base (or entry field) to the
+ *           start of the FDE record in .eh_frame.
+ */
+struct eh_frame_hdr_entry {
+	s32 start_off;
+	s32 fde_off;
+};
+
+#ifdef CONFIG_UNWIND_DWARF_CFI
+
+extern const u8 __start_eh_frame_hdr[];
+extern const u8 __stop_eh_frame_hdr[];
+extern const u8 __start_eh_frame[];
+extern const u8 __stop_eh_frame[];
+
+int dwarf_cfi_eval_fde_kmem(const u8 *fde, const u8 *eh_start,
+			    const u8 *eh_end, unsigned long pc,
+			    const struct dwarf_cfi_arch *arch,
+			    struct dwarf_cfi_row *out_row);
+
+int dwarf_cfi_unwind_eh_frame_hdr(const u8 *hdr, size_t hdr_size,
+				  const u8 *eh_start, const u8 *eh_end,
+				  unsigned long pc,
+				  const struct dwarf_cfi_arch *arch,
+				  struct dwarf_cfi_row *out_row);
+
+int dwarf_cfi_scan_eh_frame_kmem(const u8 *eh_start, size_t eh_size,
+				 const struct dwarf_cfi_arch *arch,
+				 unsigned long base_addr,
+				 struct eh_frame_hdr_entry *entries,
+				 unsigned int max_entries,
+				 unsigned int *out_count);
+
+int dwarf_cfi_unwind_user_eh_frame_hdr(unsigned long hdr_uaddr,
+				       size_t hdr_size, unsigned long pc,
+				       const struct dwarf_cfi_arch *arch,
+				       struct dwarf_cfi_row *out_row);
+
+#if defined(CONFIG_UNWINDER_DWARF_CFI) && defined(CONFIG_MODULES)
+/**
+ * struct mod_dwarf_cfi_index - Sorted FDE lookup table for a loadable module
+ * @num_fdes: Number of sorted FDE index entries in @entries.
+ * @eh_frame: Pointer to the module's in-memory SHF_ALLOC .eh_frame section;
+ *            also serves as the base address for @entries offsets.
+ * @eh_frame_size: Size in bytes of the module's .eh_frame section.
+ * @entries: Sorted binary-search table mapping PCs to module FDEs.
+ */
+struct mod_dwarf_cfi_index {
+	unsigned int num_fdes;
+	const u8 *eh_frame;
+	size_t eh_frame_size;
+	struct eh_frame_hdr_entry entries[] __counted_by(num_fdes);
+};
+
+struct mod_dwarf_cfi_index *dwarf_cfi_mod_alloc(const void *eh_frame,
+						size_t eh_frame_size,
+						const struct dwarf_cfi_arch *arch);
+void dwarf_cfi_mod_free_rcu(struct mod_dwarf_cfi_index *idx);
+int dwarf_cfi_mod_eval(const struct mod_dwarf_cfi_index *idx, unsigned long ip,
+		       const struct dwarf_cfi_arch *arch,
+		       struct dwarf_cfi_row *out_row);
+#endif
+
+#endif /* CONFIG_UNWIND_DWARF_CFI */
+
+#endif /* _LINUX_UNWIND_DWARF_CFI_H */
diff --git a/tools/perf/check-headers.sh b/tools/perf/check-headers.sh
index 3e684c851a86..1b1bd04a6690 100755
--- a/tools/perf/check-headers.sh
+++ b/tools/perf/check-headers.sh
@@ -30,6 +30,7 @@ declare -a FILES=(
   "include/linux/hash.h"
   "include/linux/kmsan-checks.h"
   "include/linux/list-sort.h"
+  "include/linux/unwind_dwarf_cfi.h"
   "include/uapi/linux/hw_breakpoint.h"
   "arch/x86/include/asm/cpufeatures.h"
   "arch/x86/include/asm/inat_types.h"
-- 
2.56.1.831.g720f3f5937-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
