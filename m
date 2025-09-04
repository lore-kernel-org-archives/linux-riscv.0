Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD81ACA1014
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 03:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DxNgUVgY+u9nMCyrJUJG6mTxE4y6CTwhNziFPwp8YIg=; b=wQnQseh+b++bqY
	nrafgfZ48x0u9YwVdA0Qma98vU791cA6Zkeue7N7KNYIlKckbozQl4o6gwU/OQ7rqxfdgle0qr+tj
	ZbGoVznJA6TCigGYSvvTo3rZvv5QxcKFfGHHvWErAqa0ZubPitPdUR9zAGz0xvcyymUBP2zfbTqE5
	g/VugdAZ7jk3T/MiHTV991U5oIZ7WBoPM+owY/bCU9CMJRthzSvRQHhHBDf2wWZrJq/iFW9F2CBrL
	25naKBRwv0/JWoD3odYv6awd6yAbMo85S9vLcd/07XQTlMRvDlSjYcqnpRJtqZoSvMx8nrfGiGvQg
	Ckd7pC7/gK6LN4RJcazw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0EB-00000008Y1P-1Iq9;
	Thu, 04 Sep 2025 03:01:35 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0E8-00000008Xzs-3Jwt
	for linux-riscv@lists.infradead.org;
	Thu, 04 Sep 2025 03:01:33 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-437d40a96feso17504b6e.2
        for <linux-riscv@lists.infradead.org>; Wed, 03 Sep 2025 20:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756954892; x=1757559692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W9CajuAm7VsoRhpeotc4jxkIe8TBDwxy99+zM/DwbrY=;
        b=SZzeDaMqgL0VYqy9GsXJ9tNDyTy2uBr//LuiX1YRZHlEJCKxF3/utDprPFOx3IoWVF
         eDzxCKQPahMWevZyXZQm8GEHQtso3SFQGzceVRlba2co04pnN8INnva3cHDTVUMcp0uQ
         DUwGrk5hQ8IWN4DVwIE+hhJIuBIB9jH8SMeaIf1lo+ZefRuDq9bFSil0eBO22mtTjCWc
         L6kkinc4nOG8r/eFri1R1HCNKTKv1fJphtVDpt1N1TkkhydoV9d10YsSRssQIO0Ut6q0
         Z1Kaj1KcnvxR6pze2wGSe/jPHR1xTkO62GDn7dgCgfJK71OpiuzhgWEA9dS1bu0qkfS/
         uUSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756954892; x=1757559692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W9CajuAm7VsoRhpeotc4jxkIe8TBDwxy99+zM/DwbrY=;
        b=Wz4AU7SOl5oeCh6Sm6DpAzAO8rgsm+7FQmcl+qZ4Lsiyfim1+Tdou+3gYDU52GYyXD
         hNWgN3Mc0GpIvyDzmbYjpxFPF/UsQbJ35MmZ06GMkxmCsoI3yo2fHhwyYwFgIc0TD4dL
         fw8AdtzY+mXE1A3A+kNYj8+sF7wK8cek1KR15sk7LWcqVbrYdGid+OzOYQmNtJJ/L+fV
         M7kzm8kODZUIh5hmTyhFz6wSsCfVrFM8PrPPXC2fHJ9thyyvr9ABVRGzw3U6tcw/F3+V
         gmzpmXX8bQvQ0p0xEDYfi08Dnlr1KSe6aa02G5Mnk0NbY88lkABwbGLZ+m4yrluJZ+di
         TX9Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6h0r8/Ewoer49C02874PYuItxIX9/0B76VZVzL7uRBtOXtyeHoFvN8h6wUv0OnstM9fyEAcl7YJWKcg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz4U1SEWbZSf5xaDC4gVAH5SK3kIpDLNpWAJ0s33F+0k2nX8G7
	Se8pFAN1agKEKwPPDwMvET9xivKFhkNufJgr/qUlJriYJeLYxi3zWOEf
X-Gm-Gg: ASbGnctaWuMhj/mzxwA7u9ex0vlbarEdxyeVwM34ndDAva52vQI59pN7JuIbIbze02d
	hgNy6YtX6ElZbqmXLFAMe6vrxWeYwSw+3zvVD5eT9CM2/9D5fBMsYFgi6dr3O0ia5eaCHFy4tCo
	PhQodRGFrxmEu7ksYg8JGlfMjCau4XmBgDb3qAHaPHpMNs8Sp/BB0UR19b1KyxjaNdjVfcku7Ce
	//Mn6t4uEBS+EalpMutDWRKFrkNxExMaGZYvFnL23z0DPMwO5nZNkwWQ93uC9vcQBExpKGD7R6C
	AIs1lQy1F3zFTuRRpVSMSBptNZM0gFvvYM+QJult+f+WBeEOprrV0wj8l8ZRRQr/sonv4v/SnGr
	ibcHwHepf0daGbvl5Z1e/0PUug5tlRl0SoSavrkGvr+4=
X-Google-Smtp-Source: AGHT+IELP+mxSGzElVCEVywyn+fMnmBhJCUygHmISkh2tEXspU6mwEADZzjNbwOJ0l2qTQ0URFRXBg==
X-Received: by 2002:a05:6808:152a:b0:438:247a:7d8f with SMTP id 5614622812f47-438247a8372mr2232071b6e.4.1756954891838;
        Wed, 03 Sep 2025 20:01:31 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-745a09af8efsm406946a34.29.2025.09.03.20.01.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 20:01:30 -0700 (PDT)
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
Subject: [PATCH v3 3/3] irqchip/sg2042-msi: Set irq type according to DT configuration
Date: Thu,  4 Sep 2025 11:01:19 +0800
Message-Id: <b22d2b0a00a96161253435d17b3c66538f3ba1c2.1756953919.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756953919.git.unicorn_wang@outlook.com>
References: <cover.1756953919.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_200132_833563_7865EFAA 
X-CRM114-Status: GOOD (  13.27  )
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

Read the device tree configuration and use it to set the
interrupt type.

Tested-by: Inochi Amaoto <inochiama@gmail.com> # Sophgo SRD3-10
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/irqchip/irq-sg2042-msi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-sg2042-msi.c b/drivers/irqchip/irq-sg2042-msi.c
index 3b13dbbfdb51..f7cf0dc72eab 100644
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
@@ -298,6 +300,7 @@ static int sg2042_msi_probe(struct platform_device *pdev)
 	}
 
 	data->irq_first = (u32)args.args[0];
+	data->irq_type = (unsigned int)args.args[1];
 	data->num_irqs = (u32)args.args[args.nargs - 1];
 
 	mutex_init(&data->msi_map_lock);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
