Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9D5C3ABCC
	for <linux-riscv@archiver.kernel.org>; Mon, 12 May 2025 18:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f+F6BRQtrr95kg0MztY/Dyu95cJ48ZzGEFkAO8iwGIQ=; b=VPUpstpj6J9pPd
	sj4cu5ff34ci70gmqO2EFwF3hzP7bozqAT6IbJquOHmssyKEj4Hmo1NeeALxGoeLmBgDMnJ7SGV5B
	n6ULyGWUXjYPhnzlOmiL6AU6F1FsPNzk1jr+dtlfJlumXujLPMBJ+YVPKyJ3mUIMHmPkjw/J06NYi
	CXccVISNC5TWAql6hPw8t3+crhowJSnZaY0eRDlhv0y4Ikf5CS5b8DcU037Erdu+9h9UieyaAhL5U
	Yf2lxxidWNYfsK9rlpvZPlEwOz9yzt//Yr0a4Cc9SXfCYmtAKLWIu28OZTSAtGg0n9LD6WiK5LV2Y
	hBNZZurmAoc+PnClFdOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXx3-0000000AOqA-1O21;
	Mon, 12 May 2025 18:32:33 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEXwn-0000000AOkk-43fx
	for linux-riscv@lists.infradead.org;
	Mon, 12 May 2025 18:32:19 +0000
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3d93f4fe5baso17960815ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 May 2025 11:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1747074737; x=1747679537; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H5sF5S4WoA46QFbSi1L1CMmO0LFLi0JLWxGsdZ5Mz7U=;
        b=SURhIlgOYE5hMMsCgElefLB8TC+r2Mq6ZzXDcPtb4Qyh7kCyKr5ckO/JKcbyl0N3sf
         N5XNVS2FwwHzABasjVlVjbTOlfj8Vyphl6mrnhsKK6zUQYRTcYLyTCSYKwfhKIa2mJz2
         roTUQpwWrocB7UIBrFGCttq6fscoS8IV6k8T0O1d7BNcEyEPwDfcNYEae0kwgr6QYcu7
         o4168Q1yiQko8+xqfPyl05kWcsg/OhrslJkbgE5afHmpYPXeGlx5Tigmlt3qORElYCcJ
         jrXJ/6oUs5Gnwv1MRWctGLMCp1X2zSQuiMnN2zA1BaXqAzMUDV2mabGHg395KRDTF71G
         6qoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747074737; x=1747679537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H5sF5S4WoA46QFbSi1L1CMmO0LFLi0JLWxGsdZ5Mz7U=;
        b=Fon5vHkZVEEUqv+14JYeqrBrlV1W5bgT41Hqb22WUAtefaEQVgVXyNyWKrMtVnnmOt
         VAr+al1SlOH9fipiutK0iIXp8s/WI3JU31J/uuuF/MrKQ/QfCjeIvwhkzENUCv1mGiWu
         CGqtycJcQZEfIDU/lP/iWvU6i37LZ2dOsRsAwsEAPy3ZzyJXFGa2LEFQAxyZ5EMEWvXJ
         1PpPAZNQL8YJNHM1Hs8/6N1bHcjHY2EkQ3In9e4K59NITEOGmyE4aXCUKHERFTDcJIQk
         6/k0nIzF25XVDF+HPMp3EyVwb657L8ayG/nNNaDnhk8HL0nBEH8U6n3AwYliEqyy8aC7
         /moQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsSPG0vUV65Gjc0aHBeT89KUasjh0q4jYmgICD3EWjipUzhQyhgXASm7ed7Vew70OjaisWh9D2FECv8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMeAePLNfwYgsGxksqlShStyaeUQhIVxnqZvcdxN2VWmoV0rYO
	HsyquSqeOMONnPb+MF48LWCL3U5kxhyJMEVaezYRCrsCLiAF5QWz8Bi4pVrFRK0=
X-Gm-Gg: ASbGncsNNmlsbWRMT5k21bTCwFJHKfYDLs3rVY/Cuj9XdrCEudnHoVtVLpxrW+kn9ge
	rbXy4U9YVv5wU9k7ADFLhaoFhyudXABr2YBD+1URj4eN2ZgPg87x6SDw3ldI0p8I0Y1oMPrCojo
	+kOpqvBsLD3b+PDjsCWLmNGAGd9qfftfy9nzWIA0DbjGVdhGSyFlChfuAsG7b74GLPdUTs8gi+Z
	HDzjGNXDf3E7eBQDn4wR+Id/UsvJ5gpZquCPNeG29i2/PEyj5GWEndHBX1xlsLJ+Db67v2I0rsO
	2LiRU2Sgh0YXGDuYRn6gdi8rqbU+4DK9aNkOHJD73JtxPGrOLpDRX0jvhDwuMUB5ewEprJsSu4Z
	raRHdLzTcnwntOfM2lwe5ZLyN
X-Google-Smtp-Source: AGHT+IH8SMFCBxxWn3abIuKGOB7o7zwQCx8+T8NAJEP1pyotvXX4Tn/Jp/UkbpGJ3ju1m6yqyuZcVA==
X-Received: by 2002:a05:6e02:1fc5:b0:3d6:cbed:3305 with SMTP id e9e14a558f8ab-3da7e1e7608mr156233785ab.10.1747074736564;
        Mon, 12 May 2025 11:32:16 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa22496e9fsm1740333173.11.2025.05.12.11.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 11:32:16 -0700 (PDT)
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
Subject: [PATCH v9 0/6] reset: spacemit: add K1 reset support
Date: Mon, 12 May 2025 13:32:05 -0500
Message-ID: <20250512183212.3465963-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_113218_273164_199DD683 
X-CRM114-Status: GOOD (  23.60  )
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
A SpacemiT reset controller is implemented as an auxiliary device
associated with a clock controller (CCU).  A new header file
holds definitions used by both the clock and reset drivers.

This code builds upon the clock controller driver from Haylen Chu.

This version uses ida_alloc() to assign a unique auxiliary device
ID rather than the value of an ever-incrementing static variable.

This series is based on the "for-next" branch in the SpacemiT
repository:
  https://github.com/spacemit-com/linux/tree/for-next

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v9

					-Alex

Between version 8 and version 9:
  - The auxiliary device ID is now allocated using ida_alloc(), to
    avoid colliding device IDs, as suggested by Philipp.

Here is version 8 of this series.
  https://lore.kernel.org/lkml/20250509112032.2980811-1-elder@riscstar.com/

Between version 7 and version 8:
  - The structure containing the auxiliary device is now allocated
    using kzalloc().  That means its lifetime is not tied to the
    parent device, and auxiliary device's release function is
    correct in freeing the structure.

Here is version 7 of this series.
  https://lore.kernel.org/lkml/20250508195409.2962633-1-elder@riscstar.com/

Between version 6 and version 7:
  - The new shared header file is now named "k1-syscon.h" (suggested
    by Haylen Chu)
  - The SPACEMIT_CCU_K1 config option has been removed (suggested
    by Philipp Zabel)
  - The SPACEMIT_CCU config option is now tristate, and selects
    AUXILIARY_BUS (suggested by Haylen Chu)
  - All code is concentrated into a single file "reset-spacemit.c"
    rather than in a directory (suggested by Philipp Zabel)
  - A bogus return value has been fixed, and a few irrelevant comments
    have been removed (suggested by Philipp Zabel)
  - MODULE_AUTHOR(), MODULE_DESCRIPTION(), and MODULE_LICENSE() are
    now supplied (suggested by Haylen Chu)

Here is version 6 of this series.
  https://lore.kernel.org/lkml/20250506210638.2800228-1-elder@riscstar.com/

Between version 5 and version 6:
  - Reworked the code to use the auxiliary device framework.
  - Moved the code supporting reset under drivers/reset/spacemit.
  - Created a new header file shared by reset and clock.
  - Separated generic from SoC-specific code in the reset driver.
  - Dropped two Reviewed-by tags.

Here is version 5 of this series.
  https://lore.kernel.org/lkml/20250418145401.2603648-1-elder@riscstar.com/

Between version 4 and version 5:
  - Added Haylen's Reviewed-by on the second patch.
  - Added Philipp's Reviewed-by on the third patch.
  - In patch 4, added a const qualifier to some structures, and removed
    parentheses surrounding integer constants, as suggested by Philipp
  - Now based on the SpacemiT for-next branch

Here is version 4 of this series.
  https://lore.kernel.org/lkml/20250414191715.2264758-1-elder@riscstar.com/

Between version 3 and version 4:
  - Now based on Haylen Chu's v7 clock code, built on v6.15-rc2.
  - Added Krzysztof's Reviewed-by on the first patch.

Here is version 3 of this series.
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


Alex Elder (6):
  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
  soc: spacemit: create a header for clock/reset registers
  clk: spacemit: set up reset auxiliary devices
  reset: spacemit: add support for SpacemiT CCU resets
  reset: spacemit: define three more CCUs
  riscv: dts: spacemit: add reset support for the K1 SoC

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 ++
 drivers/clk/spacemit/Kconfig                  |   1 +
 drivers/clk/spacemit/ccu-k1.c                 | 239 +++++++-------
 drivers/reset/Kconfig                         |   9 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-spacemit.c                | 297 ++++++++++++++++++
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 ++++++++
 include/soc/spacemit/k1-syscon.h              | 160 ++++++++++
 9 files changed, 755 insertions(+), 127 deletions(-)
 create mode 100644 drivers/reset/reset-spacemit.c
 create mode 100644 include/soc/spacemit/k1-syscon.h


base-commit: 3f7ca16338830d8726b0b38458b2916b3b303aad
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
