Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ED72C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 18:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VGGEGMpYvPKEvnedgucXcLRWaBv7IyN5uKFnsxCjmLw=; b=mNAxpYSz1Slhrh
	gibEJ2UpnngIT9y4vDeTji+UyoaJMDH58yUUhDV0i6qFpbDhvCgbQjkL6H4Qxc8fb0SG3YpT1/Bpa
	FZ/kKy7oqLFsYccPea4cxc60rRIBPwpkzk+w3TAHeWaI7cUgwwIBD8Oklqk2RvM8VPkTrZMRw+hP/
	R7C9tKQI5vkVKNEDsb/TqReE88FTy4eqDnccSH/8MkWCoOxBSr2xzpSWs2Lx9J8m0S5fmiZvsDFvm
	W276YQCwo95Mt/GfaxVUiu431APiUEACXLyHEFLNzmlbvyCuvXQk9+LpCrlDc7RPBYkP7k673O9fo
	Stxs6eWZAjMXciXrSp8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEbPY-00ALXK-A4; Mon, 31 Jan 2022 18:28:20 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEbPF-00ALKu-GB
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 18:28:03 +0000
Received: by mail-oi1-x233.google.com with SMTP id e81so28361841oia.6
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 10:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uv9kZcj+SYuMKmc2v8qVWQoeoD1xbOxuZhUO9LDOn7M=;
 b=ae2tEWK0mabJWBmBgb5+OPbZ4b4jy14di2q6CL9US53w3IQdvYKiJqQL97T2G1wDVb
 M50JwRAHj1f5EZbC/U8JiRH/KACoNyG/uqmAO3x6eKrJkOmt9gJi9U0ifS3seocUEW9r
 hyaY3Xg6rvhtptwS5T0dGbJAKZaAMebQ/Qc53ybw5n+gqM9uxnLXV6hHOkYDR5yGHFS7
 Z3ORY6td/UaqX8Ax1lYM1IDFFab8WZtPvgutSSoaqW4g7/FDPZPYTid+YrJa62DTXZUi
 MhsD7QtoIZwz6MtZUjbgf5vaNl0O/132oNzAS1fkOSz9QfYHQC+Lv79GFuYie5OG218Q
 wjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Uv9kZcj+SYuMKmc2v8qVWQoeoD1xbOxuZhUO9LDOn7M=;
 b=k3I6V+76nOlcbYuIpY4qlZzIk+fkYRBujjno2PsoueHWmAsRzRjD9gThugYsHEc2Mq
 bdu0ldSXKNpakQtriDHFmePFOcsD6LEIL0ViriQgrNN2hYcMvPFAScHRM5DBVtyqtRtT
 HvvU69mjQvaqdOaYXEHJ5QbdgiFvmZj7E+px5CsU2kAZXBEktCjikO53TBPpvFSQPZZq
 51Pgcc4QagVVJMVIOYALmW9G7oJK5Xd1ypgf4BVeVlOTgeTcfH3H8bGwujtnQ10ZBb2w
 jPCKTWsK9YO94HE5IrQ8gNlOxEJ6nnRva3YzuKkmJnKqXDz6W5JxKuUOlXW+FFhZJt0U
 kWow==
X-Gm-Message-State: AOAM532g7FrpaBuQmujWk7ZTKAkrn7GMFGQc3AnuzXpFuaw+DfktNwPC
 cU8o/CAY3DW9oyrQRoO3XpNjHehC1i6eAg==
X-Google-Smtp-Source: ABdhPJw/C4So3Aq1Zja1WakK5TxhFMU6yk7ULAS3F55FaGH/rIbSkWXxwvjmSKICqrUp4l6kNQa84Q==
X-Received: by 2002:aca:aa86:: with SMTP id
 t128mr13285285oie.169.1643653680913; 
 Mon, 31 Jan 2022 10:28:00 -0800 (PST)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id a26sm16041676oiy.26.2022.01.31.10.27.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 10:28:00 -0800 (PST)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jason Baron <jbaron@akamai.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/7] riscv: Use asm/insn.h to generate plt entries
Date: Mon, 31 Jan 2022 19:27:19 +0100
Message-Id: <20220131182720.236065-7-kernel@esmil.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220131182720.236065-1-kernel@esmil.dk>
References: <20220131182720.236065-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_102801_561911_44C7D2AF 
X-CRM114-Status: GOOD (  11.14  )
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

This converts kernel/module-sections.c to use asm/insn.h to generate
the instructions in the plt entries.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 arch/riscv/kernel/module-sections.c | 27 ++++-----------------------
 1 file changed, 4 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/kernel/module-sections.c b/arch/riscv/kernel/module-sections.c
index 39d4ac681c2a..cb73399c3603 100644
--- a/arch/riscv/kernel/module-sections.c
+++ b/arch/riscv/kernel/module-sections.c
@@ -9,6 +9,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleloader.h>
+#include <asm/insn.h>
 
 struct got_entry {
 	unsigned long symbol_addr;	/* the real variable address */
@@ -61,36 +62,16 @@ struct plt_entry {
 	u32 insn_jr;		/* jr    t1                            */
 };
 
-#define OPC_AUIPC  0x0017
-#define OPC_LD     0x3003
-#define OPC_JALR   0x0067
-#define REG_T0     0x5
-#define REG_T1     0x6
-
 static struct plt_entry emit_plt_entry(unsigned long val,
 				       unsigned long plt,
 				       unsigned long got_plt)
 {
-	/*
-	 * U-Type encoding:
-	 * +------------+----------+----------+
-	 * | imm[31:12] | rd[11:7] | opc[6:0] |
-	 * +------------+----------+----------+
-	 *
-	 * I-Type encoding:
-	 * +------------+------------+--------+----------+----------+
-	 * | imm[31:20] | rs1[19:15] | funct3 | rd[11:7] | opc[6:0] |
-	 * +------------+------------+--------+----------+----------+
-	 *
-	 */
 	unsigned long offset = got_plt - plt;
-	u32 hi20 = (offset + 0x800) & 0xfffff000;
-	u32 lo12 = (offset - hi20);
 
 	return (struct plt_entry) {
-		OPC_AUIPC | (REG_T0 << 7) | hi20,
-		OPC_LD | (lo12 << 20) | (REG_T0 << 15) | (REG_T1 << 7),
-		OPC_JALR | (REG_T1 << 15)
+		RISCV_INSN_AUIPC | RISCV_INSN_RD_T0 | riscv_insn_u_imm(offset + 0x800),
+		RISCV_INSN_LD    | RISCV_INSN_RD_T1 | RISCV_INSN_RS1_T0 | riscv_insn_i_imm(offset),
+		RISCV_INSN_JALR  | RISCV_INSN_RS1_T1,
 	};
 }
 
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
