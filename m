Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599EBC25B06
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Aug 2022 16:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=88QHHCPAi8t9txoibYAyTqZzk43513lLYVgsMN4kVQU=; b=i1/2BQZpMB5Nvv
	V1hnyjpTFU3chVhTjMlC7vd8m80WseYODXXxQ7+hG41sKqWXmIQEp4a05O4/9XB6CSEJv/hGszKYK
	xVCrQ9FT6gVPXghsb+Uf6Lx0fsguYom/tHEA5y9WUOY6EbWSydcWYxTNZwRk4kEVax/L2KycVHN+L
	nVLtFPiZqdEyXHiskFZQGQdq1rv2i3UjpKOe9Yf3SHSNx9+3vahuzKrhPGQMlrKnh10npFIZY1cZY
	/mnqzVlGGKdF4sFKfgjgpd9D4aex3npGxBE1Jw9wd0hxlgZ42JFXFisF18w30QdHgoHkl/Xvfh+ae
	bemNWv4aVrNRteeznaiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNGS9-007tmG-VQ; Sun, 14 Aug 2022 16:27:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNGRm-007tY1-Mv
	for linux-riscv@lists.infradead.org; Sun, 14 Aug 2022 16:26:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5158560F97;
	Sun, 14 Aug 2022 16:26:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F2BC433C1;
	Sun, 14 Aug 2022 16:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660494401;
	bh=EQ1NnPX8MJeaFiLoKQL45wdz28k3pAbXNj+YBpRii8k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=q1AYukjlLxgny5QcZxg3boPa3H7iKnMNUHLHM/oIQnxSuW21r+1tDe02duvXlDSAJ
	 DDTvvLBM5Ue2pdSy6CZqY2paGDgiSlJ4zLobxqtPVfiVZATB7U3cb6CW1bzsiWZA0Z
	 Jn0RxNcz5JROznwRQnZ45WGnJcxcOuNslkp2E0K0V4/xpAq5YPxGimc1+0bXOpDqvR
	 yoRFqn3AxtXhtSqWzmLSdmf/U0AThJ/XtwIEz1GfJpHL/Qm0+lmL3v/31h96efSVBV
	 w4WS3/gOsWGRZ6r3/POBLpWhmPdaMTtAY+wrOxXhv8JuCwXQkGir+DMNdtk2qQKpR4
	 3KOi0rED+PdhA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Brice Goglin <Brice.Goglin@inria.fr>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	geert@linux-m68k.org,
	niklas.cassel@wdc.com,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 11/28] riscv: dts: canaan: Add k210 topology information
Date: Sun, 14 Aug 2022 12:25:51 -0400
Message-Id: <20220814162610.2397644-11-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814162610.2397644-1-sashal@kernel.org>
References: <20220814162610.2397644-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_092642_946631_E0ED3E0A 
X-CRM114-Status: UNSURE (   8.46  )
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

[ Upstream commit d9d193dea8666bbf69fc21c5bdcdabaa34a466e3 ]

The k210 has no cpu-map node, so tools like hwloc cannot correctly
parse the topology. Add the node using the existing node labels.

Reported-by: Brice Goglin <Brice.Goglin@inria.fr>
Link: https://github.com/open-mpi/hwloc/issues/536
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Link: https://lore.kernel.org/r/20220705190435.1790466-6-mail@conchuod.ie
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index 780416d489aa..fa9162e3afa3 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -65,6 +65,18 @@ cpu1_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
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
+			};
+		};
 	};
 
 	sram: memory@80000000 {
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
