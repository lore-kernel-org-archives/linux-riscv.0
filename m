Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB386CF9C71
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Sep 2024 08:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:From:Cc:To:Mime-Version:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MG/HVQPb9EK93dQ7vepRsODMVgjbaqlGV4YMH29EMDk=; b=tgPVhzkXC9f/qx
	xQZH10aG/4ok2C5ktRF4XfTm+vHHyPTzlxjxv5bIhezpBBiRAkof1J2BZ+mgTj/wGP5gf4paYw2+M
	K3rnVATSuxW4j5qeYv0YM4dIv0Tns0LgKJ/3oJmdXBFNfofzO3ZuRas/3FAerBAVmHtB3VnjjpD3C
	js7FyZ9jc4MqN4rGu1/anped9GEDfXKU4du8GBWv0yb78QrsiDuCyQQVbUZxeVGJQo6ZRsVh0GN8J
	Qf3DzTvTBXoni4So5qB04YAJ9xSF585Q1LapBOvD3hjyeoVg+eWqJnDSG4t6VY1ORbEmsms0kZVId
	KJM3BnIUvbpDQGw9A/Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st0aC-00000001X7U-1XhR;
	Tue, 24 Sep 2024 08:07:40 +0000
Received: from va-2-41.ptr.blmpb.com ([209.127.231.41])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st0a7-00000001X4t-1Pi4
	for linux-riscv@lists.infradead.org;
	Tue, 24 Sep 2024 08:07:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1727165243;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=n4FlAamSfqVt7limHNsws50tZuvmPfsWIXOGbBiq7G8=;
 b=pTTBsRxtcpT1X806nIPg1ilOeZVDPMla+E+UNcUaidTala1kf2rWiH/3BHGv6WSxyJkB+B
 1tx1uAPInS+qOHx5kvYU9m+tYOyPBYVPvy/BPaMToMoKzX5HcPcgcmguowp/FBiujL1y2K
 WGaMnZnl5qs2elGkAyeRUC5D7weO5EEgCFHYqIeDT5PEQhMWZKXrQxUciqZrpvQbymNA2m
 ClWo2lWGSlQiwvfwopvre+8h4Mej2cxwSW3rn353NCOM7DUcugf2mQw/Wsq0eeH4IKmqN+
 r4daMtxY5a38lUZ++3OUo+iOidLkjMX/nq9aN2sIQYxuvuzjFDsRlNPgkXFJ4w==
Message-Id: <20240924080650.1345485-2-sandie.cao@deepcomputing.io>
Mime-Version: 1.0
X-Lms-Return-Path: <lba+266f2733a+2af7c1+lists.infradead.org+sandie.cao@deepcomputing.io>
To: "Conor Dooley" <conor@kernel.org>
Cc: "Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heiko Stuebner" <heiko.stuebner@cherry.de>, 
	"Neil Armstrong" <neil.armstrong@linaro.org>, <rafal@milecki.pl>, 
	"Linus Walleij" <linus.walleij@linaro.org>, 
	"Michael Zhu" <michael.zhu@starfivetech.com>, 
	"Drew Fustini" <drew@beagleboard.org>, <linux-riscv@lists.infradead.org>, 
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<dhs@frame.work>, <ams@frame.work>, <gregkh@linuxfoundation.org>, 
	<yuning.liang@deepcomputing.io>, <huiming.qiu@deepcomputing.io>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [patch v2 1/3] dt-bindings: vendor: add deepcomputing
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Date: Tue, 24 Sep 2024 16:06:48 +0800
X-Mailer: git-send-email 2.34.1
Received: from roma-MacBookPro.. ([61.141.249.39]) by smtp.feishu.cn with ESMTPS; Tue, 24 Sep 2024 16:07:21 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_010735_483083_DF20F057 
X-CRM114-Status: UNSURE (   4.56  )
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

Add deepcomputing into vendor list.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 56d180f9c1cc..7803b53e9a6a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -356,6 +356,8 @@ patternProperties:
     description: DataImage, Inc.
   "^davicom,.*":
     description: DAVICOM Semiconductor, Inc.
+  "^deepcomputing,.*":
+    description: DeepComputing (HK) Limited
   "^dell,.*":
     description: Dell Inc.
   "^delta,.*":
-- 
2.34.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
