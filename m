Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DD3C369AB
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Apr 2025 14:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tm0Qv4pK4/uNhfIQ2VkjpOaENUs1IACcxpKWkC4U50o=; b=esa2nqc2woYz2l
	bqEMnb8tZsFE1tZRqw7y9JgdGV5fA9E7Gkr0A4yvEuVDu+vgay7cRkMRCJzYq0KYTbb/rp/3tyRma
	06d1FBmrBYC9Kgz9hMBcygt1yRFwsJGR9YexzMMY3xXpWHSKNWONWq1SHQcp87jDgdN+K/cUESjYk
	j4AHT7R/I+ln6UdCxpNw6hnh5TF71eOJ5zZVTFPMI+cCLsFFpbGdBJsoOYsgxo3zM2QUksgeDz/jY
	2mcT/mqcExnYriGSzP6bVHS+xwf4YOfGNteY2jqTXE/YZayzrzw9AyRScFjX1hAZoyWYjzXGlIxJZ
	K0Y1TZhlY8OxtyXEoYhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6s6P-00000004Rz9-3q7P;
	Mon, 21 Apr 2025 14:26:29 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6s6N-00000004Ry1-16vy
	for linux-riscv@lists.infradead.org;
	Mon, 21 Apr 2025 14:26:28 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43cf257158fso27429465e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 21 Apr 2025 07:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745245585; x=1745850385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8EzXGFQbwSP2O8EyG3ctzvPoUfJEY6y+SbPIPc5xJE=;
        b=D92RQ+4R7rPdGj7CKapOU5NgJj0lnP0FqI7q/+5RuiE5cTuM9WQx5ouoGfepYCsgHE
         33EpytGv6bgMkZrmriXUtHq4DcZ9WwLUqeqkDxVCevkory3PbC4UKkKyn44k7gMXTdyB
         N86CMq0zfgbzLXcGW0TIAPpUiSXlg3bXUOnvbVSPL04ov2pkbpsEjB4lUWe8hjbd8Cia
         DzSB/tKNHsd5X7HctJlHCWyr7Yt5FibbChZw6x2aFg2w8M4/3FqX1a3Wa2idhWmElvKa
         057+Px+ZwKhIC9INxf3sF5b+DSaofmFsb2xRvdqfeujFb99yYxiMLvznXapnPcP4V+52
         ReLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745245585; x=1745850385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r8EzXGFQbwSP2O8EyG3ctzvPoUfJEY6y+SbPIPc5xJE=;
        b=Xd8RjgL+NAwV+9jauPurmqTDf69yDXiituYdypWVgWdOio4iuV/Om3g8Z7r+6sKtoI
         NJrDgbTxiDjoqWLAKuBgz5iouRLEtvZFRVR/lumhX6AWyLMFKTGJ50PwNAfG3Iukwile
         f0F8F0KEqjwUXhGvm7fDcUKEorImw+vhSoIg6ZVubjXWP8gmaADoA9mTOUHQ63KHiePD
         FcDWuGWl5zR0UytGlltIOGGt43iuJ8HeNz5Kjvq779sSc/5llD+O/3q0anZlZJqdjGXt
         iNA8dVIQ3NVfxGB9hSlfZWzkClQ+AA57QbMHS3Z4qOKpZf94/InUha/ZuNjE9Atu/yVY
         XUzw==
X-Forwarded-Encrypted: i=1; AJvYcCWQDeyX1syycOWBezMb0FaVYpaQVeta+G0JS7gfqlCzOcc3hnBiDVjEgZLXxHF0ri+Xd5y/Biu9H/byeQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhPkGZ+VYD1oeQoghQFgNA98ruDziQMRa78D9wV6m+4M6LDeHM
	KMHRfV1mabVCYAZVzfAO44FYWrOQxSThfYnqaBJzFf8gmMmMGjWHHROiTEyE2wU=
X-Gm-Gg: ASbGncuA75AnFwWtj5xFtQ00gLhRML7ljVd+TV1peNoS95hq7KAc9DfkoPRKdiyOITM
	1grdH81Z1ghloi/WGA1c1z/6h7UJLj+pRL35hnTAtAempSOrN8qdW7+niWbjT2F/pFp8aH6J/nb
	L04XnNPgcGnpw8oJmZzhFcza7z+U0CW/eWM1dvcjc9RUIhI3qaBFLxRO57O5Ado25Zu++VmZUio
	YVWfiCloBlo/cSl8byWV2bRgGF/v46yXleIU4gQmM5vcxsadmCJsIq4dfRZKetUPRHvrFNJeie2
	ey28QvkASWbQS+ggNVFoxbrq02Vb70415NNUizFeoSOOeziZGvpU3qxy/Lc=
X-Google-Smtp-Source: AGHT+IGbR8cH86R+FPRiB//fxh3ANX3cYxfoHYfa1pDXh1hmpUYRDkZBnNT8HxNX2o8g7qT41lDP+Q==
X-Received: by 2002:a05:600c:1e14:b0:43d:abd:ad0e with SMTP id 5b1f17b1804b1-4406aba617dmr115364515e9.18.1745245585543;
        Mon, 21 Apr 2025 07:26:25 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3382:ef90:cd58:9e76:e88c:5cd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5a9ed9sm139610375e9.3.2025.04.21.07.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 07:26:25 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v3 1/4] riscv: Introduce Zicbop instructions
Date: Mon, 21 Apr 2025 16:24:38 +0200
Message-Id: <20250421142441.395849-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250421142441.395849-1-alexghiti@rivosinc.com>
References: <20250421142441.395849-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_072627_305400_EC0A2F8F 
X-CRM114-Status: UNSURE (   9.93  )
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

The S-type instructions are first introduced and then used to define the
encoding of the Zicbop prefetching instructions.

Co-developed-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/insn-def.h | 60 +++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index 71060a2f838e..02c92c1657d2 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -18,6 +18,13 @@
 #define INSN_I_RD_SHIFT			 7
 #define INSN_I_OPCODE_SHIFT		 0
 
+#define INSN_S_SIMM7_SHIFT		25
+#define INSN_S_RS2_SHIFT		20
+#define INSN_S_RS1_SHIFT		15
+#define INSN_S_FUNC3_SHIFT		12
+#define INSN_S_SIMM5_SHIFT		 7
+#define INSN_S_OPCODE_SHIFT		 0
+
 #ifdef __ASSEMBLY__
 
 #ifdef CONFIG_AS_HAS_INSN
@@ -30,6 +37,10 @@
 	.insn	i \opcode, \func3, \rd, \rs1, \simm12
 	.endm
 
+	.macro insn_s, opcode, func3, rs2, simm12, rs1
+	.insn	s \opcode, \func3, \rs2, \simm12(\rs1)
+	.endm
+
 #else
 
 #include <asm/gpr-num.h>
@@ -51,10 +62,20 @@
 		 (\simm12 << INSN_I_SIMM12_SHIFT))
 	.endm
 
+	.macro insn_s, opcode, func3, rs2, simm12, rs1
+	.4byte	((\opcode << INSN_S_OPCODE_SHIFT) |		\
+		 (\func3 << INSN_S_FUNC3_SHIFT) |		\
+		 (.L__gpr_num_\rs2 << INSN_S_RS2_SHIFT) |	\
+		 (.L__gpr_num_\rs1 << INSN_S_RS1_SHIFT) |	\
+		 ((\simm12 & 0x1f) << INSN_S_SIMM5_SHIFT) |	\
+		 (((\simm12 >> 5) & 0x7f) << INSN_S_SIMM7_SHIFT))
+	.endm
+
 #endif
 
 #define __INSN_R(...)	insn_r __VA_ARGS__
 #define __INSN_I(...)	insn_i __VA_ARGS__
+#define __INSN_S(...)	insn_s __VA_ARGS__
 
 #else /* ! __ASSEMBLY__ */
 
@@ -66,6 +87,9 @@
 #define __INSN_I(opcode, func3, rd, rs1, simm12)	\
 	".insn	i " opcode ", " func3 ", " rd ", " rs1 ", " simm12 "\n"
 
+#define __INSN_S(opcode, func3, rs2, simm12, rs1)	\
+	".insn	s " opcode ", " func3 ", " rs2 ", " simm12 "(" rs1 ")\n"
+
 #else
 
 #include <linux/stringify.h>
@@ -92,12 +116,26 @@
 "		 (\\simm12 << " __stringify(INSN_I_SIMM12_SHIFT) "))\n"	\
 "	.endm\n"
 
+#define DEFINE_INSN_S							\
+	__DEFINE_ASM_GPR_NUMS						\
+"	.macro insn_s, opcode, func3, rs2, simm12, rs1\n"		\
+"	.4byte	((\\opcode << " __stringify(INSN_S_OPCODE_SHIFT) ") |"	\
+"		 (\\func3 << " __stringify(INSN_S_FUNC3_SHIFT) ") |"	\
+"		 (.L__gpr_num_\\rs2 << " __stringify(INSN_S_RS2_SHIFT) ") |" \
+"		 (.L__gpr_num_\\rs1 << " __stringify(INSN_S_RS1_SHIFT) ") |" \
+"		 ((\\simm12 & 0x1f) << " __stringify(INSN_S_SIMM5_SHIFT) ") |" \
+"		 (((\\simm12 >> 5) & 0x7f) << " __stringify(INSN_S_SIMM7_SHIFT) "))\n" \
+"	.endm\n"
+
 #define UNDEFINE_INSN_R							\
 "	.purgem insn_r\n"
 
 #define UNDEFINE_INSN_I							\
 "	.purgem insn_i\n"
 
+#define UNDEFINE_INSN_S							\
+"	.purgem insn_s\n"
+
 #define __INSN_R(opcode, func3, func7, rd, rs1, rs2)			\
 	DEFINE_INSN_R							\
 	"insn_r " opcode ", " func3 ", " func7 ", " rd ", " rs1 ", " rs2 "\n" \
@@ -108,6 +146,11 @@
 	"insn_i " opcode ", " func3 ", " rd ", " rs1 ", " simm12 "\n" \
 	UNDEFINE_INSN_I
 
+#define __INSN_S(opcode, func3, rs2, simm12, rs1)			\
+	DEFINE_INSN_S							\
+	"insn_s " opcode ", " func3 ", " rs2 ", " simm12 ", " rs1 "\n"	\
+	UNDEFINE_INSN_S
+
 #endif
 
 #endif /* ! __ASSEMBLY__ */
@@ -120,6 +163,10 @@
 	__INSN_I(RV_##opcode, RV_##func3, RV_##rd,		\
 		 RV_##rs1, RV_##simm12)
 
+#define INSN_S(opcode, func3, rs2, simm12, rs1)			\
+	__INSN_S(RV_##opcode, RV_##func3, RV_##rs2,		\
+		 RV_##simm12, RV_##rs1)
+
 #define RV_OPCODE(v)		__ASM_STR(v)
 #define RV_FUNC3(v)		__ASM_STR(v)
 #define RV_FUNC7(v)		__ASM_STR(v)
@@ -133,6 +180,7 @@
 #define RV___RS2(v)		__RV_REG(v)
 
 #define RV_OPCODE_MISC_MEM	RV_OPCODE(15)
+#define RV_OPCODE_OP_IMM	RV_OPCODE(19)
 #define RV_OPCODE_SYSTEM	RV_OPCODE(115)
 
 #define HFENCE_VVMA(vaddr, asid)				\
@@ -196,6 +244,18 @@
 	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
 	       RS1(base), SIMM12(4))
 
+#define PREFETCH_I(base, offset)				\
+	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(0),		\
+	       SIMM12((offset) & 0xfe0), RS1(base))
+
+#define PREFETCH_R(base, offset)				\
+	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(1),		\
+	       SIMM12((offset) & 0xfe0), RS1(base))
+
+#define PREFETCH_W(base, offset)				\
+	INSN_S(OPCODE_OP_IMM, FUNC3(6), __RS2(3),		\
+	       SIMM12((offset) & 0xfe0), RS1(base))
+
 #define RISCV_PAUSE	".4byte 0x100000f"
 #define ZAWRS_WRS_NTO	".4byte 0x00d00073"
 #define ZAWRS_WRS_STO	".4byte 0x01d00073"
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
