Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C23F2606A329
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 09:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rSX/eEKq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=WlkHgOHl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Subject:To:References:
	In-Reply-To:From:Cc:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yfLqNhaUrrOkjvRnDmLy8QOvu25wmJzrdIwyXW++zPQ=; b=rSX/eEKqo69dj4RBKDNSO5asrz
	CTkMZ2TudLzd9vDX7tbl5oi14boNBiCVZerNG+zH2xKlUWXC9boV9xffNwgvly4X8IwDGBr3+6frP
	0MKaoXtuOfaZVPNUp4ZSzkvRegQZQodkraVs+81tW5g3yNtx+rkBmjVzncaQZ3iSOu2pC3zzeea1H
	0c2bOuBvN1lI6cdGbQY/oSo3X6FvyxKTzzvcCvYZ9RhOrhht4DdZ+fqECLBEwJu9dRaDtjRbsKulU
	XXVXm58rlGRLx7+QnskVo+ozoY0ge+I7QIpdyiEe9k8iMiciwNYWsXbqZT9NU2JGkvs++yWHMfiqk
	1Whjq79g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsaa-00000001hYk-1WhY;
	Mon, 16 Nov 2026 09:01:24 +0000
Received: from va-2-29.ptr.blmpb.com ([209.127.231.29])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSsaX-00000001hXU-2ssU
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 09:01:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794819670;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=K+SHc+Dz2bu6gR+hGPRdpnsUFNLQ0kuFmQnGIRcMA1w=;
 b=WlkHgOHlIqnT6hCDvEFyqF0NZgHs8zbra3j9zb25J3d5GoUCZ3NALijf0AnLbPlWUugJ6C
 dexTv9x2Z6qNz+oLSdd2r6+KEcHWvc6U5kqF86iDH2bnEaHPK0auVybgHRrct8aedtWDWl
 xWGjPaxJXwnLS5u8G83uZSm8Aypu07MABZ/0Z9pUVH99mfSdN6L7PHmZ+yEWXHGp/UU/JE
 3FfJBsPGlRNkj45N3TVwC+rSPtNChIoPijSkfT/pi2UOZu33zag84LtcKYUWrKExI/qBAr
 wE2ZjGvHSuF1L0w3go+iTuRSnK91c2rSE5NhG8JKMy5xzuFP+Az48uaBFqL/4g==
Date: Mon, 16 Nov 2026 17:00:44 +0800
Message-Id: <20261116090044.951354-1-sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+26afac64d+ceafbc+lists.infradead.org+sandie.cao@deepcomputing.io>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
In-Reply-To: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
References: <20261116085725.951253-1-sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Subject: [PATCH 5/5] riscv: dts: spacemit: k3-deepcomputing-fml13v05: enable PCIe
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([218.17.141.187]) by smtp.feishu.cn with ESMTPS; Mon, 16 Nov 2026 17:00:59 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_010121_796080_3EA254A9 
X-CRM114-Status: UNSURE (   6.65  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The FML13V05 has two PCIe root complexes: pcie0 with four lanes on
combophy channels 0/1 for SSD and pcie4 with one lane on combophy
channel 5 for Wi-Fi. Add the 3.3V auxiliary regulator that powers
the PCIe slots and enable both controllers.

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index 2e1ad0929ee5..ea37981a86aa 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -23,6 +23,14 @@ memory@100000000 {
 		reg = <0x1 0x00000000 0x4 0x00000000>;
 	};
 
+	reg_aux_vcc3v3: regulator-aux-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "AUX_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	reg_aux_vcc5v: regulator-aux-vcc5v {
 		compatible = "regulator-fixed";
 		regulator-name = "AUX_VCC5V";
@@ -202,6 +210,31 @@ &combophy {
 	status = "okay";
 };
 
+&pcie0_rc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_0_cfg>;
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
+&pcie4_rc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie4_0_cfg>;
+	num-lanes = <1>;
+	status = "okay";
+
+	pcie@0 {
+		vpcie3v3-supply = <&reg_aux_vcc3v3>;
+		phys = <&combophy 5 PHY_TYPE_PCIE>;
+	};
+};
+
 /*
  * Onboard SD card slot:
  * Please insert or remove the SD card while the device is powered off.
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
