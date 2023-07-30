Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C41AC001DC
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jul 2023 08:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8XMqyEfMPSpPF2el1xrQfflg1ZV8qh91LEgy1tvmiDY=; b=Vo4mv1t4j4fi6D
	Qfpoqz6VGxwI/5L2dxqbkUfusqE6h4dCijRXf4O8l6BXpd69GgyjiCmudgexx8xGSZ8m37Ecmp/v2
	6YuJ62Fvb+/8ehdc8qBWsOYhykIKLG8vYT6lfCRpnk7VkPITWlmlcyqZtJgE+Pf1MsRJbfY/8SI+G
	kG+CRZieUhllN6HaUEmhxcGyWwGykTTDBFkn1iJe0VXmon39Sh6ncv5v/jTLeqW38s7yirJKcKPoK
	rBj+upmcLSBRhfcABLQirQ/PBFH5p/ic4STm6hA8ZUTqdGzUYeqhdfPyhhJ+mBqt5L9AK7Hwu/lFt
	B0i9dwrL9JOf9z8n292g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQ1lx-00AXeE-3D;
	Sun, 30 Jul 2023 08:27:30 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQ1lu-00AXbd-36
	for linux-riscv@lists.infradead.org;
	Sun, 30 Jul 2023 08:27:28 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fe28e4671dso1295953e87.0
        for <linux-riscv@lists.infradead.org>; Sun, 30 Jul 2023 01:27:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690705640; x=1691310440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+8yniXpHYJ5LlYOtJMJGlRfIyf396b9o9LmHCkYj9G0=;
        b=o/cTI5Ls2O0mo6N0cv3Y1lzwya7GUKhEWOZEp+1uxyeF8BIcFpDi/fx+VjyDUt4Zve
         kV+wrlPFqq8rHMLHlvef7fFM+cXx8pwdzBUAM4MGQrrkkGigegHRH35j6YE80rcJHlim
         xBaXZ2e7QjTw6Fzv+FE1ZnnNIvwlBMzs+WXUXkXwnTrVLeqXl/qnOmK1Lcbzz18QqMNx
         ebcfHt1kGRmfKUNWyUAFwNhnRXoPWrpXF3QdHk2V1Mqui7StMMqi/9WR82vrO6UwTVkK
         /iLx4pzINlfnok2v7OmHnYI8AGQ2mdIvB/meMwFELznrCsV1P7kCWp8Tfj5r0p8/Qrpi
         hApw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690705640; x=1691310440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+8yniXpHYJ5LlYOtJMJGlRfIyf396b9o9LmHCkYj9G0=;
        b=GzWwXDCBNiZVSpO926zhO4AclNUwWeuBaGlfaMgkamrWS2VfXie5N0xolfIMkr3KE5
         X2sT2Hvoe50g1UXMnx3Lqjq2oni22bprdX8GGOBedjjrgoMdfI43uSudn2esWVaJrLgj
         o27/E4LIzh5NsHNiIzIWfNMDw+I1+yWtIlh995Trfjzq57Rkfe93RQ0cbC+4BzwZxZ06
         pdhKQdUNBiWiQzo4QuNjuOEMQD180z+3VX6LvWWh31y7wd9OEQJG71jLqZDtbGDWtqq0
         7pVHQzGykNxeFTyvl6Hx3CDpwNgGbtVX2GxdKXjGro3FrrxCGnPrM3M1WValYQlNqW8E
         Uj0w==
X-Gm-Message-State: ABy/qLZk0mHQaTzIpi2WxIVp/Msdg0dTuhcexB3FGfwW9nD32d1sEZ6h
	UVihyuCS5PBW3nn4/jvQbHM=
X-Google-Smtp-Source: APBJJlFJTRX8mqrdX3Kt0N/6M1IBQQS0CKigxwiOWmQstL7Qprhb06BM4NCCMnmQNETsf9+3s7AgBg==
X-Received: by 2002:a05:6512:3686:b0:4fe:18be:ef47 with SMTP id d6-20020a056512368600b004fe18beef47mr3919927lfs.67.1690705639941;
        Sun, 30 Jul 2023 01:27:19 -0700 (PDT)
Received: from nam-dell (ip-217-105-46-58.ip.prioritytelecom.net. [217.105.46.58])
        by smtp.gmail.com with ESMTPSA id k16-20020aa7d8d0000000b0051e2670d599sm3861915eds.4.2023.07.30.01.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 01:27:19 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcaov@gmail.com>
Subject: [PATCH 1/3] riscv: kprobes: simulate c.j instruction
Date: Sun, 30 Jul 2023 10:27:07 +0200
Message-Id: <6ef76cd9984b8015826649d13f870f8ac45a2d0d.1690704360.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690704360.git.namcaov@gmail.com>
References: <cover.1690704360.git.namcaov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230730_012726_996621_97E32EB8 
X-CRM114-Status: GOOD (  12.17  )
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

kprobes currently rejects c.j instruction. Implement it.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 arch/riscv/kernel/probes/decode-insn.c   |  3 ++-
 arch/riscv/kernel/probes/simulate-insn.c | 24 ++++++++++++++++++++++++
 arch/riscv/kernel/probes/simulate-insn.h |  1 +
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/probes/decode-insn.c b/arch/riscv/kernel/probes/decode-insn.c
index 64f6183b4717..39adb07a342d 100644
--- a/arch/riscv/kernel/probes/decode-insn.c
+++ b/arch/riscv/kernel/probes/decode-insn.c
@@ -29,13 +29,14 @@ riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *api)
 	 * TODO: the REJECTED ones below need to be implemented
 	 */
 #ifdef CONFIG_RISCV_ISA_C
-	RISCV_INSN_REJECTED(c_j,		insn);
 	RISCV_INSN_REJECTED(c_jr,		insn);
 	RISCV_INSN_REJECTED(c_jal,		insn);
 	RISCV_INSN_REJECTED(c_jalr,		insn);
 	RISCV_INSN_REJECTED(c_beqz,		insn);
 	RISCV_INSN_REJECTED(c_bnez,		insn);
 	RISCV_INSN_REJECTED(c_ebreak,		insn);
+
+	RISCV_INSN_SET_SIMULATE(c_j,		insn);
 #endif
 
 	RISCV_INSN_SET_SIMULATE(jal,		insn);
diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index 7441ac8a6843..3ba45c612cd8 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -188,3 +188,27 @@ bool __kprobes simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *r
 
 	return true;
 }
+
+bool __kprobes simulate_c_j(u32 opcode, unsigned long addr, struct pt_regs *regs)
+{
+	/*
+	 *  15    13 12                            2 1      0
+	 * | funct3 | offset[11|4|9:8|10|6|7|3:1|5] | opcode |
+	 *     3                   11                    2
+	 */
+
+	s32 offset;
+
+	offset  = ((opcode >> 3)  & 0x7) << 1;
+	offset |= ((opcode >> 11) & 0x1) << 4;
+	offset |= ((opcode >> 2)  & 0x1) << 5;
+	offset |= ((opcode >> 7)  & 0x1) << 6;
+	offset |= ((opcode >> 6)  & 0x1) << 7;
+	offset |= ((opcode >> 9)  & 0x3) << 8;
+	offset |= ((opcode >> 8)  & 0x1) << 10;
+	offset |= ((opcode >> 12) & 0x1) << 11;
+
+	instruction_pointer_set(regs, addr + sign_extend32(offset, 11));
+
+	return true;
+}
diff --git a/arch/riscv/kernel/probes/simulate-insn.h b/arch/riscv/kernel/probes/simulate-insn.h
index 61e35db31001..4bd6c266e7d3 100644
--- a/arch/riscv/kernel/probes/simulate-insn.h
+++ b/arch/riscv/kernel/probes/simulate-insn.h
@@ -24,5 +24,6 @@ bool simulate_auipc(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_jal(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs);
+bool simulate_c_j(u32 opcode, unsigned long addr, struct pt_regs *regs);
 
 #endif /* _RISCV_KERNEL_PROBES_SIMULATE_INSN_H */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
