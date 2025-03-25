Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6CCC36005
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 22:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zJULzepcTw9fyLPHxrUjhfVTFUT8SLV9DrUoD9k4lAc=; b=l4bgRLzTMilwQ4
	SBj367Pnfl00OBlE0wAkz6YsWX3oUsKV0Ov0M0pIa9l/lQrUkOgV1ZfuwaeLDa0m3yfS05R6M3nB+
	vsVhPSpG3dRVB9KVlBK50fCcnLsKMNIcpMWSHKOAhpCF1B5i98tCsvVIPGayiOCHVOnrvxufPywpI
	+1ZmkZfYc/SX1OWEoS9r5lQmdFrtPDDO+Xb+yN03aA1tJTVVOt719LeCAFiIPLdq/ZAZS/PrBAN3+
	L4p1HyPa0yGihIwsIy7AaUOG8GrYRPdJdiHkbpPf60nlLDEF4d4a2yPUJl3lWR7oos+RnbYNuhILn
	u9awYLpGrRECX3o+aQxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txCRF-000000078KA-1H4I;
	Tue, 25 Mar 2025 22:08:01 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txCRD-000000078JQ-04Lw
	for linux-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 22:08:00 +0000
Received: from [127.0.0.1] (unknown [116.232.48.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 354BB3432CC;
	Tue, 25 Mar 2025 22:07:54 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 26 Mar 2025 06:06:19 +0800
Subject: [PATCH v3 1/2] irqdomain: support three-cell scheme interrupts
MIME-Version: 1.0
Message-Id: <20250326-04-gpio-irq-threecell-v3-1-aab006ab0e00@gentoo.org>
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
In-Reply-To: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5312; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=uP0LpVK1GZOT36IlyoC1Qcu+yKmI81ZTBqINksfQZkA=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBn4ykwWkBNYSDwpUk3cXnMXY9v3hh7E8IGbP/2w
 Yq21KgOsW6JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ+MpMF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277aRlD/4xH46DheyWQknACf
 fYhVEkHGZXD9DMjSNMoXrHEyBTFIko/ZhrQl6VuTY30UiqNiYouf3OiQEe6GZAGnafqIhtcoafK
 kvy6zyuVMB31DDSSxVONd+19RH8i/SLe5zjqZ/EfJ9pzSlmVSoFZWS/BWSKpGFlxHFFIxCUN18X
 Xy0W0rWun/3fI6u0zgXMH/qLauKMr/q/nkn9eLlZZxvM2tEhZ4ANyScJgM8TcSGUZsKRgFD+whB
 cSO58asNaduw8YqU+SFFot3a0MOvX9tACyvJL61AyOTvL4cWEMrDX7t0DlZk3wDggtYiR94Uroy
 W6BB3vLerZ6VMhEBbMBFcMv9HfXlgtmidZJsSwNoplXrjZynNHBwUEktzb4e2cjmmbLRq+fM2KD
 eYJGVG7JxSDK5z4i/TUNO98df/nNU88ePejT4py3+tw2IGMLh3IOv0mkREPpm/9GD7jRxzW/g6/
 sXD5Nm7LYeJ9PGcHChKGCnQvFnqQfZb1sNf/ecXaHpxMeR08CeUvtZpyx5SX5w+j5+bmx2fbZyi
 wt9fsz5dfKi/dX9lauQnN1GLKSw3KckxJSl6rCeGAZKfZWN8I/UHvY16vUYTpZEsVkb477iRg/k
 YOExL3fcDoNBxyC6JD5CnL5/VcZeXQ/MIMEuxrdi06qvFtRjHWsdkPQRST+cp6aRZpGQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_150759_084907_BACC1ABB 
X-CRM114-Status: GOOD (  15.35  )
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

Add new function *_twothreecell() to extend support to parse three-cell
interrupts which encoded as <instance hwirq irqflag>, the translate
function will retrieve irq number and flag from last two cells.

This API will be used in gpio irq driver which need to work with
two or three cells cases.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
I've also adjusted function irq_domain_translate_{two,three}cell param in
file include/linux/irqdomain.h, to make it fit with 100 column style,
also sort them in one to three cells logical order.
---
 include/linux/irqdomain.h | 20 ++++++++---------
 kernel/irq/irqdomain.c    | 56 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+), 10 deletions(-)

diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index e432b6a12a32f9f16ec1ea2fa8e24a649d55caae..ce77d1bf79b2931c28dee7456013d82b6552cb5e 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -571,16 +571,16 @@ int irq_domain_xlate_twocell(struct irq_domain *d, struct device_node *ctrlr,
 int irq_domain_xlate_onetwocell(struct irq_domain *d, struct device_node *ctrlr,
 			const u32 *intspec, unsigned int intsize,
 			irq_hw_number_t *out_hwirq, unsigned int *out_type);
-
-int irq_domain_translate_twocell(struct irq_domain *d,
-				 struct irq_fwspec *fwspec,
-				 unsigned long *out_hwirq,
-				 unsigned int *out_type);
-
-int irq_domain_translate_onecell(struct irq_domain *d,
-				 struct irq_fwspec *fwspec,
-				 unsigned long *out_hwirq,
-				 unsigned int *out_type);
+int irq_domain_xlate_twothreecell(struct irq_domain *d, struct device_node *ctrlr,
+				  const u32 *intspec, unsigned int intsize,
+				  irq_hw_number_t *out_hwirq, unsigned int *out_type);
+
+int irq_domain_translate_onecell(struct irq_domain *d, struct irq_fwspec *fwspec,
+				 unsigned long *out_hwirq, unsigned int *out_type);
+int irq_domain_translate_twocell(struct irq_domain *d, struct irq_fwspec *fwspec,
+				 unsigned long *out_hwirq, unsigned int *out_type);
+int irq_domain_translate_twothreecell(struct irq_domain *d, struct irq_fwspec *fwspec,
+				      unsigned long *out_hwirq, unsigned int *out_type);
 
 /* IPI functions */
 int irq_reserve_ipi(struct irq_domain *domain, const struct cpumask *dest);
diff --git a/kernel/irq/irqdomain.c b/kernel/irq/irqdomain.c
index ec6d8e72d980f604ded2bfa2143420e0e0095920..1c26ee119914dbd113b10f6d968e036ca887c793 100644
--- a/kernel/irq/irqdomain.c
+++ b/kernel/irq/irqdomain.c
@@ -1132,6 +1132,31 @@ int irq_domain_xlate_twocell(struct irq_domain *d, struct device_node *ctrlr,
 }
 EXPORT_SYMBOL_GPL(irq_domain_xlate_twocell);
 
+/**
+ * irq_domain_xlate_twothreecell() - Generic xlate for direct two or three cell bindings
+ * @d:		Interrupt domain involved in the translation
+ * @ctrlr:	The device tree node for the device whose interrupt is translated
+ * @intspec:	The interrupt specifier data from the device tree
+ * @intsize:	The number of entries in @intspec
+ * @out_hwirq:	Pointer to storage for the hardware interrupt number
+ * @out_type:	Pointer to storage for the interrupt type
+ *
+ * Device Tree IRQ specifier translation function which works with two or three cell
+ * bindings where the cell values map directly to the hwirq number
+ * and linux irq flags.
+ */
+int irq_domain_xlate_twothreecell(struct irq_domain *d, struct device_node *ctrlr,
+				  const u32 *intspec, unsigned int intsize,
+				  irq_hw_number_t *out_hwirq, unsigned int *out_type)
+{
+	struct irq_fwspec fwspec;
+
+	of_phandle_args_to_fwspec(ctrlr, intspec, intsize, &fwspec);
+
+	return irq_domain_translate_twothreecell(d, &fwspec, out_hwirq, out_type);
+}
+EXPORT_SYMBOL_GPL(irq_domain_xlate_twothreecell);
+
 /**
  * irq_domain_xlate_onetwocell() - Generic xlate for one or two cell bindings
  * @d:		Interrupt domain involved in the translation
@@ -1216,6 +1241,37 @@ int irq_domain_translate_twocell(struct irq_domain *d,
 }
 EXPORT_SYMBOL_GPL(irq_domain_translate_twocell);
 
+/**
+ * irq_domain_translate_twothreecell() - Generic translate for direct two or three cell
+ * bindings
+ * @d:		Interrupt domain involved in the translation
+ * @fwspec:	The firmware interrupt specifier to translate
+ * @out_hwirq:	Pointer to storage for the hardware interrupt number
+ * @out_type:	Pointer to storage for the interrupt type
+ *
+ * Device Tree IRQ specifier translation function which works with two or three cell
+ * bindings where the cell values map directly to the hwirq number
+ * and linux irq flags.
+ */
+int irq_domain_translate_twothreecell(struct irq_domain *d, struct irq_fwspec *fwspec,
+				      unsigned long *out_hwirq, unsigned int *out_type)
+{
+	if (fwspec->param_count == 2) {
+		*out_hwirq = fwspec->param[0];
+		*out_type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
+		return 0;
+	}
+
+	if (fwspec->param_count == 3) {
+		*out_hwirq = fwspec->param[1];
+		*out_type = fwspec->param[2] & IRQ_TYPE_SENSE_MASK;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(irq_domain_translate_twothreecell);
+
 int irq_domain_alloc_descs(int virq, unsigned int cnt, irq_hw_number_t hwirq,
 			   int node, const struct irq_affinity_desc *affinity)
 {

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
