Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C4DCA0EE6
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 18:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AJ2xsF1mFJSrxpGn7BUhd4sGKtUpjjkbwSx9e1+vlcw=; b=vWOsCyD4J6WznV
	ReuaADY3akaH4uNXzaS8XU+LoQNmYghnjhJwyvDG+VLZ3qtDhizKYb/Vu1n+0jzpXmjNbynHvgQhX
	BmP3P89O7GNMtRgfutofYmOjIZSjYjiwdU7mplxf3zXvj8dzohwTlltTNVVNo7EVkQaar4ED1R7kk
	7WwJ3mn1ebQbigRwz6MKauDq6un+HVMt4W7wFemHNHoWQad1VPrDkRLW3qd12N67d9kBvlqC3X/BW
	vodEVZycw5q2tX5VEwc2qe2/rEK4ib3eMaRmmYKaNYMgnZQw13JcgoYXlVxpRuLZGoSi8GCHbLO5K
	siGxT2EkGmgWhdGsXt3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umcGk-00000000HFF-0bwk;
	Thu, 14 Aug 2025 18:01:42 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umb2s-000000005xT-2SRV
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 16:43:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755189777; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jfj0+VWHCsZnl/l4c3a1pQTfXoieDJV0XOVyg3FD16n4duOOyFGHrPkl9SXnfpdu5POIXlDfb7/dKQxlFhcqGy40pFT2NMy7JC43rNxP0Vv2R+bZZN+gwAvrVzc+lZPTE6D0FC95tPXH45w0OHPHCgJ+/SxdxNl8/7kqVRS8RNs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755189777; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Hwz9vc0DqxjUR0hsEGwe0fb6hBhA6TWrtV1S0jJoekA=; 
	b=TSXYZW8SmhQfoadpYqJ7l+gJfTsSfAejhY9919qwXVCyfwdEiL1jctfkx6ugiKtZIs8aMtIhO0drwo+c3aeFECJZa/rP1WYg4r3rwKRbXEFKuv3c/Kp9OvzqIGH0JVcL0KQeD2oE1FvS4ypV58aLLNrqI3imkJRg8fvnGZP3+ig=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755189776;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Hwz9vc0DqxjUR0hsEGwe0fb6hBhA6TWrtV1S0jJoekA=;
	b=T0kpRHZkG8e2If1kjhEHml/HZ5Kpeo0jMLMXQ3EcZggrEY6fe9oL8aoRSmEUAHxb
	4nYrjIxAxucFIirguTAHtwvoAABwOw76s72C//qizlqlG3m4yGcvkZjtIslnQCzIO8V
	yGE+hX/cjDmP0mzClXNeSCAYzGF4dBr4Qk6IcXiDTG763mlGmfkBz7IBziCK8O1h9hD
	L6n5cwJNM7rMxxl1qMEeoDLgtiV+EQ5ZuS+F4CNc4Ugo1tSWpbgQTvQbdt/wQVc8Dpb
	B5sdNknkoNPHfqFINb4YdSFjt35LYeXXGdQMNMbMyf/K2DPiroHnQ3NT2OhUWJXcOSN
	NBSZpP5JKg==
Received: by mx.zohomail.com with SMTPS id 1755189774001869.1159628547316;
	Thu, 14 Aug 2025 09:42:54 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [RFC PATCH 7/8] riscv: dts: thead: lichee-pi-4a: enable HDMI
Date: Fri, 15 Aug 2025 00:40:47 +0800
Message-ID: <20250814164048.2336043-8-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250814164048.2336043-1-uwu@icenowy.me>
References: <20250814164048.2336043-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_094318_697201_6141EF56 
X-CRM114-Status: UNSURE (   8.74  )
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

Lichee Pi 4A board features a HDMI Type-A connector connected to the
HDMI TX controller of TH1520 SoC.

Add a device tree node describing the connector, connect it to the HDMI
controller, and enable everything on this display pipeline.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
index 4020c727f09e8..3e99f905dc316 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
@@ -28,6 +28,17 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con_in: endpoint {
+				remote-endpoint = <&hdmi_out_con>;
+			};
+		};
+	};
 };
 
 &padctrl0_apsys {
@@ -54,6 +65,20 @@ rx-pins {
 	};
 };
 
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
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins>;
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
