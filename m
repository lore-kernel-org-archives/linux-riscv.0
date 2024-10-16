Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8564D2A559
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 20:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YqpYMw7UoUx88vg4OcJadGh8w0167NNwpBA2hjzJ9jU=; b=2g5A4tPz+vGlLk
	MgKrg6HCVZdcox6MFLX4OphAHu5iKvTiVyJbZCUJZ1KI/lMoiStd8mYVKqpPtTGPOUirR/EDe5ho4
	LubSmKiTLQ2/fre5dfNLz9JpMb4agH4WxfiDOYSbPRE8XEsBisEAYyPR1lX5X3wPcA99kr2gkrz99
	SIk/YdFgHbPi/brqdp6HWmQsvqaNP8LBpchnt2thcJ1ls08+bBFUDIh2Z2Bszbw084gytSHxks5+l
	zyuFUaEYFn2sdW2MqR14FCAgPsic2Xrvi9m2QXo2T7ylEEOvv/SdBtoSdn/wzs4xnq2PO6ge0XB80
	L2Z4b4AC3LqYaGjQBkCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1ARL-0000000Cv00-2Mlz;
	Wed, 16 Oct 2024 20:16:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1ANM-0000000CuWI-3WND
	for linux-riscv@bombadil.infradead.org;
	Wed, 16 Oct 2024 20:12:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=vDXX/yNI2tCbx6ZFS2q5jIH5AkrsKobfGXpQGHMz1fY=; b=BwcRclok+oswvqxuDJ8DSKDM8z
	I/l3NFgxlvdtHKw1kTQwGJyLSWBMKb086hX/8Djwj7JiAmXbrlXQvScvfY9MFSk5S9016/SUp45ce
	oik4BYO5a8J2xgwANDzJtmSS3XEQKm5A1zLFY1kD9axyvK966ET0QK0CctI9N5cOLcGubwfbQpm9L
	OiHq9en7BMDFLP62Z3QHaWI9Vka2/EtRS67vj5WiZrEJFOxzKWBDX4XTqzZ6RXzRtTQbUXip7K7Ma
	5F2D63jhdcBAbW0nadLRvybEnGZofUD/Mruz0TLtCMsIwyVHB+NlHyEV+/rZ3CRhcQEjeFG/qDFI8
	k1qwT08w==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1ANE-00000006tj2-047p
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 20:12:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 40B7A5C5B12;
	Wed, 16 Oct 2024 20:11:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64B9C4CECD;
	Wed, 16 Oct 2024 20:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729109511;
	bh=/oKzWw2ZchUbmSx4FqbycrbLNA28FbIKpIdth/FxkZU=;
	h=From:To:Cc:Subject:Date:From;
	b=enF1OaRAmshe0lg/6tiN+mah5QpoJPjKW5zBn1kYI0+swr65LsDQQlW92iPFhJAZC
	 8SRgAats42h+luFJ76cG0gRmi++uGOS5xpYTQcIhirin0we10bT03PAAa/xB3Yhvoq
	 yJ4ctGJ/r8TMN/Gms0k+psOQ/45yuZZ3Z3rauLbmX+0+/w/HAbZITSMmg7C5/Z3Bc7
	 qkacJL1lNt+22ACyWIJNjcMkpsKbZnkv6UeRulbg/AvGEkZnx0vVCP4chVDwPAnU9z
	 Zyz361q7ibbcHBNi8NoaVFFMtRItcDzQSa6zByV6Xecg1brFXw/3RpV1/pxcbnHo8g
	 9I4zyKTZVGh/w==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	stable@vger.kernel.org,
	Aurelien Jarno <aurelien@aurel32.net>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] riscv: dts: starfive: disable unused csi/camss nodes
Date: Wed, 16 Oct 2024 21:11:15 +0100
Message-ID: <20241016-moonscape-tremor-8d41e6f741ff@spud>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1904; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=TA23QI9GhTHMBm0fZ2HR8Y0W1keRXmxZDdgD37cIfRw=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOkCso82dF42Ed7CmCvqcONVtdMn5qNmDH/uPvV7M1uGc amwaIVbRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbiZMjwi2lSNEPwXIu3lTpT ztzSqOVXnGN5baXA7hfN+2ZHbazhMmP4X9DaJ1e9+8XqnReSheZY2C078rcw+3funWcBNj2tEVW TuQE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_211202_214640_D3F3F8A7 
X-CRM114-Status: GOOD (  10.61  )
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

Aurelien reported probe failures due to the csi node being enabled
without having a camera attached to it. A camera was in the initial
submissions, but was removed from the dts, as it had not actually been
present on the board, but was from an addon board used by the
developer of the relevant drivers. The non-camera pipeline nodes were
not disabled when this happened and the probe failures are problematic
for Debian. Disable them.

CC: stable@vger.kernel.org
Fixes: 28ecaaa5af192 ("riscv: dts: starfive: jh7110: Add camera subsystem nodes")
Closes: https://lore.kernel.org/all/Zw1-vcN4CoVkfLjU@aurel32.net/
Reported-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Emil Renner Berthing <kernel@esmil.dk>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Changhuang Liang <changhuang.liang@starfivetech.com>
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index c7771b3b64758..d6c55f1cc96a9 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -128,7 +128,6 @@ &camss {
 	assigned-clocks = <&ispcrg JH7110_ISPCLK_DOM4_APB_FUNC>,
 			  <&ispcrg JH7110_ISPCLK_MIPI_RX0_PXL>;
 	assigned-clock-rates = <49500000>, <198000000>;
-	status = "okay";
 
 	ports {
 		#address-cells = <1>;
@@ -151,7 +150,6 @@ camss_from_csi2rx: endpoint {
 &csi2rx {
 	assigned-clocks = <&ispcrg JH7110_ISPCLK_VIN_SYS>;
 	assigned-clock-rates = <297000000>;
-	status = "okay";
 
 	ports {
 		#address-cells = <1>;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
