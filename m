Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45495C4451C
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jul 2026 04:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WLe2UiN4vxKx0XLWwCbBjr5YJ1QvhkJ2ivezO1Eq0R4=; b=NS5r4JDeKXXv9J
	f2jmy7gkG8Nkxb/vneT8UVuwXN9ixFqkrWiYNTvEzOVb3G8uB6pMfjLuYzHe/+SAeh5bZoIXtZRQE
	pTjViauQ7PC2LgR248KXf1ozRYAXj1uvhqhViXpqo3agZ9Dqic4KJIa4lteFBkJ3q6FJMCLdqevMc
	Tt3uvjc+DPQh50TJC3/tj7XZe4o+y1qKBbqrKLOipUoH+K2CvehMsEf8MJpsdl0/Ab66fMt+3/3Cn
	bwETr5haVdL5SKpw/FUs7kE8eZqSGwP/E/0XpD+Q2CAtZoKeTBumpIWRo0Wja0uk1Lzz/3osvGIpx
	+sAjupPsKobOq43pKTIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkwk5-00000003g8L-2eVo;
	Sat, 18 Jul 2026 04:33:37 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkwk2-00000003g7u-2UjW
	for linux-riscv@lists.infradead.org;
	Sat, 18 Jul 2026 04:33:36 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowABXYkAWAltqYkYuAA--.39012S2;
	Sat, 18 Jul 2026 12:33:27 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Anup Patel <anup@brainfault.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Thomas Gleixner <tglx@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] irqchip/riscv-aplic: Validate translated source IDs
Date: Sat, 18 Jul 2026 12:33:26 +0800
Message-ID: <20260718040000.003.797eee8b-caplitmus-rv@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowABXYkAWAltqYkYuAA--.39012S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAryDWFy5AFW8XF4UWw1Utrb_yoWruw1kpF
	4UJ3yavr40yF17Wr17Cw48Za43G3WjyayDtasIvwnaq3s0kFWDCFsFkrZ09r13Gr4UGas8
	Can3JFW8u3W5AFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_213335_005659_B5748DFD 
X-CRM114-Status: GOOD (  12.57  )
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

APLIC source IDs are in the range 1..riscv,num-sources. Device Tree
interrupt specifiers contain a source ID directly, while ACPI specifiers
contain a GSI that must first be translated by subtracting gsi_base.

The shared helper currently checks only whether the raw specifier is zero.
An ACPI GSI equal to gsi_base therefore becomes source ID zero, a GSI below
gsi_base underflows, and either firmware interface can provide a source ID
above the configured count. These values later reach d->hwirq - 1 register
and saved-state indexing.

Pass the configured source count to the shared helper and validate the
translated ID before returning it. This covers both direct and MSI modes.

Fixes: 2333df5ae51e ("irqchip: Add RISC-V advanced PLIC driver for direct-mode")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/irqchip/irq-riscv-aplic-direct.c | 6 ++++--
 drivers/irqchip/irq-riscv-aplic-main.c   | 8 +++++---
 drivers/irqchip/irq-riscv-aplic-main.h   | 3 ++-
 drivers/irqchip/irq-riscv-aplic-msi.c    | 3 ++-
 4 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-direct.c b/drivers/irqchip/irq-riscv-aplic-direct.c
index 5a9650225dd80..eb46d9a219e10 100644
--- a/drivers/irqchip/irq-riscv-aplic-direct.c
+++ b/drivers/irqchip/irq-riscv-aplic-direct.c
@@ -97,7 +97,8 @@ static int aplic_direct_irqdomain_translate(struct irq_domain *d, struct irq_fws
 {
 	struct aplic_priv *priv = d->host_data;
 
-	return aplic_irqdomain_translate(fwspec, priv->gsi_base, hwirq, type);
+	return aplic_irqdomain_translate(fwspec, priv->gsi_base, priv->nr_irqs,
+					 hwirq, type);
 }
 
 static int aplic_direct_irqdomain_alloc(struct irq_domain *domain, unsigned int virq,
@@ -110,7 +111,8 @@ static int aplic_direct_irqdomain_alloc(struct irq_domain *domain, unsigned int
 	unsigned int type;
 	int i, ret;
 
-	ret = aplic_irqdomain_translate(fwspec, priv->gsi_base, &hwirq, &type);
+	ret = aplic_irqdomain_translate(fwspec, priv->gsi_base, priv->nr_irqs,
+					&hwirq, &type);
 	if (ret)
 		return ret;
 
diff --git a/drivers/irqchip/irq-riscv-aplic-main.c b/drivers/irqchip/irq-riscv-aplic-main.c
index d9afb6ae98cf5..2284dbaea449d 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.c
+++ b/drivers/irqchip/irq-riscv-aplic-main.c
@@ -235,15 +235,17 @@ int aplic_irq_set_type(struct irq_data *d, unsigned int type)
 }
 
 int aplic_irqdomain_translate(struct irq_fwspec *fwspec, u32 gsi_base,
-			      unsigned long *hwirq, unsigned int *type)
+			      u32 nr_irqs, unsigned long *hwirq,
+			      unsigned int *type)
 {
 	if (WARN_ON(fwspec->param_count < 2))
 		return -EINVAL;
-	if (WARN_ON(!fwspec->param[0]))
-		return -EINVAL;
 
 	/* For DT, gsi_base is always zero. */
 	*hwirq = fwspec->param[0] - gsi_base;
+	if (WARN_ON(!*hwirq || *hwirq > nr_irqs))
+		return -EINVAL;
+
 	*type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
 
 	WARN_ON(*type == IRQ_TYPE_NONE);
diff --git a/drivers/irqchip/irq-riscv-aplic-main.h b/drivers/irqchip/irq-riscv-aplic-main.h
index 2d8ad7138541a..8d4010e7149be 100644
--- a/drivers/irqchip/irq-riscv-aplic-main.h
+++ b/drivers/irqchip/irq-riscv-aplic-main.h
@@ -55,7 +55,8 @@ void aplic_irq_unmask(struct irq_data *d);
 void aplic_irq_mask(struct irq_data *d);
 int aplic_irq_set_type(struct irq_data *d, unsigned int type);
 int aplic_irqdomain_translate(struct irq_fwspec *fwspec, u32 gsi_base,
-			      unsigned long *hwirq, unsigned int *type);
+			      u32 nr_irqs, unsigned long *hwirq,
+			      unsigned int *type);
 void aplic_init_hw_global(struct aplic_priv *priv, bool msi_mode);
 int aplic_setup_priv(struct aplic_priv *priv, struct device *dev, void __iomem *regs);
 void aplic_direct_restore_states(struct aplic_priv *priv);
diff --git a/drivers/irqchip/irq-riscv-aplic-msi.c b/drivers/irqchip/irq-riscv-aplic-msi.c
index fb8d1838609fb..665840e2c3919 100644
--- a/drivers/irqchip/irq-riscv-aplic-msi.c
+++ b/drivers/irqchip/irq-riscv-aplic-msi.c
@@ -140,7 +140,8 @@ static int aplic_msi_translate(struct irq_domain *d, struct irq_fwspec *fwspec,
 	struct msi_domain_info *info = d->host_data;
 	struct aplic_priv *priv = info->data;
 
-	return aplic_irqdomain_translate(fwspec, priv->gsi_base, hwirq, type);
+	return aplic_irqdomain_translate(fwspec, priv->gsi_base, priv->nr_irqs,
+					 hwirq, type);
 }
 
 static const struct msi_domain_template aplic_msi_template = {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
