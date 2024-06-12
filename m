Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB158C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 08:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bjn44XtoPVmP+nx+yPo5MajZtek1YAdnDvqc4/mPiK0=; b=oAhukEKEb+HlFP
	iCxJfWT8IcGq3QjpXOZqQkvsk5XrQWhrdhMqDDyLYmBBotTVVTMGjiZxbCWp7b8jKXTEzOtqU1VXV
	FvrsS86V9ec/8rzo31ISaS0jmqdqI+wli91N2i2mWmfE1MzJ1GG8vKk3lwa47o4nr99u+mVITsdXa
	pYG6+FvOXg9DQsZF6sCbvwgiybUENrsLzKQgOu2G8UlgfZMvkgmUL8vw83IO9H7aY8tBn7ss9EaK9
	T3Jqtliwx3wclTwXrYpVn3g/qW9g3+7pas+E8DnsGNP8XqOwJ21ha35e9fAzOLOgVAq94YDZ1OQ1x
	afh9SolotCT5FPD075RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIzb-0000000Bb15-2cD4;
	Wed, 12 Jun 2024 08:06:03 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIzV-0000000Bavi-2wrC
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 08:05:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1FCC1C000E;
	Wed, 12 Jun 2024 08:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718179554;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fkbM2qJwtk/9imxw60f78bunUUFiPrMqYiZwAAmIrOQ=;
	b=Ajld8+/0xw22W9o5R6Um42fCrfmJGbqWJPwkPKXIUtS8RfagN0ox9dpD4KKj20F+Ttbuha
	3uBqKjfA2eQK58WwHy3+YgRHR4yJoPM2NTDszS+3hr5CI8bRHjGs1jBH58wbhuyz6GaHAl
	Ki1sW8HTGTOcqIfEWPOxhPj/3BMBw1iLXHH6axCZDKO1nXzvDV9KZ3U8yug4G92fTQy4v2
	t6XZ1YIWZmP7E1tp2OxhnYr+d8sKz60cHKFPjaeRjsE3td3AYL8yFKFXlV9coiXBURLP2y
	hdpURJvM4wTGcMCl6OLg7mwkFEivxNaIUOwntwtroIooKsfrjSIm9RWg1IebGQ==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Wed, 12 Jun 2024 10:02:33 +0200
Subject: [PATCH v2 3/6] dt-bindings: timer: Add SOPHGO SG2002 clint
MIME-Version: 1.0
Message-Id: <20240612-sg2002-v2-3-19a585af6846@bootlin.com>
References: <20240612-sg2002-v2-0-19a585af6846@bootlin.com>
In-Reply-To: <20240612-sg2002-v2-0-19a585af6846@bootlin.com>
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
X-CRM114-CacheID: sfid-20240612_010558_077402_ED68F317 
X-CRM114-Status: UNSURE (   6.50  )
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
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
