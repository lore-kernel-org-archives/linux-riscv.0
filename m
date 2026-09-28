Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22292CA5FA1
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 23:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GMz6LN/J827T/wHhFeTmttczF2W2vtpvJZ+MkRMA/Q4=; b=wV4dzDI5PPtTZG
	filYzozk0DMtu35I6RrznpGGjBKpxVs6HlvQxIi3nKjOwH9HUxzUJfE9nHBxi6XF3pP7Cw4/zCaiK
	ljfyECzoLL7MKRNPkw57Z5z+a2v/stggHz5ufKT+9o5mMGkS7zt0g8Ms3YrlRapzVX7KXdNnfLKjs
	Z1GXrU5crx0Xz95ynzH3ghH/Ril5tRL4fywNnfAY180aP/NRZGAJ41M7mSB8Ewyc5b65p5d16d7G2
	DL0ZLhmfPHqfiXjWKstllD/DEYLPVXhbSQSN4+SiXDPxk2LODDM4qAv9gsmpBZDdvNRkSPn34bTFP
	ehL1ohnCCyuutj3n8XUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBKen-00000001rOg-0EBE;
	Mon, 28 Sep 2026 23:21:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBKek-00000001rNe-3Sl5
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 23:21:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790637670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=45/Cb1sUktpiMdyfE/exim2HZWKPpOnrWEl0XH8E2LY=;
	b=aDgoRl2KQT4XpHUR6q4mBkfYmevaCBJqkh23meeIjsoDXWoDHTooA0rA8Fq/2fs8gtcxgB
	W2sZPP1ytj6YO9RfkcDyv4XxO1CcgmdU0sRK8c23ssWH/+NVlDGsTBShRoeZkNupVGLq6h
	CU5AXTbu//mJFzEd1bI8abDbSret0Zk=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-9bTr2dkvOHOOfqtDUmDiiQ-1; Mon, 28 Sep 2026 19:19:40 -0400
X-MC-Unique: 9bTr2dkvOHOOfqtDUmDiiQ-1
X-Mimecast-MFC-AGG-ID: 9bTr2dkvOHOOfqtDUmDiiQ_1790637580
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-671321441d1so5057232d50.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 16:19:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790637579; x=1791242379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=45/Cb1sUktpiMdyfE/exim2HZWKPpOnrWEl0XH8E2LY=;
        b=m46GxDtwefhBfdObFvY9Z1j6vlenzaD8S/dnDEPVl3doxOTjQaMRravS8Hf4IqXFIz
         9UcF3AQOn9idc9/uAaYU4ovIFOyDQoVnPQW7Sm2rkbvpoJGoenNBt2GY5aBlmUXmgEF9
         SS2AdmmJJtq/p0wUFjxTYegMzx81bUZnlexU6KTg6bXG0audofVONvC2b1/xYhx+5qXH
         4Zs3ObLaQxXiH8ZjCnvFXMI3JP1t087MPxDoyOBmfDwLqWTPJ7hFpBXzwlKtRs/Bqd1F
         6hZmUPL0wrEfdK+4U+8eqdsPpsjWDwj8vp4fKE83QKWn9bGCdlZa2CNTut/LveaZeK3d
         Na8Q==
X-Forwarded-Encrypted: i=1; AKwUvBzCqqUmMWd3MBOfu9ywsi8Bf00wklZgsADPCLjS/3I3mGRgo7ueh6GD7vy6EDyLbsh9YEVVoo2K3MRGaQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYKG/CFPZD4gF1ZoGv3MgpulXKN+rlDMj3KQswBYrxFTq0rBjhWZ
	BKQsDqBp975qqRys+05bJpuOzQK2McN87EqoniSU8Eo7JanzRySzeI8PskwHeKpy69SGJLyLznk
	c5eqFWB/6RWz82nyw0XoOXznad1e5Hgsnf0h5U+KE5SO0ll/jHa45g9e/4LpMT4XaxXyCLewWbk
	oSU3MV
X-Gm-Gg: AYBFou3dihM5aqAK7faYA7fdVLo3hQKMsxvFiqX9JobpuJwrw9QVhPKXVn0I3nF3FKw
	VV96w/L0RPr/DwxjOTfKpaaZdH+m5chBZ+tJ39spi8fIh5CKV3i2lTiYW+AZFQnvDyTvj34uqdn
	JOhrT9Sl0DaI7TW5R1hlvt7OgdspUmF+BLgdTi6+yymqc/zIHtlyLmwroywIdzgFqu9zYkrzocf
	qLGNKfRW73jvWWyrY733F4AD8axeyK2/ZzsLk4kkZgnqFSnkriqWXNd7nnKYAcAFgE++Q56sTza
	4ihDfV9zJV0UWPH1LL767yyvhw7bYWyZwWu2U/jXhO9wjplS97jdKg==
X-Received: by 2002:a05:690e:1c0e:b0:675:3431:d51c with SMTP id 956f58d0204a3-6753431da19mr2783192d50.50.1790637579502;
        Mon, 28 Sep 2026 16:19:39 -0700 (PDT)
X-Received: by 2002:a05:690e:1c0e:b0:675:3431:d51c with SMTP id 956f58d0204a3-6753431da19mr2783181d50.50.1790637579018;
        Mon, 28 Sep 2026 16:19:39 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a860f9cdb0sm51374117b3.24.2026.09.28.16.19.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 16:19:37 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	James Morris <jmorris@namei.org>,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH 3/4] riscv: dts: spacemit: k3-com260-ifx: Add PCIe nodes
Date: Mon, 28 Sep 2026 19:18:06 -0400
Message-ID: <20260928231807.1757995-4-jberring@redhat.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928231807.1757995-1-jberring@redhat.com>
References: <20260928231807.1757995-1-jberring@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WqIqSVkiRnJUh4LA9ln61AszxRn4WYEDHBNq05SqraY_1790637580
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_162110_938307_C1A998FD 
X-CRM114-Status: GOOD (  10.71  )
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

K3 CoM260 Dev Kit uses PCIe for three M.2 slots:

- M.2 M-key 2280: PCIe 3.0 x4 (pcie0_rc)
- M.2 M-key 2230: PCIe 3.0 x1+1 (pcie3_rc)
- M.2 E-key 2230: PCIe 3.0 x1 (pcie4_rc)

The M.2 M-key 2230 slot is connected to two PCIe lanes, with lane 0
on combo phy 4 and lane 1 on combo phy 3. The K3 combo phy cannot be
configured to use these as one PCIe 3.0 x2 device; treat this slot as x1
only instead.

The E-key slot has an RTL8852BE WiFi+BT NIC installed from factory.

Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
 .../riscv/boot/dts/spacemit/k3-com260-ifx.dts | 45 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi  | 33 ++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index a4dfa25c837fe..01e286cb05797 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -39,6 +39,14 @@ reg_vbus_5v: regulator-usb3-vbus-5v {
 		gpio = <&gpio K3_GPIO(67) GPIO_ACTIVE_HIGH>;
 		enable-active-high;
 	};
+
+	reg_aux_vcc3v3: regulator-aux-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "AUX_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
 
 &combophy {
@@ -61,6 +69,43 @@ eeprom@50 {
 	};
 };
 
+&pcie0_rc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_1_cfg>;
+	num-lanes = <4>;
+	status = "okay";
+
+	pcie@0 {
+		vpcie3v3-supply = <&reg_aux_vcc3v3>;
+		phys = <&combophy 0 PHY_TYPE_PCIE>,
+		       <&combophy 1 PHY_TYPE_PCIE>;
+	};
+};
+
+&pcie3_rc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie3_0_cfg>;
+	num-lanes = <1>;
+	status = "okay";
+
+	pcie@0 {
+		vpcie3v3-supply = <&reg_aux_vcc3v3>;
+		phys = <&combophy 4 PHY_TYPE_PCIE>;
+	};
+};
+
+&pcie4_rc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie4_1_cfg>;
+	num-lanes = <1>;
+	status = "okay";
+
+	pcie@0 {
+		vpcie3v3-supply = <&reg_aux_vcc3v3>;
+		phys = <&combophy 5 PHY_TYPE_PCIE>;
+	};
+};
+
 &usb2_host {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 1b19979f150ce..36f7780860f50 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -800,6 +800,17 @@ pcie0-0-pins {
 		};
 	};
 
+	pcie0_1_cfg: pcie0-1-cfg {
+		pcie0-0-pins {
+			pinmux = <K3_PADCONF(79, 5)>,   /* pcie0 perst */
+				 <K3_PADCONF(81, 5)>;	/* pcie0 clkreq */
+
+			bias-pull-up = <1>;
+			drive-strength = <38>;
+			power-source = <3300>;
+		};
+	};
+
 	pcie2_0_cfg: pcie2-0-cfg {
 		pcie2-0-pins {
 			pinmux = <K3_PADCONF(25, 4)>,	/* pcie2 perst */
@@ -810,6 +821,17 @@ pcie2-0-pins {
 		};
 	};
 
+	pcie3_0_cfg: pcie3-0-cfg {
+		pcie3-0-pins {
+			pinmux = <K3_PADCONF(3, 4)>,	/* pcie3 perst */
+				 <K3_PADCONF(5, 4)>;	/* pcie3 clkreq */
+
+			bias-pull-up = <1>;
+			drive-strength = <38>;
+			power-source = <3300>;
+		};
+	};
+
 	pcie4_0_cfg: pcie4-0-cfg {
 		pcie4-0-pins {
 			pinmux = <K3_PADCONF(76, 5)>,	/* pcie4 perst */
@@ -821,4 +843,15 @@ pcie4-0-pins {
 			power-source = <1800>;
 		};
 	};
+
+	pcie4_1_cfg: pcie4-1-cfg {
+		pcie4-0-pins {
+			pinmux = <K3_PADCONF(76, 5)>,	/* pcie4 perst */
+				 <K3_PADCONF(78, 5)>;	/* pcie4 clkreq */
+
+			bias-pull-up = <1>;
+			drive-strength = <38>;
+			power-source = <3300>;
+		};
+	};
 };
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
