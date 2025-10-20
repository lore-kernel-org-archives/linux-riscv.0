Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CBCCCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 08:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ntKY80ny1KgZLz0SS+63evh1Zzk/UqDGtuqMJ3P7tv8=; b=4fn6iKXLHTTuHN
	hVdx8tPkZ+0e8M8It0Y6PXQiCKeKsNIVuJoazvnG2ua6bGYQ52aCYb6GaOSL9JlfywJtrl5K0NWKn
	zBkaYd6TzyegTVJYAIW7syVeHoCdYiLMqlmGME07/kPCt7ZW2YC+TLcsmADM5xGQjI2odaR0DPuC/
	lVz/P2vzp60lm+gAMMZwp7F9uT/hOdZboqTVBn+oZPoMPUnwvDNalbvRjpLiiFV8a5DR/H2/QYI9u
	h05sJTIcybIdx9re5XdpX4FE8SkJljtXLjVParU+/rG90g56eLxzAUfiGgV+DLX+pJiHmBm2t9VW6
	+Tm+bQkH6N3wqxPZL0zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlQS-0000000CQnH-0LWX;
	Mon, 20 Oct 2025 08:39:32 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlQQ-0000000CQlU-0uRl
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 08:39:31 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-33d463e79ddso3063949a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 01:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760949569; x=1761554369; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uIc6x2UqQ/+/MYkhVAsuU2AYMkhOe+CBEJq109yOhQU=;
        b=LTfGE3MkiskEJJbe/ku8u6svTxxYZNRoVPysEfzD4Mq1JrkBQtxZ602M6SXsT19o5S
         2zZD8ygsDU3+SSws9xwMNxfFpyunOyep+enYmIn0Jk67r6QupFYu9HzvxL/KSoGMpfmV
         4NXQvJRqJoC4tIEpjE5jHCUFbhKTAqL6UHCauG/u2gVlzzPJjbwzmUgomolST5+KdoIc
         amL23Kog+4r/c2AYeht3a4hbrdWxC7zPLN6wZuLtlyTUWK41hoq9IsILDJO+lCjaHf2C
         OtWS0JYPGwJ1NweyZOXQ36weW+5RV7Z1mT12k1vMdZLMWcw7XurgYIFUfxJmcJyfV3QW
         wAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760949569; x=1761554369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uIc6x2UqQ/+/MYkhVAsuU2AYMkhOe+CBEJq109yOhQU=;
        b=ufsxt9N0lCvgKE98wFMhSvffdZ99ZtCtDJIa7cEEm1OqIetJ5OEppW59EwkIptNWyN
         /LjR+wQl9mAiXnjU6YnIr5is8I0S3QyleXvTz/U/kufbGWTd4iWeHL2JvxtSxNo175NU
         fbGvols5qO/8sUBGPoEX7BHdVPZmHRE3gh0iwNMYdNyD0pi9K4LJLgO1ZrK+IgTFqUVh
         f4VzIoUOKEJd1SQGVPS4jfBLmF8Sub3xuYyds5D6pK0ffH5u7ePPCLLrmbojRQUtiJBX
         b0Or46UiXnEmXxURW8PgKVvItG4Asr0gqQEYjx10mNTnDP+1ZrOsSOZIw7AWBRfPoZlH
         BcGw==
X-Forwarded-Encrypted: i=1; AJvYcCUVOTyakBF6rorXcHs1qJscSYFOnQ7GtX5e01F2qd4I87tG/e63eYj1rZxKoLqlnyRWiv1jRE/+wB50vA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwlpXfHRwwOVVBY8R4WkOcKoPC7RvtioFEjG4U1OfTI3Arfzxni
	d4sW+66ZMbqHJ2mgOnSWDU5dCCxz8fcxDL9j9mBxN5M2JyEx0Fba8/k7
X-Gm-Gg: ASbGncuEip/EaXb7NxNfsijV+QKna/icafS4pXoiq8zORwWt+H7o+yRykxvSftuEky1
	DcXhNEqwi5nOB4CaCfnqowX/7bnM8q3nBcNLmMpdNUNTfh3K0UVl9uwCOtep+RAAVZPHk62d2n3
	Mvk/tWv1+MUUgIl6Gtlzjo9MvsWdHz4iVrzzoF8LPHyvdC+ADJ7l0mqsb1BcYOVL/VAGTuWxq8i
	OE4l8FdPgFk7Jgg54yhj6EQGJ2Gx4JlGhTW4h+fhmWx00ykHriQ34lLRaF/CvhZ/XKvNFc7hc7J
	LdqGh3TkIFaL7+dFdk4TEL/t6flnXiHJw4RYPUJwATErPeov+MMIML44WHs8fwjZNDDnUAMHa+j
	q12/cBLguXscXMJnmjJdt8yzHrTo2wA1/DXs/Atko6iYquYs+afXL/UTc+nfrR25s3xcqO771jt
	tiKqP5Ke2xuvxsLb+8
X-Google-Smtp-Source: AGHT+IFkyp0InjhjZaNKMIDCmJDhxuvBQ0nCOQaXFWprMyh2MBS2FRaBpj3aAHyvwBdPHJzM/Mh1Tw==
X-Received: by 2002:a17:90b:5386:b0:32e:9281:7c7b with SMTP id 98e67ed59e1d1-33bcf85da05mr13624650a91.3.1760949569204;
        Mon, 20 Oct 2025 01:39:29 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76b5d0b4sm7062386a12.29.2025.10.20.01.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 01:39:28 -0700 (PDT)
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
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 2/3] riscv: dts: sophgo: Add syscon node for cv18xx
Date: Mon, 20 Oct 2025 16:38:32 +0800
Message-ID: <20251020083838.67522-3-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251020083838.67522-1-looong.bin@gmail.com>
References: <20251020083838.67522-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_013930_260371_8EC3F489 
X-CRM114-Status: UNSURE (   8.92  )
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

Co-authored-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Longbin Li <looong.bin@gmail.com>
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
