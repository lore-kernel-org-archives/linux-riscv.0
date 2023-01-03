Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AA3C3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 17:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lc4PxHEc2Ai3VaLLyWFz1YoFhTpPzSNd2mAfHP1ZHfM=; b=2WVEinC22PDmkG
	6V1oyaStm3JcmUcPX/yqKn/FZ89wmkpsSPRnUOQXF2/+sKXnYearRuHdOGUpxefGJO1fvhxI1Wx0y
	UOYzqJUtB6XlT24cJr/U3DHR8OtKbOodXriTO63+O4pCbu4O2dhJxgSHRh+yaku+cx/pA5hhtv0oZ
	eD6plZJLJqT2B5SHHeTLpLsUlWwuv+Hi0zTHJFMoGOKaM09CmCRH/96wGHCsDQUU3+TJIWpVE13GH
	TSuLgxqL7u4IXjbePlMzF+2tLW2Zpyqc8DomQIikbnfRKzJyZBlqZfd4FQBzXvkG6V5BvIcZAC/cL
	NfyTevdQdcEd7sOVor0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCkmA-003FbR-29; Tue, 03 Jan 2023 17:08:34 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCi3e-001rYn-Dy
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 14:14:28 +0000
Received: by mail-pg1-x529.google.com with SMTP id b12so20197086pgj.6
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jan 2023 06:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=daXlLeLw3kNDzBbMmxQMtFlEI6BHAyH4slFZ3YIhVkM=;
        b=evMFet2z+EJ1hVR3HKuxGmSdEu6XPwfvkzgldhBr6la+uO4K2yOWPednaoXcqmEknE
         89P9OaRMVph4Du8nIirIU7ZJjT/TUImmEI8fpiwTDi601XCzKT0q817yz0B1rof3aKwC
         Hku0T5rwU+1eouvUbIHI9V7C40yiEKNufRZG8JzuMrYRZJeSnwlHrpG5v+j/IN31SLsD
         cJdsIMyLpwjxLVHlBV07TLirdSUxknJULDXDT8N7rbxHSLGcP6IrnWtezAxGZVkwbHkS
         iZ5WIn8PTVfK3dPtThCIrL6UiTG6FrmOIn/xdULqPMEkyxqyLEgAf94yjngdxtiwhBiS
         2uHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=daXlLeLw3kNDzBbMmxQMtFlEI6BHAyH4slFZ3YIhVkM=;
        b=d+NF7SqYp8Lbp+dOMq6N85kx4dmTxQlS37/+k7nTqTzjsZ0yfuNTh05Pkb8VdnPddn
         CCTI6oBnn++TRKcMtAh+PXSVZbPU3623GzpxDuY8FAoe40jNwbcr91JExJuP/YBzkmZY
         H9tmRPTnbaSZZU/AX3R46Y5FjWnivEtsM3gI3O6l/te5TKGIs4I0shp/ByCQWjuFQO6c
         iLqxpacsU73YbNna0lV+L8YtkfzS30AlzHr6wo5QNOGe+AZy1GrB3nJMSJWQiAwrGiDs
         enX4qYNPcX1ivyRilHrOt5ccryEZoTsJ4m29vMftyOvu+Vv6uqbzF5DMC4P08othaMgT
         fWHw==
X-Gm-Message-State: AFqh2kqXwAPCErQajpI1a2/zDX7oU7oXWqkp5ww16jXVVMKARCmx1c3g
	YWb7bqR6T8KFaJo3v62NWaRmmQ==
X-Google-Smtp-Source: AMrXdXvVyhWM9MkWqENdqR09xUyoArxlPBiWBymqYDKzgQxLglEHoKaV3YlNAApGwngdrvlfG5EfQA==
X-Received: by 2002:a62:2903:0:b0:57f:f2cd:6180 with SMTP id p3-20020a622903000000b0057ff2cd6180mr43349748pfp.0.1672755263781;
        Tue, 03 Jan 2023 06:14:23 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.241])
        by smtp.gmail.com with ESMTPSA id h1-20020a628301000000b0056be4dbd4besm5936035pfe.111.2023.01.03.06.14.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:14:23 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 1/9] RISC-V: Add AIA related CSR defines
Date: Tue,  3 Jan 2023 19:44:01 +0530
Message-Id: <20230103141409.772298-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103141409.772298-1-apatel@ventanamicro.com>
References: <20230103141409.772298-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_061426_523830_CF294C09 
X-CRM114-Status: UNSURE (   9.20  )
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

The RISC-V AIA specification improves handling per-HART local interrupts
in a backward compatible manner. This patch adds defines for new RISC-V
AIA CSRs.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/csr.h | 92 ++++++++++++++++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 0e571f6483d9..4e1356bad7b2 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -73,7 +73,10 @@
 #define IRQ_S_EXT		9
 #define IRQ_VS_EXT		10
 #define IRQ_M_EXT		11
+#define IRQ_S_GEXT		12
 #define IRQ_PMU_OVF		13
+#define IRQ_LOCAL_MAX		(IRQ_PMU_OVF + 1)
+#define IRQ_LOCAL_MASK		((_AC(1, UL) << IRQ_LOCAL_MAX) - 1)
 
 /* Exception causes */
 #define EXC_INST_MISALIGNED	0
@@ -156,6 +159,26 @@
 				 (_AC(1, UL) << IRQ_S_TIMER) | \
 				 (_AC(1, UL) << IRQ_S_EXT))
 
+/* AIA CSR bits */
+#define TOPI_IID_SHIFT		16
+#define TOPI_IID_MASK		0xfff
+#define TOPI_IPRIO_MASK		0xff
+#define TOPI_IPRIO_BITS		8
+
+#define TOPEI_ID_SHIFT		16
+#define TOPEI_ID_MASK		0x7ff
+#define TOPEI_PRIO_MASK		0x7ff
+
+#define ISELECT_IPRIO0		0x30
+#define ISELECT_IPRIO15		0x3f
+#define ISELECT_MASK		0x1ff
+
+#define HVICTL_VTI		0x40000000
+#define HVICTL_IID		0x0fff0000
+#define HVICTL_IID_SHIFT	16
+#define HVICTL_IPRIOM		0x00000100
+#define HVICTL_IPRIO		0x000000ff
+
 /* xENVCFG flags */
 #define ENVCFG_STCE			(_AC(1, ULL) << 63)
 #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
@@ -250,6 +273,18 @@
 #define CSR_STIMECMP		0x14D
 #define CSR_STIMECMPH		0x15D
 
+/* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
+#define CSR_SISELECT		0x150
+#define CSR_SIREG		0x151
+
+/* Supervisor-Level Interrupts (AIA) */
+#define CSR_STOPEI		0x15c
+#define CSR_STOPI		0xdb0
+
+/* Supervisor-Level High-Half CSRs (AIA) */
+#define CSR_SIEH		0x114
+#define CSR_SIPH		0x154
+
 #define CSR_VSSTATUS		0x200
 #define CSR_VSIE		0x204
 #define CSR_VSTVEC		0x205
@@ -279,8 +314,32 @@
 #define CSR_HGATP		0x680
 #define CSR_HGEIP		0xe12
 
+/* Virtual Interrupts and Interrupt Priorities (H-extension with AIA) */
+#define CSR_HVIEN		0x608
+#define CSR_HVICTL		0x609
+#define CSR_HVIPRIO1		0x646
+#define CSR_HVIPRIO2		0x647
+
+/* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA) */
+#define CSR_VSISELECT		0x250
+#define CSR_VSIREG		0x251
+
+/* VS-Level Interrupts (H-extension with AIA) */
+#define CSR_VSTOPEI		0x25c
+#define CSR_VSTOPI		0xeb0
+
+/* Hypervisor and VS-Level High-Half CSRs (H-extension with AIA) */
+#define CSR_HIDELEGH		0x613
+#define CSR_HVIENH		0x618
+#define CSR_HVIPH		0x655
+#define CSR_HVIPRIO1H		0x656
+#define CSR_HVIPRIO2H		0x657
+#define CSR_VSIEH		0x214
+#define CSR_VSIPH		0x254
+
 #define CSR_MSTATUS		0x300
 #define CSR_MISA		0x301
+#define CSR_MIDELEG		0x303
 #define CSR_MIE			0x304
 #define CSR_MTVEC		0x305
 #define CSR_MENVCFG		0x30a
@@ -297,6 +356,25 @@
 #define CSR_MIMPID		0xf13
 #define CSR_MHARTID		0xf14
 
+/* Machine-Level Window to Indirectly Accessed Registers (AIA) */
+#define CSR_MISELECT		0x350
+#define CSR_MIREG		0x351
+
+/* Machine-Level Interrupts (AIA) */
+#define CSR_MTOPEI		0x35c
+#define CSR_MTOPI		0xfb0
+
+/* Virtual Interrupts for Supervisor Level (AIA) */
+#define CSR_MVIEN		0x308
+#define CSR_MVIP		0x309
+
+/* Machine-Level High-Half CSRs (AIA) */
+#define CSR_MIDELEGH		0x313
+#define CSR_MIEH		0x314
+#define CSR_MVIENH		0x318
+#define CSR_MVIPH		0x319
+#define CSR_MIPH		0x354
+
 #ifdef CONFIG_RISCV_M_MODE
 # define CSR_STATUS	CSR_MSTATUS
 # define CSR_IE		CSR_MIE
@@ -307,6 +385,13 @@
 # define CSR_TVAL	CSR_MTVAL
 # define CSR_IP		CSR_MIP
 
+# define CSR_IEH		CSR_MIEH
+# define CSR_ISELECT	CSR_MISELECT
+# define CSR_IREG	CSR_MIREG
+# define CSR_IPH		CSR_MIPH
+# define CSR_TOPEI	CSR_MTOPEI
+# define CSR_TOPI	CSR_MTOPI
+
 # define SR_IE		SR_MIE
 # define SR_PIE		SR_MPIE
 # define SR_PP		SR_MPP
@@ -324,6 +409,13 @@
 # define CSR_TVAL	CSR_STVAL
 # define CSR_IP		CSR_SIP
 
+# define CSR_IEH		CSR_SIEH
+# define CSR_ISELECT	CSR_SISELECT
+# define CSR_IREG	CSR_SIREG
+# define CSR_IPH		CSR_SIPH
+# define CSR_TOPEI	CSR_STOPEI
+# define CSR_TOPI	CSR_STOPI
+
 # define SR_IE		SR_SIE
 # define SR_PIE		SR_SPIE
 # define SR_PP		SR_SPP
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
