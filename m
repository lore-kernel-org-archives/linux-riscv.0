Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98512CA9EBB
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Oct 2026 02:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/o/B1zPkzc4ORlkXZDpGVfkNP2uwrQN6X49GQOKNakk=; b=gBslpZ8IrxSzN8
	wYxp9EOu76NoIaNMGP+MZ3u5Qxgw2UTkjjKiL44ZjivQ9+DWWEo6Evmxejg+Zpka0HAnslUSt+WH3
	gWMjc/0AU6K4MRh+bbTeoFj0gaa8eDpuqgojX2/TQfa3v0qup6BGX66ReDXtI30xtpPZkseWOLLCj
	jB48pIs1E9SxSAnguYRlLFmQfh2hTYWdht3b+2P/bcVlEtgux9YSRAQDZzU53zBweyr4OO6Copcej
	XIFm2uIsRRXiAJZThiBUnrTmC8yf3VXQMwSznLNe9eGCZkHQtqwUlyJnfInXM1utBmfmq+oscF4BE
	CkTUSCNJUHzXqYm5CtSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFMSp-00000007PTi-3MWk;
	Sat, 10 Oct 2026 02:05:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFMSj-00000007PTH-3kDV
	for linux-riscv@lists.infradead.org;
	Sat, 10 Oct 2026 02:05:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791597922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=w+tGYwl2znmnp8WIdQYcLZIZyvGyAsTyeavLHMYpyQU=;
	b=hOtEhzmCY/ZKnh+rUNiNg7rcdzRwmnyoFiXw74tGLLedC9F6PwQ05K5XCB1sCaxifTtlvQ
	ti8+EbpIMz0ElFvSQ4mDAtfL4OJVtFsOO0sjTX/3Y8TWJKp4haMRG/O/JIWV/yn3uSIs2S
	83KvWvL69WAtJ/8b2NJDN0twwtag3Go=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-671-op0X6R8rN3u2-3VpN4iEzg-1; Sat, 10 Oct 2026 02:05:21 +0000
X-MC-Unique: op0X6R8rN3u2-3VpN4iEzg-1
X-Mimecast-MFC-AGG-ID: op0X6R8rN3u2-3VpN4iEzg_1791597921
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-8ab43f7f5faso3472997b3.2
        for <linux-riscv@lists.infradead.org>; Fri, 09 Oct 2026 19:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791597921; x=1792202721;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w+tGYwl2znmnp8WIdQYcLZIZyvGyAsTyeavLHMYpyQU=;
        b=U4Rn17fPo22bQqUmFBa/8O1Eg1+YDyeKMddOudzqz7qyMeFpo2Anz635TfIJ1DVLpe
         PTaXs6hS/mKo2i0TscZ2vmjmHTvyGvhgNsJ5kwNTuT++GuhEqBN3nTS1WJbG0LuKxGaC
         5kdHcQrdbS9pt6Z7NS870d4T1xnLp/MJFYbafU04z+efFROyf5SrphoVK6/K+gpikxTg
         tEQ+mwkAGjew+GG3pwKkDFE94mKoxzPjzbNYGzsp2mJh+4S+9dCBojKfg7kyT45C+6p7
         VztVSbVoAzl6sb1u7gIyu5xMGfRvmrIPPbIjwjSd80MMdhQ4ev8wiVeo0flbn7spJM0f
         4FhA==
X-Forwarded-Encrypted: i=1; AKwUvBy/ErYED/pIv8khh+i8IVcOBtBEXHZgm7f3tsCthwd6y2bcR/jpyN1uRCwB/2mDV0x+MMjdYXhYtP7iGg==@lists.infradead.org
X-Gm-Message-State: AFq9FYI8ComvhET6a/+5WV7TySEBCqgewQgQ2oISlv3DgNlJdBpDbnU7
	EWNfsH0aAAKYx/mKPozg3tZxJBPhQo6W+SBoLfq/hlA7VoSHTCx86BHzxCgN3dUklqXu6jcBJu2
	IVJIBh3pr0jqYELyeJTB6uyWOkdf2+FeBEx0KGHtTWwBrc7Kl6YV5x1x5U74uWrSH98c3IA==
X-Gm-Gg: AYBFou1KiIfAk3IufIs0SM3UN7Nky2JmFvGzTZ+u5a3yziGApn6Lp2uIawNB7vIyUMs
	cNARyeDs2eHiZWduKcbXzdCTPgFaq664Dw4GOp1/f8kX5niTWbfm4O4ZMbIqH4CkKWK5l4hBwPR
	CpzVRs+S4GiJ3gGLh+3Z9B+2anSrvrACkDtQFYL46GE7wCGz78hi51Zfqiu5VYcDtsZlXTZpEfy
	U1ksdQKCu0sYWk+o3CpvOjkQAcm+ammXSZO67ahTKBMJVvyGVbuHm1eclXmnB7ARpy4ftUYDwsY
	97YFXeO4vyF0fjQVavEN33i6CSAwWweSwsf3N3iaZ6QlsOw36xQ+
X-Received: by 2002:a05:690c:4d81:b0:8ae:6740:999 with SMTP id 00721157ae682-8b07ed90a18mr10609547b3.20.1791597920951;
        Fri, 09 Oct 2026 19:05:20 -0700 (PDT)
X-Received: by 2002:a05:690c:4d81:b0:8ae:6740:999 with SMTP id 00721157ae682-8b07ed90a18mr10609237b3.20.1791597919575;
        Fri, 09 Oct 2026 19:05:19 -0700 (PDT)
Received: from rhdev ([2600:1700:f361:20bf::14c1])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b07ee8c257sm14463027b3.3.2026.10.09.19.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 19:05:18 -0700 (PDT)
From: Jennifer Berringer <jberring@redhat.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jennifer Berringer <jberring@redhat.com>
Subject: [PATCH] riscv: dts: spacemit: enable USB2.0 controllers on Milk-V Jupiter
Date: Fri,  9 Oct 2026 22:03:17 -0400
Message-ID: <20261009-jupiter-usb2-v1-1-ab84a00d3b64@redhat.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Change-ID: 20261009-jupiter-usb2-b888e544520a
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gGUZpGzNNPutK4OM-fQpRu03GlDpKjS1xrqtp8vRTWE_1791597921
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_190526_034410_4DE7F283 
X-CRM114-Status: GOOD (  11.74  )
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

On Milk-V Jupiter boards, usb2_0 is connected to a Type-C connector
which cannot act as a power source. That port can act as USB host if
connected to a self-powered hub.

usb2_1 has vbus output controlled by gpio 127 and is connected to a
FE1.1s hub, which drives four ports: two rear Type-A receptacles and a
9-pin header for two chassis ports.

Signed-off-by: Jennifer Berringer <jberring@redhat.com>
---
This patch depends on
https://lore.kernel.org/spacemit/20261009-b4-spacemit-k1-usb2-v4-0-2d98e5324d9a@linux.spacemit.com/

This conflicts with the Jupiter M1 patch set but can be applied on top
of it if all instances of "k1-milkv-jupiter.dts" in this diff are
replaced with "k1-milkv-jupiter-common.dtsi"
---
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 35 +++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 635e95aad14a5..913c2170bf6a2 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -82,6 +82,16 @@ reg_vcc_5v: regulator-vcc-5v {
 		vin-supply = <&reg_dc_in>;
 	};
 
+	reg_usb2_vbus: regulator-usb2-vbus-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "USB20_VBUS";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&reg_vcc_5v>;
+		gpio = <&gpio K1_GPIO(127) GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	regulator-usb3-vbus-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "USB30_VBUS";
@@ -443,10 +453,35 @@ &uart0 {
 	status = "okay";
 };
 
+&usbphy0 {
+	status = "okay";
+};
+
+&usbphy1 {
+	status = "okay";
+};
+
 &usbphy2 {
 	status = "okay";
 };
 
+&usb2_0 {
+	status = "okay";
+};
+
+&usb2_1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	vbus-supply = <&reg_usb2_vbus>;
+	status = "okay";
+
+	hub_2_1: hub@1 {
+		compatible = "usb1a40,0101";
+		reg = <1>;
+		vdd-supply = <&pcie_vcc_3v3>;
+	};
+};
+
 &usb_dwc3 {
 	dr_mode = "host";
 	#address-cells = <1>;

---
base-commit: e5e04726cdd043e309677071ab1b65a4b18f422b
change-id: 20261009-jupiter-usb2-b888e544520a
prerequisite-change-id: 20260812-b4-spacemit-k1-usb2-97adfc283d58:v4
prerequisite-patch-id: ccc56cd7363a39566f74b3628fbe2ccf01c76774
prerequisite-patch-id: ee646b8712bc41793579b8abc30d8d3f616d36e7
prerequisite-patch-id: 793abd51f18ae96cc2cbcb447721ca9ae1e6fa49
prerequisite-patch-id: 67bf74a44fd81390c82c07921d808a58a5211fb7
prerequisite-patch-id: 801c65013a1e55dfdbf3d3b061752ddb972afb18
prerequisite-patch-id: 2321f949dcfb2609932da94cabc969812f11669f
prerequisite-patch-id: 0843cac1ae192e99f2562f5ac882dfc4f9a10637
prerequisite-patch-id: 7ce394f4284c628b7d6187d8ee555726c94675ad

Best regards,
-- 
Jennifer Berringer <jberring@redhat.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
