Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0B62CD37B7
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Sep 2023 09:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lfUh/+PEvQ6aHzwCNMCAk6hfv1bqM4rTJZsN78sXBw4=; b=AyycABEE6lr3KT
	oQS1v0mEhqT8fEBXKdoU/MYRnV5rSEXCzOaEhuhflXzvXgx64/vWB3XKBO6aWW8Nx/bpSmpUieD4S
	VLu8ktKWYYWluio0/wGE4v2rqM71skp3H8EJrS8LNa5XryPvj65h2SeAZQdMwrv5eNqyFcu8D2zQa
	nbTuyyfYtLHD8aruvPIKNjSZ3acFcGgVN+WwBHNWizaF3cpytNdYb1nHJ1JByhZfA1hQ5ACFg8nWA
	YIw+IS++6neCuSX/F+XXBLUgrS0FmlMgLVsmt7uZ6XJ52xnbBC9OUlreAU0PXgLUCC4/qCOH/2zI8
	ECi/PS482rMtMiH0ASWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhRNk-00CEsp-30;
	Sat, 16 Sep 2023 09:14:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhRNh-00CErd-0J
	for linux-riscv@lists.infradead.org;
	Sat, 16 Sep 2023 09:14:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CCB4C60921;
	Sat, 16 Sep 2023 09:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9CCAC433C7;
	Sat, 16 Sep 2023 09:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694855661;
	bh=GdGIL53lm5iv/mox0ahLK0T+iKNQXpwOmFGuHh0bLKI=;
	h=From:To:Cc:Subject:Date:From;
	b=MXFjs8+pBJZdHwmuPF39Dgwiac3x3AZ6Ss001Xqa4bdVx5TwxJZjc+2e08dgidLqf
	 a1ThGwqoJ6cAu9E0MeCHJLx4YOr4hm9Z4mcrWe/AUeICdzvrfMbZbi2UcDrqEh1tJu
	 WK2k44+EDyhxS10IwH49j77ngj+JZcI23btS3KkdtAZqkUiiUMQxMS/U0aQ0eZ9YOd
	 k1fEulNFIvO4rcGn6pWtQ7eDvtckKZ5CJIrZVrbRcmjwKpWfQ8W4iomNjJpwNeTJuf
	 6gRJg40669dhp8j//RhdpTdWlIC4Q/Wrs9uP6kOb5PQrs2tS15Xl/YQFaiYnQp7g/i
	 uoD7BOXntteuw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] riscv: dts: allwinner: remove address-cells from intc node
Date: Sat, 16 Sep 2023 10:14:00 +0100
Message-Id: <20230916-saddling-dastardly-8cf6d1263c24@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1512; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=UgmedOCSd3V8sGIbZthMv9VrCmYnN+opWlLsZB5DVno=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKmshVfr/vQqXF5o7fZG0oplI5uJspPEknN7nj39fsdMy ckhYXlFRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbizMbwT8U7bukPz22JO/Yt to7Y7bVftroz1N7/sa+Obo/PthIJK4b/NVf+PvkQ5LS8NWG25eMLWp3N3x9XHX96bs379guOHle SGQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_021425_180181_846389C4 
X-CRM114-Status: UNSURE (   9.91  )
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

A recent submission [1] from Rob has added additionalProperties: false
to the interrupt-controller child node of RISC-V cpus, highlighting that
the D1 DT has been incorrectly using #address-cells since its
introduction. It has no child nodes, so #address-cells is not needed.
Remove it.

Fixes: 077e5f4f5528 ("riscv: dts: allwinner: Add the D1/D1s SoC devicetree")
Link: https://patchwork.kernel.org/project/linux-riscv/patch/20230915201946.4184468-1-robh@kernel.org/ [1]
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Chen-Yu Tsai <wens@csie.org>
CC: Jernej Skrabec <jernej.skrabec@gmail.com>
CC: Samuel Holland <samuel@sholland.org>
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: linux-sunxi@lists.linux.dev
CC: linux-kernel@vger.kernel.org
---
 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
index 8275630af977..b8684312593e 100644
--- a/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
@@ -30,7 +30,6 @@ cpu0: cpu@0 {
 			cpu0_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
 				interrupt-controller;
-				#address-cells = <0>;
 				#interrupt-cells = <1>;
 			};
 		};
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
