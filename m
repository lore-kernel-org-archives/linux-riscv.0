Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 628E2C04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 17 May 2024 09:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h0Nn5S8C/AuWGh/P7JmVWlGhFiw1phdJjz8Fl9dFaPY=; b=WJGxeFJbag8ZJC
	7+Qdd46noY9qVuwokOHJHdfSw+WtyT7+a3WtAtEPwsMFpYRfgl7GLTkIVaZynTQCMc/wlH7tNJ4ev
	+cOEA1TOgz+Vmqt1GSaWDdS4ynXX6Z+EP3xEwwnZxnrgc+iDbcEbL4ECfkSWoekOuXiQywgqcMO/1
	+5QoW1poDkjlM4a4NG3jy1YavbtpfpjGgx1nirGmZpPjSAQqOErxFcwq7gTJ7DGFQvFU1Quxg304E
	iiX/64vPAVIhVoJiegQAP0pMJLqG6mrCWPtY2e0AO+Q0I/grkI2DA9bZ/HhSm+wJOV+D3oCKKoBQU
	FLFF4wd1ZIJx/8Gt8Pfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7tbZ-00000007Icu-20FX;
	Fri, 17 May 2024 09:10:21 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7tbW-00000007IbU-2kjt
	for linux-riscv@lists.infradead.org;
	Fri, 17 May 2024 09:10:20 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9411620002;
	Fri, 17 May 2024 09:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715937014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pq7XQqi3/Cq4U6P2JcpzcOtiqC8L/GBHpBIFcU2OyKc=;
	b=RoDudsoI7xov79JDbeurmxUGeYsvpgvRxon//txTj24ZV2L0u4uzM1nR5+Y5Iiqqih6Ko8
	vqNiDTGAqptva1IncZcFl4S+k6TyYzy95kbSq7TrqOiwCmpW5whLqjub6viKuiRbpLrOIv
	6f1KeBJC42jK1kcPbMmO6d6ZZTMZPdbBAzoc9kGAFdPULscbEzGsvUKTrpZKEx2Ezw7kGg
	uWh6GLX/Psx1ZRiu3cIobHPZB/LVKqYQWbS7QBrTccXQOlZW/2/TmCK04OqAnnipXy3ebG
	kVUQTwM777C6oFcW3H+newyr1fjdd9eQVSF4iEu7dnE5HE/Ozxlhk0fUuHBYcA==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Date: Fri, 17 May 2024 11:09:53 +0200
Subject: [PATCH v2 1/3] dt-bindings: i2c: dw: Document compatible
 thead,th1520-i2c
MIME-Version: 1.0
Message-Id: <20240517-i2c-th1520-v2-1-d364d135ccc6@bootlin.com>
References: <20240517-i2c-th1520-v2-0-d364d135ccc6@bootlin.com>
In-Reply-To: <20240517-i2c-th1520-v2-0-d364d135ccc6@bootlin.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Drew Fustini <dfustini@tenstorrent.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240517_021018_872091_417D70DA 
X-CRM114-Status: UNSURE (   7.15  )
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

Add documentation for compatible string thead,th1520-i2c which can be
used specifically for the TH1520 SoC.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
 Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index d9293c57f573..60035a787e5c 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -33,6 +33,10 @@ properties:
           - const: snps,designware-i2c
       - description: Baikal-T1 SoC System I2C controller
         const: baikal,bt1-sys-i2c
+      - description: T-HEAD TH1520 SoCs I2C controller
+        items:
+          - const: thead,th1520-i2c
+          - const: snps,designware-i2c
 
   reg:
     minItems: 1

-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
