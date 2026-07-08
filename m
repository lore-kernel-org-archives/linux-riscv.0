Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96937C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 03:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1gp5YmRwM6P1MZVPSxl2Wr3tWfq9pE+gTgAVYmj/i3A=; b=S5F2j0qAzJmG3V
	L72b8fBMMBRfMF4aYuvrpbtMryAslLQEjFN/cJxLD2uLRu2CkTTNWPp5Qssdm26h8B9k4ELoDxW9g
	ECB5jGOV5vH5Q8uqeMdYq/DpJkU7ShAypaGws5IgBZMyOiEIwHOKzXq76PZDWEAcmrMhyXArop0O6
	I8NYJ+iiBhBjtatX/wuAGeO8g5E4VZjfEYH0wxgZpa7yRmKyKJafZtv3YDzH4rkiWCkyNqGXYf2RD
	qR4KAvh4lgGnsp0nlXNd2uHdRK54ZMNiblkjutjDdlhoYThdRYlZIS3s439ONDh3npiSPLcFTqmXt
	pBFdwSdCsBR/O5O2YFlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5U-0000000GFoX-3Jp0;
	Wed, 08 Jul 2026 03:36:40 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5H-0000000GFd6-0Bkv
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 03:36:38 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-385b78b44a0so228930a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Jul 2026 20:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481786; x=1784086586; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZUKSVyGeuLfaXKowCYVvUoCbvCT/dFsVHPlSOpbXK9I=;
        b=sQg87Oh2njSveYJ6SlaUQKMCS7nCmdemlUbdC1HBQCjNloEaWHqXlflrh4oKgN6iNa
         nPuyopdqLV+6rhSOXw2UdT0rWNgUyTKbHihJ8W37kfcIH1Ts8nS/xPVyZnhj3SrwVb0h
         4ixezsHB8S1myRi7YT5l9zT0Ro09aCHAQhVJdlXGwHL2GPz+SCLF5t4+/X/aZiCMvs46
         6oDA0QLXnp7fOhOi1ZVI8EYMGOyiZGO69eMCWHLxsGzFbrK82HGR5hKQFqW41LRWwPLS
         QKm2W6rVdm6JxjcQ+A20UH4YFQqqCatjOiyjXM1yWzUNJzKMwyHpz9dVwh6h44TAgkCH
         Xwpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481786; x=1784086586;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZUKSVyGeuLfaXKowCYVvUoCbvCT/dFsVHPlSOpbXK9I=;
        b=dqHsZpYKNqueXtMCIho//OBAzQYuv2tnBAB46G50EAH5N3z/0QNuhP0ixwnJVesDRp
         qE6ROnuzg1JQ66gT7cdDwhvNKX6iBar0vrIa0ZOcVM3sWhuvQjP3CY2YpHqbCxa8OuVN
         2vvtx/7SCjoQMIIPkyY6EnYj0oGD09b0BiiCKDadkHaYv4e0G0hWwEYIErMXXb7Yx0cE
         DqAQPb9WiGM1l1gZXbDvW/YC8c7PGlYV2UAD2+3J5iM1JDpf4RBNVG9GLq2FUgCsaRUA
         e3mSLIG8yhDXiMdv2vPh/mP6GjpqdFPTD6iLZxyhak5kfkvmXuykk+/dahpfRzbZJW3N
         JpVg==
X-Gm-Message-State: AOJu0YzBMk5lrLyLf6q4H9FvM7wBH+bJZti6mgXruGn9fueIpBvU4X2n
	xqQTUJ+l5EKX6y/TjeQQyzvxU3diIDuIyWHTTFoxfbd3FkthLa20lr+Y
X-Gm-Gg: AfdE7cmRtUCZOCWElyPaLRtXUc9cJNM4DKMhiDXxS0eLR/SQhNxSqqWnijmUYtKfJyu
	N53ekCazhKVP930eC+XkjZY5Ct1zrs4e2DHbYKpKGFxB8NjbBJt7HVi59zMDfUAVNMB3p4CIX5U
	9Tu7D2lbylp6EgJOs6w9Zyr3EFWq+ZzL8vBWaA1EuLGsMznKgs8OWqBy//KPpZG9bBJBbk1c6q6
	EvogQdvSyu/1BNl3ph3WLZwxv90cXvO6/3et01VWMLQAQigaN6srEAJ6or//yvwJzlOswBwmM1f
	TyrORFCJ8k/383hZ7WEozh6xwellsQUNKyowfXxvGx8PV60XGHjUttMsoKXcbc1fwnDjUdG12qr
	feuoSBInL4uY0o3EI99MyPP38VVp22OMKVWqs8dlMoCFvd5uuGGoB+gAX3HKPML/50X2miJzvzs
	0c6oJy+efaannWQOeFEWrUQUIorb36PR3aBAg37P+UALBUy0y4Eg==
X-Received: by 2002:a17:90b:554e:b0:37f:ceed:e1d8 with SMTP id 98e67ed59e1d1-389406352cemr605706a91.12.1783481786113;
        Tue, 07 Jul 2026 20:36:26 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm21092850eec.29.2026.07.07.20.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:36:25 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Tue, 07 Jul 2026 20:34:27 -0700
Subject: [PATCH v3 04/17] riscv: Add kprobes instruction simulation KUnit
MIME-Version: 1.0
Message-Id: <20260707-riscv_insn_table-v3-4-3f8e5f75ba97@gmail.com>
References: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
In-Reply-To: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Nam Cao <namcao@linutronix.de>, Alexandre Ghiti <alex@ghiti.fr>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Conor Dooley <conor@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783481777; l=11557;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=+jKWnHeDczH8xoiHIK3Lygi5Gw6AxgY9uMrA5zkeP54=;
 b=OEGtZbdzniXuamjk7UknOatyi5ik6a+CReQ9hyBxYkkSKj8T8Q50R03Ihf2+46Gi5d1ZP5Fad
 xr1u1q6MLveDcOz7cpzeb2OiK3xtP57QKtJbMPmmwMLNYXYDUcBH+UC
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_203627_957584_C41DF463 
X-CRM114-Status: GOOD (  18.65  )
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

This KUnit iterates through all 32-bit integers and validates that the
simulation code for kprobes simulates properly. These tests are very
slow so they are gated behind a new kconfig option
CONFIG_RISCV_KPROBES_SIMULATE_KUNIT.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 arch/riscv/kernel/tests/Kconfig.debug              |  13 ++
 arch/riscv/kernel/tests/kprobes/Makefile           |   2 +
 .../kernel/tests/kprobes/test-kprobes-simulate.c   | 250 +++++++++++++++++++++
 arch/riscv/kernel/tests/kprobes/test-kprobes.h     |   6 +
 4 files changed, 271 insertions(+)

diff --git a/arch/riscv/kernel/tests/Kconfig.debug b/arch/riscv/kernel/tests/Kconfig.debug
index 40f8dafffa0a..9eda8938ec15 100644
--- a/arch/riscv/kernel/tests/Kconfig.debug
+++ b/arch/riscv/kernel/tests/Kconfig.debug
@@ -42,6 +42,19 @@ config RISCV_KPROBES_KUNIT
 
          If unsure, say N.
 
+config RISCV_KPROBES_SIMULATE_KUNIT
+       tristate "KUnit test for riscv kprobes instruction simulation" if !KUNIT_ALL_TESTS
+       depends on KUNIT
+       depends on KPROBES
+       default KUNIT_ALL_TESTS
+       help
+         Enable testing for riscv kprobes instruction simulation. Useful for
+         riscv and/or kprobes development. The test verifies that kprobes
+         instruction simulation properly simulates the instructions. These tests
+         are very slow.
+
+         If unsure, say N.
+
 endif # RUNTIME_TESTING_MENU
 
 endmenu # "arch/riscv/kernel runtime Testing"
diff --git a/arch/riscv/kernel/tests/kprobes/Makefile b/arch/riscv/kernel/tests/kprobes/Makefile
index df7256f62313..34db6044e87f 100644
--- a/arch/riscv/kernel/tests/kprobes/Makefile
+++ b/arch/riscv/kernel/tests/kprobes/Makefile
@@ -1,3 +1,5 @@
 obj-$(CONFIG_RISCV_KPROBES_KUNIT) += kprobes_riscv_kunit.o
+obj-$(CONFIG_RISCV_KPROBES_SIMULATE_KUNIT) += kprobes_simulate_riscv_kunit.o
 
 kprobes_riscv_kunit-objs := test-kprobes.o test-kprobes-asm.o
+kprobes_simulate_riscv_kunit-objs := test-kprobes-simulate.o
diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes-simulate.c b/arch/riscv/kernel/tests/kprobes/test-kprobes-simulate.c
new file mode 100644
index 000000000000..d82706685823
--- /dev/null
+++ b/arch/riscv/kernel/tests/kprobes/test-kprobes-simulate.c
@@ -0,0 +1,250 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/kernel.h>
+#include <linux/kprobes.h>
+#include <kunit/test.h>
+
+#include "../../probes/simulate-insn.h"
+
+#include <asm/insn.h>
+#include <asm/text-patching.h>
+
+static void test_kprobe_simulate_riscv(struct kunit *test)
+{
+	unsigned int addr = 0xdeadbeef;
+	unsigned int i = 0;
+
+	do {
+		struct pt_regs regs = { 0 };
+
+		if (riscv_insn_is_jal(i)) {
+			s32 offset = riscv_insn_jal_extract_imm(i);
+			u32 xd_index = riscv_insn_jal_extract_xd(i);
+
+			simulate_jal(i, addr, &regs);
+
+			KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + offset,
+					    "jal instruction (0x%x) incorrectly simulated", i);
+
+			if (xd_index)
+				KUNIT_EXPECT_EQ_MSG(
+					test,
+					riscv_insn_reg_get_val((unsigned long *)&regs, xd_index),
+					addr + 4, "jal instruction (0x%x) incorrectly simulated",
+					i);
+		}
+		if (riscv_insn_is_jalr(i)) {
+			unsigned long reg_addr = 0xffff;
+			s32 offset = riscv_insn_jalr_extract_imm(i);
+			u32 rd_index = riscv_insn_jalr_extract_xd(i);
+			u32 rs1_index = riscv_insn_jalr_extract_xs1(i);
+
+			if (rs1_index)
+				riscv_insn_reg_set_val((unsigned long *)&regs, rs1_index, reg_addr);
+			else
+				reg_addr = 0;
+
+			simulate_jalr(i, addr, &regs);
+
+			KUNIT_EXPECT_EQ_MSG(test, regs.epc, (reg_addr + offset) & ~1,
+					    "jalr instruction (0x%x) incorrectly simulated", i);
+
+			if (rd_index)
+				KUNIT_EXPECT_EQ_MSG(
+					test,
+					riscv_insn_reg_get_val((unsigned long *)&regs, rd_index),
+					addr + 4, "jalr instruction (0x%x) incorrectly simulated",
+					i);
+		} else if (riscv_insn_is_auipc(i)) {
+			s32 offset = riscv_insn_auipc_extract_imm(i);
+			u32 rd_index = riscv_insn_auipc_extract_xd(i);
+
+			simulate_auipc(i, addr, &regs);
+
+			KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + 4,
+					    "auipc instruction (0x%x) incorrectly simulated", i);
+
+			if (rd_index)
+				KUNIT_EXPECT_EQ_MSG(
+					test,
+					riscv_insn_reg_get_val((unsigned long *)&regs, rd_index),
+					(unsigned long)addr + offset,
+					"auipc instruction (0x%x) incorrectly simulated", i);
+		} else if (riscv_insn_is_beq(i)) {
+			s32 offset = riscv_insn_beq_extract_imm(i);
+			u32 rs1_index = riscv_insn_beq_extract_xs1(i);
+			u32 rs2_index = riscv_insn_beq_extract_xs2(i);
+
+			simulate_beq(i, addr, &regs);
+
+			if (riscv_insn_reg_get_val((unsigned long *)&regs, rs1_index) ==
+			    riscv_insn_reg_get_val((unsigned long *)&regs, rs2_index)) {
+				KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + offset,
+						    "beq instruction (0x%x) incorrectly simulated",
+						    i);
+			} else {
+				KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + 4,
+						    "beq instruction (0x%x) incorrectly simulated",
+						    i);
+			}
+		} else if (riscv_insn_is_bne(i)) {
+			s32 offset = riscv_insn_bne_extract_imm(i);
+			u32 rs1_index = riscv_insn_bne_extract_xs1(i);
+			u32 rs2_index = riscv_insn_bne_extract_xs2(i);
+
+			simulate_bne(i, addr, &regs);
+
+			if (riscv_insn_reg_get_val((unsigned long *)&regs, rs1_index) !=
+			    riscv_insn_reg_get_val((unsigned long *)&regs, rs2_index)) {
+				KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + offset,
+						    "bne instruction (0x%x) incorrectly simulated",
+						    i);
+			} else {
+				KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + 4,
+						    "bne instruction (0x%x) incorrectly simulated",
+						    i);
+			}
+		} else if (riscv_insn_is_blt(i)) {
+			s32 offset = riscv_insn_blt_extract_imm(i);
+			u32 rs1_index = riscv_insn_blt_extract_xs1(i);
+			u32 rs2_index = riscv_insn_blt_extract_xs2(i);
+
+			simulate_blt(i, addr, &regs);
+
+			if ((long)riscv_insn_reg_get_val((unsigned long *)&regs, rs1_index) <
+			    (long)riscv_insn_reg_get_val((unsigned long *)&regs, rs2_index)) {
+				KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + offset,
+						    "blt instruction (0x%x) incorrectly simulated",
+						    i);
+			} else {
+				KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + 4,
+						    "blt instruction (0x%x) incorrectly simulated",
+						    i);
+			}
+		} else if (riscv_insn_is_bge(i)) {
+			s32 offset = riscv_insn_bge_extract_imm(i);
+			u32 rs1_index = riscv_insn_bge_extract_xs1(i);
+			u32 rs2_index = riscv_insn_bge_extract_xs2(i);
+
+			simulate_bge(i, addr, &regs);
+
+			if ((long)riscv_insn_reg_get_val((unsigned long *)&regs, rs1_index) >=
+			    (long)riscv_insn_reg_get_val((unsigned long *)&regs, rs2_index)) {
+				KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + offset,
+						    "bge instruction (0x%x) incorrectly simulated",
+						    i);
+			} else {
+				KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + 4,
+						    "bge instruction (0x%x) incorrectly simulated",
+						    i);
+			}
+		} else if (riscv_insn_is_bltu(i)) {
+			s32 offset = riscv_insn_bltu_extract_imm(i);
+			u32 rs1_index = riscv_insn_bltu_extract_xs1(i);
+			u32 rs2_index = riscv_insn_bltu_extract_xs2(i);
+
+			simulate_bltu(i, addr, &regs);
+
+			if (riscv_insn_reg_get_val((unsigned long *)&regs, rs1_index) <
+			    riscv_insn_reg_get_val((unsigned long *)&regs, rs2_index)) {
+				KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + offset,
+						    "bltu instruction (0x%x) incorrectly simulated",
+						    i);
+			} else {
+				KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + 4,
+						    "bltu instruction (0x%x) incorrectly simulated",
+						    i);
+			}
+		} else if (riscv_insn_is_bgeu(i)) {
+			s32 offset = riscv_insn_bgeu_extract_imm(i);
+			u32 rs1_index = riscv_insn_bgeu_extract_xs1(i);
+			u32 rs2_index = riscv_insn_bgeu_extract_xs2(i);
+
+			simulate_bgeu(i, addr, &regs);
+
+			if (riscv_insn_reg_get_val((unsigned long *)&regs, rs1_index) >=
+			    riscv_insn_reg_get_val((unsigned long *)&regs, rs2_index)) {
+				KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + offset,
+						    "bgeu instruction (0x%x) incorrectly simulated",
+						    i);
+			} else {
+				KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + 4,
+						    "bgeu instruction (0x%x) incorrectly simulated",
+						    i);
+			}
+		} else if (riscv_insn_is_c_j(i)) {
+			s32 offset = riscv_insn_c_j_extract_imm(i);
+
+			simulate_c_j(i, addr, &regs);
+
+			KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + offset,
+					    "c.j instruction (0x%x) incorrectly simulated", i);
+		} else if (riscv_insn_is_c_jr(i)) {
+			u32 rs1_index = riscv_insn_c_jr_extract_xs1(i);
+
+			simulate_c_jr(i, addr, &regs);
+
+			KUNIT_EXPECT_EQ_MSG(test, regs.epc,
+					    riscv_insn_reg_get_val((unsigned long *)&regs,
+								   rs1_index),
+					    "c.jr instruction (0x%x) incorrectly simulated", i);
+		} else if (riscv_insn_is_c_jalr(i)) {
+			unsigned long reg_addr = 0xffff;
+			u32 rs1_index = riscv_insn_c_jalr_extract_xs1(i);
+
+			if (rs1_index)
+				riscv_insn_reg_set_val((unsigned long *)&regs, rs1_index, reg_addr);
+			else
+				reg_addr = 0;
+
+			simulate_c_jalr(i, addr, &regs);
+
+			KUNIT_EXPECT_EQ_MSG(test, regs.epc, reg_addr,
+					    "c.jalr instruction (0x%x) incorrectly simulated", i);
+
+			KUNIT_EXPECT_EQ_MSG(test, regs.ra, addr + 2,
+					    "c.jalr instruction (0x%x) incorrectly simulated", i);
+		} else if (riscv_insn_is_c_bnez(i)) {
+			u32 offset;
+			u32 rs1_index = riscv_insn_c_bnez_extract_xs1(i);
+
+			simulate_c_bnez(i, addr, &regs);
+
+			if (riscv_insn_reg_get_val((unsigned long *)&regs, rs1_index + 8) != 0)
+				offset = riscv_insn_c_bnez_extract_imm(i);
+			else
+				offset = 2;
+
+			KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + offset,
+					    "c.bnez instruction (0x%x) incorrectly simulated", i);
+		} else if (riscv_insn_is_c_beqz(i)) {
+			u32 offset;
+			u32 rs1_index = riscv_insn_c_beqz_extract_xs1(i);
+
+			simulate_c_beqz(i, addr, &regs);
+
+			if (riscv_insn_reg_get_val((unsigned long *)&regs, rs1_index + 8) == 0)
+				offset = riscv_insn_c_beqz_extract_imm(i);
+			else
+				offset = 2;
+
+			KUNIT_EXPECT_EQ_MSG(test, regs.epc, addr + offset,
+					    "c.beqz instruction (0x%x) incorrectly simulated", i);
+		}
+	} while (++i > 0);
+}
+
+static struct kunit_case kprobes_simulate_testcases[] = {
+	KUNIT_CASE_SLOW(test_kprobe_simulate_riscv),
+	{}
+};
+
+static struct kunit_suite kprobes_simulate_test_suite = {
+	.name = "kprobes_simulate_riscv",
+	.test_cases = kprobes_simulate_testcases,
+};
+
+kunit_test_suites(&kprobes_simulate_test_suite);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("KUnit test for riscv kprobes instruction simulatation");
diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes.h b/arch/riscv/kernel/tests/kprobes/test-kprobes.h
index 537f44aa9d3f..7a672de8f130 100644
--- a/arch/riscv/kernel/tests/kprobes/test-kprobes.h
+++ b/arch/riscv/kernel/tests/kprobes/test-kprobes.h
@@ -19,6 +19,12 @@ extern void *test_kprobes_addresses[];
 /* array of functions that return KPROBE_TEST_MAGIC */
 extern long (*test_kprobes_functions[])(void);
 
+void test_kprobes_arbitrary(void);
+
+extern unsigned int *test_kprobes_arbitrary_addr;
+
+extern unsigned int *test_kprobes_c_bnez_addr1;
+
 #endif /* __ASSEMBLER__ */
 
 #endif /* TEST_KPROBES_H */

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
