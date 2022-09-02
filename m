Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA03ECAAD5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 14:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XP63qgElCMKdGMxwHbyiiHHU/JsMxQXQ0Hpos1hAUrE=; b=RVi1fMkDeKKUo7
	rtwLiP/NoJl6KHn4vgUBZDsJ4auNJEA1AxizckSCmqxq2p1LEZSi8pN+oG8TfaqnYi6YWprVUSQPK
	+7TzqLCfAxYdU4WdP4WedJKaIIW6zQPRJl4C58lh0qETIY0kN9SjE18yaz43U7CS9wWq67Uj50ckw
	O3sqM9AB00djHkj6tuvJ3bECues7ju90g59g1gehcavN/LjC+V3lISs1zNsTBl/aN0o3f68o/Os/4
	1aCaNX6FKJn6U7ir/vFnjnuMUvs6CkuUv3c7zuFA6NTc3y0N9fNBYUOLZLplRar7b6IdMbSqyQ2/b
	18xrzEe+e8JzAAqQxPaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU7ZH-005Vw7-Ks; Fri, 02 Sep 2022 14:22:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU7ZF-005Vr3-1Y
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 14:22:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662128565; x=1693664565;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R3HtVnqEsyT5IIIglu00zj/GyzVDepT1pc5XEOwby8Y=;
  b=o07NoKWN2AlBJbBISl+HniGD/Uumaf/aJn0/yXj+fpAS8dZIBN+FQpDU
   fK7c62sqXgTD2wCm/ipfbNKj3YjGeFBOSA3CyvtMeaZB019KWQTL+1DaA
   dkEoVF/734dtBo8uj8/5o0wa5dwgQ0j6uo5GSXdVuToMMAEF1LEAMpIx4
   32J1hGjnclqoGvtEa3wCTW8siZn7tFfxcGwMn1L6Ak8RRdWNvUhA7aW9q
   b/7ieoOoMOfVzWo//AY2tVqbSav+QCtfB3Mn+Mbu2rQkB5nFveL0eBvBX
   J19ANzihAeGU2piksrBR6Xe8Kg3cbnaj+aR1Ns05BGZBS8PyeQM59ogq6
   g==;
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="175388545"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2022 07:22:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 2 Sep 2022 07:22:43 -0700
Received: from daire-X570.emdalo.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Fri, 2 Sep 2022 07:22:39 -0700
From: <daire.mcnamara@microchip.com>
To: <aou@eecs.berkeley.edu>, <bhelgaas@google.com>,
	<conor.dooley@microchip.com>, <devicetree@vger.kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <kw@linux.com>,
	<linux-pci@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<lpieralisi@kernel.org>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<robh+dt@kernel.org>, <robh@kernel.org>
CC: <cyril.jean@microchip.com>, <padmarao.begari@microchip.com>,
	<heinrich.schuchardt@canonical.com>, <david.abdurachmanov@gmail.com>, "Daire
 McNamara" <daire.mcnamara@microchip.com>
Subject: [PATCH v1 4/4] of: PCI: tidy up logging of ranges containing configuration space type
Date: Fri, 2 Sep 2022 15:22:02 +0100
Message-ID: <20220902142202.2437658-5-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220902142202.2437658-1-daire.mcnamara@microchip.com>
References: <20220902142202.2437658-1-daire.mcnamara@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_072245_177316_081D678B 
X-CRM114-Status: UNSURE (   7.80  )
X-CRM114-Notice: Please train this message.
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

From: Daire McNamara <daire.mcnamara@microchip.com>

PCI ranges can contain addresses where phys.high part can have a type
of 0, signifying 'configuration space'.  Change
devm_of_pci_get_host_bridge_resources() to print 'CFG' instead of 'err'
for a PCI range containing such a 'configuration space' type.

Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
---
 drivers/pci/of.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 196834ed44fe..d782ad8c7dce 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -319,6 +319,8 @@ static int devm_of_pci_get_host_bridge_resources(struct device *dev,
 			range_type = "IO";
 		else if ((range.flags & IORESOURCE_TYPE_BITS) == IORESOURCE_MEM)
 			range_type = "MEM";
+		else if ((range.flags & IORESOURCE_TYPE_BITS) == 0)
+			range_type = "CFG";
 		else
 			range_type = "err";
 		dev_info(dev, "  %6s %#012llx..%#012llx -> %#012llx\n",
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
