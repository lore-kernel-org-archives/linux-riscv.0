Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7FACAC599
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 13:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7o5DPfRZGdhMn2wpII3g61yL7BICLYGzW15BBWvwAWs=; b=NzsRR/D3O57X3M
	EZxQsvRU3T7tpU5SjKYsY0gcqLBrCRonv8AKAaqzuZ5X5ubYO1Qx/qu2J/WJlOlzcPrDPHhwk4afV
	Xsej/c/EYj8FdEX2Unodrav25KC2kgcVtJ6dIQo1FM35tPw/CfrsG2dgaQJ+kGpuvLhJTeUfWKXKL
	ArkWJGISJT+mlztDcxzAkKAAwPCEGAWbQr9zaCYAWl325RHYYkiGeSxO9cX9IfAWa3gH033zF3QkD
	1K2dZv7dUhgBd+3aN/bND2ZAtylbcBJCkPVLyaNRv4GaWLQNZgqZm83BCJ/aRdM9x2sGrMsOw6d23
	GPoQ1OkXjm0MIOiqyvdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVeD-00000007v5O-0j7O;
	Tue, 16 Sep 2025 13:23:05 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVeA-00000007v3y-1AWX
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 13:23:04 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-77786498b5fso1939128b3a.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Sep 2025 06:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758028981; x=1758633781; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iaxG+kWIaesk2NKerDmk7jBSPRl4JInhM+mFO2hD1V8=;
        b=hjJOBmkwXm4ze+PNX6QThMavzcO1bj5aOaaBsbP1EMXRQO9lAnGL12cwgsZKT2Uk7u
         Q3b1ExxR0nFkKL/NPcSR3KvDZ7CSfg6OGfFDM5+cUb6uRqxYsyzX8bUUU2n70q9bX5QU
         yjYcTrX01ziv1l2nge6JSmk9nXH+lgVbUZvgbwYCgB3XEEITKFdgoptL0ZHkhX7TNW/4
         Uiu7jRrM/pmIdZhvTBCqqEAw8kaFEKOLJ6KHL9k0Nz0qWIH4lxwJNw97kvXz6fKTuUaK
         59rOlUE3Vp5OWcWbui9NVu/lSp3tIpRRyfY4NG3cEVz04qI7Gnqf2yQ8SgokTLCzKkKg
         XG7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758028981; x=1758633781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iaxG+kWIaesk2NKerDmk7jBSPRl4JInhM+mFO2hD1V8=;
        b=Yl/BLjycTqPZukDtVjQg+GSwq+duYJPhFpfrntihVagsbQujKiF6ZzD4wiCpPjliPx
         2Zofrv9fCeFYuFSyuqek9npwz9dLQMkdmj/1q+bd+Tbt+vU4PdtPlt1cR3YliZ8taGzo
         0OMEkqYDibQNUduAtvrMKpZUEWIkzNtpG6gTeLQexCr89wSIxJGogrbzlcTYOabYgBcT
         fUs2cLcdEC5sgnKrJbpuA27rwBA2+MRRG+MzGwzQfz8L2Sio4CxsefyFNNKPWx9yoBYV
         2TGSdR9gD2yzv5HnieUXm9A8eATUEz25JYnSzuTf2/iMzJJLC0JUrquM8gwSQPv6fGQ8
         jtzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbiVTMBz/upjN5ODOM4uiLMgENeEp9W+R4TSBe9tqebepSj5HyTH0z+jiOdzG+emfNgONqK1mP0sTd2g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwkdJm1vPzp8RamZmKC9J5oK/3xW4zLhhIuxWkjPMlr+rdNZAER
	yex4E9fTTD9gXi3SZAetZ8Yfv2wOgRDvdQxCpUEDa4em/txYQZiYZGEo
X-Gm-Gg: ASbGnct3il6yoBSpXWyqVl+7F1UUM3vL62VEpe0XVGO2iVev3/10wbGowWIpQzVQZnk
	b/v1pS/95lh3XXkJfUdxmzDj97VVmZGNxJJv2K89C0CR5gKy/pVkIAZ6+57NLDH693b0HZplIkL
	+TzhslhBfe2uAW13tQl2xf+BRZxYnUOQfb1lOs9kGsBZSDK18bbpwXC1Rk4pLfhqZCkmsGeINUj
	UbZoqdnLjBriysHZLUOkCh2IucOhc7FhECYu6kSrF9vnICnGiuEVeg8R79n8L1GEiObKXp5b84C
	yCSGBluJb50MBgUvdxN4NQSN4GLUQu8Em8zqqD65EZSa3DnviopIZfMPz59e6OOuCOOaIaiWsF0
	lx7CaZD+ZL4vbha49ppZm9WMr4WTBuA==
X-Google-Smtp-Source: AGHT+IEw/bghXBwSKJHoeHGCMNhxKW0ZFmnDf4/5yHXHLv5gzxmu71658fIQ+i33vla5FL014yEGZw==
X-Received: by 2002:a05:6a20:1590:b0:24d:38c:26bd with SMTP id adf61e73a8af0-2602c90c629mr22551051637.43.1758028981023;
        Tue, 16 Sep 2025 06:23:01 -0700 (PDT)
Received: from [127.0.0.1] ([101.76.241.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7761562f25dsm13277310b3a.74.2025.09.16.06.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 06:23:00 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Tue, 16 Sep 2025 21:22:50 +0800
Subject: [PATCH v2 1/4] riscv: dts: sophgo: Add SPI NOR node for SG2042
MIME-Version: 1.0
Message-Id: <20250916-sfg-spidts-v2-1-b5d9024fe1c8@gmail.com>
References: <20250916-sfg-spidts-v2-0-b5d9024fe1c8@gmail.com>
In-Reply-To: <20250916-sfg-spidts-v2-0-b5d9024fe1c8@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <rabenda.cn@gmail.com>, Longbin Li <looong.bin@gmail.com>, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758028972; l=1514;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=QybYOscoNwdDfY/Wes+QSL8OfKyE3/6HFcIoUfyJOiw=;
 b=IXC84u2TUyu2cXBaPXrIM5z07LJd32cnc4k6CDpgCHZCt5iMtHWKaI6Mk+GPruvXAfXbcJFiF
 midMpPuhWb2BBpYExx3tRvDl6IK8XaxHc0wkxLIk0qHUoA33y9iMqtw
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_062302_326608_5E5286F2 
X-CRM114-Status: UNSURE (   7.80  )
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

Add SPI NOR controller node for SG2042

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Tested-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index b3e4d3c18fdcf94c2294a56ed6ad866fc59a6adb..0f7d8a3743c35046ceec902902af2b8d3ec8e6bd 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -48,6 +48,30 @@ soc: soc {
 		interrupt-parent = <&intc>;
 		ranges;
 
+		spifmc0: spi@7000180000 {
+			compatible = "sophgo,sg2042-spifmc-nor";
+			reg = <0x70 0x00180000 0x0 0x1000000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clkgen GATE_CLK_AHB_SF>;
+			interrupt-parent = <&intc>;
+			interrupts = <108 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rstgen RST_SF0>;
+			status = "disabled";
+		};
+
+		spifmc1: spi@7002180000 {
+			compatible = "sophgo,sg2042-spifmc-nor";
+			reg = <0x70 0x02180000 0x0 0x1000000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clkgen GATE_CLK_AHB_SF>;
+			interrupt-parent = <&intc>;
+			interrupts = <109 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rstgen RST_SF1>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@7030005000 {
 			compatible = "snps,designware-i2c";
 			reg = <0x70 0x30005000 0x0 0x1000>;

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
