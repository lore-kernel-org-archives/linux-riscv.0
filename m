Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 864A3CD4843
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 11:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DFoPaNNnHJ/r/FYWue1Icg/+WAf9qL0HsjOr5GgXCRo=; b=aphUUCQf3CJY5f
	zptxk0yGXXqA99fAVfpZ5N9hEPTdSBrJ9ww1NKrvQEbaw5Uxd0PNG9cO7sFaU9l4U/0MPRDD9k8Pt
	xnscfvDUGIOsqXi35+Hj0yTW2H/XvcpY+L6tssE6HzDyyxMpUNQIEL0NyzjamQQkmFreN9O5PWGBq
	QGNwClhixzwI06weueH7LdV8Ah6PagbkRCPv/N7DdaM0Md+C15O9kG2hLea8Vv07JPXgH3HWh+B2t
	ijy318tXvcC54dwUNn7zVIt7Q1iKbcGJeWqjVjCJjJX2mIcDG0B3jjpDjfuEgCx5x87vKFj02+bg5
	rBexw0MXt8u+ciZSmWWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXr-0000000DF4X-29GF;
	Mon, 11 May 2026 11:11:31 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXo-0000000DEwa-0eCO
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 11:11:29 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-48909558b3aso44485515e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 04:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778497886; x=1779102686; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=879kJdymdXBFu58jnCcAvuFoRWhDTaO96RlJIip9kww=;
        b=Gj8X4gy0xRx+eOSBys6b+rTp+f4IwanJY4MJjxIKAli5USwLtuYzzAR1Ff5vdK18fG
         ybjLGdRKK4BMleor9+z4/auXqMyRy2Sl3MuEH+Qlk9bP9R8srBNV3RSP5relBKuGWjCY
         QADvGFc2ep/Kj5gGJ1TYGzCHRwXvuaR2WT2RpBC9JfjmHeNFL/E2zC+DfKT5jf2ogH3S
         L3e0xUxz2R5QZ4gOtJcra7qgN+sKuM3IcolyRR6IZWAVpb5CHdcEmYcgbVfLY5SiJSjl
         e20aql8pVij4t9EgmQjUCZ+aSQJCY+D6szFoe5ml+smXsvPDHU44CWknuErfDLL3zew8
         LRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497886; x=1779102686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=879kJdymdXBFu58jnCcAvuFoRWhDTaO96RlJIip9kww=;
        b=ocuxT/0ICpr4o9O5HxgstEmMfnEibBY/wRYKxB9O9uPY3oQfh4mwQezjsHFqlkTFjT
         /Rshf20Wa9vq06EkO7WBAxWq+VFr5acNGi+HuD9LgXx0qnHMGBKfmVy1PBk0tkN5HVGD
         Dv5BIAK1zm4lsOJSNuBfpe5d9rOjZiF6iBonIAyVK0n0UxXPXAM7amFInkiub5unFPST
         +Ql25xn2b+mjhxKdo8Kgq7tHtYcMDaKvi8j71Y8sUqa7Irgzyle98dqbr8ROdSv9Bqpm
         GxaSfaPZ8NPG0B46ogq4kwscB+TkJS9Dvqc7so5qeeYG6XBF4hjbwXmvdTYrTNCTEoKv
         /Ttg==
X-Forwarded-Encrypted: i=1; AFNElJ9scu+1s2XO02kElgbtCyI2lbGsBGvjvXWs3Lcox0WLNjdEhYhiHmetsTFWGUUcSZAGl6pJTwO2u0Hq2g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyimbWtvxTlXp4LSDpBAQJbJp4Bfw2Lk19Nxm2c1VH1rjEOs4cw
	CcmVjJpyQ/2k+3kIMPXrstXBZFNaKPDO8oe2OqLzXzv0kdmQsmpimVFZ
X-Gm-Gg: Acq92OFE/HpIFaLkWO5OKlmjfRv/poc1N13eLUUFbdkW8WX0NrCL60s06Uu0qbjBgqP
	06wW0KvaXTscz5otN3oxCCb6l/s7Pp+Fu351xveR8c+Dp9I6I93NVPYuckw/VjxcCBtyZW02J/n
	JxA7DavaIoJRCFjr935YEEYw8VM8hr8VgHJV/0m3YM5BepvabYxE0rNqLeHfRRxXTqGWJ70P3PG
	bQdc88ziuf18TtWVF1FRYKehWhPVMLWmshKSaDpp2Dh01H6KSN3iWQKaGycSV8FDrs1EKVBbAJ7
	cVKiXt9e5LFXEXOLosQlvr5ZImnKFQGSOjRss4QgLbm/nuwbBHKHkf6V927gped0rQq0fkTI2oc
	MMP1K1Rp49iguTelXGGwYbnZ+lTt7XadUKpf5U0UI7YNVKKMY7/hWvq1eOfc0ZCh4SVm7fbmmUV
	b7kFnyuFPHNA8R4fUT9FgUOz0DQTyxF1mzKAaf6+0Sf6hXyw1zJk1wG6EzDxQ+fgNUFjk0b+8RE
	KeB
X-Received: by 2002:a05:600c:17d4:b0:488:c014:34da with SMTP id 5b1f17b1804b1-48e51f4cde9mr227432505e9.26.1778497886135;
        Mon, 11 May 2026 04:11:26 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e701e9585sm175077375e9.5.2026.05.11.04.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:11:25 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] riscv: dts: spacemit: k1-musepi-pro: enable PCIe ports
Date: Mon, 11 May 2026 13:11:12 +0200
Message-ID: <20260511111116.1109643-6-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511111116.1109643-1-a.heider@gmail.com>
References: <20260511111116.1109643-1-a.heider@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_041128_229858_8759C476 
X-CRM114-Status: UNSURE (   7.89  )
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

Enable the two PCIe controller along with and their associated PHYs. They
are routed to the M.2 M-key connector and to the PCIe slot.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 9c90c2817ecb7..2d3e30f0bd806 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -36,6 +36,24 @@ led1 {
 		};
 	};
 
+	pcie_vcc_3v3: regulator-pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIE_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		vin-supply = <&reg_usb_vbus>;
+	};
+
+	mpcie_vcc_3v3: regulator-mpcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "MPCIE_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		vin-supply = <&reg_usb_vbus>;
+	};
+
 	reg_usb_vbus: regulator-usb-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "USBVBUS";
@@ -275,6 +293,38 @@ dldo7 {
 	};
 };
 
+&pcie1_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_3_cfg>;
+	status = "okay";
+};
+
+&pcie1_port {
+	phys = <&pcie1_phy>;
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
+};
+
+&pcie1 {
+	vpcie3v3-supply = <&pcie_vcc_3v3>;
+	status = "okay";
+};
+
+&pcie2_phy {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_4_cfg>;
+	status = "okay";
+};
+
+&pcie2_port {
+	phys = <&pcie2_phy>;
+	vpcie3v3-supply = <&mpcie_vcc_3v3>;
+};
+
+&pcie2 {
+	vpcie3v3-supply = <&mpcie_vcc_3v3>;
+	status = "okay";
+};
+
 &qspi {
 	pinctrl-names = "default";
 	pinctrl-0 = <&qspi_cfg>;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
