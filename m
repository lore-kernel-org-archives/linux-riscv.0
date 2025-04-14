Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6968EC369B9
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 19:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RdkZM9zB4IqH6ehIFSkzyfRChVoayF18Dy9Msos524k=; b=Fs2z4in7aAdUZ5
	y7myDmPDanJ0rHXKdVQ8evTYaw3oL+UwgqDKrPMbH5pnxzvOLW+DYm1pk2599JF8Gp0iTox6t80ED
	JXGUUxjBDdnC0eGAm+tLu8st2Ri7W+6Xul2BBKf169hSPjnQD2hxld2J10rtqLmSsniRYaaX4oJ/L
	v5txtggqRYBBk18gJ3U8FuYr6Xlo1ce0Z1JF1bGwn+7OLDRjYOaNbnF3aoIztaMD5+5V7MPDS24fd
	DhESqxGOSeQrdIIC0+h1b3JmKiZRzhe99uQS26KLWuhjjjmY1iHSqG4pV2D4QIS5BsJnxzP9WulJm
	hlbs41beJ/GAOORddr9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4PN0-00000003JVw-18Uk;
	Mon, 14 Apr 2025 19:21:26 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4PJ4-00000003HlS-2qun
	for linux-riscv@lists.infradead.org;
	Mon, 14 Apr 2025 19:17:24 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3cfce97a3d9so14862475ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 14 Apr 2025 12:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744658241; x=1745263041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NOnX2shAz2EreIKfS+XNRjetpp9PVDTaCPEwF/lvRS8=;
        b=sA73XYeSGuCJ5r80skeLj7Lj4PIJuYjk/wSatnurxnf7sTT6v1QHlNkOeJOwPRyZZF
         iq+7No5Dq5iqqOS9qQ3yJuQap6hz45v2KUPOgt9hxT+qUM/AeGFGEexfeNon9x+d+m8I
         I2rChtD/sT8R3udj97q+Kq+hXRNng1x7tdFu4W5ivHuvMj7Lt+EfwmRh98tAK2H5jc8u
         gLdNa1OnUn7V9+t3yzZ2jM8VFeSjXdhuPbLChPkROGNwp9Q8ljTtnWcRESYzzvrRDuYl
         k3EiT70hTztWKZBBrjKFMzedAAWXnjKnIckkFIa4XHnRhUatlpgEBTsIIcpK2p0gZZJY
         pBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658241; x=1745263041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOnX2shAz2EreIKfS+XNRjetpp9PVDTaCPEwF/lvRS8=;
        b=vNYfv+YuZVXfdWvB/IpioPrnDjI27PV4zgsaRqFsrJjvPNo/+Ft/td/lx3A8R+oBC5
         7ND2nWZGGlxFlPL6rxTVI1tyeKUZghRbJ71vMAOoGLkZGGnt3ldjtjgeZcjUIEXktCqF
         OLr2fEBTpMhMpUaJHcj0IWueaX+3X+y1OvAU9f+SExLqQSYtTriPonxGWiSehn63Asy0
         ijM15FZGePXGc32qwUwgoBBgXK6LZnfxvSKMhyHSlpLl2RVuA+EjnRWLF6aGnheIdE+x
         COVo7oUoxdKCAf/PmvEru/WtKTWMzW+YxtMu6OlNQtlKfNXf+BSx24chTmQYusPrqolk
         a0BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUopDb/4NMA8cH/grmXGM/IVSflwZbySkv3B/EtxEXGC33ggyY82Tr6/ZdPZgLtGq4gf99Tf6WrSR9C4A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyitipmvfajl64QZgawe5GIg2cb7Hwo5MWocpRY3SkjBhi1Dr/8
	KSJWh3kwKQDRfx6G88eknOCNufjWiU/HGUVwXwm1tPvEwzLMMVlCTB9lz0T1B7k=
X-Gm-Gg: ASbGncuaOJClT2td5xIwA3TbZehMcV6ukv0x9LI5ocPnNxjb0Vrm4wnJb+E9IPz0tiE
	6tZCP6WP8soetQd5Sqh0twwd2pWxnNYi1jIqJhpWehsKqLD6lUzO4f0j0HOuJs+hK/FtKAE6jeL
	JXcAePeKFv+zZULGj3lo3LyquFBohVVcdVmSAQxowp+mMY0Dxq5ucBeqpvvrXUcYToCO8DluG3z
	o+rktXJtDe+bXUz0ezqHV/+BfoCbfyHCD5Uil/CI56O4ks/iRugseTeaEQ2Uqq1cu3wFthlKHQI
	CMTZEfYD9/+gEc9YO3xhfBfiIoFs0mfm0Udvy42vrzX5irCVbObCuhVhVJYC/qEZwOSoT1T4e/L
	8NWr/u8Edc51fIg==
X-Google-Smtp-Source: AGHT+IF+wewcSr2YJ4blAeH5OccXBibu/mClWnQWAdm112vnTse7zLtH44BvxSZA8DZrAtcKFRUvag==
X-Received: by 2002:a05:6e02:2145:b0:3d5:890b:d9df with SMTP id e9e14a558f8ab-3d7ec266fd2mr117489655ab.15.1744658241457;
        Mon, 14 Apr 2025 12:17:21 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f505e026d1sm2715662173.94.2025.04.14.12.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 12:17:21 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: p.zabel@pengutronix.de,
	dlan@gentoo.org,
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
Subject: [PATCH v4 0/7] clk: spacemit: add K1 reset support
Date: Mon, 14 Apr 2025 14:17:07 -0500
Message-ID: <20250414191715.2264758-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_121722_925897_A00112C2 
X-CRM114-Status: GOOD (  15.46  )
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

As before, this version is built upon the clock controller driver that
Haylen Chu has out for review (currently at v7):
  https://lore.kernel.org/lkml/20250412074423.38517-2-heylenay@4d2.org/

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v4

Between version 3 and version 4:
  - Now based on Haylen Chu's v7 clock code, built on v6.15-rc2.
  - Added Krzysztof's Reviewed-by on the first patch.

Here is version 2 of this series.
  https://lore.kernel.org/lkml/20250409211741.1171584-1-elder@riscstar.com/

Between version 2 and version 3 there was no feedback, however:
  - Haylen posted v6 of the clock series, and it included some changes
    that affected the logic in this reset code.
  - I was informed that defining CCU nodes without any clocks led to
    warnings about "clocks" being a required property when running
    "make dtbs_check".  For that reason, I made clock properties
    optional for reset-only CCU nodes.
  - This code is now based on v6.15-rc1, which includes a few commits
    that were listed as dependencies previously.

Here is version 2 of this series.
  https://lore.kernel.org/lkml/20250328210233.1077035-1-elder@riscstar.com/

Between version 1 and version 2:
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

Here is the first version of this series.
  https://lore.kernel.org/lkml/20250321151831.623575-1-elder@riscstar.com/

					-Alex

Alex Elder (7):
  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
  clk: spacemit: rename spacemit_ccu_data fields
  clk: spacemit: add reset controller support
  clk: spacemit: define existing syscon resets
  clk: spacemit: make clocks optional
  clk: spacemit: define new syscons with only resets
  riscv: dts: spacemit: add reset support for the K1 SoC

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 +
 drivers/clk/spacemit/ccu-k1.c                 | 330 +++++++++++++++++-
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 +++++++
 4 files changed, 482 insertions(+), 23 deletions(-)


base-commit: 846ce0a9d3e86830a3c6253c3b62104b369d6a95
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
