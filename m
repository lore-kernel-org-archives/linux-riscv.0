Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88072C3ABBE
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 19:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ia1m9wugUYjxCNDzDf8Tb5av6JkmIXk1d2LAVhb/VPQ=; b=RH03asMdjrtF22
	RzOzc8g7Ri6tM+576OEE/yxM/1V6isVkndJqy5CVZS+upKq33IQn3qiW0KjpbUSwmY56x4Jg4cZ7B
	O2jcdclqGoIIx9Vv9kISYsQDYOvbp5DcTe3glAanuyjMlBURL2GRgBhUnJvz9I3yJFrDReqMY0EVN
	N5/oF9DCUcbiRN0g7EYqhlByk6huqODrO9D8HAerVsU21IgtjhvILHIROxPyCKGgr61DkRGI633zl
	jNR+4Cp4yCwvWkw5oWdiR24WuzsMhmRb3MWcDtwziVbKEiKsCeR6A1jp9JMZk+yxP0Jdnue+dlGVK
	xxTy6CxAmKKS5qHLUTGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD7Jy-00000001hDH-0N5J;
	Thu, 08 May 2025 19:54:18 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD7Ju-00000001hCV-43V3
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 19:54:16 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-8616987c261so46531239f.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 May 2025 12:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746734054; x=1747338854; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5lLkvBZF0TFGQibyx4RWv5E5ajzDClCRIu3CVnS98Us=;
        b=gmztZ/dcZYixv5k14vOVF88p3gef+7iNLZWCUBoK2npWQvlLA/6LpOvcAfSBBsjvYD
         iprKWU70UjipyJ39MONr4cH75mM1uv30VDzx8Lv7cfv+oTYhemGg0mO9lzLjX9j9Dnqe
         skUYefHcV+I5Q6htNfmlaxS0WAxFdBZ2Bh6HzA+LhoJFkvZxZbDfzZrpaIwsmr3yZ4AA
         Ra7exQbX9Rfvc4dMzvVh/gw0nRyAaF6LMazjnfyr7gGFuEFwAg96uABpH7iavQtlLtIM
         65wCQcPvdwXHeMT7R9pm4uLG6c+RAq6UlisfLDtH1mw/ZRQmXa65/ti21UOhdg+CK18M
         75qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746734054; x=1747338854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5lLkvBZF0TFGQibyx4RWv5E5ajzDClCRIu3CVnS98Us=;
        b=Cuntcxr2ZnEYuzs5PpQNd97/A6hFqE0gUkToUclDHl+WNj4ca5Nou2FRGAua/b3BoW
         C6eWFeVquv+giDcz6GYGj+20Q4ov7Hz8HhNGHm3jfP7e6yGhMQTa4ovKzbZZrUCKfkM/
         +BsXURmgXCLScIgjNRZ18ThHdT5NUvs+jjrlaOb31ok1EwzBVOW8tu55mQX4U7c5HLNn
         xSZ2nb7RFCKBLxG9Dh9rPQ55Hqb+UHhrJB0q4N3PGGOL4khTOT+U4wrA1Cb0QMWuKjZP
         EbdhjYF839k856QiRLdGdRKoRp7CTh8gAPVnY1CZQ5unYcVLhLgyY3/ddZEDBlDKEspp
         df2g==
X-Forwarded-Encrypted: i=1; AJvYcCVP1QUhuGl67HeTuzxkePNPwgSoTbPLzfRKJCWTQyfpa5d9fg896RNl8W6B1NaIt1MQRkVO61fBVt857g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/gXZsA3a7C++1HTpbMicPPSCL6PDWRVVeGW1uWqAzn9D4SopV
	oBgRHGA7EeXwEhJ1icy1Bi8eR+MBbLb2K0KK0Rlof8Ds9sZxPK8zNFlm9OhabxQ=
X-Gm-Gg: ASbGnctZOJmE4ahlaKUSRn5kgM5ONh+xJsMPdq8zkMnp4JoK605hR9uHIpjOc2qHSCm
	HGE0/+HrTWubZ7YiOCjBv43OEcjb6JzzG4WdwgKJgAtFWPBTBc7fNEeAaRR+5TLR5Z3JcP18d45
	kxgJR10n+1zb5iDYk4NjI1i5U89cdiwqZgrDwN/V/Ccqo/lr/i/lYxHMkTjinDtZaGXROgtDjuq
	eOSIk45LP3st/Sg5UPCCJJkR42RyVO/mYBMLcc1nQQ5J0vH25vddfyDvJ/T6FY2sB7KNS3dFQsB
	NbHF6kwWQEQfYq3W6g1/XWaj2N4g4GWsaxXrQcPbM59mMZQyYKdXauLHCTaq4zjTbIzf2kJpK0S
	Oxp5XS1Vb1GXXAw==
X-Google-Smtp-Source: AGHT+IH5+4NgW3qpid/j20Fj9qORDUdDDPvUwcmU1QEIhjjCmPh4Q+zFzAEnHPWUc/XIcbJzlBPzLA==
X-Received: by 2002:a05:6602:2c0d:b0:864:627a:3d85 with SMTP id ca18e2360f4ac-8676362d62emr131255239f.11.1746734053891;
        Thu, 08 May 2025 12:54:13 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4fa226850e1sm93983173.134.2025.05.08.12.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 12:54:13 -0700 (PDT)
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
Subject: [PATCH v7 0/6] clk: spacemit: add K1 reset support
Date: Thu,  8 May 2025 14:54:02 -0500
Message-ID: <20250508195409.2962633-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_125415_272506_016076EA 
X-CRM114-Status: GOOD (  23.45  )
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
This version differs from v6 in that all of the code is collected
into a single source file, "reset-spacemit.c", as suggested by
Philipp Zabel.  Other suggestions (detailed in the patches that
follow) have also been incorporated.  The first patch is identical
to what was sent previously.

This series is based on the "for-next" branch in the SpacemiT
repository:
  https://github.com/spacemit-com/linux/tree/for-next

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v7

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

					-Alex

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
 drivers/clk/spacemit/ccu-k1.c                 | 224 ++++++-------
 drivers/reset/Kconfig                         |   9 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-spacemit.c                | 297 ++++++++++++++++++
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 ++++++++
 include/soc/spacemit/k1-syscon.h              | 160 ++++++++++
 9 files changed, 740 insertions(+), 127 deletions(-)
 create mode 100644 drivers/reset/reset-spacemit.c
 create mode 100644 include/soc/spacemit/k1-syscon.h


base-commit: cb9c3aeae509b36afbdf46942a7a0a0dfc856ce7
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
