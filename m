Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D702C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 02:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKzvTUMfmY9ihsvWW1qn+Ob2SHjYwzKmkanKUIl7muU=; b=yEjKaMwQvaBxEx
	Wqgs3XYzTEs7kj/Eftli29gZGNhH8C//phc/vLHqi5L1cYfecqVuO/4tFZhANJ3ULxW34hmeU9tto
	1XsN1O/5icHNUVEPY3wXsEwYsmKVxbe5Q1TeaZXutpPS5DGjYYOtCMA3XvqsHnc8nSGOls1tBTShU
	Mexla1iHkPXrPuQDcfieW6Ge2UOItIxRxKzzIrOzsqwg4NYzrpb8S/E938etY7k9JZnzqjiJwL/Cl
	3UWhX9cYTR7gVphQACwzdU/3Am48O+omgo9ZT5trL1kVSlyFfA4P4/X4fQ6jEX0UydxIeuphtqS9a
	U44Vvf0khs+iujGJvsGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqR0S-0090uq-S5; Fri, 26 Nov 2021 02:30:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqR0Q-0090uP-0R
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 02:30:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4482761153;
 Fri, 26 Nov 2021 02:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637893829;
 bh=1ckL1UOukGatH9rWkaaEsSmMeMXtaRnOe1jHyjUlYkU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HR37TroxYgrn8xjJm7VpeEBOZZfVkIoUWkBPIjk2il/VF6PMPZpAGVn1DGuuA/apo
 2Pb8HFfsiEWgqr56yAAuH5c24zTLHXxJnrQH426jV+UrQuw4U4XCAiN9BlEQzXEeob
 wFqLw3uwROfi9anGpKPL9mFYO4x22u/zw0kITxewNw5M3Z/sEKChdZzXpTyR8L1xln
 Fp1BgeDuAp5Q/02I5jBVMJc78jdQcX7Naluspeimvp+tJ0AWQciYJijZzxDz1+B12P
 FIDctFksxKknxUC+6Feo4bsIEiUveUy5x5L7gLqJabpz/3aWpiA8Q3tqfBbKWYj6s9
 88AUFPATiSBMA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Sasha Levin <sashal@kernel.org>,
 robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, geert@linux-m68k.org, conor.dooley@microchip.com,
 bin.meng@windriver.com, atish.patra@wdc.com, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 4/7] riscv: dts: microchip: drop duplicated
 MMC/SDHC node
Date: Thu, 25 Nov 2021 21:30:03 -0500
Message-Id: <20211126023006.440839-4-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211126023006.440839-1-sashal@kernel.org>
References: <20211126023006.440839-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211125_183030_136997_867E5EBD 
X-CRM114-Status: UNSURE (   9.97  )
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

From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

[ Upstream commit 42a57a47bb0c0f531321a7001972a3ca121409bd ]

Devicetree source is a description of hardware and hardware has only one
block @20008000 which can be configured either as eMMC or SDHC.  Having
two node for different modes is an obscure, unusual and confusing way to
configure it.  Instead the board file is supposed to customize the block
to its needs, e.g. to SDHC mode.

This fixes dtbs_check warning:
  arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: sdhc@20008000: $nodename:0: 'sdhc@20008000' does not match '^mmc(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../microchip/microchip-mpfs-icicle-kit.dts   | 11 ++++++-
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 29 ++-----------------
 2 files changed, 12 insertions(+), 28 deletions(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index be0d77624cf53..cce5eca31f257 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -56,8 +56,17 @@ &serial3 {
 	status = "okay";
 };
 
-&sdcard {
+&mmc {
 	status = "okay";
+
+	bus-width = <4>;
+	disable-wp;
+	cap-sd-highspeed;
+	card-detect-delay = <200>;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
 };
 
 &emac0 {
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 446f41d6a87e9..b12fd594e7172 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -262,39 +262,14 @@ serial3: serial@20104000 {
 			status = "disabled";
 		};
 
-		emmc: mmc@20008000 {
+		/* Common node entry for emmc/sd */
+		mmc: mmc@20008000 {
 			compatible = "cdns,sd4hc";
 			reg = <0x0 0x20008000 0x0 0x1000>;
 			interrupt-parent = <&plic>;
 			interrupts = <88 89>;
 			pinctrl-names = "default";
 			clocks = <&clkcfg 6>;
-			bus-width = <4>;
-			cap-mmc-highspeed;
-			mmc-ddr-3_3v;
-			max-frequency = <200000000>;
-			non-removable;
-			no-sd;
-			no-sdio;
-			voltage-ranges = <3300 3300>;
-			status = "disabled";
-		};
-
-		sdcard: sdhc@20008000 {
-			compatible = "cdns,sd4hc";
-			reg = <0x0 0x20008000 0x0 0x1000>;
-			interrupt-parent = <&plic>;
-			interrupts = <88>;
-			pinctrl-names = "default";
-			clocks = <&clkcfg 6>;
-			bus-width = <4>;
-			disable-wp;
-			cap-sd-highspeed;
-			card-detect-delay = <200>;
-			sd-uhs-sdr12;
-			sd-uhs-sdr25;
-			sd-uhs-sdr50;
-			sd-uhs-sdr104;
 			max-frequency = <200000000>;
 			status = "disabled";
 		};
-- 
2.33.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
