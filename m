Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48499C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Nov 2022 04:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lc4PxHEc2Ai3VaLLyWFz1YoFhTpPzSNd2mAfHP1ZHfM=; b=qE07CgI+s06P4n
	80sT4FlTWyZIc/RPaB7+QoTlFWPiZHIGErnFFaVVg9G9ouF8TX02o6agEY31FVsQxTxUc0USS4H2T
	wpR1AkM+FmzLTTUGo1kd+HPfKLC4hi4Gy9AUpM48nbk3tGlidY7dQ3eKibaMDggvRt/aW6XvFmOMC
	hlxIumPM6C6r8C2ZlXsG9S9lUDIOCuc5A3RXpaUG3aq7OYO6/vvlc8C7QcAeAw+9mPgNTVKVT6T/9
	DrTNMfIaBdl3ytG7SgUjfQ6pupyNwUKfau+IParwdh8P3lcowFYv2SrTB4w/QO5uaL66myqAIDmx1
	fkMHPgao1CQ/2okcYlKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otLsT-00CyzE-BB; Fri, 11 Nov 2022 04:42:53 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otLsQ-00Cywy-65
	for linux-riscv@lists.infradead.org; Fri, 11 Nov 2022 04:42:51 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-13b6c1c89bdso4335625fac.13
        for <linux-riscv@lists.infradead.org>; Thu, 10 Nov 2022 20:42:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=daXlLeLw3kNDzBbMmxQMtFlEI6BHAyH4slFZ3YIhVkM=;
        b=MNa4RuV8mDpINoVtjxzNQ6+qxoyxmtKxaDp0/KFOKSzTl+p6vtuPI5YXo/mqsL7b63
         15QD2UkTNKVw9INmTTAH5xntb07u5bfQd5MSsL7ryGKDuxey2QgjSlnMuWylK4drW2la
         gd6vefCq+MsiG3k0Ec48kuCpsG1/RK5nHIfHJiVW9kHKS4aaRvNEYzfCPWF6g8TXkdKn
         iGHfoNxTL29UlH64IXVcTS1WNI8TzTtN462Sh6U3MUtmmOku6n0p54o/n1ZciWQJ7QiR
         9reoZ6fj1Gm7nvKuFTudEhmWGVPQahts9LQRwjgV0kE5nl5zw4gxY+zXyKjGD5uzGaIC
         16lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=daXlLeLw3kNDzBbMmxQMtFlEI6BHAyH4slFZ3YIhVkM=;
        b=vU4re07ZTHwf0G0cmbymG1axzsPZR1cX87Wv/QP1G7b91AIq7q7qt+t/sPybRXIz3m
         GYW8z04GXPfKBmPadhsUXRXd2AeZyu176nwOTF8uvMXBzPIXPYBXN9swVkCDZxmC53K2
         firSyGCUF4CzCze71d1ep5/WAT3sFIP12P9A3VKp06ymprl17ox2Ycm2mM5n30hA4OPS
         ClhPvDmaKnGjOXHXFMeFedpbqFUfko1U6i3cvJRMJ6LVzgtF0NlXWtRcXn5GofoB/vso
         +XEN3zZgS3XOPhJRBXcNqoMMzaxacP0IerRvVHedgO3/oPtqQnDTE5KH51rgPTXXBHXa
         LLvg==
X-Gm-Message-State: ANoB5pkTDeF1a6GzyAegOhRaBD76xgoVfV9/booTccbiRgBVliuWLaKb
	BaE4GSnSWFmYRin3jPLVUlpLfw==
X-Google-Smtp-Source: AA0mqf6FNP4eq4rZFPw6hG3SMMD8wEXbEQrZ4PatjLjsS5TKc/LNx9piZKysaLGZL6e/j64jDCabXg==
X-Received: by 2002:a05:6871:7a2:b0:13b:b889:1809 with SMTP id o34-20020a05687107a200b0013bb8891809mr18748oap.53.1668141768848;
        Thu, 10 Nov 2022 20:42:48 -0800 (PST)
Received: from anup-ubuntu64-vm.. ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id k14-20020a056870350e00b0013d9bd4ad2esm787353oah.12.2022.11.10.20.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 20:42:48 -0800 (PST)
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
Subject: [PATCH 1/9] RISC-V: Add AIA related CSR defines
Date: Fri, 11 Nov 2022 10:11:59 +0530
Message-Id: <20221111044207.1478350-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111044207.1478350-1-apatel@ventanamicro.com>
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_204250_261275_B48262AD 
X-CRM114-Status: UNSURE (   8.51  )
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
