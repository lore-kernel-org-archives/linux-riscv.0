Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79332C021A0
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 20:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5Ex3mE4CP/CaohsH45WGYbbLzcWN7AibWaz82noLrCk=; b=odhNEyzV9JUo5q
	WmX2pYufQvSXDRT/065vFALeiUi9E8Stp0V7q/4P5ztFrmnO8WPVfTmjss3TKBcODTzPKgH7G8mmm
	WIRn3plS5GXrnlzcRP38FDfcmcqcCGE4dgdRg+BeCOeilxgYyx2hmZVvc6fVOxvawgY17p4jNlnJd
	Otsxr1Nvke9jphGWBusT7AxUMCu4MKl/RJhf7FXQLRE3lbDbhckxi2f4Qdre3lyfjPrBkDuByofwc
	CjKMFXmxDiEREJpMNCNGuB1K/1Oll111fjZ3WmRlETHBb42Hxq+SWclbx+vCMFa58KhgI+V9s5P+E
	W3wSPJ1EHSKkKL8Lgltw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tifRh-0000000CUYf-2rrL;
	Thu, 13 Feb 2025 20:04:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tifRg-0000000CUYM-2GKa
	for linux-riscv@bombadil.infradead.org;
	Thu, 13 Feb 2025 20:04:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Se6z/G2pjPzS8mYJlN7DVoDDyRYRpurKSBYh/AO2Ycg=; b=dz/ComkW6D9yZVAwzP7pzYM6nc
	KzUkbbeRoOf8Qd51Ihni96+9ONJm5q2VXf9SozAAZ4uv9+WhvNeZyqMzPAO0H9STT97d1iGhr3RF/
	CKtUeIExu/AF9aKYFoourj4AAxwK2XoLVf6KT0NmGbMggmiDrlSWtsOhayAU6ieEE01+kXcwU+Ncn
	dKqvkdRyzFDUjGbWA6qgG0Y6lwgRpiwM8yuhN6VjvycoYL7v39ql2ebGunwphigOoHkh9z37a3NGc
	JGjpL+88htLXi5MhuL13k1n2m0v9oi+RldNovoXUHxQAGtsnft2xePI2G71DsaKTD1qLsN4c1dwVh
	146pTq4Q==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tifRd-0000000159H-2zc0
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 20:04:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6195DA40B81;
	Thu, 13 Feb 2025 20:02:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A8EC4CED1;
	Thu, 13 Feb 2025 20:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739477055;
	bh=fZ9g4z7iJBs0CfgSH7MAc1CKB24UVVzf/LWilt9EvvQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Ulg/rzDWtr+ncf8DLmyiSNeilp2TbJIlkWq6GE55T0Yg7zZCAQ5oTfnybJLTqW/7B
	 IoUzKxEEN/xrJMjfU3TUICXKI3TAO8EwKFdsA3aJQdqXjo2ChVM48ReJo3zRFWJAnp
	 XaQ35ckVJkFFyx2liIkEaQo1dceJKzdsrPQLfuwp88yz5UkxCyLcWFkiDMBFJVM4c1
	 UWnkoG632dYFPaA+C9GD6F649NEvoxSLeIeMutnYiea3AJvNGPgrXjD3z/46dFCYro
	 QSdkvdcao/baIfy3u4IKlGMVbCXVVbP1KW9eYqUM01ifPdkERsHd+Hvotzb745g/pf
	 qCCbRaerQtrwQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] riscv: dts: starfive: remove non-existent dac from jh7110
Date: Thu, 13 Feb 2025 20:03:52 +0000
Message-ID: <20250213-tidy-dollop-cbfc8fc7dc91@spud>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1249; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=YaSz6TVHGRo6Wy0JnL9W0K4x8SDhrDVeJ8YpmvuOuck=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOnrAtT3P9cwuWpnmnZP0bH9k67P5aZjEWXHeZ9NuV2ow faKf/vGjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExkzmZGhhdfLhTWqhhsyxd/ uey9htz85itpH3vrZjreXcXzVduoR4Lhv8OrD1fuOHiJfG2NtBHPMz17O8f48XzTA/M3fSlg1P0 oxAsA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_200421_978635_E37AAF6B 
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

From: Conor Dooley <conor.dooley@microchip.com>

The jh7110 boards do not have a Rohm DAC on them as far as I
can tell, and they certainly do not have a dh2228fv, as this device does
not actually exist! Remove the dac nodes from the devicetrees as it is
not acceptable to pretend to have a device on a board in order to bind
the spidev driver in Linux.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Emil Renner Berthing <kernel@esmil.dk>
CC: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index dd2eefc295e5..c2f70f5e2918 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -350,12 +350,6 @@ &pwm {
 &spi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi0_pins>;
-
-	spi_dev0: spi@0 {
-		compatible = "rohm,dh2228fv";
-		reg = <0>;
-		spi-max-frequency = <10000000>;
-	};
 };
 
 &syscrg {
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
