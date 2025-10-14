Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ADE2CCD192
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 13:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/F9LRpt+prK8YXFiFJzurHBlH9GocW2olxvlIGqL6Gg=; b=RZFu36qi6RyiGf
	iKmy+iMfSlhCx6teUjoK2ZwJN/IjMZZwRBvoIr8AHL1yZqQHj+0RaDTiHqs1wAVEJ/VL4bSpVElXO
	oem4Fmud4U8OYaZbsc6WhlRiqA2rUtXRfrhAzOJcxvp+cRr1h06olk3QePzGxfO3Amp+EndUxRqiC
	dI9mLy0muwiYcH41PHk0x0hU6qGyI1QEWGVXXFAFuinR/+D1h8/MmtIyZW4xqBTgZvtXbr+d+AgOU
	OlsFhEGfHUBOcWe2yD47e4xJ0Q3fZVE7r3QKmo0gMsEPF6kyllUTJahAYcgkq6tc5wJcQf2bE9hRO
	2FCwaptjipKfbO2N297Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8epR-0000000GQgd-2iix;
	Tue, 14 Oct 2025 13:12:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8epQ-0000000GQfd-3cJx
	for linux-riscv@bombadil.infradead.org;
	Tue, 14 Oct 2025 13:12:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=E+1h4P1M4gX4cbdmv6LTDW77HuzlATs4TzjVcsCm2l4=; b=nFR3qgApVacMywpuZ5AX2Z7IOA
	Ehli7Ys5iMbbHemgxty0dchr8yWGsxZ3zLtuxGkjbIJiG7HBUVKcRUEWQganJTpPZM80Yc4lPjVLv
	+pkSPPWYKTOQyA0nu66hyDfTR++DghS4O9wvqWeuWyBYUoWLYbfD/jwoEJ5xpudzX5yy7grDmATOQ
	A7TQcMbC2ur1a6xmWA93M2vyDXhXaE3zNaSktCVxzw8oOgcbWT8OzsQRec0VQMpe6e0UQGbgzxONh
	rw1OO+4YLwdf+JpB/OdT6VwAZvy1qmII9bux7koNnU5R7L/bBk4QbT8nMFSrEoINC3QKyCJo4XJ87
	UOfLR06Q==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8epI-00000005BQz-3AhZ
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 13:12:35 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 004DE261A5;
	Tue, 14 Oct 2025 15:12:28 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lJtEv08OE0WU; Tue, 14 Oct 2025 15:12:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1760447547; bh=NkbKzHG706iJdJxu5vSJY3qj2jEFX8Hh23r4tuIRyO0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=hoRak8wu9H2nqhtk5pU+JvHIL3pPfYf6CeFTSYQeWQ7AZWZ4rWq9TaBJwHvtacbch
	 9ezlEXuVL0vfgulyZD2b2BsIdJagDdC37bknlRiaS+xM0uZDu1QCQQc6x+PPNCI6Jp
	 JtLrBPkG9LMWKLvotsr0JcuVyPNALqIDGfcmdslKjSRdKerbq3DVZ0Qvj6eZIOxBA9
	 Wf5DkSxIhbmK39glWHDdTT33LUo/IOF7dq5fmBKM6Z+y8bRh1a0ffvYo1ORExcZpv3
	 wOaIq59xTCJM7fmlJ9jTlW6mmguvTBO9LVeBQXEG3OhU2ww8Rut6ui94Lkyg40JH9U
	 B+5iBuAD0AofA==
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v3 5/5] riscv: dts: thead: Add reset controllers of more subsystems for TH1520
Date: Tue, 14 Oct 2025 13:10:32 +0000
Message-ID: <20251014131032.49616-6-ziyao@disroot.org>
In-Reply-To: <20251014131032.49616-1-ziyao@disroot.org>
References: <20251014131032.49616-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_141232_003113_4FBC7A2C 
X-CRM114-Status: UNSURE (   7.31  )
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
Cc: devicetree@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>, linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Describe reset controllers for VI, MISC, AP, DSP and AO subsystems. The
one for AO subsystem is marked as reserved, since it may be used by AON
firmware.

Signed-off-by: Yao Zi <ziyao@disroot.org>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 37 +++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index e680d1a7c821..15d64eaea89f 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -277,6 +277,12 @@ clint: timer@ffdc000000 {
 					      <&cpu3_intc 3>, <&cpu3_intc 7>;
 		};
 
+		rst_vi: reset-controller@ffe4040100 {
+			compatible = "thead,th1520-reset-vi";
+			reg = <0xff 0xe4040100 0x0 0x8>;
+			#reset-cells = <1>;
+		};
+
 		spi0: spi@ffe700c000 {
 			compatible = "thead,th1520-spi", "snps,dw-apb-ssi";
 			reg = <0xff 0xe700c000 0x0 0x1000>;
@@ -502,6 +508,18 @@ uart2: serial@ffec010000 {
 			status = "disabled";
 		};
 
+		rst_misc: reset-controller@ffec02c000 {
+			compatible = "thead,th1520-reset-misc";
+			reg = <0xff 0xec02c000 0x0 0x18>;
+			#reset-cells = <1>;
+		};
+
+		rst_vp: reset-controller@ffecc30000 {
+			compatible = "thead,th1520-reset-vp";
+			reg = <0xff 0xecc30000 0x0 0x14>;
+			#reset-cells = <1>;
+		};
+
 		clk: clock-controller@ffef010000 {
 			compatible = "thead,th1520-clk-ap";
 			reg = <0xff 0xef010000 0x0 0x1000>;
@@ -509,6 +527,18 @@ clk: clock-controller@ffef010000 {
 			#clock-cells = <1>;
 		};
 
+		rst_ap: reset-controller@ffef014000 {
+			compatible = "thead,th1520-reset-ap";
+			reg = <0xff 0xef014000 0x0 0x1000>;
+			#reset-cells = <1>;
+		};
+
+		rst_dsp: reset-controller@ffef040028 {
+			compatible = "thead,th1520-reset-dsp";
+			reg = <0xff 0xef040028 0x0 0x4>;
+			#reset-cells = <1>;
+		};
+
 		gpu: gpu@ffef400000 {
 			compatible = "thead,th1520-gpu", "img,img-bxm-4-64",
 				     "img,img-rogue";
@@ -681,6 +711,13 @@ aogpio: gpio-controller@0 {
 			};
 		};
 
+		rst_ao: reset-controller@fffff44000 {
+			compatible = "thead,th1520-reset-ao";
+			reg = <0xff 0xfff44000 0x0 0x2000>;
+			#reset-cells = <1>;
+			status = "reserved";
+		};
+
 		padctrl_aosys: pinctrl@fffff4a000 {
 			compatible = "thead,th1520-pinctrl";
 			reg = <0xff 0xfff4a000 0x0 0x2000>;
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
