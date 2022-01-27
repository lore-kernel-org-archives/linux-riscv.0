Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634D7C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jan 2022 15:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tPLBC1q5iCdFrzrQ5X7VQQDMBHF31/yNz84fZu9BFYM=; b=a8HrQaSlOh+3aZ
	/H5iPJwM9tZ0worICgU4fqhgalExYGOWFAJ0pEci1mMpNaWtNvU4AnmWcR4Mjsd7G+J6t2qMfLAsx
	qcSFZXpEAA2X3Zllq4y9tHLWnCZf+367h1joHzaDtJcwMUYXzRWlCWDJ5hQTpW6+6meTttP7c99/Y
	ExjFrM5X1rfZHQa0dvm6zdoZO/bVauZjCa2BlUgB5+dsNGMkH4zN1uw9xlFet+PZDUiZbGzF9epur
	jB4TKGTLixXsViUVPJdoxJ2NEPBqbxkVEaeCSlAzuRJV9Wrysls8oC3tUplHwCn4qYrrVBj4wwYrI
	rq1FqUZHZg2uglmEmNXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD6WF-00GBy4-CU; Thu, 27 Jan 2022 15:17:03 +0000
Received: from out28-75.mail.aliyun.com ([115.124.28.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD6WC-00GBwX-NL
 for linux-riscv@lists.infradead.org; Thu, 27 Jan 2022 15:17:02 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.847046|0.8261247; CH=green;
 DM=|SPAM|false|; DS=CONTINUE|ham_system_inform|0.0212515-0.000109326-0.978639;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047205; MF=icenowy@nucleisys.com; NM=1;
 PH=DS; RN=10; RT=10; SR=0; TI=SMTPD_---.Mj85Oz4_1643296614; 
Received: from ice-e5v2.lan(mailfrom:icenowy@nucleisys.com
 fp:SMTPD_---.Mj85Oz4_1643296614)
 by smtp.aliyun-inc.com(33.45.46.134); Thu, 27 Jan 2022 23:16:56 +0800
From: Icenowy Zheng <icenowy@nucleisys.com>
To: Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, Icenowy Zheng <icenowy@nucleisys.com>
Subject: [PATCH 01/12] dt-bindings: vendor-prefixes: add Nuclei
Date: Thu, 27 Jan 2022 23:16:36 +0800
Message-Id: <20220127151647.2375449-2-icenowy@nucleisys.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220127151647.2375449-1-icenowy@nucleisys.com>
References: <20220127151647.2375449-1-icenowy@nucleisys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_071700_982779_8E3697FA 
X-CRM114-Status: UNSURE (   5.72  )
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

Nuclei System Technology is a RISC-V CPU IP core vendor.

Add vendor prefix for it.

Signed-off-by: Icenowy Zheng <icenowy@nucleisys.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 294093d45a23..8d786367b093 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -842,6 +842,8 @@ patternProperties:
     description: Nordic Semiconductor
   "^novtech,.*":
     description: NovTech, Inc.
+  "^nuclei,.*":
+    description: Nuclei System Technology
   "^nutsboard,.*":
     description: NutsBoard
   "^nuvoton,.*":
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
