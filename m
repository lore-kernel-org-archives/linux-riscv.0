Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821EFC25B06
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Aug 2022 16:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M08L9ijoOngWZUnOqp4ZonmWOEMfsBtRAYHcRbgOcJI=; b=gR85o9QSJbMgyM
	8a2YJXxYEl0LEaNxaKho/pnFBo5QnuHLu9TgdszYpxH23NWiyYM2g/709+HV6gL7t/3R6opk/CAJ0
	EH2QvKWGtoFBe/9bOjIyiys6boqd7oBY77b6y+VGpuCv1vekcc2za4fR1xz4UTW44abkpPGS+CF2O
	h4Anj81WDmtDYTNUq5Z19zfcGcLtgINguIxYajSg0xr3Ue+eN3RjVYQMfXTfKoZya6CMa/gjhhTOW
	bjJChDmaJudK7Z3PidLpNlMiKQeBSflXYOrddxoeTr0IF4ps+Hdzgk84vSziN+KP2eLEX8aY524He
	cNZjYddYRLVyg1j4ltdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNGPe-007rvK-GA; Sun, 14 Aug 2022 16:24:30 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNGPO-007rgz-7Y
	for linux-riscv@lists.infradead.org; Sun, 14 Aug 2022 16:24:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CF30EB80B7E;
	Sun, 14 Aug 2022 16:24:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12C60C433D6;
	Sun, 14 Aug 2022 16:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660494251;
	bh=t3xlxbpc+pSeSGh1Ge9cevaG2rWDIJOPlc1y8yJahgc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hCA0nyfZyRd+7tuEPmzqyY9Br0WfZUe+mhX2zXjk5NiahHVq/rGcactjFBMxGGaoU
	 irj5GlqaMV9n8fO5S206t+bji3aPMoOXvMW/AF0kIKMgo5EPpTpgD2cTw4PMJzRaUz
	 qC7QKM2/pyv1+8N/27jvanBEZtw81I3vnowuu0AH4QkY7BaPq8581kq4aOSgd4mVKd
	 UpbxMCvsFfyhPy+Bs5xylKUZPRn3+SUApdRj7D8pIk20fmNQxRVH67hNRAfc772FbO
	 qzY9Gm4W8Ku+jAQ9NiVhir7+gHztVaJuCpRQyfMPvv1xsdk5kEao4HDLk9Zx8s4Iaj
	 v93yPtXnWGGvw==
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
Subject: [PATCH AUTOSEL 5.18 13/39] riscv: dts: canaan: Add k210 topology information
Date: Sun, 14 Aug 2022 12:23:02 -0400
Message-Id: <20220814162332.2396012-13-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814162332.2396012-1-sashal@kernel.org>
References: <20220814162332.2396012-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_092414_676697_B81C5EB7 
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
index 44d338514761..ec944d1537dc 100644
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
