Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C23CA0EE4
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 02:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yjeRD0orUmP491zDMMmDZc+HX0DGM93xfYn3ja0cZFQ=; b=j7hRt9/O1Jntdl
	9qz6qqFZKL2FO9aoSgO6MnbHe32cWEBRUlsIzTqb0mGMJZIZTqvVo97+VWZcJz5l+rxQhX7FAyCSz
	VCWOFmfSJ/DA/BfnLKVsNaitLWs6d4A/phZE8mrLe1zeur+/gU4hvFLXoKwwLHZGPfAPXVUh+m+qu
	jqSH8XREQJ5L08f83g6rivL4+i/K/EIkzbO7gkN9e3zGmflZnSj0BeQu0nQiOqQVnfwFRWW1WnCrm
	4vAvWK+v5uRKRjdTavOuf13dRkYQmfsRdBp9YkrPCLmM8DRVVXOVTEv/RqNfZhwgT/A/Y0YopN10G
	wrltGQClfigxWsUboKmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1Wz-0000000CRJb-3YZv;
	Wed, 13 Aug 2025 02:48:01 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um1UT-0000000CQjR-1aNm
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 02:45:26 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-3e545dc7400so18998855ab.3
        for <linux-riscv@lists.infradead.org>; Tue, 12 Aug 2025 19:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755053125; x=1755657925; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TzbsCOAJDq8e6tJqb71PLkWE7SOSqQYLq4powgsnVhU=;
        b=2NFrk1EDn35b+gvkeOPorWXuhv4b8kJKUHjfgD4m4tsGaCdo3gEnA2VQ6FmPJg9jPf
         /2cVdq91/WkLeX2e3UsWlP1WDM8FWr2us+t0VNxQnBI/+FHtf6qXT7dxEImpdzSm5EcX
         fNmuOHxMO6yfxQemUGqa6tJQORHaDRm3tMCtS09nlIgcGei0maYSJnoERXbYL0HP3a+Y
         874nMryxgeuwJXG4XVWit4PvoSVagqlKV4pobdjkTQDLDN0S0k5LplC5X0DhVj57DA1D
         gFQE1Y0nFwYImZPU824PCHjWVJ1xaBZnfAlVU8xkcSiKBKNA+0WHBGYvzMYENE1p6jYT
         OQ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755053125; x=1755657925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzbsCOAJDq8e6tJqb71PLkWE7SOSqQYLq4powgsnVhU=;
        b=Y7ZV65SMgdixqez1OEwZyKhkFGtOXPc6qt/eE+L/S35cVCXzF+6DHrKLmw0ZlEQRBg
         bo3IcB8MVMuGmRcFK9ZfNdRiUk59hipM74UekRk8nIrSo+CjS7pIbw4rEWmQb72RSYU7
         vxrNNo/KbXsJBpjJM1wFQzo3JTQGUwWOP+91dAELbDCYhLZ3u21vnZWu6lx0fJIZkJKE
         bpbduKvfJuYw9/9X5iwh+oLluZXIUIyDK8y9lkRGQzYblDKreisC50MlvzddRVI867P2
         CszIouHRtl41FXc7+Th1vxFXsCOHGUzQGUl0syo79r42tMiUOBEBxjC8Df1KjJ3x3Pzm
         zftg==
X-Forwarded-Encrypted: i=1; AJvYcCXkbFBA2siCnX7CGvlYmdTlcliEZzoJYzJIhSLzSWIC/yAx234pxekpmCaomQzKtHSJIXLTtKGIF0oeuA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXcsOmzT/CgxFR4ubiCnkuASlybaqdwi50sSgCsx+hqqk+44ly
	TY3m39av0jeLHDFlTrvGkBZfvTHkto3CjQIm0vo4mbgm0NXza+IgJNp98eJirSpBV4M=
X-Gm-Gg: ASbGncvq8NUnXb8+vYIXwlI1SPEKvs1iEYl/fJCGnx/mzY4Rb8ZaXWSyUPkjhYpZ+p3
	FA0RLE+hPkcfiYCtiTFcv/3J32WMB74sWw6IcAzGXXtAq6x0sFy8w633NBvtFZpc2XONe0mWJ2T
	pzzUaZM9xg7ESAf6CfpNQm3J7V72Qdr9edRtkv4PcyBSymg8nOvQXJ+0LFSZXvuedZccB28k/e1
	XffUFmNYKLiwBuNK6vkb2XAWvKEKJQXWvNKDLRWcKtxARgsNotytxBPJmA6E1evS95BtbBW+ima
	8ayn+jT+hr8n96lwYdFyXHPm2dtRK+QYxtN0ycM6Y1UpnnqZM61kn5Lw9TGI9w6R3tFp5heX+9z
	Z9B53Mtn5rcEu+7gCbBUkW402WInF/Cp6btvDqP0iem8dmiBTlD1yYKGp/s722A3rLg==
X-Google-Smtp-Source: AGHT+IEsfC/IKzLwt4IZPy6SkPXZpTJu9PySwz9GRZIpUkfEiQ20Q0ptezwTySBlx0jjAkkgtyP2Sg==
X-Received: by 2002:a05:6e02:184b:b0:3e5:4a7d:2ae5 with SMTP id e9e14a558f8ab-3e5674b0c78mr21916045ab.17.1755053124757;
        Tue, 12 Aug 2025 19:45:24 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50ae9bcfbf6sm3430829173.54.2025.08.12.19.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 19:45:24 -0700 (PDT)
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
	linux.amoon@gmail.com,
	troymitchell988@gmail.com,
	guodong@riscstar.com,
	linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 6/7] riscv: dts: spacemit: define fixed regulators
Date: Tue, 12 Aug 2025 21:45:07 -0500
Message-ID: <20250813024509.2325988-7-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250813024509.2325988-1-elder@riscstar.com>
References: <20250813024509.2325988-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_194525_415057_109EDF31 
X-CRM114-Status: UNSURE (   8.59  )
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
index ae9409fe398b2..a11a60b9f369b 100644
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
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
