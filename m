Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E54E7D10F24
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 11:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1KoxEUWx+WgKyS8VZK8RRaNMlN+yfE3zAqSgR3M/svY=; b=nTlhpmyjXNmm6r
	9hfs1o8b/UzGEoshoUKP9zYkLPFN9R7i+Hv5O0RjZE9ksQJsxg16YprzqVBvi9wkMmZ47c7NrUXAe
	26yaS+yko/kj4KFssZC64jO+W+7R/H3S9gj8A0feUJFk84ZuIwcBU9sOSfVbkwdShX88+z03nrBK1
	TSIgQln5m/5q+iV+F57OoMX6CKCnNIaU0nAuExYuBJWKKrAH/ip2ez5WwZUx6UYxbALg792Ymbjmr
	2Bx1pSia20xJ31y4s2UqdFv2iP0UYdD74dO/+cRnt4wrRwR/FC9SYmpoGEVubD4SRXboKwqEWyOaU
	j91symwAKZyPMg3MeH8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOE8V-0000000EwRN-3eHR;
	Wed, 26 Nov 2025 11:56:39 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOE8R-0000000EwPp-1XSt
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 11:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id:To; bh=wOF1Tb4hdKgT+VsV0pVwid5+bzJCocSTb9mIOLanReE=;
	b=eqLxOJbe1xoF/BP0G2y/8umG0/LHkVwmn9QwVPals7otH+ObdqjTGJDwaf5fss
	GVUvamd7vUSm3f9ejJ+fS9hRXppRrLDtZBqLhxwEYKaJIDQNXrzDx/yZjyNkh4QN
	oiq/WaK9Yk1tF5jgrER4iMg9lKBvXJEig9nmmsjiUnPpI=
Received: from [192.168.10.1] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgBnveN26iZpJOi_FQ--.56535S5;
	Wed, 26 Nov 2025 19:54:38 +0800 (CST)
From: Shuwei Wu <shuweiwoo@163.com>
Date: Thu, 27 Nov 2025 02:44:09 +0800
Subject: [PATCH 3/3] riscv: dts: spacemit: Add thermal sensor for K1 SoC
MIME-Version: 1.0
Message-Id: <20251127-b4-k1-thermal-v1-3-f32ce47b1aba@163.com>
References: <20251127-b4-k1-thermal-v1-0-f32ce47b1aba@163.com>
In-Reply-To: <20251127-b4-k1-thermal-v1-0-f32ce47b1aba@163.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Shuwei Wu <shuweiwoo@163.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764182662; l=3083;
 i=shuweiwoo@163.com; s=20251125; h=from:subject:message-id;
 bh=FbsOThTrOK1Y/J4tVtyPVao7glCLEJI4mGN39AL4NMQ=;
 b=5qfoCVv1RYJJOaOFBlH40yx4L/yjtsCKGCP81+u/pjMb+oCIc/0VcR2naijW2pAhw8TGNO1vS
 /HH6dBRwZTuC75jdRRQh+JAa2XQYx9Xs3UqO17RS1WazITCSt22Jpcs
X-Developer-Key: i=shuweiwoo@163.com; a=ed25519;
 pk=qZs6i2UZnXkmjUrwO5HJxcfpCvgSNrR4dcU5cjtfTSk=
X-CM-TRANSID: PigvCgBnveN26iZpJOi_FQ--.56535S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxXr1rKF48GFyfCw4xtw48Xrb_yoW5XFyDpF
	1Skws5GFZrAryfXa13CryDK398Ka1vva48Xan7uryrArn0qFZI93y0k3W5tF18Gr4rW34j
	vryqy34DuF1qy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U17K3UUUUU=
X-Originating-IP: [240c:c983:3:1d94:eae4:9ca1:49b8:c024]
X-CM-SenderInfo: 5vkx4vplzr0qqrwthudrp/1tbioBMSjmkm4WqyYwAAs6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_035635_828431_EF2101A6 
X-CRM114-Status: UNSURE (   7.59  )
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

Include the Thermal Sensor Unit (TSU) node in the SpacemiT K1 dtsi
with definitions for registers, clocks, and interrupts.
Additionally, configure thermal zones for the soc, package, gpu, and
clusters to enable temperature monitoring via the thermal framework.

Signed-off-by: Shuwei Wu <shuweiwoo@163.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 101 +++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 6cdcd80a7c83b3f62500f226e8ed16787ded5016..67596c230396056eea4b2cfa9c6d7f04627c0209 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -338,6 +338,96 @@ osc_32k: clock-32k {
 		};
 	};
 
+	thermal-zones {
+		soc-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&thermal 0>;
+
+			trips {
+				soc-crit {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		package-thermal {
+			polling-delay-passive = <0>;
+			polling-delay = <0>;
+			thermal-sensors = <&thermal 1>;
+
+			trips {
+				package-crit {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+			thermal-sensors = <&thermal 2>;
+
+			trips {
+				gpu-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				gpu-crit {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cluster0-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+			thermal-sensors = <&thermal 3>;
+
+			trips {
+				cluster0-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cluster0-crit {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		cluster1-thermal {
+			polling-delay-passive = <100>;
+			polling-delay = <0>;
+			thermal-sensors = <&thermal 4>;
+
+			trips {
+				cluster1-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cluster1-crit {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -369,6 +459,17 @@ syscon_apbc: system-controller@d4015000 {
 			#reset-cells = <1>;
 		};
 
+		thermal: thermal@d4018000 {
+			compatible = "spacemit,k1-thermal";
+			reg = <0x0 0xd4018000 0x0 0x100>;
+			clocks = <&syscon_apbc CLK_TSEN>,
+				 <&syscon_apbc CLK_TSEN_BUS>;
+			clock-names = "core", "bus";
+			interrupts = <61>;
+			resets = <&syscon_apbc RESET_TSEN>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		gpio: gpio@d4019000 {
 			compatible = "spacemit,k1-gpio";
 			reg = <0x0 0xd4019000 0x0 0x100>;

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
