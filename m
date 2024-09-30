Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 776A4CF649D
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 10:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G+aPytGw1NAoOefHY0EdlFaUKB7CWgL7a0hCuHI3YmM=; b=y/MxKXW4pKuQke
	BSva96+jJKdvVCHMDstE2WSEZWoxzPT7DGf0O5+qTBynIGUTfvmri8G0DiDVGiHktwmUgE89JnNno
	XdKqgRBl2QBaTs4Uln1dhFwKQAP9b0JJIIuxP2Xv1XI2tEPwkkiLvYEqcktJYwddkYttLXbIWMvWO
	5jDfkhsmoyBW6OuyWCEEpaA4Re3bLWwZKQL8AlBntVcAhhVrYzlJJwIhjISu3U73hgUh1g6jvgF5e
	c4hCwYFvZWCUaxRyxgArTLFDnAhn6L54sV/5JA4b8dCuZOhVCAEpq+WSLmRdPQH40p9rUR6mmvuLq
	jCkjUcr1yvuwHmky3KLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svDHf-0000000GeAq-08tA;
	Mon, 30 Sep 2024 10:05:39 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svD81-0000000Gb3Q-32D4
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 09:55:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1727690142; x=1759226142;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eznE8iaIyvpWxVm1s8pg4O+PApWejE/1A5HpNtfm8wU=;
  b=ukg/KvmVO/4/5qKzi+SzCVtFUBw3QDgLJXZVfAqvHzqQNbspHj8LKLDw
   1Ml2pnOQ1b6Krg9saGH9iyJYX102+KpQYfFZNdrN3FuMV/ZXypa/lbp/G
   tgQdxeDOUQMfaphMOzLoJKig2eNzaeovbm4BPEI72PXkApSyhgcodprwf
   QTfgFFxaiyeUI75Ms7CWFvWynFPXmnLJ5PHQ5Untg+v0+vpHP4Ij/a/Gn
   YJmOmYJgNd7wEw1hZ9uUWr+P2xASaem6selv8oiIYfp/yDj+AvnFohrG8
   AZ6MtbrQLNDoSyXCGe+KOSRrHRlPa6fTD1cV3PpGkKG1OVsat77DGchsX
   Q==;
X-CSE-ConnectionGUID: VDfGPtv3TTmpuSmsWgS4Xg==
X-CSE-MsgGUID: Swqj+S/cTSOJb/XURGQBiQ==
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="263420163"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Sep 2024 02:55:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 30 Sep 2024 02:55:10 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 30 Sep 2024 02:55:08 -0700
From: <pierre-henry.moussay@microchip.com>
To: <Linux4Microchip@microchip.com>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
	<brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [linux][PATCH v2 05/20] dt-bindings: gpio: mpfs-gpio: Add PIC64GX GPIO compatibility
Date: Mon, 30 Sep 2024 10:54:34 +0100
Message-ID: <20240930095449.1813195-6-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_025541_815475_03AD3815 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

PIC64GX GPIO is compatible with mpfs-gpio controller, just add fallback

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 .../bindings/gpio/microchip,mpfs-gpio.yaml        | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
index d61569b3f15b..febe8c2cd70d 100644
--- a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
@@ -11,10 +11,14 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - microchip,mpfs-gpio
-          - microchip,coregpio-rtl-v3
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-gpio
+          - const: microchip,mpfs-gpio
+      - items:
+          - enum:
+              - microchip,mpfs-gpio
+              - microchip,coregpio-rtl-v3
 
   reg:
     maxItems: 1
@@ -69,7 +73,8 @@ allOf:
       properties:
         compatible:
           contains:
-            const: microchip,mpfs-gpio
+            enum:
+              - microchip,mpfs-gpio
     then:
       required:
         - interrupts
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
