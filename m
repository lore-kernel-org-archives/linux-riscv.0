Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014D2C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jan 2022 15:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/w2ih12BcoQYJjz1+LBT5alY+OIlkjThYy9+vybSXN8=; b=msZKXb6wDtID7q
	8zs5pG0oogcq4soFhpyg2nVuI3s3uiJ67aSZDQU8UqU/Jw26eGKEF1bOhtZa+nQeblstsMqvP/Nfo
	UGjiYkF0oud9oRuXo59BfUX5uG5b0b7ObgpfMdNW+qSllPfFVbE3m9l0GMSlRksoF1v4OFSNpmE66
	Zy70N9tb1t9THoszPTlhkoO95z8wMEfKWm6gYXUMJ0FZZB31c4BOzSyDE4+bEFi/nqQMbBuNS1IO6
	cgdfXTwQ18IUlTpQPQRWU0qCQlRgZL9SvPnSUHjO4RaUSX71uGVNIxTfWHdIFFVURr50wdE0Qe+hH
	3verXhMOTyMilnUWwuAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD6Wk-00GCLj-H6; Thu, 27 Jan 2022 15:17:34 +0000
Received: from out28-74.mail.aliyun.com ([115.124.28.74])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD6WO-00GC2E-CL
 for linux-riscv@lists.infradead.org; Thu, 27 Jan 2022 15:17:13 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.512559|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0785358-0.00189877-0.919565;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047207; MF=icenowy@nucleisys.com; NM=1;
 PH=DS; RN=10; RT=10; SR=0; TI=SMTPD_---.Mj85P.-_1643296627; 
Received: from ice-e5v2.lan(mailfrom:icenowy@nucleisys.com
 fp:SMTPD_---.Mj85P.-_1643296627)
 by smtp.aliyun-inc.com(33.45.46.134); Thu, 27 Jan 2022 23:17:08 +0800
From: Icenowy Zheng <icenowy@nucleisys.com>
To: Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, Icenowy Zheng <icenowy@nucleisys.com>
Subject: [PATCH 07/12] dt-bindings: spi: add compatible string for Nuclei
 DemoSoC SPI
Date: Thu, 27 Jan 2022 23:16:42 +0800
Message-Id: <20220127151647.2375449-8-icenowy@nucleisys.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220127151647.2375449-1-icenowy@nucleisys.com>
References: <20220127151647.2375449-1-icenowy@nucleisys.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_071712_668052_FA02DED5 
X-CRM114-Status: UNSURE (   6.22  )
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

Nuclei DemoSoC design integrates SPI controllers from SiFive.

Add a compatible string for these SPI controllers.

Signed-off-by: Icenowy Zheng <icenowy@nucleisys.com>
---
 Documentation/devicetree/bindings/spi/spi-sifive.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-sifive.yaml b/Documentation/devicetree/bindings/spi/spi-sifive.yaml
index 6e7e394fc1e4..60a24f31a928 100644
--- a/Documentation/devicetree/bindings/spi/spi-sifive.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-sifive.yaml
@@ -20,6 +20,7 @@ properties:
       - enum:
           - sifive,fu540-c000-spi
           - sifive,fu740-c000-spi
+          - nuclei,demosoc-spi
       - const: sifive,spi0
 
     description:
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
