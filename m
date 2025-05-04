Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D0BC3ABB0
	for <linux-riscv@archiver.kernel.org>; Sun,  4 May 2025 10:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fWGkrZBnryCGIQxzcsyiYOtCL95MbwEj24St6MhAq5A=; b=u770XCzYiHnDeH
	emCX52eYstjIOUCu1cGgXB0r7xib92vCeVj7X5oRI1ZR8sXaUBlrlGoHY6p3Aj6j7ec/JgPHooQbW
	IGXIXvV20oiA/GYnh2vr4iMQmPiyFMQsJNMvb+5gO3xCwRA8MhszplwpTqFj8NKkKfkBynv65mwR5
	DiaNUcrdmccOEVWiTbbF3L97SsFj8PQWy3/Hl+Z3TvOwsRXzftQWX3MGhA2tzvxFCBjuIYxFGPrnQ
	BUdlWRcA5KRcMZJvEZY8DuhDlY47r7H79eOHuByj29K7DmjCTAxqo8fydEZxhMdOffXmd7SBTMK+z
	FPrQSFK40iCE1ARWTmQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBWrf-00000005CCv-26Nf;
	Sun, 04 May 2025 10:46:31 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBWrd-00000005CBL-3af3
	for linux-riscv@lists.infradead.org;
	Sun, 04 May 2025 10:46:30 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-6ecf99dd567so48773166d6.0
        for <linux-riscv@lists.infradead.org>; Sun, 04 May 2025 03:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746355588; x=1746960388; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jv7/7EvCAlYgtUnyEHnXc7BmIGdTgL1yOUIUImvH/ec=;
        b=hHWpMlhTOvuN2MEKNVpkBUwEjXZUn2ZSz/AXGODfOHCMynLO7x16zjZwQ5x/kfDgAf
         LEczztSlSWc8bP0dFdNuATaa8iFVuaNCdgW3vJpxESG/KSkc6NBfGE16X54SesIBySe+
         xTSD3d+QodubT9kUVRpzrnlX2Eh/oe5fBoe9nbJUzc168UIAU2jSJi4NZTtYJsn9apTb
         R/vUsS17nIwWNDfJrPtg3gMpZ8fI4AtdcwftP3S4R7FE8AmGCNAkieYV40h1w8jsx1CW
         6NynbeYZsSAPhEmfSf6hMCbPqB7/B8bRaep71swREmlhmopApMJ+DGP7iB0sb+ddLLjY
         kKIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746355588; x=1746960388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jv7/7EvCAlYgtUnyEHnXc7BmIGdTgL1yOUIUImvH/ec=;
        b=JmcBMEtzfMBpZoEg3fCuoWmm/HIcqAiO3xwtFme/2HXfi63+kceAwE49IgBvhMvuck
         LNPIn63xn5GvYpzhLipDTOhmWE2mjyH914HVGPkNnU1E/Ji/JCmWHMRbjUtKjgs0hReQ
         enUMu1SETPFmYlSVXSzuTUOdnac9CLi6i7/hdV4rVSWjWoYoI3eTowN7sMznG25ZIGez
         8SqYaA56OerQcJYMPq2s0/IVVofGjNiPztYokfhSfXLmmqPpH0fa4w+jidthj7ayTaUV
         Ebsl2HcO8LjEGFFddGGaHDpOecP6XygLjNVM0OWYUMnGFmPvVKqIvVLHwrZS0byP60fk
         FJFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXneTnqaK1jVc3+ackmYPMYeto8z2Pr0MjtAuWOzmir0jbAV4DwhwmODs0JkFZlEiYydiJwwG+B2hWIPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNn+KKnbdn3+vGsVONPr+/n3SQcOQQKGjeUOJCvs1reedJfJnt
	6Ou4U7dqYzzD+FrbpcPTB/aQIuD+eP1hvWAxaSOQy7TSLtMKZUlX
X-Gm-Gg: ASbGncvyAQa5HMFC611qPSmXm3Gd7RXmh+lSe2Lsp5mJ0HEtQQk3XopihPUr3AYdLMC
	EVPfzTA04qSv3eQtd0if723x70L2K7mkRWALk4OWTJ8VeUgauzIqRjwBpO0YLgxZaLQD+YN/DrW
	4OLP4QJ6S1/uVGEJD41TYNALQ156YICdiAeXCw+pOkGOLjz7wLw5/e1AQCMVJJbKMZ4Uu0Gph5x
	+RZZGmAsFHUN+U1GROW2XWJT1OF7JIiB4Zept/3b96Dyw/6b1/KgYe3Mm6VRIwvU/POZNu3cdvg
	QTi6qPqDYkBCVPno
X-Google-Smtp-Source: AGHT+IFYpImqiuOB3O8DVQFeUND8eQIrOsqgcV+l8Cmmmw+ZJEhkZoQpsjSK0P+vo8PHzjh3eP0gPw==
X-Received: by 2002:ad4:5e87:0:b0:6e8:ede1:237 with SMTP id 6a1803df08f44-6f528d569e7mr54061806d6.43.1746355588539;
        Sun, 04 May 2025 03:46:28 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f50f44f415sm41792616d6.86.2025.05.04.03.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 03:46:28 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v2 3/3] riscv: dts: sophgo: switch precise compatible for existed clock device for CV18XX
Date: Sun,  4 May 2025 18:45:52 +0800
Message-ID: <20250504104553.1447819-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250504104553.1447819-1-inochiama@gmail.com>
References: <20250504104553.1447819-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250504_034629_895063_461D8558 
X-CRM114-Status: GOOD (  10.37  )
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

replace newly added precise compatible with old one for existed
clock device of CV18XX series SoCs.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 2 +-
 arch/riscv/boot/dts/sophgo/cv1812h.dtsi | 2 +-
 arch/riscv/boot/dts/sophgo/sg2002.dtsi  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index 88707cc13fb4..90de978f69c1 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -29,7 +29,7 @@ pinctrl: pinctrl@3001000 {
 		};
 
 		clk: clock-controller@3002000 {
-			compatible = "sophgo,cv1800-clk";
+			compatible = "sophgo,cv1800b-clk";
 			reg = <0x03002000 0x1000>;
 			clocks = <&osc>;
 			#clock-cells = <1>;
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
index 0974955e4e05..9a2a314d3347 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
@@ -31,7 +31,7 @@ pinctrl: pinctrl@3001000 {
 		};
 
 		clk: clock-controller@3002000 {
-			compatible = "sophgo,cv1810-clk";
+			compatible = "sophgo,cv1812h-clk";
 			reg = <0x03002000 0x1000>;
 			clocks = <&osc>;
 			#clock-cells = <1>;
diff --git a/arch/riscv/boot/dts/sophgo/sg2002.dtsi b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
index 6f09c9199102..98001cce238e 100644
--- a/arch/riscv/boot/dts/sophgo/sg2002.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2002.dtsi
@@ -31,7 +31,7 @@ pinctrl: pinctrl@3001000 {
 		};
 
 		clk: clock-controller@3002000 {
-			compatible = "sophgo,sg2000-clk";
+			compatible = "sophgo,sg2002-clk", "sophgo,sg2000-clk";
 			reg = <0x03002000 0x1000>;
 			clocks = <&osc>;
 			#clock-cells = <1>;
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
