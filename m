Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 580ADC6379D
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:14:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09B29208E4
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:14:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZIWwjRzD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="qM1/olAY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09B29208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rRQeF7nt3LToxXpiZmFdY6jmZ2Z9KLJTGmnPbKPrWF4=; b=ZIWwjRzDDdoGd2ltIfWtdPjg7
	MRBL84dsitFqYo1dk6QqomOODC25txvLLN6untZCfvTW0g/FUpWPcTDykSfqTcvm/xWhXOk4mDTr0
	RjzWE6mLQvUyRgDOfdNemEavLfyB8i1niZb2zMIDKeXAnhmQg/58L4RgtDIq7b6DiAIZxOLuf82rM
	RDcRkexfqrxrVZ5MLy8/6OumPy1JXPkUqW655ylBjqM4Xj1/TDbG/3buvhnq6BIbtIg8pZlK+QgK0
	8litdEQL/H7Z6yuyE7x3IC6GrUI6vobCSHHNI9AGN0iYJn/fIARbGxUnMM1BBM92W4OXBAkO96P7W
	F67a0ng6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbJN0-0000XV-Jo; Sat, 07 Nov 2020 08:14:46 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJMw-0000PH-US
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 08:14:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604736882; x=1636272882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QoJVNai4z0WvL518+osR90NQ4x7vZ6Nl1KYmu+lCdTk=;
 b=qM1/olAY/9FN4fLvuK3yGW/2FOXHSDaFHBoiSljJPwgFrrG1aIpeXbdO
 BTz3v8NXV2G1Gx4gB9mV3sKEcZIycsr7JG3eS3Zd/dnIvmcQkTK4Q3rTu
 EBgejd1uk6xJ3WNIdouGKZLkR/dgZzmSn5DkENDpAqiB6fXITVxdle3Z4
 yfW9h1eWDKMkTuvGCtBLO/9ehOb1OVXCc+yPBXRKu+X/UPfwxnQY2elru
 /TAI3/+zMDpJJx7EWEvu5zeBr++w2EESfw1Gs08dmrNsQzIv+hu5YuxZN
 IEkP0J/u8It1tBUbwc+NLAI6ltsM9sJGVZJtr7p7/yVIA5FO50Io8GNs7 g==;
IronPort-SDR: EMSWUZkV4PkekFgtIu5naMxbaMC5MUkLKOs9yW11qaQA2HOOl8czFzzajqXxsAA4a+3db8E4yF
 yxE/DjhyEzFB4qiEIs+/JMLgPOwAQHUl4XQ5X654oO4KMLV1vzfIuj8spoQWX0k3mIK6/i6kcw
 rs5zcFBgWTAYPT+v2vlDyM5z6oCx5/i+9yeQLN3b8mNBlWgwDgDqCkPItFMKwcdVojxRTd5vEe
 1M+80TWc+Jp+5CiKcl0RcfCalaBaOFrLuIwjarKNZCKbs6W2vWq+7ywhk0prO5bL8rkFa0Ywc/
 3tI=
X-IronPort-AV: E=Sophos;i="5.77,459,1596470400"; d="scan'208";a="262079275"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2020 16:14:42 +0800
IronPort-SDR: OVcIBnPqG6JpR9QPe/hwJNkwfcffM1vlt7isHge9LtvNJwUQ2/7Y2mVjqLldmXfDoeAzfbBr9S
 /3b5qWMdLAc6GNCjnmJQet0/8TeIVWPogPIXGRqsfpxRrrreICehbndFSfJC6DyLkmIXiKsetH
 7yl2bEs+m7xD73dhMFavBkyDQYeBs8GRtgTDlOxCtBCwOdfxIDdT3kUOs9lnvNU8WIP3dzRMZj
 gZFMpETgvx629KUD51SBOiwlIhuiZNRgEAUDTtNfIT/wJCIn2HdWMwAGABlEl9375ruttGqPvs
 XzQ/24hCc+aW9wu/bbSw7+Q2
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2020 00:00:47 -0800
IronPort-SDR: l5NUdATJR2UmUDFMP2a7CPEW+CWgqJ5gegrk4pBecJjYdSp36XDdJ4PFTt1XYo3IquRXfcAPBK
 He10fkfu7C+nEDFDiZ0n7GlTGt9c3DiP3V5Yc5zbeN5VVKTFRhBcPnGqSrMeEyH3HZuEgSLCBO
 4y4m30TCEdJ8ssmXwDuYAmROYJZy4585Ods4E+50ZNoHGw7HXpIZdXqG9LZAqOuIFLxuIvAffj
 HQO2B+MtF0XFQw7uV1cwN56AJR2cKnX568HePrZH5CN1wYk2KKzuJFdWw2rjTSb4aQjgEyjUjF
 oAY=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2020 00:14:40 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 07/32] dt-bindings: Update DW SPI device tree bindings
Date: Sat,  7 Nov 2020 17:13:55 +0900
Message-Id: <20201107081420.60325-8-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201107081420.60325-1-damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_031443_174109_04925FE6 
X-CRM114-Status: GOOD (  11.45  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Document the polling propetry which is used to force the use of polled
transfers, ignoring the device interrupt property.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
index 99ed9b416e94..890a160a253f 100644
--- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
+++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
@@ -120,6 +120,11 @@ properties:
       This value will be used if the property is not explicitly defined
       for a SPI slave device. See below.
 
+  polling:
+    default: false
+    description: Ignore the device interrupt and force the use of polled
+      transfers.
+
 patternProperties:
   "^.*@[0-9a-f]+$":
     type: object
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
