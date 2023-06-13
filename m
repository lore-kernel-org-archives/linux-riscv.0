Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC04FEB64D0
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 15:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FJwLVzWPxcHiige0QDTP1uxdeLq0LWCalxJ90CwiBFU=; b=4qYflf4r9aDZZH
	slXUlOx/rngarWa+pYWkETAq8EwINUfOHs4Q6Idopap9yIkrPLvpPdj0YngZS7ffhg6SCIflacGsn
	FR2zQjniNtPiVr0zERg19vO0Zdq8gw7smaKtIhB9cCaRsswDNGo6gaVvCglyh3DpAH0IUw/BxUJJD
	fFGS/wTpCptgJ8koh8N61e4yaFEeSB9LdlCLxN+YaWHu8sfOi7mL7fR3NI4BOWpqyRqiVCiFs/Jwk
	lhqP/tdXUsSQfFJvTpJy6sdBKIjtEugFXDhUbCSIKjyhvo8RT6pq8i8/wqYkP1obzSeaP9EM4fs3Y
	BhhEpxJOeVsbpoyz2DVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q963M-008U5a-38;
	Tue, 13 Jun 2023 15:35:28 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q963F-008U2Y-2j
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 15:35:27 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-39cd084ea62so1797944b6e.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jun 2023 08:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1686670520; x=1689262520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kjtt6h/eyDXrsElx877q0CT0QQQHILU6z+NJTWoiedk=;
        b=F0n7O/vVGUEeM/PKWb7Z42XfLu2iO15eOSZ1qtJ/2T8+w6YlgN8iMf0woohYLxd0B4
         hDk/1yEUrPySol/SrvWYjwbhEKkeQPxZgtkHeenQLOW1Ds9gWx9KtJP9xX3g6I7B8CHi
         1HCbG2HBqPmTBqinxu6vHSmwuXvIN+SxjxXtc7bEFDpOw5jcCU79H7yY4E4Xz7QFnoev
         YmIne1HSSiSqw1XfyFU+GSIo+/WDJZ86GjJpPKnUA5UKFau8X0/dlJd4sP+QHGTxazDy
         okLEdA0XyiJRcyVqu9apcw4+1f+x9yL/+yhAftzTIDhEoK9nGMcYro7VdEgZndaDZkOP
         mhXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686670520; x=1689262520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kjtt6h/eyDXrsElx877q0CT0QQQHILU6z+NJTWoiedk=;
        b=OejTcmPIFCDLXB8pWpUqUxiAqrApv/aqqjphtmurWikY18QLmiQqn4+136vpHTqNTv
         uS/7Kwl5g8XT3VopnAwH3WejI4g+mwVNRmLMr6whdGDAP2lMBVA4CwmEaoE7aoZ5B0CG
         j+j37hGkKLM6hwqex309nfKT5Vf1H6k+Ua0xYJS210ME4GESRTGLhLi9xD3XN4BFQSTi
         AA1ds/hj3uuKYyVsIRj4j8//1S4yDydHUZFqsNM8vPHVH4h88R1G44G8Z4OUo6SZ58/m
         w0kXbGxnxyoIA+z2z9RF52b83JuIJBnU+08yJePSmqsEAEyEKXrUJXtSxdpcFb8/hlXE
         wo+Q==
X-Gm-Message-State: AC+VfDzjfSbBarrfc6TwI6vpSkBL4PrMG0DlL9kw3ta3c0ZikZL51Tyn
	k4jPB8aoz/8qEsaMxps+MdH6kQ==
X-Google-Smtp-Source: ACHHUZ5tX/SjcwqcOnkrDPg1GUxe68ARht3DVnlyVF5s2FrIHG804D7O2i5qR7HAEpiuWTv/u0W5PQ==
X-Received: by 2002:a05:6808:208e:b0:39c:464f:a55f with SMTP id s14-20020a056808208e00b0039c464fa55fmr10111693oiw.24.1686670519867;
        Tue, 13 Jun 2023 08:35:19 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id n2-20020acabd02000000b0039ce305ea4fsm1630807oif.14.2023.06.13.08.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jun 2023 08:35:19 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	iommu@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>,
	Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH v4 06/10] irqchip/riscv-imsic: Improve IOMMU DMA support
Date: Tue, 13 Jun 2023 21:04:11 +0530
Message-Id: <20230613153415.350528-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230613153415.350528-1-apatel@ventanamicro.com>
References: <20230613153415.350528-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_083521_904424_968D8108 
X-CRM114-Status: GOOD (  19.25  )
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

We have a separate RISC-V IMSIC MSI address for each CPU so changing
MSI (or IRQ) affinity results in re-programming of MSI address in
the PCIe (or platform) device.

Currently, the iommu_dma_prepare_msi() is called only once at the
time of IRQ allocation so IOMMU DMA domain will only have mapping
for one MSI page. This means iommu_dma_compose_msi_msg() called
by imsic_irq_compose_msi_msg() will always use the same MSI page
irrespective to target CPU MSI address. In other words, changing
MSI (or IRQ) affinity for device using IOMMU DMA domain will not
work.

To address the above issue, we do the following:
1) Map MSI pages for all CPUs in imsic_irq_domain_alloc()
   using iommu_dma_prepare_msi().
2) Extend iommu_dma_compose_msi_msg() to lookup the correct
   msi_page whenever the msi_page stored as iommu cookie
   does not match.

Reported-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/iommu/dma-iommu.c         | 24 +++++++++++++++++++++---
 drivers/irqchip/irq-riscv-imsic.c | 23 +++++++++++------------
 2 files changed, 32 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
index 7a9f0b0bddbd..df96bcccbe28 100644
--- a/drivers/iommu/dma-iommu.c
+++ b/drivers/iommu/dma-iommu.c
@@ -1687,14 +1687,32 @@ void iommu_dma_compose_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
 	struct device *dev = msi_desc_to_dev(desc);
 	const struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
 	const struct iommu_dma_msi_page *msi_page;
+	struct iommu_dma_cookie *cookie;
+	phys_addr_t msi_addr;
 
-	msi_page = msi_desc_get_iommu_cookie(desc);
+	if (!domain || !domain->iova_cookie)
+		return;
 
-	if (!domain || !domain->iova_cookie || WARN_ON(!msi_page))
+	cookie = domain->iova_cookie;
+	msi_page = msi_desc_get_iommu_cookie(desc);
+	if (!msi_page || msi_page->phys != msi_addr) {
+		msi_addr = ((u64)msg->address_hi << 32) | msg->address_lo;
+		msi_addr &= ~(phys_addr_t)(cookie_msi_granule(cookie) - 1);
+
+		msi_desc_set_iommu_cookie(desc, NULL);
+		list_for_each_entry(msi_page, &cookie->msi_page_list, list) {
+			if (msi_page->phys == msi_addr) {
+				msi_desc_set_iommu_cookie(desc, msi_page);
+				break;
+			}
+		}
+		msi_page = msi_desc_get_iommu_cookie(desc);
+	}
+	if (WARN_ON(!msi_page))
 		return;
 
 	msg->address_hi = upper_32_bits(msi_page->iova);
-	msg->address_lo &= cookie_msi_granule(domain->iova_cookie) - 1;
+	msg->address_lo &= cookie_msi_granule(cookie) - 1;
 	msg->address_lo += lower_32_bits(msi_page->iova);
 }
 
diff --git a/drivers/irqchip/irq-riscv-imsic.c b/drivers/irqchip/irq-riscv-imsic.c
index 30247c84a6b0..19dedd036dd4 100644
--- a/drivers/irqchip/irq-riscv-imsic.c
+++ b/drivers/irqchip/irq-riscv-imsic.c
@@ -493,11 +493,18 @@ static int imsic_irq_domain_alloc(struct irq_domain *domain,
 	int i, hwirq, err = 0;
 	unsigned int cpu;
 
-	err = imsic_get_cpu(&imsic->lmask, false, &cpu);
-	if (err)
-		return err;
+	/* Map MSI address of all CPUs */
+	for_each_cpu(cpu, &imsic->lmask) {
+		err = imsic_cpu_page_phys(cpu, 0, &msi_addr);
+		if (err)
+			return err;
+
+		err = iommu_dma_prepare_msi(info->desc, msi_addr);
+		if (err)
+			return err;
+	}
 
-	err = imsic_cpu_page_phys(cpu, 0, &msi_addr);
+	err = imsic_get_cpu(&imsic->lmask, false, &cpu);
 	if (err)
 		return err;
 
@@ -505,10 +512,6 @@ static int imsic_irq_domain_alloc(struct irq_domain *domain,
 	if (hwirq < 0)
 		return hwirq;
 
-	err = iommu_dma_prepare_msi(info->desc, msi_addr);
-	if (err)
-		goto fail;
-
 	for (i = 0; i < nr_irqs; i++) {
 		imsic_id_set_target(hwirq + i, cpu);
 		irq_domain_set_info(domain, virq + i, hwirq + i,
@@ -528,10 +531,6 @@ static int imsic_irq_domain_alloc(struct irq_domain *domain,
 	}
 
 	return 0;
-
-fail:
-	imsic_ids_free(hwirq, get_count_order(nr_irqs));
-	return err;
 }
 
 static void imsic_irq_domain_free(struct irq_domain *domain,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
