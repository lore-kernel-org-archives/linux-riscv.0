Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527AAC3DA4A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 14:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=avy9Hh93s9+X/6NFSJQk4UeWOKDrhDvS+ECbY9UZat4=; b=k3uxzThM5jWYj7
	43wXHG3xtF5EGSDK1NrPbxVLmBCI7RXkEJpsq7Gtp4U4yQZU623aoPJCTaLuFjNLnNMrgYvydeVJx
	AAEYd1mIdC6ZbdSetzEQKFZAWu0jLmV0J6uCDNqXt7ZLb6karW5jjGgBXr0kEbUuFSNoAPBo7NmBw
	qO0wRc0WExGGNDj90aWchUF5iGkEwEFD/TDXjqk+rtqRuo02SZCg600oJudYibRH8l0/Gg7SZgmYn
	dEdDoZkzcYbm/I1cj4IIQB1VvgOIRgZMRDDVFkTN38e35j0PzxEIDu6ZXnVaSIGbNdbb9DpLdy8Bh
	FhTLjuPgzPzuA+a0G0jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFRn-00000007OMy-48Ar;
	Wed, 14 Aug 2024 14:57:59 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFQm-00000007O3m-0XF8
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 14:56:57 +0000
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A4A5C411F4
	for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 14:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1723647412;
	bh=CX0Ehp5ml6WOE9Qikg2fnkaf9KKI21cRzGrnDKkzd2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=gptT81efN3a8Y4n4joTH0sLMg9aSg/6oZATN3zbB/ryO0KbaFN0Dy2/i70Nzmhn90
	 bRysP83XSZQoTy2kJSFtJfz4iMe4cjyu01GdTj6JA/96ldGYDgrtfUodIl+hHM0iEV
	 SgUrzRTaMVig2B9RKFlO/HNVhpb+jjRnpv7mhGsg0XqzbtgH5RN0vdH5UOxL97r7S5
	 ld5RwSdTm62lqf2TZT0bpfk9DjupXSQkHwIowp1YY0bFV1wXgT1jlxd5nGVWDMx1K1
	 AbOLSkOuJymkhFXjt2PPY26k17U297nqXC0kYy9gWx4rMZDtQEHbjSzhTj4DKw10Xv
	 js1JmzF/zGD4w==
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a7aa7e86b5eso548628666b.2
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 07:56:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723647410; x=1724252210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CX0Ehp5ml6WOE9Qikg2fnkaf9KKI21cRzGrnDKkzd2k=;
        b=Har5Ude4WnH9WppHYOOSAM67aHJ12eyk+NxUMiqaygwiNnwyYmyDxTYokZhsBG4fdA
         kI2Udb5XRsoE9wnYiZr5eIE/j6CvPoe4O+EP4OUt+tacXv5ad47Wpxz6A5e+N92ce3JU
         WOXQ3AU23xcPRkRbteavEo9Vd6E1NW7R6vmobDhbm0HjS2J4attR3cuYpki4Vf1jAPAf
         EDDK6tzOf2Uw88e6Da1+mwjbw4SOKN+5v3SyCVWjW/4WQ3ft0fD5bjrW6G+GQNJ3kW2A
         CgMR+tFob7xdvA/3HB/TVMPeqTuP8k/hN4IqqYkr1oyJINjtgQTGP5WYMOsd9PX90QQS
         f2EQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAVASk37JH2cObQj7P7bxN+Ezdd1HNwrdZA32E8zsMBGi/6GtQ3iIjGiCj+d9TfodBWEKbGHQmbNdwojUnEnt2FzRNh0CZvAw4zouN5qOk
X-Gm-Message-State: AOJu0YwYhSWoByCv7eM2eNOCwMFTPRilwDEh0OvEv5iRMvD9QPLoPzKc
	mSMy59JIyomcM+JfOyxN2jkICE/1hiSdLe6adMaz5+ioD7pBFT1uNFck55En8OXpRODNiYuBu6G
	aURxAja4prclLAcmYvbQaDHPU/fVJyNgVgCk+o+RceEN6Wmm4JnV5ayyCoK5g98jttHStMdcOwc
	y17ogttbQPFuffpA==
X-Received: by 2002:a17:906:7952:b0:a7a:ab1a:2d64 with SMTP id a640c23a62f3a-a8367110460mr191610966b.58.1723647410130;
        Wed, 14 Aug 2024 07:56:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8EoPiheZDl/XaOz+iEJprer/FvXWlwGIqv0DClmcSJg+8eKp8MwPZxtItNQsSjm8fghSEGg==
X-Received: by 2002:a17:906:7952:b0:a7a:ab1a:2d64 with SMTP id a640c23a62f3a-a8367110460mr191607966b.58.1723647409411;
        Wed, 14 Aug 2024 07:56:49 -0700 (PDT)
Received: from stitch.. ([2a01:4262:1ab:c:bbf4:eba3:898f:7501])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f411bdcbsm182316866b.105.2024.08.14.07.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 07:56:48 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v1 6/9] Revert "irqchip/sifive-plic: Use riscv_get_intc_hwnode() to get parent fwnode"
Date: Wed, 14 Aug 2024 16:56:38 +0200
Message-ID: <20240814145642.344485-7-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
References: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_075656_323367_1E1C02EB 
X-CRM114-Status: GOOD (  13.22  )
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

This reverts commit 6c725f33d67b53f2d302c2c4509deae953fc6ade.

This is a prerequisite to reverting the patch converting the PLIC into a
platform driver. Unfortunately this breaks booting the Allwinner D1 SoC.

Fixes: 8ec99b033147 ("irqchip/sifive-plic: Convert PLIC driver into a platform driver")
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 drivers/irqchip/irq-sifive-plic.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 85e94b8f4c06..7dbc662a229c 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -429,7 +429,6 @@ static int plic_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	unsigned long plic_quirks = 0;
 	struct plic_handler *handler;
-	struct irq_domain *domain;
 	struct plic_priv *priv;
 	bool cpuhp_setup;
 	unsigned int cpu;
@@ -509,11 +508,11 @@ static int plic_probe(struct platform_device *pdev)
 		}
 
 		/* Find parent domain and register chained handler */
-		domain = irq_find_matching_fwnode(riscv_get_intc_hwnode(), DOMAIN_BUS_ANY);
-		if (!plic_parent_irq && domain) {
-			plic_parent_irq = irq_create_mapping(domain, RV_IRQ_EXT);
+		if (!plic_parent_irq && irq_find_host(parent.np)) {
+			plic_parent_irq = irq_of_parse_and_map(to_of_node(dev->fwnode), i);
 			if (plic_parent_irq)
-				irq_set_chained_handler(plic_parent_irq, plic_handle_irq);
+				irq_set_chained_handler(plic_parent_irq,
+							plic_handle_irq);
 		}
 
 		/*
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
