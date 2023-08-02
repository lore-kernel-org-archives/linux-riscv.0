Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81497C04E69
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 15:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0fqRprfP1raS1asXoNFr1Lz9Nl2N3dNjYaFTZauHmd8=; b=gG1Zgn2Fere9el
	rZpcuT6Bdcf6R9j4AUabixq1I1sMS60iQb+o9ioPib3A2/+t967OqUFtaGGXglIA80d7JNbS+uOD9
	5/4wXvSI8cMvxKEoQDJ4Zrk1/5AqxWD3MxLBvAsqWF8pHsgC5/jVA4QAcvnEPvJVk6ady+9SESDD5
	SeLU11WymkFy72/AGmahgEQE0/9zageAczSUkbB9FEanDxvalsB5O8YIm0aCiBhSuv1QQL7H9kyrV
	THH2myHyxJPAv60wXP7PxnNmy9XA67vV/ZtkCI0Iw44d2F29XUWDYy+ulYqvg15Yx1E1HrE+/cn87
	a4/1/5+p5mKLbbIeQgXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDLB-0059YI-1w;
	Wed, 02 Aug 2023 15:00:45 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRDL8-0059Xb-1r
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 15:00:44 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bbf8cb694aso39293055ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 08:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690988441; x=1691593241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MFifZoeBHO5EvFOj+ZbSo7s64eoTFIfH2fAZl0Owb5c=;
        b=n+5956oQdCieWbAT985RXUNhoICmFY5KgB5CPz+S1dAzLwHhVtlyrfMhzuDo1pgn5i
         I103huNg2rg1eFNtxP09qVmV4M9cz0zRaxFYZIPK0OqcXkIU9Dt/P0PFXjWbQa/hw2rv
         RaCOvHsBCOWQU0SDy2Lqy9tQe2CXWRs6S80S5zHd08NkAn6DwYNV3Vor7TT+0tCdFdCK
         1cVGYmc6eX1EDceYb8v21y2D2EHcvaKFA0ZXexb1GyirZ7/kPmYXud67u+RtWKlWSBSB
         V1KtS5XIQHaRMOmI3fq+ZfRDvwmRzNvzUhj8hr1t7ITYJqLbsoVsp8ouE9ruzOm+9Fxa
         gv1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690988441; x=1691593241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MFifZoeBHO5EvFOj+ZbSo7s64eoTFIfH2fAZl0Owb5c=;
        b=aGzKQ3pUfOrBaar39lNoiFDaPyH9Uf/4VGscJnx5jquR29wGVPRWxqmeeQ/hgFKWi/
         9r3Pwgv6p9HwZFpx3SvQGpArb/oVZJnqCgmSO5OE9Jy2xCqQuXhx8SDr7WoOaYldlYDU
         VqaKR3qa6l6ApdYV4QteF4hGD3icjKW+1PtP4CMlTDzTE7nXwkTReSqp6aJd6o41ydHv
         Yye0YzVfQs8TyFEmO5u0s7lGGWDoHTZry8GRIS7FdQbHu1WfW9Cc1aiqnIHIpxOAtkgz
         GnIN0QPXjgmrchTKBLiOeyHr0Lq1/uU0BKVZY0MH+X7vVbs0uMygQy7zf+MX3W8DIvEC
         YAOg==
X-Gm-Message-State: ABy/qLZQpwuLbfBPehcAGOYQejEy/9byrKSIgvnvVs/4L4Ubbp4c1CwV
	zkHLe3V3YfX+ttm+/r+IOQPfFg==
X-Google-Smtp-Source: APBJJlFcsFE4thzxrSFwk3JFPJgrjeItq2mzQ0ltJzpgGpoYYpR5L/UVU8HTXe82BLKT8FGXj90qSQ==
X-Received: by 2002:a17:903:41cf:b0:1b8:a65f:b49d with SMTP id u15-20020a17090341cf00b001b8a65fb49dmr19389598ple.12.1690988441018;
        Wed, 02 Aug 2023 08:00:41 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id v11-20020a1709028d8b00b001bb99e188fcsm12503963plo.194.2023.08.02.08.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 08:00:40 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v7 01/15] RISC-V: Add riscv_get_intc_hartid() function
Date: Wed,  2 Aug 2023 20:30:04 +0530
Message-Id: <20230802150018.327079-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230802150018.327079-1-apatel@ventanamicro.com>
References: <20230802150018.327079-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_080042_613871_DCF72009 
X-CRM114-Status: GOOD (  16.74  )
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

Also, while we are here let us update riscv_of_parent_hartid() to
always return the hartid irrespective whether the CPU/HART DT node
is disabled or not.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/processor.h |  4 +++-
 arch/riscv/kernel/cpu.c            | 26 ++++++++++++++++++++------
 drivers/irqchip/irq-riscv-intc.c   |  2 +-
 drivers/irqchip/irq-sifive-plic.c  |  3 ++-
 4 files changed, 26 insertions(+), 9 deletions(-)

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
index a2fc952318e9..c3eaa8a55bbe 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -81,21 +81,35 @@ int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *har
  * To achieve this, we walk up the DT tree until we find an active
  * RISC-V core (HART) node and extract the cpuid from it.
  */
-int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
+static int riscv_of_parent_hartid(struct device_node *node,
+				  unsigned long *hartid)
 {
-	int rc;
-
 	for (; node; node = node->parent) {
 		if (of_device_is_compatible(node, "riscv")) {
-			rc = riscv_of_processor_hartid(node, hartid);
-			if (!rc)
-				return 0;
+			*hartid = (unsigned long)of_get_cpu_hwid(node, 0);
+			return 0;
 		}
 	}
 
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
