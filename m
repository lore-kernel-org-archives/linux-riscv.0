Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB07DCAC5A7
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Sep 2025 08:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=67WRtZUBWi3SZJf7fM2V2bJuGL68xExiFsTxGjJxyV0=; b=TzbPBYZGkPqgrn
	m1KgYPswlGVLDSG7CQNXV4QpWexdcmXl37mnODTdBDDPRYUB5dSqppU5SsZOvltNgkxrEvHuqxvxa
	61njH3/ZfL1jsgFA6uK2EJWtNHpVeNjQIUOZXUx72Duis+0dnxNLgvER3KoPRQJrS83ZgQG57LtIM
	Q4VcNYQrX6oxR9p5WYi5AcdgalX1gOYXGqe93uslrGfFlrfvcTWzy+b9eHaEBiyzzsNTtUtXxI0TL
	s0uep1b0JhXb+kPUxZMLSXPLoDnit3V2nhwNbUTP85lp7ZZ7Wu8xV/zogKAazqhfakv7x3z2BkkYC
	IOixm+foy0AfjurLs5mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0FZU-000000077Tg-1tlE;
	Sun, 21 Sep 2025 08:37:24 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0FZR-000000077RM-3pdV
	for linux-riscv@lists.infradead.org;
	Sun, 21 Sep 2025 08:37:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1758443816; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nxXNMqI2qg6zufy0Xd4Y514jhC0IROp7AKcI+Aanga4iNtC53S+f5SZL28kR7zqaLaKqnEOeEdfFgZZaSSjYIl0mPPFMAT0Cfj+G3lVh2nZNyrNxZVjiKR3/GoZHdaVYCpz3JnsLttwE6Cp1y1to0+RcxHJ1/L0hbdOyCc5ma+8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1758443816; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=codWgtTq6Zb64pUUOo3Dzr6/p0mx/o9YUriH+67Le3Y=; 
	b=OZWl27m87tvRQ788UMUql8HK10J3MIqNzlvXMwQJ6vcMokzda0xrsNi1mptshA5/cIUt62X0XQwyo2Kwce7HsF9ciMa7SNzzEdzCZ3gWW6yMssgRly90DoLOJlLjfMz8uHa4eOqQI/gTI5BvQ4YI2x/0TvuxOnixhzNoEKr24fc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1758443816;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=codWgtTq6Zb64pUUOo3Dzr6/p0mx/o9YUriH+67Le3Y=;
	b=UfF29hF1PQmU2MZ1Ge9X15w6oi2ao/rzoft/tWrDjnjk2+okrjGjfXRQI0xCNBub
	UVPT3Tu9DJNDAtKt2eW1Ew/fDjDHd3TkCa2aPYSrXtqQTjU56WEdmdLjKlQhqFARjHl
	9Kv/R6793q+gkpEcZc/12JSK9MGbqJyzG4soMAFYY7MuMUulyjY2dnOdw1Sb/XuJPnu
	0+L3lyKvwsuruJcQQU36oQFC1hRIcKxeOtkaDoWCgrPH5134OWdtyuud08tftrbvXo7
	tdUzRqiYaUOkkC9VjOPVYWn3caGMCW2Yy8ltlL9OjUuFbLZJWH4k+QyFquq4NOfjZ00
	vQCziCay2g==
Received: by mx.zohomail.com with SMTPS id 1758443814250482.2030454290558;
	Sun, 21 Sep 2025 01:36:54 -0700 (PDT)
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
Subject: [PATCH v2 7/8] riscv: dts: thead: lichee-pi-4a: enable HDMI
Date: Sun, 21 Sep 2025 16:34:45 +0800
Message-ID: <20250921083446.790374-8-uwu@icenowy.me>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250921083446.790374-1-uwu@icenowy.me>
References: <20250921083446.790374-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_013722_004103_A93DDA0A 
X-CRM114-Status: UNSURE (   8.28  )
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
No changes in v2.

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
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
