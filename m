Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4CBC25B0F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Aug 2022 16:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NnVXL89ZcAKWnmX2mgWUkf71g6Ok0iQIfKM+oLawKWI=; b=AuBHISGmD8wryL
	0XNrTiko6N5vUwTRZpCl+2UccK7ypxLaAJ7I2ZNZIknTmX/i4ar0nMr53+g9rEpBYxSDeBiDcCD14
	uCDFLk1p99Vor9945lT9s6LBzCoXCwUbKFWqqDMfTBhV4pFHRDLapF/HX4N6L90YAUWVGVs13yrs5
	3VS97AJM4b7ydJMEgQGdGRTwdCRFSalmDLvELrTo5b2xFsZY6bLPZMrqbQ9akHPq3t+OkWJdvYjyE
	nqR3cB5QEYI4Jax3/HWSml/c7wwd+u1pUkb38U3XlasnoHHAkthVUJsYVMq+L+c5cbQD6wQB3pshD
	N25XBf5XTiaJR63iYpsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNGPZ-007rrD-Cd; Sun, 14 Aug 2022 16:24:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNGPI-007rdk-Ss
	for linux-riscv@lists.infradead.org; Sun, 14 Aug 2022 16:24:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7E29B60F40;
	Sun, 14 Aug 2022 16:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF6C4C433B5;
	Sun, 14 Aug 2022 16:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660494248;
	bh=9DPDtYyccClLJs//EdauPupiVQGXhPthx19K2X2kN90=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YdJNVUPkJuCDdP60wTGL5h8fFbDeoYMLrISf+no4TFne4KFIhjuZT6nLQCOyuDhFc
	 nq1Zfcp+rNaqnlUUK74z1fHd289lVSedwZadaAi0G0b97k3eeX1+jALpt3NtXYRniK
	 sPcfzpvAi08E6SG9XCF4FQO3e0/us/aZFp1YFULSi7bnIaREoVT49qgWpP2BKaIO1A
	 6gwHPLT5c4OCUk42md1lCDJQv1bNOMAo/1CYT9fnQVIbT9+bXIdkdsJT408GGojht5
	 U9RjzaDNkRexaXhj2z9vdGC/LbbQsZMvC4bU1+n8hrkpUkrtQBaslsrGfBaSN/sE/+
	 fIdcY7rcBzQvQ==
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
	sboyd@kernel.org,
	geert@linux-m68k.org,
	zong.li@sifive.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.18 12/39] riscv: dts: sifive: Add fu740 topology information
Date: Sun, 14 Aug 2022 12:23:01 -0400
Message-Id: <20220814162332.2396012-12-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814162332.2396012-1-sashal@kernel.org>
References: <20220814162332.2396012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_092411_911173_429EABE6 
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
index 7b77c13496d8..43bed6c0a84f 100644
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
