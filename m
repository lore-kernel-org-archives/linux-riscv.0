Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC570C83013
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 14:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GLnYd2l0SYd5PEBSyxG1BCWfIaWCYwvx90rgFUEeVLM=; b=uS8+FbVEd5gaC+
	CZCXxy3McNP11xM0eLXlVtiiUwts4bcHwVydzYOROYr2Z65Hqui7r0iLjurIf724i3GcIJ6vmXxNp
	qF9g5kwXJOnOtmrlTKzqZlbYQquerHSQsvOE/cik4qlcjYedfa4kCeKg6Wg9hHi4iHN1HFi601Gjx
	trENuG4LOqRbXshBqnLAi5fhjJInt7VLU2pf86z7mtjOggkI+sCmt82CjRm6Ywzlvicw4Prb8QtlH
	MUetawM1JWyFlqGfra+wMkzkTL/TuZgZkhFbiEVKdoWilILbp45tDFFa4qq00z1YKOQ3KyFFMUvId
	HuBqrW2Ukng1PBlXrrZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVAWJ-0000000Eygq-3iBW;
	Fri, 27 Jun 2025 14:57:39 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV9z9-0000000EtyK-301b
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 14:23:24 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7d094ef02e5so365141785a.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Jun 2025 07:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751034203; x=1751639003; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=Hl1n+giRXKg3IOFTBLMCn57ZVd/TxGjbXc4BhDsPNXJqvqdbeszc9fExx92sritS2A
         Gl217/McAFvRDOtEw/204MbUbOKxAnUGg9twan2isY8M5f07N8s7wfo1wiv2l2S57/Aa
         jpmB7VGUQvQCxWTzN6x4SUCosyLweZ1hZt40oFS5UVFFw4zFLbA0ftVT6Ffpmnv9Y3uN
         6C9fPjubpa+wo7wSdlmVLHXsh+viOTsYk3UIT4eSml2LR1lGuvlIpBGZOLWvVY80lw8e
         G2EsaRWhITCBQGVhd1IT+UvoV/CeA8rJ0pwhQJfzFR5EAcGEMSkSLffUheswRuCGxsX6
         xN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034203; x=1751639003;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpaBoGbv3UwS2ctJ5MNrLd4WnRBIdXYjgTh8qQmsLHk=;
        b=Kk5RBdPhZBiAX+Vv5YNZ8srdbBr2IKy33eOoILElXvImWf2qCy51VSesD9nMCzM2So
         0naUJla5SBWpVrQYL+vm+wHMY4Q/FtPEq7iS6vO7SM9PlqpxhCRBvCy18RS4PXKslGUj
         9aYQ+Jaw22354P87LYc5XHWn2XdJPPeKnZyDLFIX8rkq/hNltoZZAQExwVK+zy08AdQ1
         oFv/bOcWGCaj5EoIyC/BDraDIOtIQTJKBrzXNqv/ILAG6Jq1nZNGoBPiPjV9BHIICinH
         EfN8GzkWaIe5quEsZbz4Lz0GPAm2eMFVeMHb4nIeOZwv9/rr4/Zvj9kqTwk30Ytbnr3x
         rCxA==
X-Forwarded-Encrypted: i=1; AJvYcCWjg5kQY7J99hNNgR22rTHvlF8QPA/enhJnP/noAzDzOf2mVXW1xavElwPFcBRtryvNFQG+5JS3nf8+RQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzHw5OjhAqZVRMAsYXZ1PpE9Kzm5iMtUBY1diWFNOxo7RT4797
	kW7G1ZSM8UfWJGt36u9LI3SwzxPSRBMGwbfemVP1eHU4GBKeMwui1JsV8NvuwTpLrdE=
X-Gm-Gg: ASbGnctQp9baVjSJpBxj7BpewSc08gzqIIP4DRsyRuqZQSEEpQ0ew5N6ii9AkGViErc
	IW6YKKQT9ICd7y429ifUi5YY9Hxm1c9qBTHY3G6rwtjsW5la13uOnaeU11ba5YoAADFRvPbAsm0
	d07yZfUhj8dvAQkqB8UtKT8LQ0/3Rzf+vKWxsp7xuge6KgnJE5lwWjNXIJFxKLWG3tOld9Q4D4O
	LTmiDnxCVFaDVH9XsgtHIxZpOLjR5D/tHdBMMbLJUcJWMrz136iFNCzfOIUOeK8bgkUVxz33bud
	QrMTGyRs3zUQeXMkjpQm+sYU3ty4nQUiR6IlHLrHKvvXQK3B7lPA/fBS6yV3xLxen78vV4H+6N5
	zk2sWbSZ1/FD2vp7c14TfKsIJ5It9CLlzGSA=
X-Google-Smtp-Source: AGHT+IE88bXOLiCjUu2+zVcecKfJf8g4CQ5BFAJMyhK2OHk7mseb/EKQgLzh833iCYXdtJd2+G7LJg==
X-Received: by 2002:a05:620a:2729:b0:7d3:a7d9:1120 with SMTP id af79cd13be357-7d43bc15837mr1028658485a.24.1751034202759;
        Fri, 27 Jun 2025 07:23:22 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d44323b4c4sm135708785a.106.2025.06.27.07.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 07:23:22 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: lee@kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mat.jonczyk@o2.pl,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 7/8] riscv: dts: spacemit: define fixed regulators
Date: Fri, 27 Jun 2025 09:23:06 -0500
Message-ID: <20250627142309.1444135-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250627142309.1444135-1-elder@riscstar.com>
References: <20250627142309.1444135-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_072323_748025_D2A931FE 
X-CRM114-Status: UNSURE (   8.49  )
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

Define the DC power input and the 4v power as fixed supplies in the
Banana Pi BPI-F3.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 7c9f91c88e01a..a1c184b814262 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -28,6 +28,25 @@ led1 {
 			default-state = "on";
 		};
 	};
+
+	reg_dc_in: dc-in-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_12v";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+		vin-supply = <&reg_dc_in>;
+	};
 };
 
 &emmc {
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
