Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C5EBC3600C
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 21:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hphFE57rBDPqK2sJ8CtQHuCenTS6i/4vAy/3hXCnlhk=; b=fcF8Pm8wFM9veF
	dPFz69uWZi3hmAYkUjaBoqMW06Pw860QAoh3F7TP6OE4nhcsXnmtLrZbt4U4WlnCj81JXJozQaya4
	rmnz+VBXu7aYE1wQdwJHr2RxVDzUF3FspeLFGw3co+UkpFftTbutKubVEuPnv7OWaFRiJRAlX5LyF
	h17a5wB6hxVqov6lmcdWUZfGbe/BRgdzdd6yBUepnbNxlJH+Vyu8kR8lFlwGmoD7Hh0Yw678CCKXm
	qDEXdNN49fwIB7z8Ee8Ky4MH3+8mTHQMKsConGZ59LXdokoF0M44WkLDW38T4+UR0T6dxh/zzOjF0
	biOaBAb8EHn5a9bN2moA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyGqq-0000000EJ9w-2wO0;
	Fri, 28 Mar 2025 21:02:52 +0000
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyGqm-0000000EJ7V-2ZRe
	for linux-riscv@lists.infradead.org;
	Fri, 28 Mar 2025 21:02:49 +0000
Received: by mail-io1-xd33.google.com with SMTP id ca18e2360f4ac-85dac9729c3so192122739f.2
        for <linux-riscv@lists.infradead.org>; Fri, 28 Mar 2025 14:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743195767; x=1743800567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Up6UVO27Yn/XqWtQdUwLGOA59Ljhuzuee1Xv/FAc+zk=;
        b=HODKPis+y7goSmwTlktxUlOlUOivS13Xd8UGP8UWMG1byRsmuef6qohkyq9DlnIQG5
         iuC/bfiaE1jey+O+MwWMcqB2OiMJMMHE7yU75rNxLfrabyW0imr9k/xM+Kp/DcKHuo1z
         PyKTe8Jc93tym2CJAz/yOOvl1rc+VfH9U7uS7XYniinqXCDgGAyysRUfrkeMG0n0TtUA
         HrUmg8CQH2LdwHMfA0caeaGEPjfuH7lETOitraRweaBTUXzRjTq+eziEVLd84KH3pAN1
         ViQxQHEM9PJeugP7xzN0n/9MX/UaXJVjHLyCQFmKxk4AWVLSrDMGGtd1eBPzUYxNjbRW
         hMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743195767; x=1743800567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Up6UVO27Yn/XqWtQdUwLGOA59Ljhuzuee1Xv/FAc+zk=;
        b=h6wTJhDVDFS+8/O8a7c054n903OwntUevxcxYBKsdRyqar4S41/EBk30FUG5QhGGh2
         Ao0nQHla0JQw1PeW7zG4zJ4qYDtTPpSY1Rsd5PRhyu2Bjvn528uYKeZozWxHuzykVGHq
         /tsv/BGfnpmnjWTFwOtzE3fEOLFjQwFpQUleqknHKgnbnMnfe4i7IB0giPMuZCxqySsh
         WVT+wWhq7jA/rJGkgWUqXND8+bVvvZ2yr/IYZhajIxsD7er3bp9nj3GYqV5TIDjZBbnW
         9dv3gIDVPkzRipwcCFby2wdWWNJYh0NtGE1YIkByG6VlcT/20mlzJt9eD1+Z/vTASMLa
         kcMw==
X-Forwarded-Encrypted: i=1; AJvYcCVWrQYNnVLIlqRjcrdxRlWjCuAYFQpASNrTBgcbkFlmHdSfn+uPeG/Iy/vncUzVkLvNFSGTRDmqXJhOGw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxiqmGzVAVD9M3qTRjdQ/xAqYhce67Jmo+7BOG1WmWZUvcmc9Yt
	PCkU3OuPpXNrv6i/CDRssWEvDlMU9PvnuP5bjOxlaMVesZ6uribLHCT4MdovspI=
X-Gm-Gg: ASbGncuqF4NjzO5D8D1H+x5zUNAp++KbLDidPHbmzXZLQIIFsPd6kWnQ8FunTTyq849
	jjHhdfW0ae+2xeRZc2qCBdAlKHIB3QRvcuwJ8brQyqUhoEEYfaowo6eYS4QdbToVeNhvLBNjICG
	GAPQZR8Wc8UXpx2ZrYiA06qmjlEVgD/n6Ue5P0nvWIlrZbd+a9t6uaCszz+WnHJ5PfTJ/zfU/zR
	yvfhTxs78mTlybKi9gn5kn2hTJuEJzl+cD579pdW9poDEbadeLMbH2ADikUbtlD5Iyg9zwQINgA
	GOKohdEF32GlKBG7qxs2tjWz87RvJIyxnBij+hhGqWuhyGDEGM7kSrlbs/kwJ2HecNdTpY4Btg6
	dVmsGtLkr9y68GSFqqQ==
X-Google-Smtp-Source: AGHT+IGycY5TIkiYNgkSFBznHFQkpXRLd390tmdbEA+ih3++uzphzN5QAmfZxFmfAoPvrq6k/CN1+Q==
X-Received: by 2002:a05:6e02:23ca:b0:3d3:e296:1c1c with SMTP id e9e14a558f8ab-3d5e090e3e0mr11364365ab.9.1743195767546;
        Fri, 28 Mar 2025 14:02:47 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d5d5a74286sm6769405ab.39.2025.03.28.14.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 14:02:47 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	dlan@gentoo.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Fri, 28 Mar 2025 16:02:32 -0500
Message-ID: <20250328210233.1077035-8-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328210233.1077035-1-elder@riscstar.com>
References: <20250328210233.1077035-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_140248_653198_F44F33BF 
X-CRM114-Status: UNSURE (   9.12  )
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

Define syscon nodes for the RCPU, RCPU2, and APBC2 SpacemiT CCUS, which
currently support resets but not clocks in the SpacemiT K1.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 09a9100986b19..f86d1b58c6d35 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -350,6 +350,18 @@ soc {
 		dma-noncoherent;
 		ranges;
 
+		syscon_rcpu: system-controller@c0880000 {
+			compatible = "spacemit,k1-syscon-rcpu";
+			reg = <0x0 0xc0880000 0x0 0x2048>;
+			#reset-cells = <1>;
+		};
+
+		syscon_rcpu2: system-controller@c0888000 {
+			compatible = "spacemit,k1-syscon-rcpu2";
+			reg = <0x0 0xc0888000 0x0 0x28>;
+			#reset-cells = <1>;
+		};
+
 		syscon_apbc: system-control@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
@@ -518,6 +530,12 @@ clint: timer@e4000000 {
 					      <&cpu7_intc 3>, <&cpu7_intc 7>;
 		};
 
+		syscon_apbc2: system-controller@f0610000 {
+			compatible = "spacemit,k1-syscon-apbc2";
+			reg = <0x0 0xf0610000 0x0 0x20>;
+			#reset-cells = <1>;
+		};
+
 		sec_uart1: serial@f0612000 {
 			compatible = "spacemit,k1-uart", "intel,xscale-uart";
 			reg = <0x0 0xf0612000 0x0 0x100>;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
