Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69925C48BF8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 09:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YjglAuOxHrKbn68vwEbI6wVkkkFyAR7oQdiNMidA4h0=; b=zxPSC2Cwcg21ml
	dkgkqGu3L27zU/sP3xAu4kAU8VYTNvo64Wkzpa0GQPb1ANFMllgaOcZcaADurw3keQ8xb1MFeSes+
	u2YU+QiF3rfRf6Qgr7lS19VjJngZRAqnkki058NANPaw0H5qEzVCMfTDfwTjsB4RR0Gewjc6G3f2E
	X+RaAswFAOl7i5HiRlojP6VefA5xzPmPKkyNutnq6dF1k1LIe9yitWJV8ZGh11F8OtsepP5pbP2T5
	bxp8q7kP/cUo6cagGqtUGZ9C61ZVyDskJDW42s3KySz2v0YjkqDyFphUZkj/vUJYwP96RzVIIdVBu
	f50W4iJ3YCNWleyPa09g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5Zs-00000004ILh-16Vj;
	Thu, 22 Feb 2024 09:41:16 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rd5ZT-00000004I27-33s1
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 09:40:55 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3bb9d54575cso1036597b6e.2
        for <linux-riscv@lists.infradead.org>; Thu, 22 Feb 2024 01:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1708594850; x=1709199650; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n8Ocksk32SLy+uqf+lOwT2Rti1KnrinKQe1UyB1vdGY=;
        b=iFGpE3SKFqgmfpV2p1FqG/+BYj3PQMRsuDrVN7t1ZZ/ABHvdCr0kdpF8csTnP5Amjr
         uKfrlVcJQzfyeonpzYlJNN2HhoJqBR12rNOrFqbK3hEw0EPK6XBXy7eNJlQQRZMuU636
         sHtHQclOeVLHW8mCadXUZ+Vmg1CtoLpxQwarLEoSEIg96+Ki4nj1zUWPMMkj5UojSvWg
         HW4T6jifudMdSwQn2e2nuBQ3cB93hB1+08vTQYRcQzxy/U2sbWLDyxzC/8sox3rTrVAo
         ZvLmqBwjrwKa0ZNru7Ieqo+/FJHs2ySQBM0CgQVkL2CoEe87K0E6xbx6exrgyge9wTNO
         sa+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708594850; x=1709199650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n8Ocksk32SLy+uqf+lOwT2Rti1KnrinKQe1UyB1vdGY=;
        b=VRp3P/F3UXs3tHgxsx/x2YXrv5M8e1dlN0L/b/1Q/I8YJME/F4CkCayURFnFUyqIvG
         qKgoMatg8mfaQ4K10YoIVnWtImuXjLgAejSslVAeu3xmyj/s/jzpp45eCsNGcLmGjpdS
         05UEhHCH0EhnP6rDe6NLlJeEFFs45VUVc6Y2bUVfFa+RrNaUWV0jGHHmLG6ubAX5Dxuu
         8cLmx0mvej8YsZvz0jSQuyvzB2MEw0Q2cQG/TelvdbQrbtEGPNYVm9dQiGQeH04kI5RJ
         3yUIm6jnLuyJfF3Fhr3rhma8QxEcOgjltwIppCvGgcsnRIlnJGGtGNJgR4MHxZFS26Fc
         Fa9g==
X-Forwarded-Encrypted: i=1; AJvYcCVItgvjDyDUQJTWfvQkOA6eBMPATI7xNbgsJwnOpMfsLn08zGG7keey3DdmqxGKCGKcp6THUq0vt6pYJH7tU3mza8YzJxWgfCNGfbfZLiLt
X-Gm-Message-State: AOJu0YzHVO+2i5x3AYOCLZraU7FJCWqcjKani0DsSNhaJn7APA4o54eW
	zoNlLWqgRl0Iba9DshdWE8ICC/rZK9nyIk+Y0GJVJRtDWE45S8n9439mFDNHlZ0=
X-Google-Smtp-Source: AGHT+IH5OKcKJyZKoiJWHlEtV4ymh6yBEg2cp7+WIXAmpNd3ymvmgUIHcqDcQqaA486cA4C3qr2pMw==
X-Received: by 2002:a05:6808:1306:b0:3c1:82ae:d61a with SMTP id y6-20020a056808130600b003c182aed61amr14216oiv.14.1708594850533;
        Thu, 22 Feb 2024 01:40:50 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id n15-20020a05680803af00b003c17c2b8d09sm130699oie.31.2024.02.22.01.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 01:40:50 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v14 04/18] irqchip/sifive-plic: Use riscv_get_intc_hwnode() to get parent fwnode
Date: Thu, 22 Feb 2024 15:09:52 +0530
Message-Id: <20240222094006.1030709-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240222094006.1030709-1-apatel@ventanamicro.com>
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_014052_084949_0198ECF4 
X-CRM114-Status: GOOD (  12.56  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The RISC-V INTC irqdomain is always the parent irqdomain of SiFive PLIC
so use riscv_get_intc_hwnode() to get the parent fwnode similar to other
RISC-V drivers which use local interrupts.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-sifive-plic.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 558ae63795d9..615498071b6e 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -422,6 +422,7 @@ static int plic_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	unsigned long plic_quirks = 0;
 	struct plic_handler *handler;
+	struct irq_domain *domain;
 	struct plic_priv *priv;
 	bool cpuhp_setup;
 	unsigned int cpu;
@@ -501,8 +502,9 @@ static int plic_probe(struct platform_device *pdev)
 		}
 
 		/* Find parent domain and register chained handler */
-		if (!plic_parent_irq && irq_find_host(parent.np)) {
-			plic_parent_irq = irq_of_parse_and_map(to_of_node(dev->fwnode), i);
+		domain = irq_find_matching_fwnode(riscv_get_intc_hwnode(), DOMAIN_BUS_ANY);
+		if (!plic_parent_irq && domain) {
+			plic_parent_irq = irq_create_mapping(domain, RV_IRQ_EXT);
 			if (plic_parent_irq)
 				irq_set_chained_handler(plic_parent_irq,
 							plic_handle_irq);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
