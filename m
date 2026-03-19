Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9633D109024C
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 16:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uXHT4rIoy87ujMp55ZfrPtIrnISd+yrKrkaFuZ/LPzs=; b=LrMfgAOnZyAXr2
	jniQJwIYa9Z7HN6qEQwPhLl8y463nKxKy+oxAy2oI9GttKyp60tNR7Qnhr4449Gndv4v4oXBd284O
	vBc3S56oSsSMhmGXYtTH9Wl6FIbYADvvq9L9/Ever20F/dv0wD26lP0EkSZJb2Bh0wJ11SP5yrH9U
	OQIpT6G5+ssqBOePRDi4UFVmzyGIj+GOkaTGaBVteeP94HEr+hKQzY5LLgUFmUmuE/3btIp6kQG5f
	t2RbXc+xpUHOL/VeGyZ7s9WsuWNfYSTO4rd0lnIDQYA0CJTADORxQ+HPbMR59FxchMJVOk73fKAPE
	xeOel7vHqrFWAqF+YmjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GHq-0000000B5ED-1j4C;
	Thu, 19 Mar 2026 16:31:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3GHo-0000000B5DL-0hQi
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 16:31:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DDD9444496;
	Thu, 19 Mar 2026 16:31:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97031C19425;
	Thu, 19 Mar 2026 16:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773937911;
	bh=Wbahtba5HIxMuWjTSaKR/tjyp9GROktgLQAr5GOLj2I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CLNNrhcW2g30jJ4F/93QLj6H0Yz/jdGC/6KTn4jnKINNTPZ4X/156LBlpv/mloHRY
	 eOizrbgw1kr/O1zvARqZay/ZO0tGJyH9hpDtutnkzl7kFiHeH5WTKf+4oBVRjMGptB
	 zlqpqOy6UZvbIy+4UmFbJpzmAql6YQwxr4IW3I1mkRm1mXr00V8lxOwXlAm3a7rIsF
	 gCW0+3E92oswrclHL/1zGrUrob/aZL1s3/RDG2N92lesJ0eZhs+R5xCGTyjaPawlKY
	 xAFyDmc9oFQtfT12vTwzjru7N17aoe0dJgJWvNeNhlk95DaW7hYAxH2YZEdU/TriYT
	 NpZNVx3dukQ+A==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Valentina.FernandezAlanis@microchip.com,
	Brian.Burke@microchip.com,
	cyril.jean@microchip.com
Subject: [PATCH v1 4/5] riscv: dts: microchip: add adc interrupt on beaglev-fire
Date: Thu, 19 Mar 2026 16:31:18 +0000
Message-ID: <20260319-speak-detached-f4e4384a2372@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260319-outsell-hypnotic-94b480408ad4@spud>
References: <20260319-outsell-hypnotic-94b480408ad4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=997; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=49hModmjRGQS7kbC86IMrIwIz56IHj7rQ9pX9Z/u1qc=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJl7VK7KRIgeO3zu+R4+4S7Vgk3H1Bdls3lnXFE+uOdp8 GTZX4q3O0pZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjAR9hmMDBdXxmTYqaU6Hgzk YlOpU3rF2LXhBdO71/9PFu0peHpaV5/hF9N+Zr+VKWLMoTvb/GY+fDspsYNN+FrctN8y2f2Z/5s VWAE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_093152_239508_C162BE7E 
X-CRM114-Status: UNSURE (   8.45  )
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

The mcp3464r on the beaglev-fire has its interrupt wired up, but not
present in the devicetree. Add it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts b/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
index 37c3525d490c0..e8d0a825a5bfc 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-beaglev-fire.dts
@@ -4,6 +4,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include "mpfs.dtsi"
 #include "mpfs-beaglev-fire-fabric.dtsi"
 
@@ -226,6 +227,7 @@ adc@0 {
 		spi-cpha;
 		spi-max-frequency = <5000000>;
 		microchip,hw-device-address = <1>;
+		interrupts-extended = <&gpio1 20 IRQ_TYPE_LEVEL_LOW>;
 		#address-cells = <1>;
 		#size-cells = <0>;
 		status = "okay";
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
