Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24AF5C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Mar 2022 12:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CLx+rMtAEnsftpxfKKezfJWKq09H23rpzefXdohMIkI=; b=xLZD42t1n2Vj9Z
	f5tXura3Qpue1WUa5d0LlNO/d3ocuvZcTctx5Ol22R/xFQ2gj/ceBbI6agIrA4WZFvu1aySIGJHPD
	f5/AOXd1X5crTtQ7zzsJ45WZXUdOpHYUaH8dLJZ2rkt0NiJMUUktB7Fiy5CsQrufqACkS5pt0ghYg
	QpyEpdzKz+boV0tdO99lFkgW6qMXIldeWyiCa4fNPir4rxhCXV5ozeXzWN7IldQR2psjbdgTaZt48
	MpEq8zHsjjuyK98edORbYf2JHXZuD0skyTwxQ6g9Z6Pxq1YaynSgQR62XRDIYMWju553r1eaoUAQ8
	febSyGGwSWDPJ1SSN3xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUotK-00FwjY-IL; Thu, 17 Mar 2022 12:06:06 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUolQ-00FsvX-46
 for linux-riscv@lists.infradead.org; Thu, 17 Mar 2022 11:57:58 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 972CB3FFD8
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 11:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1647518271;
 bh=rNPhuRf5ngVysv5h7hhTqAiAE83hQk2gXfYYF3Wf2Pw=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=u8dLCDC0xKcvKaf3/RlUI+80mtWvXblpdrt3JCIoFm5+eGsacfnc+Nz6+uoF2zen6
 9zxTasmqa91xGLa8dvN7QQAaTgAUQCpvowJP3c3Ty0y+mhtdPukdeiniA5odDBDGur
 UYJtUTMAyLQbHGGvis0MnGQxhP04NRT9pMFepv7xF0OEWoXtYzu1KhyUr9pMV2NU60
 gOBpxnXmA5OEw41cHk+PDGyXKtOD/vKko7K5JRriqpQ3OMP9TvGoDTOclCYCzisiy6
 RhEoTFtwhJg+0bCbICuM/CMaGFg8531GIopRkWkMd2k/ljxJqOASyaWBFCr12MMFDH
 QuRaTWPHlO3kw==
Received: by mail-wm1-f70.google.com with SMTP id
 o33-20020a05600c512100b0038a1d06e525so4197507wms.2
 for <linux-riscv@lists.infradead.org>; Thu, 17 Mar 2022 04:57:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rNPhuRf5ngVysv5h7hhTqAiAE83hQk2gXfYYF3Wf2Pw=;
 b=t1/i7nzIGy1JRC7fLPbTYGAyKdnhYtFRBXnhRSDZZ6yr5pRm4XwDe9vaKhh+VXsNDC
 vslNztqtaagmgsJP1hc/m8HmKJeAnhDPybUQn4CQ7o0mIMekeURCZASmLkBqaMDFF8uL
 5fOFK6jCG2ewMfe9osLgwOPXoKZ7quM7byJHLJPXjiyxP/aYJcZsKSVxPg6G0qAwavgQ
 aap6PWmaZOwSzP92jZbOaRFSk8TQhJCpwi6HM2UWR3g9/+4wiGuJ21LXIWSmM+vC4Q6F
 HSlW0aoU9TXttMIpI29GjesdpnZKYSSP4LDkTtKGXUHq5C3vXjjoohSb8xYBcve0P4Ev
 f09w==
X-Gm-Message-State: AOAM531NMyRo6TYmfeluq7hIfx0YomeE527Vc04Sb/pml1KiJGvjA5bx
 j5vjn9zqLraWTBsdD5PBdtT7z2wxLgURZz/T2dAu6avKHjOius4ZVMqQ7dX9OV8EakzB2CQPgj3
 N9+ul87jZ9inl3xxvyOlcC4E90wXrpV2jI3pZkpAfcwaxpw==
X-Received: by 2002:adf:f943:0:b0:203:e832:129 with SMTP id
 q3-20020adff943000000b00203e8320129mr2873028wrr.626.1647518255822; 
 Thu, 17 Mar 2022 04:57:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJWLmgNrQUKThJV49TI08A7H7CIaB1l7x6JOg6T/2nRMoUdn5TzspKyhMYRW0dfNfwamk6BQ==
X-Received: by 2002:adf:f943:0:b0:203:e832:129 with SMTP id
 q3-20020adff943000000b00203e8320129mr2872982wrr.626.1647518255579; 
 Thu, 17 Mar 2022 04:57:35 -0700 (PDT)
Received: from krzk-bin.. (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
 by smtp.gmail.com with ESMTPSA id
 r65-20020a1c4444000000b0038c48dd23b9sm5824900wma.5.2022.03.17.04.57.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 04:57:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Halasa <khalasa@piap.pl>,
 Michael Walle <michael@walle.cc>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Daniel Palmer <daniel@thingy.jp>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jason Cooper <jason@lakedaemon.net>, Paul Burton <paulburton@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Birger Koblitz <mail@birger-koblitz.de>, Bert Vermeulen <bert@biot.com>,
 John Crispin <john@phrozen.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sagar Kadam <sagar.kadam@sifive.com>, Suman Anna <s-anna@ti.com>,
 Lokesh Vutla <lokeshvutla@ti.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-actions@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-oxnas@groups.io
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 10/18] dt-bindings: irqchip: microchip,
 eic: include generic schema
Date: Thu, 17 Mar 2022 12:56:57 +0100
Message-Id: <20220317115705.450427-9-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
References: <20220317115542.450032-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220317_045756_321114_C55B65E6 
X-CRM114-Status: GOOD (  12.52  )
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

Include generic interrupt-controller.yaml schema, which enforces node
naming and other generic properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/interrupt-controller/microchip,eic.yaml         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/microchip,eic.yaml b/Documentation/devicetree/bindings/interrupt-controller/microchip,eic.yaml
index 50003880ee6f..6ef8632b3f5e 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/microchip,eic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/microchip,eic.yaml
@@ -13,6 +13,9 @@ description:
   This interrupt controller is found in Microchip SoCs (SAMA7G5) and provides
   support for handling up to 2 external interrupt lines.
 
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
 properties:
   compatible:
     enum:
@@ -51,7 +54,7 @@ required:
   - clocks
   - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
