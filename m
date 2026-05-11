Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0BFCD4843
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 11:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FlGgSh5JWz7+602OSFetUP5tbNFudy3aaCBMGuKPLac=; b=3d3/hD4QQ4yKwV
	7SgoUA9eaE1Ne6Z1/RRmaXyePGfT18+6IKGNJOrUnJGFbZ8P4CzcRt8dmEjIXN/9XZmLzvYH/35rr
	zpBNHfY7P7Yj0lnUgq02wUG81gvE9qHF4UmWru7NRXZ2GMRrOhpk0tBS9iV3vaBJM450cq+tozQLK
	+bSoSKfUb4uOgs+3ISG1c5lQBdiU5oKkv2bHCyTnRaG5zpKfPR2t5IYVSHF1kIW2siIbUSBdaP9xN
	BuG3ACXdNfINMjEGrdt32D5vLr8uh3zCvmIicuTw1y++CkizJI6Pl3vNL8Cus7GX9o6Uk7IgUhzJr
	rX7E1XgBuodxO0uZArAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXn-0000000DExZ-1RUr;
	Mon, 11 May 2026 11:11:27 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMOXl-0000000DEt9-2YEH
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 11:11:26 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-488d2079582so44808695e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 04:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778497884; x=1779102684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/ImowRCcqssAiG38GcpnppUO6MMYNPjG1Lujw+hqMY=;
        b=k7fJCKbMJijQAuFGuOIs6k7ZE3sj6HN8fDq8tdejvGirDC+2efIzVP6oT7NASiIupC
         GVZ+ilhSgdj+CbC7YcBkcTLQocdcleMC+WyFrHVOaYtFrTl84JCGD+X7N1uuxUSWmnpY
         vniMP3gp00hNKcfCUmpyPMGoLmYIVF7BevYLT61VYQjrOudWZuKnlVruUWwJ37OS+CyF
         NreCY/eB9gloq2Eat8VcipQZ29BQnanrbGOEymhgpIFYrQMQyu7NlnnlnjbuNg2oi9iv
         FwVCyKYudQyvpe5K6fPgyXe9tcp/PjoELg/qu2qPFHqs+0kv6fA7QCKFd+83CAWaFRqS
         efSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778497884; x=1779102684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P/ImowRCcqssAiG38GcpnppUO6MMYNPjG1Lujw+hqMY=;
        b=mWnHyji7FSYocibkhcZaffbRGsnNVNLDUFxBOqiGLtFW3kHJ8d/3LftUDKwxxNPUPs
         sGwP9wpuS8pH1Egb4ZC4NRtOKNaKRxq4Pt2MqkyehabMCa2j/NJq3Xq8vE1zIXfFhVAm
         u2uBqJw2BRdpzkHCWl8rltuuOzKQEdv7jtDYSydoGxBwbdho7eC02Rt9DvS/WBvd8DUZ
         2nOFMi6QockFaFu11MxLYpIzm1wxkR6kFsWpJmvx9qThZ3BGkqcWDwXpTJVc2QQt5XMO
         O6y01fPuAl0tpGNDK5jBg3Flkn9pe+xZT83bScWNbO1ZhgcwF3tst2U4GdA1EDg1Ly6z
         UJLA==
X-Forwarded-Encrypted: i=1; AFNElJ8jI8bpVKLQshA3PVyqzkOFwN3vz5nfcHuCFhbBO+pRoDAtoNQZmzhyhbEm4ChJLWsid9Z9+f1k20/BIQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzrCimEtg+s/HJ5bMIOgIrv71Tyh1M9VaiD/ArXStD20A0L5FRh
	f+1Db1fNpuYKog8rn+ftQQhe8ojgkV7/RBVINx3saZjuY59x3tpJa7ms
X-Gm-Gg: Acq92OGWDsGsZd+d7g4NfJ/As55pD7qQHIdYEuIAOziKX1M8VJSZ4qtzsTEX+sj17dn
	k2rtFStEI2k8PtxAxNHTyEu4SdES8ENkI3epY3t+tKGXGbJUADtNyct1iuaZ5oPS41FW3roUx+i
	CjH/ORqmfcWaF8f0bxEEKhxhpPmzYMSCtOjI/CPnzqggbjmxWFkN12WXXjvcvJXBNYOH/QmsrUL
	8kLkJ4kLLPrUZlUEoOpzZsuugTMnPTCs0OGnoFd2ydcwhNaiA4nmRO8KOMqDpW7lSLLykQlsrqO
	RKJskGWrxyy/lR5RGc1iky9tXSiAjZ6mscFtz49GVRZow/Vetg9pkezae4aU8P0OTZoFulUNWk3
	hxNpwtADHJVI5vKTbusM+986Kzqa4H2jCLVS5Qzv2NJZO3GXFNakZifECMFj70MOOBdovfrE4vn
	A3J1RKkcA248vpszMsQKaLopfzzWySMqyTINvMlhn3Ft0UdMVqLTRwHblDIZn+waVnE+6/nP3Wa
	AHY
X-Received: by 2002:a05:600c:a305:b0:48a:5970:2005 with SMTP id 5b1f17b1804b1-48e51e08362mr251837475e9.2.1778497883359;
        Mon, 11 May 2026 04:11:23 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e701e9585sm175077375e9.5.2026.05.11.04.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 04:11:22 -0700 (PDT)
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
Subject: [PATCH v2 3/6] riscv: dts: spacemit: k1-musepi-pro: enable QSPI and add SPI NOR
Date: Mon, 11 May 2026 13:11:10 +0200
Message-ID: <20260511111116.1109643-4-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260511111116.1109643-1-a.heider@gmail.com>
References: <20260511111116.1109643-1-a.heider@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_041125_738719_20782B54 
X-CRM114-Status: UNSURE (   9.85  )
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

Add the QSPI controller node and describe the attached SPI NOR flash
(Winbond W25Q64FWSSAQ).

Add a corresponding vendor flash partition layout.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 43 ++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 79415d760f162..7ebace0e46edb 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -166,7 +166,7 @@ buck3_1v8: buck3 {
 				regulator-always-on;
 			};
 
-			buck4 {
+			buck4_3v3: buck4 {
 				regulator-min-microvolt = <500000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-ramp-delay = <5000>;
@@ -249,6 +249,47 @@ dldo7 {
 	};
 };
 
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
+		vcc-supply = <&buck4_3v3>; /* QSPI_VCC1833 */
+		m25p,fast-read;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			bootinfo@0 {
+				reg = <0x0 0x10000>;
+			};
+			private@10000 {
+				reg = <0x10000 0x10000>;
+			};
+			fsbl@20000 {
+				reg = <0x20000 0x40000>;
+			};
+			env@60000 {
+				reg = <0x60000 0x10000>;
+			};
+			opensbi@70000 {
+				reg = <0x70000 0x30000>;
+			};
+			uboot@a00000 {
+				reg = <0xa0000 0x760000>;
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
