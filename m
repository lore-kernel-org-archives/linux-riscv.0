Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DE77C3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 13:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B46N+TcBO1BEa9htcReyW3MHN2+n48oLEvIbYwlkt2U=; b=o07jA/KnzY4q1Q
	TfdL6Xfzk85erFzVWHdoade87bcWaJzhhfgWcQT8pRLmGuzMdPNaPFE6X7giooK/G+mlUPV3Q6Uur
	DkEoKo/Mq6hy4SLHhe8+0DvdtBNu1dch5sftOhs2pPz/VXYQvtzGSbd7oBVmK7v9XXC+LGr4hg3fz
	BET57VWq++Q4xdTnKdPbPdKnlzXFvqzTrVduKS9yhp5RTd/uSwVXdqhcf7WejOyQuCO8q6aLKHxJx
	ENVAMuyQN9uhHGMmKVGvESGjvWuQ7SL7Hm7vL5sIxJA2v/Is9nSLPcDjIQXIOXE2RMa5eVkU/h5p/
	Y5shN6LrqSiDpqj/9SZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyYY-000000015ke-16jq;
	Thu, 25 Jul 2024 13:30:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWxOw-00000000sMs-4B62
	for linux-riscv@bombadil.infradead.org;
	Thu, 25 Jul 2024 12:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qE6mxLjGCn8ztBuU8PQXA9vHP1IiI41lD6r9ygoFuAc=; b=HUM93w46cI5/Ooo/bBna5HPoeg
	K7lgVtRv2ge0wVNmSyB8NGFZnEdLoe0gMMeZyA40snz47p8xe7qx6ZuFnszQRwKemb9H0tMESC9Oa
	zG5q8om4QnHdKZfB3SsfdmiDvOqjcaXC1RyvLJGPbtPWpq+M8MZnKjQbr5m40rCpa93+KJC+MTMIi
	Y6xzHsxsZrxeXQ8Pkuc2zyGNBeiFNZRdCrn85gIVyda9csUv0/O/UVrqN/TAf6pHRa2TymNJrO09c
	vGqry8YIeMnP/f9S3ViO0+hMqh6NP6HZcsFNvXvAiqIPxx69vUYAyFRbBxe0JDZkSb+/E2LL2OPpX
	4aGHveJA==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWxOs-00000003zz4-0VHJ
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 12:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721909810; x=1753445810;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=13pBX7HrqyQLqJez8Tn1NpNnpK0lqqwZHVuFDqzCnWU=;
  b=g7qBeaipfgXFgaYT/tpa0GLR1qQtoJC0Ln3PZz9g9NI4UMIh1N4JVmt4
   xsUQZnBXdVjID61ygFvIrFia6789YD0nhDSQK3OBUK8N/g0QrpvOe4PlE
   dLNU3w3z0brOnDLo+wR6MjENPc7hHT41YiLHEWU9nFPCp0wvbgpNSqW1q
   PUROB3vOtvgJ3hID7YgXw1+M5/DcPB+7w9DnSPmkG3yFsxTYbCjfgzDIS
   KpPJ1GC/79uZjSbiZn9wnTDcvgSdBsxzr6noP5u65HJ90HZEzM0B+RdiU
   xU7iTWHLRfCdIWw7/f1FjHBaQTk16aSM3IgAlh9uq580dSCX7zuoMOdye
   g==;
X-CSE-ConnectionGUID: 7H0adE5mRmid6ymnvkB3VA==
X-CSE-MsgGUID: D6u//OryTremXiN8sf3jMw==
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="197092681"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jul 2024 05:16:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jul 2024 05:16:37 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jul 2024 05:16:35 -0700
From: <pierre-henry.moussay@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 08/17] dt-bindings: clock: mpfs-clkcfg: Add PIC64GX compatibility
Date: Thu, 25 Jul 2024 13:16:00 +0100
Message-ID: <20240725121609.13101-9-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
References: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_131650_595818_1C4C0AE8 
X-CRM114-Status: UNSURE (   8.06  )
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

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

PIC64GX has a clock controller compatible whith mpfs-clkcfg

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 .../devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml    | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
index e4e1c31267d2..ca889f5df87a 100644
--- a/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
@@ -19,7 +19,11 @@ description: |
 
 properties:
   compatible:
-    const: microchip,mpfs-clkcfg
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-clkcfg
+          - const: microchip,mpfs-clkcfg
+      - const: microchip,mpfs-clkcfg
 
   reg:
     items:
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
