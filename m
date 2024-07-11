Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AC0C3DA47
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jul 2024 10:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hHUCtQLcqZipOesnThlUjuX83e2wN4KUPYtf3y3CUxw=; b=GdtH0U7Y49kW77
	b2w7qwVDbc46wxXJ1U1HP3pPjGp/6WMP2Fea6AB0SspWyUS9NePtL+Vyd64S07W4HxPR47D6VcJgI
	WGHWC67JMficSAs08JijT4CRSxXMX/mI7vihu2uj3w/dZ2TIQs44MquGPwIgn8uhe0ijxjqKA5FrX
	ApZdkkdDaZObEERClQ1XVmZ44xQw5zr5tx1p7sd0DK95Ob7Uu4kyzRtpXkw2zGlL+v80xcdwLPXNS
	8bkkAVM8/fljdnjLkKLk1LlYKmqNlFmc0HSLkjt2C5WZbZTCm3GuGsDWC9lkEIcC6cdOUBIaO/Tk5
	9vTf/q+F+6/6HfmddJow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRqcQ-0000000DRCK-2W4z;
	Thu, 11 Jul 2024 10:01:42 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRqcM-0000000DR9Y-214q
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jul 2024 10:01:40 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C8F524000F;
	Thu, 11 Jul 2024 10:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720692094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dhYN2esY9mLXkTt3QVpkwWv6jX6N62gsaZnkqzr2dx0=;
	b=aTQs+JZkyeU+XxLOy6vWw1B+cx26EgYMqWyg/XhJR5qfjwiMQnxKZFCmkVsMzaaxOcN0Ng
	iAuyn10+KuSSv5uyUwti+CIldlmwuMWR6XZD3bgLjUpXhiv+GqGCbkEetN4lXH60pWav8p
	rjRz/UQP3QQ3PNlScStCjCqwUgPZjOnhDGmBV8OjjSPPkwfjQBoCpY0ThFOySauTUjdBJS
	nBSQ7ZK1tKysEOkW7hiCYvV5mR7CS8IMOSts4/DOoZrOPI9gK3Spx4MzwlJRnYYfOxCSeV
	bIf4S3P5yUBt0iwPk5aPZo39vc4zzV3nZClYcto0XRHCDyQczrkinzBBvK6Mqg==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Thu, 11 Jul 2024 12:01:28 +0200
Subject: [PATCH v4 1/4] dt-bindings: interrupt-controller: Add SOPHGO
 SG2002 plic
MIME-Version: 1.0
Message-Id: <20240711-sg2002-v4-1-d97ec2367095@bootlin.com>
References: <20240711-sg2002-v4-0-d97ec2367095@bootlin.com>
In-Reply-To: <20240711-sg2002-v4-0-d97ec2367095@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Chao Wei <chao.wei@sophgo.com>, Conor Dooley <conor@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240711_030138_695224_51E67589 
X-CRM114-Status: UNSURE (   6.90  )
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

Add compatible string for SOPHGO SG2002 Platform-Level Interruter
Controller.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 709b2211276b..7e1451f9786a 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -67,6 +67,7 @@ properties:
               - allwinner,sun20i-d1-plic
               - sophgo,cv1800b-plic
               - sophgo,cv1812h-plic
+              - sophgo,sg2002-plic
               - sophgo,sg2042-plic
               - thead,th1520-plic
           - const: thead,c900-plic

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
