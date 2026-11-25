Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D30D606A326
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 06:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vbUclo+m;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=PChuYPi9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mHOwlpmn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=knGLyNzY6cjIn7/AvxTWNCJpUWPk6BACxOxDZ42xAjY=; b=vbUclo+mXJ57HfrgesUQDQmBM/
	fWA3joLK8tIenU5yjcKwgk2G3OjjyV7ddylNUk2195gl+a0Pi9UCoGo31dbrlCjx7kwQ1S+6mAaFD
	sDXnmAs1nSEuITKcddTBQ560On5DUZ8yioUwgALK7EsPsEeCa/AQuthOXV+ibzcV1Vc1Clt+n/VPz
	ORZD9IZCl1ihaL6IbzgeEub5dKobUEMzqhZ7qlfh3vK9y/RUeQAJ/XUSvVnUZkYOFZVL8kzWkQrEa
	65Tu0KLHU7PdIAA+6gXHEoixOAe+AQpS+r32YLlyfPauOP4bnaB30EhqIHQX8yQCRtLLfIfc6kptL
	bdI93yGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6Lh-00000008dRh-36oL;
	Wed, 25 Nov 2026 06:19:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6JV-00000008ZRH-1q6f
	for linux-riscv@bombadil.infradead.org;
	Wed, 25 Nov 2026 06:17:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7idd1vMoQrkJGtb4Pai7PHauPn4l7yH4Zzs++IrNt10=; b=PChuYPi9ajyl0YmLv3FDxddJ6r
	/BbQgmuah9D9nLWz1K7JthmNSFlWwzq9KHRznFXxn4VJ6blEIATBghQDbOsElx/XGmrlIBTG8ukoO
	iLGgOixLuFW21l90I7cbDbHtI085BIqhv9H4FhOtdhWYQc3E1+Q80ORWWElWK64xHr4ZlbOMF5LWV
	+AeTeK8/1eLKGWYHsf9aU/FeY/279xKe9AMt7GP9nhJZVTaM6mCDmXlcrgNzt/UregihY0D7u+xNV
	oik8agrUk6cxJ0Q41ViCsaxLpgTT1QkZVPzA4hWUs5F7J+SOF2O+DKl1uf/aSl/8HhSpZJYaTl9rV
	e3CBy9xA==;
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6JQ-00000004u9W-14Uw
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 06:17:03 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-cdd4dafdcf3so201114a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 22:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795587416; x=1796192216; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7idd1vMoQrkJGtb4Pai7PHauPn4l7yH4Zzs++IrNt10=;
        b=mHOwlpmncuSd6qbFE+/ixlGFBOBEJUF2yxw15AOIclIOuifUyxE7E/bGLDBBvneTTs
         Mg41eAvEX0qWUGsQVARiAW3ZGxm5oK83A7i/d2Y/YV0/5xO7i7shFj11ExhQWZhlvWig
         6K/cLvxbpQ9H4JBSqzbicG/Iaa/1QL2U0FVbvKmcGypFnqSd34mS+PDC7uKRw/yx0T8X
         0oGnwFXxRS/tutR+kO7YBAEicJ4Xp6fEBpKhHeILzITxZSjdeZ2YoXSxH7F97Y1L5ytQ
         s2hTYBgDdC+2FBnJGuE7xiNKTCzt0QayZlTZD1LTuK1sprGfUwDxtaAUrU/s3Vx2YXdX
         Sc2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587416; x=1796192216;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7idd1vMoQrkJGtb4Pai7PHauPn4l7yH4Zzs++IrNt10=;
        b=1ahUs0EVYn7D2qhe9Z7cVe1dpWvk1YMdcXK4kbem1E2uY5M1TUpbS+oI3VqzWhjBwx
         W172d5OaTqncIt9pR3hkuviX15y8UzeBWvwAMwJCbSDoRJyLGr39la0VhFUa1Hy8vX9t
         2mt34fvtGRRr+zxWDQ0U8T9bqz27fkiI7fiEH0qbDhkjXNth6Kwh3qRpywlOM5mFPhcy
         jYH6l7EUtJJ1m90/04Gy5HodE+x6NVt4D2Pf+Qf3qBtgEKFD2nw7ypHFVMmUB9ykoH0w
         0eUXHq5nnQCYx5QiWVwiJMyqoYRlsIkPJdqj5vlBQ1oRQuvW1529MfbQ/Bdl6LchRKPj
         /X2g==
X-Forwarded-Encrypted: i=1; AL+hErFfdgliiVbGmDyyMJo+wY4zg5Om1lj8nmdNCw9xxE3o/kNFL3AEuZR9StA/PgybIS4f0T9Woj8j4LeMNQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8imimJIcTFyQXWl8FgkGHfzxoR1Bt6Y3XLhxDvcLk60jVhrF/L
	dgnGSsRdgmHqhwkLq4jsv7+SnKMLKcuiBjzV0Nv7P1Wy4ou4DXB06vasXGFcnCrEjYaRIRS9j9J
	Jn4AY0l9zqg==
X-Received: from plbjw23.prod.google.com ([2002:a17:903:2797:b0:2f0:6eae:f018])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:b4f:b0:2ef:f0cc:17ce
 with SMTP id d9443c01a7336-2f03f1ceec3mr187359255ad.11.1795587415506; Tue, 24
 Nov 2026 22:16:55 -0800 (PST)
Date: Tue, 24 Nov 2026 22:15:22 -0800
In-Reply-To: <20261125061523.1540234-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125061523.1540234-30-irogers@google.com>
Subject: [RFC PATCH v2 29/30] tools/unwind: Add x86-64 ORC cross-check oracle
 to verify_cfi
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
X-CRM114-CacheID: sfid-20261125_061700_510794_ACE3EEAD 
X-CRM114-Status: GOOD (  18.61  )
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

Add verifyOracle3Orc() in tools/unwind/verify_orc.cpp using
<asm/orc_types.h> and enable -DHAVE_VERIFY_ORC in tools/unwind/Makefile,
cross-checking objtool's ORC_TYPE_CALL entries in .orc_unwind /
.orc_unwind_ip directly against Minimal DWARF CFI across every
instruction covered by an FDE (matching identically on 99.9823% of
4,468,154 x86-64 vmlinux instructions, with 0 BP diffs).

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/unwind/Makefile       |   5 +-
 tools/unwind/verify_orc.cpp | 205 ++++++++++++++++++++++++++++++++++++
 2 files changed, 208 insertions(+), 2 deletions(-)
 create mode 100644 tools/unwind/verify_orc.cpp

diff --git a/tools/unwind/Makefile b/tools/unwind/Makefile
index c0a8d477dc13..d368b9ed90ee 100644
--- a/tools/unwind/Makefile
+++ b/tools/unwind/Makefile
@@ -79,7 +79,7 @@ TOOLS_INCLUDES := -I$(srctree)/tools/include -I$(srctree)/tools/include/uapi \
 SHIM_CFLAGS := -O2 -g -Wall -Wextra -Wno-unused-parameter -Wno-maybe-uninitialized \
 	$(TOOLS_INCLUDES)
 
-VERIFY_CXXFLAGS := -O2 -g -Wall -Wextra -std=gnu++20 $(LLVM_CXXFLAGS) -DHAVE_VERIFY_INSN \
+VERIFY_CXXFLAGS := -O2 -g -Wall -Wextra -std=gnu++20 $(LLVM_CXXFLAGS) -DHAVE_VERIFY_INSN -DHAVE_VERIFY_ORC \
 	-I$(CURDIR) $(TOOLS_INCLUDES) $(CXXFLAGS)
 VERIFY_LDFLAGS  := $(LLVM_LDFLAGS) $(LDFLAGS)
 
@@ -89,7 +89,8 @@ KERNEL_CFI_DEPS := $(srctree)/kernel/unwind/dwarf_cfi.c \
 VERIFY_OBJS := $(OUTPUT)dwarf_cfi_host.o \
 		 $(OUTPUT)verify_cfi.o \
 		 $(OUTPUT)verify_insn_arch.o \
-		 $(OUTPUT)verify_insn.o
+		 $(OUTPUT)verify_insn.o \
+		 $(OUTPUT)verify_orc.o
 
 ifeq ($(HAS_LIBLLVM),1)
 all: $(OUTPUT)verify_cfi
diff --git a/tools/unwind/verify_orc.cpp b/tools/unwind/verify_orc.cpp
new file mode 100644
index 000000000000..629849f3187e
--- /dev/null
+++ b/tools/unwind/verify_orc.cpp
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Oracle 3: Direct x86-64 .orc_unwind / .orc_unwind_ip comparison against
+ * kernel/unwind/dwarf_cfi.c.
+ */
+
+#pragma GCC diagnostic push
+#pragma GCC diagnostic ignored "-Wunused-parameter"
+#include "llvm/MC/MCInst.h"
+#include "llvm/Support/Endian.h"
+#include "llvm/Support/raw_ostream.h"
+#pragma GCC diagnostic pop
+
+#include "verify_cfi.hpp"
+
+#include <algorithm>
+#include <cinttypes>
+#include <cstdio>
+
+extern "C" {
+#include <asm/orc_types.h>
+}
+
+using namespace llvm;
+
+/**
+ * verifyOracle3Orc() - Cross-check x86-64 .orc_unwind against Minimal DWARF CFI
+ * @AS: Target architecture specification (x86_64).
+ * @eh_hdr_vma: Virtual address of .eh_frame_hdr.
+ * @eh_hdr_bytes: Raw contents of .eh_frame_hdr.
+ * @orc_bytes: Raw contents of .orc_unwind (6-byte &struct orc_entry records).
+ * @orc_ip_bytes: Raw contents of .orc_unwind_ip (PC-relative s32 offsets).
+ * @orc_ip_vma: Virtual address of .orc_unwind_ip.
+ * @exec_secs: Executable ELF sections.
+ * @func_syms: Deduplicated STT_FUNC symbol list.
+ * @Disasm: x86-64 LLVM MCDisassembler.
+ * @STI: Target subtarget info for instruction printing.
+ * @InstPrinter: Disassembly formatter for mismatch diagnostics.
+ * @opts: CLI verification options.
+ * @st: Aggregated verification counters and diagnostic samples.
+ *
+ * Evaluates every instruction inside STT_FUNC symbols whose active ORC record
+ * has type %ORC_TYPE_CALL and a defined SP base register, mapping `<asm/
+ * orc_types.h>` `ORC_REG_*` encodings directly to `DWARF_CFI_BASE_*` and
+ * `DWARF_CFI_RULE_*` fields.
+ */
+void verifyOracle3Orc(const ArchSpec &AS, uint64_t eh_hdr_vma,
+		      StringRef eh_hdr_bytes, StringRef orc_bytes,
+		      StringRef orc_ip_bytes, uint64_t orc_ip_vma,
+		      const std::vector<ExecSec> &exec_secs,
+		      const std::vector<FuncSym> &func_syms,
+		      const MCDisassembler &Disasm, const MCSubtargetInfo &STI,
+		      MCInstPrinter &InstPrinter, const VerifyOptions &opts,
+		      VerifyStats &st)
+{
+	st.has_orc = true;
+	constexpr size_t kOrcEntSz = 6;
+	size_t n_orc = orc_bytes.size() / kOrcEntSz;
+	size_t n_ip = orc_ip_bytes.size() / 4;
+	size_t n = std::min(n_orc, n_ip);
+	const uint8_t *orc_raw =
+		reinterpret_cast<const uint8_t *>(orc_bytes.data());
+	const uint8_t *ip_raw =
+		reinterpret_cast<const uint8_t *>(orc_ip_bytes.data());
+
+	std::vector<std::pair<uint64_t, size_t>> sorted_orc;
+	sorted_orc.reserve(n);
+	for (size_t i = 0; i < n; i++) {
+		int32_t rel = (int32_t)support::endian::read32le(ip_raw + i * 4);
+		uint64_t epc = orc_ip_vma + i * 4 + (uint64_t)(int64_t)rel;
+		sorted_orc.push_back({epc, i});
+	}
+	std::stable_sort(sorted_orc.begin(), sorted_orc.end(),
+			 [](const auto &a, const auto &b) {
+				 return a.first < b.first;
+			 });
+
+	auto lookupOrcIdx = [&](uint64_t pc, size_t &idx_out) -> bool {
+		auto it = std::upper_bound(
+			sorted_orc.begin(), sorted_orc.end(), pc,
+			[](uint64_t val, const std::pair<uint64_t, size_t> &e) {
+				return val < e.first;
+			});
+		if (it == sorted_orc.begin())
+			return false;
+		--it;
+		idx_out = it->second;
+		return true;
+	};
+
+	for (const FuncSym &fn : func_syms) {
+		if (!fn.size)
+			continue;
+		ArrayRef<uint8_t> code =
+			findExecBytes(exec_secs, fn.addr, fn.size);
+		if (code.empty())
+			continue;
+
+		uint64_t off = 0;
+		while (off < code.size()) {
+			uint64_t pc = fn.addr + off;
+			MCInst MI;
+			uint64_t InsnSize = 0;
+			auto DStat = Disasm.getInstruction(
+				MI, InsnSize, code.slice(off), pc, nulls());
+			if (DStat != MCDisassembler::Success || InsnSize == 0) {
+				off++;
+				continue;
+			}
+			off += InsnSize;
+
+			size_t oidx = 0;
+			if (!lookupOrcIdx(pc, oidx))
+				continue;
+			const uint8_t *ep = orc_raw + oidx * kOrcEntSz;
+			int16_t sp_offset =
+				(int16_t)support::endian::read16le(ep + 0);
+			int16_t bp_offset =
+				(int16_t)support::endian::read16le(ep + 2);
+			uint16_t flags = support::endian::read16le(ep + 4);
+
+			unsigned o_sp_reg = flags & 0xf;
+			unsigned o_bp_reg = (flags >> 4) & 0xf;
+			unsigned o_type = (flags >> 8) & 0x7;
+			if (o_type != ORC_TYPE_CALL ||
+			    o_sp_reg == ORC_REG_UNDEFINED)
+				continue;
+
+			st.orc_call_insns++;
+			dwarf_cfi_row row{};
+			if (dwarf_cfi_unwind_user_eh_frame_hdr(
+				    (unsigned long)eh_hdr_vma,
+				    eh_hdr_bytes.size(), (unsigned long)pc,
+				    &AS.karch, &row) != 0) {
+				st.orc_no_fde++;
+				continue;
+			}
+
+			bool cfa_ok = false;
+			if (o_sp_reg == ORC_REG_SP) {
+				cfa_ok = (row.cfa_base == DWARF_CFI_BASE_SP &&
+					  row.cfa_off == sp_offset);
+			} else if (o_sp_reg == ORC_REG_BP) {
+				cfa_ok = (row.cfa_base == DWARF_CFI_BASE_FP &&
+					  row.cfa_off == sp_offset);
+			} else if (o_sp_reg == ORC_REG_BP_INDIRECT) {
+				cfa_ok = (row.cfa_base ==
+						  DWARF_CFI_BASE_FP_INDIRECT &&
+					  row.cfa_off == sp_offset);
+			} else if (o_sp_reg == ORC_REG_SP_INDIRECT) {
+				cfa_ok = (row.cfa_base ==
+						  DWARF_CFI_BASE_SP_INDIRECT &&
+					  row.cfa_off == sp_offset);
+			} else if (row.cfa_base == DWARF_CFI_BASE_REG) {
+				int exp_dreg = (o_sp_reg == ORC_REG_AX) ? 0 :
+					       (o_sp_reg == ORC_REG_DX) ? 1 :
+					       (o_sp_reg == ORC_REG_DI) ? 5 :
+					       (o_sp_reg == ORC_REG_R10) ? 10 :
+					       (o_sp_reg == ORC_REG_R13) ? 13 :
+					       -1;
+				cfa_ok = (row.cfa_reg == exp_dreg &&
+					  row.cfa_off == sp_offset);
+			}
+
+			bool bp_ok = false;
+			if (o_bp_reg == ORC_REG_UNDEFINED) {
+				bp_ok = (row.fp_rule == DWARF_CFI_RULE_SAME);
+			} else if (o_bp_reg == ORC_REG_PREV_SP) {
+				bp_ok = (row.fp_rule == DWARF_CFI_RULE_OFFSET &&
+					 row.fp_off == bp_offset);
+			} else if (o_bp_reg == ORC_REG_BP) {
+				bp_ok = (row.fp_rule ==
+						 DWARF_CFI_RULE_FP_OFFSET &&
+					 row.fp_off == bp_offset);
+			}
+
+			if (cfa_ok && bp_ok) {
+				st.orc_matched++;
+			} else {
+				if (!cfa_ok)
+					st.orc_cfa_mismatch++;
+				if (!bp_ok)
+					st.orc_bp_mismatch++;
+				if (st.sample_orc_diffs.size() <
+				    opts.max_samples * 3) {
+					std::string dis_str;
+					raw_string_ostream rso(dis_str);
+					InstPrinter.printInst(&MI, pc, "", STI,
+							      rso);
+					char b[256];
+					snprintf(b, sizeof(b),
+						 "%s+0x%" PRIx64 " (0x%" PRIx64
+						 ")%s | ORC(sp=%u:%+d bp=%u:%+d)"
+						 " vs CFI(cfa=%u:%+d fp=%u:%+d)",
+						 fn.name.c_str(), pc - fn.addr,
+						 pc, rso.str().c_str(), o_sp_reg,
+						 sp_offset, o_bp_reg, bp_offset,
+						 row.cfa_base, row.cfa_off,
+						 row.fp_rule, row.fp_off);
+					st.sample_orc_diffs.push_back(b);
+				}
+			}
+		}
+	}
+}
-- 
2.56.1.831.g720f3f5937-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
