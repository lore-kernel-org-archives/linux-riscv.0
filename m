Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95AEC25B0F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Aug 2022 16:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CTx3eoQTEmp2puJruBGWMkhzquGtyhXlZmf2rdDueu0=; b=W3fVfAkFc8GpoI
	7QFlnX9Xe4C9GjxNu7pM2FtSYggcfra8sE603O3u8vSUvKE1lR4EA/9mGG1G0pd7ixFJaZcHAKLXs
	6dQ37ntWzMHS/HWE0kNXAzoaWeyFAB8e47LCxWKO6u8IObG3qwp0Sbigwlc6i3lwjliTU/c8Pb3pm
	wu/CJ5TZajjLr01pRwtfTeUlVD3Xn5XCvK3rNOOqL+4rZiOePxitPr6Y7YH3CCZR0+rVc2SVSTR3N
	MaLRUK5PZ3dQa0Hjm9HGTrpcwkPi17k21e/xSGc11UUbE5GOwECvhQBTpwCbrgZDt1FOo+2Dmfp+W
	h5THH7Q3x6gha86y0ebQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNGS7-007tju-5J; Sun, 14 Aug 2022 16:27:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNGRj-007tV3-5y
	for linux-riscv@lists.infradead.org; Sun, 14 Aug 2022 16:26:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7151D60F97;
	Sun, 14 Aug 2022 16:26:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D17C433D6;
	Sun, 14 Aug 2022 16:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660494397;
	bh=LH+qngev9GVWoKdABacpYK8mUUp5zBmrIWwMEfqludM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WhrWFqqkj7Jlj/3tVDy5gZqe9yMwOSW2XsbugGFMcs7KWvZsCn+6tpNVVdivkfVZS
	 ClXHbTxJcEV3Nz4QbCh4H7gSLKFxyk+FrPytKQAPbGJeWDXY0rWu2933dcgcvvziDL
	 MzbNyGodzuyod33EDMy3A9J9kkVPvhABuxhYHspkXoZkzJxrfhDnBGmxqn6gFh37dM
	 QxKdgQ2TFtiqoCE2HUON4dOSUHme5CIcB04de0nJZIDYikU1iZLOeoaBa+IafYbaBB
	 kO+DUXN6dTqGfiEaXQ65Sb/dm4eOJIyLPgFFWdNfoto3KzE9rSqbMJsr3tkOMu7kzW
	 shOg02ve9E6VA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Brice Goglin <Brice.Goglin@inria.fr>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	geert@linux-m68k.org,
	sboyd@kernel.org,
	zong.li@sifive.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 10/28] riscv: dts: sifive: Add fu740 topology information
Date: Sun, 14 Aug 2022 12:25:50 -0400
Message-Id: <20220814162610.2397644-10-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814162610.2397644-1-sashal@kernel.org>
References: <20220814162610.2397644-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_092639_355130_4CA292F7 
X-CRM114-Status: UNSURE (   8.58  )
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

[ Upstream commit bf6cd1c01c959a31002dfa6784c0d8caffed4cf1 ]

The fu740 has no cpu-map node, so tools like hwloc cannot correctly
parse the topology. Add the node using the existing node labels.

Reported-by: Brice Goglin <Brice.Goglin@inria.fr>
Link: https://github.com/open-mpi/hwloc/issues/536
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Link: https://lore.kernel.org/r/20220705190435.1790466-4-mail@conchuod.ie
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
index abbb960f90a0..454079a69ab4 100644
--- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
@@ -134,6 +134,30 @@ cpu4_intc: interrupt-controller {
 				interrupt-controller;
 			};
 		};
+
+		cpu-map {
+			cluster0 {
+				core0 {
+					cpu = <&cpu0>;
+				};
+
+				core1 {
+					cpu = <&cpu1>;
+				};
+
+				core2 {
+					cpu = <&cpu2>;
+				};
+
+				core3 {
+					cpu = <&cpu3>;
+				};
+
+				core4 {
+					cpu = <&cpu4>;
+				};
+			};
+		};
 	};
 	soc {
 		#address-cells = <2>;
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
