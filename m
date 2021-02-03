Return-Path: <SRS0=OV2N=HF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1D6C433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 13:00:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84AE364D9D
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 13:00:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84AE364D9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gswnWoZbOBcUMQ34RrcIhomCllgFBG8MrmOUbQlcNqg=; b=JN7jzdJHTv8NAlF1fy99mbqT8
	F8xDK8j4D55B1EDi5oCUCWZzeyU3IkJ4rDjqI669w2aClFz4HyMHhqAvAb15AsWrUFmi/Xo32um2g
	jbHk3v8ZirzBgJ0GP6tg7+AwDm6Q/lMk72hYGwrLBIHs2x1WT+ahy8F7Riu/WdU8XkxVHvL9y+3Ep
	zqkC8SyGjbDvZYURmraAmcYrA3H8WWQHICarLrj7d5GI5f+tMpM8E0mqZ1o6Zj1PDsfVPA5b9djYl
	duRtRiPTRCLusxmNG70mC+xedDDIAgelS1WdQfv7ktZbvNj9kV2PicOEsYzO7e6dcnAiYaTy1BL2s
	Gwn8wvBDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7HlH-0005v4-44; Wed, 03 Feb 2021 12:59:59 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7HlA-0005rI-DS
 for linux-riscv@lists.infradead.org; Wed, 03 Feb 2021 12:59:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612357193; x=1643893193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HnJ883zL+t4xSM63wnXK5D+H6FssPdmgykJIZOwLcLA=;
 b=PL+97wU3PhUWKNcYtKrXJouttqWXEZMJlYhIg9gUeW4EgasnWLzzMogF
 6lUkS2xA/5wwAwdBa1tiB/WveoFKa8xSfOft84rYPz7g7Hz/KXgtJpoKq
 zp9YBbEnD/nEFb8UTQZkzNIRRbtpk3c2d50YXyvAktLlVpk2/R+qSaSsS
 iuy4g7QMqf4GVVY0d/kdnkQflV0uUckDdAXLm+4qF37Gy8z5hi1wLiqDX
 /HJtEVCmpEWinHon9qyGW9TcWs4Qdv7HgqAmWuvnaGsB7xczi5re6+Yyx
 X/wpekHhXKitx7D/cdG2+c/3exJSOllOQrcbZWx+yCmyRRG/9tnNlsFRP Q==;
IronPort-SDR: FjRFCNgLxMcW2BiB8aiO0PYzh/EWCIa8NQzfznt2Ghe1Lv7pBG4iXbmjPqOAiT8A+Kc4k/9uUx
 dQ8NgcDk7VlZq5DNNQj/nPN5FuZmg7XSwJTkgwuzr6zzemLnDWaFjOIgdIIIIb4fKwq6QQwS43
 PrlGX7LmR5KSMzF+QlLKreADPpfmMjdVqdmWA/kJB8U4ehhNwWI6QETuBnzkqCyfUZJU6/IHrA
 Er/6b8/EblBTTWUCP1GR70X2kvOk24Wew31iVFWbV2wuCBbGO/qdcU0ym2Jec7SaQg6GMa2vSk
 8tY=
X-IronPort-AV: E=Sophos;i="5.79,398,1602518400"; d="scan'208";a="160202883"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Feb 2021 20:59:52 +0800
IronPort-SDR: RLIAzv1pW+gGisdIaGDd89abeKMmCWTngfYeHZt8weRl39JIGUK/wFahhqj32gFdR1Rb8Z6gg4
 pTqEkDMATtPqRwwMjepvCPV3gevv4rmQCRDN8KZCLZ+i5xrRXWOvgXQmjs22PlXzRWcH8MRrIJ
 SQ9tmYDkLafkXjfD0tE7jP8G7Ak2COKY3+oZ8HZzgjOZaPWE2SLgSsFqUxGRjdH+lScW1uSxFa
 M289FpAatNjU6x4Dzm3nXpf7P8dPFKEMknyGfN4KvL9CDDOxu6KMDFgaAgxm5/9gv1uwfyKKCZ
 z6GcnzdYnPkwsnwFyl/aQ7SW
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 04:43:52 -0800
IronPort-SDR: DVW3tS8qC0S/VzUthlpvCggHMkxqZJ/9h6ezOmOBapR2o8TSvvWy5DRP7p+2GI33CWp4kLgjrJ
 x8KEOCMliKZLP/6tHyJNwYfaJGX5B0Uc0ymWMoc/KCP9JVF+1oSQOXQknlmEr2j/roPhqQKBSg
 FF8kcEK/eQqAcHJkwtMHeFNSadMYq5wkDvjCLq5dYNKju5uSZJtkiyaeUSEOE/ear2uPRAncxL
 2EY7TkfGAJScEf6nN9et0az/qZ4V9cEccyU8cmQy8+KHh9ZQXT2Zik0/EzESf3SSc84EazC3OG
 P1o=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 Feb 2021 04:59:50 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v15 07/16] dt-bindings: fix sifive gpio properties
Date: Wed,  3 Feb 2021 21:59:04 +0900
Message-Id: <20210203125913.390949-8-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210203125913.390949-1-damien.lemoal@wdc.com>
References: <20210203125913.390949-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_075952_659730_51D57A11 
X-CRM114-Status: GOOD (  12.17  )
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
