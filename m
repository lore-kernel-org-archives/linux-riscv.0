Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2BBAC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 03:40:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83DB823A1D
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 03:40:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83DB823A1D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sFyHLO3Cm+j9t5kOzHTksEkkjlUHh820PhOIu6kO6vM=; b=NK0Ka/w+RV/BnTTLaltP1PxJW
	jc8QSaz7oY7RJMwtHc+htXBf5rDw1C0bdGmOJd5HokHMf1+oGG4e69ZrtPXSPGHAlvyC1rem13Ihj
	vn3JZdByZqA0tuwBfBDCHHLwWcAokab20Epkdwmt6e47zMGFn3/A5PFrriYvNMvqIwJ4C+zkHftay
	KMADskPzf8Kl846H7t+jSAm7ExPTJ1JLUBgi9C9o0UXLEcZSnX1G5+fQGcd8t6j2qlXbfA8O4odTd
	iNsFQYgPup9WhCVi0VAhYPMRmii3qy2oe2t3qqx5e68xylFWWtxZ46I/LqwoK4m4LDKT3O+7v1nJW
	qsBw66bQA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knCoi-0004dq-RW; Thu, 10 Dec 2020 03:40:32 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knCoe-0004bC-Uq
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 03:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607571628; x=1639107628;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H22u4xiKw/P4g/XcfsJWee9fpfvG7aMiAyWR5GHomJw=;
 b=HSSAsBfDCrAcw5K+MhMmaZu6UTxESho2EI+v2uYXXYLO7BVYg+7VZKjv
 yyBRWMEINTJMrSnMcKnMrYr+ZAlfzYhpjSYYKfr48yIVSa6Tt4Xu8Trxi
 oYCuJyIOrYjRIIZDwvbkgKm+DXWkcGd3H5oYu6x82dnm+K7ek7NsqvWmv
 TB51FucID/98Uu++ZEQBhZ31yrb73QP9SMK+k0vDGjhVRSdH4f5riKxY4
 d12xWUascNUhn1w4mh8K5uGdssgQQ0pE6a2k7r7bre9MWdszmvqSgnhdL
 2SU4wvTDqy4yZLNyEbBv300t5BVtp0WU5t6E0/dN3tLwHw4nAwNtJVpla w==;
IronPort-SDR: zxH8u02bFVpaVXQmHd6amEpwrZa+Xv9QdwnQWfRuM9z+l+mPFePBhXOC3qahDcDv4UzT6NQJbs
 u3SgfY0Ekr22a6zgURj9P2rN3eXjoz04uNuQppnbG4GpONfjSou4C1aLlmw05CF3lYPB7nLbpD
 2cGkAKjQ4xxK3ItLWlQxNqlN3z5TTjWp8wFeCn/bLAjnUxtNkc0rcJ/zvG6flm7PxF1/ivrABp
 mx0Wc7g6tVGDlZh8cpOBh/c9V1S2NHa2y3wK4Gh39+c51wmCvOS0MKJdk4l35kCwrqPvT5g+EQ
 fNI=
X-IronPort-AV: E=Sophos;i="5.78,407,1599494400"; d="scan'208";a="154813120"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 11:40:27 +0800
IronPort-SDR: X+kDLf4tqIWEdzS9WJD/98H4M6Cv0whWxX8BKf1eHgWB7YbXApFm25v4xQM2gJ2pRCn/r1IwCU
 QIWUykjxfJNV1YgQbie39JY2sV12yW9G8=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2020 19:24:23 -0800
IronPort-SDR: /axEbwi3MPwj2rIvOtkwuX8xwH/xQfgZQHA1graKYojTPpnPo27ILLjazmJP1ps+hByCbCf5Yi
 eja1+5YhCl7Q==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.173])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Dec 2020 19:40:25 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v7 07/22] dt-bindings: Add Canaan vendor prefix
Date: Thu, 10 Dec 2020 12:39:48 +0900
Message-Id: <20201210034003.222297-8-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210034003.222297-1-damien.lemoal@wdc.com>
References: <20201210034003.222297-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_224029_155382_FF68C1A6 
X-CRM114-Status: GOOD (  10.02  )
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
