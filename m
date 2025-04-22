Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1562C369D1
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 19:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Leiu1U36Iauu57O3wScj3SQCCf4kQ3ktue2RD3y1l3o=; b=ewKCkjjCzWZAVK
	ZD1Vk7sbWobfSOYursIOPsQ9IByGvG2suie1SjRLVsvHMV+F01xkvMaXeM3VGO72c9bLgyhldMaU6
	Gmb+1bqX9DpfIRXC8kBiLLSZ2l7PxdMqS/SX8ZeGHI+p7QXYikt0VKey3xEq/SDCRzpVhL4+LF2RY
	EcTmYMkX4acASPgd3sZAGIt/fOJoW8Y/2U9mqzYMiKEiIWBX53CIm3r4iR7gGoCqApiYuUEAJRLWz
	9Sy9foSVHP300FL25DlLiCTzxSMqcz6MuqAc4JIhM4Mqry0+sXlR6q9BRh8dyCohBtjGXOQ+6ynLq
	S56p1iLJB3ByN6AXnmqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7JaU-00000008LZL-10C6;
	Tue, 22 Apr 2025 19:47:22 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GOy-00000007tI1-01kE
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 16:23:17 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745338991; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YmpFT+Np6DaKQbeE7Md2qEzIO0UPN3esqWkXLVnI3sRUlNxMOyVYOnAD69iSECFmR9ykf4Jif3ZeJlBs8FknjaT8yBZF9A72+P6EujpYCynxPiqfgnyMjqUC64YRBVsLk6H3OcqWY4N1sK+1wLYn9Zpc7Uuz+mCNCxG5wpUZRCg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745338991; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FWFt3dRo5BXi34AencVAC8YNFSNDAd4deu1+bkumoOo=; 
	b=CnwRcEDA8XzrUNMWL7DrvQDZ2Ls0daxblvRkuDTNkDyYYTIXGC8Eh0ai+T3P1IlUIjxqHDgdHu2V8uOHjDJ5wCdk5zQQHNyDC162irCI2ESywAvMhxZ+6r9LatU13IrkTc+Jks3ipsfsoIEP+hGF0D4r13RYFq3uo1ZZcB0Ls7Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745338991;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=FWFt3dRo5BXi34AencVAC8YNFSNDAd4deu1+bkumoOo=;
	b=qXIaKsOypDu1rzVoxBRDe3LX4GSk/+dh8tzK6qwDEP6cazYGBhPhlthnfQ62e2Qz
	pXUbsvqAvwEdnWf4RCn+6RvDBfUijhH1868/eYFHy64hF8Dq7yp8ffgLsZ7oWCHuTML
	jCGS2ZMEFpoFEgMddXUfAymXv1DZ/tx4ycVHvq/PxZYZTbLYzm4wpEaYrtKSGERf1wU
	yRcKG2srqQXvDTnwfRKF6XDnRh3Sf/1dWMQfpvFQ03qU9L78IAEUt8EnORnvf2uOzcw
	x9HuyBHpP1KFsv4cmWxZUnQD2wZdACpQiPZwONSRt4w/zXnMCQfn4f419kXa2HnC93k
	twGwpGj/Pw==
Received: by mx.zohomail.com with SMTPS id 174533898976779.42946038180173;
	Tue, 22 Apr 2025 09:23:09 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [RFC PATCH 1/3] dt-bindings: pinctrl: jh7110-sys: add force inputs
Date: Wed, 23 Apr 2025 00:22:48 +0800
Message-ID: <20250422162250.436169-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422162250.436169-1-uwu@icenowy.me>
References: <20250422162250.436169-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_092316_099640_C4E04608 
X-CRM114-Status: UNSURE (   8.52  )
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

The internal inputs routed by the pin controller could be routed not to
any GPIOs but forced low/high in the pin controller, which is a useful
feature for some input signals (e.g. overcurrent_n pin of the USB
controller, which needs to be tied to high if not externally routed).

Add two properties to support forcing inputs to low/high.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 .../bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml  | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
index 222b9e240f8af..d793290afdd74 100644
--- a/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
@@ -46,6 +46,16 @@ properties:
   '#gpio-cells':
     const: 2
 
+  starfive,force-low-inputs:
+    description:
+      The list of input signals forced to be low inside the SoC itself.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
+  starfive,force-high-inputs:
+    description:
+      The list of input signals forced to be high inside the SoC itself.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+
 patternProperties:
   '-[0-9]+$':
     type: object
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
