Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70DF9C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 15:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=87l+MNI9va4h4H11gRnuRrXydpue+geyQCOYHWPnARo=; b=V9WEDPhus5jitA
	Go6qmxRrHItlRnpl6IsHM3QdNjF2PjeWnFNPWYM+OXgMCcK9PRQOkhKrlyM3iocJFsUI+t4O65BEA
	VQVp/8e4t1OhUXLQ3QHIcjn+EbfThJRc2qEIfdnDblCPuPWP+dWt9QHWEb4EFaQIxAX2eDt3E9nJN
	tsP+KbX7vzqH3O4gJQ/Dby9jKJscduQcrY0jneZKHTCbamDsr1qs8iNwvvyqXDAA+zGt7IcsikSiu
	ByffYBvmBlnUfbKaW+8cd7+Gg2W5cNeMdxbncCCyMMePKpwakgQ7gBNjmEQwxKP2qGqS0vc9uYwBz
	6y94acdTmPx52L8I0f8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjigp-00219z-2T;
	Tue, 04 Apr 2023 15:35:19 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjigm-00217P-30
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 15:35:18 +0000
Received: by mail-oi1-x234.google.com with SMTP id bi31so24484982oib.9
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 08:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680622516; x=1683214516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6PZQdmlp+AewPgEtW0ao3qnJU+39FICYhAuMPUXgt4=;
        b=hF65p47NPrT1CyH5ot5Dshcf0XlqljIPyA8iF2xy+M51/gGgowlUDKMvmiq9O+bdu6
         NzNScv87kEtMtK4tzpbIY0gvdl3j6lp0nba7YnmyN7RHiFBnolYWQU6ryEaqX/ih/Gt+
         UgO4lZjqXe/NiG+x4ZEvjKHFPj3tf5olnZL0D80Z0wATlhk3STH8l6zPLLppYqQUyM4A
         rdWChR3X9xz+o7423vNDClF3N1zmpADV0pS6OrmOQqxffLYXM7tTsOInDrY1xMIB2HAf
         5fre0AvPLy1It/TGPe/EFKoWsLEnmk4FJq4IdKEzbzQtEJnymQGlgBQqxVqwtjLETF61
         d0VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680622516; x=1683214516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6PZQdmlp+AewPgEtW0ao3qnJU+39FICYhAuMPUXgt4=;
        b=tVqBnpSKjUeuY4BQAfC3D0nnKxnT7GIHyOE8k/DvJ/fqDXWWONL9ndgwIaic9mDkgf
         AIRi+L7+VhH6rDqKrUb6z3suF3uSPMdfDh9k2VZyysxuK18w6XzlaESRIhod4FEeALFx
         CSB3IJwdUk1xAHlwoS+raztE5mQBsTyFB7UeWUipregXf4j9C7HUsEhzokCKbQffyjvv
         HYmGqF37e9MMwwCcev+uIBZ9S0GeGv1vzlO8QDec6q/t+5Fuh7E+X1kzgqmgRU/pO0Pi
         ljmcvpROIxH7dUnERlgk8WiRXHpsuqN7Ku59psYh5IJAAY+c5FevmyDJeM27JRmR8KMJ
         kHsQ==
X-Gm-Message-State: AAQBX9cShTDVHDyT4r0bDbBrjZ06PI2/Gbs2GnJSqNX+LYm/GACRExFv
	0PAmiHt4pTBL9rXkU8Sx+ip7hA==
X-Google-Smtp-Source: AKy350Yr2P43gE5liiO6iogvurLbtimBHckv9vkjs1WrjwHNl+lYr0l63+K9HdLKFdnz2RrxxM3KbQ==
X-Received: by 2002:a05:6808:278d:b0:383:eff6:d3c3 with SMTP id es13-20020a056808278d00b00383eff6d3c3mr1335168oib.3.1680622516486;
        Tue, 04 Apr 2023 08:35:16 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id w124-20020acadf82000000b00387384dc768sm5325803oig.9.2023.04.04.08.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 08:35:15 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v4 1/9] RISC-V: Add AIA related CSR defines
Date: Tue,  4 Apr 2023 21:04:44 +0530
Message-Id: <20230404153452.2405681-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404153452.2405681-1-apatel@ventanamicro.com>
References: <20230404153452.2405681-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_083516_977947_47F0FBA4 
X-CRM114-Status: UNSURE (   9.52  )
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
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 95 +++++++++++++++++++++++++++++++++++-
 1 file changed, 94 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 0e571f6483d9..3c8d68152bce 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -7,7 +7,7 @@
 #define _ASM_RISCV_CSR_H
 
 #include <asm/asm.h>
-#include <linux/const.h>
+#include <linux/bits.h>
 
 /* Status register flags */
 #define SR_SIE		_AC(0x00000002, UL) /* Supervisor Interrupt Enable */
@@ -73,7 +73,10 @@
 #define IRQ_S_EXT		9
 #define IRQ_VS_EXT		10
 #define IRQ_M_EXT		11
+#define IRQ_S_GEXT		12
 #define IRQ_PMU_OVF		13
+#define IRQ_LOCAL_MAX		(IRQ_PMU_OVF + 1)
+#define IRQ_LOCAL_MASK		GENMASK((IRQ_LOCAL_MAX - 1), 0)
 
 /* Exception causes */
 #define EXC_INST_MISALIGNED	0
@@ -156,6 +159,27 @@
 				 (_AC(1, UL) << IRQ_S_TIMER) | \
 				 (_AC(1, UL) << IRQ_S_EXT))
 
+/* AIA CSR bits */
+#define TOPI_IID_SHIFT		16
+#define TOPI_IID_MASK		GENMASK(11, 0)
+#define TOPI_IPRIO_MASK		GENMASK(7, 0)
+#define TOPI_IPRIO_BITS		8
+
+#define TOPEI_ID_SHIFT		16
+#define TOPEI_ID_MASK		GENMASK(10, 0)
+#define TOPEI_PRIO_MASK		GENMASK(10, 0)
+
+#define ISELECT_IPRIO0		0x30
+#define ISELECT_IPRIO15		0x3f
+#define ISELECT_MASK		GENMASK(8, 0)
+
+#define HVICTL_VTI		BIT(30)
+#define HVICTL_IID		GENMASK(27, 16)
+#define HVICTL_IID_SHIFT	16
+#define HVICTL_DPR		BIT(9)
+#define HVICTL_IPRIOM		BIT(8)
+#define HVICTL_IPRIO		GENMASK(7, 0)
+
 /* xENVCFG flags */
 #define ENVCFG_STCE			(_AC(1, ULL) << 63)
 #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
@@ -250,6 +274,18 @@
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
@@ -279,8 +315,32 @@
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
@@ -297,6 +357,25 @@
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
@@ -307,6 +386,13 @@
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
@@ -324,6 +410,13 @@
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
