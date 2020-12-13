Return-Path: <SRS0=J7tQ=FR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E197C4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 08:10:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F138E22D73
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Dec 2020 08:10:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F138E22D73
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K+ja2fejkHZdt8IsHo8uWunrKO810BAO2Ms5sp/4LsA=; b=OvlhRPOK4y8liJEeKczx5XJ1x
	JKudi2CwfClCIUvEN/nLA534HqTqGyUiwNN1sFjaP2C8atrQJ8JBsGD1UBhvcuKvCeWxiALnhDDkv
	WQr0sxhH9g7JX7XYQgICaEL2sey+u7WuCwmN2bK/oZ+7n/UnlLmtXlSxNRsphC/K8c7pAvOMqVxlg
	OZr8gYEljzR/1tJbiXlOcr45MpFqVjG/MxsD8vQcrDz4AFfyqqrVz0W0DVkErcfURnz87F4kae190
	rQa+uGNksmGp98+YUiTAIDi5LZka9K14r6EOlyPUxPoAKICbTWWb8KelX9OKEWPH6JxAAMLaDfaU0
	hovHuqSFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1koMSv-0002aH-Ui; Sun, 13 Dec 2020 08:10:50 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1koMSh-0002SE-BZ
 for linux-riscv@lists.infradead.org; Sun, 13 Dec 2020 08:10:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607847035; x=1639383035;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3D8NTC3KrPCHvVVEiTgbfIPXRYhsMwi8saVYnSZKxqo=;
 b=jzSrja7xlGyB5E2dkotqJIMXJi6sYWYX2bPBYE0NRRSR/lj54UKDfa0c
 ZSbZ/jUOG1Y+NS+UaSftf7sywSY4rNIfmrbXqT/5hW4d6Ncr6ypDi3xUh
 tfrqev7L6q73ejjv9kP1Ih1+E5R6lM1tueVTF89Uw0kYOOCRp/gpeDijh
 wo9Z+jChdFom/SOzwQeS0Z6f0wUavmCAKAaVYf+mnmHvOSCGUfh1k1IHM
 sinEbWGC8mZr0fRKwM7zCXTbyLTaYaUybwrUt8g6lLkBO5OXtGVfk9ifA
 bNACXquYggvWQBhgt8JtoWHi5QIPs4YsRtzt/5z6bxS81zWlwIOO8QV5B w==;
IronPort-SDR: E+jwVo3kA0MOnb4RRBQHJXXXNMinF0G1gRMgWtXY1VeqFeipD9DISJyuOyHx2tJ47zb3wcTRZp
 93psbzKAmJsda6QAQYJEud872Zag9BZAHMjtXeAYzHVjSRL1/TMlLYK1DQkT00wCUYSNCqbCyq
 +InsSj+YRsJKiQCSJHIJTAjmjlfn1U37LSgpWSn6OkIMlEg6bUs+XvlWfCFX7mxiKun0feP9b8
 6mQWXTs4C3Jbl+UNsWdVZW66z0JkKRW5kKi3hK2CwnK4YupAnYEyzrMaYFjPgNI1eeaxMdVBTF
 yJo=
X-IronPort-AV: E=Sophos;i="5.78,415,1599494400"; d="scan'208";a="156235149"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 13 Dec 2020 16:10:35 +0800
IronPort-SDR: KcmUz2CejjyEG2NWqXUmr3E0iap8NyXPdgMRifszf5JABATs0f/jsjl8KjFUU0hXu2q3o8sH6O
 Bg/FwNkUDvbOUJwSrEWiaFjysYz+0bEOMWgFT8x8l2n5E0CHQjQEwTXUnIYH567G5zJfwP9UWk
 PML7pFcg9/dXO+Mup/Pu6ugJQVMTqEzB7ET9VSa9KeXMATsG6PxMOSAE5c5BywLxSZUbKALg3A
 16jBquYlFR32WqPuCXqz1eS2c9q+As2YvDTNYBRu9SdqhQaKNV21qYT+DKijlHP60Ar0sddcKU
 wH7uUhC5sO5MXD9KbM+qY5lO
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2020 23:54:23 -0800
IronPort-SDR: HNl63QyBwdR9TIvczWVWP/OZpr+/GPTdyUJ9NffkBPs798oneh08ONbUuJ/6wEq7fiY0/+gnu9
 SAL0+5s2wBH08thcnO4cZzPyazgfE1zN6jk27f7tAM59C+Rx5+BQIWbSDiSwmWeVRrOU7k8+zY
 1r8MugtRfM2qNCHtNJPjlR0xjbHdnzQLJ4G3vODnwYIRZ6w22ISSh3YWjK1i2TAk0IVpW0ynY3
 lOXtkbKks5nvfG0YShYyAg4BSOXL175HCoZoXrSwr4/GrFM9Z6u+Ww7CADVrw+G7XbuGcfKkkJ
 GRo=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.197])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Dec 2020 00:10:34 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v9 07/22] dt-bindings: Add Canaan vendor prefix
Date: Sun, 13 Dec 2020 17:10:01 +0900
Message-Id: <20201213081016.179192-8-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201213081016.179192-1-damien.lemoal@wdc.com>
References: <20201213081016.179192-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201213_031035_967284_BD0793CD 
X-CRM114-Status: GOOD (  11.33  )
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

Update Documentation/devicetree/bindings/vendor-prefixes.yaml to
include "canaan" as a vendor prefix for "Canaan Inc.". Canaan is the
vendor of the Kendryte K210 RISC-V SoC.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 2735be1a8470..a07231aaf3e7 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -179,6 +179,8 @@ patternProperties:
     description: CALAO Systems SAS
   "^calxeda,.*":
     description: Calxeda
+  "^canaan,.*":
+    description: Canaan, Inc.
   "^caninos,.*":
     description: Caninos Loucos Program
   "^capella,.*":
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
