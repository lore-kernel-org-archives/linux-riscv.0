Return-Path: <SRS0=bbt8=HM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F41BC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Feb 2021 05:03:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6438C64E53
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Feb 2021 05:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6438C64E53
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZBezENa7uLTJEpAbnXHrjRpvltgAEHRnmo2Tsywwa5w=; b=A9PAje0E0P483t8MzVQrxBa+U
	+sVBqJB9wX0gpn8csU7l0f7UIwHuqh4ZA7NhUgSDlRNz5cHop6U6lwhnLFKvyx29y6Uy9QQIpABie
	SN177tML56qBohiCec0+QE8u3HpbsmOVKj9u4WOfam8uNN/sUypCKSWFBiU86AmO3yD3JMp2A70Do
	2v/fMO3YlJB6c/zGacEzj0YEBmG4cU1+hNV7U/ZVSuf1AshZA8U85HEKB04PeaA/ThLA5CoUaTRz/
	lqf2ZIP43A17iZVMeuDPRzc1N9iXzdW821dyPXmTqHJEE4qAPHpu41pevzYJ3ZkiAOBOoqvGVeQEe
	WVu1la2jA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9heR-0003ND-Iw; Wed, 10 Feb 2021 05:02:55 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9heO-0003Jz-24
 for linux-riscv@lists.infradead.org; Wed, 10 Feb 2021 05:02:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612933372; x=1644469372;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sry4Jcxj7WaCMHpIVu5N/bY5as1f1P4twJ4S9BPW/Dg=;
 b=gu3QCde96DoBmP1gbcHAqFF+f2qU8MgoIpEsGDJRFGleurhdinesCrOQ
 k8CcfUJ+KqiEnJN+ebG13T24ib/s53YYFt43zN/sHUyhIdeFWu4RmT1S3
 cRmt7hRHd/cCtEqcGyrp47CYrw/ASyzypUdy5WXH0hohP6dFdGMtyPRV4
 Nvrr6CSSxRwnggbA3sSrqMNiXHpqGaZtvpKWsz8iTAqbtHrhln3Yo4I2j
 qnMIoWCpRIGoZKIPU1FTEkJ290wiD5bH/aTZq7qU0wyYIWtSJM1g4Dkkg
 c9h/URzAMbt2bf+6Y7mvV1ApKkwyjyBCCLUPJq8lz1y0hNb5VjqQbFroH Q==;
IronPort-SDR: Tfe/AjeQVw2JNFY9x2pZxZliS0h/pmyNAJy70W/PawZciJId00U3G1ipCoyIxeILBGPIxJtuWL
 +YTD33DGxCSNy/lWEztU5/cF+a9+ZJfsdCTnPElrX5j6Nel8iZP/OnrIR0d1hQGqXQdOahotrC
 4sAN3bp/c9Iyjgd5BObILlVu7XBf6j/kzIJdBn0mH7RXFvipQfuip+wuhM/LJloXlkHIkqEOyR
 jPuN5brKi7sJID50ysxYwFeZjNI8xz1DIEkv9ApdP8qTAd2rP3Y7JrSXqvXQIg1nN2rGbEbNHd
 JUQ=
X-IronPort-AV: E=Sophos;i="5.81,167,1610380800"; d="scan'208";a="159592693"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Feb 2021 13:02:51 +0800
IronPort-SDR: zt7LcHqcGhxkS1ZQphtzSrIoJ+H3OqeJESozqyqsUUW58tcxXqht7uHztiLsIRNdeBH58oLxLd
 vcxqXaMbJJ56KKMSkJWIX2fjhgtrvDAxJ+wtRLxyw/n+E+RDXZ7BdbyhWhBnJac3bU+IP2DEd0
 PUUZxLVhQ1gGGWYhT+uSpCu0kfXQLAjcZI+ZEhahTcHzKw+IloMAqQxkWUzGLM/3c7ytmuPGJ6
 245aSp0aYb0yaqybvfLEApx9rs6Pz+glGFmk54bC3AWzEYfwQlBjHr6chiJLAziRItUBuMhTxC
 ATNqwR5zqHO80CkPulz9Fc+D
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 20:46:35 -0800
IronPort-SDR: ZkWhq7eyBqH0CiFyvfcATyAvi5PsytPdB4Q14RIyK7YKQ9gaNke0EuchVMUClQmRP0qpLq/Ouz
 Bhp+AQPY64nfqLiuceuRwg0RY5/iDapD3brwI8YeEL5rtX5SekRylxuIWGXU0+psGexZBHSQTH
 ZFn2TLcdLXgBiaB8y/NCwkSeUrH+/4xiv8ztQOw+zT4DWvn33xZwx4P2OTjvB2kZ2YgWahQXzE
 4lGUCUGO0NbRykNeYXtfYBEXIqZC/m1sJauN/Z+n4PNbcrsKI5UB9PpL/2xkEuqEIh2TbFkvlO
 hp4=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.72])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Feb 2021 21:02:51 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v19 08/17] dt-bindings: fix sifive gpio properties
Date: Wed, 10 Feb 2021 14:02:21 +0900
Message-Id: <20210210050230.131281-9-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210050230.131281-1-damien.lemoal@wdc.com>
References: <20210210050230.131281-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_000252_344362_D3401EB4 
X-CRM114-Status: GOOD (  11.41  )
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
