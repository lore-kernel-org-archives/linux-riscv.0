Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310B3C25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 10:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yT0Ttg2MmWoOYWOYosC27LkywEDI3SByYghD/FePoxw=; b=Yy7ICUN6uHdkvT
	4RN2CWpa1QFB2fdNjnNDQ+QxJWo3GhTCDwCb1rxUoFIsqA5HIMFTVPEcHHIyTZBcMDrWsCGVpnI1h
	iv6XTwX+mAlwpATmk2gASMLuG21UTGIhlR/hwEH9K/gzDHY/LhThLOkprOMOyuZdJZGmGpqEaZoio
	TU41XoHa9LRKKICiHkgpwvQUiBP/tQFgPU4R8Jbu9BNptA4AqHE+lrSa4xRn/6PAuQkbZrz5cjMuF
	W3NqaqRI+pvD0aJyWNg2tXeTW46LSvthISipLzsYt67ACpHlwaNpbOpuLAsmB0E1xC/g6eaCTe6SE
	y/6PDHN2CZ2Z5VB+pNyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBXai-0000000Eadp-3kpA;
	Mon, 27 May 2024 10:28:32 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBXae-0000000EabV-3tVj
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 10:28:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1D87E2000C;
	Mon, 27 May 2024 10:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716805705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xeGVOYKR3B2fHIUo+L7Zn5YK5ufzUrUi6zvLOQlL7kQ=;
	b=pgAZ74caKsdxSNh2FVx5q8JyuBkxrrLVF6NLXqPCAtSNdm2k38zpLTB+F+5amj3elVcyqm
	DUzkM/5WIVWfqJGcIBU7RyYxT4GJ2w3oGdFN+UJw09ZJxOPqe6f1e+a9M/bXLVJacRNI5H
	IZxrjrPJhfhXDjlTHOb8rtGayyonJwdSZCEu1tjXxWAcWyUBQciOPcQTP2rErzv1L011Tt
	rZhftlSlcs9U8z3F46RXTBd8O+SuykEw49yFLPZC+a0nqLdGd3zqaO3qwD5wxeAVxd8bCD
	9uJmxqYpzKARIa3iSBQrKEfT9XoONNJg5js1YderQTmm2rMTUUpiKOM9jHmmVg==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Mon, 27 May 2024 12:28:19 +0200
Subject: [PATCH 3/5] dt-bindings: riscv: Add Sipeed LicheeRV Nano board
 compatibles
MIME-Version: 1.0
Message-Id: <20240527-sg2002-v1-3-1b6cb38ce8f4@bootlin.com>
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
X-CRM114-CacheID: sfid-20240527_032829_208540_AF7E42BF 
X-CRM114-Status: UNSURE (   7.89  )
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

Document the compatible strings for the Sipeed LicheeRV Nano board which
uses the SOPHGO SG2002 SoC.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index 9bc813dad098..b770ead6c723 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -26,6 +26,10 @@ properties:
           - enum:
               - sophgo,huashan-pi
           - const: sophgo,cv1812h
+      - items:
+          - enum:
+              - sipeed,licheerv-nano
+          - const: sophgo,sg2002
       - items:
           - enum:
               - milkv,pioneer

-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
