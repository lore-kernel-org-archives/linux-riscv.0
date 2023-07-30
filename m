Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDEAC00528
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jul 2023 08:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yVHuzoc8WbxA0rYswO3muA2DhskvfYDvO0kUAifd1Fo=; b=G2a9wBomGcLXwE
	xZT0RX2QUFeNPmZYAUPh+yfYZ8H99qa4blXSSewekhBL0lqdqOas3MleLaGu/w/jQgB+K92h0HGg0
	YNvLxTjx/1sGD30+mzebPU8Nu0DdkfyWeeatcxUYDGn6Tqf5yr0z1XhJ7dSziykOmZdFmziMWAc9Q
	lbn6jj8XNZ4QNsq3i/MhjqpcjiB9I1M4FWalTCPAspWyrtupGKtkhx+U7BFAFP/uuDX5gfVtSlYc0
	xdOGIrhfGh5IIwYkChOEBB3xe3NFVnLkjhdjMt2/+ZmLFX62Ave6+POzrI4tXLXuYdNB7ymhF278i
	n7LGw1cqXlZPGVLdQxWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQ1m3-00AXg2-0q;
	Sun, 30 Jul 2023 08:27:35 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQ1lv-00AXbn-1b
	for linux-riscv@lists.infradead.org;
	Sun, 30 Jul 2023 08:27:30 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99c10ba30afso36371966b.1
        for <linux-riscv@lists.infradead.org>; Sun, 30 Jul 2023 01:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690705642; x=1691310442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vN0J3GV61DkjP0ahWmkHwTyaQTvoRppASb5qgqqzbjw=;
        b=YZ2PPNBg6wWWnGRDU+wNzK5MoU3WKBPc9bVBjoUVTHI40uNXcmzZbmcbHV/KePlTAA
         AvBLFvCrTMZr49yldYsyTtHx5WeF60pgvz27lPOQgW4mVziCjoiwqLLqE9sw6s88Eu8q
         wazoKoBUdGEmiu9gptXikAzNwam/aXa8cYvusmmzBQozVt17FXPHU8oGcZMvjf63r3wE
         S1EvUfy74hilsMM5ZmtGoutxXKH+RtveolpjldW+9ZONd1ESlxIIaj+HNpFCEDgEQMOp
         Yfh7PFJNxyTOWkuQ2KNS4zA+6sbc7NXFBRQgbk0atwu0WxWLY0qOPzPc3AtxIeehAFrS
         t+Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690705642; x=1691310442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vN0J3GV61DkjP0ahWmkHwTyaQTvoRppASb5qgqqzbjw=;
        b=dYu0ygKVPoEoT36wXCqYjRp8rhGMEbrpEpZc45T+ZD+wOWSOtavOoqaitSQU9E/xD5
         o4UZ9mRilX+vn1FI9/WbWkmY0YYdXo3Cq/mG75Jb/Zx5ecNke9tZjYwQXVMNzEFouGcF
         ZUdYXEws4APWGBf/zs8WGCnQR84G+ArjI/EVC62QElBPZueWM1aOZOUPiLZA0RMv1fhm
         k0PZMdESjaJW1+TUaZiz9YIs37EoH6K7kB2nH/Ot+yEo09+069twgG91YI+tzNUIlLmm
         aWHtYuEP59HdPHSPLuxuoDwoNq9b1za3tjrl59ut7IBJMnrwHYCMOxueNh1s7mOzpdDB
         28Yw==
X-Gm-Message-State: ABy/qLZJrcp3cZ+lv7CEVsYyTns0qjgmcfZKZzLzsYmIN3+maHRmt+VM
	e2aDzqj0EybhHAvOy2HVJhj9NfumGWKPrQ==
X-Google-Smtp-Source: APBJJlGNq1tfaMiD7YOayjCJR0VBHsHKj+FG19g87epOYJbJwj4g1BG7lyZFx5qqyHX0lkQVKOG+sg==
X-Received: by 2002:a17:906:8441:b0:98e:2413:952f with SMTP id e1-20020a170906844100b0098e2413952fmr4407133ejy.18.1690705642114;
        Sun, 30 Jul 2023 01:27:22 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id qk29-20020a170906d9dd00b0098e34446464sm4327706ejb.25.2023.07.30.01.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 01:27:21 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcaov@gmail.com>
Subject: [PATCH 2/3] riscv: kprobes: simulate c.jr and c.jalr instructions
Date: Sun, 30 Jul 2023 10:27:08 +0200
Message-Id: <db8b7787e9208654cca50484f68334f412be2ea9.1690704360.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690704360.git.namcaov@gmail.com>
References: <cover.1690704360.git.namcaov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230730_012727_541431_9FC50316 
X-CRM114-Status: GOOD (  12.90  )
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

kprobes currently rejects c.jr and c.jalr instructions. Implement them.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 arch/riscv/kernel/probes/decode-insn.c   |  4 +--
 arch/riscv/kernel/probes/simulate-insn.c | 37 ++++++++++++++++++++++++
 arch/riscv/kernel/probes/simulate-insn.h |  2 ++
 3 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/probes/decode-insn.c b/arch/riscv/kernel/probes/decode-insn.c
index 39adb07a342d..6dba23a55ac7 100644
--- a/arch/riscv/kernel/probes/decode-insn.c
+++ b/arch/riscv/kernel/probes/decode-insn.c
@@ -29,14 +29,14 @@ riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *api)
 	 * TODO: the REJECTED ones below need to be implemented
 	 */
 #ifdef CONFIG_RISCV_ISA_C
-	RISCV_INSN_REJECTED(c_jr,		insn);
 	RISCV_INSN_REJECTED(c_jal,		insn);
-	RISCV_INSN_REJECTED(c_jalr,		insn);
 	RISCV_INSN_REJECTED(c_beqz,		insn);
 	RISCV_INSN_REJECTED(c_bnez,		insn);
 	RISCV_INSN_REJECTED(c_ebreak,		insn);
 
 	RISCV_INSN_SET_SIMULATE(c_j,		insn);
+	RISCV_INSN_SET_SIMULATE(c_jr,		insn);
+	RISCV_INSN_SET_SIMULATE(c_jalr,		insn);
 #endif
 
 	RISCV_INSN_SET_SIMULATE(jal,		insn);
diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index 3ba45c612cd8..1ead6f4951f9 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -212,3 +212,40 @@ bool __kprobes simulate_c_j(u32 opcode, unsigned long addr, struct pt_regs *regs
 
 	return true;
 }
+
+static bool __kprobes simulate_c_jr_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs,
+					 bool is_jalr)
+{
+	/*
+	 *  15    12 11  7 6   2 1  0
+	 * | funct4 | rs1 | rs2 | op |
+	 *     4       5     5    2
+	 */
+
+	unsigned long jump_addr;
+
+	u32 rs1 = (opcode >> 7) & 0x1f;
+
+	if (rs1 == 0) /* C.JR is only valid when rs1 != x0 */
+		return false;
+
+	if (!rv_insn_reg_get_val(regs, rs1, &jump_addr))
+		return false;
+
+	if (is_jalr && !rv_insn_reg_set_val(regs, 1, addr + 2))
+		return false;
+
+	instruction_pointer_set(regs, jump_addr);
+
+	return true;
+}
+
+bool __kprobes simulate_c_jr(u32 opcode, unsigned long addr, struct pt_regs *regs)
+{
+	return simulate_c_jr_jalr(opcode, addr, regs, false);
+}
+
+bool __kprobes simulate_c_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs)
+{
+	return simulate_c_jr_jalr(opcode, addr, regs, true);
+}
diff --git a/arch/riscv/kernel/probes/simulate-insn.h b/arch/riscv/kernel/probes/simulate-insn.h
index 4bd6c266e7d3..472a1948ec4f 100644
--- a/arch/riscv/kernel/probes/simulate-insn.h
+++ b/arch/riscv/kernel/probes/simulate-insn.h
@@ -25,5 +25,7 @@ bool simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_jal(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_c_j(u32 opcode, unsigned long addr, struct pt_regs *regs);
+bool simulate_c_jr(u32 opcode, unsigned long addr, struct pt_regs *regs);
+bool simulate_c_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs);
 
 #endif /* _RISCV_KERNEL_PROBES_SIMULATE_INSN_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
