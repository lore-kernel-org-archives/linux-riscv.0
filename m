Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54770ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 12:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H1JJbW9aJ+lIFTcnCNIsoR3HnKxtqAMHWHPPk8DKy20=; b=sWU7UGtEhsEPRq
	NXZKOvLjeLc0n23k2d9PYdphbfmmUkCA/tzWN39kXrES4AoE+oQ4KV6xsHRnZcJKaxrtetoejldgK
	+b/+mx+wjQQIm8FYbfOBAC97TvDUpE3bxe8cFYypI8w+KANyvS61/27bOpLxN8FGmYoTmLK/kSs9z
	TRdF1YdN/fSbPb8M6wEWhPTORlyW4d1JfAg50eAVLQq03ouj+rhuRDGIYU3V4Lu/nsxi7DJ2kUyig
	tcoW2NNvDFoJx2iAryB6bkAfTNWlzw0Xx0YKK14aEeUbedT2N1L5GiNEv1iKOFDXZq0WPpWNCBqM8
	WRbNJ3d9PeYBsq1cki/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVXV7-00DEGH-T5; Tue, 06 Sep 2022 12:16:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVXV0-00DE8a-Pu
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 12:16:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662466574; x=1694002574;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DaiUSVC6Vw2OGQ1nqKygaDnHULlbwE0S21QZSGoOUac=;
  b=n0G52wtq+gj4yYOfqHdNJRiAbr4iQCEJz1ZmvycrTDBsPCcsj5qq1YYd
   BOR5yPd9JW70MGFIcrWp0ubCF+zjEt8EciqorHUwvB/bgYekDilUgP4fU
   v/Cnkr4MV8gx8HRk04/pP7AFRaJBq+bk1V5q4nbBNV1HSZArr9gfbbuaq
   vlKhhtKVPHBpjsecHWaWPMS2UBVHjASmBJZyzBloMXEYlrCjMDph5Aojl
   jKl89jye3PoZRS2OK5Joft22wwoS5ICjfMhMcR4+A2F5Pgo5GzhrcYl3T
   QBbuOvF0YQuoeMEAD2OeLayl786iLPIFrhITeOR/nDFwhBgNx7Mf2850G
   g==;
X-IronPort-AV: E=Sophos;i="5.93,294,1654585200"; 
   d="scan'208";a="179327800"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 06 Sep 2022 05:16:08 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 6 Sep 2022 05:16:05 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 6 Sep 2022 05:16:03 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, "Daire
 McNamara" <daire.mcnamara@microchip.com>
CC: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 1/3] dt-bindings: vendor-prefixes: Add entry for Aldec
Date: Tue, 6 Sep 2022 13:15:24 +0100
Message-ID: <20220906121525.3212705-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220906121525.3212705-1-conor.dooley@microchip.com>
References: <20220906121525.3212705-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_051614_913565_4C0590BB 
X-CRM114-Status: UNSURE (   7.14  )
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

Per their website:
Aldec, Inc. is an industry-leading Electronic Design Automation (EDA)
company delivering innovative design creation, simulation and
verification solutions to assist in the development of complex FPGA,
ASIC, SoC and embedded system designs.

Link: https://www.aldec.com/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 2f0151e9f6be..922be64799a2 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -69,6 +69,8 @@ patternProperties:
     description: Annapurna Labs
   "^alcatel,.*":
     description: Alcatel
+  "^aldec,.*":
+    description: Aldec, Inc.
   "^allegro,.*":
     description: Allegro DVT
   "^allo,.*":
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
