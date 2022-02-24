Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF59C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Feb 2022 15:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zbcBjMJjVuzOjsguwdY78ZCrS0tQ+VCl5dCq/8lq0IY=; b=4DpNeMUo0LEuca
	AEhQfwKfZtv5Bu6o7zSPXdfKW7xAWxuiX31hLi9geIAzeDbN3AA3NQgw3LRJ6GU9H/qlVtWD/Xy3d
	NvBszMbFw/OKIGJ9gNXYTZZ/qjrdgXQ+w3LVWJ98aP4CaOJzvJ1r8PfMMiRBMj0i3yJEJScC9oJv/
	syHCCfhbI8ACWjpiSsWrQvnxhQorvjWr9kd2Nj43rkua1asuuzEX4cJxjMEASH/xvTcQYjAV0hMYQ
	8bQezjS9EQG9L8aCOKQXVQQqDHJGGfgQ5I1CDjQV49chZxqfyZr0igbZSLXWLb7tbFod4y3Ht29GZ
	pETIYUIcPaoqny9MCWSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNG0B-001IEm-M5; Thu, 24 Feb 2022 15:25:55 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNFzd-001Hvk-U4
 for linux-riscv@lists.infradead.org; Thu, 24 Feb 2022 15:25:25 +0000
Received: by mail-ej1-x633.google.com with SMTP id gb39so5155863ejc.1
 for <linux-riscv@lists.infradead.org>; Thu, 24 Feb 2022 07:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xb6ZbsBfJcNQTb4eFVxZ+eD4ollYnCaYaEUkZiE9buU=;
 b=XE4Mjw0oW6cyh7Jz/klql52/xhVYa6R3/iQA8JMo4UcXgDnA7XP/kt9VYeJjcct+TU
 fk4oaYlJrq1hov7+CB8pLoqAIyKv0UC2H25etYmgwtsr4WVP14vrICEZ5BgFFfFWU29e
 DRVioE05DadX6IfGCD+P7K9pHHkMrtzANp6NuKOWeHc+2ENGdJaGcli8AuoXXlB1/bpQ
 ue8hNGTE7Unql/nSYX95SRS1v2QRT9XD728n90NAVUHegHsCrZyyxhad61I3wI52C+m2
 rt5/9+PVIa8+J0vi43+bWyU1ZpJ1OzngNS/tZUF7gqylKf4z8jrPmMjCnhY9ny3/zBs/
 +ddQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xb6ZbsBfJcNQTb4eFVxZ+eD4ollYnCaYaEUkZiE9buU=;
 b=yt6Ilg2CJkLk0MpVtAYKh0IXQLn0HeiSV7sk8RFNrV1wSzLBKuVr+biVLW/YRNHJML
 DQy4VaYG0w2RZQ6j3auG4tKKhRb48ANZ+HOWXYmpR17QQFc18Hp+RQIpWvWcnGSpIe45
 /r5jB4Njt2EnJZVD8nGaEZgCrb/2gLjsA6563qZYtq/JsGj+nKYwXTieqIdGMu8WQuju
 SM5ehJ6z3VImUMLJlLIwkcXYFLf01U3xfpadhL1aKEb2BekXoiWfiCJ2tmKBiGVr3UgX
 dK0Ljj/WLq0SVFB6LuFdrUrtoO0vL/2qqkRG7s+z87nsHPVMQi+jb2F27njYC35vW9qN
 N+DA==
X-Gm-Message-State: AOAM533EMxReyHGAGbQS2ZsUguCKdcrATHmxPK2Ga+EtH0X6IDCThimf
 6ds5NmiVKo1mt4NzfLc742cASBfqofF3fh8N
X-Google-Smtp-Source: ABdhPJyal/+V9nN3rpbn43hnO657ZZ2qZJ/qzGLGOKSpxlqsaAfLg7zoK74dogk+Cxfnd6mQyPpG/Q==
X-Received: by 2002:a17:907:3c7:b0:6cd:5399:c1ad with SMTP id
 su7-20020a17090703c700b006cd5399c1admr2687583ejb.547.1645716320508; 
 Thu, 24 Feb 2022 07:25:20 -0800 (PST)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id s11sm1509693edt.10.2022.02.24.07.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 07:25:20 -0800 (PST)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jason Baron <jbaron@akamai.com>,
 Ard Biesheuvel <ardb@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/8] riscv: Add asm/insn.h header
Date: Thu, 24 Feb 2022 16:24:52 +0100
Message-Id: <20220224152456.493365-5-kernel@esmil.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220224152456.493365-1-kernel@esmil.dk>
References: <20220224152456.493365-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220224_072522_087521_994BD2F9 
X-CRM114-Status: GOOD (  12.55  )
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

Add new asm/insn.h header to consolidate RISC-V instruction constants
and inline helper functions.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 arch/riscv/include/asm/insn.h | 151 ++++++++++++++++++++++++++++++++++
 1 file changed, 151 insertions(+)
 create mode 100644 arch/riscv/include/asm/insn.h

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
new file mode 100644
index 000000000000..02f387a06ef3
--- /dev/null
+++ b/arch/riscv/include/asm/insn.h
@@ -0,0 +1,151 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 Emil Renner Berthing
+ */
+#ifndef __ASM_RISCV_INSN_H
+#define __ASM_RISCV_INSN_H
+
+#include <linux/const.h>
+
+#define RISCV_INSN_LW		_AC(0x00002003, U)
+#define RISCV_INSN_LD		_AC(0x00003003, U)
+#define RISCV_INSN_ADDI		_AC(0x00000013, U)
+#define RISCV_INSN_NOP		RISCV_INSN_ADDI
+#define RISCV_INSN_SW		_AC(0x00002023, U)
+#define RISCV_INSN_SD		_AC(0x00003023, U)
+#define RISCV_INSN_AUIPC	_AC(0x00000017, U)
+#define RISCV_INSN_LUI		_AC(0x00000037, U)
+#define RISCV_INSN_JALR		_AC(0x00000067, U)
+#define RISCV_INSN_JAL		_AC(0x0000006f, U)
+
+#if __riscv_xlen == 64
+#define RISCV_INSN_REG_L	RISCV_INSN_LD
+#define RISCV_INSN_REG_S	RISCV_INSN_SD
+#define RISCV_INSN_SZREG	8
+#elif __riscv_xlen == 32
+#define RISCV_INSN_REG_L	RISCV_INSN_LW
+#define RISCV_INSN_REG_S	RISCV_INSN_SW
+#define RISCV_INSN_SZREG	4
+#else
+#error "Unexpected __riscv_xlen"
+#endif
+
+#define RISCV_INSN_RA		_AC(0x1, U)
+#define RISCV_INSN_SP		_AC(0x2, U)
+#define RISCV_INSN_T0		_AC(0x5, U)
+#define RISCV_INSN_T1		_AC(0x6, U)
+
+#define RISCV_INSN_RD_POS	7
+#define RISCV_INSN_RD_RA	(RISCV_INSN_RA << RISCV_INSN_RD_POS)
+#define RISCV_INSN_RD_SP	(RISCV_INSN_SP << RISCV_INSN_RD_POS)
+#define RISCV_INSN_RD_T0	(RISCV_INSN_T0 << RISCV_INSN_RD_POS)
+#define RISCV_INSN_RD_T1	(RISCV_INSN_T1 << RISCV_INSN_RD_POS)
+
+#define RISCV_INSN_RS1_POS	15
+#define RISCV_INSN_RS1_RA	(RISCV_INSN_RA << RISCV_INSN_RS1_POS)
+#define RISCV_INSN_RS1_SP	(RISCV_INSN_SP << RISCV_INSN_RS1_POS)
+#define RISCV_INSN_RS1_T0	(RISCV_INSN_T0 << RISCV_INSN_RS1_POS)
+#define RISCV_INSN_RS1_T1	(RISCV_INSN_T1 << RISCV_INSN_RS1_POS)
+
+#define RISCV_INSN_RS2_POS	20
+#define RISCV_INSN_RS2_RA	(RISCV_INSN_RA << RISCV_INSN_RS2_POS)
+#define RISCV_INSN_RS2_SP	(RISCV_INSN_SP << RISCV_INSN_RS2_POS)
+#define RISCV_INSN_RS2_T0	(RISCV_INSN_T0 << RISCV_INSN_RS2_POS)
+#define RISCV_INSN_RS2_T1	(RISCV_INSN_T1 << RISCV_INSN_RS2_POS)
+
+#define RISCV_INSN_I_IMM_MASK	_AC(0xfff00000, U)
+#define RISCV_INSN_S_IMM_MASK	_AC(0xfe000f80, U)
+#define RISCV_INSN_B_IMM_MASK	_AC(0xfe000f80, U)
+#define RISCV_INSN_U_IMM_MASK	_AC(0xfffff000, U)
+#define RISCV_INSN_J_IMM_MASK	_AC(0xfffff000, U)
+
+#define RISCV_INSN_CI_IMM_MASK	_AC(0x107c, U)
+#define RISCV_INSN_CSS_IMM_MASK	_AC(0x1f80, U)
+#define RISCV_INSN_CIW_IMM_MASK	_AC(0x1fe0, U)
+#define RISCV_INSN_CL_IMM_MASK	_AC(0x1c60, U)
+#define RISCV_INSN_CS_IMM_MASK	_AC(0x1c60, U)
+#define RISCV_INSN_CB_IMM_MASK	_AC(0x1c7c, U)
+#define RISCV_INSN_CJ_IMM_MASK	_AC(0x1ffc, U)
+
+#ifndef __ASSEMBLY__
+#include <linux/bits.h>
+#include <asm/types.h>
+
+/*
+ * The J-format jump and link instruction, jal, has a 20bit immediate except
+ * bit 0 is always taken to be 0, so it must be even and is interpreted as a
+ * signed value.
+ */
+static inline bool riscv_insn_valid_20bit_offset(ptrdiff_t val)
+{
+	return !(val & 1) && -(1L << 19) <= val && val < (1L << 19);
+}
+
+/*
+ * The auipc+jalr instruction pair can reach any PC-relative offset
+ * in the range [-2^31 - 2^11, 2^31 - 2^11)
+ */
+static inline bool riscv_insn_valid_32bit_offset(ptrdiff_t val)
+{
+#if __riscv_xlen == 32
+	return true;
+#else
+	return (-(1L << 31) - (1L << 11)) <= val && val < ((1L << 31) - (1L << 11));
+#endif
+}
+
+static inline u32 riscv_insn_i_imm(u32 imm)
+{
+	return (imm & GENMASK(11, 0)) << 20;
+}
+
+static inline u32 riscv_insn_s_imm(u32 imm)
+{
+	return (imm & GENMASK( 4, 0)) << ( 7 - 0) |
+	       (imm & GENMASK(11, 5)) << (25 - 5);
+}
+
+static inline u32 riscv_insn_b_imm(u32 imm)
+{
+	return (imm & GENMASK(11, 11)) >> (11 -  7) |
+	       (imm & GENMASK( 4,  1)) << ( 8 -  1) |
+	       (imm & GENMASK(10,  5)) << (25 -  5) |
+	       (imm & GENMASK(12, 12)) << (31 - 12);
+}
+
+static inline u32 riscv_insn_u_imm(u32 imm)
+{
+	return imm & GENMASK(31, 12);
+}
+
+static inline u32 riscv_insn_j_imm(u32 imm)
+{
+	return (imm & GENMASK(19, 12)) << (12 - 12) |
+	       (imm & GENMASK(11, 11)) << (20 - 11) |
+	       (imm & GENMASK(10,  1)) << (21 -  1) |
+	       (imm & GENMASK(20, 20)) << (31 - 20);
+}
+
+static inline u16 riscv_insn_rvc_branch_imm(u16 imm)
+{
+	return (imm & GENMASK(5, 5)) >> ( 5 - 2) |
+	       (imm & GENMASK(2, 1)) << ( 3 - 1) |
+	       (imm & GENMASK(7, 6)) >> ( 6 - 5) |
+	       (imm & GENMASK(4, 3)) << (10 - 3) |
+	       (imm & GENMASK(8, 8)) << (12 - 8);
+}
+
+static inline u16 riscv_insn_rvc_jump_imm(u16 imm)
+{
+	return (imm & GENMASK( 5,  5)) >> ( 5 -  2) |
+	       (imm & GENMASK( 3,  1)) << ( 3 -  1) |
+	       (imm & GENMASK( 7,  7)) >> ( 7 -  6) |
+	       (imm & GENMASK( 6,  6)) << ( 7 -  6) |
+	       (imm & GENMASK(10, 10)) >> (10 -  8) |
+	       (imm & GENMASK( 9,  8)) << ( 9 -  8) |
+	       (imm & GENMASK( 4,  4)) << (11 -  4) |
+	       (imm & GENMASK(11, 11)) << (12 - 11);
+}
+
+#endif
+#endif
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
