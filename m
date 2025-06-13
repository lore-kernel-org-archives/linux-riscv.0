Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A63C61CE8
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 01:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VXJr0LV1XQeecYoWAchCfKXBjvEcN5Lrg2YhLjO7qsQ=; b=21FZL+bb1DuUqL
	Dxolzb4msA6vs/OCMUOiGRRxcs5t+VoJfMtbaetCVGX1U4jo2OvwmQ5y/zgbe+TNSFrwEpngjlaZk
	APgPVwkdGQ5sjg/DO9CvxQ52EZ0nJyDglKdncTtzgqxEBbGprVF3MOhOsISokbcigjlsuHSrezF1p
	6BQWA5BBbNW/fjPiaXup3V4RGuCmqTE814IwOMh5nrryQeGeIN9q3oGHo231Pmr7hxadpmu1JdFQd
	qIh99mxYjhdwZaBz8NgIlB/SEc2fpdKMNOoBPgyn3i/bzNaeGsKWmRI8zpdSf0Y65G1v7lIZc4awy
	1fsq/DavYJ4MH+ZyzTDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPsxc-0000000F1i7-0oVu;
	Fri, 13 Jun 2025 01:12:00 +0000
Received: from mail-oo1-xc2f.google.com ([2607:f8b0:4864:20::c2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPsxY-0000000F1f9-2RKs
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 01:11:57 +0000
Received: by mail-oo1-xc2f.google.com with SMTP id 006d021491bc7-6062e41916dso747776eaf.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 18:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749777116; x=1750381916; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hXQ0rLrEsZDkkO0xDOFrK28pA119DtQt4oQHk7dYEkk=;
        b=duIQYMc6bDvIovYG4FZNCNN7tw4TvHyrwsCR5YDttGWPL/VnXNYEqP5ux7o+P5umWF
         t92a5UpGjVAY6LOREUs209bO/Zp4SoHXwRoI+iYa2SnfkaE72XCu1FfPCuxHnclqhCAo
         3WJfpXEK9MvOsEjcrNcO2Xxpw9B6xyRSRFj0q9gsXBTgBMSVyQO3kZUsipwkm8MT3z0l
         FwCvj7MesyoGOsQJobEgx9fjj/ZAs+0igor7G8bhmd/qicK1nOeldIv1IChQjh4xD6t0
         zI6ET8s8E/7Pgb+J2oUCZn4EPnq1I1/TGdIQkv0ByMlPhvxG2laSed/vlfFYQPZQIT+X
         KHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749777116; x=1750381916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hXQ0rLrEsZDkkO0xDOFrK28pA119DtQt4oQHk7dYEkk=;
        b=I3JrUyZyPqaODrgX1yeduTrj2IKsb7vaQmlJtaUNj1zmuVGXtCCmutDgdRLtbjYGVZ
         6bUulY5q7Y/evMwVtR6D31HouP1YlnaLMyHLVcAA0NsMjJKPGNcuhwgGFM/z6/Zqto3d
         NwRXN2B3ekdyu+XcPYQ6yKFzS20RMPI/jnKsKzPNBu1+oBmt62Urx8Z1UgTMH47PAdaP
         ezSObe4EDVCtm+Sc0SU5fssr3GzXVGdkRYnirOwpygMe5O9KKSknALU2IKG5+ouHBj94
         AzUAcWnh+vLDjuk4qgl58f1UsU0RkUzxVHKgUrKcYk8IrvIJE+MA+xEFSxoOBMSv5RgQ
         XxMw==
X-Forwarded-Encrypted: i=1; AJvYcCVRjIUDD80n2jzAKLLWZY0rZ8xa6piz2ALjAt/iSGXUaBYAds3SylrUZRNnU4Wih+/b3wAMni8BkAMCmA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywibubr35PrVjBU4kavxeK0ttsin0Z4uFKKb8PSgPWM0fvabRSm
	5SM9LghN3BBSj77m96odsuAxjoNjfWCwfNw215PLsStSjzLjAMJCCjQzQqd4Wpo8vxmhmTzfmJt
	gl72I
X-Gm-Gg: ASbGnctk9OWxWI8vID4mhx9U7o8C0KMKsstAQTMvDbbgagd20pZKX33I5fpFmiNtUpv
	9JdbD9COyWNWrLSQNsrYZT6TXhXrO1DbFqMZhEc11t8S6Jz/4fyMIxavBcI4wa4VdQfXPGDqL0r
	pmTpJxYUjLE5NFFCmZYCcxw/+Yi46hWZgWkBwmQpDKWRdjvo5gmmXfOMkaFSxF8kV7lAjsROVNR
	cYziBQUr9ZDqOlYHsS4eohG/U4cmIgPuCAe8l0DHlFoCpP1LItW47+9XEvIZbo7LaWA0TLYwLVe
	o2lx7UaYK0HMMtbUyqZS4dsuXfN+Y+tQTg3ZCTwMkyucH/+CTzrsHZQ0tgvtQMaH8WGdQLtzd9h
	Y6Wa0Assos3bQFeXl6JmK6ubV9PQhFo4=
X-Google-Smtp-Source: AGHT+IHLGWUc6QmwDBxYgPL11fCgmmDxgrSTZTWJDq5NM0vixs6NHFASZt4TXSVYr14kHaayK453+w==
X-Received: by 2002:a05:6870:ce88:b0:2ea:d491:eb45 with SMTP id 586e51a60fabf-2ead510a3fbmr744385fac.18.1749777115684;
        Thu, 12 Jun 2025 18:11:55 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2eac0c17211sm407685fac.18.2025.06.12.18.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 18:11:55 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v11 6/6] riscv: dts: spacemit: add reset support for the K1 SoC
Date: Thu, 12 Jun 2025 20:11:38 -0500
Message-ID: <20250613011139.1201702-7-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250613011139.1201702-1-elder@riscstar.com>
References: <20250613011139.1201702-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_181156_624631_3D6BA332 
X-CRM114-Status: UNSURE (   8.50  )
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
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index c0f8c5fca975d..de403bda2b878 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -346,6 +346,18 @@ soc {
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
 		syscon_apbc: system-controller@d4015000 {
 			compatible = "spacemit,k1-syscon-apbc";
 			reg = <0x0 0xd4015000 0x0 0x1000>;
@@ -553,6 +565,12 @@ clint: timer@e4000000 {
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
