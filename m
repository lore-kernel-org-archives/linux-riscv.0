Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103FDF36BA9
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 03:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WFzPUVzSGat4YQiSAf773HoSiueZCnUF2tpTdeSidfQ=; b=Nmk9OtBHquWowF
	cc43+miGhTzDsmM1SAVxjGFULRqo9y1eB3JuhQii6ZWQzYT/qXx+jZdRdQcRtQYWtl/cx8cXsXAir
	xDXhYFTYS3+Ng1USU0B9hCXeldsV/n1BIgFt60gBy6hS+PCwszFkJYPnFOuH2Pu+/roMdSKWjF5Iu
	SP/M5Z/gO79vwlo/vm4b6bX5DgZ26slpW3yWH7LksHQAa+FEj4kYh9GsE/8vkPNiWeIwZVm6qAntn
	wEPI3yqR/1e/arW+jrk5KpRAFb1iAnR1lbQFnHjBcyq9XcXkx3KKP0IBlZgu1JDAOAIVRWKQpw2Yy
	olgeWwKBGzGqeY5xbtEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB2bv-0000000BXgj-0Aj0;
	Fri, 10 Apr 2026 03:32:47 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB2bt-0000000BXfY-0G57
	for linux-riscv@lists.infradead.org;
	Fri, 10 Apr 2026 03:32:46 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fsMnR1hMzz9v02;
	Fri, 10 Apr 2026 05:32:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1775791963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=75ydX2NhihMz6cPR7NoLueEZpsTKvS6m1hDG/Udt4a4=;
	b=g+n6L55vtaQDVe3lmt48rAaBAfHsLivf2hIsVItBmmYaQOnhT4XYkauU6yIED894mTo6Vy
	UOYw0yUU9W5QVaY9jfwgXDpKaZ3d5fO1zbW8aSCo3tEW9ZSodWbvH8bCJsPg9xYMsr9rOs
	wOO2NFjinRz4SlbFJoFJLryrY4CmBAHIzJfD5ujuZuonYAMvOS39BE/WnePCfp6QXpXgZ4
	FlBMZ2JeElJd/QtwCwIJswzl60ff1h2Sw6J9hZHLuogfS3aCwcIkLM3p+lwSAwgIIX21+4
	85rs6HGNloT98IuV8bNKTuE4JXcKzkUhkW61brXcV/Z9UmtyloYjKRvnxQMIDQ==
From: Shuwei Wu <shuwei.wu@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1775791961;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=75ydX2NhihMz6cPR7NoLueEZpsTKvS6m1hDG/Udt4a4=;
	b=in4WWxf+ktsV8ymFwjWP01J8mgZFZtLamZDiPC8rT+5fv5UbMMsq9mAwa5rV7efzGRF6bD
	2g03AybYmYsL0SO066lWZ0QsaM6yQ3KknhssE0DSkn5E03tglh5SWZVHa7nq/uIKT3UT5+
	oWs8xielNWt9Ww17J9UBlBuYcME1PWm7sCh9LU6jaAstmVztEUwdwEnwWadDi5Ntuxjdka
	x/yJBydbLduDmbxexkzj9IBGghH/VRrxFycBXYMG4pu6I+uZ0fdB7GH+2Y3pNFMliNCfTx
	q6I+QUOoImq4rr/hc19beesQdEUP8MjDcnQdfvHUuonphH9t4ROM+66gtrLjTQ==
Date: Fri, 10 Apr 2026 11:31:38 +0800
Subject: [PATCH v4 3/3] riscv: dts: spacemit: Add thermal sensor for K1 SoC
MIME-Version: 1.0
Message-Id: <20260410-k1-thermal-v1-3-12c87dd063c3@mailbox.org>
References: <20260410-k1-thermal-v1-0-12c87dd063c3@mailbox.org>
In-Reply-To: <20260410-k1-thermal-v1-0-12c87dd063c3@mailbox.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Shuwei Wu <shuwei.wu@mailbox.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Vincent Legoll <legoll@online.fr>, 
 Gong Shuai <gsh517025@gmail.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775791914; l=3192;
 i=shuwei.wu@mailbox.org; s=20251125; h=from:subject:message-id;
 bh=LV2aED3hCbd7+2EFjYPM+jflbIpevxx6AqfJvBCam6Q=;
 b=ABWwGajBegAFvkleTFUCoLSW+4DSXK54LoyBqVzfpWXXtqfs7/9Qc4vPqLpUKOicRPJJ8PeY1
 vtsT/+5FG0iCiCotC0vj4mSjgxTjzE5bJi7y2U/OZSvis4LdW5B4XdE
X-Developer-Key: i=shuwei.wu@mailbox.org; a=ed25519;
 pk=qZs6i2UZnXkmjUrwO5HJxcfpCvgSNrR4dcU5cjtfTSk=
X-MBO-RS-META: jqsu4rcxz18in9d1h8gr9ejytmt4e7q6
X-MBO-RS-ID: 130a0f1e83b68094291
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_203245_254906_FECC5DF5 
X-CRM114-Status: UNSURE (   7.63  )
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

Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
Tested-by: Vincent Legoll <legoll@online.fr> # OrangePi-RV2
Tested-by: Gong Shuai <gsh517025@gmail.com>

---
Changes in v2:
- Update compatible to "spacemit,k1-tsensor"
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 101 +++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 529ec68e9c23..e9952204224e 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -339,6 +339,96 @@ osc_32k: clock-32k {
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
@@ -494,6 +584,17 @@ syscon_apbc: system-controller@d4015000 {
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
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
