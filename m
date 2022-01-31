Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C51C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 18:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GW96CPND3IDXIlCjq1GQtuFX2I0NC7pyVKjt8cUvO/g=; b=QOBknT8R4TpeQ9
	Mf+H6UkOsK4b8+/MwcQKI4DKWG/cd+NPY/EHxxzVdPeQX18dMFF/H1qyXwRWWQl6QDkdEYPAUWkDu
	XCw1Xf6b5XMpJ+nOXjBGClf7MBomcHUMHLQaptO1Jlw2+Dsodw63JBiT5cle1YWF3XCgskCkEgAI8
	VwLQQvqwwQXbigD8Lfqa7VERzd2SrwMGKPHY61jb0yNzKaqaFP4/AXo/yc7q9R5JzmYS2IkarJjYe
	yFoWG8xy8GNmLdT4RlhMxP/wUOWRHZLM8l02+8xQEn1z6/vRGWsiieJiWOiYDoHNaH15qBEatWCi7
	CYs8vKs/7+8nCw/XCjQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEbPb-00ALZl-Fd; Mon, 31 Jan 2022 18:28:23 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEbPJ-00ALNr-QT
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 18:28:07 +0000
Received: by mail-oi1-x22a.google.com with SMTP id r27so6176384oiw.4
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 10:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U2McVQuv53c33dZYwtuytrfr7zhfRHKf5OwpDdiji0Q=;
 b=jXncjUEe1a2gGcfncdsQNKvZ5vzVDf3n4UUs/6i0J6Jovf2zn5tkf9YNbcUhJRIhg4
 iiP5AXss/MrSWrwT2nrnFSCUKqo4LurylYJQzQBtUTR9mq/aUdlu8wO44IdVDCaCW+6L
 NNlbkLNAO8/ve9RpEP9HFYPbHdeae7zd3RRsmMTaWG1PkZn6hZS9N36KpE42yE+L/UKN
 yQ/jom03GwNzQ2o0lmB0vxoraJkSvOmzNF21tzteuYplOQJot9C6Jn/yGqc7MRnHmTta
 eABYEarwMVl+7m0KRcJ2VcS4VNXOomnltMSl4Kyvtjt5bCCCZT9xPD97gTjLHPmtSJCI
 tnQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=U2McVQuv53c33dZYwtuytrfr7zhfRHKf5OwpDdiji0Q=;
 b=2RHUguA1kE0ugqDAaC1htZnUNVoDpL+tE8wIL98IR/Iz77PTQ2WZS/2PBuSzSFaK1a
 BSt/nykEDsnyRWA6VltXiPunMUTiHp+V3Z+5uszjiTn1FpVyVNUmeb5QBMSDZM9cHQk0
 84BFYx/3Oh7xWwKJHivXROyXgODoxQyV/ycioAGoWPJsK0+QEscRUt2U2eD5NEKAbFTX
 NzLiCrvGCYkKeutJ9sK4OL1MUHmYUPHSBiiWwBpKDcCofm7CRUOufgCNMac3B51Ym8Tp
 QzTi4A2XYuShVuUpJWPbKj6CBa51cUXb7f2B+YJyVtOHSgrCdT6IsKcICueIsY/MveG5
 7c5g==
X-Gm-Message-State: AOAM533AJM8i4WtJfE/xETFPCVFelY4fEG0ceRecjPG29dB6pkAJ4Kgz
 xjDRyplbQr+SwNy8P/e6SECY2sZ2PuQ5rQ==
X-Google-Smtp-Source: ABdhPJykrjHso1HeIEehNxkQa/Hvgme48EycTjUAdgXHfcYLHtwx65a013NI9+o+UcHqFs6xlO//5w==
X-Received: by 2002:aca:1e1a:: with SMTP id m26mr14036052oic.208.1643653684887; 
 Mon, 31 Jan 2022 10:28:04 -0800 (PST)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id a26sm16041676oiy.26.2022.01.31.10.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 10:28:04 -0800 (PST)
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
Subject: [PATCH v2 7/7] riscv: Use asm/insn.h for jump labels
Date: Mon, 31 Jan 2022 19:27:20 +0100
Message-Id: <20220131182720.236065-8-kernel@esmil.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220131182720.236065-1-kernel@esmil.dk>
References: <20220131182720.236065-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_102805_871903_1917199D 
X-CRM114-Status: GOOD (  10.71  )
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

This converts kernel/jump_label.c to use asm/insn.h to generate the
jump/nop instructions.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 arch/riscv/kernel/jump_label.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/jump_label.c b/arch/riscv/kernel/jump_label.c
index 20e09056d141..b5b4892c3e9e 100644
--- a/arch/riscv/kernel/jump_label.c
+++ b/arch/riscv/kernel/jump_label.c
@@ -9,11 +9,9 @@
 #include <linux/memory.h>
 #include <linux/mutex.h>
 #include <asm/bug.h>
+#include <asm/insn.h>
 #include <asm/patch.h>
 
-#define RISCV_INSN_NOP 0x00000013U
-#define RISCV_INSN_JAL 0x0000006fU
-
 void arch_jump_label_transform(struct jump_entry *entry,
 			       enum jump_label_type type)
 {
@@ -23,14 +21,10 @@ void arch_jump_label_transform(struct jump_entry *entry,
 	if (type == JUMP_LABEL_JMP) {
 		long offset = jump_entry_target(entry) - jump_entry_code(entry);
 
-		if (WARN_ON(offset & 1 || offset < -524288 || offset >= 524288))
+		if (WARN_ON(!riscv_insn_valid_20bit_offset(offset)))
 			return;
 
-		insn = RISCV_INSN_JAL |
-			(((u32)offset & GENMASK(19, 12)) << (12 - 12)) |
-			(((u32)offset & GENMASK(11, 11)) << (20 - 11)) |
-			(((u32)offset & GENMASK(10,  1)) << (21 -  1)) |
-			(((u32)offset & GENMASK(20, 20)) << (31 - 20));
+		insn = RISCV_INSN_JAL | riscv_insn_j_imm(offset);
 	} else {
 		insn = RISCV_INSN_NOP;
 	}
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
