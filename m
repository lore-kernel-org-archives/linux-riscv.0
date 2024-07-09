Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D24C2BD09
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 10:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E8fNg/uYmthkWF4+KPk2VsTvkgzMPgHYDSmeHSq2D5o=; b=iSXLNgu8dcUVKh
	3zpUvZa3N8mfmRx4UjnzOgWplFJ/nIZQS/YkQfMvrFC9qjqEwBrsjFHnkCu1t1phZC5Ut+ypQK2OJ
	KJ1hFn9xnhKb3utWm/FJVnrMZm4H7p0U/5m81i1InGMNe3S5UPUCJNGRfYyQA9WiaQdRzZ/qgwkXB
	zFGiAoqygo+dF+JqvhrQg5sVKtFlAfW65bbFzfxaB8NhW73zC33+etoGx3YX8Y1ZN4UdC3pTtY3Xx
	X3VrwUc0srN3Z2/1AX225zXUN+d3OPmNRag/l+SWqCsziXrIz6R1CUS09S3lpfnnSFRSKeXv9oJ1z
	RZqFMmnuScBVcq1W5OwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR7ku-00000006jkj-0vqd;
	Tue, 09 Jul 2024 10:07:28 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR7kr-00000006jj4-1dfm
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 10:07:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EB1B740004;
	Tue,  9 Jul 2024 10:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1720519643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a4/qosI29j12BIJ/lo2TfWJJS+sG2+sfIgXK3Wk4G6o=;
	b=m3GtmFh5JfQgnHd63SIjuPe/V2GaJqDXZsHvSzl9SRIEDjtiokLlroN1BjyKNy/S3aDyjV
	CveMvo+ijX5SOwbEO+6brA7ZHyZt21hrGU9LzhQRgeJVn2DpV0kETdjfGA1bJeDd4rUqiw
	8N41LRM+tN+hjDgeCLLnH2lApIutANIpz5ypPo9CsUuxr6Jv/zxv88d7q+CoAqI47kTUhs
	ydw0nKyS2hc65dVnggVHit9sbepUDdAzILjFBsvtnxRLbfu90YE4M+G8Icp4rGxvp8deOn
	v3WMhJUwjRtES5XadhMVW0AfmXj9MCs4ECX0DQFsNWjSWYiK/pNECPzl1dKxxg==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Tue, 09 Jul 2024 12:07:17 +0200
Subject: [PATCH v3 2/5] dt-bindings: timer: Add SOPHGO SG2002 clint
MIME-Version: 1.0
Message-Id: <20240709-sg2002-v3-2-af779c3d139d@bootlin.com>
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
X-CRM114-CacheID: sfid-20240709_030725_618654_620D118C 
X-CRM114-Status: UNSURE (   6.76  )
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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
