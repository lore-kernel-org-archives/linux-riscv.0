Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306BFC25B7C
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 10:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LJBHlMYQPp5bVLUuwTQAGfX/ZDbK789dh2I1VeV1Uz8=; b=ZcI6+HbWR8YJqi
	vy6REK9oOZ8+peYa+Yegzi18vYdY6XDX3szRXQ4Y2eS9PC0OyV3+YQv4RiXHnrU/SaXbCrSKfVgWA
	bJY+vPA+OmgPyH8/9p7kcKCiD/dkKXoGbe6cfxEYsSgcf6/ng+wl6UjGMxHmp46QpnQclQuVkWx3W
	jw9cqLSNPyCw4or/W0UjFxiqn0tVHOh3+fHeEIKcTeXz/wWzMFLqRuqfrKwT1VkpW5PO4/2DxMKEV
	WpPowWuG+e4xJcngPzkW+/OFEF7hoktR6R17LM8UkII1FHbh6z1pXu40f9OmV6m7xsXXP9/qPoxjt
	2kmKuRr2P+bBXQzS7spA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBXaj-0000000Eadw-2rps;
	Mon, 27 May 2024 10:28:33 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBXae-0000000EabE-37Df
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 10:28:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 407AB20004;
	Mon, 27 May 2024 10:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716805704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qIEgzuBJdhqAhnahZNc6Fk08hJUNP1Ejk2wU9brIDN8=;
	b=QYStvYcQNL+T1zB85n3Xv9hH8cegl1i2DojpgCQBqmgfu9LcRMRz0VDgCyp1AlIpmNhfhR
	GVoTkbnDkAV6lGRPKW/PtqPxOaR7+YNyOJUN2l4pMAqZhIjTswu6Jx4+fRAN0QWOR8z65V
	QcmlTKKBLIorkln4wbj/9bFS0TaocvQgl2jrQ2wamyw0+yrjSe4Pd8YFTpgct6Um9h1H12
	IBrEjCzu3LFCjO56fjhHbANTcw9J/1+7GCeB10UjPsrZbTVXMwqbCt6fW8xCVMx9r438Ee
	tsMF6YMF00WLljNQlUb40Gb0XIce3oij7fPG+TahMR1L/1UyqwOHFmA6SJnx9g==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Mon, 27 May 2024 12:28:17 +0200
Subject: [PATCH 1/5] dt-bindings: interrupt-controller: Add SOPHGO SG2002
 plic
MIME-Version: 1.0
Message-Id: <20240527-sg2002-v1-1-1b6cb38ce8f4@bootlin.com>
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
X-CRM114-CacheID: sfid-20240527_032829_163451_2462FAF0 
X-CRM114-Status: UNSURE (   7.10  )
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
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
