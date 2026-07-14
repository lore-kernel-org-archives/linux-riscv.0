Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF929C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 07:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MPMCuRJT52sWxGbhOJehH6qSkwHmbQ3ncRbK7FTgVw0=; b=ZPGbZvBx0u/k1C
	JgfCkJ5Rwds0thGisl2NbJDDRsPG2M41A3PX+NHGEzWws6ywIMoQ2IxPGZ2rBOe41VEP8QHEgMoBv
	2NfelDgxx+ZaxCvZ82EBMG0/QvaKll8sF7ZX9/zHsBotJnNwzBc+6doVG2s8kXYUctAKTDoVDZsAP
	+qEnOHZxIamrlG1I/e2c+Ka/cYt5kAR/4cWS5I+viMdyPOfgYCjrv6CpBjO/FHqDs6ed99etb98MO
	jGkxZEGU6UJrJH+DIozeIwQptIOZlLofKiDH857vo4m0ktV5PaJ4GC1klVUS9gV7OWLswKPZoMIhS
	bSeFkcErsa7kgWW00/ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjXpn-0000000BDfh-1eme;
	Tue, 14 Jul 2026 07:45:43 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjXpi-0000000BDdZ-45Hq
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 07:45:41 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.100])
	by APP-05 (Coremail) with SMTP id zQCowABXq84X6VVqEs8pGA--.61698S5;
	Tue, 14 Jul 2026 15:45:33 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	MoeLeak <i@leak.moe>
Subject: [PATCH v2 3/5] riscv: dts: thead: lpi4a: sort nodes
Date: Tue, 14 Jul 2026 15:45:13 +0800
Message-ID: <20260714074515.1959352-4-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
References: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowABXq84X6VVqEs8pGA--.61698S5
X-Coremail-Antispam: 1UD129KBjvJXoW7ur1rKrykGryDuryxWr18uFg_yoW8tr1Upa
	1fXFZ3K3WkCr40grnIqry0qF1rGan5GF93KwnxC348Xr47WrW8JryrKwn5ZFyDWFWrXw13
	CFs3JFy2vF1qyw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmF14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2
	KfnxnUUI43ZEXa7VU1sYFtUUUUU==
X-Originating-IP: [112.94.101.100]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_004539_378895_8EBB03FC 
X-CRM114-Status: UNSURE (   9.51  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Paul Walmsley <pjw@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Although "D", "H" and "I" are earlier in the alphabet than "P", the DPU,
HDMI and I2C1 nodes were added after PADCTRL nodes in the Lichee Pi 4A
device tree; in addition the PADCTRL1 node is placed before the
PADCTRL0 one.

Sort the nodes in this device tree.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 72 +++++++++----------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
index af6f25ebbf607..74b120c6b063a 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
@@ -103,17 +103,31 @@ fan: pwm-fan {
 
 };
 
-&padctrl1_apsys {
-	i2c1_pins: i2c1-0 {
-		i2c-pins {
-			pins = "I2C1_SCL", "I2C1_SDA";
-			function = "i2c";
-			bias-pull-up = <2100>;
-			drive-strength = <7>;
-			input-enable;
-			input-schmitt-enable;
-			slew-rate = <0>;
-		};
+&dpu {
+	status = "okay";
+};
+
+&hdmi {
+	status = "okay";
+};
+
+&hdmi_out_port {
+	hdmi_out_con: endpoint {
+		remote-endpoint = <&hdmi_con_in>;
+	};
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+	status = "okay";
+
+	ioexp2: gpio@18 {
+		compatible = "nxp,pca9557";
+		reg = <0x18>;
+		gpio-controller;
+		#gpio-cells = <2>;
 	};
 };
 
@@ -153,17 +167,17 @@ rx-pins {
 	};
 };
 
-&i2c1 {
-	clock-frequency = <400000>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c1_pins>;
-	status = "okay";
-
-	ioexp2: gpio@18 {
-		compatible = "nxp,pca9557";
-		reg = <0x18>;
-		gpio-controller;
-		#gpio-cells = <2>;
+&padctrl1_apsys {
+	i2c1_pins: i2c1-0 {
+		i2c-pins {
+			pins = "I2C1_SCL", "I2C1_SDA";
+			function = "i2c";
+			bias-pull-up = <2100>;
+			drive-strength = <7>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
 	};
 };
 
@@ -179,20 +193,6 @@ &sdio1 {
 	status = "okay";
 };
 
-&dpu {
-	status = "okay";
-};
-
-&hdmi {
-	status = "okay";
-};
-
-&hdmi_out_port {
-	hdmi_out_con: endpoint {
-		remote-endpoint = <&hdmi_con_in>;
-	};
-};
-
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins>;
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
