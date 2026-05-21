Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C866CD4F3D
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 14:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4a7PC+DSSvkOe/OshZd/VmDX7EwVcdyCryqgrpFSmLs=; b=jQ4zqvai38qiUa
	kMxygyCLHjCRkLiuLpBG8huAqptp+xiH9X2JpsueoqpT5oG8OCtU3foSUEqSar4ntfv4hBAvn1AfV
	nAwGpl2qGxvTGaz6f7dSrG0CqtmPX1j2FhsvdRcTH1c+gMyQLXoTDGKnXFTYh0gYhjxr8LEGekvul
	8MnfFq3OWk8yfBUPrdWj+048SSlc7f/AqMKxYE8bLXAG4u0s4G1S+qizs1wDbnBoBGt6FJruoHhn4
	4WEb6n0sCWvvj4Br/dyBdopDhoV1UwkJZ681zQluVMK5HcK4VUfGy3469WguEgwt+dcEHbBYYwZhS
	N82z1IM2Jm8asSGvmGzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4eL-000000087ei-48Gg;
	Thu, 21 May 2026 14:45:25 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4eJ-000000087du-2wVn
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 14:45:24 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2ba17c8cfacso59690245ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 21 May 2026 07:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779374723; x=1779979523; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvrZ9HyiEaruMBycCfFZW1FZ0Z1ilz+f20q7BDvb5rI=;
        b=G/TIePMowNe5nboyryBNENBtGb1Hk81s2RFva6M6I0REQuAhvrOl5XhuhG8DiBuHlc
         UIjUQTF4O18MsJwSZIqpLP3B0HQXVzGmE8LjkGPjajbLjRhwemMiJX+2TZzkFgWHdjlY
         hljXD3BSIlHeH4glr8/KCkZXQsyyq9u4oLPHa4llIkhV4Y2tIN05Tzq4YYn/6QaYJkHr
         ycDJy7I5fntcyQP9Xz9UACoo3om+OZ4NjXphni8Sglyrya9rQMAf3a25yt+Z+hpBprcp
         IUcfQ7QIYdaLCLgGOQqaX3Z5XMe6zp/wyW/66ERb/iPnsNTdJ7j5G95qp5OY+Lf0Jtfz
         qH0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374723; x=1779979523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fvrZ9HyiEaruMBycCfFZW1FZ0Z1ilz+f20q7BDvb5rI=;
        b=QCM2Gwo91NPVT+Ilrm43t4elwC+adp8HZbG++SBoVwKAIyB1AqUbwGph8dQAxDEA98
         yTlQoX1lkTlO3Y+Sig5SVHi5pk4K6nz3d2G6oeVMv2YhNMHexYRN9N/ZLdnbFvMM2Lmx
         xIGdJp/4XMrEtvA+Ibiazkc/PkQI/vFec7AMlsabvzKnRaEdgwO/eSbkbO4BbpKsqaVI
         4nx7b8zi0UBl/xYiI1xYIsChejJSME3RMI2uRXNGZ0geqyMngC1XaBc9wEFTKGNL9XbR
         +vAO/CJFH+qikJDB+9Wtd0nk7JAdSDjhv/CdYB4HfXmSgfH15ICUUFxWzZoudO7i54zx
         J6Iw==
X-Forwarded-Encrypted: i=1; AFNElJ9tv+8IpG5APvOP9n0xn9XfloUqWZzX1JO5qqO9Pk9sFSeFZrS1eKo7CU+Ys0qFp+Kt4IHLTPE/8IIC1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXXO3x172daR/MO1ts+CAa2gEC5CXpY11hyTPKrLnC6BOEv76c
	mO1/muShFZvW1LWLTRbaMCONYMyZ91C7xXUjWvnjGCZK7m9xfHl11KYc
X-Gm-Gg: Acq92OGYTlz+gBSTpYm55b4vJV+f893LkU6/ZOR9HVT7ZJgN31DJt7DtG5YbgltPnW2
	56qHp79JDMx+xB0Y1hPfRH71FAAjNpkgcI/AbPYWVjQBVXuhUvVTwWqns7jr9/h++/C2Q2PY7CP
	6i+waL18oNgM43fcc137wwH+cFYCJLRW31cOnhyoGiy0hqDXn7A0Bd5dtGj/usWBOuU3r9+XJ9b
	ZeSoMuq4QJR5rRhGB31mNDRRCGcrYgE5SiR/JBwuh0vjrebpUpHtH+3l2vVgs2zSJz4ivKhY1RC
	eWfBhq3ytYohUBZHqddSvCCvbx45ko/2OyZtnWGqKDaUrfzotB7IGFlZXS/RAsPsP9IZxrc7vCB
	Cj3u2ML4+XyaGiZj5k85YYdnopwG/a0lZBQ7mbg7318RFwfeGLWAISf4IPNgpL3IzCEcXefi6wI
	X0jvdRQ1b8XILWBasnTRjF7XkxViM72g==
X-Received: by 2002:a17:903:2301:b0:2b2:4029:d781 with SMTP id d9443c01a7336-2bea3379db6mr34408925ad.20.1779374722230;
        Thu, 21 May 2026 07:45:22 -0700 (PDT)
Received: from [10.240.146.115] ([2.27.148.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea990f667sm13261475ad.62.2026.05.21.07.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:45:21 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
Date: Thu, 21 May 2026 22:44:46 +0800
Subject: [PATCH v2 2/2] riscv: dts: spacemit: add QSPI support for K3
 Pico-ITX
MIME-Version: 1.0
Message-Id: <20260521-k3-pico-itx-qspi-v2-for-next-20260521-v2-2-52bce26e5fd8@gmail.com>
References: <20260521-k3-pico-itx-qspi-v2-for-next-20260521-v2-0-52bce26e5fd8@gmail.com>
In-Reply-To: <20260521-k3-pico-itx-qspi-v2-for-next-20260521-v2-0-52bce26e5fd8@gmail.com>
To: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Wei Fu <wefu@redhat.com>, Zhengyu He <hezhy472013@gmail.com>, 
 Cody Kang <cody.kang.hk@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3846; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=jeLdidJLllZzK2MXT62T70ecJUPwLSRHEx1l1dcK0nc=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqDxpyRg6BUTVWQauu6YPVthr2PheGUvA+y7vxf
 oC2HwfnutOJAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCag8acgAKCRDN9pw2gLgN
 2Gi6D/9lB6LxcH1junWH8uO8byFxvvzdHo5m/u4ozxCzl/DXFunPbljGCUF9YA6/u1FyRTGzsEg
 4RHFapdf+RPxloUAj8KtAVnFf2I9bnx58IVdfyXGGC9d7EYR85eMDNDkhK8CQquJVsAAxnzuOjr
 wVtpdY3CXXnHWAGMPGo4dl8GZWHlAYr7/qYiXWq4jmqnhtABaPFy0thDFGr9YobPEjQVZCVfW4j
 tWQTuhztPE39JItO3BUK5Aclje/0Nv6J6V5O+1YqqaGx4JJM7+v4f9FH9tQ+kcNwmodJPDfst4J
 j4EDvb2f4BFfegY9Th8Hl3Zib/hULtGxSaC/f6EaSbfPXyqVF3KQK+MeohhDfEGENLQI2kXZP2m
 go1f311JLGKo0LqPljr78SVcPiGkfbgIVDP++gh2yUo4J8/5KTz3GeMgdbmCqV2mDyRmd46FwUe
 to8pCyZpI0DDfJYZBTsKSymyA/G2ljsBFu/AS47wg8wmkhIxuhUEjScXaZel3+OKblSwQkRReOi
 FXatx0LNj8wqQ8yRT9NG1s/q8W0Bm+cdAAtWDMZhfNzcLZJtMxOfqkHveGA4dcq0f2IHXQHXAd8
 dki/lQLAugC0kcMsiKew3JD2HU/S9heCeoo99vngLvOzDtqtCT/Th5ez7jrkoH+DoZwDz99PRkK
 bHA9c/bHLCyQX4Q==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp;
 fpr=26CA97B1A229C229822278F254AF850165158959
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_074523_753618_9A343623 
X-CRM114-Status: GOOD (  11.44  )
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

Add K3 QSPI controller node into k3.dtsi, and add related pinmux
configuration.

Enable QSPI on Pico-ITX board, and describe the NOR flash which wires
to it.

Signed-off-by: Cody Kang <cody.kang.hk@outlook.com>
Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
---
Changes in v2:
- Add "spacemit,k1-qspi" fallback to the K3 QSPI compatible.
- Reordered Signed-off-by trailers.
---
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 58 ++++++++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi | 21 ++++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 17 ++++++++
 3 files changed, 96 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b89c1521e664..e90e17895bb2 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -200,6 +200,64 @@ phy0: phy@1 {
 	};
 };
 
+&pinctrl {
+	qspi-cfg {
+		qspi-pins {
+			power-source = <1800>;
+		};
+
+		qspi-cs0-pins {
+			power-source = <1800>;
+		};
+	};
+};
+
+&qspi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&qspi_cfg>;
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <26500000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
+		vcc-supply = <&aldo2>; /* PMIC_VCC1V8_QSPI */
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootinfo@0 {
+				reg = <0x0 0x20000>;
+			};
+
+			fsbl@20000 {
+				reg = <0x20000 0x80000>;
+			};
+
+			env@a0000 {
+				reg = <0xa0000 0x10000>;
+			};
+
+			esos@b0000 {
+				reg = <0xb0000 0x100000>;
+			};
+
+			opensbi@1b0000 {
+				reg = <0x1b0000 0x60000>;
+			};
+
+			uboot@210000 {
+				reg = <0x210000 0x5f0000>;
+			};
+		};
+	};
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_0_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
index 23899d3f308a..5d9763791180 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi
@@ -56,6 +56,27 @@ i2c8-pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	qspi_cfg: qspi-cfg {
+		qspi-pins {
+			pinmux = <K3_PADCONF(138, 0)>,	/* qspi dat0 */
+				 <K3_PADCONF(139, 0)>,	/* qspi dat1 */
+				 <K3_PADCONF(140, 0)>,	/* qspi dat2 */
+				 <K3_PADCONF(141, 0)>,	/* qspi dat3 */
+				 <K3_PADCONF(144, 0)>;	/* qspi clk */
+
+			bias-disable;
+			drive-strength = <25>;
+		};
+
+		qspi-cs0-pins {
+			pinmux = <K3_PADCONF(142, 0)>;	/* qspi cs0 */
+
+			bias-disable;
+			drive-strength = <25>;
+		};
+	};
+
 	/omit-if-no-ref/
 	uart0_0_cfg: uart0-0-cfg {
 		uart0-0-pins {
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index d4be8de8fc6c..63dc36f49871 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -878,6 +878,23 @@ pll: clock-controller@d4090000 {
 			#clock-cells = <1>;
 		};
 
+		qspi: spi@d420c000 {
+			compatible = "spacemit,k3-qspi",
+				     "spacemit,k1-qspi";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x0 0xd420c000 0x0 0x1000>,
+			      <0x0 0xb8000000 0x0 0xc00000>;
+			reg-names = "QuadSPI", "QuadSPI-memory";
+			clocks = <&syscon_apmu CLK_APMU_QSPI_BUS>,
+				 <&syscon_apmu CLK_APMU_QSPI>;
+			clock-names = "qspi_en", "qspi";
+			resets = <&syscon_apmu RESET_APMU_QSPI>,
+				 <&syscon_apmu RESET_APMU_QSPI_BUS>;
+			interrupts = <117 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
 		syscon_apmu: system-controller@d4282800 {
 			compatible = "spacemit,k3-syscon-apmu";
 			reg = <0x0 0xd4282800 0x0 0x400>;

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
