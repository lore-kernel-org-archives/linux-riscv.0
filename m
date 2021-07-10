Return-Path: <SRS0=oGbN=MC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3AE4C07E99
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jul 2021 02:00:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53AB661380
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jul 2021 02:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53AB661380
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OaGZYWSmm7loyboRx6j4EecFqPoBPKEhgEvY6Cn/xRE=; b=BDaHnQUmP+j074
	aZjWuK4s8vmdIcoHezpHx2CusrsWemORzi3YGn00gHVeLZsb+k7n0WkEEEpbDj4W08C7X671bYmif
	3QZpWSAcjfy06aNSnA395HyFboDr2TndFIt060Gzva9fs1eWG+oBiNPuPWyF84Ts34l2LtLZvYDec
	ab4uy0oC1EFRspAWWrsQcVqX59GwCeZHBxnm6BCQuRXcid7AOSg28lR7VIOVOSpqQlblDhF7hBapk
	kq3MaeqCb1afp7myxmaqPpLtDjEosmKT5d/FstkMaRWUXFT0FO04RQx5YjXWWTXTTq5ju4Gmr7poP
	TWSXTNK3qnijJpoYBkqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m22IN-002jnJ-Rx; Sat, 10 Jul 2021 02:00:43 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m22IL-002jmp-Hg
 for linux-riscv@lists.infradead.org; Sat, 10 Jul 2021 02:00:43 +0000
Received: by mail-pf1-x42b.google.com with SMTP id j9so4728862pfc.5
 for <linux-riscv@lists.infradead.org>; Fri, 09 Jul 2021 19:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=nA9nxKYu9oVaaHfZ9lhNuJLOtoXIjHKzXG8KKwzX1ww=;
 b=I4W8PT5jjCIfBYllG06F9xgUlp78/ec/qe+pvK6Eq/nRyLt6ePxiITBy3HD6YiY12+
 hZ5O6A63NPXWLis9XmN80lQUXcUrwvGsiA81jHi/YrTRNjXg8VtZD0jlC07QnoUXoDGi
 wYOS1BOZH6de+oasSlh9AEXNv1bfHNsS4PTBO/0JzoqVpacbCxgmBgIqm68oZqO3pSKS
 FegkK1VW9xJFG7EQGDpz+RPBWR26LvScGLRLwWpMvtlRKk0Z2X4wXN3eoTEs2qsQwJxJ
 cl37NgAhxmWn1G+z0ful9WqbDeOTDVDXW2gGwYuKu77j6IQpjpKIkhrD9T3cVixm6S9Q
 uCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nA9nxKYu9oVaaHfZ9lhNuJLOtoXIjHKzXG8KKwzX1ww=;
 b=VCvVmcn4K5Fp4W/nwMSdueQnOgEPzW9UBbGtqlKriIBkHG30qyrtHPT8Ybtg1uwzvd
 hEfpuLseOWWzPqouTDmblGp/3Nai2v5ENefWFbQNsz/qefvv388cOZVI6wWtUnP4R0+u
 vJwgAQos1V2jarNw7Rq1UC5W2l92754xVXcg7HrqvA4eukuHjaF4binL5Dw/jKK+CLtC
 bYCi05rVrAB5rN7P0un7lM1hEdj66oZ1zyC7LeNEKTCXCyjsD2Ex4SQJxEsTTccmlFes
 9K+ltayOTUFAIfEfsemN29FkM18Lv/F2Aoj1wcS2Zqv1uwbPuR3WHVOgorVkBuyG+aki
 dujA==
X-Gm-Message-State: AOAM533brMj5E0smZLKTMpAGTtdV0FCRFiFyVTpzsH19jrmsUF+SwnNy
 DGcrgM4uOoLkOo+v3BfBXPk=
X-Google-Smtp-Source: ABdhPJzB+fQoDECyXAq73Hol5awxzBJlDelVW4Q4zga6afOiD7i6jmbapq6D+11qbN0yrkoXef4LNQ==
X-Received: by 2002:aa7:978a:0:b029:314:146e:728a with SMTP id
 o10-20020aa7978a0000b0290314146e728amr40791243pfp.5.1625882438311; 
 Fri, 09 Jul 2021 19:00:38 -0700 (PDT)
Received: from localhost.lan ([2400:4070:175b:7500::7a7])
 by smtp.gmail.com with ESMTPSA id c20sm7927719pfd.64.2021.07.09.19.00.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 19:00:37 -0700 (PDT)
Received: from x2.lan (localhost [127.0.0.1])
 by localhost.lan (Postfix) with ESMTPSA id 5E588900A6A;
 Sat, 10 Jul 2021 02:00:35 +0000 (GMT)
From: Vincent Pelletier <plr.vincent@gmail.com>
To: linux-riscv@lists.infradead.org
Subject: [RFC PATCH] gpio: sifive: Take care of interrupt masking.
Date: Sat, 10 Jul 2021 02:00:32 +0000
Message-Id: <8c36c1a28ce63b5120765fd3c636944bfec8bee9.1625882423.git.plr.vincent@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210704064058.79237058@vincent>
References: <20210704064058.79237058@vincent>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_190041_649246_EC0809AE 
X-CRM114-Status: GOOD (  14.98  )
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

Rather than relying on the PLIC.
Fixes the inability to trigger PMIC IRQs more than once.
---
Note: intended as an illustration for parent email, for comments, hence
the absence of S-o-b and gpio maintainers not being cc'ed, all as extra
safety nets against accidental inclusion until I get confirmation that this
IRQ issue should in fact be fixed at the gpio level and not somewhere else.

One thing I would like to get feedback on which is maybe secondary to the
"where does the fix go" question is whether it is correct to clear edge
interrupts during unmask: I'm worried it could miss a trigger edge between
the attached chip's handler clearing a source and gpio level unmasking.
For level sources it should not matter, they will immediately re-trigger
anyway.
---
 drivers/gpio/gpio-sifive.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-sifive.c b/drivers/gpio/gpio-sifive.c
index 9c2d0bf04e58..cd4bb1f9ece5 100644
--- a/drivers/gpio/gpio-sifive.c
+++ b/drivers/gpio/gpio-sifive.c
@@ -108,7 +108,22 @@ static void sifive_gpio_irq_disable(struct irq_data *d)
 	irq_chip_disable_parent(d);
 }
 
-static void sifive_gpio_irq_eoi(struct irq_data *d)
+static void sifive_gpio_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct sifive_gpio *chip = gpiochip_get_data(gc);
+	int offset = irqd_to_hwirq(d) % SIFIVE_GPIO_MAX;
+	unsigned long flags;
+
+	spin_lock_irqsave(&gc->bgpio_lock, flags);
+	regmap_update_bits(chip->regs, SIFIVE_GPIO_RISE_IE, BIT(offset), 0);
+	regmap_update_bits(chip->regs, SIFIVE_GPIO_FALL_IE, BIT(offset), 0);
+	regmap_update_bits(chip->regs, SIFIVE_GPIO_HIGH_IE, BIT(offset), 0);
+	regmap_update_bits(chip->regs, SIFIVE_GPIO_LOW_IE, BIT(offset), 0);
+	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
+}
+
+static void sifive_gpio_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct sifive_gpio *chip = gpiochip_get_data(gc);
@@ -124,7 +139,7 @@ static void sifive_gpio_irq_eoi(struct irq_data *d)
 	regmap_write(chip->regs, SIFIVE_GPIO_LOW_IP, bit);
 	spin_unlock_irqrestore(&gc->bgpio_lock, flags);
 
-	irq_chip_eoi_parent(d);
+	sifive_gpio_set_ie(chip, offset);
 }
 
 static int sifive_gpio_irq_set_affinity(struct irq_data *data,
@@ -140,11 +155,11 @@ static int sifive_gpio_irq_set_affinity(struct irq_data *data,
 static struct irq_chip sifive_gpio_irqchip = {
 	.name		= "sifive-gpio",
 	.irq_set_type	= sifive_gpio_irq_set_type,
-	.irq_mask	= irq_chip_mask_parent,
-	.irq_unmask	= irq_chip_unmask_parent,
+	.irq_mask	= sifive_gpio_irq_mask,
+	.irq_unmask	= sifive_gpio_irq_unmask,
 	.irq_enable	= sifive_gpio_irq_enable,
 	.irq_disable	= sifive_gpio_irq_disable,
-	.irq_eoi	= sifive_gpio_irq_eoi,
+	.irq_eoi	= irq_chip_eoi_parent,
 	.irq_set_affinity = sifive_gpio_irq_set_affinity,
 };
 
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
