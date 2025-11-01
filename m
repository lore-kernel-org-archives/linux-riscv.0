Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D027CCF9FE
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Nov 2025 01:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1Qjqu0NHJNoY6nsqMgfDlD+jgs1r4wRy22rrI0Q8j4=; b=VJs7KfNB5aIq+P
	FgiZDTkS1FLcTFHV1M7Kk0amaLj+HsiYMGVGcELyHwK0ztmRG0xX7UpmP0VgE83oet3aTShgz9HAH
	9MtFm+VSUxEQSu4c6+wUFcz/GiocM0ylKw5RFwymXmVJBZerdXqunzYwdNfEGi/InZQqyldJpg7sH
	c0knOSwXOwF/ZlqUFx9Sehco2OTbzubS1JyqLkLNMeIBynOL9LeoV/CDkK3UP4tKP4rDW/gOn0OTJ
	OfhT1af0/cU3SAjyz5/VmCjsZR1WhLubZyFP0ZlSPsVxrRmDeTmMZW4pzsD8jSQfT1ANfswCETl9g
	oET4sSHz/LxxNVssSTdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF0fk-00000006yMh-1bFH;
	Sat, 01 Nov 2025 01:44:52 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF0fh-00000006yMC-40Z2
	for linux-riscv@lists.infradead.org;
	Sat, 01 Nov 2025 01:44:51 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-340bb1cb9ddso456217a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 31 Oct 2025 18:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761961489; x=1762566289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDm1+WSNoDjU3S+YxmjJ+3pKYEs3Q0EpdQk5O1Ku0Ho=;
        b=CTqgAYbobkrTbkjqR9YF3YvWXgcwNRpweF8hM73RdWuBsnarsuC4cfneBQhisT/XvK
         7rwpFrNpqhK4WYriYam+iOVWxTzUvXhBAtHQQnAev8MvTulZnQrWK5Rg7qBKluHmD4h3
         CLK9CyxZKgBPV7Oh4XBQm2jlX3/huseBiRBHkeaBbBe01+DTK3fokDvgD7/63OT2bKAE
         9gsrezeGeyw4Zbazihm7Hl7eXMX+1DQ3nqvtn4txN5SZQz0DffZZZd8JcofB39tqmmkc
         hXomvEoSKeQD8cjhYba76OunnIDaZCwYwL7khxokgvxLDGiZ6SytBBxWrCDY7XmygVuf
         EUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761961489; x=1762566289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDm1+WSNoDjU3S+YxmjJ+3pKYEs3Q0EpdQk5O1Ku0Ho=;
        b=em+MjePh13JtxZf4IrSv3IQtVvVaXmylQF313vPZjay4acFZoAkzjfdS9/x6AoDPdF
         A2TkVrQLI7x4UdGpIkXv+iC5HzhdYHrH+bftP5zrpY311u2SxwL2cMS3aMEprpdFb5JI
         lfCPSovyltFitpZ9pdumFcItmZmpk2ujrbVCHPB9QlTRIijLvGoqW4f/RCFtYt0ynGkU
         HFUpudh9E7SeWFH1UVZPF263f7/pXNpm/N6eLtUSyQCHqZ43zq+b2e2x64gdVW4UGE5r
         R3Pa1FMXGeqYx4J9Qphl0vMscKD0WP77F2hk0OrhO9VDI7KDAFd4xdWfPNTIctMLpCNG
         C0fg==
X-Forwarded-Encrypted: i=1; AJvYcCWWR+r0JTSDkIC/MoBVJsVprfllb9kJNSZY6yhxxzcLgF8ssvg6NuP9cv1PlLY9eM/fQTNJhujEG0IJlA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwP8gJ78AJRhBJNgZs81nXiXVm8JSZE1DxhFkB0LsIqtriN/swM
	caAdPDXl8WcpuE9n10FwE9a+ZFRXXoNp9X+fQ+DidOe30E3PmFuH4d4J
X-Gm-Gg: ASbGnctDiUg8J/cUqjUSZvAbe8oC7TNXwxgiFClJOrsUp8k/5rt8BmDMNHPePmifExY
	Jinr8WtQDgheJY3yqHTPlUQKkz8IAzu6bw3MPjbHUsaSoklvUfAoJoHt9H2c1hWuhR9AlQfBUxo
	P6Gcg8hIDtK+Vzr99j+jkxZCFRJG0PoFvLRlKgeV5Uqqnf8a9yoFhn+5cQGn3v13Zlqjo/Cj7ki
	HF5dIQ/Fyj1jhaVZDLzI2r9rgL65KydZe1Ijkt+od4FPr8r5pv78hVacNyMVgKeAdJYUzzOnNn0
	c/XCqSSNPWULHA+pe2bEhvcaByh4R/Tr6wPmwGbNPEnNq497lTJ8d8mazgZdapnqSiz2lwo4cOO
	B9qhbbxaYWIhI/Be5iumnkLuZ7CxnH1fOi6xD3rxgkdJkupCNQNr6GZyFc26uce9CrUIn6vbu9Q
	Lcs86EK81YtdpdTX8k5c/AKYfyPn4=
X-Google-Smtp-Source: AGHT+IHCcU4e+DqHPOrwiHTkTGTSDdoO4ULRyleIswiaTH0OibjXfdAmKn0F8G4yAJ3McQ4Uax/qcA==
X-Received: by 2002:a17:90b:510d:b0:340:c02c:d2b1 with SMTP id 98e67ed59e1d1-340c02ce1a2mr476048a91.1.1761961489084;
        Fri, 31 Oct 2025 18:44:49 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93bf078924sm3350585a12.32.2025.10.31.18.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 18:44:48 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 2/3] riscv: dts: sophgo: Add syscon node for cv18xx
Date: Sat,  1 Nov 2025 09:43:22 +0800
Message-ID: <20251101014329.18439-3-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251101014329.18439-1-looong.bin@gmail.com>
References: <20251101014329.18439-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_184449_998473_2D303784 
X-CRM114-Status: UNSURE (   8.42  )
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

Add top syscon node and all subdevice nodes for cv18xx series SoC.

Co-developed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Longbin Li <looong.bin@gmail.com>
Tested-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index ccdb45498653..42303acb2b39 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -25,6 +25,32 @@ soc {
 		#size-cells = <1>;
 		ranges;

+		syscon: syscon@3000000 {
+			compatible = "sophgo,cv1800b-top-syscon",
+				     "syscon", "simple-mfd";
+			reg = <0x03000000 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			usbphy: phy@48 {
+				compatible = "sophgo,cv1800b-usb2-phy";
+				reg = <0x48 0x4>;
+				#phy-cells = <0>;
+				clocks = <&clk CLK_USB_125M>,
+					 <&clk CLK_USB_33K>,
+					 <&clk CLK_USB_12M>;
+				clock-names = "app", "stb", "lpm";
+				resets = <&rst RST_COMBO_PHY0>;
+			};
+
+			dmamux: dma-router@154 {
+				compatible = "sophgo,cv1800b-dmamux";
+				reg = <0x154 0x8>, <0x298 0x4>;
+				#dma-cells = <2>;
+				dma-masters = <&dmac>;
+			};
+		};
+
 		rst: reset-controller@3003000 {
 			compatible = "sophgo,cv1800b-reset";
 			reg = <0x3003000 0x1000>;
--
2.51.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
