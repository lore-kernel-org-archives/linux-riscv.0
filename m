Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B79C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 12:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+IPb6NrHQi+kYy1ddHqElUuUbb07wiYSQmYpTQYbX1Q=; b=kK/lg8poQkUVk/
	jw/LVDrh+6ueygKkkPI6zEpD+J+XnyV4vKbjPO0VHvh9EShhFGr7yaRQC2Vkv8sAr5t2z5QTrBHqL
	ptL7chALbztbNExqPLKj1XhXROu/WrOtZMfEu0g4/ofliZ+q0MzQ52xGRhAAnTtQ1L/3jn5GM0v2G
	/0ZuWmexraqMrmjmR9uc0ieJ9APwhBIVxDJZLfcoe/T3DZFw1IBUgtp8Yn+snhiNT/Xm33JbfK7OX
	cyjuX7H0ap2AxK2vnRdEEVBFHo1wnEPdqmhPFUDRvpwywYaLU8KcuJToWXZoxh/1R0voe8DEMw1rL
	TFodRRvqGXeEAkgOhong==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpSLC-00000008qV2-1Hto;
	Wed, 27 Mar 2024 12:25:14 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpSL6-00000008qRN-2Taj
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 12:25:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5E2C8CE2637;
	Wed, 27 Mar 2024 12:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3AE4C433F1;
	Wed, 27 Mar 2024 12:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711542306;
	bh=X6Q17iok1lsELRt2E1A4QpgQ+0x+/0qVC3vmN5bsp/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qHLddTCldCQc+zy2KauTb0OEL19C/ZeAtYJN6nFb+A8mdqD6YkBN+M8Bxh/AdNikO
	 buRI0qewxr/ZaIWGFYdzCTl6Gv+RsoBnAlcfBmr9KGMxBuXI3pJYbMh+P8L1zLyhx2
	 iLtM94jJ11V1gz7lLelQfy94vpn6TRB1kTWBvyVzm0aNi5tVHT8vPmz8oEGt3l6fvE
	 QdGQtL8OjrgA1mCZf6OFDsqL3HwWRyd4+/E8wGZNsqkG7tjxf05SR/bswKgUpn9tFQ
	 cxX8P48S5ffTReyax34KkflEXjTW48yOhRDn4aAzKNgI7xxcpWj0iR93pGTAkac01F
	 GSF764hUTtFPg==
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
Subject: [PATCH v1 1/5] dt-bindings: riscv: microchip: document beaglev-fire
Date: Wed, 27 Mar 2024 12:24:36 +0000
Message-ID: <20240327-camper-brownnose-6392076d8699@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240327-parkway-dodgy-f0fe1fa20892@spud>
References: <20240327-parkway-dodgy-f0fe1fa20892@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=888; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=IXE+G6TXDdUlSmW7mF73cGLzEXQoXwEvNEi4hyJZUcA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGksAqyWxyxDf27KOX45Wc6gK/FjWPo5fVG+mL6XUyzOG oavaJ3XUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgInUljAytJzJPjW94muSCof5 xEw/ruBlqzbOO3DwwKtM0Svf5VZUHmBkOHtBweWu0Nv2tfc3HlrA9/9UdZEFM8duP4nZh9WX7jv Zxg0A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_052509_164815_4071AD5C 
X-CRM114-Status: UNSURE (   7.42  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The BeagleV Fire is a BeagleBone Black form-factor board with a
PolarFire SoC.

Link: https://www.beagleboard.org/boards/beaglev-fire
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/microchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
index 4a29c890619a..78ce76ae1b6d 100644
--- a/Documentation/devicetree/bindings/riscv/microchip.yaml
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -29,6 +29,7 @@ properties:
           - enum:
               - aldec,tysom-m-mpfs250t-rev2
               - aries,m100pfsevp
+              - beagle,beaglev-fire
               - microchip,mpfs-sev-kit
               - sundance,polarberry
           - const: microchip,mpfs
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
