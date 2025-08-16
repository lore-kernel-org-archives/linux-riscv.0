Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1558ECA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Aug 2025 09:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AyQMfHJymWuMioRveivJmUnhUsRFOFlAgsQXxkmYyFA=; b=wsxjYO4zoAO/zK
	0lxQn60fH3oKYtJmsxCeXciUE16Xt5rmAAtXASkxcAJ4uPkYbj5374XlnsYkR/xc54N2qlixN5DRh
	/rDxqd84rDuYEV38EuXOnH4Tl3C1fbfuUloBNI4bgl3Rq5hMsOnqcRnHBP9d8zeucqSTJqhiiynb1
	kYToJ2evWn0nNGdY93KoYK8J+ynk57vrqq5+WPhGbI0BwYXH/XsbFwCyb2qWfX4SYaJV0/Hal0Mfz
	S6qxKVEtZ9lBpYyR+YtpQYW3bBfLzhd4n3hY9aU2/yifxdbkmIpU7+7EEBckg8NCXeMIF7/0Hfpd3
	mGQm6ZsT4LTXDpfn+4og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unDOw-00000004PZ7-0PPI;
	Sat, 16 Aug 2025 09:40:38 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unDHc-00000004Ogb-32bd
	for linux-riscv@lists.infradead.org;
	Sat, 16 Aug 2025 09:33:06 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755336781; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=W0sLdmC/dzTpbI8WbmZT8YwZeQwmhYwQV4QpaCbOCr9Jt72D65DCoj4QJ2Wg4Bn8clzui2oVabNIBJREggmUQpq/8AKWX3u9Ra4Yd65la25yOqDb5ZAX1gix0gcXLOrrttZAIfcvrQRTvSiPPdOVpqfUsjubZSa7snzqIZfBvkw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755336781; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+z/oVlLFF1PycSfqjySbob+HkdEI6/LSvl3u/uL2B6Y=; 
	b=Wxug/1PhLezaZvsblAoh3ZoJ1pNCb81+3/Kj+6TZKRIFrAYznSl/gw/4uC75PC6OM4GYfrkCyjA6pFwopBuXeQvm2vQu7Q+HvmoKSdh6jbZmNubXce4bqLGosJNHF1QMd+/RiAwdPwrFtKqRlpPEU21IXzyzXmSC82rqJf1yrcU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755336780;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+z/oVlLFF1PycSfqjySbob+HkdEI6/LSvl3u/uL2B6Y=;
	b=iUzjxrQyI6HFaPu3MCLdm3l7YzqJrj9nWNy4mm9KDPRuPP7LgUnMpWQKZyhve+XC
	CWGZpCLtJullORPPuA5FEQQDMZ3NM06wQu3oh2XK0GWtx2QBe3HxrSpO22uHMc6p4ZK
	a7XQc0l6FF8Ne7IaII4LApHFq8eG15/yOAh3pYRc0J3zDycyfGoaP2Y4PGDaQlcrkzh
	bgnlOCYBGTEpbpGU2qoFMjGtXJ2w8XhifWquMYFWjUcztm5vCvlaUByqaPUU3OLorVd
	NwOkjs/hgF8z3gRSOmNa90hpvPfRXia+a9tYqjsGeqeTYHqO4MoqEJnrCx8jc5AxscE
	dHNPqFtWrg==
Received: by mx.zohomail.com with SMTPS id 1755336778054821.4036963515487;
	Sat, 16 Aug 2025 02:32:58 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 3/3] riscv: dts: thead: th1520: add soft PWM fan for Lichee Pi 4A
Date: Sat, 16 Aug 2025 17:32:09 +0800
Message-ID: <20250816093209.2600355-4-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816093209.2600355-1-uwu@icenowy.me>
References: <20250816093209.2600355-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_023304_830250_BA9C4E8A 
X-CRM114-Status: GOOD (  12.27  )
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

Because of the SoM+Dock design of Lichee Pi 4A, heat dissipation does
not work well; fortunately it comes with a fan port with PWM driving
capability.

As the hardware PWM controller of Lichee Pi 4A isn't ready yet, drive it
with pwm-gpio driver (software PWM) now.

A long PWM period is used, because not only software PWM is used, but
also the fan port is a 2-pin one and fast PWM might confuse the BLDC
driver on fans.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 53 +++++++++++++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi         |  2 +-
 2 files changed, 54 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
index 4020c727f09e8..f696db01353c5 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
@@ -4,6 +4,7 @@
  */
 
 #include "th1520-lichee-module-4a.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Sipeed Lichee Pi 4A";
@@ -28,6 +29,58 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	gpio_pwm: gpio-pwm {
+		#pwm-cells = <3>;
+		compatible = "pwm-gpio";
+		gpios = <&gpio3 3 GPIO_ACTIVE_HIGH>;
+	};
+
+	fan: pwm-fan {
+		compatible = "pwm-fan";
+		#cooling-cells = <2>;
+		pwms = <&gpio_pwm 0 100000000 0>;
+		cooling-levels = <0 66 196 255>;
+	};
+};
+
+&cpu_thermal_zone {
+	trips {
+		fan_trip0: fan-trip-0 {
+			temperature = <40000>;
+			hysteresis = <8000>;
+			type = "active";
+		};
+
+		fan_trip1: fan-trip-1 {
+			temperature = <50000>;
+			hysteresis = <8000>;
+			type = "active";
+		};
+
+		fan_trip2: fan-trip-2 {
+			temperature = <60000>;
+			hysteresis = <8000>;
+			type = "active";
+		};
+	};
+
+	cooling-maps {
+		map-active-0 {
+			cooling-device = <&fan 1 1>;
+			trip = <&fan_trip0>;
+		};
+
+		map-active-1 {
+			cooling-device = <&fan 2 2>;
+			trip = <&fan_trip1>;
+		};
+
+		map-active-2 {
+			cooling-device = <&fan 3 3>;
+			trip = <&fan_trip2>;
+		};
+	};
 };
 
 &padctrl0_apsys {
diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index a48eca5def606..5ac8044a05f1e 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -703,7 +703,7 @@ gpio4: gpio-controller@0 {
 	};
 
 	thermal-zones {
-		cpu-thermal {
+		cpu_thermal_zone: cpu-thermal {
 			polling-delay-passive = <250>;
 			polling-delay = <15000>;
 
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
