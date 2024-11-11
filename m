Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D6AD12D72
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 06:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MRKx8U49k9LTd+oQLjAC0hX9UfTc4Kimlmhv4zDqo8U=; b=GpCsI0L/8BdT06
	1tA1Veu1K8vxsyrJoZht73fflXyRnhs5XIez6SzKIAxE/KZ4Yctzyo+dflXhHw9Ffd17qjk5OziDM
	zequjdDFFOuqLKDGkvn8pQDoWXZB9XdtTpc3KD4IrmIyN7q96x3xrS/MqmHtC4aMJjKknsi5W0yTB
	V6mghWJQI3DvQtLTeZT+vEv+bYmhyOk0+Ht+nhfQVyy9JChEmDP6zMNGUc8LhNuN5ExPXzZ5mjRj9
	wlmKZfEN+PKOzxOVNhqkPnwUNrcSKsKaOK+VURlf3GwqJqkMKUekZ+C6U6kjr/m3AqcEminyI1gcd
	BiZXaW1p+HJvHBSkRdrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tANTj-0000000GRJK-2MqY;
	Mon, 11 Nov 2024 06:00:47 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tANTh-0000000GRIV-1g1O
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 06:00:46 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3e602994635so2575889b6e.0
        for <linux-riscv@lists.infradead.org>; Sun, 10 Nov 2024 22:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731304844; x=1731909644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0rmRpGSKuaRk3Cztraml8ttOGifpWQdN9oAXrvgVN5A=;
        b=hIawkwgkRk32l3bjzRdrvgtf3zy3t/8GqrNyd9ZqlqtvQRNgBLYSuTjW0hOs3hXAdF
         ljx27UNYKwy/lwJDQxSoTFNsYyEgi+dwkTumdBPcodfVwstrF9MwHXC4s1AMQUTs2+C9
         wepVdLOqcUtgNSmKfvmN5Jy15e0hf1l5Bc6LikXthaorxnXranESBmDyflBM4ARKsoUW
         IsDtHHFJZpttoTN/iT5SUQYeosu0dVbfLxdqcjQNFqbwuAFIam7mZK4wB1VyFksZELpI
         CwoP0H/8pWCi7hWLK5HT5273mtriwh2JMdhpjo2aSZ/s7XolBOtSnI1lCdB8Cnv8HZ6C
         pBWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731304844; x=1731909644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0rmRpGSKuaRk3Cztraml8ttOGifpWQdN9oAXrvgVN5A=;
        b=tdmU2vYNuitdVf4CirQrfACM3wL2ZfUeJdG44IDVSvG4t3ZWAVd67w/JLEiytq7GvC
         SFeLIPKsz26uAsiM2kSR+Ptp491XZ9HZXAE1j/7bd8TN2xrBl+19dbIipnErTXsYNx5F
         PB8Qt2Is7bgDge2rq93P5sFitNznqhdM7WFzGuElqZgFdnJ8sg4y+7Xt+DEadsHMU12S
         yVDucTFxluPO8VXpCmuBZikSpl8zroH1s1bpEcvC2yJoeHMfMnpRpHCwRWEzAzTIuAdw
         YwLk1VLYlofw79gZseUTklHrFo2ycIhl7KOJOOPsfduX3HZMaMDV4OXFiGT7VLl6Sp+b
         qSrg==
X-Forwarded-Encrypted: i=1; AJvYcCWqae+5OaaauQdX0mHkW6uMnTM1N1CaXbjBcU3sWNmP1hJkEnEAw5BOoGEvWlo+YydBY7bjjNDUZmcXnA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyF3MyRgu3e45HdD15j8xeP9fkbA85gHSDBEpt58qRI70LIXhKg
	pbPSxnH5Cxw9SDQkJUx9MUfaBN8GX5E+X4iBo4o8l2q271a+7A6+
X-Google-Smtp-Source: AGHT+IEkrA8U43EbLL8PtUg0l0K7tH8rQnspDeNnyVtzBYeMx8cJznQw5STblElKQlJzO9mLz8DLLw==
X-Received: by 2002:a05:6808:1825:b0:3e6:63bb:ed4e with SMTP id 5614622812f47-3e7946c80b4mr8480393b6e.27.1731304844207;
        Sun, 10 Nov 2024 22:00:44 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3e78cd4ce88sm1976673b6e.44.2024.11.10.22.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 22:00:43 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: kw@linux.com,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	lee@kernel.org,
	lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pbrobinson@gmail.com,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH 4/5] riscv: sophgo: dts: add pcie controllers for SG2042
Date: Mon, 11 Nov 2024 14:00:34 +0800
Message-Id: <c8d05d3a4cf620ec4fcbf1050dea7c77f834c87a.1731303328.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1731303328.git.unicorn_wang@outlook.com>
References: <cover.1731303328.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_220045_473280_413865D4 
X-CRM114-Status: UNSURE (   7.97  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add PCIe controller nodes in DTS for Sophgo SG2042.
Default they are disabled.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 82 ++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index e62ac51ac55a..dca51fa9381b 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -195,6 +195,88 @@ clkgen: clock-controller@7030012000 {
 			#clock-cells = <1>;
 		};
 
+		pcie_rc0: pcie@7060000000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x60000000  0x0 0x02000000>,
+			      <0x40 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0  0xc0000000  0x40 0xc0000000  0x0 0x00400000>,
+				 <0x42000000 0x0  0xd0000000  0x40 0xd0000000  0x0 0x10000000>,
+				 <0x02000000 0x0  0xe0000000  0x40 0xe0000000  0x0 0x20000000>,
+				 <0x43000000 0x42 0x00000000  0x42 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x41 0x00000000  0x41 0x00000000  0x1 0x00000000>;
+			bus-range = <0x0 0x3f>;
+			vendor-id = <0x1f1c>;
+			device-id = <0x2042>;
+			cdns,no-bar-match-nbits = <48>;
+			sophgo,link-id = <0>;
+			sophgo,syscon-pcie-ctrl = <&cdns_pcie0_ctrl>;
+			interrupt-parent = <&msi>;
+			status = "disabled";
+		};
+
+		cdns_pcie0_ctrl: syscon@7061800000 {
+			compatible = "sophgo,sg2042-pcie-ctrl", "syscon";
+			reg = <0x70 0x61800000 0x0 0x800000>;
+		};
+
+		pcie_rc1: pcie@7062000000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x62000000  0x0 0x00800000>,
+			      <0x48 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0  0xc0800000  0x48 0xc0800000  0x0 0x00400000>,
+				 <0x42000000 0x0  0xd0000000  0x48 0xd0000000  0x0 0x10000000>,
+				 <0x02000000 0x0  0xe0000000  0x48 0xe0000000  0x0 0x20000000>,
+				 <0x03000000 0x49 0x00000000  0x49 0x00000000  0x1 0x00000000>,
+				 <0x43000000 0x4a 0x00000000  0x4a 0x00000000  0x2 0x00000000>;
+			bus-range = <0x80 0xbf>;
+			vendor-id = <0x1f1c>;
+			device-id = <0x2042>;
+			cdns,no-bar-match-nbits = <48>;
+			sophgo,link-id = <0>;
+			sophgo,syscon-pcie-ctrl = <&cdns_pcie1_ctrl>;
+			sophgo,internal-msi;
+			interrupt-parent = <&intc>;
+			interrupts = <123 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi";
+			status = "disabled";
+		};
+
+		pcie_rc2: pcie@7062800000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x62800000  0x0 0x00800000>,
+			      <0x4c 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0  0xc0c00000  0x4c 0xc0c00000  0x0 0x00400000>,
+				 <0x42000000 0x0  0xf8000000  0x4c 0xf8000000  0x0 0x04000000>,
+				 <0x02000000 0x0  0xfc000000  0x4c 0xfc000000  0x0 0x04000000>,
+				 <0x43000000 0x4e 0x00000000  0x4e 0x00000000  0x2 0x00000000>,
+				 <0x03000000 0x4d 0x00000000  0x4d 0x00000000  0x1 0x00000000>;
+			bus-range = <0xc0 0xff>;
+			vendor-id = <0x1f1c>;
+			device-id = <0x2042>;
+			cdns,no-bar-match-nbits = <48>;
+			sophgo,link-id = <1>;
+			sophgo,syscon-pcie-ctrl = <&cdns_pcie1_ctrl>;
+			interrupt-parent = <&msi>;
+			status = "disabled";
+		};
+
+		cdns_pcie1_ctrl: syscon@7063800000 {
+			compatible = "sophgo,sg2042-pcie-ctrl", "syscon";
+			reg = <0x70 0x63800000 0x0 0x800000>;
+		};
+
 		clint_mswi: interrupt-controller@7094000000 {
 			compatible = "sophgo,sg2042-aclint-mswi", "thead,c900-aclint-mswi";
 			reg = <0x00000070 0x94000000 0x00000000 0x00004000>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
