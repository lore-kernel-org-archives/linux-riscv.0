Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 227E8C3DA41
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 10:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hHUCtQLcqZipOesnThlUjuX83e2wN4KUPYtf3y3CUxw=; b=rosafOsNaqXu1f
	6A+zP9vIDvKHVhlyU/YgUCvBkfnGu6ZPdhl1OAgW7tWrCESJFzYSz6evmOjI5YB+Uj/axXbdmb9Wz
	+FknFe7KlCQbJWuRFw4mZ5yGR05MjOpCPw7ojRJyxHlZopxT0taBzeA2hUuy21SDG9GFX0GSjvg90
	2942r5vL8QhbhAR0vH/BN8Hsa7kJl8fJX2JFyz3Q/WU23glyI/JaYr0QX+Fadmn4iuLp4Mpn2fqhQ
	rZgqSHP7ujQSiBIhBOOjzrCPpsHzRS9EWaHKo3GGF/fobjuWwB+rYioOltPJgOCzbo6mRJDg9d4dz
	e12mPURgmqubBi38u4bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR7kt-00000006jkW-2mYM;
	Tue, 09 Jul 2024 10:07:27 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR7kr-00000006jix-1cqN
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 10:07:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 29F0040003;
	Tue,  9 Jul 2024 10:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720519642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dhYN2esY9mLXkTt3QVpkwWv6jX6N62gsaZnkqzr2dx0=;
	b=DIO2NmNqAVuxnpus8tNQc77xzz27cN2SMn5PlXAT405CzUDkSK8vRy/RxMN6jfjGywyams
	qtC+ht/x+TsMflZFq2lCPmwpewo1KbP165tAwnYxjLRhVh7yo5yfBil6imRYXVnAsIy3ab
	alKlJOR+7AvkvyEW6/6Pd/ATYMx0sdzJeYhLkcffkZu3pfGaPjdD0hJh3qwpzbBSCVS7Oc
	MDYaTBjkSvNGbq2cBO3uZf4MUtDegrwzRZcE4TIRL6YNzF5s4ZJ/7iI4zpnMKe/XdEcQVp
	gFmGfiGhoZ6EkAbZ1m+L1tRmkvi7c1SrVh2sOyYi+A48XDOtb9JMIrvWY7fsNw==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Tue, 09 Jul 2024 12:07:16 +0200
Subject: [PATCH v3 1/5] dt-bindings: interrupt-controller: Add SOPHGO
 SG2002 plic
MIME-Version: 1.0
Message-Id: <20240709-sg2002-v3-1-af779c3d139d@bootlin.com>
References: <20240709-sg2002-v3-0-af779c3d139d@bootlin.com>
In-Reply-To: <20240709-sg2002-v3-0-af779c3d139d@bootlin.com>
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
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_030725_609576_69AE360B 
X-CRM114-Status: UNSURE (   7.06  )
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
