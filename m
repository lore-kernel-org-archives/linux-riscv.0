Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE2CC61DB2
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 10:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p2aYLHiwcS4l/zUy5DxBowSA0bjmKPxVn/GF9ypIU5s=; b=UAarhoGaCMd/3j
	VuPHfcU0nVoxCLZBi/EgCO9LyTb1BZU+2/x9d2QIqtoLsi5BrzLlwXTRgm9rXDDKQ5lKIoRIL29DG
	TpQuG7/3WBFgPDEO2PXtj/Eq31pts3lvoVYjL/8XWlWYylNYptqKdJAFgxZLOcr9yBtyqc9ve9cin
	hGKYJx2HLunAa37It2yAtg253+PpSFXZHuwvmSo/bmT8KOh7cOZTSjWdcVqKb9Ws+FOZwI1plgsQn
	Qy655TE0584tpvuP3vHO7NxgPAJeT5jp0zPxFlgywoshV6tb2sbPEHtTP8WIGy9669/XZaXMPgfVb
	2fmIcobwB/tGluYjXbkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwfX-00000006Yym-2z17;
	Tue, 10 Jun 2025 10:57:27 +0000
Received: from esa3.hc555-34.eu.iphmx.com ([207.54.77.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvsQ-00000006S4u-1cPg
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 10:06:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749550002; x=1781086002;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=S4SlciKZEDkvxxA53sOZjgI7BGGyzxMFgS4kqW029qc=;
  b=uO7XqBz5aFsXGVgwdQoNtuDBsp74DYWvUI8Onjo1DC/4hqVVcPdfZe9B
   yFCVBz/dPL1x4/NqE+018kpNgzi64jVu8QrS+6VYIWqPAeGIM8YHjyrw5
   +ee7AZ1DDrhOYMsOp7VYMmmrOU35uk3uPZv4ynOwC9QPmE1zqETnnRPvY
   ELI7CGj016g7+u55zkT62y9xjZbQmyKHZWPGiQ1zg0BJJsftuATEJy79+
   slGFulcNSGHOkmwHkQkZ6vV0McviokvzwSw4/p6+zMz1ESrd1EOL7OL2I
   IzKdTlymoXZz1mF22cZEy7H9AWRWkS+Nz9NaZW+5bei98uwF7TP8FRHJ5
   Q==;
X-CSE-ConnectionGUID: mPwJsLpQRYyHgteN02L5cQ==
X-CSE-MsgGUID: obU5FMe9SLCp3ycvlRlwLQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa3.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 13:06:37 +0300
X-CSE-ConnectionGUID: L/mYHuCUT9qp4TiIzR8Dlw==
X-CSE-MsgGUID: hvG3VRHtSp+PyC8qsVTeAA==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.1])
  by ces01_data.me-corp.lan with SMTP; 10 Jun 2025 13:06:35 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Tue, 10 Jun 2025 13:06:36 +0300
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Ryo Takakura <takakura@valinux.co.jp>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v2 2/7] irqchip: riscv aplic: use riscv_get_hart_index()
Date: Tue, 10 Jun 2025 13:05:35 +0300
Message-ID: <20250610100540.2834044-3-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
References: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
 <20250610100540.2834044-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_030642_684367_D9F0611F 
X-CRM114-Status: GOOD (  11.85  )
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

Use global helper function instead of the local
implementation

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 drivers/irqchip/irq-riscv-aplic-direct.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-direct.c b/drivers/irqchip/irq-riscv-aplic-direct.c
index 205ad61d15e4..c2a75bf3d20c 100644
--- a/drivers/irqchip/irq-riscv-aplic-direct.c
+++ b/drivers/irqchip/irq-riscv-aplic-direct.c
@@ -219,20 +219,6 @@ static int aplic_direct_parse_parent_hwirq(struct device *dev, u32 index,
 	return 0;
 }
 
-static int aplic_direct_get_hart_index(struct device *dev, u32 logical_index,
-				       u32 *hart_index)
-{
-	const char *prop_hart_index = "riscv,hart-indexes";
-	struct device_node *np = to_of_node(dev->fwnode);
-
-	if (!np || !of_property_present(np, prop_hart_index)) {
-		*hart_index = logical_index;
-		return 0;
-	}
-
-	return of_property_read_u32_index(np, prop_hart_index, logical_index, hart_index);
-}
-
 int aplic_direct_setup(struct device *dev, void __iomem *regs)
 {
 	int i, j, rc, cpu, current_cpu, setup_count = 0;
@@ -279,7 +265,7 @@ int aplic_direct_setup(struct device *dev, void __iomem *regs)
 		cpumask_set_cpu(cpu, &direct->lmask);
 
 		idc = per_cpu_ptr(&aplic_idcs, cpu);
-		rc = aplic_direct_get_hart_index(dev, i, &idc->hart_index);
+		rc = riscv_get_hart_index(dev->fwnode, i, &idc->hart_index);
 		if (rc) {
 			dev_warn(dev, "hart index not found for IDC%d\n", i);
 			continue;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
