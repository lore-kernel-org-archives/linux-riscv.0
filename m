Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2B7C5479D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 12:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7V5D/LWhnIqFu09jMT9cGUKlokH99Hjz3JF9MwGfUeY=; b=mIUbu7Gxm06zYu
	9csdDQiNszA4sSP0tMX6ZA9pSBd9xbbJV8LQX5McOg8e7uUvjxrbIUf12SCXC66OeO7qputKU/fYC
	oucPj5pgbvPsTKBFJOO3v7tAkSb3P1RZM9LbBJSy5UZC0fOP212HQVpXM+m6/55dBZidQ9yG1W/vS
	9IWe9YHgtn930KnlFgviT9QtLhye61bal3/cmX97c4xZRvrtP9RqPFM1aAeXOrSzWiGJkNHMOFwQT
	iZBjEI5XM998CJcWY8TZhjO0R7ylfsKWSwR+YGWLmXDhag1VKyPcaPwz1anA0MWpNtqpqAUk6qOUE
	x+9pz4XNUv9EZE3kAiWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFaR3-00BKFm-JE; Wed, 11 Jan 2023 12:42:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFaQx-00BKA8-Sp
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 12:42:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1673440943; x=1704976943;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vw0K0hVerqbC3ncuayOcM+LIeJ26Au0AerfJxM97xDo=;
  b=ByRZ0UgSWYcLe9+7dK6J1o0Sjawo/sdM5/BXQJYSwRBeHi5QHiWS+kMy
   nCAtJJwB6JRM+cbDprELZLvyNqj48321Amlcjb2P7vZ9w70ptJwaE8O7D
   OWqlfvATbtFgL8Juy4NUwgNGXdKOSS++sNEI/3YuiB+KVVuTYLkUFtC/2
   ICZeax+tsYfPPEsnhFShyGux4x2hEH8bfiMob+KFQuxnNEhEseyItcb7u
   QGE9aLdcAV6GFQIXSPwPObGQd6E8Ci+T8LwP+TmqeR7gKGF5hDeFRDLmO
   XUoq5BSzQJBywHBbCVwuDt+9/QGmXhxtKaGTm9OcTwiKnmDCXkywrG2zb
   A==;
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; 
   d="scan'208";a="195258638"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Jan 2023 05:42:14 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 11 Jan 2023 05:42:10 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Wed, 11 Jan 2023 05:42:09 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/3] dt-bindings: vendor-prefixes: Add entry for Aldec
Date: Wed, 11 Jan 2023 12:41:05 +0000
Message-ID: <20230111124106.2417152-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111124106.2417152-1-conor.dooley@microchip.com>
References: <20230111124106.2417152-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_044224_011648_1F492DB8 
X-CRM114-Status: UNSURE (   8.05  )
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 70ffb3780621..d119e9a7c287 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -69,6 +69,8 @@ patternProperties:
     description: Annapurna Labs
   "^alcatel,.*":
     description: Alcatel
+  "^aldec,.*":
+    description: Aldec, Inc.
   "^alfa-network,.*":
     description: ALFA Network Inc.
   "^allegro,.*":
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
