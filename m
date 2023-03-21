Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271B2C6FD20
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 21:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4m/Pdlo4SEL7JzJDgvksr6nwWox/Bxlbg1KW6FgRX0=; b=MrIFAVYqS2+Ge3
	Lj7OxaMW0x5Isq9yCX9tz+WnW62SdMs2qCugddOyc7BD8lCNlc43/d9bbDRremv2Db+2IDWHNTQAQ
	Wv9ih3D9B7NUpXvA4mvPB2P266MX96sgBDgdh/EDpGj9bgIHI9rhK6beTply30wftEn/w/8z7VOdG
	x0LrAABevKlrPFCnFdaJIVxFwF23P7rZ0Vv7fEblr3zew0SXkDqDmCc+DZKhc/nM1WLbmMKAb4PXk
	txhmPAzpauB0KVldBMK/X87Z38JirfWIvtDRgBs4mZdDIXYmDO9ej/i/Epeb/bilH+11NyAMuxbTt
	wlNbwGgKDLPqWlj6cNGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pejzS-00Dsrz-0V;
	Tue, 21 Mar 2023 21:57:58 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pejyP-00DsBc-0n;
	Tue, 21 Mar 2023 21:56:54 +0000
Received: from localhost (unknown [188.24.179.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DDA8A66030EC;
	Tue, 21 Mar 2023 21:56:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679435812;
	bh=+MtX3jyXI+IUnWH8L4gmCzjEp2lgpmeRUn7E2R8gEZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VzXWPHcPGumZEt6p92/sYRVKTJy7TawAlOsfr0i0+FkosNRd7SnKRt2zwb7N0Fec9
	 BPDfQSzTOvBEdEo3QUcQvE2hrSw4uibFWJdJMTvTzeHGxs4UCONLMvliItUwZdEDA9
	 fyctN2f7sTmNgBUt6mKoJ6d8wnLzx0NG2c1vRDMD8DQJ/ImgOJVn4FR9cZ+QLQf33G
	 Gztc+a1mvtLGCNUH7IH8rHbp6D9Bgw1718z62irSyfm/DZfURKu6zESJjJMIdRtM9E
	 rRe4Eh2/iL1X/kzWAp7H0l2W4haeQIvMRaLFTP9dxeETqJ/32kP3ZEWiDbvjiO5geY
	 9h43t8Wd4XMiQ==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>
Cc: linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 07/10] arm64: dts: rockchip: rk3588s: Move assigned-clocks/assigned-clock-rates out of scmi
Date: Tue, 21 Mar 2023 23:56:21 +0200
Message-Id: <20230321215624.78383-8-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230321215624.78383-1-cristian.ciocaltea@collabora.com>
References: <20230321215624.78383-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_145653_413522_8E2F55ED 
X-CRM114-Status: GOOD (  10.68  )
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

Since commit df4fdd0db475 ("dt-bindings: firmware: arm,scmi: Restrict
protocol child node properties") the following dtbs_check warning is
shown:

  rk3588-rock-5b.dtb: scmi: protocol@14: Unevaluated properties are not
  allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)

Since adding the missing properties to
Documentation/devicetree/bindings/firmware/arm,scmi.yaml was not an
acceptable solution, move them from scmi to cpu nodes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
index fca8503aed8c..24039144dfec 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588s.dtsi
@@ -136,6 +136,8 @@ cpu_b0: cpu@400 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			clocks = <&scmi_clk SCMI_CLK_CPUB01>;
+			assigned-clocks = <&scmi_clk SCMI_CLK_CPUB01>;
+			assigned-clock-rates = <1200000000>;
 			cpu-idle-states = <&CPU_SLEEP>;
 			i-cache-size = <65536>;
 			i-cache-line-size = <64>;
@@ -174,6 +176,8 @@ cpu_b2: cpu@600 {
 			enable-method = "psci";
 			capacity-dmips-mhz = <1024>;
 			clocks = <&scmi_clk SCMI_CLK_CPUB23>;
+			assigned-clocks = <&scmi_clk SCMI_CLK_CPUB23>;
+			assigned-clock-rates = <1200000000>;
 			cpu-idle-states = <&CPU_SLEEP>;
 			i-cache-size = <65536>;
 			i-cache-line-size = <64>;
@@ -304,10 +308,6 @@ scmi: scmi {
 
 			scmi_clk: protocol@14 {
 				reg = <0x14>;
-				assigned-clocks = <&scmi_clk SCMI_CLK_CPUB01>,
-						  <&scmi_clk SCMI_CLK_CPUB23>;
-				assigned-clock-rates = <1200000000>,
-						       <1200000000>;
 				#clock-cells = <1>;
 			};
 
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
