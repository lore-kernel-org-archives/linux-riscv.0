Return-Path: <SRS0=/aKF=IC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC87C433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 00:53:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49C8A64EDB
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Mar 2021 00:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49C8A64EDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C45sGfVrKzDyoF5XxrqL6Wb+t+wYNiM0uN1MkhrdLZc=; b=mUW9pTJTTz+rRBMbgHaGzl1tn
	A/HuaO8Z1gqMJmTJdCFt58ZR7LuGVHz0ef5QAU9VNOO50RMb3GrZegU4leKCy3hwEgLFK+TFnGQOU
	5X1C+ORFOKtylZrcbhIhxQnOiXS7/YC9sJ7tgbojevYqM3u0vFg8X8evHjvnsccRKR43g7O3AAk1N
	Xqp9fwlKkXGthAlqy1sOY6l+skWc8fma04nlllIdS3ThRQfuzDAdE5WB9vCGUSG+msOKAxuYWeAB9
	PGWEjB3YlBHVKqR43UDTEfjX/8ASm4fwt6j/qB1oF59uiITBUMj8oHsLX8Y+axPSLSR7yJoEqvNlY
	JpPcI6+Lw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHcEo-007FBy-8J; Thu, 04 Mar 2021 00:53:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHXmf-006MFV-Vn
 for linux-riscv@desiato.infradead.org; Wed, 03 Mar 2021 20:07:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=psXIg3MmSZHLgWfEtuYhC826SRx9B3gwgiJKrNnoZUI=; b=vwPEPuw7Cfg5sMdpN+j8UcARJy
 fdxfoi5HQmx35SuC2iWO7mQR55s4Ga/6slQ1KbmfYGzm88H6JdyTzQOK1yGovfD3h7cMvwWKlWJ7x
 IA9YC1CdnpxqLEYhA6Yldb36m+XxW4k068yNweM27tPyPCf6HGUMUG5A+zX4/6feaI/tIuIni/L+7
 5ADTtJUFG8GOlgRE62gSy+t82AmTS1A3ZWgQ1pNsDjpGL0KppVlVIfiu63IGAyI9AVwrlRqM0FJN6
 TL+ikq6BpaK4dsgp+uZdx99nMo1+Q8SvizMZln+sA1AfB/PexyOvNpyz3NCirALNzO19Fvs7MTLXV
 feda3CaQ==;
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHXma-0041Eb-6t
 for linux-riscv@lists.infradead.org; Wed, 03 Mar 2021 20:07:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1614802063; x=1646338063;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JHnXMYNTFxhiBChwfWalorTaFkKoXCCWgLzh9jJqTp0=;
 b=IRazChY+oCg3xLlJF5poNBQfduElVSerX3T3tBJEEOaSBUG0AeJlM+lj
 n5CYPgu0LX0L0CLzU/n7pnCDfdjs9EYgVkrINyOZrt91E1qeutj8vKCbQ
 1KT5c+mbKb3+4wvc09cQL+J+SST2+BG2Yh7cC9RphFb7bZXLLFYaKtM5S
 De9qYzunLx5HjC/LKzb2zbzekksp98sLf1X+zimqYga9ArnT0FnphSdRR
 saHaShiTlAe269fXIe/m8+pMbpT9PYR8ociZd/SvlX0JQPye7MrhINE1M
 86W9O4cJda53skkYppLRwyhtbEmFHomnkEPH30ZcuPyR6tFjetKQ1pVtu w==;
IronPort-SDR: Nshzdl1tfmk+uWTQT7cBPKdpeWTzqK2G5wmmTDJ5PUlOjX7lIWuR9ezRY1tAMPmpRetAsOllOh
 1iyRscgJZX3hANO0rkaL/Bbbyq+jMcfQQRSuGgyiYieO0geDNbSHaM27Hv+1b6zMmd0oqgM1lo
 IYURThfFBolsl27Qo+YtkZgL9R/SG71TwG6Vr1abM7I7+bxQXWW30OtADZVTeJLy9NVuNNvCQJ
 qs5o+5xWT0WcLoSiUgvngLLCJPvMGyl2Lx0BveqWkAf1fJINqqNaTlU5ql6NIiEWGs18FXcvYw
 b+k=
X-IronPort-AV: E=Sophos;i="5.81,220,1610380800"; d="scan'208";a="271907148"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 04 Mar 2021 04:06:58 +0800
IronPort-SDR: v/ueUt2UgfdyQDX6tnSFHp8taVUip+pXhZTriRUWhYXgRvIP/nxGR1YsEJsM17kQYK94r/r84d
 G4owshwukyh1ziBGOrYYJgnY2NPTLjFsbhRnVuYRzKHhUDM9T0ZKbH5oO6718eVeSN0GreKCOW
 YeF2ghwxoG/zkBytM+fFqEuwWSc1x98Mjt4nuZffmpR/pb1wFtf++ZTDZnCuPTnVGyr3FguXG9
 A9UtbDl6E9enwXm5uQMk+uKdZDAx5qTWF6tbDUgb8HTUhYEq9d1vFjn9tdC9aNyvCwATd3vQDp
 eaGA3oQFWqYUgYXkilHftfNE
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2021 11:48:12 -0800
IronPort-SDR: u45KEVZrHyl0adS8cedzPWtVHE3cvOMPLnWNooQAOIPvlOoOIbxgGieEBTZ2kHgaYiC8eQNU8a
 aC2NfI3/E+QeR/u6YhMKvW+Q0F0C2ME8F0ROuaovjtfzsuaOU9h05HsnM7DoKlesX0jsIfZ6Ej
 HvvX1XggDuDwoqMQHfCAnfmUsxx23lKZCINvyV3+DgTwPcvRpO2d4WH7gs/qXK+dhqvXqQZ+Rr
 7f57lIB9to9D080CgHk+OOEb2LPwWOuWqyUNIDQu75KouvDlGRW5iXalwGiE97Hg2OgcuGHOwf
 jeY=
WDCIronportException: Internal
Received: from ind002560.ad.shared (HELO jedi-01.hgst.com) ([10.86.48.105])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 Mar 2021 12:06:58 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Anup Patel <anup.patel@wdc.com>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Conor.Dooley@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>,
 Ivan.Griffin@microchip.com, Lewis.Hanly@microchip.com
Subject: [PATCH v4 2/5] dt-bindings: riscv: microchip: Add YAML documentation
 for the PolarFire SoC
Date: Wed,  3 Mar 2021 12:02:50 -0800
Message-Id: <20210303200253.1827553-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303200253.1827553-1-atish.patra@wdc.com>
References: <20210303200253.1827553-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_200744_821708_FCC0E427 
X-CRM114-Status: UNSURE (   9.72  )
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
index 000000000000..3f981e897126
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/microchip.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PolarFire SoC-based boards device tree bindings
+
+maintainers:
+  - Cyril Jean <Cyril.Jean@microchip.com>
+  - Lewis Hanly <lewis.hanly@microchip.com>
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
