Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAB3CA5FCB
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Sep 2026 15:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M1gmI9QGRtnQbku3J5UyWWMUjJ+CMy+BKmZs/gDkxFU=; b=i2FumkkyvVHqk3
	Isv/1prSnfrgxuNvO5YvUXl3GY/g4AUYM3LQtCNpp11TYwWDTUGPnlGXQP9NG+lYOxxjvsDspPpo3
	iBG82/+NctTmDcFvIc4zmpApL7+siEDdJR+iGOuLbqN6e7AGQI7/uhJ0eWYSq/H5wr+C7SreWYUih
	7v/b4T1lot/T14+aLIgXq54oFVL1UAo/ieIC0buBYMuR9FHTOAY5qrKXSD3SPC3CNmt4euRKpg53Y
	mvU5LxhB6dHxEJ51/nGx2YCivoNWO6k3N0YfH8LRg1opmUqUakN7+vblWDqQPb7qrQjvU4qFvzjXy
	rxsYdev4aHGukk30mn1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwYJ-00000006ZcL-3Axg;
	Wed, 30 Sep 2026 15:49:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBwYI-00000006Zam-1mus
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Sep 2026 15:49:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Y41Q9WFkOR6sDX/bibH4WaOpuLUrtGQ8SMNMm1pPqNc=; b=eoocSn/bYRJtHk9WaTOCQbbX+K
	1YKYFAgZ1jUfxRuLPANiWK08/qN84KswVPNecj8XYrthJVCb6vTDs7d6m35CQHKqAcITJshnwB0DM
	xFLtk/yZE0Ak6cNmFhE+a5sa/rTy2dMmuz6Dr6ggIaaamdFnIezTFZuLJGpJTwKnfM7XqzNIkTP1V
	Ny/9uNBvdRecDwe0RnwTlLa+3CliZAFmUPi9BBuYMqF0o6RRy/MBFiJd6xrGMLswDoUKb3FpyCM7H
	BTlnHyFZlx6ZAnmtgMVKLTjH1FMWBYYKUm3/nFoVh/AYHXSvHV4LFJJf04Wu8Kfl4rPPH3iqV93zo
	wFJRmsUw==;
Received: from mail-pj2-x2a.google.com ([2607:f8b0:4864:39::2a])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBwYF-000000041YH-2yFr
	for linux-riscv@lists.infradead.org;
	Wed, 30 Sep 2026 15:49:01 +0000
Received: by mail-pj2-x2a.google.com with SMTP id 98e67ed59e1d1-3a4b4770191so928529a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 08:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790783337; x=1791388137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y41Q9WFkOR6sDX/bibH4WaOpuLUrtGQ8SMNMm1pPqNc=;
        b=eEwRkkh+g/46dPPeXP5w7rAEyUixbG1cJn9Uo595fvANpRp5LPEPAVtC/QBOUCBPVT
         EfUKV3pm7L/xhNsiAkawRc/67TVnBg2gaOx4WNtlG8uUF5cs/pp2Abw/gEMQBmgzfDIn
         s3mKThRlFcwXhfBwTjH59t/EyYcXk/Q0I99Cw/ywMxQIRWu8jxnSlBZTvOIKeYSIXNjX
         m3a6XHp99OjFA/SFd++u4wrzSxbf8pySVozMcbdFc4naiZKGH9Cam9s+VGu2NP0aeJlV
         DR9SlXv7ughwQ2cFsvUMjBXNgXp+iA5ENnkhj2Ojr/SBXARC6XwvWek9A5Apny2PtNcY
         o49Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790783337; x=1791388137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y41Q9WFkOR6sDX/bibH4WaOpuLUrtGQ8SMNMm1pPqNc=;
        b=AXc5IyQmh2h6NYk/dOVYZkq7ylm5TP+aBmFYwxWnvgO+DHHVAgJjgI6PFZEgTjiSs7
         6wmDU7oOnoHiVZW9ovRWZ5EbwyB7Rbnid5x6ANtyeTc/27ACcMy04iLYKt00WeI2iz17
         MPyslICxbJu3zJA5xsayU2eVS/U/FiH5iDnVSmZb5VjDrT4JdxC2EkmPOHlYlCIWxbw7
         gPWWANYymUtoOaVbSoAwqKA5/SX/2ZfSXfHjNmShARjz0oRfDitYsCZ+QLZ9lIWYoAh4
         xpqa2ulxr+POyvHvw0MtMIHCI0eiJe/kCQV3YJgn4CWlYwds+GDVBu03uYrM0a5a6KEu
         z3XQ==
X-Forwarded-Encrypted: i=1; AKwUvByR/jqkHCe+POskNfQSKmTKyGfn3LUs25GE46dKw3Fa1k3EWsQ0xodS9aCKCUKTNk1ijzGvmmTIFOBKFA==@lists.infradead.org
X-Gm-Message-State: AFq9FYL8r9Rk3Gp2r9c4prBc0hPGqY6TYIZr8JO7V9zkGCfqgc5Lmqbu
	cz3jayDsmwlEkTkHBcqL3QsVhfZspXmTP28GqE4+4ZIpZT30Kc40wdUzF2ei8XwQe8GV
X-Gm-Gg: AYBFou3sXc8zUE+4+Od4W5c3627WC3O6aT7Ws7jWDVYSypvMte5lXid0Ph5yb0N3iQ+
	LyTUqsIaU4FW3U6g4ZyTKDnbxHHlOH+sws2u7aljz/Kotuaa2EW4gy2wyYt2uWADT+rPV3ozRd/
	mfIQb2Cca5sP99vI5KBeJI9qb9EXUAcLcLLnn2KiuyNrhK8PbgGrnh4L4xIvI4xq/FnArifOS3a
	oo3MtIm4xq4L/HAoIJErb5CJYI6W2bvt5LqK3lcyekxWCv72bVW436XogfSPCp/nX+DhK+IJ+hs
	SOX9zpWR3S+PvIwg50bRZf5iU9Z4+4AWc4GOMmmkJFp0LwxYdIcLLYPvyFYDSuATmoIGTuAJNHF
	QvrW60lHTxYX9VVHOwiS29qk8qkp9iNwWd0IzGZQB/7coMOlouqGD+KQHh+O2aapOAMRvSJiUyZ
	93Qv35ZZjgmTejo64u3bN6rE5/8vcUFoM0sbyLFq4emO2J5mAuL3xUGkt1oWIUC07/udHNF8x4Q
	aasJugY
X-Received: by 2002:a17:90b:35c3:b0:3a0:ca03:3e1f with SMTP id 98e67ed59e1d1-3a4d154522bmr1584586a91.32.1790783337518;
        Wed, 30 Sep 2026 08:48:57 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ee4d0af2sm308136a91.2.2026.09.30.08.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:48:57 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] riscv: dts: allwinner: d1s-t113: Add the CSIC node
Date: Wed, 30 Sep 2026 22:48:35 +0700
Message-Id: <20260930154835.402684-4-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930154835.402684-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260930154835.402684-1-tien.nguyenminh@embeddedlinux.blog>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_164859_878881_DD936059 
X-CRM114-Status: GOOD (  10.99  )
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

Add the CSIC node to the dtsi shared by the D1, D1s and T113, with the
pin groups of its parallel input. MCLK has its own group, for the sensor
node.

Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 13b1e57166..dd4c873457 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -70,6 +70,20 @@ clk_pg11_pin: clk-pg11-pin {
 				function = "clk";
 			};
 
+			/omit-if-no-ref/
+			csi0_8bit_pins: csi0-8bit-pins {
+				pins = "PE0", "PE1", "PE2", "PE4", "PE5",
+				       "PE6", "PE7", "PE8", "PE9", "PE10",
+				       "PE11";
+				function = "ncsi0";
+			};
+
+			/omit-if-no-ref/
+			csi0_mclk_pin: csi0-mclk-pin {
+				pins = "PE3";
+				function = "ncsi0";
+			};
+
 			/omit-if-no-ref/
 			dsi_4lane_pins: dsi-4lane-pins {
 				pins = "PD0", "PD1", "PD2", "PD3", "PD4", "PD5",
@@ -997,6 +1011,23 @@ tcon_tv0_out_tcon_top_hdmi: endpoint {
 			};
 		};
 
+		csi: csi@5800000 {
+			compatible = "allwinner,sun20i-d1-csi";
+			reg = <0x5800000 0x400000>;
+			interrupts = <SOC_PERIPHERAL_IRQ(95) IRQ_TYPE_LEVEL_HIGH>,
+				     <SOC_PERIPHERAL_IRQ(96) IRQ_TYPE_LEVEL_HIGH>,
+				     <SOC_PERIPHERAL_IRQ(100) IRQ_TYPE_LEVEL_HIGH>,
+				     <SOC_PERIPHERAL_IRQ(106) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_CSI>,
+				 <&ccu CLK_CSI_TOP>,
+				 <&ccu CLK_MBUS_CSI>;
+			clock-names = "bus", "mod", "ram";
+			resets = <&ccu RST_BUS_CSI>;
+			pinctrl-names = "default";
+			pinctrl-0 = <&csi0_8bit_pins>;
+			status = "disabled";
+		};
+
 		ppu: power-controller@7001000 {
 			compatible = "allwinner,sun20i-d1-ppu";
 			reg = <0x7001000 0x1000>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
