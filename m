Return-Path: <SRS0=3nDB=HL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B92AC433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 12:30:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AFFD64E88
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 12:30:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AFFD64E88
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZBezENa7uLTJEpAbnXHrjRpvltgAEHRnmo2Tsywwa5w=; b=beJMziyosLncUs49xR/Y9KT3A
	ViXGEdM13SiLfw9m2v+PRxcE4kV4xT9X/mHWM8ALRD+UkSm5bEFVcD/I17xLKjeqg00kmQcpASwSU
	zsD/m6K05xscxf6HtHB9z2PCijzDA1sj9KGJ1sQbp+l4eAew7MLidaAyNVuFiVc+C1eJIrCZ8Qc8S
	WGmUosXYjXYEvCvhZfQ30dCwp2rgYML7bGhRgDExCVoE0BCqcnlghsXxmzk9U00ofsmyfGLcs6UJ+
	rL3S3bIROc7XBebc3upVdmOZHh2oFg+Xq8e70qxJ+8peVFK3ExBci+yHMt0H0hYgmsQ07J9ErkYLk
	Vfisnx+hg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9SA6-0008Aj-Um; Tue, 09 Feb 2021 12:30:34 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9SA2-00087n-8P
 for linux-riscv@lists.infradead.org; Tue, 09 Feb 2021 12:30:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612873830; x=1644409830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sry4Jcxj7WaCMHpIVu5N/bY5as1f1P4twJ4S9BPW/Dg=;
 b=i/VJGKztFw5G5nKeaqRv0Ev1Fd1lK3AeGQWWCxJCsLztprfDOuJYI+k+
 WJ3RdE9DRrfKD10jxoALkrRiNWhp4XxjfXKyS9gAfFJ399PSyY/zsNpON
 we19F4LODHPzhpzwXCZYw2N22CwrIsYpE6GNt+PKafHvnQ3nvlesY12mm
 bj2Qm7HrjK6Pi2QK6mh9R75fYn791UCaxIBru+D9zHhKWrtsVBjOuknsk
 AHC4jJkhUuilquYNK7wT3hiQWmMg/snla8Me5SoRx/96LrDTR6AqN3rVZ
 K31JWzzMEleIaQb1xYSqreDQjSrn8mB3Z6bV2Tm4PZ129YakgBPOIU3ss A==;
IronPort-SDR: 1Qf5cvrU4qUrR1AwinDIOmX5wdOqdkeF6ioLQbY8YqEhZ+n5HQjwSwLai5HPVPRMgIt33udt7N
 OFpxFfGO7dCnQZNRUwTJbq+83So03MEsC39TyXxtOksFCIubMlhSIYn1ktzTGEuxJMOqmPlCNx
 BPR+U3SBXIhvpIPzdcixH8hbFd3hMfe7SED+7cnPImJvJZOZcguKSgdbt/+l0ctz1ru+3KbJRr
 IamdCuVHQclAraWSCCEBYw4LyyFKLMtbOqLHbpgygewMwHtFcxN99AQYAjkRu6JDGLBZsowp6i
 UDw=
X-IronPort-AV: E=Sophos;i="5.81,164,1610380800"; d="scan'208";a="160707559"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2021 20:30:29 +0800
IronPort-SDR: uoGxr3/8mtZrmnuWoD3KJelXR4QLcloW7wYymgmyDBd0otqzKGNTt1zod9hO0HpP5295XzibDC
 Y53ybAhELe9jkwqb6+JOjatsUqNbaNfw06zLN6chzIzfkbi6J20QcEW71zzfADcfdFk4cjOiQY
 UAUTf8NgZf/8VB1uSkn5FIt20AIcJsdHMo5Ha9sfOtv0EYNPAE0NCb+Hf+AqHsuERMfqNmdkLv
 2f7ozzu479kdXst8gs1M7FIL9iOCrFtyh+yAHVBupnrVWSc7i66/SyTMdPvt6s70Qem3i1Wf9r
 ir4ZpmT6gbpI/BSg8bnQ0zh9
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 04:12:23 -0800
IronPort-SDR: RBC6pRxpUgQBA2M/aLZRapfqYs1SiBE81mk1IX9qpQgLWz33b9JjzwbMomYFijp52OKCvywyZh
 TAI4Ne2bb8gGyvCLsAUiw/Kd57+kQo4aHhTmNEjGoCcVCDRZT2K+KE+0qDCiGKKB+4NyztfQpa
 zns8KRx3z7ao9gpvP/TsgYebIJSiuQMR1eb1OUmPy1F+E30uy3hFD3CiVZv/9tWy6a2uqwbn0f
 aLb/qB1hBu7z9gJVuXqWsJkyfWMGhoqEs2wbLR07fzqn5Nqm3U7M4jnIHRtqtjtcGP7NM0kQpp
 lBU=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.69])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Feb 2021 04:30:29 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v18 07/16] dt-bindings: fix sifive gpio properties
Date: Tue,  9 Feb 2021 21:30:05 +0900
Message-Id: <20210209123014.165928-8-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210209123014.165928-1-damien.lemoal@wdc.com>
References: <20210209123014.165928-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_073030_472392_7BFE42CB 
X-CRM114-Status: GOOD (  12.59  )
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
