Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369AACFD317
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 10:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nQJ0lfRWMc2OyCIj4hNdLUnEoob4Em7rbu3juAgWwn0=; b=3dG/5t8RAO3iOE
	Hu8TIGCVp4CZJ71KSkjtA3cgQtcb4MbBRh2jWh52en6ryBeooD6MAXxZwXW5oR5J18Kn93DiwJS3S
	S2z8oB0FG+sLgIEK3IXhaTK1XKFXk/48kU3laRqWEZrGPbYk/xMtC2TZsVbkpxl+1fnkr85X6NA1z
	KGAggBVycyp3jaN37E+2t/1ZVo2+FfH9FkiQuStEgiw+yjoXAOXseKtuGRMYeDVND7a/rS9gxIhPC
	JpA6jVP6fx8ca1IEYJLMHGlb8I+0yoyExXhey0e+9YVEPCwl0bsoxf3+5YfdvrejWGlLwjipm+2I2
	EpbZ2f+tYd+pSsRnu9tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUDM-0000000BSlU-0rhr;
	Mon, 24 Nov 2025 10:54:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNUDL-0000000BSkf-0ftr
	for linux-riscv@bombadil.infradead.org;
	Mon, 24 Nov 2025 10:54:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZJpqyYfhAERIsGWk+dSoA06vMJ9B8PJ3IpzupKAbgK0=; b=dN5PJuNJ/zuVS3UO/w6zHt+eqm
	Lv1cas0BN2Axed78kPrpxDwSuYk03/Z/wIEGMYOhmBU4xWuSVYQWKeQRQQEZipBpYQHPPxf2Lbg/e
	uf2BwCKr4NDMoCCV4gV+Y+m00pR35+6RLK+b2hzk/996BamW0Z6LrYAlc5G+/YbJp4fTi41xmXZLV
	yMVj9vkM2kSPk6NjvqUkBgVrqA/WRMwQr04geum+5z8Bh9Pdb4T72QsTgxFbSJgT5yjwcb2QP1FW6
	KYQXFUlfk93TY8qw6R/KVx8Rgyl9ntfTaMMhFt8uTx/3yfbmM2Ggr89ossIW54w+CS/iWORF+BkR5
	X+01CM5g==;
Received: from sender3-op-o15.zoho.com ([136.143.184.15])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNTLf-00000003S4R-3S0F
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 09:59:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1763981646; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=aBm/DY2wciLU1S6JRo4aL6Z/oon/PX3zfe4wFbLqYGCIqHmEEXQVgXOQumUp6+CbT3vyftRHtJsNlOdFD3SA33ToudRl6DG235JYJW7b03nL7rH+t4KPCbfZf9wiHVIH5G6oQHb/qqmhJlq7CCBplrVk2mrp0ZdnacUJPb+mViU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1763981646; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZJpqyYfhAERIsGWk+dSoA06vMJ9B8PJ3IpzupKAbgK0=; 
	b=JwhnijW+2F2Z9eN8HNW6TpYM4elkSs6/URFb15hAw+cA8e2Do/kqPfIjU6P6psgcVI5h6FbWBUdLOoV5SPItKua4jXinUUds7zdmqRjwsBROsWzKBoEeOIAdyGFpOy9TvKhDHJtPEB0TI14L7MjFvoFSWP58LL+iJILTO4vsrGQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1763981646;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=ZJpqyYfhAERIsGWk+dSoA06vMJ9B8PJ3IpzupKAbgK0=;
	b=qdqnGkQIZCxSG2SVuks7tf0dTRXOnwKL4TfM/ut8Rm+w1gl6Y4ayl8q3jyIokA/w
	VWn9D+k35tQYZ9pMcXRoxKDEvndTCju+HLoYaQXHYLTdNi+AGp2fwSxA5fQPBOnxe6l
	GJpB5MBnTQvjaR/S6QrLHhdRfTQ1pr4/OhQylYze5fIjf1rmzk5RqYsY2v1Ao2PG3fR
	1gUzJC8R7+uYxuCyNm3Q14+1II3bKjD5fuWMUVTL0h62QzY5EaZLwXOOoADrYamY63J
	POu3ViLpAT1dUQ/ZSrDBHvEo1GxaEcikGmLNrDiSIBJlyd1mcE65xr0RQn3vLnlk3ki
	qtz9vE+rJg==
Received: by mx.zohomail.com with SMTPS id 1763981645508600.9408522110368;
	Mon, 24 Nov 2025 02:54:05 -0800 (PST)
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
Subject: [PATCH v3 7/9] riscv: dts: thead: lichee-pi-4a: enable HDMI
Date: Mon, 24 Nov 2025 18:52:24 +0800
Message-ID: <20251124105226.2860845-8-uwu@icenowy.me>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251124105226.2860845-1-uwu@icenowy.me>
References: <20251124105226.2860845-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_095909_108202_8E3A62A2 
X-CRM114-Status: UNSURE (   8.63  )
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
No changes in v1, v2.

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
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
