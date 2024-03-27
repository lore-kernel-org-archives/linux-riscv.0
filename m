Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B737C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 12:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2gR82silBQEXDtFOkr6B5ECxo57sj6/J+EuQZvEvV1s=; b=RqRLPplxGxb6dn
	mM+Rj7CmJDkv+hYOw+3zjT2+ndTD3Se+EQUDRd2TZc8nXPj6HLx8tyE3jwCTXWSftSv/4rVekuwYz
	+NDKoTUTE6ST1rBxvS65F05kbhY1i6bh9EUc5kwjab0iC1QHGXG8gCdABxYUr0L6RsipqI3IdV1TT
	QZLFXgXUOTT3LMKDY/HObBHcT6Qfv/uIYeQdNvQPHChok3zTXhYc6SjZtoq4tTcOxkNtvyDS5tcRU
	UycWp1ETIIR2RnnvuHhnDZ2ZfC/nNSVr8p/WgDBpTITMJzlqf2+nORysLMGZrBTGCxtMwnCFssrGD
	0+rjTWO5iAoL7Sd3TZTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpSLT-00000008qf4-0c93;
	Wed, 27 Mar 2024 12:25:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpSLH-00000008qVv-17P0
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 12:25:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6FB2961503;
	Wed, 27 Mar 2024 12:25:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB2CC433A6;
	Wed, 27 Mar 2024 12:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711542317;
	bh=Lbr7IoAyrDhiLzvuJzo9IGXeuw1UGQU0B8IX5xK2H+U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IKG0/+KxX65U8B6XpOGDDqAnJTt+kb8aYVgZVTGIIpD0/6rdJUY93+ccYMTxo7IFf
	 LxuZ3RXakM8fegH9uin6VNqDqC6iqCpicoHl1u0Mgi7spfRpjl9uPpFtDKdqmp4RLm
	 QfDGm/DmxnEoUsPk15G/Z29HFv2bws5U7xOtI004KDQd/i+VD5JBOc1sSlWqEThj5A
	 x294jM3hfwg8lL4SkUw7/S7jPbQ4nTp+3lqWRFPO1e43J1L8cMG+/8AO9xhf6tx3YO
	 YzakB6MjgI2zzH1QsxN2LECunJvf1q9iMk6HaJiFSnHNxxvVAC6oHU4GvECZfehSSa
	 DyY8OGa8cEwNg==
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
Subject: [PATCH v1 4/5] dt-bindings: PCI: microchip: increase number of items in ranges property
Date: Wed, 27 Mar 2024 12:24:39 +0000
Message-ID: <20240327-debunk-perky-f5514ca332be@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240327-parkway-dodgy-f0fe1fa20892@spud>
References: <20240327-parkway-dodgy-f0fe1fa20892@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=945; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=buQq0yDz7uxZQBF0BhuHfxwtzcUDoTRsuZxOB+uRXCE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGksAmxvph4tLRbY8dV+n4ex5fzX1dfyc423lMvFPOeWm sV8+UZsRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACay7BfDP7UKSWH7FpHjCadu feA3O8MZbdTkc5atf4PHCgsfw0v5exgZFh1rWJJvfVfzX/L1688fGPueFpf4EHqXuWSm3bu3h9s ncwMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_052519_725856_39BE0E85 
X-CRM114-Status: UNSURE (   8.99  )
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

From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>

Increase the number of items in the ranges property to allow up to 3
ranges. For example a prefetchable range, a non-prefetchable range
and an IO range, depending on configuration.

Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
index f7a3c2636355..e8212a05b7b1 100644
--- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
@@ -65,7 +65,8 @@ properties:
       - const: msi
 
   ranges:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
 
   dma-ranges:
     minItems: 1
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
