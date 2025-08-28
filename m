Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1633CCA0EED
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 02:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w1Dc0v95Nj+QEuhCHqZYviMc1FwmChwE5pHMRs7carQ=; b=G/uCJ88iQXcp4J
	2pUeK3Z6jFkpiGTyhyx8Irm+QvLH3aPatzUhwtgGOAADsi9zrYluJD4RVq/NPbFNUNpQVLrs3qGEg
	ZlGPxnwGTwldT2GXaxcP1izMvDPQC0nyAq1YUXXzO9gWJY1aUfLPBBlhotGX7x7PIchm8oq7ofYpt
	BW8FWE9UaKrUcfQV42ShGLvcdNE1+fsuA33jRvsUrOUd+RHxu5DDStDwYLSusi1KclNf3jJ/vxEQb
	g9/2rLXkPKty/2GHzRB8cmVlQnYiATivoG1wPXZ0vcot9iMxzFllNRjkeGbEReNTvdV+J7RkURfeD
	/XunZyaerthfpWO7R86Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urSCe-0000000HaZO-37Vd;
	Thu, 28 Aug 2025 02:17:28 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urSCc-0000000HaYc-08k3
	for linux-riscv@lists.infradead.org;
	Thu, 28 Aug 2025 02:17:27 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7452b1964f3so365822a34.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Aug 2025 19:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756347445; x=1756952245; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4cMD9oVw7wzB9jTZgK3seO4aPiDIfpeTKPhUfVzD+DA=;
        b=VnrGoLSfCFLqj20P77TJp453u0bfstfSBeN61IdCGIjq7lB8vRNt6m6N3BCjMQJpP1
         pOVQz99q93GvteWKGmY8EWypEOQ0Fob8LELgYRbc+shvviGAVWQ60FWsWjnuusMOzstp
         lrmBHUV5UpjjiutwNkbZpW33lVY89iUIDY5lhBRWoZfmhQf5PBqTo4gxPW1JbxJbgMAk
         pwpmSMZhHoD1EwHCbma5GlOO6V66LUQEU7fY1enyI5zHbuF+vh6RZdh0n+5PFKtTxiqr
         dZf/Y955AiuywtzSsxSRD3RqxbjnvtLfp/DtKplHDbxMmDXzmPeCdMQgNNdtlZR3AVdB
         OVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756347445; x=1756952245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4cMD9oVw7wzB9jTZgK3seO4aPiDIfpeTKPhUfVzD+DA=;
        b=lYJzGkr3tBQXlXUGYZ5X40KjvGw+W0WzwDXUZ3vlmp7v3mHpV5RUHOizqQVAFkpdp4
         s9Zg+dZAAH5SS1nf4tKKoLCUObr0vvnM/SZj0v7ABsilSuGYaaU8a66pJ9S+PyGmjCr0
         krKGxSkRwnlGJUalTyvXVEDT6N+25idBesPFHHzsY9Yg0cmQQm+vg9nJWwqDkhW7EI8P
         IJCCYX6rWOUhcCekrba43lMJqah48BOvopci2aOG07aEcxfkq1b5wIb4TH5LSiITf1gj
         YvD5kX0yF/dlclmlDn2FV2phXfIfEwKLLiWYqeFgp59dyjznFsXBAfUOfKvYdwP1j7j6
         re7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUW2jCrytjlD7BB8kjmzJSyrld2xrc6QIXXL2Fg/TyLZM6qIyWYL55ko4eQfNFKxih80oIF7QEqf4cA+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpwBHo3p1tIrfn+XsoYY6eLqpO/yaZU1l7ppqasftGtf9fzLvL
	0uDyrdQbsjDFL34VRgnnsij5HwsO6PVOMqiMVu/+CExJF06CeVTHVTxL
X-Gm-Gg: ASbGncthD2r0Hvcsey6MzcR9wlWFjToG0Vu7Y5/JQfGAoDtvhPk4qNZiPNNrtAASux/
	DesKdPLSY0y/S9rxELjLVlF4sgMdrQnJEsJUQ34r52ZdFNQvdQ8Cg3PzHXVsYyU7yprbLb9o28h
	TvYul3TjGc/kyrMK4M84fltPt84xGvLECXq59EzMtNtRoiS1/2GQe07sto/5eyiFg0S6ezHWO8q
	lBi6kWq0pJT56D1a94/+Vw9Fn9ikfYtxEgLm2GA0kZj3U6Lffhi9Bak7iEgqVRLuPBgAh4rQ9n1
	srAw+LI4cV8ItIpoEwFeTWIci0l61CC1P4Go/N/BqmuCVlZ4vPOduZIIPEVf2n6CycrLx5sj7Jc
	NGPx5FQBjSuTiLUy1a7lillCp1pnCaKOXO+CGnIDhG5I=
X-Google-Smtp-Source: AGHT+IFUMTBN0ewK0J12WWwmbqPZ20vlkC0r+3NLs/KDPeS4FrNivKz6PhTVcy1KC85aKvA34B7Fow==
X-Received: by 2002:a05:6830:6b06:b0:73e:9857:9839 with SMTP id 46e09a7af769-7450048644amr11399123a34.0.1756347445072;
        Wed, 27 Aug 2025 19:17:25 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7454eb2816csm63490a34.26.2025.08.27.19.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 19:17:24 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: kwilczynski@kernel.org,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	arnd@arndb.de,
	bwawrzyn@cisco.com,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	18255117159@163.com,
	inochiama@gmail.com,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	s-vadapalli@ti.com,
	tglx@linutronix.de,
	thomas.richard@bootlin.com,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	rabenda.cn@gmail.com,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH 2/5] PCI: cadence: Fix NULL pointer error for ops
Date: Thu, 28 Aug 2025 10:17:17 +0800
Message-Id: <fca633eb6d667a90f875cdf1263fcea2bcc2c969.1756344464.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756344464.git.unicorn_wang@outlook.com>
References: <cover.1756344464.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_191726_075139_A1AACA85 
X-CRM114-Status: GOOD (  12.43  )
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

ops of struct cdns_pcie may be NULL, direct use
will result in a null pointer error.

Add checking of pcie->ops before using it.

Fixes: 40d957e6f9eb ("PCI: cadence: Add support to start link and verify link status")
Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 drivers/pci/controller/cadence/pcie-cadence-host.c | 2 +-
 drivers/pci/controller/cadence/pcie-cadence.c      | 4 ++--
 drivers/pci/controller/cadence/pcie-cadence.h      | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/cadence/pcie-cadence-host.c b/drivers/pci/controller/cadence/pcie-cadence-host.c
index 59a4631de79f..fffd63d6665e 100644
--- a/drivers/pci/controller/cadence/pcie-cadence-host.c
+++ b/drivers/pci/controller/cadence/pcie-cadence-host.c
@@ -531,7 +531,7 @@ static int cdns_pcie_host_init_address_translation(struct cdns_pcie_rc *rc)
 	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_PCI_ADDR1(0), addr1);
 	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_DESC1(0), desc1);
 
-	if (pcie->ops->cpu_addr_fixup)
+	if (pcie->ops && pcie->ops->cpu_addr_fixup)
 		cpu_addr = pcie->ops->cpu_addr_fixup(pcie, cpu_addr);
 
 	addr0 = CDNS_PCIE_AT_OB_REGION_CPU_ADDR0_NBITS(12) |
diff --git a/drivers/pci/controller/cadence/pcie-cadence.c b/drivers/pci/controller/cadence/pcie-cadence.c
index 70a19573440e..61806bbd8aa3 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.c
+++ b/drivers/pci/controller/cadence/pcie-cadence.c
@@ -92,7 +92,7 @@ void cdns_pcie_set_outbound_region(struct cdns_pcie *pcie, u8 busnr, u8 fn,
 	cdns_pcie_writel(pcie, CDNS_PCIE_AT_OB_REGION_DESC1(r), desc1);
 
 	/* Set the CPU address */
-	if (pcie->ops->cpu_addr_fixup)
+	if (pcie->ops && pcie->ops->cpu_addr_fixup)
 		cpu_addr = pcie->ops->cpu_addr_fixup(pcie, cpu_addr);
 
 	addr0 = CDNS_PCIE_AT_OB_REGION_CPU_ADDR0_NBITS(nbits) |
@@ -123,7 +123,7 @@ void cdns_pcie_set_outbound_region_for_normal_msg(struct cdns_pcie *pcie,
 	}
 
 	/* Set the CPU address */
-	if (pcie->ops->cpu_addr_fixup)
+	if (pcie->ops && pcie->ops->cpu_addr_fixup)
 		cpu_addr = pcie->ops->cpu_addr_fixup(pcie, cpu_addr);
 
 	addr0 = CDNS_PCIE_AT_OB_REGION_CPU_ADDR0_NBITS(17) |
diff --git a/drivers/pci/controller/cadence/pcie-cadence.h b/drivers/pci/controller/cadence/pcie-cadence.h
index 1d81c4bf6c6d..2f07ba661bda 100644
--- a/drivers/pci/controller/cadence/pcie-cadence.h
+++ b/drivers/pci/controller/cadence/pcie-cadence.h
@@ -468,7 +468,7 @@ static inline u32 cdns_pcie_ep_fn_readl(struct cdns_pcie *pcie, u8 fn, u32 reg)
 
 static inline int cdns_pcie_start_link(struct cdns_pcie *pcie)
 {
-	if (pcie->ops->start_link)
+	if (pcie->ops && pcie->ops->start_link)
 		return pcie->ops->start_link(pcie);
 
 	return 0;
@@ -476,13 +476,13 @@ static inline int cdns_pcie_start_link(struct cdns_pcie *pcie)
 
 static inline void cdns_pcie_stop_link(struct cdns_pcie *pcie)
 {
-	if (pcie->ops->stop_link)
+	if (pcie->ops && pcie->ops->stop_link)
 		pcie->ops->stop_link(pcie);
 }
 
 static inline bool cdns_pcie_link_up(struct cdns_pcie *pcie)
 {
-	if (pcie->ops->link_up)
+	if (pcie->ops && pcie->ops->link_up)
 		return pcie->ops->link_up(pcie);
 
 	return true;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
