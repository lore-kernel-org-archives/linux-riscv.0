Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B55EEE3F09
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 17:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qSG1lgD6Lu2nU7A4GesRhkIHJCus2jL5BM2q61dNAt8=; b=NWYqc6UhaX4kYm
	XIE5X77D9UjlvWJetDyrr568ueYJb8FzkXZbVM0fAAKGttmQUFuAX/5ObTnK7sE8z5dXvRufWlr3K
	EaDvfE3EC7bimcOTUCYhMINTdOfTeEsjfeQ9Il7nDT5dk4ECLLBOArUIsjQ7T4nmHuagVsTVV2U0a
	0gtcIcE76eJixocTMggR4JQOzSPWGYMyaR/lpW0S0+h2owc16gjQLrQy+oGSDPojvbBz8j7gf0e40
	ygINvotXwgRoE5YPUzznzeq1YCvpcOmKsnWKB6uF0AcyXc59EexhCGnVRinyhVErWGjfJeua6eA9i
	+gUngFn9VYbwV/takh1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg7X0-003vfk-12;
	Tue, 12 Sep 2023 17:50:34 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg7Wy-003ver-1Z
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 17:50:33 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1bd9b4f8e0eso40625865ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 10:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694541030; x=1695145830; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IKD5S2fbnJino2jsSEu0lyxkI20ofFJrbuG4PPQ6fw=;
        b=jROJn4UIL35VTVfMo2JcioS24qjF5R+rPVY3ISbW+ITUBBd49gGk61kZBTdAiPLY8u
         +3YOgNVaQByQxmFF0HOXhcY1EtzQmiVpLAEi4Xj9zx7+Jxm61PuIqFEpo85GvqKnL+Gn
         QiU1KVtgK0vi5urLM95F7AP3TN4rSHSMFKFwo1jagBMiE8MaHaw2Tyo1lOn4xICKn/x/
         oTE0mjd9sX5oohJ/arO2bC2eh1Yzpc4Mi12a/Qtxi1nKNWJ25GsWQyAQHHnWkRMXqARI
         +94WdQzfYjLTXc4sxpyApoPZ1bhLzrY23HXABfLL0T47sEFja/J8YgwNowESpmr6jH+Z
         RcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694541030; x=1695145830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9IKD5S2fbnJino2jsSEu0lyxkI20ofFJrbuG4PPQ6fw=;
        b=Y8Xltjy4NE2OMB1FHsmwCafZCJBPWsI6Tvpkn3dUi+6iOE+SRiZhWfQV5H37TiwAwz
         L8pWnzGWhlA6/X6HsffH1QeMvyS4IQsyUxzU/wlgLqXm/EE4zFPQCaxP3MvFBH6mF0er
         P6xzf+NPlAjlXybiaUQaQKg0+C9QZj19zw8eGRVoBu2kH+05To5VlH+81Hz2ia4hnATG
         51DBOxp81zfz+Q9K3ZOetjdhVGCFn3bVQer6nvDodeCySnWlFALvVcCaq2m9G3z+6CWl
         vdUVCy10zijG5YTEWBRHn5wCp6OlvXVO3PWWHRnQm9z6RZhTa6si7OXeCWut+9g+Nd/3
         VqMA==
X-Gm-Message-State: AOJu0YykIqZPUB87gd/9S+mPgOF61WubHhqtZPL7C2vewPKn57XByBK3
	iAd5W1WwgPcS/8/bOXnc8YKfhQ==
X-Google-Smtp-Source: AGHT+IFMERBeKxTJB9AlyRI3xNpGXzEafM62yO44s+WaPRa/xDJk52ujsBlJpAigaAJ4jApqiclPeg==
X-Received: by 2002:a17:902:e546:b0:1c3:bc7c:e14c with SMTP id n6-20020a170902e54600b001c3bc7ce14cmr578213plf.32.1694541030378;
        Tue, 12 Sep 2023 10:50:30 -0700 (PDT)
Received: from localhost.localdomain ([171.76.81.83])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902a40c00b001b891259eddsm8691440plq.197.2023.09.12.10.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 10:50:29 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v8 02/16] RISC-V: Add riscv_get_intc_hartid() function
Date: Tue, 12 Sep 2023 23:19:14 +0530
Message-Id: <20230912174928.528414-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230912174928.528414-1-apatel@ventanamicro.com>
References: <20230912174928.528414-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_105032_524208_973C7848 
X-CRM114-Status: GOOD (  17.02  )
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
 arch/riscv/kernel/cpu.c            | 13 ++++++++++++-
 drivers/irqchip/irq-riscv-intc.c   |  2 +-
 drivers/irqchip/irq-sifive-plic.c  |  3 ++-
 4 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 3e23e1786d05..3ce64b3bea4e 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -119,7 +119,9 @@ static inline void wait_for_interrupt(void)
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
index 157ace8b262c..ee583eac3c5b 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -123,7 +123,8 @@ int __init riscv_early_of_processor_hartid(struct device_node *node, unsigned lo
  * To achieve this, we walk up the DT tree until we find an active
  * RISC-V core (HART) node and extract the cpuid from it.
  */
-int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
+static int riscv_of_parent_hartid(struct device_node *node,
+				  unsigned long *hartid)
 {
 	for (; node; node = node->parent) {
 		if (of_device_is_compatible(node, "riscv")) {
@@ -139,6 +140,16 @@ int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid)
 	return -1;
 }
 
+/* Find hart ID of the INTC fwnode. */
+int riscv_get_intc_hartid(struct fwnode_handle *node, unsigned long *hartid)
+{
+	/* Extend this function ACPI in the future. */
+	if (!is_of_node(node))
+		return -ENODEV;
+
+	return riscv_of_parent_hartid(to_of_node(node), hartid);
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
