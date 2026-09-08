Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E6EC79FAA
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 07:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X5NafgE9DNrl92cyRSk06D9wNVzL3yElyjfqgDzPKEE=; b=aPC7soEbMP0uie
	Tu92Mi0zgTym+71FJa5CcBubZzHTKd4+ns6UNtJhK/CNY4w62xEF/KfpQrTBUHe11sOhZ9xKf1zqe
	P0ZvHvYr9GKXrhhqRH7KIpWBAzFW/U0p8xNJJdRzYaldILVThhO5kZjowo/RepCy6vj5i4LHTlxPi
	gjhq7ajfyBTvakMunw5znuTt5QL5teLJM5GC2G/dysHU6w2KT1HTcYx22T9GerTa+aj1EgGg7sn/S
	z3CqzR7bogQe4jbIteoUwRWsky6wCM+llq8K0JSEboZ6bLi8QOggytZBfteWRa3IP8NKtLjc6Ny31
	lhBmSqQRT/9rAdA1YLcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qTa-00000008Iuf-3GD1;
	Tue, 08 Sep 2026 07:42:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3qTZ-00000008Itz-1QcL
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 07:42:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BC4443F00;
	Tue,  8 Sep 2026 07:42:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6AF1F00A3E;
	Tue,  8 Sep 2026 07:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788853361;
	bh=3oXpl+cAhOXilhzd2THpb81XUKM3ZmVG18zD0Do4tnk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FNVRszPGPHIJ1I1naUyZH3rt9LzQzHmvIHrNEtDbKyH8JbYraaPOuZ/lrR2kVyQjp
	 3vm/P1J9KxfHo7NOLnqLlM/j+QQCw/0ibZVC7f9l9ut9RE/UQE8pgarhBg3IAZzcxA
	 TyQ78cojxhrbIJWZflYs/qmLY104rBXoYkIM49Tms/r9d4mVYLH1QrXD9TVjVOBNj1
	 QxPZe12l6xA97sCJyk7Ucbq3nbAc6XZJCqDfVC1ZEmxmSUksyR4nhovYaZmPHRCpOE
	 ptwMHy3TuLKwynMg7mMzT/7us0onwOf0Gvw+oaYuxCEbbUysjP0AtGIS0+gYSygq/K
	 EQcOGnOJ3ONDQ==
From: Yixun Lan <dlan@kernel.org>
Date: Tue, 08 Sep 2026 07:42:05 +0000
Subject: [PATCH v4 3/3] riscv: dts: spacemit: k3: Add UFS support
MIME-Version: 1.0
Message-Id: <20260908-08-k3-ufs-support-v4-3-22aa2bd97d3b@kernel.org>
References: <20260908-08-k3-ufs-support-v4-0-22aa2bd97d3b@kernel.org>
In-Reply-To: <20260908-08-k3-ufs-support-v4-0-22aa2bd97d3b@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, "Martin K. Petersen" <mkp@kernel.org>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Aurelien Jarno <aurelien@aurel32.net>, 
 Jennifer Berringer <jberring@redhat.com>, linux-scsi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2292; i=dlan@kernel.org;
 h=from:subject:message-id; bh=rXPgP4vqes+SSdiq8m/XbuntuYSVI7j++o0JqVbGZh8=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqn7xYqMxLbATL8V3wklbt+Smix+P61sIZ311IS
 bHc8of/EDeJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCap+8WBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2vfA/+NrZfduXKP9hZ2XCJBScqdSDVBuP4Euoa7ixdAw9DUMHA+biwb5dyQ
 B9kzqN6sgVRGqvmqGwM3/oANjmlpgeK0bueAmzYTWptU6+k+wORkk1cgF1R5g1lbYaRmwMhnQwg
 zihkcFyUJbHNnUeYLWgqIX+hBXJUuC8Cf+fN+XV1KHhxeJKD7HBV72dUk4KmoMt8oEPl2iZWB1N
 lh3D/VypQJQKcGU938pcvCiVFN33/X4pFJi1Kez4AJcqIoM9fiPKRlPGYpNq/SjzS38SxJW9Z5d
 rQmcTRXzj/nW/HWia1Kr7j+ZhflIQV9QVax3c45xteRjEikXjL7fADcqa+3ibTbfsVu6z6R5gWd
 XolQ1+aI58weEGk9XWZeU3Po/5UlN3PLneuQMnf6lIhkyAP23RVEWTku5UTiCpdrcHVKudOWOTw
 gFmGOU4xCJzcKQqdxM7sweYHaVCcm1oOGjWDc4dIsIUC7bFNZMFTrdVsL2qTyt07azZWMQqMGE/
 QC8n4j/Tg8Njh3aTWlcsCmXZ2HkUen9JzvyotjXo+9xFtjkcvhQxw+GuLInQklN7VehLOhChDqv
 wG8KPC6HO6PcFp8vqOqlp2wkRFZIGL+V6P+aF191pxnQVHlTxsYJP9/JqjecyosQitMDTtWPmO0
 Sm8Ug01/ojY5IqZ0TnGGvrsn7mPeCM=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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

Add UFS Host Controller support for SpacemiT K3 SoC, and enable
it both on Pico-ITX and CoM260-IFX boards.

Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi  |  4 ++++
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts |  4 ++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 22 ++++++++++++++++++++++
 3 files changed, 30 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index 37627963a649..3251ee8405de 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -220,3 +220,7 @@ &uart0 {
 	pinctrl-0 = <&uart0_0_cfg>;
 	status = "okay";
 };
+
+&ufshc {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b084a35aa00e..6369602e81da 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -307,6 +307,10 @@ &uart0 {
 	status = "okay";
 };
 
+&ufshc {
+	status = "okay";
+};
+
 &usb2_host {
 	#address-cells = <1>;
 	#size-cells = <0>;
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index c3f2dce0969c..436c0e7e2838 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -513,6 +513,28 @@ usb2_phy: phy@c0a20000 {
 			status = "disabled";
 		};
 
+		ufshc: ufshc@c0e00000 {
+			compatible = "spacemit,k3-ufshc";
+			reg = <0x0 0xc0e00000 0x0 0x40000>;
+			clocks = <&syscon_apmu CLK_APMU_UFS_ACLK>,
+				 <&syscon_apmu CLK_APMU_UFS_REFCLK>;
+			clock-names = "aclk", "ref_clk";
+			resets = <&syscon_apmu RESET_APMU_UFS_ACLK>;
+			interrupts = <135 IRQ_TYPE_LEVEL_HIGH>;
+			lanes-per-direction = <2>;
+			operating-points-v2 = <&ufs_opp_table>;
+			status = "disabled";
+
+			ufs_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-1 {
+					opp-hz = /bits/ 64 <491520000>,
+						 /bits/ 64 <19200000>;
+				};
+			};
+		};
+
 		eth0: ethernet@cac80000 {
 			compatible = "spacemit,k3-dwmac", "snps,dwmac-5.40a";
 			reg = <0x0 0xcac80000 0x0 0x2000>;

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
