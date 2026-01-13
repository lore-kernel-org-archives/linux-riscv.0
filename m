Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528C7CF45DF
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 02:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ENhY9vtwzVJimHCQ2n90RIGiQyF97bCk5Pkv7boPzz0=; b=eE/7M6r18tdkh0
	C9s4jND2dKoVYLfi0EB5dHJWE8Kpde+s/L7sBgxfWGwtQVuVr+GTtdmoAbqd+souAOTstAijHX9AG
	5JngGSxMd5W9x1t0tpo3/f0m6SX+EZacOUXaih+W8/dML+LvPd6ph6DLfWosaDHqaNblr93w4cC8Z
	ypWaG/gwGww9BJxZt5VzkyITs6oNUjuSunN/iw0X9ifwLaEcDq31UbaAwN/J+Rxg6AZwPQSwTgUER
	klt1LUg6wvclinRWVMkYUqkCRvq8O+r0+VCT60f8kXodqYWvyqLa9kQk09TAzsDhf+ULw2siqr6tE
	OYea/HEK+asilJs+GUVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfUML-00000006RnL-0SOK;
	Tue, 13 Jan 2026 02:42:17 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfUMJ-00000006Rmf-1mKB
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 02:42:16 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-2ae38f81be1so7482520eec.0
        for <linux-riscv@lists.infradead.org>; Mon, 12 Jan 2026 18:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768272134; x=1768876934; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ta0lLAJ+DUwOWY7C9ZVK7vK19fEvpHZQw6/OXGKH8sQ=;
        b=FFn45N8xvPWhO1KRzxZajOY9CLfodQLVdA1SKLIufd0Iq9Hv6TqcXAugXDmeM6D2iA
         tFrTZT5WpPACf9ORGxe0ZcDubrgGCVETue42DZ+FvFy/JDX82Gft4GdsMmGrYNZvrKQx
         2y+NfoLWogbu6Dxk15IUR9aGKpes9GhsKJff6/1v2izSBMQZMrty1XEoOVgdixQTTdes
         A1GnAMewPFCXPcQ5f4gYIFIFfu5ymxHV6Hv0z/qaM8JjN/b3QasDF3Dq/jxvJR0ZYDMf
         BukWpsfsSG0o8ioNbBXFE6n9dGn0idy7ujvAq+eKbO9AmJ8ZRwyIHFYJ5qT1OL+g9wRf
         Qf1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768272134; x=1768876934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ta0lLAJ+DUwOWY7C9ZVK7vK19fEvpHZQw6/OXGKH8sQ=;
        b=QIOrHl1hsA4+EEEsmUSLVi05LUeDBsDSh3HZe2Rvm1RzdjGgTjIBRvC6pUWyUAN8es
         DlIcayKdwSANgYq9jZknTufQFGof1Wnj9rwX2w5ajLR5m4SRrQSuDszO4OerPcLKAqpe
         0cxplwg2EdHITb+VZFHRRQ1w7TCTvebCKdxCyMMhFlNzDQ18dV0y7Zvzf50EOCgfx1Ui
         Bb19x0iLmQ3vmimvq51CnLw7Yll7WPozeislHC0/ukHnjlOkDwrX0mXLhttBqnpUxOBc
         fRcNdUrAFu5nA3WprvjBglQbSNIstZD0A/pUyrTrVOf3lneAWUtenQkIHQnjVc1A8rul
         RARg==
X-Forwarded-Encrypted: i=1; AJvYcCXLtx85XvYhHeqUcogEczzk+RSJfWtmg/TLz2OlFSdFyrxYq5oP6HqIX0C8o9mvGKbWJuxyZncDSbVi3w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw/E+9UUDleiRWCdf/P7wpOLe9A90QqOfG19yZExqm+Nt63X77
	WSkGcd08R8zMBt/6V3R94OB2VPv6OCQ8fOYOAAl5P/TslAjYuU4rsNLi
X-Gm-Gg: AY/fxX5Ho4KG0Cn00pVcVPaAEneiWd2t+1SmEwub0T/tVE01WLwAjdWI7038viUec+B
	FvZi/BwGtnrYUB1Te9QeGo40ndTG43EWHSSy5kCss3bbQ3+OgaMAbvu4aAMIr9PKlOjqv2Akyi2
	BVIYcX1M37Ltm2tMpBzTckbQ3N8UW6OQKqJq4Ql8UseAxzPoNumCRd/vFQ0+hpTbQhfLdJB9RZF
	wUCn1FaDEhWXndRpMLtI5iUkOqTxtR9D7/RTKRY0UEMIwLv/NIrHPfWviQIGVX244HdX1QVn9ld
	oIQBG/JQCV5jf1iPbCmo80GN0Yg/4SlS9V//r9L8nzooeDlg0X4s6ukPlx4p6wCy2W8r+spErcM
	S7qHP/z+aMl9B1Ra6qGP7BwkgqxUEM2NE4ovQp8Ta+4yMfkW9c7/s4ohV5f8L9bnBQtb6iS63B1
	IbQmHeIh2now==
X-Google-Smtp-Source: AGHT+IH4Km9ntJv/V5juZZRPb4CWcmWHAyBALsS6npHeTLuLmd+WrofVWrZd4uuaYzWfcyskRChBgQ==
X-Received: by 2002:a05:7022:43a0:b0:119:e569:f609 with SMTP id a92af1059eb24-121f8afbcfemr17090235c88.2.1768272134480;
        Mon, 12 Jan 2026 18:42:14 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f243ed62sm26993899c88.5.2026.01.12.18.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 18:42:14 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Zixian Zeng <sycamoremoon376@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 2/2] riscv: dts: sophgo: fix the node order of SG2042 peripheral
Date: Tue, 13 Jan 2026 10:38:27 +0800
Message-ID: <20260113023828.790136-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260113023828.790136-1-inochiama@gmail.com>
References: <20260113023828.790136-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_184215_464855_D15AB80F 
X-CRM114-Status: GOOD (  10.09  )
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

In sg2042.dtsi, some peripheral device node does not follow the
address order. Reorder them in ascending order by address.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 176 ++++++++++++-------------
 1 file changed, 88 insertions(+), 88 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index e6891f95d479..9fddf3f0b3b9 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -264,94 +264,6 @@ clkgen: clock-controller@7030012000 {
 			#clock-cells = <1>;
 		};
 
-		pcie_rc0: pcie@7060000000 {
-			compatible = "sophgo,sg2042-pcie-host";
-			device_type = "pci";
-			reg = <0x70 0x60000000  0x0 0x00800000>,
-			      <0x40 0x00000000  0x0 0x00001000>;
-			reg-names = "reg", "cfg";
-			linux,pci-domain = <0>;
-			#address-cells = <3>;
-			#size-cells = <2>;
-			ranges = <0x01000000 0x0  0x00000000  0x40 0xc0000000  0x0 0x00400000>,
-				 <0x42000000 0x0  0xd0000000  0x40 0xd0000000  0x0 0x10000000>,
-				 <0x02000000 0x0  0xe0000000  0x40 0xe0000000  0x0 0x20000000>,
-				 <0x43000000 0x42 0x00000000  0x42 0x00000000  0x2 0x00000000>,
-				 <0x03000000 0x41 0x00000000  0x41 0x00000000  0x1 0x00000000>;
-			bus-range = <0x0 0xff>;
-			vendor-id = <0x1f1c>;
-			device-id = <0x2042>;
-			cdns,no-bar-match-nbits = <48>;
-			msi-parent = <&msi>;
-			status = "disabled";
-		};
-
-		pcie_rc1: pcie@7060800000 {
-			compatible = "sophgo,sg2042-pcie-host";
-			device_type = "pci";
-			reg = <0x70 0x60800000  0x0 0x00800000>,
-			      <0x44 0x00000000  0x0 0x00001000>;
-			reg-names = "reg", "cfg";
-			linux,pci-domain = <1>;
-			#address-cells = <3>;
-			#size-cells = <2>;
-			ranges = <0x01000000 0x0  0x00000000  0x44 0xc0400000  0x0 0x00400000>,
-				 <0x42000000 0x0  0xd0000000  0x44 0xd0000000  0x0 0x10000000>,
-				 <0x02000000 0x0  0xe0000000  0x44 0xe0000000  0x0 0x20000000>,
-				 <0x43000000 0x46 0x00000000  0x46 0x00000000  0x2 0x00000000>,
-				 <0x03000000 0x45 0x00000000  0x45 0x00000000  0x1 0x00000000>;
-			bus-range = <0x0 0xff>;
-			vendor-id = <0x1f1c>;
-			device-id = <0x2042>;
-			cdns,no-bar-match-nbits = <48>;
-			msi-parent = <&msi>;
-			status = "disabled";
-		};
-
-		pcie_rc2: pcie@7062000000 {
-			compatible = "sophgo,sg2042-pcie-host";
-			device_type = "pci";
-			reg = <0x70 0x62000000  0x0 0x00800000>,
-			      <0x48 0x00000000  0x0 0x00001000>;
-			reg-names = "reg", "cfg";
-			linux,pci-domain = <2>;
-			#address-cells = <3>;
-			#size-cells = <2>;
-			ranges = <0x01000000 0x0  0x00000000  0x48 0xc0800000  0x0 0x00400000>,
-				 <0x42000000 0x0  0xd0000000  0x48 0xd0000000  0x0 0x10000000>,
-				 <0x02000000 0x0  0xe0000000  0x48 0xe0000000  0x0 0x20000000>,
-				 <0x03000000 0x49 0x00000000  0x49 0x00000000  0x1 0x00000000>,
-				 <0x43000000 0x4a 0x00000000  0x4a 0x00000000  0x2 0x00000000>;
-			bus-range = <0x0 0xff>;
-			vendor-id = <0x1f1c>;
-			device-id = <0x2042>;
-			cdns,no-bar-match-nbits = <48>;
-			msi-parent = <&msi>;
-			status = "disabled";
-		};
-
-		pcie_rc3: pcie@7062800000 {
-			compatible = "sophgo,sg2042-pcie-host";
-			device_type = "pci";
-			reg = <0x70 0x62800000  0x0 0x00800000>,
-			      <0x4c 0x00000000  0x0 0x00001000>;
-			reg-names = "reg", "cfg";
-			linux,pci-domain = <3>;
-			#address-cells = <3>;
-			#size-cells = <2>;
-			ranges = <0x01000000 0x0  0x00000000  0x4c 0xc0c00000  0x0 0x00400000>,
-				 <0x42000000 0x0  0xf8000000  0x4c 0xf8000000  0x0 0x04000000>,
-				 <0x02000000 0x0  0xfc000000  0x4c 0xfc000000  0x0 0x04000000>,
-				 <0x43000000 0x4e 0x00000000  0x4e 0x00000000  0x2 0x00000000>,
-				 <0x03000000 0x4d 0x00000000  0x4d 0x00000000  0x1 0x00000000>;
-			bus-range = <0x0 0xff>;
-			vendor-id = <0x1f1c>;
-			device-id = <0x2042>;
-			cdns,no-bar-match-nbits = <48>;
-			msi-parent = <&msi>;
-			status = "disabled";
-		};
-
 		rstgen: reset-controller@7030013000 {
 			compatible = "sophgo,sg2042-reset";
 			reg = <0x00000070 0x30013000 0x00000000 0x0000000c>;
@@ -486,5 +398,93 @@ sd: mmc@704002b000 {
 				      "timer";
 			status = "disabled";
 		};
+
+		pcie_rc0: pcie@7060000000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x60000000  0x0 0x00800000>,
+			      <0x40 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			linux,pci-domain = <0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0  0x00000000  0x40 0xc0000000  0x0 0x00400000>,
+				 <0x42000000 0x0  0xd0000000  0x40 0xd0000000  0x0 0x10000000>,
+				 <0x02000000 0x0  0xe0000000  0x40 0xe0000000  0x0 0x20000000>,
+				 <0x43000000 0x42 0x00000000  0x42 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x41 0x00000000  0x41 0x00000000  0x1 0x00000000>;
+			bus-range = <0x0 0xff>;
+			vendor-id = <0x1f1c>;
+			device-id = <0x2042>;
+			cdns,no-bar-match-nbits = <48>;
+			msi-parent = <&msi>;
+			status = "disabled";
+		};
+
+		pcie_rc1: pcie@7060800000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x60800000  0x0 0x00800000>,
+			      <0x44 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			linux,pci-domain = <1>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0  0x00000000  0x44 0xc0400000  0x0 0x00400000>,
+				 <0x42000000 0x0  0xd0000000  0x44 0xd0000000  0x0 0x10000000>,
+				 <0x02000000 0x0  0xe0000000  0x44 0xe0000000  0x0 0x20000000>,
+				 <0x43000000 0x46 0x00000000  0x46 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x45 0x00000000  0x45 0x00000000  0x1 0x00000000>;
+			bus-range = <0x0 0xff>;
+			vendor-id = <0x1f1c>;
+			device-id = <0x2042>;
+			cdns,no-bar-match-nbits = <48>;
+			msi-parent = <&msi>;
+			status = "disabled";
+		};
+
+		pcie_rc2: pcie@7062000000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x62000000  0x0 0x00800000>,
+			      <0x48 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			linux,pci-domain = <2>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0  0x00000000  0x48 0xc0800000  0x0 0x00400000>,
+				 <0x42000000 0x0  0xd0000000  0x48 0xd0000000  0x0 0x10000000>,
+				 <0x02000000 0x0  0xe0000000  0x48 0xe0000000  0x0 0x20000000>,
+				 <0x03000000 0x49 0x00000000  0x49 0x00000000  0x1 0x00000000>,
+				 <0x43000000 0x4a 0x00000000  0x4a 0x00000000  0x2 0x00000000>;
+			bus-range = <0x0 0xff>;
+			vendor-id = <0x1f1c>;
+			device-id = <0x2042>;
+			cdns,no-bar-match-nbits = <48>;
+			msi-parent = <&msi>;
+			status = "disabled";
+		};
+
+		pcie_rc3: pcie@7062800000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x62800000  0x0 0x00800000>,
+			      <0x4c 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			linux,pci-domain = <3>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0  0x00000000  0x4c 0xc0c00000  0x0 0x00400000>,
+				 <0x42000000 0x0  0xf8000000  0x4c 0xf8000000  0x0 0x04000000>,
+				 <0x02000000 0x0  0xfc000000  0x4c 0xfc000000  0x0 0x04000000>,
+				 <0x43000000 0x4e 0x00000000  0x4e 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x4d 0x00000000  0x4d 0x00000000  0x1 0x00000000>;
+			bus-range = <0x0 0xff>;
+			vendor-id = <0x1f1c>;
+			device-id = <0x2042>;
+			cdns,no-bar-match-nbits = <48>;
+			msi-parent = <&msi>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
