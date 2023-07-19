Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50046EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 11:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vxe2AsjQvTxeLS04RmjFOiaWNuFPX/jK0AaVgBF1xio=; b=A67qpH6nayKFdH
	02wgs9RAkitkaTcx/C4jlsAGh/SGDweyeaRtaVBKs603AV2HPLtxbVT/YkxuU7gcuwl9tBL2uIYuU
	lUr85q8qPuZdIiKS0p21kWJUQp6wI/ZdtxMQ5db1XwiOacdu+7JL0IM6svTib4+9ga+G9fmXx0/Xe
	nUbl+8dbLqhpOV+ydIMWtoIH6osngjE0C4c7Y5IG9fTEr0pYyLndDkjbL0Nk6LZkYyNLQTUoCOkor
	6kJLlCk9/yPZyXhSMkKIecW0Ii8eeoQp6VeQCD+wZ9r4zMP42Bk57NoyFQo3fiA2v3L4xks86N82G
	DRp7Q6JdizIoEnMVZgTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM5TP-007FtB-1C;
	Wed, 19 Jul 2023 11:36:03 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM5TN-007Frh-1V
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 11:36:02 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-666e6541c98so6817738b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 04:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689766559; x=1690371359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ex8kAjQsuTgLkE/S9ECXNbIEk2g1m62Eq0yrmysJuO4=;
        b=oU1ryib5EKzy03oFHfMAIU5HKRsBMF2g0CI74gRDY6b1L0baZEzZAyYqDfvmK/n1KH
         ZCEat6jNr5YbNK/I77r3eTlGxiUJnCIgk4RBG9tzNUGMhw+DSDM3+G2UlDyuvIIwwKtF
         WcrgiFxE/fd8Gv5I0AFozy2PyOxMZnb9pm+4cqR/wEpEwcUGyeEXyE73GV8pcB27X+4G
         mBsOrwcZPG/DwIWGZSucSs3LS3Xed0r20ysGdy6sNvd2d8oSyU6sRLOK4f/9ZUeqPu19
         oTVlTlkA15M3qc1TiKgWU4OC12Nx/Eai/AoNHyCVaa04nCB3bu167x5/kWOe3GaSPVSi
         GGNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689766559; x=1690371359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ex8kAjQsuTgLkE/S9ECXNbIEk2g1m62Eq0yrmysJuO4=;
        b=TEaWTbXgnfgTvygqzY8XPhVdnHxC6eNMFxeFZDF9XVrvexc2Ab6VNKlOkMUjfJBWu3
         I00rsUb6/D3/zJooaOTGgr6ptQFlugo+OdYJ9/k4uprPF6VY2MoqzxEIzRS2je8x7yNW
         zGauLzimsDwArvbZt1BTFSDEVLFiSC6x+OcUmcHRU9MgHland+iD2pCWI1IxkWe79zI6
         K4QFAJF0P88lCiktXA9fdhPD51dLHnfFAUtCEydKYi9FIzgYGqnr+zTN81OU3o1pjGrc
         6hUK8LsTXTNuyfis41lr0FpwdrbVe5hrCSOcfq7/+DHz3feHAFqpqj60Uk+KJaPDLJX/
         WNOQ==
X-Gm-Message-State: ABy/qLZKJuayzmgaePcLmXRuStEm8UkmUthIbax6Kn0gwOgroRMBRtv8
	ip1jQuFA8aFeLugoDrBvfsQJYg==
X-Google-Smtp-Source: APBJJlHE/gB3IcCwX8JyA+Se9kHRCxoLnrcDhdJVi4BAGxqm0X27B56ReTMccHezF5RTF20r1eTToA==
X-Received: by 2002:a05:6a00:228e:b0:668:7292:b2c4 with SMTP id f14-20020a056a00228e00b006687292b2c4mr25389072pfe.4.1689766559249;
        Wed, 19 Jul 2023 04:35:59 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.130])
        by smtp.gmail.com with ESMTPSA id j10-20020aa783ca000000b00669c99d05fasm3050408pfn.150.2023.07.19.04.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 04:35:58 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v6 01/14] RISC-V: Add riscv_get_intc_hartid() function
Date: Wed, 19 Jul 2023 17:05:29 +0530
Message-Id: <20230719113542.2293295-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719113542.2293295-1-apatel@ventanamicro.com>
References: <20230719113542.2293295-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_043601_504740_9DFD5E0D 
X-CRM114-Status: GOOD (  15.78  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

We add a common riscv_get_intc_hartid() which help device drivers to
get hartid of the HART associated with a INTC (i.e. local interrupt
controller) fwnode. This new function is more generic compared to
the existing riscv_of_parent_hartid() function hence we also replace
use of riscv_of_parent_hartid() with riscv_get_intc_hartid().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/processor.h |  4 +++-
 arch/riscv/kernel/cpu.c            | 19 ++++++++++++++++++-
 drivers/irqchip/irq-riscv-intc.c   |  2 +-
 drivers/irqchip/irq-sifive-plic.c  |  3 ++-
 4 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index c950a8d9edef..662da1e112dd 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -79,7 +79,9 @@ static inline void wait_for_interrupt(void)
 struct device_node;
 int riscv_of_processor_hartid(struct device_node *node, unsigned long *hartid);
 int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *hartid);
-int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid);
+
+struct fwnode_handle;
+int riscv_get_intc_hartid(struct fwnode_handle *node, unsigned long *hartid);
 
 extern void riscv_fill_hwcap(void);
 extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index a2fc952318e9..5d26430fbcbd 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -81,7 +81,8 @@ int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *har
  * To achieve this, we walk up the DT tree until we find an active
  * RISC-V core (HART) node and extract the cpuid from it.
  */
-int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
+static int riscv_of_parent_hartid(struct device_node *node,
+				  unsigned long *hartid)
 {
 	int rc;
 
@@ -96,6 +97,22 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
 	return -1;
 }
 
+/* Find hart ID of the INTC fwnode. */
+int riscv_get_intc_hartid(struct fwnode_handle *node, unsigned long *hartid)
+{
+	int rc;
+	u64 temp;
+
+	if (!is_of_node(node)) {
+		rc = fwnode_property_read_u64_array(node, "hartid", &temp, 1);
+		if (!rc)
+			*hartid = temp;
+	} else
+		rc = riscv_of_parent_hartid(to_of_node(node), hartid);
+
+	return rc;
+}
+
 DEFINE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 
 unsigned long riscv_cached_mvendorid(unsigned int cpu_id)
diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 4adeee1bc391..65f4a2afb381 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -143,7 +143,7 @@ static int __init riscv_intc_init(struct device_node *node,
 	int rc;
 	unsigned long hartid;
 
-	rc = riscv_of_parent_hartid(node, &hartid);
+	rc = riscv_get_intc_hartid(of_fwnode_handle(node), &hartid);
 	if (rc < 0) {
 		pr_warn("unable to find hart id for %pOF\n", node);
 		return 0;
diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index e1484905b7bd..56b0544b1f27 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -477,7 +477,8 @@ static int __init __plic_init(struct device_node *node,
 			continue;
 		}
 
-		error = riscv_of_parent_hartid(parent.np, &hartid);
+		error = riscv_get_intc_hartid(of_fwnode_handle(parent.np),
+					      &hartid);
 		if (error < 0) {
 			pr_warn("failed to parse hart ID for context %d.\n", i);
 			continue;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
