Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B5D3C433DB
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 14:05:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2EF4223E0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 14:05:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2EF4223E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rh6KdQChVJvv6SFSvFmWidQVH+m88x4uknvfJdaeyd0=; b=MAKTebai9chOiffCF7QbWslba
	D2T3mWMPceKM1LqbfIwAg1k3j6KsVqgNMIkmF2jTMamYSYNp1ovZ+5uaFmgKk9nsOIaxGHeW+dXTA
	QmGZ9+7FY6zPVDVMT31u62RBBzytMAaQwQNVpwHZxpVGtIm0XMaEyRmNXeP/Nh+bgIFJYfcRfP7tK
	+kK7Gpd+Lf5OKGvCn3NBuTScdIi3oN8PkjlONm1H7bp9EDtRJIX+lIrYeV46jCewP9o+Uz5+74J/c
	zZT7qROZ3O4YU6ZODQKEhvY3KTjQ4hB614oWB3FKY4aOhHx1un6zbTNLx3wkez2uRxmh3p4mGEKEA
	zLifSEu4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Pif-0002vl-OQ; Fri, 15 Jan 2021 14:04:53 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0PiW-0002pm-Cr
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 14:04:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610719484; x=1642255484;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pxt0C0mCAFqqSrNoTsLwsfHLdzD156W4WrdlqAAuxAw=;
 b=NGwC2e+AHggjt6fJbGsboaRNyUuvp1+EU6204CiEDvU2YCoj5M7iZ2L9
 D+BmpqXAaKZF3yAnING9GgLit+BSEnRgLvEXg+lCbNqP3u/VTrAFdmuOR
 C9uU0cJeH4B77leCDwygFEYBmwf05BHCqjXtJZcuPmIQXQOWgB0PRiWGr
 Ej2Agcz3wNazwC8U8QzUEUqbt1pAIJG5GbLLo5ZNGmBkgMT4XhwF4Jznq
 7BwhPBwytueYOeoIUuapEgVHJ/8YeaQRNV9WXRIpEg/+1n5RehCu5Ma9f
 hxuxVd9ZGDD9NSqwMaJG1NWosUrTOi1MTYMd+WFPM9jsi7E0oDGFMJ7mm Q==;
IronPort-SDR: N33ALmsp9I8dQuIP/mckaC8yBrT/8dE/orKL83sJfBFQa0mbxCEnPspgdkM7ppI3SXHsFDO0iq
 qwaCshfDq6wGtbviQ2g4a5lGHKoNqi+nKcH5Cqg1xU+pM4F6wnxN4o9XmgXitlNQsWseAz+wpb
 l+88c6vHBWBrESpcryGvRnLh1UflYl9FXJ3kac7FJDDs6GtU2/vAMKRfuvqd1J9qQEahnaVOz2
 DRvvkAU43cxejKYLTnZB2nlBeX1ylMAE93pX/CW4MmIoar78Rr3CsTrT7vsq35FRUvHp3is/+i
 XEU=
X-IronPort-AV: E=Sophos;i="5.79,349,1602518400"; d="scan'208";a="161955754"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jan 2021 22:04:43 +0800
IronPort-SDR: eyFlts1AOIaxP6jgTYTbn0p08rW3nrVW7hMFDucsG5aJvc5bYRXAkwtBcVfHJ129ETVVdC2avj
 ik3JQ8epBSfXHa/lHP+EvLot6pVRc6PEIB5wK+SH7MuMOziytAQ/JbTGgjPD+j6ir1pDrcDfCK
 htX4SSb3SGAp/1B/c16ciDzHLtNtUJ67Uf15+srxgQwrFi9yTNP+qh0rGZD0wBVtLvT0meyEfw
 4CYHGMgRITXx4W4yvR7jErNwiaqLZ2SoKH7MCVhZ4e9izt0wbgLyYL6Mt3SzpkAQ9Th+xjSJcz
 dcZQ4zAT9Pi+71FBKDgD4R4v
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2021 05:49:25 -0800
IronPort-SDR: dHkqvMBXqqxx5Y/UbDfm5GjSMh8nlDWjvnixhN2QS7T94ALvzIie9Rvbdc0tYFYNn3DL8CkMFR
 QDUVyyBxh+CG/iq77QXRNuXD6nFZfGJ+CuK+5J3c03abzR9juRS6jD78bO39QZIuQVm/McRPrr
 aiztDOF13jZNzEIxByfVyKXwca8FmwUD+7HpOI/E93uMbcIUaAhAvA+vEFZ6ZO82ADl6qE4njf
 tpULBK8P3PbCyr9gsIs52WbI5br4dTzLQs+AlppsGN7T82sW6ud2sIe+Ko11kb+8FUeQ6A/8Ju
 OjI=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.70.177])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 Jan 2021 06:04:43 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v12 05/17] dt-bindings: fix sifive gpio properties
Date: Fri, 15 Jan 2021 23:03:40 +0900
Message-Id: <20210115140352.146941-6-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115140352.146941-1-damien.lemoal@wdc.com>
References: <20210115140352.146941-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_090444_640799_00975F09 
X-CRM114-Status: GOOD (  10.32  )
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
Cc: Rob Herring <robh@kernel.org>, Yash Shah <yash.shah@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The sifive gpio IP block supports up to 32 GPIOs. Reflect that in the
interrupts property description and maxItems. Also add the standard
ngpios property to describe the number of GPIOs available on the
implementation.

Also add the "canaan,k210-gpiohs" compatible string for the Canaan K210
SoC which uses the Sifive gpio IP block. For this compatible string,
do not define the clocks property as required as the K210 SoC does not
have a software controllable clock for the Sifive gpio block.

Cc: Yash Shah <yash.shah@sifive.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 .../devicetree/bindings/gpio/sifive,gpio.yaml | 21 ++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
index ab22056f8b44..2cef18ca737c 100644
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
+      interrupt mapping one per GPIO. Maximum 32 GPIOs.
     minItems: 1
-    maxItems: 16
+    maxItems: 32
 
   interrupt-controller: true
 
@@ -38,6 +39,10 @@ properties:
   "#gpio-cells":
     const: 2
 
+  ngpios:
+    minimum: 1
+    maximum: 32
+
   gpio-controller: true
 
 required:
@@ -46,10 +51,20 @@ required:
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
