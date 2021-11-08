Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40078C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 15:07:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1373D61027
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 15:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1373D61027
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pXygYfcucIXmnWFdTWrnUfrm53HPfyAISaLvO3/7SZY=; b=sOpbwCrAo6WVYr
	GGjAGml2E2zw8+uSFJuNYn9zF+T/wkOjNYPjMRVtZB7yJ0vlqXESm12AmhdI9c9AB1UZKPrQ6sR4w
	08LtnIVftSWv/yBHUflPxHWBbH1EnQ25nMJgjGSUvo5ca1pW95gcxpbt1UPOw6TRU2CmIw5Rbg05H
	Ct6aAPISZ1cvzpJPrL1C0qNaLTSM8u6QE/hldpxY36Vdjzzwey4O3XOAD+/dFNMpWXDUuHF/WmXup
	tYl2mxlRox+iQr+l2YqzeBDmF2qbX76a+UtggDT0YshRSwi0Il7pbz0XYelyMVLNEeFYyRqoVSxUi
	2l3C8tVh+BP9XIONbvVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk6Ef-00GmIK-SC; Mon, 08 Nov 2021 15:07:01 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk6Ec-00GmGw-Tc
 for linux-riscv@lists.infradead.org; Mon, 08 Nov 2021 15:07:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636384018; x=1667920018;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/8xzAyxtMDUBGNXPY444ukbY+UQvu68Cu6iDF9Q+mi0=;
 b=TL23d7cKYjfHyGkDO3hz2SguJPmnNY7WETXT76/J35dFrnQTQ/YHqs8w
 50rQwTwX3qSl2pZxE53zkt9MTS+kgKKg8I2fADCb3Hx2l88DT+V7ChRoa
 0dSD6ZWC2gZ3c2ZJPTfEEtf5+/cSmzUlJLi6qipJ4sxjGl1veDEV8pDVt
 vpze57tYq2JVOEHXEZWyPiN3hYY0A38SUlN8bKy60MYieD0o4jgMRmMpk
 Ea54zUZii4KzdJlP+dRhwhwmlsKJONOVrVY0OOsLy6gfPdwqyrffNu9gi
 JH0FxN58Wdb5AMVrb2bO3oqg91mwZdRAMLsI9FLJxGP9zwkv9mYAPJY6v Q==;
IronPort-SDR: Iy6Xl1zXJ9HR9cVDxBTocnJWAGJp5D3oysgOgLBOM4QnpGCKltOfrvhlpgQfpfbntw5wJ2FryQ
 2/nRrjyVce1pSRRt6JE71JY+GJrVJdsaz4TgWQFxG3i7QDiTfMcRNZYeJFuIFNc0fHVXVVIj1e
 YwkeDWoC0JDnvvv3tla3AQ22oBUGJ1gtrs6jZLSB9fqhs9P32CbQkdrj20rgoniAtjj7w7ROpw
 OzTcZlDuv/wXcF0IIuTpvsubYg1u3Jkia0+ULI6Ww4wnNa44YXNZk5ei6kS4CJt41cYTrAxo3C
 IZe83BoRQEVRSduDsLFYTEmR
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="75727206"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Nov 2021 08:06:57 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 08:06:55 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.14 via
 Frontend Transport; Mon, 8 Nov 2021 08:06:51 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <lewis.hanly@microchip.com>,
 <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
 <atish.patra@wdc.com>, <ivan.griffin@microchip.com>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-usb@vger.kernel.org>
CC: <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
 <bin.meng@windriver.com>
Subject: [PATCH 04/13] dt-bindings: riscv: update microchip polarfire binds
Date: Mon, 8 Nov 2021 15:05:45 +0000
Message-ID: <20211108150554.4457-5-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108150554.4457-1-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_070659_043730_D1A0D873 
X-CRM114-Status: UNSURE (   5.54  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Add mpfs-soc to clear undocumented binding warning

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/microchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
index 3f981e897126..1ff7a5224bbc 100644
--- a/Documentation/devicetree/bindings/riscv/microchip.yaml
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -21,6 +21,7 @@ properties:
       - enum:
           - microchip,mpfs-icicle-kit
       - const: microchip,mpfs
+      - const: microchip,mpfs-soc
 
 additionalProperties: true
 
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
