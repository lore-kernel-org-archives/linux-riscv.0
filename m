Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79CACA0FED
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 02:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YodvcwUp8OjhGGecQ19966Vin1lYrEOUhbO70/rZoZw=; b=K+m8ulectm3TMY
	3X+je8TqUcrz8aSEdq7NmqW/hJVkU3GPRh1nnbzVO7JBMidfhGBgRZHFBIUpgJ3NMPF2zOpfVsBce
	PCZuzOo/7k15BIUZKnQQY/o9Z6IsBn5uoG8tL3bhoy7jZ8a5PYNlB/eACOeFSeNC2I62YGX0e5YFC
	Ywq9KrugtIFFMZ56jjKacq9GtpPwidQQqYQy+oQRmEg33tG4BCjVjsmPgd7hdvZsuKkYCuFGTQCX7
	toJdIGUQ3RVduDDzBi9vSvuGIXjxVQxTuQmi2GjZQB0QViMNSpey88uWcBHocZgWy8GIBcr4kOdX9
	VAbSlRfw13+zC0MCOTzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAG6-0000000BbHD-3TNh;
	Wed, 10 Sep 2025 02:08:30 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAG4-0000000BbGE-1zgd
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 02:08:29 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4b5e88d9994so43646971cf.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Sep 2025 19:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757470107; x=1758074907; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufI02VTMyX7sTfBD7Jn/jEH2YUmO7DVAO0QyMj+WG88=;
        b=HdCf75+BMQjLd/yTqca9WuXCZECAW4wdktabvA6f4hgUNOBdGa+amd4lEpZZuqY6DK
         wKA/M3KBkjREV4ZA2lYdQ81rmh+G5yNi/8wT2HmO/PlOklPba8fkz1nVG9cIjmGati7x
         44MVSBB6gyd0YdibuPF0GLEB2S9kqapFEXMQ5YeYqmqdkWYJBUffmqbSBr/SMmF/K/+i
         1CADvx8YElTW9XUMnj/Vm+R5CY/6JdtF+H34MkyRterZCILAkDzJI5XBkLnZXMb6a6sB
         aKmfkGQEWw/zoD2t9ySTC5vdwPNeuRtvCN2hosGuJXGmLb5+3TB5LvK3VxYMvF8VIj5P
         Hfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757470107; x=1758074907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ufI02VTMyX7sTfBD7Jn/jEH2YUmO7DVAO0QyMj+WG88=;
        b=vZ9e6R/LxE209/VsIFo8Ai0d2NH8H0dEjElWqI3QIbTiYOVdk8lL8+ikykDiJ8MiPk
         Lh6Ku2GT7BT/mV9Unr9rsqBSNY0lNYYmxUrbS8eVEI7XViDGpESh+XSSYs3HpV/cndyD
         1t9LwxQbqskLNGbTQ5A1Cpsamp5qADlBarqMMs2NYecYCyfpbQ9wHd3+0bu+hvZFuiHD
         bm1QGEPIX1vxRIAg4c5z4MgSVrvIcdXeey5kDzdmIXoaJMiXNBTGz6qCEuGwjsFrU7ve
         S/vJrdH/drQafT7QOLM2GRSPF4ULOT7hdJs7L96vlwMfVvBUprYODoUiGJ65SYzJfOn0
         5Oew==
X-Forwarded-Encrypted: i=1; AJvYcCVu20Riloy4R47J3u5rHYRkAf2ZqBII1cm0msXy3InTduNQ9SyBmQj/D5ZcrlVV3Us3VTUgLfcRBrusmA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwP6iIgrH9GFSAAkinH7wkjit2P+G9NjaE5lXtSCyAza+QofrDt
	vbECt4onVuMhWHjyX8J8gZG+Zaw7ezy2MgWxWlVox+IiLl2hnm0Bn+Dc
X-Gm-Gg: ASbGncvYV8rJCYwdQYwZRRvgdxjUuLR2Q6KOIIM212u708BEpk41xgec8lU+ujVPtGE
	/Rspz6ypGvwMjA2kNgLenYzvh9gzxGcLn0E6c77bYK1O0uj2tLDjDtgnf6fBOtefWo3Rh7R5LEo
	4X7CtNHO+hHq2HPQ4Z0oz4iGxqK5y+qpEQiBD8b+C/tymYouBCnd2U6UK6Zlupuefi3qnVKoDGH
	HlwCSmmhWLoT6AgwbsE3lPY3IWQgiFFi7w4B5nUdNcSfty3oTtEbZFoKKy/WeeynS/wTTrE4nKl
	PlCkw93LSKadnFVqSPNJnthXihs6ufRsy1Jd3FiZIowXzssFrQr0d66/9X0527W4xRlnHBpeMZH
	HwdkVMVItnpu8aKXqy6O8KGd4979gfyQlJ/u752cVEec=
X-Google-Smtp-Source: AGHT+IF9QL0BSm2MkcIQqxgCM1KsqBHMb+NHGINqAC5fWDSx6gqC8dNQv1p+5MAyDgt2C/yVUIW7Kw==
X-Received: by 2002:a05:622a:40cf:b0:4b3:709d:1f1f with SMTP id d75a77b69052e-4b5f8490899mr154710911cf.75.1757470106975;
        Tue, 09 Sep 2025 19:08:26 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b61ba871e4sm17265451cf.14.2025.09.09.19.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:08:26 -0700 (PDT)
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
Subject: [PATCH v2 2/7] PCI: cadence: Check pcie-ops before using it.
Date: Wed, 10 Sep 2025 10:08:16 +0800
Message-Id: <18aba25b853d00caf10cc784093c0b91fdc1747d.1757467895.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1757467895.git.unicorn_wang@outlook.com>
References: <cover.1757467895.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_190828_524364_1DB404CE 
X-CRM114-Status: GOOD (  13.28  )
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

Add checking of pcie->ops before using it for new
driver that may not supply pcie->ops.

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
