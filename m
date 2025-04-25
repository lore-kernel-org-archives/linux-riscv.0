Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1E4C369D1
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 02:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uqHla//mpzjdVZOrth7d6FLipt9IO2Bi1jcX+U/9Q84=; b=423/olaLlO7kYN
	Kj5i8TzeUOLoybiHELkqseMtkB8bn/tAOcwmGz3cZWLXgcGxYZQ7zMzQQx7P0xkErruRLwra3NKzg
	LKVcS03zOUflpeUUEijMIny2uUGLVXxOPS+SCBOyZSsqkKHHn6TGUVEEh8rcUXNyc1AQa9WkgcziA
	0bLqoZspHaCxbMLxxg2JZ5SOOnG/nW3TD/9ugAAd1iyRUtytU6awS3l+6HZDy5t4hrVr6c6y8daVc
	KXv/FOJV3iF7skFwrGxZD0/MmLcdpBu3VdfMkzgYBDOHynVmgWrY8qK9iwati5e1GJ7BJ/5hOGR48
	DhcSHIwh4Pw0v5MB7gGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88oH-0000000FmkA-0UMS;
	Fri, 25 Apr 2025 02:29:01 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u88oE-0000000FmiA-3ixv
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 02:29:00 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-301918a4e1bso1392189a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 19:28:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745548138; x=1746152938; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PYhIc8nI7TQrbMQ5ehdUi9XRR8BUa9kFTApEz1i6px8=;
        b=CZepX0sUIFBQCx5gj02HW3Pw3ADOvo/ulLCDsxMhuCcqIN6wHyff862SAamwpVyh3c
         s8vuR39Vx7D8csle/sAV7xNcE5FX7sVxYsW1DnJreZwAX1GnjEOFrWPPGGMUUqQIMyCb
         XkG2pFI2msiRcqxI1QML6Y7kWiMKY3bSPiNA3i8etXtPfC+RtHs1dEyKYZAqcNF8bPBR
         o89Z75LeowWO4Rt2ThbkUZamG6689aI4M39hEIYvWtPg276sBs53Ob784E33fNVYkS++
         OWl3sq7zMyEmuxIzxv40iWuc6Mwm8eJB7dP6s4V+6Ikh8s0bYmePPlKwIs4Y8Dic5ni5
         OA0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745548138; x=1746152938;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYhIc8nI7TQrbMQ5ehdUi9XRR8BUa9kFTApEz1i6px8=;
        b=tqREIxSJ8JAzAxDnLiVnLLIyOakA91bLvoy0N5ofds1uUxVGqpb0ubMEiv7exWdiNE
         b+g4WeQifFIGNkb6oxVC6GSEckFWUVdi/tes0dfK/ew3TYWOXkRz4SbBY/yJuat8nNjV
         9Yfv4zmy4AF8ewqFnsH090NQYltNDgitvQZroS+hRr4jVqSMXfyDYrBvRpT7yDrkENGT
         rNXIb8cmYmnz9gmGlOIUEWsMilxdBB29Ju/0LvRtvkI3Z31Quk0XMLcbRDFQWJiiwatY
         88AW+guGJlKdfO+uq7mk165UE8DkwR547Iflh/XVHc5Re5BTHDCD45e0NJVHjuHSQ4OO
         Xvfw==
X-Forwarded-Encrypted: i=1; AJvYcCXq4VIWyUbstYkWXjETvuIaScZTMJ7Bm166PqXegud9Fs1cvSAClePL2uPygIknT6HhyRldhM0mfzSo9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzvI0f222UmH0Xo9lm3ExLU+VS+9UC26dlCwspPyZ6xY2oqf4CN
	CgvrteoDDR4ibShXmYGRF6X8OtoQcJp4uKGFnDCGoEiqFdPT4ABM
X-Gm-Gg: ASbGnct8upwQobwVItozQIgRDSqGB2VPiErLW9doBV/hucxm6JSWDWq7Acn2ppx7yOi
	y2SScVqQ0GVbpBeKoDgJx7eGpZ6ms8FvQVOBiqSxVlpf417tT6W9XhGCkN6XGK6maQZTZW1HIy6
	xlF8b0tqZ9s7oOJ33zAXIEG4xXw6dV7h/ohNXbLBwASO7CTpUIC6JJUlq/4e4OoZpMcP2cG+Psu
	vlzqNU9jqmhYhK7jmRuWvXmcG4ks+I42qShApMpZHQQo9VSJ+Y2Lo3DTin3dZKh2N8UFcM/mgUh
	RFA7bZ7YzAfCsXyfWW3J9VEQSiSbaPwCB/R/Zm5CKak/bQ==
X-Google-Smtp-Source: AGHT+IFQ/ASdtiEJLWyy0JwXJvK9BuImD6nRYcmLkOuTSd7G4uxDP0nuVfFuf8LFPcPjATGegctLZg==
X-Received: by 2002:a17:90b:558c:b0:2f2:ab09:c256 with SMTP id 98e67ed59e1d1-309f7ea86abmr1328288a91.33.1745548137606;
        Thu, 24 Apr 2025 19:28:57 -0700 (PDT)
Received: from [127.0.0.1] ([223.80.110.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f782d4a9sm365455a91.30.2025.04.24.19.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 19:28:57 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Fri, 25 Apr 2025 10:28:14 +0800
Subject: [PATCH v6 3/3] riscv: sophgo: dts: Add spi controller for SG2042
MIME-Version: 1.0
Message-Id: <20250425-sfg-spi-v6-3-2dbe7bb46013@gmail.com>
References: <20250425-sfg-spi-v6-0-2dbe7bb46013@gmail.com>
In-Reply-To: <20250425-sfg-spi-v6-0-2dbe7bb46013@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Mark Brown <broonie@kernel.org>, 
 Inochi Amaoto <inochiama@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 sophgo@lists.linux.dev, chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, 
 dlan@gentoo.org, linux-renesas-soc@vger.kernel.org, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745548101; l=1524;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=bsOb61YGYomuONd3drp4jb88EZWek6I8D8vdw/YFqjA=;
 b=0QyxC+63XX3Z4RcBnZwI+jfagaTUbfSPhQbRudW6e2AL4aoUOOld3mI48zwlew9sNlIgXaoqk
 YmltacDzoa4Aa3AoJ2E0K74/56hzddLfwyrfC7PxbezhYZU+k/gUfTg
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_192858_926495_0EFEF9CB 
X-CRM114-Status: UNSURE (   8.28  )
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
