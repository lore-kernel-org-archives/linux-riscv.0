Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9C4C19F32
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 02:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RxF5GqwpBAO1WnrJE+l4WkNrlxTOwug9eRXTw3eSMEA=; b=fzyO5z1pQXyRhj
	hs69LoeGMf5uC97xGf0WtNSWiyuZ4p7YFcYRnkr/vY40jDYtst2HBkPQqEEzExohtaRZPTfRMveIt
	CAsVX8ps9spIm1uUk0ty6AmX4F3HDYac13yNNZ3Rhs0G3u+vu/znefD1RCfribyGueHEAyhIYLQpt
	lSqYjQ4bSML+0gjSd0AjHFsLgNi6B/wDq4fkXbh9gRbLwK6Ofh243ANdx8iOSbzXVt6IlOKu50Vta
	nr+0LfoUeTPl3RhjFcRxNtokWcjnwibrLV9yruFd5eBHF22Pc9g9uxBl1Dx1Sb1ZkfCop5Uw75lop
	JGIYIp/nRg9mj+zp6/ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnqPM-00000009WOW-0hUd;
	Fri, 28 Feb 2025 02:47:24 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnqPK-00000009WOA-1e4e
	for linux-riscv@lists.infradead.org;
	Fri, 28 Feb 2025 02:47:23 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2230c74c8b6so46533275ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Feb 2025 18:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740710841; x=1741315641; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HNAmch+SoEKe7ryjnsLMCAL7vRLjtwtIKcvaQelbSko=;
        b=Qhmd5OnciyUCyjeq6lPkAhvZiMZuHRfYR19Mn20EFSz3Qo5awWEDn8qNJZqPalG23l
         xO8IIVtLM9Af13gzZvb2TF2wN/MPXVAFVs82bhzo2DPh3YoOpe9m5ak8C/15DiKvvhTt
         1s27hAEnKPMK9UZYlniKV9TQasqhLO8YFNswyfQttClIZiwawliwzxadAmQafVElYogS
         jNvaqItYBA7S0nYUlZDNE954kUPt7rwsKlkqMoIAOeh66BQFN6v2xV6693vo9OXxDF+p
         tfjrZmO822hNzQqY82Vz3Ae0XxDUr9wybATG89oNb75R8BLVjJ/UqhMoRKDwGhiHiBEG
         NRnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740710841; x=1741315641;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HNAmch+SoEKe7ryjnsLMCAL7vRLjtwtIKcvaQelbSko=;
        b=J7g/GiF2bQC/uLaQFXmg6sr0nEzQImTndd5vkmWwH/mjo+f7f5gKj3K6CEQ8akMow/
         +Jytal2R5CVge+PkeeyEJFhUXcMI97zK3DwA2c2JD7a+i6ya7xyQF7UVvgvaxW+3ELn4
         K+HEWAQyNTJWU/LmgImH2H4p4Xn33v/qTEh0Z/D96LYA6TKOUkS4rBBanZO6UyuI7gRP
         gCmsYzJ2ultlh95FBbxRt0MrlMSz1AZe1ASzvMTw1z467Ywn22dQgM9QgllaIqBUoypZ
         1zDtchSeWO2Vuaxu9gFx8nC15W2pRUbVBtmpNqhyeggHpENakocoV/tlmp5aFIGjJHig
         RxNA==
X-Forwarded-Encrypted: i=1; AJvYcCV0uLDhDpd8YnhFGzVWJEbPYTRt4w7gUPDTJEdaYonR8F30Pn6tPciG62DS8ZYmDnnu4+BhAHZUn2nqfw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyov9DeMoOPECYvShsCMhpJYzsxrlx+6H1LGrV8lPMa8yes3pSN
	Rap87xUHlxtyV4zw/EBQYjk0fT+Mg95aL+Y7NIUj96FuhRjHB2vg
X-Gm-Gg: ASbGncssBNYa+ZTf0DLv1zggd485AbVEdHbXB03N6Xm40ODTnjAS4uqQIxgRrztVSUH
	5FN8Yz+jxUT4pdvTQsGdMa+ZuXHD2AZc3qSXxYLsZ1IdIMShf/XDxT+U0EjJ/5ORd5RVul5SWP6
	AdosYJ3JOs0qr2R4AI/DoJz7UK9BQGtFehGwPmliYESzANo8XyAWIz5RD6ZqsWiuZWKJ/l67HSC
	FFYf5ZDMksgx7Oj+d88OepxlbtrZDlOz43Ox0/De2wewlCoMAkKb2DCqp+gvR4M3FnDJ7H7/X70
	jsNX396nW5jY1bJ3K3K04GK6IRsDYfUtY7I=
X-Google-Smtp-Source: AGHT+IEkm2n2GFsLQr1/cGIFrqEljjG/OBWtdluCiNaPZ5/OZL835Q+L806wLrDE+32pkVJUZep79Q==
X-Received: by 2002:a05:6a00:1256:b0:732:5954:a815 with SMTP id d2e1a72fcca58-734ac4259d2mr2702592b3a.22.1740710840591;
        Thu, 27 Feb 2025 18:47:20 -0800 (PST)
Received: from [198.18.0.34] ([188.253.5.104])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe2a61fsm2563807b3a.8.2025.02.27.18.47.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 18:47:20 -0800 (PST)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Fri, 28 Feb 2025 10:47:07 +0800
Subject: [PATCH] riscv: dts: sophgo: sg2042: Add spi devices
MIME-Version: 1.0
Message-Id: <20250228-sfg-spi-v1-1-b989aed94911@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKojwWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIyML3eK0dN3igkzdVOM0o8TU5EQDy8QkJaDqgqLUtMwKsEnRsbW1AMq
 hYU1ZAAAA
X-Change-ID: 20250228-sfg-spi-e3f2aeca09ab
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740710836; l=1648;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=CadUsZNuHdq8T8eYzHT8bwyZSzEW5VSwjR7Y6+NTUvY=;
 b=ThU7hdNRi9sZfNgaOFMZLr51i5KJl828qHO66z6YVkz8nA0MlNWjIq98bdnG2Y163XYGVp50R
 7XQ6dEHZAXpARYhDxSXLMK1oHaau0Rj6nwJL94Yv8K6DF2jeJtyD+r4
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_184722_432262_D79EDEC4 
X-CRM114-Status: UNSURE (   7.17  )
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

Add spi devices for the sg2042 soc.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index 0fca16c469cc95aa897b6b57e0a287a687b4d251..d413daa47cf081f23284851db1eeceb3a157e9c0 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -800,5 +800,35 @@ flash@0 {
 				compatible = "jedec,spi-nor";
 			};
 		};
+
+		spi0: spi@7040004000 {
+			compatible = "snps,dw-apb-ssi";
+			#address-cells = <0x01>;
+			#size-cells = <0x00>;
+			reg = <0x70 0x40004000 0x00 0x1000>;
+			interrupt-parent = <&intc>;
+			interrupts = <110 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkgen GATE_CLK_APB_SPI>,
+					<&clkgen GATE_CLK_SYSDMA_AXI>;
+			clock-frequency = <250000000>;
+			resets = <&rstgen RST_SPI0>;
+			num-cs = <0x02>;
+			status = "okay";
+		};
+
+		spi1: spi@7040005000 {
+			compatible = "snps,dw-apb-ssi";
+			#address-cells = <0x01>;
+			#size-cells = <0x00>;
+			reg = <0x70 0x40005000 0x00 0x1000>;
+			interrupt-parent = <&intc>;
+			interrupts = <111 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clkgen GATE_CLK_APB_SPI>,
+					<&clkgen GATE_CLK_SYSDMA_AXI>;
+			clock-frequency = <250000000>;
+			resets = <&rstgen RST_SPI1>;
+			num-cs = <0x02>;
+			status = "okay";
+		};
 	};
 };

---
base-commit: 9ef5d3235d41a6f5230d3ddf5eb994483853b3e8
change-id: 20250228-sfg-spi-e3f2aeca09ab

Best regards,
-- 
Zixian Zeng <sycamoremoon376@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
