Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0BFCEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 11:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5NN0AwqPriK7AVdsnPYDmzSaT9laud04d7XnXBqGb9k=; b=2NjbCmXiiKfPhG
	RZk0Pj7TI9YuZTYutlCI377FNouvxYm1dQ7pkJbn+oqlHs5x9iOcb+O+1mtdUkEs7Bie4qs+BANvY
	W1R2UAtayt71eH38LGfgsxQIXvF2vlaSXtEBFI/qTmELFZ2/lnR+WB0gxQAvLdG8KYe0nYzPgEgOz
	P1+vYXWvZPhsfJKu7U5g/Iyi7zMczlxJ4yJXB8uJMgvmku/PuHumbKn4fk0lgGaPjbjEZaE3XUiPz
	0hyuGZ+0A1jBfWEFQ0oLsNk8+vyL/jA1heetXsm6Hq0YJ/XWe1D8essbfk80gKrFhpnsrJjMfX5zk
	w/bdh67ZM2/5jZt9LBUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM5Tf-007FzF-2B;
	Wed, 19 Jul 2023 11:36:19 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM5Td-007FxS-1Q
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 11:36:18 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6687466137bso4496510b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Jul 2023 04:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689766575; x=1690371375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sm/Oy62GG5LOKEKm8aDmdi3uLhhg7069oiCusHUmNGk=;
        b=HdQckYlvZeBySvDiX8tlb1tJ7YW9/2OgiFOly4y3PxePbfYKDn+HFEmstzTYZJSqBC
         OxAaq0MZ4i2ZFoAPOlBLd8QYjG3+ed0xisinqHvrY7iySbs7ahYzBH58RIC0ofjQ1ipo
         Vir0JPZt4msdq30fFWdy9uSffwn9JeCZYig6eE3sFM9DO7AWyr/vyCUA6o1oME01Y+9M
         HyYC5M0RbPuC99buY29YoAJH+O4xWZ5LueWLWTwwoSf+VV0sLfpuEtTUhGDupEffYjj8
         LVIgP11/o+Nf6I1o0X4r9TMXC85qubMxMVan8n78c7815JtIxzLFYzQF4gaj6bjII5US
         vuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689766575; x=1690371375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sm/Oy62GG5LOKEKm8aDmdi3uLhhg7069oiCusHUmNGk=;
        b=fPTAtjDy2Ighv1KbOTcpmHlzttFS12zKah3jPCLiCLMimQ01D2zGYpzKWsPCML5A/W
         BDbvrEiWJyDf1ey3iMjnXdbyzLBETmEcG2D7YWDSzTBOKfBfXBkEOyoMXnKt/dxrel0M
         zs5aionLTybrH/XIxI/D2vYvcI9DvQQE0renLQBcEzsVEp0hp8jyuCFXgssqibxY569E
         AtE1JOfcXRTvIYYzZJ+GYCtcrtZvFiZXbFo0UBinOMadmGbyTVKQIhGQNwdXYTymiMNX
         WHEpKT9W0NIaaw8Tnzv1xLjSePQST2dAiGJAIJ1Iqi1qzRw6bsR/nuh2p9YlM5t42qfS
         yNiw==
X-Gm-Message-State: ABy/qLauSjWHFCFzFPllwkyd3pLTB4SgT6QTwNnqh5rAB6Vewz/LW3MA
	Ycwg+II/1kisEsrMg2PNkmJpeA==
X-Google-Smtp-Source: APBJJlF9KkVAOZTxPQhHCUYRj/xBbn98tqZ5FCY/+NRn4YJZBXv7vkPAdAECC8UNMIgBibyx8IAUew==
X-Received: by 2002:a05:6a20:1615:b0:126:9081:2156 with SMTP id l21-20020a056a20161500b0012690812156mr2151013pzj.4.1689766575090;
        Wed, 19 Jul 2023 04:36:15 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.86.130])
        by smtp.gmail.com with ESMTPSA id j10-20020aa783ca000000b00669c99d05fasm3050408pfn.150.2023.07.19.04.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jul 2023 04:36:14 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v6 04/14] irqchip/sifive-plic: Use platform driver probing for PLIC
Date: Wed, 19 Jul 2023 17:05:32 +0530
Message-Id: <20230719113542.2293295-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230719113542.2293295-1-apatel@ventanamicro.com>
References: <20230719113542.2293295-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_043617_479797_6BD54AD8 
X-CRM114-Status: GOOD (  10.79  )
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

The PLIC driver does not require very early initialization so let us
replace use of IRQCHIP_DECLARE() with IRQCHIP_PLATFORM_DRIVER_xyz()
so that PLIC is probed through platform driver probing.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-sifive-plic.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 56b0544b1f27..dc02f0761ced 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -569,8 +569,10 @@ static int __init plic_init(struct device_node *node,
 	return __plic_init(node, parent, 0);
 }
 
-IRQCHIP_DECLARE(sifive_plic, "sifive,plic-1.0.0", plic_init);
-IRQCHIP_DECLARE(riscv_plic0, "riscv,plic0", plic_init); /* for legacy systems */
+IRQCHIP_PLATFORM_DRIVER_BEGIN(sifive_plic)
+IRQCHIP_MATCH("sifive,plic-1.0.0", plic_init)
+IRQCHIP_MATCH("riscv,plic0", plic_init) /* for legacy systems */
+IRQCHIP_PLATFORM_DRIVER_END(sifive_plic)
 
 static int __init plic_edge_init(struct device_node *node,
 				 struct device_node *parent)
@@ -578,5 +580,7 @@ static int __init plic_edge_init(struct device_node *node,
 	return __plic_init(node, parent, BIT(PLIC_QUIRK_EDGE_INTERRUPT));
 }
 
-IRQCHIP_DECLARE(andestech_nceplic100, "andestech,nceplic100", plic_edge_init);
-IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", plic_edge_init);
+IRQCHIP_PLATFORM_DRIVER_BEGIN(edge_plic)
+IRQCHIP_MATCH("andestech,nceplic100", plic_edge_init)
+IRQCHIP_MATCH("thead,c900-plic", plic_edge_init)
+IRQCHIP_PLATFORM_DRIVER_END(edge_plic)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
