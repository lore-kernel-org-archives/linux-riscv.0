Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04599C2BA15
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 08:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i5E8bpZJb38ERZYEfTb21PieTyBWGUXZlhuBB9Q+sT8=; b=MicovcADlCqfMr
	yBiXN2lqJGOFSt8stfgEOzow8Q0DS+1x5DOwBwpj0q8BmVvBAFTozlZMoYrjmTMxiT7siMIgNLiiB
	firK3Aeeq5/pz8Y68jvsRyLG0XHQPhsawiuasjd1Rz13mFuLI9c+u7YyBiy2UsGwOFhJi8DO9tJQq
	vSNf0HAN1x6rP4LE3KTLPF+DsCQp0HrPnJUqcilVYv5Agp3Dtk2dwYZz/hqIxW6vZhVisJDlW5Z8p
	amMtnw4l+dR8IIMDH7JCl90p8Vff+8T1/uKNv6kx/5hvO96DgX7hQBJe+0KG2M1xH8bLYnYVvCW0e
	fH6QojLbFOSgwTG8q1dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIze-0000000Bb39-3O7K;
	Wed, 12 Jun 2024 08:06:06 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIzW-0000000BawD-1djV
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 08:06:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B01AE1C0012;
	Wed, 12 Jun 2024 08:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1718179555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qogXr6ddO0luZy08/pVi3ZqQWm4G2tT89hV2cFdiuz4=;
	b=P9tFBfnzjcd/yUAnh1Kg7TmT7TfTQJHL2DGw+MGqNWOxQHk5QVf6p3aG9Fhdtj2cUBdXsg
	GzO27Vbsg7QCxsFzx9YhkEUzyWXdNzYANE6hxlaGS8Fs+qTOlbwcek8YbB5vqSjJFKkFOh
	jp+yhpRjUfwt6hS0+Qiiynl99wqEAetVIPLFw96NnOq7XwQROx+Mu0jReqkPRKz5pPULqm
	2OKBBHQ0F9qwhholJnCuZDusdmwARq+liSmJfNYmHF91C68jbASSAp/fLNTSIrSt66p/P2
	qmpbrfm4A61evlbZxj789Sp0JRQfXohfGZEz1gIAQzul8N1k6DPKnFo0CfVFIQ==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Wed, 12 Jun 2024 10:02:34 +0200
Subject: [PATCH v2 4/6] dt-bindings: riscv: Add Sipeed LicheeRV Nano board
 compatibles
MIME-Version: 1.0
Message-Id: <20240612-sg2002-v2-4-19a585af6846@bootlin.com>
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
X-CRM114-CacheID: sfid-20240612_010558_596450_4F9817E0 
X-CRM114-Status: UNSURE (   7.50  )
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

Document the compatible strings for the Sipeed LicheeRV Nano B board which
uses the SOPHGO SG2002 SoC.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index 9bc813dad098..a14cb10ff3f0 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -26,6 +26,11 @@ properties:
           - enum:
               - sophgo,huashan-pi
           - const: sophgo,cv1812h
+      - items:
+          - enum:
+              - sipeed,licheerv-nano-b
+          - const: sipeed,licheerv-nano
+          - const: sophgo,sg2002
       - items:
           - enum:
               - milkv,pioneer

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
