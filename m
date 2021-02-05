Return-Path: <SRS0=lacq=HH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32771C433DB
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 06:59:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6AE664F9C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 06:59:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6AE664F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0xUHwJrmXs6yPyoZ6ciqjQfOhopZUOfb/01M8C9p5tE=; b=SghsiEO4kowUhrQd6UUP/OnXp
	UnVyQr31dnD63cgSFLiJYLg+1+urS1sP7xeJKWDDO8lvOCatmR7dZzzV9l3+gDr7q9NQ72rRrZ2gR
	qWJIiP1FJg4SZ7OaQksHZduuuFTpx6lUUFblCNtUiHcqUsVC9Sue6KUULRq0KNdrg4C59TUqbl7xE
	N3EVor+U7oBPFIMbbotfRa5gsBh4b2Q0E33xqsDeLMj0JKPQCKBsW3vIa3PHYmz+agwq+C4ZfWUc5
	zhllmMysNJPy/r4IPtuA/T+e9s+Kbk5C5A6g1JUmZpKV3b/A6MtKxa4ZM8ugLYgVG29b5ExLPTIwZ
	24GG7GQDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7v4t-0004hg-6y; Fri, 05 Feb 2021 06:58:51 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7v4o-0004dX-SM
 for linux-riscv@lists.infradead.org; Fri, 05 Feb 2021 06:58:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612508326; x=1644044326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=GP6wzDUcVmwthNo1PAaSmaRGlhfBY1ttEBVnMlWwZlc=;
 b=rtsb4bqJ9uJ69+ybC056KHW41kMF+OMPU4fCWSAtkVHvFyEGJ5KR5oZ/
 h2T+5jZmkLJgOQ6bD+TDtl+C/O1em1KKxiEUtn6k/1bpHEYqKLYkfxJtz
 RldgU2lK2MfV+bBtgDNNFr1ppqIZvRnyShuVwW6/q0dBYWxp+BJQNoxAJ
 q7TyshbOIPKsQsyO2iXrivq2sX8dQZxQsnSEcXO/HEQV4KQfLnn77Lvav
 cZ6aSQLoPS/HlpBiUQwXm8I5QcEkZehRRwVnsA626GCQBCfxCo++VVkqb
 T7eIOyhXixR5jcLR9XfmghW6cW/SxX3c7QSmPqJGlf80hHUResjxZUEJ7 A==;
IronPort-SDR: Ui2wuTV5KjHtHrs1QatznlWbnkw5Kz9MYr1TRz7CdFPHCoH8mUXlY09M/JJ7Vi5yRWfMgTnwIn
 QztcdBTnEzunQLCza6cjE/JkkZMfcBjBBuu6BBZdHRaGe+JB7o7riLf08GAKny0GUDo5VlYgmq
 8gB720lzfforIbFpu2quLdEDotePUIiRBhmyjli91KHiM/Q1neF3vPhz9dmL2Bck8LjHNDjNQX
 hh8n1xz6+N8/cHK1LMHWWZdBmms4gQrW0m3QM3a8k30gbmAUDvnCVGq/VywoFfDW3FpSZQc4s3
 M2I=
X-IronPort-AV: E=Sophos;i="5.81,154,1610380800"; d="scan'208";a="163655833"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 05 Feb 2021 14:58:46 +0800
IronPort-SDR: 9aMEJNdIIoagsIYkjgXBfl0vLQxT3NvXRu5jq9ObJO1m4oiP3ehZslkv/OEmzpJFykbXZVp2pb
 uZV5Cg6oYV0wqXiBzy1mbErRx05MIVFhI6zEBZVcMwH6TUukXxmxMrf5fvtg24BQa/JBqiOHWm
 oyITerkZQKvEbGj7mL0wD7lTZXLoucydLg4boQ54VGjC4JR2pfQ/3xg111vCuuDn2F9GpyC+v0
 6bm5GTfum6Zbhc6SeFju2cYbbBDErVDTgQAwb3d26UPsUAg7l3dsdeW9+nGg2tJwJs+4U7TpEL
 kllJn3C5Ue0nTkMWzT/r5HOo
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 22:40:48 -0800
IronPort-SDR: CZ3zXB/kwdIQ+ZsKpZiCNeEOv7/KjRBRO0VtWZGllYILElv9jeTefuRnBlhzCUHf9W+KIa1scy
 yQ2O/larN2zHzSGvS61G+/WpiBU54Wvq4mnSVpsX9LUcD3KZ309iUt+Bqt+Vfko8q9pNeRtHSr
 f8PbCPCeu7Op9+AU+M7kAkQijZLgowyMfrzmcoYhcFTi5+u/Ir5LEbvQe/6tQPwKoJr+NDGcoY
 vZ7r4d62P/hhy0Ou6H6UVarcMWoqbqgQZgIH9NLpbAet6M7FiA59mlM9GLH2SIcamMT9dZp+Da
 T00=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Feb 2021 22:58:44 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v16 07/16] dt-bindings: fix sifive gpio properties
Date: Fri,  5 Feb 2021 15:58:18 +0900
Message-Id: <20210205065827.577285-8-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210205065827.577285-1-damien.lemoal@wdc.com>
References: <20210205065827.577285-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_015847_115875_2F12A8B3 
X-CRM114-Status: GOOD (  11.08  )
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
 .../devicetree/bindings/gpio/sifive,gpio.yaml | 22 ++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
index ab22056f8b44..211869d30212 100644
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
 
@@ -38,6 +39,11 @@ properties:
   "#gpio-cells":
     const: 2
 
+  ngpios:
+    description:
+      The number of GPIO pins available for the controller implementation.
+      It is 16 for the SiFive SoCs and 32 for the Canaan K210 SoC.
+
   gpio-controller: true
 
 required:
@@ -46,10 +52,20 @@ required:
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
