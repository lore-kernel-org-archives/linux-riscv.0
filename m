Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076FB606A326
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 06:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gn/q/H5/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=jtP36Bm1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:From:Cc:To:In-Reply-To:Date:
	Mime-Version:Message-Id:Subject:References:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=tYVgYizwhJnAZAaidrQU5aYvFH3Wa5PGv7imkcw5b0s=; b=gn/q/H5/i6a5e5tirFtD8Er3Y1
	3NFvXDlNmYWw/O/6L9q1vgZI6nsrblyiL3UX3k4y9MVOO6N9m3+L7YCgeRGyDlGTOyWcpSgnSPBEn
	9fqssNP4Ij3L9MD/EKz8x6AGK7ipeY7FfNZtRdV0rpGxnY4AOzzOa2D4LCt1c8sWn+ojRMOD6B5qB
	JvF0IfdI/SgvMRj8gUliZrudzu3svmpyb9lSRH+f335PvJ9z+afxVMXm1enYYu0BD/2WK1npa2LWJ
	p2ytF6+jmmd7aXPy4MreroK8XnuEyaB3Y0bDO4UAUKm8CJ+gdF17olVQOPqRXSALBlGQK30tEoE22
	cicDhmeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNl7C-0000000FcLG-0Mfo;
	Mon, 02 Nov 2026 06:01:54 +0000
Received: from va-2-39.ptr.blmpb.com ([209.127.231.39])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNl7A-0000000FcJL-0iNc
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 06:01:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1793599309;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=1RdRWFhku22lQfv1esybG7dBMJhACY2UvYQ+lxBr1Ak=;
 b=jtP36Bm1EE5FvPaN7ImkO1bJ/9GOXwyEKh1I5J3/2ltFRJpPnKnxivA/xW2O9BREf4kn6Z
 Q5sAsUn52ttcFsGI/UG9ZhzES88CFH78YFuJs4YnxqLIBCOmYWPS+cjsOZZmyOEg/zWie8
 o9/UUxqhcTTZ5m6j/5ocs0vyM3xY5+BHFKhigSkW2A4kxYcGFUH41k6AMhjqDrETZ2StzY
 k9Afpq6zm8wIN+Za1RGqj0PHaOmhXC0LNI5rRVlLMKe2weoduxHQGngkQwE/VUg9YULnNX
 gFPz4JRhr+Rz+wYKdB4abYRuB2BXEQev7jvoHptlOWKig1/vHYoargEn3A5JHg==
Received: from roma-Laptop-12th-Gen-Intel-Core.lan ([113.80.9.210]) by smtp.feishu.cn with ESMTPS; Mon, 02 Nov 2026 14:01:41 +0800
References: <20261102060012.100623-1-sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
Subject: [PATCH v3 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: add USB controller and USB phy support
Message-Id: <20261102060136.100662-1-sandie.cao@deepcomputing.io>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Mon,  2 Nov 2026 14:01:36 +0800
X-Lms-Return-Path: <lba+26ae82746+0a4549+lists.infradead.org+sandie.cao@deepcomputing.io>
In-Reply-To: <20261102060012.100623-1-sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>
Cc: "Alexandre Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_220152_288371_1444233D 
X-CRM114-Status: UNSURE (   5.95  )
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
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add USB device node (b, c, d) to DeepComputing FML13V05 board.
USB A works on otg mode, it isn't configured currently.
- 4 USB-C Ports
     - Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
     - Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (4K@60Hz)
     - Port 3 & 4: USB 3.2 Gen 1

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 .../spacemit/k3-deepcomputing-fml13v05.dts    | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
index 804abc85602a..84f66dd8f962 100644
--- a/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-deepcomputing-fml13v05.dts
@@ -179,8 +179,58 @@ dldo7: dldo7 {
 	};
 };
 
+&combophy {
+	spacemit,apmu = <&syscon_apmu 0x17>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_0_cfg>;
 	status = "okay";
 };
+
+&usb2_host {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	hub@1 {
+		compatible = "usb5e3,608";
+		reg = <1>;
+	};
+};
+
+&usb2_phy {
+	status = "okay";
+};
+
+&usb3b_u2phy {
+	status = "okay";
+};
+
+&usb3b {
+	phys = <&usb3b_u2phy>, <&combophy 2 PHY_TYPE_USB3>;
+	phy-names = "usb2-phy", "usb3-phy";
+	status = "okay";
+};
+
+&usb3c_u2phy {
+	status = "okay";
+};
+
+&usb3c {
+	phys = <&usb3c_u2phy>, <&combophy 3 PHY_TYPE_USB3>;
+	phy-names = "usb2-phy", "usb3-phy";
+	status = "okay";
+};
+
+&usb3d_u2phy {
+	status = "okay";
+};
+
+&usb3d {
+	phys = <&usb3d_u2phy>, <&combophy 4 PHY_TYPE_USB3>;
+	phy-names = "usb2-phy", "usb3-phy";
+	status = "okay";
+};
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
