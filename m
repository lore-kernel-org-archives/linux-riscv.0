Return-Path: <SRS0=Cdab=HE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7898DC433E6
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 10:37:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35B6864ED7
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 10:37:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35B6864ED7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gswnWoZbOBcUMQ34RrcIhomCllgFBG8MrmOUbQlcNqg=; b=ysZSsfxA618D4QJNHyFzl9SNv
	SQcXYp0PffqRKw3Uuzoe0dypyws3gJqgC5eQUP/20y+VD/5aRbwkIAJ8X7wkoYoOuRaSPPJ+YiMJa
	I5jtiLpPO0B5L37QOF9Q6V68vcw6hWcpvkOGSZatzVB/UtxGv/KoBOzBwqDnrpm/+Uvdi+Yyuw8J7
	v3JfC7W1ywnbvP/YHJCfsIxr5WDcSuIRf3S5UqDgyEvyohMwZ2h3BeMHQsB9SRwLN6uO3BBBdrgd+
	Psz3VbfTgiMjdv6MLrbM7kjmfurmOEjXa2yYCzNc5CPy4k2FvTQGGeSNpsL3agXFnXifmGCct6uVG
	8Oo5xhBSw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6t3I-0008Dp-0w; Tue, 02 Feb 2021 10:36:56 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6t3E-00086e-2k
 for linux-riscv@lists.infradead.org; Tue, 02 Feb 2021 10:36:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612262211; x=1643798211;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HnJ883zL+t4xSM63wnXK5D+H6FssPdmgykJIZOwLcLA=;
 b=fVwn2TUL3htO3Lda6tpIXrMB4tAVYtn7cKiqOcyfZHfiW0IfBkqgSsDN
 TtnMR7b97v/NWIURoNdLZvkjdPlYOtqc33pLZucpKgdkEPXUpUMBtx9J9
 /nbqVsqcc0HU2np6+OwJaDh8U8916Km6jrF3piZ2oFtKDOvooQvljVWPf
 0k9N4RzM4DGifCabCNVL+LHTK+hgdvLyus4EygbowEeOq9aZyMEkD00nS
 /oxm6Swmva1QmkcrM4tatLha9kr20i2BK7yhAWya2HdzOsKjisgx6uvrk
 ZoiQqa/VZCY3dajJOEi3dU0f5Fyk3WOnHSBEQY/EDHU4/zKPIqKFqZHRQ Q==;
IronPort-SDR: bLIXNQuofpIDVnLkg404uPi0KKuLicG4rT+tSLEX4MEr/U/7DxjtJY/RoMF8A8HpOl0NGZ++NF
 Ybq0oHUrqTSYo2MTCBkkC6yk3dj8g9LfKgrZ3DPakdYXWc61KokXebKvMPh613sCZK6ITtgjwU
 lwbdk63F4AatL5tOxjPlW2mB66HV/npp+DLmfbokS8fJgruhyqinCEGnDWj5Vx7cAXQ7XrLVzh
 cieaP4Bb/D4F4reF5/P9u/LfX5VTQgR10UTngEwlz+BXy/QyDaHPIYQdRELXO36YNly2/u67bN
 aKk=
X-IronPort-AV: E=Sophos;i="5.79,394,1602518400"; d="scan'208";a="163357068"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 02 Feb 2021 18:36:51 +0800
IronPort-SDR: SXfcTesfnAjVib/g/0AWmwYVaRJjFK+3mgVGtxkl+8j1PRqMm1em3V07EPgC/Hm79G8SPMJnZV
 2MDJKdX98IpbJuOTKNr0eQjmh9vipQvteEev8L317qme4gfdFuY/ec05ffxcny8gZ6CpzYrqQt
 V9kBwLH/DFLHhcMOxcIPbBL4ePGKCn50CJ7C3klQ2Yg+oZhcRkwehFXDfqWPwee1SorEg+YPDt
 a6UEmA7ibFNdo9QDrZaRwT+S3k6MYA+GH3vsasZ9MBkmeneXbqt1wvSeKUsSlEdbUpOcfYSwYb
 Di8AW3hilJebNIL/AUtw6PF0
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 02:21:00 -0800
IronPort-SDR: 6/5t+5zUO/L6uoup3z0JKX/4psaQPvgGBLCEBOBisn7ngtzxwUc+MTYATOOXS5V/J17N8NkL/m
 QMG1mbnzGoF+1Qio580+NKZ6SMyLv8DYx3PteGhWU/pEJOSyc/lN0tOVSdxVsKx8SGLbQAEsXt
 1DjP7M3sxw989R8+9wV1hF4IIsUCTskf5nqWFyVgZDzzvNVNKcqJDmlooh5yh4SAxPkHC9+hHw
 eB9Mr3eSY4BVT5ofdWlZvUJQX3tj8WTfHsWoZqlYkikcIJw8AgHgh1E5ibW7yJaD6fCOl0HBlU
 5zE=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 02 Feb 2021 02:36:51 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v14 07/16] dt-bindings: fix sifive gpio properties
Date: Tue,  2 Feb 2021 19:36:14 +0900
Message-Id: <20210202103623.200809-8-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202103623.200809-1-damien.lemoal@wdc.com>
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_053652_475474_77849773 
X-CRM114-Status: GOOD (  10.84  )
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
