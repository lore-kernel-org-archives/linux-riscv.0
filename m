Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED992C7115B
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 10:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jkpsx4xYJLIBUzIIBNNPK9myBXQRCzA9mXpIBDEKYUI=; b=Z715Mh/+U/dIyX
	n5m2tTmWtGKdShYgE5lcE9vQN5j2A+H+mmghi2B2U7qOpEtaFLunERdk/JV9GJmXxaGtx96bFfj6r
	Ut6B8MzA5GnwrjBx79s1xFqf+b7qlEXnG/8iVmbPOjJG2SRvDHxrW/pcZqbxlmlknSkTk+cMLJPK6
	sPGw3UsGZJvJpB4JERsF5f+LZh+RAxVEmC2WdZU5tlJNqL48sOFNMAvV146RqC+Omvw7y+hxOIBwV
	x0DUFHCXAjyc0A24NnWVTtwxqphxfbVfoJliM+H5wwJT0vhCw0D+kB83bDIgd+RZ6MCnTDIEEjWQM
	0xFvi2SFPEg7yga18hdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeqi-00000002SGZ-3gbC;
	Mon, 23 Jun 2025 10:56:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTe2j-00000002Hjo-2p2D
	for linux-riscv@bombadil.infradead.org;
	Mon, 23 Jun 2025 10:04:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=RCnzxVfe+XlxRm31+KPhBtdf+ilK3B9hn+RRaCcyPio=; b=o++unCtZyjiR2GI8MUi7Olxi0r
	JXQ/j+ZxR+aki7MsFZG0Ua0VecifqpvStu23yeO308LPVd6NPIPc09xzu4/zxky+MZRCxvEA0HDV+
	i7ZDwW/CS2oCDA5BR57AMKIZbd6M6jc8PLEAeuRpXmbzv+Eyp9flv4krS2NHwLEP0YPAzIEwW8B+S
	RMbK7/9u9QYOwA6XDZn9LrBldf0Uhyx9cUunVvLJZBmOikhKkJRqtvaRHr2KDxouD3P0FNoV33dWN
	bSvmdRtBCFUnIoIT7w7KtF483YmNqn6Nr9zY9yhWdZxpKicUydEaqttRKn/YSMR2ZB2+nQ+VxvMrH
	JQ/QtJAg==;
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTe2f-00000005BCK-0GNz
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 10:04:48 +0000
Received: from [127.0.0.2] (unknown [210.73.43.2])
	by APP-01 (Coremail) with SMTP id qwCowAD3ptWtJlloxg+rCA--.29805S4;
	Mon, 23 Jun 2025 18:04:30 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Mon, 23 Jun 2025 18:04:17 +0800
Subject: [PATCH 2/3] riscv: dts: spacemit: Move UARTs under dma-bus for K1
MIME-Version: 1.0
Message-Id: <20250623-k1-dma-buses-rfc-wip-v1-2-c0144082061f@iscas.ac.cn>
References: <20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn>
In-Reply-To: <20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn>
To: Yixun Lan <dlan@gentoo.org>, Guodong Xu <guodong@riscstar.com>, 
 Ze Huang <huangze@whut.edu.cn>, Alex Elder <elder@riscstar.com>, 
 spacemit@lists.linux.dev, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Vivian Wang <uwu@dram.page>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-CM-TRANSID: qwCowAD3ptWtJlloxg+rCA--.29805S4
X-Coremail-Antispam: 1UD129KBjvJXoWxtF4rGF43XrWkXrWfJw48tFb_yoW3GF1Up3
	yxCFZ3CrWvqF1Yvwn0qFZrKrWkGFW8Ka93WwnFyw1fJF9agFWqvF4xJFyxtF1UX34DZw45
	tF95Arykta10qw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r106r15McIj6I8E87Iv67AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAaw2AFwI0_GFv_Wrylc2xSY4AK67AK6r4DMxAIw28IcxkI7VAKI48JMxC2
	0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
	0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
	14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUbYFAUUUUU=
X-Originating-IP: [210.73.43.2]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_110445_906923_C062B43B 
X-CRM114-Status: UNSURE (   7.88  )
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

UART devices in Spacemit K1 use dma-bus DMA translations. Move these
nodes under dma-bus to reflect this fact.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 246 ++++++++++++++++++-----------------
 1 file changed, 128 insertions(+), 118 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 99c76997b367f733c9dda2c30dd85817294ef9b7..0d41694699851e672a833601b62c2b2ad3daae79 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -357,114 +357,6 @@ syscon_apbc: system-controller@d4015000 {
 			#reset-cells = <1>;
 		};
 
-		uart0: serial@d4017000 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017000 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART0>,
-				 <&syscon_apbc CLK_UART0_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <42>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart2: serial@d4017100 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017100 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART2>,
-				 <&syscon_apbc CLK_UART2_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <44>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart3: serial@d4017200 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017200 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART3>,
-				 <&syscon_apbc CLK_UART3_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <45>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart4: serial@d4017300 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017300 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART4>,
-				 <&syscon_apbc CLK_UART4_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <46>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart5: serial@d4017400 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017400 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART5>,
-				 <&syscon_apbc CLK_UART5_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <47>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart6: serial@d4017500 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017500 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART6>,
-				 <&syscon_apbc CLK_UART6_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <48>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart7: serial@d4017600 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017600 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART7>,
-				 <&syscon_apbc CLK_UART7_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <49>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart8: serial@d4017700 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017700 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART8>,
-				 <&syscon_apbc CLK_UART8_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <50>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
-		uart9: serial@d4017800 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xd4017800 0x0 0x100>;
-			clocks = <&syscon_apbc CLK_UART9>,
-				 <&syscon_apbc CLK_UART9_BUS>;
-			clock-names = "core", "bus";
-			interrupts = <51>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "disabled";
-		};
-
 		gpio: gpio@d4019000 {
 			compatible = "spacemit,k1-gpio";
 			reg = <0x0 0xd4019000 0x0 0x100>;
@@ -562,16 +454,6 @@ clint: timer@e4000000 {
 					      <&cpu7_intc 3>, <&cpu7_intc 7>;
 		};
 
-		sec_uart1: serial@f0612000 {
-			compatible = "spacemit,k1-uart", "intel,xscale-uart";
-			reg = <0x0 0xf0612000 0x0 0x100>;
-			interrupts = <43>;
-			clock-frequency = <14857000>;
-			reg-shift = <2>;
-			reg-io-width = <4>;
-			status = "reserved"; /* for TEE usage */
-		};
-
 		camera-bus {
 			compatible = "simple-bus";
 			ranges;
@@ -588,6 +470,134 @@ dma-bus {
 			#size-cells = <2>;
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
 				     <0x1 0x00000000 0x1 0x80000000 0x3 0x00000000>;
+
+			uart0: serial@d4017000 {
+				compatible = "spacemit,k1-uart",
+					     "intel,xscale-uart";
+				reg = <0x0 0xd4017000 0x0 0x100>;
+				clocks = <&syscon_apbc CLK_UART0>,
+					 <&syscon_apbc CLK_UART0_BUS>;
+				clock-names = "core", "bus";
+				interrupts = <42>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				status = "disabled";
+			};
+
+			uart2: serial@d4017100 {
+				compatible = "spacemit,k1-uart",
+					     "intel,xscale-uart";
+				reg = <0x0 0xd4017100 0x0 0x100>;
+				clocks = <&syscon_apbc CLK_UART2>,
+					 <&syscon_apbc CLK_UART2_BUS>;
+				clock-names = "core", "bus";
+				interrupts = <44>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				status = "disabled";
+			};
+
+			uart3: serial@d4017200 {
+				compatible = "spacemit,k1-uart",
+					     "intel,xscale-uart";
+				reg = <0x0 0xd4017200 0x0 0x100>;
+				clocks = <&syscon_apbc CLK_UART3>,
+					 <&syscon_apbc CLK_UART3_BUS>;
+				clock-names = "core", "bus";
+				interrupts = <45>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				status = "disabled";
+			};
+
+			uart4: serial@d4017300 {
+				compatible = "spacemit,k1-uart",
+					     "intel,xscale-uart";
+				reg = <0x0 0xd4017300 0x0 0x100>;
+				clocks = <&syscon_apbc CLK_UART4>,
+					 <&syscon_apbc CLK_UART4_BUS>;
+				clock-names = "core", "bus";
+				interrupts = <46>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				status = "disabled";
+			};
+
+			uart5: serial@d4017400 {
+				compatible = "spacemit,k1-uart",
+					     "intel,xscale-uart";
+				reg = <0x0 0xd4017400 0x0 0x100>;
+				clocks = <&syscon_apbc CLK_UART5>,
+					 <&syscon_apbc CLK_UART5_BUS>;
+				clock-names = "core", "bus";
+				interrupts = <47>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				status = "disabled";
+			};
+
+			uart6: serial@d4017500 {
+				compatible = "spacemit,k1-uart",
+					     "intel,xscale-uart";
+				reg = <0x0 0xd4017500 0x0 0x100>;
+				clocks = <&syscon_apbc CLK_UART6>,
+					 <&syscon_apbc CLK_UART6_BUS>;
+				clock-names = "core", "bus";
+				interrupts = <48>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				status = "disabled";
+			};
+
+			uart7: serial@d4017600 {
+				compatible = "spacemit,k1-uart",
+					     "intel,xscale-uart";
+				reg = <0x0 0xd4017600 0x0 0x100>;
+				clocks = <&syscon_apbc CLK_UART7>,
+					 <&syscon_apbc CLK_UART7_BUS>;
+				clock-names = "core", "bus";
+				interrupts = <49>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				status = "disabled";
+			};
+
+			uart8: serial@d4017700 {
+				compatible = "spacemit,k1-uart",
+					     "intel,xscale-uart";
+				reg = <0x0 0xd4017700 0x0 0x100>;
+				clocks = <&syscon_apbc CLK_UART8>,
+					 <&syscon_apbc CLK_UART8_BUS>;
+				clock-names = "core", "bus";
+				interrupts = <50>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				status = "disabled";
+			};
+
+			uart9: serial@d4017800 {
+				compatible = "spacemit,k1-uart",
+					     "intel,xscale-uart";
+				reg = <0x0 0xd4017800 0x0 0x100>;
+				clocks = <&syscon_apbc CLK_UART9>,
+					 <&syscon_apbc CLK_UART9_BUS>;
+				clock-names = "core", "bus";
+				interrupts = <51>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				status = "disabled";
+			};
+
+			sec_uart1: serial@f0612000 {
+				compatible = "spacemit,k1-uart",
+					     "intel,xscale-uart";
+				reg = <0x0 0xf0612000 0x0 0x100>;
+				interrupts = <43>;
+				clock-frequency = <14857000>;
+				reg-shift = <2>;
+				reg-io-width = <4>;
+				status = "reserved"; /* for TEE usage */
+			};
 		};
 
 		multimedia-bus {

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
