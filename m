Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65799D46BF8
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 20:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iKkuRdJrFz22TUEWsT9lmSXciU5RfAyHxRlIBg3fDv4=; b=3jn453BdSa81tM
	25C6lm9Gp0gCwIsNgni6Q+Y2BFWAw8yfZa22d84MMgIQEzzqc7eSelRbTux/PYxjIAKBqYAev+rud
	/pUecHV9b3d/Whp89kPni2/b5bcEHOf1hXgNui4yy94k9UsWCLf6r7Zofbl/Fe5BEeCaFVWpPTXCJ
	qgVMxjWM/DUbhKu6UJe2num5rEvcAgXUpbmY8HsDZs5KUGGPEYSTQQTo+XzLLKgvB6Wg3i530YFMY
	Fdx+zpezFDC9QRWIguRlpuYJeB+Bk63zUred4daJA6AkP3piwaERkS4k7USG8a2agQY30z+eAwamf
	7r2+wh4HaX2dLlbSsf+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCV4-0000000Gnpf-0jsq;
	Wed, 28 Jan 2026 20:50:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlCV2-0000000Gnox-0Bkx
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 20:50:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 22D9F60054;
	Wed, 28 Jan 2026 20:50:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E83C4CEF1;
	Wed, 28 Jan 2026 20:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769633450;
	bh=lM5fIi3NelBBKB14alRyxnqnJtITZZuraUrN4J/TpFM=;
	h=From:To:Cc:Subject:Date:From;
	b=gyRk1OXsH0AxeR/aF7M2zGnCo7coDF2/i6EMP30JG6jpqZGEhIY5m56ObJIpOhDsA
	 hncAPhqUnZpA4WYIvY0W4Z0skJ//o0n0YE2GWqCM+Q0dRPK1jobdUCDyEJg7OdnNRj
	 Qbr3n0304ojdv2OewyIathVtLLfZjpzZ/0X7ZNeDfxd5tMh/kNeVOsYTitFjqeAXSm
	 WKX16ItFmU36YbKYpsLqOVD3cHLR4bRl++6wOqwKX4NOtCIoSGXrD3janNHiB2tuHe
	 yuucSvzt1kC0g1GgNKbBRCg8THTfGlx5QQMvBlbowXZLxpK6fg6XbX1Mvwwz8OlOX9
	 uMnk1hkYZMMSg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] riscv: dts: microchip: add can resets to mpfs
Date: Wed, 28 Jan 2026 20:50:33 +0000
Message-ID: <20260128-nacho-craziness-45a3e575ba7c@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1489; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=GR0IpqkX+gIEkISSWGAk7yZ/QLJAVSxCkhhIZHOiQug=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJlVZTOTr0zXk4xcsGbb5q/z2tS3zJARvho3w7iFz9/7S stbpzr/jlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzE/hTDPzulz27f7b7l+bp+ 7GwvUNov9bazbdW3CVE2DDwacyxDRRgZZobMN5P8GsQ980iJlFZh6b8ffi8bPT/GRrB2Xu/aJvy EFwA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

The can IP on PolarFire SoC requires the use of the blocks reset
during normal operation, and the property is therefore required by the
binding, causing a warning on the m100pfsevp board where it is default
enabled:
mpfs-m100pfsevp.dtb: can@2010c000 (microchip,mpfs-can): 'resets' is a required property
Add the reset to both can nodes.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

 arch/riscv/boot/dts/microchip/mpfs.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index 5c2963e269b8..a0ffedc2d344 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -428,6 +428,7 @@ can0: can@2010c000 {
 			clocks = <&clkcfg CLK_CAN0>, <&clkcfg CLK_MSSPLL3>;
 			interrupt-parent = <&plic>;
 			interrupts = <56>;
+			resets = <&mss_top_sysreg CLK_CAN0>;
 			status = "disabled";
 		};
 
@@ -437,6 +438,7 @@ can1: can@2010d000 {
 			clocks = <&clkcfg CLK_CAN1>, <&clkcfg CLK_MSSPLL3>;
 			interrupt-parent = <&plic>;
 			interrupts = <57>;
+			resets = <&mss_top_sysreg CLK_CAN1>;
 			status = "disabled";
 		};
 
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
