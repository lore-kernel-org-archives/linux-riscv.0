Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 630C1CA0FF2
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Aug 2025 03:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NNnXwL5uPYTGqjSxJK/1vvdP1LylW7rsn2UO6gim5fY=; b=InC1gLxEsdOEWU
	DdiPd+wXawPha3y/i0LS/0gSDnd4bS9auNk0qVzkjnAcFStRgVKTBji5YoMmRNXxeKJcPkhXsGH+7
	U6yNqIFlTLYFP1jQVeG06rXxjIWg39Zv0eCdtJ19dKxn0zfyjcpH5SCd5V2HAS5cahLlnQapeqhqv
	Lp8EtMdcqGUOJxHLsazQojk5sPi/9NSRpaFKXDiVRas2hJKBQREUxvdrAO0FlRpBUQ6buCpCCxOIc
	KJObhotDhF0hXEvYNcQcL3w4oCAtgniIAqtqkDW5SkxY1xMinFqtybdT8dYlZf8fnh3jsV81QchAY
	lhhgOS8EIzefIuI6RD0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urTEg-0000000081X-1f0P;
	Thu, 28 Aug 2025 03:23:38 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urSDJ-0000000HaoC-3yUE
	for linux-riscv@lists.infradead.org;
	Thu, 28 Aug 2025 02:18:11 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-74381fbd6f3so145721a34.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Aug 2025 19:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756347489; x=1756952289; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lw9R9KQylny50IUlY0ox7tSDg7XfT5zo+Jx/4FOsYMk=;
        b=WDJHnPXUzDAiUwfVTSEhxFnmb4OHNgXonJkiuCG6cr8yk1UESidl255FupOA4l2hQC
         npaIgWQC9RcMPz/5zyJb04PekkeAjoM3Bmhkov56hjShynoPSaL+UhvG6xcBCi3FFUdg
         Kt7D+fWq/7zJXJ5UKh3/0JNMT7QK72Y1s6ejWUc/OMh28Rp2ZZFglaqkWAZvsMVGSVD7
         zi5/h7SHwd5yacxZycH26544L/8Zgy0kKyellNrNCcBdtaZXQY5vG59x3Zt19dnxIcB+
         MXwKMP2Hk6fzSbHTLlaPqIIXupkigTO9ksjjikxrBbZ8t0Q1gMZeVDwO0x8UbJhGleEK
         k6MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756347489; x=1756952289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lw9R9KQylny50IUlY0ox7tSDg7XfT5zo+Jx/4FOsYMk=;
        b=DWsN9GHd2EGI3o176C2NN+4KP3hm3T1rb/8jdTHJKnxCR/v0rf6bsmPgFFHa9K51Uy
         ay/ewgiNd40V6shSP5d8Dq0OQAC1+CEQOfhU0x1CzSkPeKFNXMJmM00DOmEB23glHYlP
         FpyjDahhanOPnsvAI8tdvf2NwwFkthFRJji+rlNIR9Td8vaMmByO4q/8n1MowdxyB/ow
         F/9IoXbDXrW/O1/HVqZSr8QDIJ2/qixKPM+AUdKBGEQPy+u3lG6dZqamk7ahEbSBc5fl
         69uZkAiFnvB1xD5OJ4GliLHWmVqzl5nh5fPFhHQZjkPh5J+4cxBsNvGdBtz+V05G5uDq
         vTsA==
X-Forwarded-Encrypted: i=1; AJvYcCV9OU+xKLxzLE4eLLB5jmyaIkDESUfmpkNP/q3ycvHQlRiQnUuOjISJXYUdzw4J/IuegGpwL6ebnQADUw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzt7RFzlR3bZ8ucJ7kzCZ0RFs4iwzXgURRUTrNmY47+35/9T7Ci
	jIunqK5z4S3g5loVuxZQ/+5AV7NHWhx4vWV+5cAr1qxy3VVLohkFsLEz
X-Gm-Gg: ASbGncuEr2ezbdmzgvSDPIsr5IeGzHxCYx3x3SvvPR5VnRTEE3p+Blck9tZ2UV88Qzz
	U0CUDFKCHnZJeywWKzAjfMf9wjhasIVf6lGiyh93jFgxQQkm5gACsBFGBPFkXHWxnqmfcMdrlWg
	W1ZcDmwg0LL3j/SJ118f/uxtGTZb1lKPteL41tOfxLA18GSW06VKw17vquLKs4lK5kZckpZCGxO
	Hz7t67ENproXm8iGrP3EoXnjfAWItaIoqoFw7Gu1vewc3FC16VyFUmTTpulk9H5ojdG60x6CoRD
	s3KIc5vqtiDowKzRt9crQmETpam6tfw1GR7oK5A9FhpSLNUUk76xfAdpzGdpjKEB+Txd5hsXP3h
	wTKXh8izCIGkcGBSbumy2J2nxTTP7yLdo
X-Google-Smtp-Source: AGHT+IGLh44dGgjMBAdZ8+L1YTxNe6vactvoL8NAqKvzlPhnz8iFt3JVHKV663JR1fRhVGA14N15DQ==
X-Received: by 2002:a05:6808:118d:b0:435:6cc4:9753 with SMTP id 5614622812f47-43785190f04mr9072791b6e.8.1756347489002;
        Wed, 27 Aug 2025 19:18:09 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-437967be68bsm2311340b6e.4.2025.08.27.19.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 19:18:08 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: kwilczynski@kernel.org,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	arnd@arndb.de,
	bwawrzyn@cisco.com,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	18255117159@163.com,
	inochiama@gmail.com,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	s-vadapalli@ti.com,
	tglx@linutronix.de,
	thomas.richard@bootlin.com,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	rabenda.cn@gmail.com,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH 4/5] riscv: sophgo: dts: add pcie controllers for SG2042
Date: Thu, 28 Aug 2025 10:18:00 +0800
Message-Id: <96df911a622547c6c987895fefde9110f3fcac03.1756344464.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1756344464.git.unicorn_wang@outlook.com>
References: <cover.1756344464.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_191810_000428_729972B2 
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

From: Chen Wang <unicorn_wang@outlook.com>

Add PCIe controller nodes in DTS for Sophgo SG2042.
Default they are disabled.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 arch/riscv/boot/dts/sophgo/sg2042.dtsi | 66 ++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index b3e4d3c18fdc..346aba5bd9bf 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -220,6 +220,72 @@ clkgen: clock-controller@7030012000 {
 			#clock-cells = <1>;
 		};
 
+		pcie_rc0: pcie@7060000000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x60000000  0x0 0x02000000>,
+			      <0x40 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			linux,pci-domain = <0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0  0xc0000000  0x40 0xc0000000  0x0 0x00400000>,
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
+		pcie_rc1: pcie@7062000000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x62000000  0x0 0x00800000>,
+			      <0x48 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			linux,pci-domain = <1>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0  0xc0800000  0x48 0xc0800000  0x0 0x00400000>,
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
+		pcie_rc2: pcie@7062800000 {
+			compatible = "sophgo,sg2042-pcie-host";
+			device_type = "pci";
+			reg = <0x70 0x62800000  0x0 0x00800000>,
+			      <0x4c 0x00000000  0x0 0x00001000>;
+			reg-names = "reg", "cfg";
+			linux,pci-domain = <2>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0  0xc0c00000  0x4c 0xc0c00000  0x0 0x00400000>,
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
