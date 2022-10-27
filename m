Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEECAECAAA1
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Oct 2022 13:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zbW/oHTx+x2DkFD4FFj12rly+WHUGJRtUlqjKLaCpDg=; b=X0Yp9EvkBokQbI
	zK5DvBGe8W6DGoFQ8mjt+9uNAIfp4/OOVNocvBEwMgzSsxNFgmz3YYwAnX2wpC9xzrxtffUwVzax9
	8xBPOSWambY41P4DE3OlDV+DIVXT85rXTnIW7TH0k6+Ne9B94F5WlqL7phoSGEG6d1zIZYa6TWC+N
	sm0SlzgulBrwvk6VaGexWnVBdm5v+zcgCb8Uc+SujwRl0daV/JDIlDx5oQkIWGte4rQ2A9RfuSj8W
	hIHBbjL/1qG031x1C1sS+Rs8hCplnCN5FguDMF5H/sBtdoIDL4q+7l6tlgTXO04rpBwpta7bPN7my
	c5S91yWvoPDhuLGn0chw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2YR-00DJYu-Mn; Thu, 27 Oct 2022 13:04:15 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2XD-00DJ2h-T2
	for linux-riscv@lists.infradead.org; Thu, 27 Oct 2022 13:03:01 +0000
Received: by mail-wm1-x332.google.com with SMTP id bh7-20020a05600c3d0700b003c6fb3b2052so1161185wmb.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Oct 2022 06:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KbUhxPuTy0jvwUlmdsFF6eMymGDJdoEDGUQqDgTA5G8=;
        b=HpADHk/4BhSephNX9PjCwzPq+u7ON6KbLkjy9rqEGS72imhKdp2XeGaBWjGNVeDPR/
         t7gaFSWTtYPSxdHvqM3FwW/tPxcmUvqjo4N4pghN80NthcACr1Af5lNwe3tHrL0OIMKJ
         oBQbODjZam9y5KkxXoy26F4FBM5YnB5IP1j4C+/D3MGegc236po1UVH4VKRPt95lvd19
         eASt1lmI6/TcImRjbryjQWiGZdNVAUsnO+BqvjX6+VcF4p7sfswmem1nJKgPexB2wGID
         DuxTivhH3mgpox8g7PT1z+WE4qDJD5cKmFsQ8SAYLenkLGGVX3FT5qn8u22JlyKvI1tB
         0rIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KbUhxPuTy0jvwUlmdsFF6eMymGDJdoEDGUQqDgTA5G8=;
        b=FtLs5UquK9+d5+G7ThpssnMDxGJ0f33JEQ3hkEXOo0BJF8rvp6JpD5a5w7vXvcFmpW
         Z7PYdOfJuZbcKOi4C898/k5ze2AXk1PeTKp+4momgS7RksJx7sqm0O10aAQ8R9WB33K+
         xDR8uFRKCds9l/xiOZtzMOJcr6x6lGwSC7tu09xNBqLlWvTMp0P5vmLzgFtZjIbV7exv
         ocowmyu7+Cam+HcRyPhnO9pr0o2zvIHo4SDgtf6EVpM5Dgs8EvVTduD6dtJ1lNtlLCtq
         6xvzC+l440Gu6TeLPoSrvSoZwzSfKwRxcjsIs4TW3dozlufPZfUAgc7x9ZvgzshduOh2
         Eo3w==
X-Gm-Message-State: ACrzQf14+AmF2i0HQoj/Moor/JEhbgvZT3ovxr6wCemf5OfQCHELoiTY
	Tf/XjnNj/UTjIU9VaPnXz0pAScn3GAEiBw==
X-Google-Smtp-Source: AMsMyM5fJj8yQsDoS1zq2027Jxq7yIoL/mg2qeZwvX+oHpS+36nH9RZ9vECWCmHKqFRMVVATrhJfcw==
X-Received: by 2002:a05:600c:3b97:b0:3c7:14f0:f8d2 with SMTP id n23-20020a05600c3b9700b003c714f0f8d2mr5893020wms.159.1666875775469;
        Thu, 27 Oct 2022 06:02:55 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id w8-20020adfde88000000b002366f9bd717sm1369029wrl.45.2022.10.27.06.02.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 06:02:55 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH 3/9] RISC-V: insn-def: Define cbo.zero
Date: Thu, 27 Oct 2022 15:02:41 +0200
Message-Id: <20221027130247.31634-4-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027130247.31634-1-ajones@ventanamicro.com>
References: <20221027130247.31634-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_060259_968521_0993E8F2 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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

CBO instructions use the I-type of instruction format where
the immediate is used to identify the CBO instruction type.
Add I-type instruction encoding support to insn-def and also
add cbo.zero.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/insn-def.h | 50 +++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index 16044affa57c..f13054716556 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -12,6 +12,12 @@
 #define INSN_R_RD_SHIFT			 7
 #define INSN_R_OPCODE_SHIFT		 0
 
+#define INSN_I_SIMM12_SHIFT		20
+#define INSN_I_RS1_SHIFT		15
+#define INSN_I_FUNC3_SHIFT		12
+#define INSN_I_RD_SHIFT			 7
+#define INSN_I_OPCODE_SHIFT		 0
+
 #ifdef __ASSEMBLY__
 
 #ifdef CONFIG_AS_HAS_INSN
@@ -20,6 +26,10 @@
 	.insn	r \opcode, \func3, \func7, \rd, \rs1, \rs2
 	.endm
 
+	.macro insn_i, opcode, func3, rd, rs1, simm12
+	.insn	i \opcode, \func3, \rd, \rs1, \simm12
+	.endm
+
 #else
 
 #include <asm/gpr-num.h>
@@ -33,9 +43,18 @@
 		 (.L__gpr_num_\rs2 << INSN_R_RS2_SHIFT))
 	.endm
 
+	.macro insn_i, opcode, func3, rd, rs1, simm12
+	.4byte	((\opcode << INSN_I_OPCODE_SHIFT) |		\
+		 (\func3 << INSN_I_FUNC3_SHIFT) |		\
+		 (.L__gpr_num_\rd << INSN_I_RD_SHIFT) |		\
+		 (.L__gpr_num_\rs1 << INSN_I_RS1_SHIFT) |	\
+		 (\simm12 << INSN_I_SIMM12_SHIFT))
+	.endm
+
 #endif
 
 #define __INSN_R(...)	insn_r __VA_ARGS__
+#define __INSN_I(...)	insn_i __VA_ARGS__
 
 #else /* ! __ASSEMBLY__ */
 
@@ -44,6 +63,9 @@
 #define __INSN_R(opcode, func3, func7, rd, rs1, rs2)	\
 	".insn	r " opcode ", " func3 ", " func7 ", " rd ", " rs1 ", " rs2 "\n"
 
+#define __INSN_I(opcode, func3, rd, rs1, simm12)	\
+	".insn	i " opcode ", " func3 ", " rd ", " rs1 ", " simm12 "\n"
+
 #else
 
 #include <linux/stringify.h>
@@ -60,14 +82,32 @@
 "		 (.L__gpr_num_\\rs2 << " __stringify(INSN_R_RS2_SHIFT) "))\n" \
 "	.endm\n"
 
+#define DEFINE_INSN_I							\
+	__DEFINE_ASM_GPR_NUMS						\
+"	.macro insn_i, opcode, func3, rd, rs1, simm12\n"		\
+"	.4byte	((\\opcode << " __stringify(INSN_I_OPCODE_SHIFT) ") |"	\
+"		 (\\func3 << " __stringify(INSN_I_FUNC3_SHIFT) ") |"	\
+"		 (.L__gpr_num_\\rd << " __stringify(INSN_I_RD_SHIFT) ") |"   \
+"		 (.L__gpr_num_\\rs1 << " __stringify(INSN_I_RS1_SHIFT) ") |" \
+"		 (\\simm12 << " __stringify(INSN_I_SIMM12_SHIFT) "))\n"	\
+"	.endm\n"
+
 #define UNDEFINE_INSN_R							\
 "	.purgem insn_r\n"
 
+#define UNDEFINE_INSN_I							\
+"	.purgem insn_i\n"
+
 #define __INSN_R(opcode, func3, func7, rd, rs1, rs2)			\
 	DEFINE_INSN_R							\
 	"insn_r " opcode ", " func3 ", " func7 ", " rd ", " rs1 ", " rs2 "\n" \
 	UNDEFINE_INSN_R
 
+#define __INSN_I(opcode, func3, rd, rs1, simm12)			\
+	DEFINE_INSN_I							\
+	"insn_i " opcode ", " func3 ", " rd ", " rs1 ", " simm12 "\n" \
+	UNDEFINE_INSN_I
+
 #endif
 
 #endif /* ! __ASSEMBLY__ */
@@ -76,9 +116,14 @@
 	__INSN_R(RV_##opcode, RV_##func3, RV_##func7,		\
 		 RV_##rd, RV_##rs1, RV_##rs2)
 
+#define INSN_I(opcode, func3, rd, rs1, simm12)			\
+	__INSN_I(RV_##opcode, RV_##func3, RV_##rd,		\
+		 RV_##rs1, RV_##simm12)
+
 #define RV_OPCODE(v)		__ASM_STR(v)
 #define RV_FUNC3(v)		__ASM_STR(v)
 #define RV_FUNC7(v)		__ASM_STR(v)
+#define RV_SIMM12(v)		__ASM_STR(v)
 #define RV_RD(v)		__ASM_STR(v)
 #define RV_RS1(v)		__ASM_STR(v)
 #define RV_RS2(v)		__ASM_STR(v)
@@ -87,6 +132,7 @@
 #define RV___RS1(v)		__RV_REG(v)
 #define RV___RS2(v)		__RV_REG(v)
 
+#define RV_OPCODE_MISC_MEM	RV_OPCODE(15)
 #define RV_OPCODE_SYSTEM	RV_OPCODE(115)
 
 #define HFENCE_VVMA(vaddr, asid)				\
@@ -134,4 +180,8 @@
 	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(51),		\
 	       __RD(0), RS1(gaddr), RS2(vmid))
 
+#define CBO_ZERO(base)						\
+	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
+	       RS1(base), SIMM12(4))
+
 #endif /* __ASM_INSN_DEF_H */
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
