Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D20CFC503
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 07:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2UCORu6DSN6ftOV4j71oy+S9Q7KYHZ6Jomet7r5W/LA=; b=HWxkPmYepmINQr
	2f1crY2GUlRYefkDEcfazD2uhU9XR4h73XjOjaBXzPm+L2lNBcXSttxv9y/3eQNgUO7yDYiUVGhmv
	lU5Qvu+N3I088JmRGQR2vaWzeKZUVG5BgwnR17JuktoF3eSHujHZQZnebWrVxSy7vlSJgyp83utqO
	VL+XRo7YoV6/+p+XV+Ww0wloFRz9j9fsoqrNwH6+6JPDpAZG/ui+ENvnm0kjQRJ1BWyUE0dXKLRXy
	uX633gfXd4NMl428B05d0mvE0ADDqBXVGfYOcBdB+MgJmIzfWI4Hb7TK7rQ37Q/FFEN4ZFwSVsoSk
	hMIuNM81nG64GdVP1tTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0FlL-0000000479a-0KgA;
	Mon, 14 Oct 2024 07:45:07 +0000
Received: from bayard.4d2.org ([5.78.89.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0FfK-000000045Zg-1oNE
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 07:38:55 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id D1357122FE1E;
	Mon, 14 Oct 2024 00:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1728891533; bh=DwDhlRnfpNqUwydKjC1DfKRcf6/WtjZO99jAwo/5zu0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=y1916qdSUQSOFUWoMsWsKiK+hPQ9abzy46MMb+1BK7HiIzjV+YkPmX0kMXsCMN4oZ
	 nt55DEO0RHjD4Y5yzgnYGjj/1rgOBu1x2dgvVouuuPVYAJeVaNB9/16fxzCYq9DuKX
	 tXumTql/PSWyIllPnLqHSDm3U+JdJ55N4mENBoYNFfswHEPmsw57vIDA+kz0vuwhG7
	 Mu+vVjVk+YIj+nddSMQHtKwNy4rKrgIeyp18Yd5AFea4mGmgTKRDxRrur/mbT73sDV
	 KwftQJFPGnFE71ByhL6yc4+DnOaAVpTHUi00X6YPpUUEhcMOtp31BxULUMs76mnkDH
	 ROQ3gXcYYLYQw==
X-Virus-Scanned: amavisd-new at 4d2.org
Authentication-Results: bayard.4d2.org (amavisd-new); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bJZxxpwYIaA4; Mon, 14 Oct 2024 00:38:53 -0700 (PDT)
Received: from localhost.localdomain (unknown [110.52.220.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 1679B122FE21;
	Mon, 14 Oct 2024 00:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1728891533; bh=DwDhlRnfpNqUwydKjC1DfKRcf6/WtjZO99jAwo/5zu0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=y1916qdSUQSOFUWoMsWsKiK+hPQ9abzy46MMb+1BK7HiIzjV+YkPmX0kMXsCMN4oZ
	 nt55DEO0RHjD4Y5yzgnYGjj/1rgOBu1x2dgvVouuuPVYAJeVaNB9/16fxzCYq9DuKX
	 tXumTql/PSWyIllPnLqHSDm3U+JdJ55N4mENBoYNFfswHEPmsw57vIDA+kz0vuwhG7
	 Mu+vVjVk+YIj+nddSMQHtKwNy4rKrgIeyp18Yd5AFea4mGmgTKRDxRrur/mbT73sDV
	 KwftQJFPGnFE71ByhL6yc4+DnOaAVpTHUi00X6YPpUUEhcMOtp31BxULUMs76mnkDH
	 ROQ3gXcYYLYQw==
From: Haylen Chu <heylenay@4d2.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Haylen Chu <heylenay@4d2.org>
Subject: [PATCH v5 3/3] riscv: dts: sophgo: cv18xx: Add sensor device and thermal zone
Date: Mon, 14 Oct 2024 07:38:13 +0000
Message-ID: <20241014073813.23984-4-heylenay@4d2.org>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241014073813.23984-1-heylenay@4d2.org>
References: <20241014073813.23984-1-heylenay@4d2.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_003854_511814_84FEF005 
X-CRM114-Status: UNSURE (   9.40  )
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

Add common sensor device for Sophgo CV18xx SoCs and thermal zone for
CV1800b SoC.

Signed-off-by: Haylen Chu <heylenay@4d2.org>
---
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 28 +++++++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi  |  8 +++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index ec9530972ae2..af53c9ec3197 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -12,6 +12,34 @@ memory@80000000 {
 		device_type = "memory";
 		reg = <0x80000000 0x4000000>;
 	};
+
+	thermal-zones {
+		soc-thermal {
+			polling-delay-passive   = <1000>;
+			polling-delay           = <1000>;
+			thermal-sensors         = <&soc_temp>;
+
+			trips {
+				soc_passive: soc-passive {
+					temperature     = <75000>;
+					hysteresis      = <5000>;
+					type            = "passive";
+				};
+
+				soc_hot: soc-hot {
+					temperature     = <85000>;
+					hysteresis      = <5000>;
+					type            = "hot";
+				};
+
+				soc_critical: soc-critical {
+					temperature     = <100000>;
+					hysteresis      = <0>;
+					type            = "critical";
+				};
+			};
+		};
+	};
 };
 
 &plic {
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index b724fb6d9689..0465561f7043 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -133,6 +133,14 @@ portd: gpio-controller@0 {
 			};
 		};
 
+		soc_temp: thermal-sensor@30e0000 {
+			compatible = "sophgo,cv1800-thermal";
+			reg = <0x30e0000 0x100>;
+			clocks = <&clk CLK_TEMPSEN>;
+			interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
+			#thermal-sensor-cells = <0>;
+		};
+
 		i2c0: i2c@4000000 {
 			compatible = "snps,designware-i2c";
 			reg = <0x04000000 0x10000>;
-- 
2.46.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
