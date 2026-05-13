Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62FCDCD37B6
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 07:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xhSF6fpnY3DEqbJXiKfxlVgwU8cyBz1eNBKmiu22rcQ=; b=L+0G+a+i1vWvVy
	L+vF7cHR/ndlBaAh+Y8f8gXhVV0bk/p9BJ6IExVppRWndsB1O/IM0TBYA9XPTN/VFGZI6CeIR0Jsd
	UkgWTSnAfiMluZfMStXYYnSdQkzxEgScD/A1uZUmfQyIWz/ZVkR6bc5o2m6UFLTUax4l8BLunC9Qy
	MAi0HeUKn7qjkNTPKvzPhiziVTa3YwYu4ITlDiToWsFMVhJzfsiRpF/vbhzFh9EI69Zum4c7plhEr
	6XQsnDIp5Dz/uZF4I4gOBKHBDfED1j2TneNNrcrJGuv+1X7nTjMQFLRyaJUP9Y4rc4lSwRFeEXjwU
	5E+S8wh5ckYQgBjsG+gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3t6-00000001Xo7-0tdv;
	Wed, 13 May 2026 07:20:12 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN3t3-00000001Xln-45h4
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 07:20:11 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4891c0620bcso44617595e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 00:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778656808; x=1779261608; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EcUdyEbWXs5tGAlI10MYOWCFp7umYQk3zJkuC2ozfYg=;
        b=UplaWV59ecGqF3s02eBaugiOQwUDxWjnMHti4LdvFHj7uIM5F3L0+iNbQLZkZTcsqm
         TBH5/ae4tLoalVrzsPj+KCRmtOOm93mhP9JJ0fN2dhZtNPnc0BreV4EiCccIRocm6BnQ
         oSKvNXXj1/FI6Eq7xZ6nMCZyhiaoECvne/jkSgtWbPiXtRAe5yTCqRxdYvwCM5zRDeMn
         NY7OVuhGY99cIlQ+h90KcIWn9GGyDzH1DJd7CM6oEWiF0RsQ4hNU0u+SaB85DfXcVLDS
         irz+S8+gMf5XD3RcDt5EWwVTb3LlpmLSO8hQW9P4ekQ48jtYmyr/tn1PtqH4J0Lk3Hip
         Darw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778656808; x=1779261608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EcUdyEbWXs5tGAlI10MYOWCFp7umYQk3zJkuC2ozfYg=;
        b=pqFA6M7Aiynvn8oArd485J8YQ3gpUBz7H/pNiWT7JfZupcugqEYCxfO84AxxMc5NXU
         iGARuFpppiDHtsWgSj4YOjpPI44rnqvXr/9wenuTWyok+ARVfnWtS4rbSq8iI7veE5yn
         bZ3uBM3XFcthVdnF8GDnl2zgv5Fa3/mdR3RKNN4z58OFd+FuNwVSxP2Cos68Nmg9NZz5
         GdzN4pEV35dppSuHBbapxF2GvONQE91OBcVi7+3wSkDbgHX5CbT5O2AdSz/hlvI+xA+m
         VmT6AWAhiB5CRoORAOziW4lTrY5vjPyMtJfstLAsizCfiI6e+6H0NBL43uyeulAJ5StA
         Ukaw==
X-Forwarded-Encrypted: i=1; AFNElJ9bX8M1Iwa3dTVxlJhoZqBsL5nCIfTzhb4wHmuOpqG1IrxA3f3Su9qQ2wMOJiTrHXAEqqI4ptCgJ1fjyg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwsOlkqHiQGXTFam9OBXOqac9ljvtZ0h8B5OV1kfOp0ocL1UfMo
	iG5xMie/SqQUCDUvbgxyXvCR9x9bewB5lpyvv/U/lEng/Gb9gW9SG4AL
X-Gm-Gg: Acq92OEJ2+m2b62CRAFDcq6KUXsDaPhWfvO2p4ckygGW2zEeS/J9InJt2Uq3K9TTmqe
	TFFN1qR0z8KHsBmIuW0o7SkQrrNOfUUHZxXaBNB0jD1SAjxv2ynHWAGQRSm8CPc3apTcPslGw1D
	4KsZq3/Bh9n16td7sKVF8qSiVtityjMvCcWB7xl85K+KGfEaJqj8tmm4Srx1xZWsKyhK4jy4Yzl
	CnRJ14zCOpvec1RG+RFRA/9XO6VynUqT3x6yvRK3cG7tg8HoQFqOeJhVmw2lsGGRDsNx3VV6LBi
	J8f9zYoqpXk6AXQyoYh++WZqpH5AguPVO2NkG7pizYsJ5MzSrOl1bHvSRyiHVC8FLJ3ZPtnCkNV
	OaSLJ3bsPkG+DZ3GpEvvfsB84IHrVArxvYPP2FuEI01xuIdnMzYOkC8Xq+UtDKc25pqS3siRqwE
	rxw3gZ8GmXn9KSxvCAGbKG7Hb13J9WV/NuHRMKo+2Ac2YRH+jw4cAhapX9sbPdkEOBlQ==
X-Received: by 2002:a05:600c:8b55:b0:48e:51f8:eb39 with SMTP id 5b1f17b1804b1-48fc9a4b074mr29001935e9.28.1778656807922;
        Wed, 13 May 2026 00:20:07 -0700 (PDT)
Received: from mamamia.internal (a89-182-129-90.net-htp.de. [89.182.129.90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fc8d62422sm58498115e9.11.2026.05.13.00.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 00:20:07 -0700 (PDT)
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
Subject: [PATCH v3 5/6] riscv: dts: spacemit: k1-musepi-pro: enable PCIe ports
Date: Wed, 13 May 2026 09:19:53 +0200
Message-ID: <20260513071958.29574-6-a.heider@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260513071958.29574-1-a.heider@gmail.com>
References: <20260513071958.29574-1-a.heider@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_002010_066563_BBD66F20 
X-CRM114-Status: UNSURE (   8.20  )
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

Enable the two PCIe controllers along with their associated PHYs. They
are routed to the M.2 M-key connector and to the PCIe slot.

Signed-off-by: Andre Heider <a.heider@gmail.com>
---
 .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index b24b378b1b220..953c0ff6a0d34 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -36,6 +36,14 @@ led1 {
 		};
 	};
 
+	reg_pcie_vcc_3v3: regulator-pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "PCIE_VCC3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
 	reg_vcc_4v0: regulator-vcc-4v0 {
 		compatible = "regulator-fixed";
 		regulator-name = "VCC4V0";
@@ -272,6 +280,36 @@ dldo7 {
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
+	vpcie3v3-supply = <&reg_pcie_vcc_3v3>;
+};
+
+&pcie1 {
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
+	vpcie3v3-supply = <&reg_pcie_vcc_3v3>;
+};
+
+&pcie2 {
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
