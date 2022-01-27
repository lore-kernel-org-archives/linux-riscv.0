Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C79EFC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jan 2022 15:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WZpy5d3ADozd/y7OpbANfEdyi8M5xCB/ZxTKNHK22Kw=; b=kG7t56t9TCBQaB
	1uQhImUGnX979wzm3vhgF+dGuEzRgN1zRfHniqdEYjTuJTf/ofs+Bq8opfqJUxR3c1c5xevBKwZDf
	7lXisumPyrzIPV6I6ibVdeK0rcpF6giv0TVGGD6htYMtNZE/pQyhyUI5dBi1EYnIVH2Dwta4uajuP
	5XAPv49PtLZdY+UlapGbs4WBConc60yF/ftd26NNUsyTvdeicePGdkQo1xuRNU9KwsA7LH4wBaIhc
	qfM1ifoVhENkk23vyUBc+GvbZl7G4pxoXfCagwCyHFEEDbDUFs8AvqQdEvwBscHBEzcEz5JJknPxi
	qLnzPwKIegc490COaSbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD6Wc-00GCEN-SQ; Thu, 27 Jan 2022 15:17:26 +0000
Received: from out28-173.mail.aliyun.com ([115.124.28.173])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD6WI-00GByw-69
 for linux-riscv@lists.infradead.org; Thu, 27 Jan 2022 15:17:07 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.4156253|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0591787-0.000989701-0.939832;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047203; MF=icenowy@nucleisys.com; NM=1;
 PH=DS; RN=10; RT=10; SR=0; TI=SMTPD_---.Mj85Ozx_1643296621; 
Received: from ice-e5v2.lan(mailfrom:icenowy@nucleisys.com
 fp:SMTPD_---.Mj85Ozx_1643296621)
 by smtp.aliyun-inc.com(33.45.46.134); Thu, 27 Jan 2022 23:17:02 +0800
From: Icenowy Zheng <icenowy@nucleisys.com>
To: Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, Icenowy Zheng <icenowy@nucleisys.com>
Subject: [PATCH 04/12] dt-bindings: timer: add compatible for Nuclei UX600
 CLINT-compat timer
Date: Thu, 27 Jan 2022 23:16:39 +0800
Message-Id: <20220127151647.2375449-5-icenowy@nucleisys.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220127151647.2375449-1-icenowy@nucleisys.com>
References: <20220127151647.2375449-1-icenowy@nucleisys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_071706_475359_9428A70F 
X-CRM114-Status: UNSURE (   6.35  )
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

Nuclei UX600's timer has a part which is compatible with CLINT.

Add a DT compatible string for it.

Signed-off-by: Icenowy Zheng <icenowy@nucleisys.com>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 8d5f4687add9..61a8bd8bde91 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -27,6 +27,7 @@ properties:
           - sifive,fu540-c000-clint
           - starfive,jh7100-clint
           - canaan,k210-clint
+          - nuclei,ux600-clint
       - const: sifive,clint0
 
     description:
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
