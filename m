Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BD4CA0FE1
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 07:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OUl3sxxBdcfQSbrpn1OJoHdNhq4OD06hKblzyntKnNM=; b=QVPpR7gOnxCnjg
	ocJ3PAADd/vk7I7vVtgrLFzRpQjo7Jh12J7xM10P6oHT4SVP+Nt3YNH/yIClSytmRpecsqmPzjAM1
	ynkka4MPK+KhEBFPs5yB6PxXJPUekpR/YfEueK3uJ3fI7sR+SSvEAVVJDF8wibEoguRiMig442EaN
	JPaGKVWM2zO/1nRMVZXvItuoy4rt4gTyNFozuqhHLas7UEARGb1bWaZKiHfN6zedN0F1vXuiCu4tX
	Hgq02q/Byzf48c1YNoAPUPFAI7obkiSivQyim8stTrMAkC9CHyiOqy80Zts9a7zIcAyh7lw6Rcw14
	h+fUlMFX58TdmlUtChWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRej-00000007Aa6-48dF;
	Mon, 25 Aug 2025 07:30:18 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqR7Z-000000075Ui-03VD
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 06:56:02 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-74381fdb5faso2519197a34.2
        for <linux-riscv@lists.infradead.org>; Sun, 24 Aug 2025 23:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756104960; x=1756709760; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3ulckDe3eWSmf553AzjVX023UG188U0t36zbr4OOP20=;
        b=RohwcBX3MCu0Vi9x7dnzFvCNjoulDhojzPZnfT1JFPG0w9zRF4K0MpU6bIHV2VfQYL
         sdOVz4LF5SoY4Oj4cLP7Bj1mFblp9FiJbOs3SCBtiEX+cBFoVcMD5HmZ4rtLXuFGR68H
         Mwx9R0df7RwNJLet9BiJh/DW4OtJaA/fsvZsZc5m3AVXOyHJSI34gAMf3P5Sb7+K4VfP
         qZJXwn/Z8WO0CbXSMNnVxXlRArwm14kSSu6yD98rfESsm9rwKtNfmnEM5+8Lfjm3rEaG
         PJbLTcmxKOzZMfQ6hQp1MdMhiRb5OUpKJRujiMrJwi2P+NImfvsKSu3zg4OfPp/7H0ZL
         WGeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756104960; x=1756709760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ulckDe3eWSmf553AzjVX023UG188U0t36zbr4OOP20=;
        b=L8T3yVke2OJVGPiiFUxuqrvz+9nqsnLT7gm6UBqVxQVdhYH2VrgMR+Rusz9qcg5Yz5
         p9TkK/S7AjiPMR4MoOgyIiJfxIH7ah6ELwqka8ebthnZ87W9m2c+mVUG+YMXaRONsuPf
         8cJQQEZugxdIwj50Clb/Hvz0FeTikRqHkKW5ir0wQ7sr7HddpUi0SC5rXDZ645+xFm3U
         QZOGHi140F7BXwDhl/RZjTovo/4+hybVgIEfdlepZE8XtcGVWllWxriFWvEphBwbPpbd
         Es9a7+kRNZTtS4SnxWv0448V/GvYt2PRnDDODWTCWt87pJc8s/khr42uq3wgrQfiV86S
         GgNA==
X-Forwarded-Encrypted: i=1; AJvYcCU1wiUXL7NXypl/yyhUF1M4NnmVGGavVr7Xg0flp5KQO4UCMsPZJaystDiuxvSyDC+gw05mPQwKqYgiMw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxDlzsDBDcQm4dVjlYUAPm+1JnI+fXPnFkoYKYk9DDYPA3KF5Yr
	Oub9PNSEGaviay25WpZUeRb3XhhFvmwnFOM6kM5O7v3YCPtDPrTpj7i1
X-Gm-Gg: ASbGncsbNeLIWJU32I+/ZSDCiAtpY+hFttrrx1nocwdtLD4Bt+hPm3YjjWOG9ZjjUR6
	C4qt+3ozLmvvGfLY7EO4IWJzDbbg3VrdMAshxox9kCt6zmRnn8G9pG4vSZF5hb1A5U6vcprERWF
	YPLnH7vP+vjcv391qMGlmzz+D8dmUKjoyUCPXv7vg18FIFatB1gQgIgaRtLtjJVnKEMKfk7XwQr
	3YwZZkwo0KEDPaT4r9TuDTFdaFdVpWEhHyZU68HTsinAO2joiqRxTIpFWy4DF/0soXy7gHdgwqC
	VwigSfmxBI4Rk649n2PCY5224qpds829ioA3Y6gc0cu2h79iJNzGSTIn5k5Qj0p0atQ9XkpRq7k
	4V6RjPjGPnnYZrtmjBJkMIlqfaqkk6sRr
X-Google-Smtp-Source: AGHT+IGpwYqZSLvuloDemQpps6HazGQohvDaEOzeL74e9j9PrL6xU465ZXDCufj9C4D2mPl9+TYvfw==
X-Received: by 2002:a05:6830:418f:b0:743:2cc:d530 with SMTP id 46e09a7af769-74500a45257mr5265337a34.19.1756104960115;
        Sun, 24 Aug 2025 23:56:00 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-61dc790aa7bsm894731eaf.26.2025.08.24.23.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 23:55:58 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	inochiama@gmail.com,
	krzk+dt@kernel.org,
	looong.bin@gmail.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	tglx@linutronix.de,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev
Subject: [PATCH 2/4] irqchip/sg2042-msi: Set irq type according to DT configuration
Date: Mon, 25 Aug 2025 14:55:50 +0800
Message-Id: <cf73d95140b03b586f44d2495376d367e32857ed.1756103516.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756103516.git.unicorn_wang@outlook.com>
References: <cover.1756103516.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_235601_056190_A98A7674 
X-CRM114-Status: GOOD (  13.35  )
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

From: Chen Wang <unicorn_wang@outlook.com>

The original MSI interrupt type was hard-coded, which was not a good idea.
Now it is changed to read the device tree configuration and then set the
interrupt type.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/irqchip/irq-sg2042-msi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
index 5249afd93b4a..be47c038386c 100644
--- a/drivers/irqchip/irq-sg2042-msi.c
+++ b/drivers/irqchip/irq-sg2042-msi.c
@@ -30,6 +30,7 @@ struct sg204x_msi_chip_info {
  * @doorbell_addr:	see TRM, 10.1.32, GP_INTR0_SET
  * @irq_first:		First vectors number that MSIs starts
  * @num_irqs:		Number of vectors for MSIs
+ * @irq_type:		IRQ type for MSIs
  * @msi_map:		mapping for allocated MSI vectors.
  * @msi_map_lock:	Lock for msi_map
  * @chip_info:		chip specific infomations
@@ -41,6 +42,7 @@ struct sg204x_msi_chipdata {
 
 	u32					irq_first;
 	u32					num_irqs;
+	unsigned int				irq_type;
 
 	unsigned long				*msi_map;
 	struct mutex				msi_map_lock;
@@ -137,14 +139,14 @@ static int sg204x_msi_parent_domain_alloc(struct irq_domain *domain, unsigned in
 	fwspec.fwnode = domain->parent->fwnode;
 	fwspec.param_count = 2;
 	fwspec.param[0] = data->irq_first + hwirq;
-	fwspec.param[1] = IRQ_TYPE_EDGE_RISING;
+	fwspec.param[1] = data->irq_type;
 
 	ret = irq_domain_alloc_irqs_parent(domain, virq, 1, &fwspec);
 	if (ret)
 		return ret;
 
 	d = irq_domain_get_irq_data(domain->parent, virq);
-	return d->chip->irq_set_type(d, IRQ_TYPE_EDGE_RISING);
+	return d->chip->irq_set_type(d, data->irq_type);
 }
 
 static int sg204x_msi_middle_domain_alloc(struct irq_domain *domain, unsigned int virq,
@@ -290,6 +292,7 @@ static int sg2042_msi_probe(struct platform_device *pdev)
 	}
 
 	data->irq_first = (u32)args.args[0];
+	data->irq_type = (unsigned int)args.args[1];
 	data->num_irqs = (u32)args.args[2];
 
 	mutex_init(&data->msi_map_lock);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
