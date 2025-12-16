Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9547D5C0C1
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 02:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l6M2TIKNuO2Eakgk1kqKQudkjlzYX/Yf6J997AvVGLY=; b=MDQ/aF30uAL82W
	CRZ+wtvRYmTDJYAZMBctptdWpBQhHuqTnUEieiir/9U6Sh0QPWG5icW3FdC1vXQPB3PfwU5RPWVKP
	+u8SpiMtGeEMp0/Lv7Rk0JxOL2wtOuvxFRqBzl1W6ml+Cuy948DBmmk2fa9OgChCCEqVB00NQbJvb
	yxg7CWQvGBMWYt+5aIp6UzWy1uyDq9p3UJ9Y8DEij+qywc+pYzBxsbtT0vce3IEyPTP0q7DBPEBIZ
	b9iQD7IBvHG7DWGP5JyNVko4sk7XymvDKXlkEhJC8xEgH8UTKuHzCJB3xJNPkHXbRXskjveMwUgM2
	vMGk+vE+zPVKLjRe7lUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVKOa-00000004Xo8-1uMg;
	Tue, 16 Dec 2025 02:02:36 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVKOX-00000004Xn9-2kpB
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 02:02:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Date:Subject:MIME-Version:Content-Type:
	Message-Id:To; bh=Rs+rfWtyrtk97kpSu5fndp0xU+3WjRNBLxGPmOQrzzo=;
	b=NK+0J1Jw9/Rk8ursPJv1cCyc4VTt4GInpamkdvrups32oZGe6hzF4/CUgTd6Zk
	WD/s53T5AKAvtiui2dpW18JiyW9D+e2vdCAetlY+bjEZO6g4+yitJB8mC0+TU4Ux
	XsmG8JRgP0Vx997mhz752xT/fw5544098vxZOtrezD3cw=
Received: from [192.168.10.1] (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wDXUu97vUBpOmJ5Ag--.29S5;
	Tue, 16 Dec 2025 10:01:39 +0800 (CST)
From: Shuwei Wu <shuweiwoo@163.com>
Date: Tue, 16 Dec 2025 10:00:37 +0800
Subject: [PATCH v2 3/3] riscv: dts: spacemit: Add thermal sensor for K1 SoC
MIME-Version: 1.0
Message-Id: <20251216-patchv2-k1-thermal-v1-3-d4b31fe9c904@163.com>
References: <20251216-patchv2-k1-thermal-v1-0-d4b31fe9c904@163.com>
In-Reply-To: <20251216-patchv2-k1-thermal-v1-0-d4b31fe9c904@163.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765850492; l=3136;
 i=shuweiwoo@163.com; s=20251125; h=from:subject:message-id;
 bh=y011YJ1uJ0ICDCPPxjeBTXP9an/sM0tsW9o564MeUTs=;
 b=uYTDOFVmm1ahH9cVHGgDpeVO1j+jLsXKk+qUN3obRjUh1fmGlF2ihXBM5/WY2ftbOs+M6QAdT
 914Ea3Y39X4BZcGt+xX3xYv9RiZm0bxSb6bfwyKiCEdpOL6GzQDzA72
X-Developer-Key: i=shuweiwoo@163.com; a=ed25519;
 pk=qZs6i2UZnXkmjUrwO5HJxcfpCvgSNrR4dcU5cjtfTSk=
X-CM-TRANSID: _____wDXUu97vUBpOmJ5Ag--.29S5
X-Coremail-Antispam: 1Uf129KBjvJXoWxZrW8Gw45ZFy3Xw4xJry5Jwb_yoW5Wr48pF
	ySkws5GFZrJry3Xa13CryDK398Kan5ta48Xan29ryrArn0qFZIk3y0kwn8tF1kGr4rW34j
	vr1Dt34DuF1Dt3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pNg4hQUUUUU=
X-Originating-IP: [240c:c983:3:5c03:81d3:caf5:2e64:be2]
X-CM-SenderInfo: 5vkx4vplzr0qqrwthudrp/xtbC4wP5iGlAvYOdvwAA3k
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_180234_059698_5894B094 
X-CRM114-Status: UNSURE (   8.23  )
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

Include the Thermal Sensor node in the SpacemiT K1 dtsi
with definitions for registers, clocks, and interrupts.
Additionally, configure thermal zones for the soc, package, gpu, and
clusters to enable temperature monitoring via the thermal framework.

Signed-off-by: Shuwei Wu <shuweiwoo@163.com>
---
Changes in v2:
- Update compatible to "spacemit,k1-tsensor"
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 101 +++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 7818ca4979b6a7755722919a5958512aa11950ab..0fe7396ea6e47d10a73e3bcea4f5165e5c268da0 100644
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
@@ -434,6 +524,17 @@ syscon_apbc: system-controller@d4015000 {
 			#reset-cells = <1>;
 		};
 
+		thermal: thermal@d4018000 {
+			compatible = "spacemit,k1-tsensor";
+			reg = <0x0 0xd4018000 0x0 0x100>;
+			clocks = <&syscon_apbc CLK_TSEN>,
+				 <&syscon_apbc CLK_TSEN_BUS>;
+			clock-names = "core", "bus";
+			interrupts = <61>;
+			resets = <&syscon_apbc RESET_TSEN>;
+			#thermal-sensor-cells = <1>;
+		};
+
 		i2c6: i2c@d4018800 {
 			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd4018800 0x0 0x38>;

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
