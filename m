Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E06C3601E
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 06:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uqHla//mpzjdVZOrth7d6FLipt9IO2Bi1jcX+U/9Q84=; b=1mCbBiDRzWyn+x
	c8MResdRRbLlQz+qr4czOCK2Wyec4MszTsiipxg8UgBwpnsm4g2q+M9FIR9OFZm7Rsz0z6gSBJteB
	OTvB3BA/VVdfvg1gfjVHptMG8OKSRJEnvyoXelrmxHrZpucPj+3eZz5NkEg1oQiT3si9LqqYvkC62
	fYNeSk4Okk51JZ+iDUwfUawzminQu0Ql8FRwFuk0VWz6cwGE+U03juXEaP4lZSvcSSyH2nbaVfFQx
	cisb/yPu5066LSNkw3K8iKy4If6dUE5SD2lZLeYvtuLZDzSqfQ7XIBmnLSsrIHR+lJMQRgt5NWP3G
	B/h4cgVodtu3NiJwKBTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1g5a-0000000GaXT-2E4K;
	Mon, 07 Apr 2025 06:36:10 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1g4v-0000000GaNx-2IQW
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 06:35:30 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3015001f862so2667398a91.3
        for <linux-riscv@lists.infradead.org>; Sun, 06 Apr 2025 23:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744007729; x=1744612529; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYhIc8nI7TQrbMQ5ehdUi9XRR8BUa9kFTApEz1i6px8=;
        b=E7QFmC3U7wUBV5tSpFLzAOtFhGL4E6MysvSOPdJ7x2yN1Ygg2mVMM4SHwBVTySEXiE
         nsL7pxn8aQYrf1UgyrhDzmu533ZsgoJpEQ7DRvMLojSiZbhZ5n3PzmNQhou3kDvi1318
         xwL+SGAYGeeJn2r2MFRAlsYgODQEH6+iU8Vgfm7N263cNqZqg82hin1oScS8djxVbNG6
         f0BAqvHkdy2cM9NUdzIvj0gKO4o7Y6U3jTGddA0e07JjqSJZTuYrtK0bG5HBr3i2ocCK
         I2VIJnxr9dJSLFxRB5xlMTeMLxLT2OKZBebssKmETRRs5V4Y4Rpdirn15pTNkk0O3Hvs
         iT6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744007729; x=1744612529;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYhIc8nI7TQrbMQ5ehdUi9XRR8BUa9kFTApEz1i6px8=;
        b=JpVXOHohGvVy2/k/WLSF6AC1M7H2krhW6W6Rg0d0cqR0KmBt6Q5o8JqwbIVLz6uywq
         YRVmyjGPk0VG+lWvQoQtiHFV5G5dw86UbLZxaERUYyjvyfpLgOijE+ypeOV00Ab8jtlj
         bmstLFgfkJPhBRk8jlE3ifdUXnl04rrzYdlnXicn1oYTzSXS3mlA3jMYBYJhNyZhDiLL
         fUuTxi1b31ZA095xGQY4fM31jMqmLIKLZ/pYxNMbA5KLCATP1edpz7AU+zAsimQT+k9L
         jc/58S+hAunL0x4pgxtszPKGZdkFxPwvfYOLcIf4ohddMg6N5yr/9RMrwU5c80Im1gO5
         DRog==
X-Forwarded-Encrypted: i=1; AJvYcCWJZYOzcAOMsgT/Gpn5i/QUhk2f11Qy0ccDCLX28w5ld6KHZMK8tVXyHhlE1IU1xECTD8WTcKgak22oUQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd7X3FC0Xux2dYjpQimnVC1zx0EizTxQdWi5OyVBhS63cje4sB
	wq+mheSLZ3txoeRNpVpAvOlSrG8iSRi8LQscbBWHAyvNZdUCnOVw
X-Gm-Gg: ASbGncvGr1v9NwQNoe2XnTPr/rqtTwjo8e508kYXETFccq8Co+C5cJ9D72PHkZxy/45
	v21lvtCfusRX6tiLjKWfgSRtSJwKhR25LkVWJh5pejjNP0v7czCEd4MruxUJcT6P0vU+WjqGQRV
	1jDrCtQ+lNMzSMhqBynLD2+KtDhORIbNfkcy2RMO+CAsW23IuKbW7a/rRRVUfhz3PiAd+x3J7qf
	1Bu1aqi7ylVhZyPiH/knUrvtH0qxpzqaE6Vx3kPeYPn90eanlSjJj+i+lCViAVH0A5QmftMpC0v
	QGTcHmOPdnbollXo3ijJ3L553iUCvX4R60TD
X-Google-Smtp-Source: AGHT+IEOZv/5BU5DtfI0kqmCTpjbskhnz9UwTHMxtKxMAXxrUs6NBY985DM+w/yiSsTGLeLjCsEYhA==
X-Received: by 2002:a17:90a:d606:b0:2ee:c6c8:d89f with SMTP id 98e67ed59e1d1-306af71d944mr11933303a91.14.1744007728522;
        Sun, 06 Apr 2025 23:35:28 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::610c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305983da691sm8048044a91.47.2025.04.06.23.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 23:35:28 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Mon, 07 Apr 2025 14:35:13 +0800
Subject: [PATCH v4 2/2] riscv: sophgo: dts: Add spi controller for SG2042
MIME-Version: 1.0
Message-Id: <20250407-sfg-spi-v4-2-30ac949a1e35@gmail.com>
References: <20250407-sfg-spi-v4-0-30ac949a1e35@gmail.com>
In-Reply-To: <20250407-sfg-spi-v4-0-30ac949a1e35@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Mark Brown <broonie@kernel.org>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 sophgo@lists.linux.dev, chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, 
 dlan@gentoo.org, Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744007714; l=1524;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=bsOb61YGYomuONd3drp4jb88EZWek6I8D8vdw/YFqjA=;
 b=NJH8TpWiMW4r06WrPW4gxUE+TCU5HZSZXBlR3ljOxPFklJJaLgR52pUKwZe9T4LAOIjOMf7QK
 kowq5MZbB3oC1jnWhE+PHAwndhoVtcWtlfI6l6C42zbkuA6xE66e3bw
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_233529_588036_3FF49429 
X-CRM114-Status: UNSURE (   8.21  )
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

Add spi controllers for SG2042.

SG2042 uses the upstreamed Synopsys DW SPI IP.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index aa8b7fcc125d71eec12b09493964d90f5dfed27c..ddde4c613c4734db191de500b016b322a9602efc 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -537,6 +537,32 @@ uart0: serial@7040000000 {
 			status = "disabled";
 		};
 
+		spi0: spi@7040004000 {
+			compatible = "sophgo,sg2042-spi", "snps,dw-apb-ssi";
+			reg = <0x70 0x40004000 0x00 0x1000>;
+			clocks = <&clkgen GATE_CLK_APB_SPI>;
+			interrupt-parent = <&intc>;
+			interrupts = <110 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			num-cs = <2>;
+			resets = <&rstgen RST_SPI0>;
+			status = "disabled";
+		};
+
+		spi1: spi@7040005000 {
+			compatible = "sophgo,sg2042-spi", "snps,dw-apb-ssi";
+			reg = <0x70 0x40005000 0x00 0x1000>;
+			clocks = <&clkgen GATE_CLK_APB_SPI>;
+			interrupt-parent = <&intc>;
+			interrupts = <111 IRQ_TYPE_LEVEL_HIGH>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			num-cs = <2>;
+			resets = <&rstgen RST_SPI1>;
+			status = "disabled";
+		};
+
 		emmc: mmc@704002a000 {
 			compatible = "sophgo,sg2042-dwcmshc";
 			reg = <0x70 0x4002a000 0x0 0x1000>;

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
