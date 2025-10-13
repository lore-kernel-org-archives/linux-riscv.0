Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC55BCCD183
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 11:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lnf8dkVYqpg62dQQ9WerrrPcAFIVt92EKYES+dwfSFA=; b=t20XcSa6DrVQQJ
	2UKkwxrgT3BySsH9wC3TGiRa1lJYJKJ6SMSq+0pWBoCMA7r/8Xel92uyvatr/xzR0q6TmqQcM50sT
	NhO6sh4sKX8F0E3J9CJwYqJap4GWFkxbXawf0VIkCNompTADSZ4QyxjEIjTI8qwBteNrDuUGt3eVH
	cMCt03Af6UazYHLHlwFASJWIcLAmGI6wWSXUJP6G/Y8enMVr6CRMEtQzajm3dEZlalS325JM8fMuI
	v211Unm2zpGCSRAkJ00ezk3iQ/w9dFFkbGvHXcXK4HLei6Pz/DGO3+mQzHI96cGWOkK39b6BuGFAK
	zZLXl4KLKbYMTKxziHGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GX8-0000000D00X-33ZL;
	Mon, 13 Oct 2025 11:16:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GX6-0000000Czz5-30X0
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 11:16:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760354163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pJHdo25GZsD//7L/M3VD6J/R1bZjkabZbJap+nii06E=;
	b=iFKAvXdnNUU6LVF2kE258SCw+7ZitQPtj6xkr7/RXzIYWrlHgJ/tJcBNn0vVEeSEWcMQ2z
	rypIghZQilNXbWphWZ8ZSOFJIBlLNOwUJ1yGTjqkKLGzRsWg08LVgZRB2kva/iO6Y+Y+Ac
	jjZUJNxGzXk2ju0tawpKb+elQ1ZxT0Y=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-149-Wa7L6_ELMhyVAmxe1kI6bg-1; Mon, 13 Oct 2025 07:16:02 -0400
X-MC-Unique: Wa7L6_ELMhyVAmxe1kI6bg-1
X-Mimecast-MFC-AGG-ID: Wa7L6_ELMhyVAmxe1kI6bg_1760354161
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b5a8154aa38so40834166b.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 04:16:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760354161; x=1760958961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJHdo25GZsD//7L/M3VD6J/R1bZjkabZbJap+nii06E=;
        b=jhFMkW+ujxZsPAOjqpHsNQpqGTCtlUzE3gDO/aEcmJktkpPu+Q8oEQRQ/8GJGBAo5F
         weOR2iFHWAJJj4CDoxipo1O3FkLdQ0n++W65DyaQgyiHYI/1lyjErfB0PY2qaM+FysQd
         4Q1X+Mboqj7m0x9tOLbkiC+aL0Lcxu7/K6WX4xRvUFYPqx+NEUVApPOIdthMUX296wU0
         alsK84SCvn1v4WAqTS+ZWjg9oNv79qA5578BxE08X9+elU/gjh9xkkGP622tfhvVkLva
         57n7BUCHBYFuhHD6StmHh9MSh/WCvNQULT8Fdyz1R3Vy9Da87EbiF+aVXtb/1ESvVuJk
         jF/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUcbaJOYJoyn8OnVd5qEB6WhwEOpea6cI8sRiPKQg6V2nGz14qbaq5zA3RhLDRQ5p4oVcp7xO8Oh/kzxg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMkKpd3vblMUJ1oF6Lfx9yG897a9jUQ0yNuDRkGTakPqCohaul
	L/l5MKFUt77huSTNFwJXo2fagwXXUFEMjIJLwhU0NPLsFW3JqE9efxMPNblI+TbUMQgCsQO6Rm3
	NlRVNJU+1otlXSz0znYPAgKmaKrbKzDn1zBYU/MET/y+1NwQWFQAYGgGZsTYREPagfT8Fog==
X-Gm-Gg: ASbGncsRxqP8yW6M6BWfnE8tHYw+obkPNm1ks2lZCbPoOUzEG9Ic6p7mwz1dnErdAa5
	ir2c7vgyQGSgg9QjOKIaNkBnVgy17lWBSk9Vs2cNfs3Epv67BhidnktnQ009pm8z4we30Z1Hwoh
	LHMTrnhUjDkkgrNku+fXtKxommBambfp1/s4r6kZk9bjolo6UaoEiyMbhuPDYkR7bSC3ZlmefGB
	g/2SfT7uQ0EmwCRibyrX7ikdh7BoCk2uG3IrS6NhTzJ5zy3bD+WCRJu6lqakEtkXkroNzNDgGKT
	u1XOimqZ+fFZSftxzsZN+XjqVKhvB9aRHJ/FJw7iDHPN
X-Received: by 2002:a17:907:72d4:b0:b3b:110c:d343 with SMTP id a640c23a62f3a-b50aa492035mr2038532966b.8.1760354161351;
        Mon, 13 Oct 2025 04:16:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFn6EsnRzMIVPRRAZr3OXPszrSJigMPb3zDVKXGXSvsMfCtVFK0OGUSuhUEqOn+xPWfIgDpYw==
X-Received: by 2002:a17:907:72d4:b0:b3b:110c:d343 with SMTP id a640c23a62f3a-b50aa492035mr2038529666b.8.1760354160855;
        Mon, 13 Oct 2025 04:16:00 -0700 (PDT)
Received: from holism.Home ([2a06:5900:814a:ab00:c1c7:2e09:633d:e94e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cad8adsm917336966b.7.2025.10.13.04.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 04:16:00 -0700 (PDT)
From: Lucas Zampieri <lzampier@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Charles Mirabile <cmirabil@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Vivian Wang <dramforever@live.com>,
	linux-riscv@lists.infradead.org,
	Zhang Xincheng <zhangxincheng@ultrarisc.com>,
	Lucas Zampieri <lzampier@redhat.com>
Subject: [PATCH v2 3/3] irqchip/plic: add support for UltraRISC DP1000 PLIC
Date: Mon, 13 Oct 2025 12:15:38 +0100
Message-ID: <20251013111539.2206477-4-lzampier@redhat.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251013111539.2206477-1-lzampier@redhat.com>
References: <20251013111539.2206477-1-lzampier@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -5JVYyw2sLGcSpCjvPmATdgfoBBjC6bNA4on-0CJTsg_1760354161
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_041604_834220_0AA9E8FE 
X-CRM114-Status: GOOD (  23.77  )
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

From: Charles Mirabile <cmirabil@redhat.com>

Add a new compatible for the plic found in UltraRISC DP1000 with a quirk to
work around a known hardware bug with IRQ claiming.

When claiming an interrupt on the DP1000 PLIC all other interrupts must be
disabled before the claim register is accessed to prevent incorrect
handling of the interrupt.

When the PLIC_QUIRK_CLAIM_REGISTER is present, during plic_handle_irq
the enable state of all interrupts is saved and then all interrupts
except for the first pending one are disabled before reading the claim
register. The interrupts are then restored before further processing of
the claimed interrupt continues.

The driver matches on "ultrarisc,cp100-plic" to apply the quirk to all
SoCs using UR-CP100 cores, regardless of the specific SoC implementation.
This has no impact on other platforms.

Co-developed-by: Zhang Xincheng <zhangxincheng@ultrarisc.com>
Signed-off-by: Zhang Xincheng <zhangxincheng@ultrarisc.com>
Signed-off-by: Charles Mirabile <cmirabil@redhat.com>
Signed-off-by: Lucas Zampieri <lzampier@redhat.com>
---
 drivers/irqchip/irq-sifive-plic.c | 83 ++++++++++++++++++++++++++++++-
 1 file changed, 82 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 9c4af7d58846..a7b51a925e96 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -49,6 +49,8 @@
 #define CONTEXT_ENABLE_BASE		0x2000
 #define     CONTEXT_ENABLE_SIZE		0x80

+#define PENDING_BASE                    0x1000
+
 /*
  * Each hart context has a set of control registers associated with it.  Right
  * now there's only two: a source priority threshold over which the hart will
@@ -63,6 +65,7 @@
 #define	PLIC_ENABLE_THRESHOLD		0

 #define PLIC_QUIRK_EDGE_INTERRUPT	0
+#define PLIC_QUIRK_CLAIM_REGISTER	1

 struct plic_priv {
 	struct fwnode_handle *fwnode;
@@ -367,6 +370,82 @@ static const struct irq_domain_ops plic_irqdomain_ops = {
 	.free		= irq_domain_free_irqs_top,
 };

+static bool dp1000_isolate_pending_irq(int nr_irq_groups, u32 ie[],
+				       void __iomem *pending,
+				       void __iomem *enable)
+{
+	u32 pending_irqs = 0;
+	int i, j;
+
+	/* Look for first pending interrupt */
+	for (i = 0; i < nr_irq_groups; i++) {
+		pending_irqs = ie[i] & readl(pending + i * sizeof(u32));
+		if (pending_irqs)
+			break;
+	}
+
+	if (!pending_irqs)
+		return false;
+
+	/* Disable all interrupts but the first pending one */
+	for (j = 0; j < nr_irq_groups; j++) {
+		u32 new_mask = 0;
+
+		if (j == i)
+			/* Extract mask with lowest set bit */
+			new_mask = (pending_irqs & -pending_irqs);
+
+		writel(new_mask, enable + j * sizeof(u32));
+	}
+
+	return true;
+}
+
+static irq_hw_number_t dp1000_get_hwirq(struct plic_handler *handler,
+					void __iomem *claim)
+{
+	void __iomem *enable = handler->enable_base;
+	void __iomem *pending = handler->priv->regs + PENDING_BASE;
+	int nr_irqs = handler->priv->nr_irqs;
+	int nr_irq_groups = DIV_ROUND_UP(nr_irqs, 32);
+	int i;
+	u32 ie[32] = { 0 };
+	irq_hw_number_t hwirq = 0;
+
+	raw_spin_lock(&handler->enable_lock);
+
+	/* Save current interrupt enable state */
+	for (i = 0; i < nr_irq_groups; i++)
+		ie[i] = readl(enable + i * sizeof(u32));
+
+	if (!dp1000_isolate_pending_irq(nr_irq_groups, ie, pending, enable))
+		goto out;
+
+	hwirq = readl(claim);
+
+	/* Restore previous state */
+	for (i = 0; i < nr_irq_groups; i++)
+		writel(ie[i], enable + i * sizeof(u32));
+out:
+	raw_spin_unlock(&handler->enable_lock);
+	return hwirq;
+}
+
+static irq_hw_number_t plic_get_hwirq(struct plic_handler *handler,
+				      void __iomem *claim)
+{
+	/*
+	 * Due to a hardware bug in the implementation of the claim register
+	 * in the UltraRISC DP1000 platform, other interrupts must be disabled
+	 * before reading the claim register and restored afterwards.
+	 */
+
+	if (test_bit(PLIC_QUIRK_CLAIM_REGISTER, &handler->priv->plic_quirks))
+		return dp1000_get_hwirq(handler, claim);
+
+	return readl(claim);
+}
+
 /*
  * Handling an interrupt is a two-step process: first you claim the interrupt
  * by reading the claim register, then you complete the interrupt by writing
@@ -384,7 +463,7 @@ static void plic_handle_irq(struct irq_desc *desc)

 	chained_irq_enter(chip, desc);

-	while ((hwirq = readl(claim))) {
+	while ((hwirq = plic_get_hwirq(handler, claim))) {
 		int err = generic_handle_domain_irq(handler->priv->irqdomain,
 						    hwirq);
 		if (unlikely(err)) {
@@ -432,6 +511,8 @@ static const struct of_device_id plic_match[] = {
 	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
 	{ .compatible = "thead,c900-plic",
 	  .data = (const void *)BIT(PLIC_QUIRK_EDGE_INTERRUPT) },
+	{ .compatible = "ultrarisc,cp100-plic",
+	  .data = (const void *)BIT(PLIC_QUIRK_CLAIM_REGISTER) },
 	{}
 };

--
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
