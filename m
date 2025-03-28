Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BC2DC36014
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 21:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k53ehrwMhTr/ATEOUnKvy0FcixJO3Z5zrpL83IoNyy0=; b=KFy2OQTii0YUpL
	KAWZTZpop6Yo00xaMyJOv6X3CWekx/+uGZtspzfx/951/ZK3BI7ct+bM8nGI2Xw+MemVuY6kI8qdn
	zCgMG2JSK0TuR9u0FEpFBv+3o4Ow89wmYKEz3olBQoUJ8CnQviVx8nGbeY9UhQY4DHlQ0HMjBL4ED
	6DS48gJMBWdpaZz83YiOVNYwVIrD4abg4kFrjXBXYNQS5H1Tl040Vh1R7Ce/71lwNq2AGAOaG/vIT
	XTKa92JOZGNHgiSo0FsSMNREALNNm8RwHKWPKYQ+1o6dzx1hGyVhuflJCV2lsrbkSTN1Pgf9eqLJA
	ntLrdpbs1Nti1X1h4gug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyGqf-0000000EJ3f-1bqs;
	Fri, 28 Mar 2025 21:02:41 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyGqc-0000000EJ2u-24Uf
	for linux-riscv@lists.infradead.org;
	Fri, 28 Mar 2025 21:02:40 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3d589ed2b47so7633855ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 28 Mar 2025 14:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1743195757; x=1743800557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VHJYMx5Ny8sSHNURLwOrkk6ILyuNYFJwUzbCpGHWiDs=;
        b=lPjVU7Q8R30keqAjPc1oyW+h0FBn4eZC4hV+pYHUyhDLwgC8TJgXqvI5T5VL+wQ26B
         Vfu6l7sP3CiXiaNDKx379f9ORzgSfzirALVFLOT3jAGzTKa3lU7tyBm3/5nh5DKICxvh
         TJTRPrjYA/Z5iJhEykWNK0sK4iEY2BVG6wXePxixUMuy+BRRz0ME3Nhx7xOsNsqrVX7/
         HoSHKzyigK5BdgGV0r213iAWcD3GHumlHn8lTfeAFwMNG1McAUrwYXeCfpND2wW7F95V
         gGNM10m+IvJK7NxKzasWveLRs62Y21YWQVC5gl2B72BVsXKRAYENADGwsJppUN2i7Z2p
         GdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743195757; x=1743800557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VHJYMx5Ny8sSHNURLwOrkk6ILyuNYFJwUzbCpGHWiDs=;
        b=oHfNjEV90fOSMjeLqdooD37c1FSQJMydhjENbxkgRxRi3kmrbW9KIhYwAfzNI6DfSl
         ctb8r2G0YSV18k7jKvhztppY10ikb3C1yJwTwYdpUxaXubtC4AUBOpVDcU2ZNhemQd25
         8Rg7x3uyPgRNwkc6uF7mAnauaJE41NtsGSLNN3JiKcMMUTVSnyK0sMJAUQMB/4XP7U55
         u2gaCW0x1tiUbtCQXCAT5YwX9mziEu5BdeMEmOMoSzZuswFZUTnoyj2HtLhs3RWu38qd
         B8HadFo2aC/+/SQeWC0otVjbqJ7MToMqhokDgHiahCaLhVuFbiCWERa1Zz7QN+trdp1X
         n5yw==
X-Forwarded-Encrypted: i=1; AJvYcCWE8otZDfN0ZVXwwwXNlvkcuNTiL9VuiQ0WiMTz2Wp+91k0f0U564AXqo5Loc+jJc7b/QhW/Pxjn36Xow==@lists.infradead.org
X-Gm-Message-State: AOJu0YwjVFT5/47Bl0BWi6g/l5ur4NzqrqLNskY+lgTPJJwdabEym6S0
	mkxsQH1+RRmvTsNC4uku2zWCErbl7rXP2O1SWWiHxua/NPQa0WOSqYGEpiNUsbE=
X-Gm-Gg: ASbGncsyjoS4CfyDeP89qJZ59KBA1DAnP1QnsIVBngbvm3v82zsEX6OeEjSisyqt9jX
	IiVT/8sbYKgDTiB4socs4F399CXE2rZSo4wMe8fRNd+DoA1/ReTerNAy7xpemfR4sNBYgbuIsmq
	eVD+rhVH+c9o7lsW99HCbpIUG9c39e89wSp7aUgmUVoskpS6ojIPn5uKKypvSGxxlZ4UiU1e2na
	Lh6fwy+oCUfVYtbU+a8jck2vQ2LlrIANdva8GFi/e+iR0OvPFBeZ5CIe1Ut2B0bp7tF867dXrpE
	AHsN47Eic3hB2SbS+ygMKJnBVIRcRZWC05IgDB4FrtCyzm5k4X5cmrjX+c6mHU0cJBCafy0EYFJ
	QboCW5kO2iK+DTpe7iA==
X-Google-Smtp-Source: AGHT+IHk48TQj5LU1BljWFGSUTe9vm5Iy8BdohARUm7BRbpRyYRCt5Yc1AT2nUjsk81V+iVQCDA4Kw==
X-Received: by 2002:a05:6e02:260a:b0:3d5:d743:8089 with SMTP id e9e14a558f8ab-3d5e091344amr12125865ab.7.1743195757226;
        Fri, 28 Mar 2025 14:02:37 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d5d5a74286sm6769405ab.39.2025.03.28.14.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 14:02:36 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: p.zabel@pengutronix.de,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	guodong@riscstar.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	spacemit@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] clk: spacemit: add K1 reset support
Date: Fri, 28 Mar 2025 16:02:25 -0500
Message-ID: <20250328210233.1077035-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_140238_800308_99BE7C76 
X-CRM114-Status: GOOD (  15.63  )
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

This series adds reset controller support for the SpacemiT K1 SoC.
It is based on Linux v6.14.  This version of the series is updated
in reponse to review feedback from the initial version:
  https://lore.kernel.org/lkml/20250321151831.623575-1-elder@riscstar.com/

As before, this version is built upon the clock controller driver that
Haylen Chu currently has out for review (currently at v5):
  https://lore.kernel.org/lkml/20250306175750.22480-2-heylenay@4d2.org/

It also depends on two commits that will land in v6.15: 5728c92ae1123
("mfd: syscon: Restore device_node_to_regmap() for non-syscon nodes")
and 7ff4faba63571 ("pinctrl: spacemit: enable config option").

The basic content of the patches has not changed since last time, so
I won't repeat the explantion of each here.

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v2

Since last time:
  - Added Rob's Reviewed-by tag on the first patch
  - Renamed the of_match_data data type (and one or two other symbols) to
    use "spacemit" rather than "k1".
  - Replaced the abbreviated "rst" or "RST" in names of newly-defined
    sympols with "reset" or "RESET" respectively.
  - Eliminated rcdev_to_controller(), which was only used once.
  - Changed a function that unsafely did a read/modify/write of a register
    to use regmap_update_bits() instead as suggested by Haylen.
  - Eliminated a null check for a pointer known to be non-null.
  - Reordered the assignment of reset controller device fields.
  - Added a "sentinel" comment as requested by Yixun.
  - Updated to be based on Linux v6.14 final.

Note that I did *not* change anything related to the "remote CPU" (RCPU
and RCPU2) resets (and clocks).

					-Alex

Alex Elder (7):
  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
  clk: spacemit: define struct spacemit_ccu_data
  clk: spacemit: add reset controller support
  clk: spacemit: define existing syscon resets
  clk: spacemit: make clocks optional
  clk: spacemit: define new syscons with only resets
  riscv: dts: spacemit: add reset support for the K1 SoC

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  13 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 +
 drivers/clk/spacemit/ccu-k1.c                 | 380 +++++++++++++++++-
 include/dt-bindings/clock/spacemit,k1-ccu.h   | 128 ++++++
 4 files changed, 521 insertions(+), 18 deletions(-)

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
