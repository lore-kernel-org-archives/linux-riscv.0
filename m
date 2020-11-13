Return-Path: <SRS0=nj+O=ET=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F08C56202
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 20:26:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C3CF2078B
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2020 20:26:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wHv/V6d6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="oj4aFiYm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0C3CF2078B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OuIjOUAHamO4B2u0RcUJemp1ExAMSueoeb5L4qf0zWQ=; b=wHv/V6d6QAP5biHJPnwiFV/U2
	BdMi6fPKHueNoT0E3etnhNj35DLXVQeZtP97Xq1kJecRmMjWAaXs2cB9XHUqa+zrfymbJq3Ztot5D
	ZKAngjORjoAQA1PBxOkWMUtRmLeObm13O+T4Nf2OQYbKNSbMjtnDth5LG8Xi5znAv8N3FCmhoihSj
	1Xx648JvdPARRbw5YaamKyu1FgDssg/aK/SLw8An+nvBU8p/DLJxqZzPT3ds9TA543Ovq71gNQnMU
	AJAJ411Y5CMd0Lvep0cB+nk7G8q2gxDFE0GThVm/Iu/pkYbUrHauPwJovu4Orwtb5bgI54dN0H8k0
	b1cnySF+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdfeS-0004vS-HA; Fri, 13 Nov 2020 20:26:32 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdfeG-0004qS-9J
 for linux-riscv@lists.infradead.org; Fri, 13 Nov 2020 20:26:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1605299180; x=1636835180;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4onK1rRbS8jJSGpeiRqURxgT+ayGvncdcCs3sC7rsKc=;
 b=oj4aFiYm73G3dYxdY4tPBGuSiUmsmfjnBwcG7ukk3KrloKX347M8AZT9
 3kJWzqZQpR2CKnsUB1nSe2R88TFaGxBo8c7NL+EGjQWLljIgXK1G6Cdln
 wkbTJuT1BLFW+fU+td3AcRRmaFHRAoyiCBSi00ncehVpXbgZgMdWr+1/j
 X78WV98SShweUQRVvwtsvgaxM3kD4uOBUOLHFAhaTP7EAGtZt0nM5jKuS
 Gcm6KpdhWpANGB94WVRwVUHqv+qlVaYPeX5BfQ61tSuE9ohWP1cEC+hW4
 +Jl8A1irMoBp4sXG1paT1XgYYOc/iW2pCb/jkROcictzpmlk3yglojksJ g==;
IronPort-SDR: tbGOoysGalGKakygtgNp8VUfzf+0ZTQqBz6Ny1n6OnrtLQqkELKVjVMdBVncVvty492eJJg+zu
 K4roHN0BzP0s0J2NEBEgvOttBXchXRj02T03CVD5LgnCxY5KiDEK4TKSiOKwWixv3POH0Y9/Wk
 vzUj3RIX5ywRSL+L0CqndcVfWCDkX0kPbS8utzcA+L2b/KPs0fK6Dlhb48PhQTh5sL/h+abAo1
 yr+3RAq1p00vvTmlXkufAOZPWoRikKhCSlTbCkrtHWdunb+pN97DyFXqmkVSFbvj6sZPlPrtZs
 +vk=
X-IronPort-AV: E=Sophos;i="5.77,476,1596470400"; d="scan'208";a="152497376"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Nov 2020 04:26:12 +0800
IronPort-SDR: CDf6O59lsIY9C4csXe3WhN3WPM/N07m5sxJoEtIGnk8Yaj4oofEZCoIF42q8gOivnKD+xjcvOw
 aGuN0OP843gVLnnT3rkU1nFY88Cs5VM7cqevu9bNbQyK090gsf+ndsQW3haiUwL9DGLtiL6FGv
 oDD/0v1R3IIW6IBEG/C5JVBZh5xKNM6211k2ulMeNWsAnrfNhw+E8mVyPro15wIBocPuFFysAI
 TH//pG8f3ou/CzOb+DflNeaO8oQud2uEZ7P+McHHBDf8ewvr7x7y0pp/6zcWpKIozRE3n/BwVr
 81ekW1/lgGF6ulV/lhFBnYzB
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2020 12:12:09 -0800
IronPort-SDR: KizZEy6ZdGwiZ0gn0B5MSBrmfHZge3FSxnru7uCGW+otaD46XBcbX5wGVpodqI4061fUHImeVm
 dnkOAEsqbLvDSb0MrfISW5W31h2lmeN06xN9QftAp81Ly7EJstudWJ1J9UXEOLvXs4h/SbHXAl
 I4Xngs2gR3ADZc5x032lIqszDYaQ8y41SkDAwsRHKTiMBpPHJt6jtOSKCG7upyehsVxyAIi2oO
 KN0aRzPluj47OufF/B+MzRQae3CMztPs+OePOizPuIiacYUFRoOJvmmKGIfkBvV4I7Z6yzE3zZ
 V6w=
WDCIronportException: Internal
Received: from usa003372.ad.shared (HELO jedi-01.hgst.com) ([10.86.61.22])
 by uls-op-cesaip01.wdc.com with ESMTP; 13 Nov 2020 12:26:13 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 2/4] dt-bindings: riscv: microchip: Add YAML
 documentation for the PolarFire SoC
Date: Fri, 13 Nov 2020 12:25:48 -0800
Message-Id: <20201113202550.3693323-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201113202550.3693323-1-atish.patra@wdc.com>
References: <20201113202550.3693323-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_152621_267978_7E287428 
X-CRM114-Status: GOOD (  12.09  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Cyril.Jean@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>,
 Anup Patel <anup.patel@wdc.com>, Conor.Dooley@microchip.com,
 Atish Patra <atish.patra@wdc.com>, Ivan.Griffin@microchip.com,
 Rob Herring <robh+dt@kernel.org>, Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add YAML DT binding documentation for the Microchip PolarFire SoC.
It is documented at:

https://www.microsemi.com/products/fpga-soc/polarfire-soc-icicle-quick-start-guide

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 .../devicetree/bindings/riscv/microchip.yaml  | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/microchip.yaml

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
new file mode 100644
index 000000000000..9c227fee0b9c
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/sifive.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PolarFire SoC-based boards device tree bindings
+
+maintainers:
+  - Cyril Jean <Cyril.Jean@microchip.com>
+
+description:
+  Microchip PolarFire SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    items:
+      - enum:
+          - microchip,mpfs-icicle-kit
+      - const: microchip,polarfire-soc
+      - const: microchip,mpfs
+
+additionalProperties: true
+
+...
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
