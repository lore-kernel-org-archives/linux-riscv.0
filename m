Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A92F7C83F17
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jul 2025 22:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0ZrPz8xA4kd9eTNhBhESULlQw1TXjykeIUwdz+P/mAU=; b=xofqidWm4nt9yw
	6RFtNeXaDAm6InCIIRRKMhO1jyu24zNG0Hct1/3UEEVckfCTxVk5N654Vh+2GUH7ZmIrUTo8YufRH
	wNxsYStpsk7jpfQ2ha0qWRA8S6+qm0bCzj1BjwoHdmtvhRL7eqH2o5TeP1GKZBHZ0ADhujY07MA2k
	X0XH62gicAYordu/QnmJ/dSvcr8tirU8Le0nxiUe2iJhqGjtYMyyRExV9XZgUsGzFlPg/M0aV5H8t
	KxsqiLTz6FGXCVhtDE6jpXzWlV8dCVW1s5QeFEbMdSZ65AuB1wTSUT0egHcxNdxjrD/Rm+5Df24T3
	E1J0bsrB2/wVZzvmK0iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubnuf-00000006JKR-0b4i;
	Tue, 15 Jul 2025 22:14:13 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubnuc-00000006JJc-27sw
	for linux-riscv@lists.infradead.org;
	Tue, 15 Jul 2025 22:14:11 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-74b50c71b0aso3448504b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 15 Jul 2025 15:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752617650; x=1753222450; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XrA4TJh+BvN7wjadeOIOqG++LC6BTg9ob7hjy1TX3gY=;
        b=VHBXXNo09NdqInXq1eZfJfsilhQg7WSEG6/Em+PJ/hdsQQtA4pvo1Z3jGzTKQ999N3
         guPfk+x7uejE34YkAHWMjU/yCScJSjd7lg3dof8inSHetFJ697cyS8kkw3UFBGIIlEsM
         /zYy42Izl84N83I59X4y4XOP116o72o5HkLtvYHSBHfC73eH6oh3sRF35v4f9gyyMWE9
         fATfY7nZkbP3pDXohJL3dM6oVH4WV6ZlkJfTwxHSN8CebOWc4Vabxr1yI67KMYJb3eGM
         xUt0H/MeSVWYh4uUR3oJWUgLZsfU/8PWON9JJIPaIYzYFTbx+PGCG3vb3l3i5yKVq6KO
         Y2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752617650; x=1753222450;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XrA4TJh+BvN7wjadeOIOqG++LC6BTg9ob7hjy1TX3gY=;
        b=f2W302bnSlmyWK0K91/sW5cSA0vLQTjDWEaDT1e3gTGDTiRtwV7u/w6jHvvPZb5ong
         F+9IEpZfXWDkJ/KJTlaF+DiIkziWSnEJhrUMo/QbguaUur8zXXVRhPZktLMgLB/OwWbB
         Uh5IqY8e0jM+dkPUTfDxTa/RZNMWoUgHQFrRB6jCY1E5B93TCwkp7dShyEKhzjLxZ8AK
         n9GD6hKbsQpRLOTz1iHpcjfZ60BKdZu8ZcUjgLYS2X22q6rM8EJJkocH/z9CLtSDQOiJ
         9vVcc8YEYmAD2cuYUTL5efv1G9gH+pu43ITwsmTELbzLopMT8CezSdJ0EZ5VPVhHNO+E
         XSOw==
X-Forwarded-Encrypted: i=1; AJvYcCURP5stYS4/GU9XghhHGVOru0oYXDCIImL2amajPOz73KM77D656W04fxvCyPBZPY0wno1iLhEz73Wjzw==@lists.infradead.org
X-Gm-Message-State: AOJu0YywlIq4J4djaXaHJnJ4m/zSgedCc2gfrNWWhpl1ZPf0fbvO52XM
	/e5k2hceHI2K3qIwItIksQN3JvhseOSdXXJo5Xf3+F2mw5pMfQV69JJR
X-Gm-Gg: ASbGncuPRf9b0iVxQdKa5qglfwHn/s5Q51WSMIxUHLQy19q0gSZghy42UCpLRmXiI7d
	gtLuAQOenpRc7qs3TED5/TdpMbJirw2ZdQqO/xoLiKbpqHawisDgQF/YqV/yQ5TKELoufMAMEOe
	9uwquzS7dmZtHdjcA8KkOyXvaioArebSOhjNPqOObPBAX26aSchQ+Q3AB2Zbw4uEDIjC02FR53o
	NG96k0FuDuLIl61Ez+WcOI2BGrgyIM3yzwIdXtg51T5Vv5FaCjd2oAL5D5zP29i4Z16wMhl56oo
	uG2x2N2Dg5Kl09ROVkP/HBQoLqeoEFi+kczQs90DQbVLb1xAiv57mfHRhhoIOj6bm0nziBqtGs3
	xkvRTxgUB58h4mjbzUHfxIA==
X-Google-Smtp-Source: AGHT+IEsInpCl2boS1cuUEjJoih0t5+paTL5H13Al6lEbtovW6VOt0TKWUcx6UhFT5+4ihi1IP+qdA==
X-Received: by 2002:a05:6a00:23d6:b0:736:d297:164 with SMTP id d2e1a72fcca58-7572267949emr327515b3a.1.1752617649472;
        Tue, 15 Jul 2025 15:14:09 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-74eb9dd5d30sm13132920b3a.5.2025.07.15.15.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 15:14:08 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] riscv: dts: sophgo: fix mdio node name for CV180X
Date: Wed, 16 Jul 2025 06:13:48 +0800
Message-ID: <20250715221349.11034-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_151410_548876_39D10335 
X-CRM114-Status: GOOD (  11.63  )
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

As the mdio multipledxer is marked as mdio device, the check complains
the mdio bus number exceed the maximum.

Change the node name to mdio-mux to remove the following warnings:
mdio@3009800 (mdio-mux-mmioreg): mdio@80:reg:0:0: 128 is greater than
the maximum of 31

Fixes: b7945143bc33 ("riscv: dts: sophgo: Add mdio multiplexer device for cv18xx")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507140738.XRjv3G8i-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202507121830.POx2KDVi-lkp@intel.com/
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 5f094c6085cb..27056ef70ce4 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -57,7 +57,7 @@ rst: reset-controller@3003000 {
 			#reset-cells = <1>;
 		};

-		mdio: mdio@3009800 {
+		mdio: mdio-mux@3009800 {
 			compatible = "mdio-mux-mmioreg", "mdio-mux";
 			reg = <0x3009800 0x4>;
 			#address-cells = <1>;
--
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
