Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CE1CD4F3D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 07:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D90j//LxsXR+cPC2tcMM0O+XA1pYe82IBI3z6BH6ydc=; b=cKBJIsP6VqtPLs
	wMpE1/a0dUIW3hcizJpthUtqePeDgdLe0EDUJQZFogbwLy7d1gAy6xWZcfHyYCarMdpVt79sX+M2u
	RwovXts5ZOflfMoIIEj6jkaR19mllNMD+CgI6qCTIGkU4+5n4iuyPCBbK35fE9N0hCfQXuLxjImcj
	kCKLPllAVM1ckc9PVa/X+dS8AAuKFjxe9y4EqPWpWv4MCUd0RxHcsknWf3gGRLGY0uu31fbQAsl97
	yuHpdVnSf119kePPF3pbj4OtYh2mmSk8NLJ3PFs9NRrYEqcdoW3JyMwCOJ0bBPFrxVI6QpaRntlND
	YB63m7hLigdI85DRQmRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3t3-00000001XmQ-33ej;
	Wed, 13 May 2026 07:20:09 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3sy-00000001Xjv-3SXl
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 07:20:05 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48a7fe4f40bso73086505e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 00:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778656803; x=1779261603; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=krTwslWjVBfvmGfYM5PFKGSt7YkML+rC+mLvBW7WInU=;
        b=oMDb5DHDCUtZ1Q0WnnSYJj2BPLGU20rTZ6TGfKhtrVucIo0KY1qY3Kb5Br8Jz/onMx
         yYEPNjDFLLRgAEfRLbvrRKmppR4UVvC1CdCy0hXQRHjgbEHtjCQDvKec4gvn2nxUMfOF
         +2jkxeSGHDQ01YTI3TvlpHU13R3k3x9O6CzveTC1PWIkLvIQ2vEtUrScBq6GBY3Kx+Y2
         5EAp/ytL6P7ZOoHt3yGEg29SdE2i1zDhWEfrc1Rlif+BqHONapCYV7bv5ZX2tdddqwHe
         qtImg4vELLSB7YVsFLyC7nsG95VxKfjyLWpZUBE4xQzn6WJNuovjZ8YgGZNna4p6wEUf
         6qvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778656803; x=1779261603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=krTwslWjVBfvmGfYM5PFKGSt7YkML+rC+mLvBW7WInU=;
        b=ogK+o+OYSvupnHTPyUEPyxjzNRaDS5Lq6RA0kxA/xmK2FkaQkwnaLwy8nwJlnGxWbl
         eihGBpzspWNPYRhk034NCuTWZ94jLfVgG/TVs6GwbzzTbCCd3D3b5XaKD/XLIhYkpkzw
         vmA7fGk5TJYb3t1BgT68HmQ1qhNZ42XfDgnh/DArURIh1N3mzYl+QZsI0HP64E6rjbxS
         DYIk7P0soPfO3uHroHzdz2lgq4Lidw43Fy2XEEcqPFI+7no9nNv05/IQSmjydWgJL8rF
         5fGL73B9yf8oArTad2BH+JFzigDzin2UQnoI8Vyq+81zGr+gskqRbhmWaP+wgAL7RQsA
         fJzQ==
X-Forwarded-Encrypted: i=1; AFNElJ+MBkeGQZq4b4vA5jirOd+Qq7vktyhWnqtXv2ZZer9MG8HaRImqEEue1AJp/MMmYWS6ySlpD0PEFFUgJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyrSv5jYJftxQvcpemcMZtaYswlAoUG585J9xdFMd5ip8mcFkbC
	Lc/pr3DW+Kqnx5u5oZgJMGpYU7qBJrlWIG8Lbl4IDAy9aM1d77+1n1Fr
X-Gm-Gg: Acq92OEuI1Ukli67K6hFyYbSd94aA9zrFq+xS2x+XC0ZsoC2yL2k/lmsVQ31oiEP6ay
	G+2WeDY094gOd5nOXC2lKzZCF2jgqUZlzr4QL3TinQBkx6W9GQH8/5+Lcmb0PdGUXhtp/X+ltBq
	vBEUXXmtO3b+q8Le+wPnLLdf7tDC2s27iaLHGjObmoy6pRJ18iTkz7AKl3gviLtYPb+VVKK5AQX
	A05nW3kGtGjOdy7KbU98BEj/S7azUwyVfesU/nO6US91/w68GRsci9jLioAMs2TMeTKTwgmj9QX
	z45TVhHlYswnhWQXCyih+4b3BBB5rvOsZCfdDPYgDLKANUuo66zfAcxnCIexonfEcG0S9k4oDYK
	o1gTk3ZqMhR9JIBRcI20bF0MthX4zIhKm1v4RLAIfV3AxliL1jWihxzJhtCG3oxqpz/lcBD3wqN
	DMPMawBtvAsxZsUW+w+NwjJEFBETRWFJCa8/qUqvFkSrbBqCvYs81aF2ICifBm7QPFSg==
X-Received: by 2002:a05:600c:c0c7:b0:487:4eb:d125 with SMTP id 5b1f17b1804b1-48fce9aab22mr14680495e9.9.1778656802391;
        Wed, 13 May 2026 00:20:02 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d62422sm58498115e9.11.2026.05.13.00.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:20:01 -0700 (PDT)
From: Andre Heider <a.heider@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] riscv: dts: spacemit: k1-musepi-pro: add PMIC and power infrastructure
Date: Wed, 13 May 2026 09:19:49 +0200
Message-ID: <20260513071958.29574-2-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260513071958.29574-1-a.heider@gmail.com>
References: <20260513071958.29574-1-a.heider@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_002004_893789_E648C710 
X-CRM114-Status: UNSURE (   9.26  )
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

Enable i2c8 and add the connected SpacemiT P1 PMIC with its related regulators
for the board's power infrastructure and voltage regulation support.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 134 ++++++++++++++++++
 1 file changed, 134 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 29e333b670cf0..e0b585c50014b 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -17,6 +17,7 @@ / {
 	aliases {
 		ethernet0 = &eth0;
 		serial0 = &uart0;
+		i2c8 = &i2c8;
 	};
 
 	chosen {
@@ -33,6 +34,15 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	reg_vcc_4v0: regulator-vcc-4v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "VCC4V0";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
 };
 
 &emmc {
@@ -72,6 +82,130 @@ &pdma {
 	status = "okay";
 };
 
+&i2c8 {
+	pinctrl-0 = <&i2c8_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+		vin1-supply = <&reg_vcc_4v0>;
+		vin2-supply = <&reg_vcc_4v0>;
+		vin3-supply = <&reg_vcc_4v0>;
+		vin4-supply = <&reg_vcc_4v0>;
+		vin5-supply = <&reg_vcc_4v0>;
+		vin6-supply = <&reg_vcc_4v0>;
+		aldoin-supply = <&reg_vcc_4v0>;
+		dldoin1-supply = <&buck5>;
+		dldoin2-supply = <&buck5>;
+
+		regulators {
+			buck1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck3_1v8: buck3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck4_3v3: buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck5: buck5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			buck6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3450000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			aldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			aldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+			};
+
+			dldo2 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo3 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo5 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+
+			dldo6 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-always-on;
+			};
+
+			dldo7 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+			};
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
 	pinctrl-names = "default";
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
