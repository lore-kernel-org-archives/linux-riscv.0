Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB41CA0EE0
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 08:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KXVtzdjr9t+dKCHn75ZBA/1dDUMmgqkA8V6i/BIgBWI=; b=o4pbqe3JRYPhKB
	F5vjP/QrljKyO+NHBYeWnDeItAgPgEUVBMataenOyCYj3TcOdWSutDn3CfapJRkYLGh6izocC+j3K
	21znLmgFOV/H2ZF5Q/oIw+XkqBuYKirTKvYtTDcHh8furfmZfAMb03WuOc/8ETzzAn/Rd7Xt6zAy2
	dwONbItYBmaPzbaLJHuUnTQogOCoHl0N1EKofpshRvLPbYOGHbhaRcZVKDVw/Ry4X13P2BNI9FaG/
	Jv+ON3hGBuwqYnfpDMBTlHi/GQ0BpwbGJtlWY5L+wM15jj23XrB/HIEaAh0x2CLlt0j6cv3xqiS6W
	7MB/ryVtvENxaIY3O2SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6zp-0000000D7e9-2LTl;
	Wed, 13 Aug 2025 08:38:09 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um6vX-0000000D72U-1e9c
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 08:33:44 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-76bdc73f363so5688381b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Aug 2025 01:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755074022; x=1755678822; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9FrVKbMMxUgucaMuE8fujtQNji+Pr9aFYe0T4La7C6k=;
        b=OwniA3ooeYxXKMiTn0zjGL9JPzJ6Ryk92W3BL5lvUIYHGQ/jKUaH0FO+2Ca+T37Rg9
         cOPuO+o7hoXhwVJiRvirnu0UASmWikugCjkwHPb15q3uWnc+Rx6NOSUjufbcoBqxJxJq
         TNC57U0bwcmev2+6V+6mPLm8QNVNnMpMyfwdw2xTYGgTStmJgkMlWuEwQjxCZq3ThXbR
         PJxlYKnJkFx7a8imIumAEG9tdQJO9oPdw5mhEYV9v9EO77p3f1BW/ufPbL9ez5Y2/Ghl
         g6n45d8dPj+0dyFnw/I1lihwTsei6rNfZgYeSKU/pk1kdLq9vTGD0vfn0vdFEo491wUq
         BXzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755074022; x=1755678822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9FrVKbMMxUgucaMuE8fujtQNji+Pr9aFYe0T4La7C6k=;
        b=EPoWOcQyDmlWAuB+2h6XPlRi/PwOVRqZrRmKQxNkNmgHgi/SAwdx6pXk3T8jZeWZpp
         QhHFEfjSng8EC1JM67cVDea0atUAxwlErhia74oE3WtQNMN3YNX3kokDQzP2TQmU7RHN
         seisXbx1IywfFu3wNWjyZAst9t7SBQA5WFBRshsFgM+cVOB82ExylVAjCTYFPxopFe3r
         6Hz9tQEGhEWCufvVFenbmyoCojrp77ym7a63DOT6T8rIGPeKrlcniSsdIACaK1aIgptJ
         HzsceK7iLbgqY3hhGPMpwoE0Ka9bQrfmzzMtKc4krfpugsfQNQgEhyIEzpFeAvguMJEb
         SOQw==
X-Forwarded-Encrypted: i=1; AJvYcCUePe3ECmciNbFCsmSB9ZazJjsGCJJv1SuEyRb9hCmfWQy/c3VAxWsb9DSbOuXhD0CsmQ52x88RB9JNsA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxolkpFHyPtY/y1Vx4dibsYAH3AIEE36TMHuKPoAJwI6OmfDT+N
	VsuWi+Tkf9rUnH2+o2u7WbVLnA+/bFm/XjMZti9bDxtkwHfoZYy5Mq15
X-Gm-Gg: ASbGnctlarjhKUmij/WwLTxyfvjFmnghHLxUD1/r25D16cDyrXcxa61T6BoqdFPfObs
	mcg6k3+Lkh5dJb45HsYJj07SOwO1/SPCBK68NGMdr4Yn7WOVMZ3aLWGx8a4t4cTmkmFFqgmEcBE
	OLa74hyiVa1krGrHmEsVPd1behepNcSC9NKs4wMwIOiatSigEKbTTj2ZZm9ws2vKjNXvGs9bJ/X
	zBTbE49vemULgG320v4UYQ89Ghn6zacxzWu2a5VjbPqZ5OswP9JNs2LSVeIJeQ7eWtfp4gXW2fU
	9R6dpKwRSuWSvA+5ra9SHKE66U29Hb01kYPObfRzyU47rBNSEMMC5OIkmuhGUnMM+LimtgBkY2s
	lw7lxyHUPH5Rw1jFDENAmzg==
X-Google-Smtp-Source: AGHT+IF+s8cQXKEirEmIJJ5qRb8UyALTc33892JJyQWbd8Eu8uoFYzitLuwaOSKfnI5pphmxlLCAGw==
X-Received: by 2002:a05:6a00:3e2a:b0:742:3fb4:f992 with SMTP id d2e1a72fcca58-76e20d09aa0mr2982062b3a.10.1755074022038;
        Wed, 13 Aug 2025 01:33:42 -0700 (PDT)
Received: from [127.0.0.1] ([36.255.193.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfe50c8sm31307814b3a.120.2025.08.13.01.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 01:33:41 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Wed, 13 Aug 2025 16:33:17 +0800
Subject: [PATCH 1/4] riscv: dts: sophgo: Add SPI NOR node for SG2042
MIME-Version: 1.0
Message-Id: <20250813-sfg-spidts-v1-1-99b7e2be89d9@gmail.com>
References: <20250813-sfg-spidts-v1-0-99b7e2be89d9@gmail.com>
In-Reply-To: <20250813-sfg-spidts-v1-0-99b7e2be89d9@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Han Gao <rabenda.cn@gmail.com>, Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755074006; l=1514;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=3Lv5bTYlKhpC0eWwB0IvqfV0hV7JqAASipFjDdwVTeM=;
 b=BJ8pWBbvIH0FzbHcdXVpTFAH5lT0rZrjui0Ve61V+wuFm642CvwU6DaqC/dcoIV8XCjY7DG54
 qI4V3t1jAbxAPR4ndQ0bSfWHDppgyK0MUgXDmPse4XVc4ZfdG6PbS68
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_013343_434575_0ABF4884 
X-CRM114-Status: UNSURE (   7.89  )
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
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
