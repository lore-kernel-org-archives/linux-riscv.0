Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6789C4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Apr 2024 12:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FrYHY1LWAnGU76Q9OdueCepO9BR0jKyem+lqRWKQK/4=; b=3bzcnRyUsmad3f
	fTdcHAnIS/bmg6zdJGhbeqbE8fhKsWZFEgmKkvw9EBaIlABPS+Ew+grem1K27dCI8u0l3A1s4Yj2h
	6lgIl0et74Ulem29HNeac2+YMHoPB/9JErYIsI5FkqxDytgjIlBeWnw8QnSYU7eTQxxoLHe1CCdBm
	4yJJrZzNuejVRu8yRYcHdY0fzWgV+PQaC8eyr0c2RX49Ogw9gxHRxyEThAGGlYIXLxOJUVBkm43P4
	NwXzXrP5FjFymOXdjjSFY7WrfzCYP+/N5VX/i0ImRpYj4KfKRXE5wKzWwyqXC/v+/+xiVn3XcKhqC
	cRfemOOpxWO7IbYmn5Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryWhs-0000000AVOT-2bLv;
	Sun, 21 Apr 2024 12:54:08 +0000
Received: from [203.205.251.84] (helo=out203-205-251-84.mail.qq.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryWhp-0000000AVM6-0Dtg
	for linux-riscv@lists.infradead.org;
	Sun, 21 Apr 2024 12:54:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1713704029; bh=Oid0/2+ncbfbBpARfu+QMrQ+JfMw2YqRGSqME5w6tAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y2tQHT9zzQCX7cNwNGXG89m4/wTe/78DKsmLrtWoi7V1NH/fhIfbjTSmc4JPhHxPO
	 KMHgiM6/7J2Cer23fOz9QncBttXV/FRREgb1csHQ7dD5qOKNaHLSoGLfEZ35FB0Rrz
	 WIDscc7qlmLYaNsHyB1Adezihhz1zSGRDBPprxEg=
Received: from cyy-pc.lan ([240e:379:2264:6200:aa04:7d36:395a:da35])
	by newxmesmtplogicsvrsza10-0.qq.com (NewEsmtp) with SMTP
	id D6B1C271; Sun, 21 Apr 2024 20:53:43 +0800
X-QQ-mid: xmsmtpt1713704026tyjhfqvqz
Message-ID: <tencent_AD84B436C2F31108B66B4739D6E306C5E80A@qq.com>
X-QQ-XMAILINFO: NMGzQWUSIfvTF2H89VCD5B7DlQMjdlBiz4ngf34c+hz0HuyiJ+FkP71jdACfwi
	 Re+X3AAMqp/wxVLWMqLChc4Wifkbxnp3//Tde0b1j4bfQOUOEAXuUe4RjmxsYYtDWsnqYOtsseN4
	 pnr/rX+sPq1AGW16QiQOqUpXqzVmrBfdLsho8crjAK6Xo4Y2wBMxgxU0Sg08Dmppo/9C6JTftFli
	 qEzItM5Z/wFSqohRUzIfgPNB3qlQOWbLjv23iWRY0gsfmr7bJF2pZucQr8V5odlUGwKGfHmWQwt/
	 RNozxGpfoZbT8xxp471ItP77hofEXg/K+aA42FJWAN0L1HbbVTM2YioUaVJcigMlTNqkTWnoYn+K
	 gnskcNCgfiVG8/O6mbP34GT6+Zo5Ftv1lSMCoQJ6U9VPXkrGuZw4KPofx8jMDTC7ylAyz/7T6eKT
	 xu2pY/Ht3nvf4yh2t5vB7R34zVxAUJkuQKLrsJ7aydJr4PWQ7hwzfPVSROuaPR4MQklXrhqoqoDJ
	 TG60ZbfziMtm2ljVUcnJmMyNlxXjVlTVvhtdkVSn2Rl7e0U7KikTJVOtezEbfHMdgH1OQIa12ho0
	 ctEFSOlHluBsuL+nU+9TyAaLjDlO4RWqp7dIGnghdy5BrPsQPnGKbU01rT+6yA2pSB14lLeHw6Po
	 SN9k0UJ/D0qxswyRPPBh85twKsjPWwOfXfuCiuxtfpzUdm1q6DRbxN5eilEOW4OmthwuaWO4F737
	 bJnNF8ULJymrKOQJQyqsI3Om0qKYMarOi8WdUMuFCAoXJcYAuvT5q749lmi6g57bB9Jn2oM15dxG
	 oEK2UsOPB6ZRoTDVwlX/JaGAc5Du+ug7T5mwoHS5Os7ketYJizhE+QIxevA2d1LtignjzTM6cn21
	 6A7/RUcUpanX2ZRUDSf/sNh3sO2RCngysjitPERLJq8ZTkUaBJG8LhBtMBa1E6DVJ0hoApnO3wdd
	 0vmWBoNKD6Xwyod1bI7yTgltkaTmgpWQ1t/CnmniVzFJtAPgT78Ui9AmQJqle97E4xIWtNilMPhq
	 Rs3jP+Pi05dvYxJdmcL1XjdqiIHOqg5v0YzdbfDgh2WWFj21fi
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v1 2/2] riscv: dts: add usb nodes for Canaan Kendryte K230 SoCs
Date: Sun, 21 Apr 2024 20:53:30 +0800
X-OQ-MSGID: <20240421125330.1039774-2-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_E9B853316D217B8D1E7CDF8288DA5E8ED908@qq.com>
References: <tencent_E9B853316D217B8D1E7CDF8288DA5E8ED908@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240421_055405_537235_003D5ED9 
X-CRM114-Status: GOOD (  11.18  )
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

This patch adds USB nodes for Canaan Kendryte K230 SoCs. The fifo
parameters are taken from factory dts [1]. For the clock parameter, we use
a dummy node here as we don't know the actual clock this IP connected
inside the SoC chip, and it doesn't matter after reviewing the dwc2 driver
code, which will not read the clock frequency but only use the binding to
turn the clock on or off to save power.

[1] https://github.com/kendryte/k230_sdk/blob/v1.5/src/little/linux/arch/riscv/boot/dts/kendryte/k230.dtsi

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 arch/riscv/boot/dts/canaan/k230.dtsi | 29 ++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/riscv/boot/dts/canaan/k230.dtsi b/arch/riscv/boot/dts/canaan/k230.dtsi
index 95c1a3d8fb11..2311fb7f7127 100644
--- a/arch/riscv/boot/dts/canaan/k230.dtsi
+++ b/arch/riscv/boot/dts/canaan/k230.dtsi
@@ -65,6 +65,13 @@ apb_clk: apb-clk-clock {
 		#clock-cells = <0>;
 	};
 
+	clk_dummy: clock-dummy {
+		compatible = "fixed-clock";
+		clock-frequency = <0>;
+		clock-output-names = "clk_dummy";
+		#clock-cells = <0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -138,5 +145,27 @@ uart4: serial@91404000 {
 			reg-shift = <2>;
 			status = "disabled";
 		};
+
+		usb0: usb@91500000 {
+			compatible = "canaan,k230-otg", "snps,dwc2";
+			reg = <0x0 0x91500000 0x0 0x40000>;
+			interrupts = <173 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_dummy>;
+			clock-names = "otg";
+			g-rx-fifo-size = <512>;
+			g-np-tx-fifo-size = <64>;
+			g-tx-fifo-size = <512 1024 64 64 64 64>;
+		};
+
+		usb1: usb@91540000 {
+			compatible = "canaan,k230-otg", "snps,dwc2";
+			reg = <0x0 0x91540000 0x0 0x40000>;
+			interrupts = <174 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_dummy>;
+			clock-names = "otg";
+			g-rx-fifo-size = <512>;
+			g-np-tx-fifo-size = <64>;
+			g-tx-fifo-size = <512 1024 64 64 64 64>;
+		};
 	};
 };
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
