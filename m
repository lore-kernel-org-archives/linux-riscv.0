Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C33C282D1
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Mar 2025 23:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GsLfvWuD2MmR2O7LWc+pD4qmMq3lWNRUl3k2vjxtyfM=; b=u5e9o7smA9eJxd
	aQ8IYEH+wAvmaqgsdjjVmuF9YZiirS9z77ogFqhujiG4kkubTp8WiaZOjcgeYmsLeckRslHmBAP1c
	Ru+UKqPS1mV1mmOj79+f5bf85imabtiUAD+gzhO92aVQhZORqKRYN4z17+iFeQfxn6Zgc01uTlP7w
	sef+sblzUKU2d+nwlYpTCrfmYuPNdGdx3h6hvmtG6L1ARh10Fy7MTmdsDjbWpeKLECWZ37gECMACP
	Y2lEn+FRbv5Qk4X20mVavi6gAQ/PTmFb/iXIDucPUmYmHsjpVSpk/5/ps7YMTlnzjh4c1cV9L66X1
	XNbA6QvNhQooMT4S2zeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toW3w-0000000F41c-3hnD;
	Sat, 01 Mar 2025 23:16:04 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toW3v-0000000F41E-0Jv0
	for linux-riscv@lists.infradead.org;
	Sat, 01 Mar 2025 23:16:04 +0000
Received: from [127.0.0.1] (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 3D68D342FDA;
	Sat, 01 Mar 2025 23:15:58 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sun, 02 Mar 2025 07:15:32 +0800
Subject: [PATCH v2 1/2] irqdomain: support three-cell scheme interrupts
MIME-Version: 1.0
Message-Id: <20250302-04-gpio-irq-threecell-v2-1-34f13ad37ea4@gentoo.org>
References: <20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org>
In-Reply-To: <20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5234; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=zxeDZ3m8ghHRYMlv6C610F+PSK9l52UHp2Zz1E/BhGA=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnw5Uk+AzYi+BPwfo0u0Stqep6nxdIVjnSsf4k4
 ToTybOqLRCJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ8OVJF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277VLRD/4gh4ycgW6fd+rGgF
 lC8dthgXYX//WESxt06UX5ixqiZJrwbu67k5AxYnfffv9c900EnHx5kNLXRkK5lSMOVnSgRbmYb
 vZNpd5dgbrInfKaULXXlcCGDAk+xeWzUOpF0Sld5t15FFO7A3AnWLAwcOelYOM7r7lWkcuaxoHv
 Qo4e07SkxGBBMBn3PrkSuPj7NFXziJ3Lw7/sD1J2N6d9pUfk5IjSE1UQpaQDNKyHFhGjbPRGA1Y
 ttKAxiWA4gk6EIbWDPw7XOjCrOUPR29RK9OqEiPKRUgLpcydEmC+9RDtoeGVh64acmC47gu0/G8
 DPdZrKSJx+JwP+k7UyaYSoRawmyJgR58q67aNaycDJphS9x8ebBFYyAoH1+VL6FQqD2mBFeOsNm
 nd2ArA9SNkMoVa01d1/2LbqUab0ayo0eyyGJmdMEof97QCsnruA6Z2irAZlg3hxDxzcgqcvjM8h
 4wGVg1se7Kut7d3GRBGmiX4w2wk9PS/XI1GeqAq3XYHwwrjSEHuC9K14GBuqRlSTXDgXHbeo9RF
 C/WI9Wai3fuyoReF6ipNlLU5yCobNx8L28UVDnIM1PM0iRCj64UJ2KPkdpx8zr1gQ5XpOKrzOU5
 OHnpZmgikaVq5ADZgbZ/+wU1nwLANhu8MNwbOipW/Vl1KqZxYKUvrgy9i84yxY6353Kw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250301_151603_230733_397A0323 
X-CRM114-Status: GOOD (  14.91  )
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

The is a prerequisite patch to support parsing three-cell
interrupts which encoded as <instance hwirq irqflag>,
the translate function will always retrieve irq number and
flag from last two cells.

In this patch, we introduce a generic interrupt cells translation
function, others functions will be inline version.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 include/linux/irqdomain.h | 37 +++++++++++++++++++++++--------
 kernel/irq/irqdomain.c    | 56 +++++++++++++++++++----------------------------
 2 files changed, 50 insertions(+), 43 deletions(-)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index e432b6a12a32f9f16ec1ea2fa8e24a649d55caae..d96796263a2e177140f928cb369656a44dd45dda 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -572,15 +572,34 @@ int irq_domain_xlate_onetwocell(struct irq_domain *d, struct device_node *ctrlr,
 			const u32 *intspec, unsigned int intsize,
 			irq_hw_number_t *out_hwirq, unsigned int *out_type);
 
-int irq_domain_translate_twocell(struct irq_domain *d,
-				 struct irq_fwspec *fwspec,
-				 unsigned long *out_hwirq,
-				 unsigned int *out_type);
-
-int irq_domain_translate_onecell(struct irq_domain *d,
-				 struct irq_fwspec *fwspec,
-				 unsigned long *out_hwirq,
-				 unsigned int *out_type);
+int irq_domain_translate_cells(struct irq_domain *d,
+			       struct irq_fwspec *fwspec,
+			       unsigned long *out_hwirq,
+			       unsigned int *out_type);
+
+static inline int irq_domain_translate_onecell(struct irq_domain *d,
+					       struct irq_fwspec *fwspec,
+					       unsigned long *out_hwirq,
+					       unsigned int *out_type)
+{
+	return irq_domain_translate_cells(d, fwspec, out_hwirq, out_type);
+}
+
+static inline int irq_domain_translate_twocell(struct irq_domain *d,
+					       struct irq_fwspec *fwspec,
+					       unsigned long *out_hwirq,
+					       unsigned int *out_type)
+{
+	return irq_domain_translate_cells(d, fwspec, out_hwirq, out_type);
+}
+
+static inline int irq_domain_translate_threecell(struct irq_domain *d,
+						 struct irq_fwspec *fwspec,
+						 unsigned long *out_hwirq,
+						 unsigned int *out_type)
+{
+	return irq_domain_translate_cells(d, fwspec, out_hwirq, out_type);
+}
 
 /* IPI functions */
 int irq_reserve_ipi(struct irq_domain *domain, const struct cpumask *dest);
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index ec6d8e72d980f604ded2bfa2143420e0e0095920..8d3b357b7dedbb2c274d4761c315e430b1d35610 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1171,50 +1171,38 @@ const struct irq_domain_ops irq_domain_simple_ops = {
 EXPORT_SYMBOL_GPL(irq_domain_simple_ops);
 
 /**
- * irq_domain_translate_onecell() - Generic translate for direct one cell
+ * irq_domain_translate_cells() - Generic translate for up to three cells
  * bindings
  * @d:		Interrupt domain involved in the translation
  * @fwspec:	The firmware interrupt specifier to translate
  * @out_hwirq:	Pointer to storage for the hardware interrupt number
  * @out_type:	Pointer to storage for the interrupt type
  */
-int irq_domain_translate_onecell(struct irq_domain *d,
-				 struct irq_fwspec *fwspec,
-				 unsigned long *out_hwirq,
-				 unsigned int *out_type)
+int irq_domain_translate_cells(struct irq_domain *d,
+			       struct irq_fwspec *fwspec,
+			       unsigned long *out_hwirq,
+			       unsigned int *out_type)
 {
-	if (WARN_ON(fwspec->param_count < 1))
-		return -EINVAL;
-	*out_hwirq = fwspec->param[0];
-	*out_type = IRQ_TYPE_NONE;
-	return 0;
-}
-EXPORT_SYMBOL_GPL(irq_domain_translate_onecell);
+	unsigned int cells = fwspec->param_count;
 
-/**
- * irq_domain_translate_twocell() - Generic translate for direct two cell
- * bindings
- * @d:		Interrupt domain involved in the translation
- * @fwspec:	The firmware interrupt specifier to translate
- * @out_hwirq:	Pointer to storage for the hardware interrupt number
- * @out_type:	Pointer to storage for the interrupt type
- *
- * Device Tree IRQ specifier translation function which works with two cell
- * bindings where the cell values map directly to the hwirq number
- * and linux irq flags.
- */
-int irq_domain_translate_twocell(struct irq_domain *d,
-				 struct irq_fwspec *fwspec,
-				 unsigned long *out_hwirq,
-				 unsigned int *out_type)
-{
-	if (WARN_ON(fwspec->param_count < 2))
+	switch (cells) {
+	case 1:
+		*out_hwirq = fwspec->param[0];
+		*out_type = IRQ_TYPE_NONE;
+		return 0;
+	case 2 ... 3:
+		/*
+		 * For multi cell translations the hardware interrupt number
+		 * and type are in the last two cells.
+		 */
+		*out_hwirq = fwspec->param[cells - 2];
+		*out_type = fwspec->param[cells - 1] & IRQ_TYPE_SENSE_MASK;
+		return 0;
+	default:
 		return -EINVAL;
-	*out_hwirq = fwspec->param[0];
-	*out_type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
-	return 0;
+	}
 }
-EXPORT_SYMBOL_GPL(irq_domain_translate_twocell);
+EXPORT_SYMBOL_GPL(irq_domain_translate_cells);
 
 int irq_domain_alloc_descs(int virq, unsigned int cnt, irq_hw_number_t hwirq,
 			   int node, const struct irq_affinity_desc *affinity)

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
