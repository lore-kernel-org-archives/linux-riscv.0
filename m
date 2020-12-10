Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC5FC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 14:04:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F71523B85
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 14:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F71523B85
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sFyHLO3Cm+j9t5kOzHTksEkkjlUHh820PhOIu6kO6vM=; b=ZglzmW++mj65VHmBYnlMq5A3w
	voCA/A2kGcSbykMFDkXkhC3n7LHTnRRvsMq8BDgW7Lz9tm3DiDongFpOilzxxN8LwwJ+FbDs/r7c7
	YkSsv7G8jLP/ZVukSNmXDxcX/lwza0AIStnbJJ53Hd+cTNpr2npnoxXcliSsiBVOb6ixmOZcT4KBO
	1Ahx4dM3JvMtfvTzPzAvnBpCtGl0jejDXcuvZngxNjzhyfF8vVkDAQUDaj+ZJD0vuw8JmR6QE/hNz
	qr7kH7rIk6+OjlH8thtJzrCuZkIsmb7HLACs619M0CWpjP3FwXNWhedqzkyuEyGBtmNOcmWwtD8HJ
	WkqgTrmZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knMXt-0000XX-TU; Thu, 10 Dec 2020 14:03:50 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knMXd-0000Pw-MA
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 14:03:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607609311; x=1639145311;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=H22u4xiKw/P4g/XcfsJWee9fpfvG7aMiAyWR5GHomJw=;
 b=Db9fHEEIu6oyXYOWgJudQqj7n79mqrgBXTr7OGOx5972SNsYbXRx8wY0
 DV/c/G7YP8186HwC+rAk97XPcCOdzNjv4DicKwr0jlDqrra+/JL4zVAdK
 XuQTsSYc3Wvg/7fSxZ+YNnIYuhcSxAoiB5h29MSaz4EJgqGv87T31UO6v
 idRuxpRs/HHTW8zVAb41EgFi+Xr6AD5FcL8kKbrDh6/lHKOTzOweSzYBh
 a9PKP6qaCzdJvfsdB5HzmBrjR/+PjdERd0m5ivCXJHG3k1jdWddOkfYNR
 3ncmV+YYRZUCqayikJDU6RTHCfsCMH/LDo4rBP5gqbqdqQaeukOZ8V23Y g==;
IronPort-SDR: 3xpCYDhiooN22KAKOAq4CYb3EfBteEYN5pjwn+9htnDTWC0YBNZnAHRKCZtpzWVrp33NwQzXqW
 M/jDrflcyiy2H3/29tCAQLMfyDTevZyjHOQyLsGr254ujMkFqnlWKmbrzDsrrWws3fYZAsN6e3
 76csC9MglShJpUuLYgVM0SiDoSxQEugBDuFOcGrwgYenZEFJ2+vKUfaxajA4AhgdQ4iak9Sqhh
 hnke3arvsNLDMbQL0tFV46MO12QZwUKqVerBziqgkTtRGQdjx7tw/Y3SqJNP0TfoakvwXrBBsr
 QfM=
X-IronPort-AV: E=Sophos;i="5.78,408,1599494400"; d="scan'208";a="258584834"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Dec 2020 22:08:30 +0800
IronPort-SDR: oOooZjdR66O5h4jjFWQnfNf707api6HVXvdDTTzP4UmZzw79WimbOReZYMGqmUWSSPKPFVd1NB
 kWOA8xuk1EctOljJiCfkasv2lKKrGeHQA=
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 05:47:24 -0800
IronPort-SDR: C1L/DOiilQxvR/D85ESfOrQn5uT81s4MpR9XLd1buS1LZJ5myMNvaJxHHN6oeriOSDXde/kI61
 7KrWc+AJd0jQ==
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.173])
 by uls-op-cesaip02.wdc.com with ESMTP; 10 Dec 2020 06:03:31 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v8 07/22] dt-bindings: Add Canaan vendor prefix
Date: Thu, 10 Dec 2020 23:02:58 +0900
Message-Id: <20201210140313.258739-8-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201210140313.258739-1-damien.lemoal@wdc.com>
References: <20201210140313.258739-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_090333_898434_EB6655D0 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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
