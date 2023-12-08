Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B24C10F05
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 17:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ckqyQFD5kHba5XiNvttEa4cUlKgtxtBQvGOv6aL3G2A=; b=cFT/sV8VOLVlj7
	Gw+Iioz0NXyJcMz5EB6O1o3XXCHrIewRy4V38DG6UVdjhOxPGw0zfwacMJUciQZeX56b5q3V5ZQLO
	A7ZsfHtwpb8X9fkQi7/L+I1Oq5O3Yq0KopYdzc11rtI00ZR6psZ0Mfe5LNU0SrQW2mLms6KrByuNU
	GNX+yI2D02UxQx2ON7Lt8nrxZqe1PmNBdsfaj+QlU5H0JJbDsFfTmIDgNrQtoDG0G7ouWfJWxrnlf
	DoOenkynD+GrgHe9mfMowK/D3m2/Q/iXiKcv68wo7lKaeSxBn7Th+vKrbi2dzu+1ux80mTDUZtSRS
	D6fg1NGybYuCJgCCNKbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBePK-00G8Ts-2N;
	Fri, 08 Dec 2023 17:12:58 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBePH-00G8SZ-15
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 17:12:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id C6625B82BBC;
	Fri,  8 Dec 2023 17:12:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C8CC433C8;
	Fri,  8 Dec 2023 17:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702055572;
	bh=ql7Qc7mHZuJWNEdwoCm65rNDTnn46kCfsFyApUyqUWU=;
	h=From:To:Cc:Subject:Date:From;
	b=P7k7UqP8De/SibgWe6u8U0i8Zw774kaRSKV0M9bt1u2TEXmxxfM2xfMJ2Le33G3g7
	 JOW8kiYILmCop2Kk5UTjmodpBjidwvlkOcGyJG1zqdBNXP2zII5ZEyWZc7VdTiJed7
	 dNIttzEvxvic2IoKezb6jo2UELAGqiCwtDPQjhNH+9zH2QHV3vbcaf6nUFTstEuwG9
	 iXx0IL42FeqUq8cx1s3m0PCkeaGDVBlNyxxpanY6jM2Ie+k/2cCa+72K4rs/ipTW18
	 1KPG9DmLmo2NgIJHs9pmtd+15jDx1iwVmBLnC4o4DR++2C7CaN/T3iHiHjv6f+1TFN
	 y7PBWaizCJ9Qg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH RESEND v1 0/7] MPFS clock fixes required for correct CAN clock modeling
Date: Fri,  8 Dec 2023 17:12:22 +0000
Message-Id: <20231208-reenter-ajar-b6223e5134b3@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2493; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=eqRhJ3n3jLyGqJ/VATAkkisT23EENVXb+YAq1ZZ3BDE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnFfmVrHT/vzn8y5/vU+uk9NsWFmd92Ty6Z9Zxb1Un+z doLGsU1HaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZhIww2G/6HbLqguFmhrkjt0 SbTcTNx4dYcir9qxkG/7Y+Sq9wbWuzD8M1M7cG1qudKetdyPt0wO0pNKbU6Nt5uZM+nQ9pinnTn MvAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_091255_690645_62D307C7 
X-CRM114-Status: UNSURE (   9.95  )
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

Resending cos I accidentally only sent the cover letter a few minutes
prior to this series, due to screwing up a dry run of sending.
:clown_face:

While reviewing a CAN clock driver internally for MPFS [1], I realised
that the modeling of the MSSPLL such that one one of its outputs could
be used was not correct. The CAN controllers on MPFS take 2 input
clocks - one that is the bus clock, acquired from the main MSSPLL and
a second clock for the AHB interface to the result of the SoC.
Currently the binding for the CAN controllers and the represetnation
of the MSSPLL only allows for one of these clocks.
Modify the binding and devicetree to expect two clocks and rework the
main clock controller driver for MPFS such that it is capable of
providing multiple outputs from the MSSPLL.

Cheers,
Conor.

1 - Hopefully that'll show up on the lists soon, once we are happy with
  it ourselves.

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Wolfgang Grandegger <wg@grandegger.com>
CC: Marc Kleine-Budde <mkl@pengutronix.de>
CC: "David S. Miller" <davem@davemloft.net>
CC: Eric Dumazet <edumazet@google.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Paolo Abeni <pabeni@redhat.com>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: Michael Turquette <mturquette@baylibre.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: linux-can@vger.kernel.org
CC: netdev@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-clk@vger.kernel.org

Conor Dooley (7):
  dt-bindings: clock: mpfs: add more MSSPLL output definitions
  dt-bindings: can: mpfs: add missing required clock
  clk: microchip: mpfs: split MSSPLL in two
  clk: microchip: mpfs: setup for using other mss pll outputs
  clk: microchip: mpfs: add missing MSSPLL outputs
  clk: microchip: mpfs: convert MSSPLL outputs to clk_divider
  riscv: dts: microchip: add missing CAN bus clocks

 .../bindings/net/can/microchip,mpfs-can.yaml  |   7 +-
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |   4 +-
 drivers/clk/microchip/clk-mpfs.c              | 154 ++++++++++--------
 .../dt-bindings/clock/microchip,mpfs-clock.h  |   5 +
 4 files changed, 99 insertions(+), 71 deletions(-)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
