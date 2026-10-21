Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6F460A3807
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 19:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IhMTl5FW;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DSPh0OBM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UMq9ly30BloQYFYkN3QdC+T4GIEePFoh53rru6OMWhc=; b=IhMTl5FWNaSRBz
	odsaRZkKJReIHtBgzqQPMs1zN1zFIErr0pGCZxDOuLgYsLKZ8iSJWCi4ndItnf25DmSkcGii0YqSQ
	7biaGJNAckD7DGhVb97kg01srK5FIlE6VBnwW/nwGx/qd/ttw/qvmlZ6T7bDTgXL4soYTzIyh9cWS
	w8v079rlIMcOMeViVBtGZR4qqqtWO+zITOGzvK3ASvg8SRLzUhq6R8Tce0rvbCWQE7ZX8o3uKTiKn
	JqrRNY4cvckIZ936yw4AyDiiin+79S8m1eEE+OmZUZIix49flIYW0Zf5qN7YPLNhld7btGGm5fnSr
	xP3EO8vE/Uj2gHik6tKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJcNV-0000000CmfQ-2O3h;
	Wed, 21 Oct 2026 19:53:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJcNR-0000000Cmbj-1NlY
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 19:53:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1682943D52;
	Wed, 21 Oct 2026 19:53:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792612413;
	b=hfeE+y09NNz3xS+92SpJUX8oeubc3rMfJOF3gvKlMHSEG4OVrV39Xcnb68z7unljh6xm
	 t3Bt4PpJQyhStNVlfxxQQe5Vg2Re+qBGhOp/27gdKeEWp6Ywl+EiXxUG0Llh1meNJX4hi
	 OzAyELvAV7wTWSdwZvw3sd1JItrX+gH5RKVODQiXtpsiMXZmkAFv1deFixYGVPs306srh
	 sTkbbzYfyo895ibHlF/D+1XTZeZn6TsgS/lyKCQ/Oh2RdjYY+3YLZZ2zfjuylP4tuu6za
	 NFbygfV1l9SJGiuHphSKk/LBHQeGKQkS5W1/dw8Ewv9y3vChfpvkE60vV09P4M2rzZw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792612413;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=lRLxSpFiFIG0DKYTb9oc85QDwfwqhPx68qrKkjKaNRM=;
	b=MUR3YwknRYLhtDftA1u6IPA4bFYsAqVF3vZkfHom6Q1zkMgFn7j2QNqwWs955u/677ub
	 pY2HE/1VuNQu7f6RYAQ/q31cpQBmFxk8BYXdORsvgs0BOWJDlGo5MNzB5zldnPr9FZ0Kq
	 aQpRShF6IE7HqkhNQKuvUIUGiys1bDB99kJPZJpv19q32B6lOKHMfEZ9+z4pHIbLkc9Lr
	 JyuCj/rFZtObTwP6ZNHWYq3hzZS10pMLcabza0mPkrp1QX76ZVBsXg77bdp6JzW1Zpcxh
	 SQbLB6cCX7hI+YLiYzDP5hbOpr/hOjnUtZKcDHR/XWfaPJBoC23QVATUDNC4d5iCA6w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 51AE81F01573;
	Wed, 21 Oct 2026 19:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792612412;
	bh=lRLxSpFiFIG0DKYTb9oc85QDwfwqhPx68qrKkjKaNRM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=DSPh0OBMSHPl90k8iINxZS1IJq2VrxBn4+hwaXsTxiVl+9AcyJdvcg+Cq3vVBvHQq
	 UqlDLMmXkngAtmCpG0/MtGTcYmF9wvaJL+C4kQXD+jbNXkT7996yQ5fb+fIphTwXAO
	 TZPpTAno9JEGZbe7UYplGSD9e1am/RE/GNgpV19mCXNBdeN41NKZdWYQkNwCNcAS7S
	 sfQjz0U2XEXTPqpk4Bxg/G7Rjbs+0EsXYSXdqeGhJ5J7B0hqaG/G/LzMmKZVFG0F+1
	 4x7178LEv2yWManlIczR3sj+Ue9Uzs/EwM21CzZkWquIaW/sJnm4NrY9MBBMf7ALY4
	 mCtDaBOUeCv1Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 598F043460;
	Wed, 21 Oct 2026 19:53:26 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Thu, 22 Oct 2026 03:53:34 +0800
Subject: [PATCH 14/18] riscv: dts: zhihe: add A210 UARTs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261022-a210-init-v1-14-5e438f972d24@iscas.ac.cn>
References: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
In-Reply-To: <20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Icenowy Zheng <uwu@icenowy.me>, 
 Drew Fustini <fustini@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792612403; l=5486;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=uWP7w6RpNZW/7YfTTpaJ1x8asm0foYPKOs5HYmLXeC4=;
 b=4MLw4y2SX8t/TUDLbdWe6mmoHfaLeT2SlEkYUSrcIbh+6+aie/eOGPiAxesaJaTYjfbMZRnNt
 EDyLpct9HTJBWb0RxunXo1DI63hGw2cTAYjJNaCuiqsLmlFXO3pTunN
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: gaohan@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>

Add the ten A210 UARTs with their clocks, resets and interrupts, using
the snps,dw-apb-uart compatible.

Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
Co-developed-by: Han Gao <gaohan@iscas.ac.cn>
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/zhihe/a210.dtsi | 150 ++++++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/riscv/boot/dts/zhihe/a210.dtsi b/arch/riscv/boot/dts/zhihe/a210.dtsi
index bbad51a3edb0..a07b67d10633 100644
--- a/arch/riscv/boot/dts/zhihe/a210.dtsi
+++ b/arch/riscv/boot/dts/zhihe/a210.dtsi
@@ -405,6 +405,66 @@ rst_peri1: reset-controller@2010400 {
 			#reset-cells = <1>;
 		};
 
+		uart0: serial@2014000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x02014000 0x0 0x400>;
+			clocks = <&clk_peri PERI1_UART0_SCLK_EN>,
+				 <&clk_peri PERI1_UART0_PCLK_EN>;
+			clock-names = "baudclk", "apb_pclk";
+			interrupt-parent = <&intc>;
+			interrupts = <321 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			resets = <&rst_peri1 PERI1_UART0_PRST>;
+
+			status = "disabled";
+		};
+
+		uart1: serial@2015000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x02015000 0x0 0x1000>;
+			clocks = <&clk_peri PERI1_UART1_SCLK_EN>,
+				 <&clk_peri PERI1_UART1_PCLK_EN>;
+			clock-names = "baudclk", "apb_pclk";
+			interrupt-parent = <&intc>;
+			interrupts = <322 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			resets = <&rst_peri1 PERI1_UART1_PRST>;
+
+			status = "disabled";
+		};
+
+		uart2: serial@2016000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x02016000 0x0 0x1000>;
+			clocks = <&clk_peri PERI1_UART2_SCLK_EN>,
+				 <&clk_peri PERI1_UART2_PCLK_EN>;
+			clock-names = "baudclk", "apb_pclk";
+			interrupt-parent = <&intc>;
+			interrupts = <323 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			resets = <&rst_peri1 PERI1_UART2_PRST>;
+
+			status = "disabled";
+		};
+
+		uart3: serial@2017000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x02017000 0x0 0x1000>;
+			clocks = <&clk_peri PERI1_UART3_SCLK_EN>,
+				 <&clk_peri PERI1_UART3_PCLK_EN>;
+			clock-names = "baudclk", "apb_pclk";
+			interrupt-parent = <&intc>;
+			interrupts = <324 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			resets = <&rst_peri1 PERI1_UART3_PRST>;
+
+			status = "disabled";
+		};
+
 		peri1_padctrl: pinctrl@2026000 {
 			compatible = "zhihe,a210-peri1-pinctrl";
 			reg = <0x0 0x02026000 0x0 0x1000>;
@@ -420,6 +480,96 @@ rst_peri2: reset-controller@8400400 {
 			#reset-cells = <1>;
 		};
 
+		uart4: serial@8401000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x08401000 0x0 0x400>;
+			clocks = <&clk_peri PERI2_UART4_SCLK_EN>,
+				 <&clk_peri PERI2_UART4_PCLK_EN>;
+			clock-names = "baudclk", "apb_pclk";
+			interrupt-parent = <&intc>;
+			interrupts = <325 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			resets = <&rst_peri2 PERI2_UART4_PRST>;
+
+			status = "disabled";
+		};
+
+		uart5: serial@8402000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x08402000 0x0 0x1000>;
+			clocks = <&clk_peri PERI2_UART5_SCLK_EN>,
+				 <&clk_peri PERI2_UART5_PCLK_EN>;
+			clock-names = "baudclk", "apb_pclk";
+			interrupt-parent = <&intc>;
+			interrupts = <326 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			resets = <&rst_peri2 PERI2_UART5_PRST>;
+
+			status = "disabled";
+		};
+
+		uart6: serial@8403000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x08403000 0x0 0x1000>;
+			clocks = <&clk_peri PERI2_UART6_SCLK_EN>,
+				 <&clk_peri PERI2_UART6_PCLK_EN>;
+			clock-names = "baudclk", "apb_pclk";
+			interrupt-parent = <&intc>;
+			interrupts = <327 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			resets = <&rst_peri2 PERI2_UART6_PRST>;
+
+			status = "disabled";
+		};
+
+		uart7: serial@8404000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x08404000 0x0 0x1000>;
+			clocks = <&clk_peri PERI2_UART7_SCLK_EN>,
+				 <&clk_peri PERI2_UART7_PCLK_EN>;
+			clock-names = "baudclk", "apb_pclk";
+			interrupt-parent = <&intc>;
+			interrupts = <328 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			resets = <&rst_peri2 PERI2_UART7_PRST>;
+
+			status = "disabled";
+		};
+
+		uart8: serial@8405000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x08405000 0x0 0x1000>;
+			clocks = <&clk_peri PERI2_UART8_SCLK_EN>,
+				 <&clk_peri PERI2_UART8_PCLK_EN>;
+			clock-names = "baudclk", "apb_pclk";
+			interrupt-parent = <&intc>;
+			interrupts = <329 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			resets = <&rst_peri2 PERI2_UART8_PRST>;
+
+			status = "disabled";
+		};
+
+		uart9: serial@8406000 {
+			compatible = "snps,dw-apb-uart";
+			reg = <0x0 0x08406000 0x0 0x1000>;
+			clocks = <&clk_peri PERI2_UART9_SCLK_EN>,
+				 <&clk_peri PERI2_UART9_PCLK_EN>;
+			clock-names = "baudclk", "apb_pclk";
+			interrupt-parent = <&intc>;
+			interrupts = <330 IRQ_TYPE_LEVEL_HIGH>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			resets = <&rst_peri2 PERI2_UART9_PRST>;
+
+			status = "disabled";
+		};
+
 		peri2_padctrl: pinctrl@8411000 {
 			compatible = "zhihe,a210-peri2-pinctrl";
 			reg = <0x0 0x08411000 0x0 0x1000>;

-- 
2.55.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
