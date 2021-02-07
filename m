Return-Path: <SRS0=UnsP=HJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E412C433DB
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Feb 2021 23:13:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD38664E2A
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Feb 2021 23:13:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD38664E2A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZBezENa7uLTJEpAbnXHrjRpvltgAEHRnmo2Tsywwa5w=; b=LsXxu843YcnbLwDzXqStH+HCr
	1Quxy7UdMvcJ7MPoS5RHGEDk0zDbMbEXgvVJ9lbH6tIz94AaFHa4c1/lgZQikPBT+sYAJLXgIojN1
	NrNnBdRx53/De0IlqYXZuHcUHzcsChlM4nlxSiQPgOM+CPxHeN9schhBuSbQ8aiIYkD1OW2BtvJOC
	EYve/6SrFLQshdZ9DRPMXp92tmhWtBa4HTJOTprbYCujU403s8kTWnWoHYxZ2tYWW0hler78dARvL
	sv/DhYuaxOI5mMO6eNdRNo9zDukMaqdMJBz3gIggKZdHY2AFWTQ/sUf4o2aKHcoVlC8ErCqor9HrC
	d97ldhdmw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8tEx-0006RP-Tz; Sun, 07 Feb 2021 23:13:15 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8tEv-0006Os-Cp
 for linux-riscv@lists.infradead.org; Sun, 07 Feb 2021 23:13:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612739593; x=1644275593;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sry4Jcxj7WaCMHpIVu5N/bY5as1f1P4twJ4S9BPW/Dg=;
 b=AC4yZf4oGnfilTbkV8knm0yYlcGcyTenB5fmijI4dTgsGW8cYk5dxbBR
 pAleISRIu/A0jK99FP2vFdnf3CAyCESRCwn+MGtU0jvXDfYoJqhPM+fSC
 8lD8Bm4BHiUnSI+xdeq8KlQCm6ze5V42WPmYXcBMAb2QIHljQ6lv0+Fiz
 PP+ULoEOLHN9RpUYYiT8m5HLJurXcw/i1XYVPKEWypKDhU0e0CmG0K81t
 gZ1HoBZ03nNFyftUrUGIOOZZer819pdjzWll98gVyzRRgfDENmQG3CwG1
 ScL8SBoLwc9rJouKlibIU+RedXTqeXoEN6RFk5dudtuXG7MTe6w7NlQis Q==;
IronPort-SDR: SNgV2K5GYwE3tmZcGbqzOXx2wBpO6sSK2LpH0zsN2fTHrFnNCgre7I/YZPcZciGEVsEzPcYtg0
 xcDu3tTWNB6/q5bJk0C7UYKSdDUcQAQkkxvq6u6iTscjQYI2hwVZmqRxH+3b4Kx5d4qTppdhi0
 Z3dYzLj4Z9ZDm26UM+G8qtiwfYgMNUVJDOLtATXm9U4PrFhWl/+cHKucbUcexGCrC34Vn0iOcZ
 HP1dYLk+eykNH8OZwsWbESv1nUBQyplipnFEOTrR0KRmmRP2mKXTrSUOyfimm3OstGQwjRYljr
 ZfY=
X-IronPort-AV: E=Sophos;i="5.81,160,1610380800"; d="scan'208";a="163861267"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2021 07:13:12 +0800
IronPort-SDR: iuqJzsV3XSsprPnNa51wNZ/EQhCizJL0UHNtVDzOxiRouRVpoU66ikEa4XDqYqutixrPzdi28a
 rkxG3VFMV7/p7oG7iwzcDGXfoBquPQyyTDvYHQj35Ix6/RqvF54+95nZYMrA00bVK6ft35alGI
 yjnnsZ3eTIAs1r5Ga63DojxMyQLgDOt9GwNcF3r4xRosO0sK6JjXPYUm0lyNVfZt7cfnv/7IF4
 VLwwcf3u0scWYOBBISIrsNCJkx7GIpF8TsFeLXGT8t2gvPDPIZvwpA+2cdQb9vltC21DEn/co+
 GU+u1VACep6J9h2Evpkx2e2y
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2021 14:55:08 -0800
IronPort-SDR: JmjKgpfXVkCBT+7bdnxfN8x4U3vKRwsyAkchQlhGhVz/Z8agTAvv30lBlgo3rkmiN2tS1J9KNL
 zmdKIJ7FtY21D89/J4z9cyIQFNxh/NPTXYCytci00BQqK6wNEmYJzIc9/ynWPipIPUVP2Ox1mb
 flBabxnbS+L3aetkWpjUwx2mhEvMfX2hiHy0y8rKlvq8a0z5ehLBf4JdLYoBGtjCK5/BUo7nt9
 1fttqoBUu2YoSIi1BHwVXLEWSEnMtTV+54dgXSUo7WZV4x47zE1+ehtpj9t+SzACpnCjl68Pej
 R4Y=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.69])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Feb 2021 15:13:12 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v17 07/16] dt-bindings: fix sifive gpio properties
Date: Mon,  8 Feb 2021 08:12:47 +0900
Message-Id: <20210207231256.115130-8-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210207231256.115130-1-damien.lemoal@wdc.com>
References: <20210207231256.115130-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_181313_725784_9B5CCA0F 
X-CRM114-Status: GOOD (  11.26  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Anup Patel <anup.patel@wdc.com>, Sean Anderson <seanga2@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The sifive gpio IP block supports up to 32 GPIOs. Reflect that in the
interrupts property description and maxItems. Also add the standard
ngpios property to describe the number of GPIOs available on the
implementation.

Also add the "canaan,k210-gpiohs" compatible string to indicate the use
of this gpio controller in the Canaan Kendryte K210 SoC. If this
compatible string is used, do not define the clocks property as
required as the K210 SoC does not have a software controllable clock
for the Sifive gpio IP block.

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 .../devicetree/bindings/gpio/sifive,gpio.yaml | 25 ++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
index ab22056f8b44..c2902aac2514 100644
--- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
@@ -16,6 +16,7 @@ properties:
       - enum:
           - sifive,fu540-c000-gpio
           - sifive,fu740-c000-gpio
+          - canaan,k210-gpiohs
       - const: sifive,gpio0
 
   reg:
@@ -23,9 +24,9 @@ properties:
 
   interrupts:
     description:
-      interrupt mapping one per GPIO. Maximum 16 GPIOs.
+      Interrupt mapping, one per GPIO. Maximum 32 GPIOs.
     minItems: 1
-    maxItems: 16
+    maxItems: 32
 
   interrupt-controller: true
 
@@ -38,6 +39,14 @@ properties:
   "#gpio-cells":
     const: 2
 
+  ngpios:
+    description:
+      The number of GPIOs available on the controller implementation.
+      It is 16 for the SiFive SoCs and 32 for the Canaan K210.
+    minimum: 1
+    maximum: 32
+    default: 16
+
   gpio-controller: true
 
 required:
@@ -46,10 +55,20 @@ required:
   - interrupts
   - interrupt-controller
   - "#interrupt-cells"
-  - clocks
   - "#gpio-cells"
   - gpio-controller
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - sifive,fu540-c000-gpio
+          - sifive,fu740-c000-gpio
+then:
+  required:
+    - clocks
+
 additionalProperties: false
 
 examples:
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
