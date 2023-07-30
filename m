Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDFAC04E69
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jul 2023 08:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ul4V8xObkqgLFb2hzqb2JLZ2oD7nJegYSjqLymEMWXY=; b=jm3vRP3K5WhYO7
	srl3fCx2KrsyDjxImM/c5PV7Y1E6j+CXv79cTGZrKABFPF0VQIQC7GNedYPEfkBN2nV131bQPWpwp
	zdEIYIZ9ODD+Uzcg84BnpV0C+1tigjZm2uhU1AtRYSUXtYBXsSVYFaPU8OMDgXradejTqcdZccMhy
	0ij6NFV0jukcS1pPG+p/GAsxxkmhrd6pQHZZvdR6ZCRHBLHNAKkMLQJ3l4hc9Poxij7edAOBKfsLz
	6oye2EJ7QCxZk4SGqxZSQvmpq4u+WEcR0MolzlQruhI7DJ8b2M3Ofr09/XCgMuQa5erIIuKeZuoja
	ES0fd7HO7Nnn4kzEAHxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQ1m3-00AXgL-2b;
	Sun, 30 Jul 2023 08:27:35 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQ1lv-00AXc0-1c
	for linux-riscv@lists.infradead.org;
	Sun, 30 Jul 2023 08:27:30 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9922d6f003cso565355766b.0
        for <linux-riscv@lists.infradead.org>; Sun, 30 Jul 2023 01:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690705643; x=1691310443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SimULQDdjpxXsYNdrfirKLk/fw8zuGv/egec0Yb7dzM=;
        b=Ka3V4bKaipjHIdFwBaUbvZopzCCe7cVlYdzQdNIAY9n6AyuDohH4211nmO3bbJ0Xdg
         Ur0LWW2k9uEXsnlWhaBWI0p2ybgnV00QpSTvbZoPhQyCNx5Ir2Woi0bFudpmb52ynpJk
         ePutJ+JeE0YVQuiJqkllHi9DbdxxTNI/m496ybuqV8txe4ucnSZICAFThXnLkkFYCJSh
         AEs+Yk+Uc5uz7+wFWgWiACGxsPKVM4q3vMD4/CcOk09PU+Z5e8Fvk1hCzwcZs1xhryaZ
         DnrVUhkNKibdML6rONMM386r/39VektrRLvv11bmJNfTHI65A5OEAsow8Mdnttalrr+O
         5LiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690705643; x=1691310443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SimULQDdjpxXsYNdrfirKLk/fw8zuGv/egec0Yb7dzM=;
        b=VwH8i0PZN3P+46oE+MrUfjjUaMPmli3e6nmX76BWE/9p2x/L+Fsc7ZR4zQDC9wiPLn
         plPH8KS87B+Yg2qJzF3i5LEv+Uw0hXfiQ4Merq1ZWVFAn2EuYpomkUknwJDFTL7WWyHj
         58IPtHDaI2AtJRAVo58MKquRw9T+X3OPVybk9mG6GOeFjPwn/YMDBM4iAg1yS+YSHjxW
         0OWVk2HyzlsSEzslJNeZvEAfpctT7OfYCs5faJPYYpmGWlah/WtHtb/fiLQGnk1iQ4VE
         QIJYhv/hzB+m9hRhaHR5/aFUobo9wBBeOGZSNfsUJ80tDK6yahMgazMBrb6iA8JPUZ79
         StuA==
X-Gm-Message-State: ABy/qLbyMKCgvI52RShCyZ0OsolhEORVRYPmSJEFXjGpNihPci3Jk/28
	6mELpUAggSvEg0XR4TPOyC8=
X-Google-Smtp-Source: APBJJlHuYaRULyZJssvkHmCmmwoVNjfNhvOm5DYln4RYnWRjLUMNsD8+TP8VgT1J4/gKJsVzi0knqw==
X-Received: by 2002:a17:906:530e:b0:993:6845:89d6 with SMTP id h14-20020a170906530e00b00993684589d6mr4470426ejo.47.1690705643484;
        Sun, 30 Jul 2023 01:27:23 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id n16-20020a1709067b5000b009927a49ba94sm4333519ejo.169.2023.07.30.01.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 01:27:23 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcaov@gmail.com>
Subject: [PATCH 3/3] riscv: kprobes: simulate c.beqz and c.bnez
Date: Sun, 30 Jul 2023 10:27:09 +0200
Message-Id: <1d879dba4e4ee9a82e27625d6483b5c9cfed684f.1690704360.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690704360.git.namcaov@gmail.com>
References: <cover.1690704360.git.namcaov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230730_012727_543760_D2AC119E 
X-CRM114-Status: GOOD (  13.85  )
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

kprobes currently rejects instruction c.beqz and c.bnez. Implement them.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 arch/riscv/kernel/probes/decode-insn.c   |  4 +--
 arch/riscv/kernel/probes/simulate-insn.c | 44 ++++++++++++++++++++++++
 arch/riscv/kernel/probes/simulate-insn.h |  2 ++
 3 files changed, 48 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/probes/decode-insn.c b/arch/riscv/kernel/probes/decode-insn.c
index 6dba23a55ac7..65d9590bfb9f 100644
--- a/arch/riscv/kernel/probes/decode-insn.c
+++ b/arch/riscv/kernel/probes/decode-insn.c
@@ -30,13 +30,13 @@ riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *api)
 	 */
 #ifdef CONFIG_RISCV_ISA_C
 	RISCV_INSN_REJECTED(c_jal,		insn);
-	RISCV_INSN_REJECTED(c_beqz,		insn);
-	RISCV_INSN_REJECTED(c_bnez,		insn);
 	RISCV_INSN_REJECTED(c_ebreak,		insn);
 
 	RISCV_INSN_SET_SIMULATE(c_j,		insn);
 	RISCV_INSN_SET_SIMULATE(c_jr,		insn);
 	RISCV_INSN_SET_SIMULATE(c_jalr,		insn);
+	RISCV_INSN_SET_SIMULATE(c_beqz,		insn);
+	RISCV_INSN_SET_SIMULATE(c_bnez,		insn);
 #endif
 
 	RISCV_INSN_SET_SIMULATE(jal,		insn);
diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index 1ead6f4951f9..d3099d67816d 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -249,3 +249,47 @@ bool __kprobes simulate_c_jalr(u32 opcode, unsigned long addr, struct pt_regs *r
 {
 	return simulate_c_jr_jalr(opcode, addr, regs, true);
 }
+
+static bool __kprobes simulate_c_bnez_beqz(u32 opcode, unsigned long addr, struct pt_regs *regs,
+					   bool is_bnez)
+{
+	/*
+	 *  15    13 12           10 9    7 6                 2 1  0
+	 * | funct3 | offset[8|4:3] | rs1' | offset[7:6|2:1|5] | op |
+	 *     3            3          3             5           2
+	 */
+
+	s32 offset;
+	u32 rs1;
+	unsigned long rs1_val;
+
+	rs1 = 0x8 | ((opcode >> 7) & 0x7);
+
+	if (!rv_insn_reg_get_val(regs, rs1, &rs1_val))
+		return false;
+
+	if ((rs1_val != 0 && is_bnez) || (rs1_val == 0 && !is_bnez)) {
+		offset =  ((opcode >> 3)  & 0x3) << 1;
+		offset |= ((opcode >> 10) & 0x3) << 3;
+		offset |= ((opcode >> 2)  & 0x1) << 5;
+		offset |= ((opcode >> 5)  & 0x3) << 6;
+		offset |= ((opcode >> 12) & 0x1) << 8;
+		offset = sign_extend32(offset, 8);
+	} else {
+		offset = 2;
+	}
+
+	instruction_pointer_set(regs, addr + offset);
+
+	return true;
+}
+
+bool __kprobes simulate_c_bnez(u32 opcode, unsigned long addr, struct pt_regs *regs)
+{
+	return simulate_c_bnez_beqz(opcode, addr, regs, true);
+}
+
+bool __kprobes simulate_c_beqz(u32 opcode, unsigned long addr, struct pt_regs *regs)
+{
+	return simulate_c_bnez_beqz(opcode, addr, regs, false);
+}
diff --git a/arch/riscv/kernel/probes/simulate-insn.h b/arch/riscv/kernel/probes/simulate-insn.h
index 472a1948ec4f..44ebbc444db9 100644
--- a/arch/riscv/kernel/probes/simulate-insn.h
+++ b/arch/riscv/kernel/probes/simulate-insn.h
@@ -27,5 +27,7 @@ bool simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_c_j(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_c_jr(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_c_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs);
+bool simulate_c_bnez(u32 opcode, unsigned long addr, struct pt_regs *regs);
+bool simulate_c_beqz(u32 opcode, unsigned long addr, struct pt_regs *regs);
 
 #endif /* _RISCV_KERNEL_PROBES_SIMULATE_INSN_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
