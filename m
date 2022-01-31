Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18548C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 18:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VGGEGMpYvPKEvnedgucXcLRWaBv7IyN5uKFnsxCjmLw=; b=VfOXPmLUt+NrvY
	hwekKAm0U+0wMoJmFfgfFIXU2jy53/uPSiXsEPWI9JI6iTT6YPWaFGc5ki9DwKLhcvHQs0HzAGwPm
	sykOMcEx4B7McFEyEISk+XQJzm9GBsfb+cWpUi1svDzReamH9fEHs2zJ/XZImewS2HhxvagJnQiO/
	/C70E/SnRZaR4IhTHzswJB75T4oEVtaSAIgsKy5F3dtNaC6R5PJjSR19hlDNhEwEWddA/y4upe3Tr
	NtUkPA877WAhgvfav+xcCKwA73bN3qfNUQl1mS0hKPEN/N0b/q1f3VSAeWL9sjnIkLsz6hjMd9uFk
	YDf6oYCeXTXFU8Z+EjgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEbK0-00AJMu-Es; Mon, 31 Jan 2022 18:22:36 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEbJx-00AJJz-R9
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 18:22:35 +0000
Received: by mail-ot1-x32c.google.com with SMTP id
 q14-20020a05683022ce00b005a6162a1620so1062872otc.0
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 10:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uv9kZcj+SYuMKmc2v8qVWQoeoD1xbOxuZhUO9LDOn7M=;
 b=iElq6TWfe6FNOYAB6SZde3+Kjyd36wOCujz4wGdkh8f0ib8i/VM4zSOvU5JoAwfW4o
 zkN1JFwopjcF3PEtY4QhzcFUEYgWaOP0ysi3BUVTSK1l5XghFPpcIwCmaBVcGNYgWIEM
 EKoMCN4Esh15vtBOBrM4RxsNzWNbnW3QG71jsAL0aMY4vMukdFYR8H+PrWlAYWiD8sdz
 5fHGzfBqElGUsvpzUxdcmp4CrF0chVrPB5CeyJbGVNX0lx1bDQrY46Svkl7FnErsURbY
 B8hmCZMlsGEYmuI2b8Tw2YROFPQvqjkTzcs6KqptFRoIKgsSxsw8m7xWtpHdFDcnuBDb
 RzhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Uv9kZcj+SYuMKmc2v8qVWQoeoD1xbOxuZhUO9LDOn7M=;
 b=7enrrsRlEvoahg9fC2pZNvWHWQMZOP1dwd9FpkgEA3457gmwANdMJ0Yv/fMCeMd7cb
 8S5teJaiS8vknqCXa1SEWS3VoxEwGRpSbuBlUx6QkhF2JlbJ6hzGJDvG/nA0agmXTnzu
 bXCsGtgZWkRNeblkDeASmXvd9rCotl2UJlUCJe4gCv0mteqSr877rlQjaeUsbl4lyCaG
 HNDsZ7VgZRUfXGt3EzhT98LbNzQrk1yNlkRR36P4Ev+xiGonQdKGw3ko1CrOWNo+aoIe
 OZ67FuTcID5zYYImWCKEQJ+0gej2z9L3tBlqkrzM24HQ9tiEypy5BZlP93H1YAY3EjEc
 CTRw==
X-Gm-Message-State: AOAM5321qPdG59vvVP0Mt/m/RDo7LmOt06qQPnX4TMUI98EeDtL1eG1X
 Bnf+GFamqePzHA1fh0Y2iRJbaO+JF3U=
X-Google-Smtp-Source: ABdhPJxqEnmembk8ZumxKkHqD6FTwsFFWHtaMX3BJpB/i4c3c3jD4OzuDZo4IZTHWs/KTnXiZk0oHg==
X-Received: by 2002:a9d:12d7:: with SMTP id g81mr12118683otg.82.1643653353310; 
 Mon, 31 Jan 2022 10:22:33 -0800 (PST)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id t4sm12986340oie.14.2022.01.31.10.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 10:22:33 -0800 (PST)
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
Subject: [PATCH v1 5/7] riscv: Use asm/insn.h to generate plt entries
Date: Mon, 31 Jan 2022 19:21:43 +0100
Message-Id: <20220131182145.236005-6-kernel@esmil.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220131182145.236005-1-kernel@esmil.dk>
References: <20220131182145.236005-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_102233_933689_E97B1FB5 
X-CRM114-Status: GOOD (  11.19  )
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
