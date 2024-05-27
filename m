Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52901C25B7D
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 10:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H0heQg3YK6wdwZs99qOu/81P/2EglLoNKCRdOiVSTo4=; b=jYkwAyUiCz6pTe
	Cwggigr9ihdwJCvdmoD7AdaLJN57VLyhHLDOCzxg7KEBOG4YYkXhQRZ9bUf9o1r+zOPz103l66EVU
	7CqhfqCN0lJzNMX+StgY5QwfQe6+QEZgLzMXJ+g6mc/8F3AC1GKW7sqTXMPE/5hlxXqxTFXM6BTNA
	MdDy09KP73KSXpVuQ9fgKmg2cEDtmBOCUisaOGb4Lkv3LvdTDm6qEZi+MbQ7wI1mdnZBcxJ3AZHxo
	t2vZmRBR831MY+iLOxYKbWTueLqza0Jeek3ZiixJVcfSwZ+VAwpwhJUv2KcP4t/pgSA4LzK/kCLE1
	vN9ZRD+i43N9cn2O0EkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBXal-0000000Eae8-23v9;
	Mon, 27 May 2024 10:28:35 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBXae-0000000EabJ-33Na
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 10:28:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C71A2000A;
	Mon, 27 May 2024 10:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716805705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kkDr/uTE+SSoGhb8+yyec0XwQuw7fpgZQvCgauJl+yw=;
	b=QbO9iXsjbbJFFYLKpoNqnQNi4vhO+TOVHjmxpIt7pyL4x8fhpsc8DbvpAfBP2vDcGJ8dIX
	9f9kUD+elT1qUytp8yzoI+Y7UgoExX9E9nHneyiG8RliuNra1qOtI/oFyWv3HNSUrFZV8h
	wVUdUwymxt45ndDI79hl7pxDhiaDYe3j8QCbjnaF4c3B3JmYSYepfw+lbMUFfR3s4APlfI
	pG5DYzDrNJJvo/DKkuNIpOzaazoVgH90ClAk6fC1+n3AQU/tUVSYC70Ttu1fWFDYEQ0EsC
	WlKdegmGmtj+TzeT6qzTg0mu1PG4PHeudaQyMJ4Mc4cXzzneT78KGXIGKOrcCA==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Mon, 27 May 2024 12:28:18 +0200
Subject: [PATCH 2/5] dt-bindings: timer: Add SOPHGO SG2002 clint
MIME-Version: 1.0
Message-Id: <20240527-sg2002-v1-2-1b6cb38ce8f4@bootlin.com>
References: <20240527-sg2002-v1-0-1b6cb38ce8f4@bootlin.com>
In-Reply-To: <20240527-sg2002-v1-0-1b6cb38ce8f4@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Chao Wei <chao.wei@sophgo.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_032829_170718_04F7B88F 
X-CRM114-Status: UNSURE (   6.78  )
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

Add compatible string for SOPHGO SG2002 Core-Local Interrupt Controller.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index fced6f2d8ecb..b42d43d2de48 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -40,6 +40,7 @@ properties:
               - allwinner,sun20i-d1-clint
               - sophgo,cv1800b-clint
               - sophgo,cv1812h-clint
+              - sophgo,sg2002-clint
               - thead,th1520-clint
           - const: thead,c900-clint
       - items:

-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
