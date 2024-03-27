Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C133AC54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 12:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jMX1rozEZh0x5KKyEH1dGmWg5zFoGFCA5Kviq40Xh3Y=; b=VLgxccWCWXU6Eu
	edAy/x8RqF6XHcNZc5XzEvJhOcyy8VFYOnM/OILcWziKVrOmzIbVdzEuVhoddSGo+tO/cJSiIjMZh
	ZPI719/pUCNBq+Vpna5vIksRqCbaw8j1QdSuaSuOwaRlgcfYzv3Crbx5AdPe0eTQAVbqZ46oCxrHA
	2YaB9/Cgf0sxfWDA2kB/92mD4QjhWEfvoOJ7Gg1374Nu2CEbgGcRhLyJn4JOuGjhzaofpQZx6K+ou
	K8pVQN78zAyPETOGTSPoXhsyFYpdUFZX47PRRsqomoPdupTaf/Ved4OifmgKyL8kkCqhlrVB15QAA
	NQdVHobc8YVWTaOXqU8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpSLY-00000008qjG-1k1K;
	Wed, 27 Mar 2024 12:25:36 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpSLD-00000008qV3-1VIG
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 12:25:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BF825CE16C2;
	Wed, 27 Mar 2024 12:25:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23145C43399;
	Wed, 27 Mar 2024 12:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711542313;
	bh=038VBIDo7wOXasBPUdMTZ8PLRSWfD0Ugbh34YKcaqAw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kwr1lYv2X1QC6vcz5l+zu2KW28jKDMcUCckfHzTia2WHhQHNUkkqzcxlIhuH8bH0V
	 oHRouwHNl91AZtFpfS8uSq4B8BjUJgT486AJqQp4NaDGbAoH+TEFEEZWT4AZusOaye
	 ZNM0LetAPWIAXXHZHwqm7me/VV/2c/Mrj3fM3pvBRJkG7thwftZ8ovy/oN874gGMNa
	 Ya4K0P3ZAtuGs68/oELfhLaGSxxvqRF3HHkpASq14EzDDMcOoNNu2QpGaPK3yNH8+q
	 gZl+bRFZmz7AaPGs47pDBXEfvJz7WJebsBOGGgbXxhsynKneIAdK3NkdTNVFQ4ijgr
	 at8b6J9qN8j7w==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Jamie Gibbons <jamie.gibbons@microchip.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v1 3/5] dt-bindings: gpio: mpfs: allow gpio-line-names
Date: Wed, 27 Mar 2024 12:24:38 +0000
Message-ID: <20240327-overrate-overuse-1e32abccd001@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240327-parkway-dodgy-f0fe1fa20892@spud>
References: <20240327-parkway-dodgy-f0fe1fa20892@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=815; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=DQ/xOk1TKoK84RFxAr9nUQRMqrU2scD4cxuVi4j2DRs=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGksAqyTq1tfxFl23mh4eOftRUHLExaKZ7ubjEPOpDEK3 2X0bLvVUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIk08TEyXHq56IBz2p6VonO0 3HTV9HW9zr01q1DPEmzO9hK6UpOUxcjwbcfUFsHNTqqXMqcvmMXHE3Zk3bklDh+7eJ8t2SI0c4Y FPwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_052519_437818_53FEA147 
X-CRM114-Status: UNSURE (   7.38  )
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

From: Jamie Gibbons <jamie.gibbons@microchip.com>

The BeagleV Fire devicetree will make use of gpio-line-names, allow it
in the binding.

Signed-off-by: Jamie Gibbons <jamie.gibbons@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
index 6884dacb2865..d61569b3f15b 100644
--- a/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
@@ -44,6 +44,7 @@ properties:
     default: 32
 
   gpio-controller: true
+  gpio-line-names: true
 
 patternProperties:
   "^.+-hog(-[0-9]+)?$":
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
