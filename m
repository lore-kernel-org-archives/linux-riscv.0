Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D8EC3ABCC
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 12:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/vzjuce2Z440w5Do9a3GpNc2bXVvqwBcxQKw6AU2bX0=; b=pAocR3+Xq517CP
	67Ei0h5hCogdmSYEjBppfw9DAVTnqxOv9VDecQLqF+hV92DH7E+ffrw5pODy9lSW81uEbpEIoiGJi
	9UKKHTpEPUZt/to4tmD/7Kw/Lxyh21wyfzcfArhFw9ZNp8p6rm5JHGWQdazikkXDnv5613fLEK2x3
	unx6n/Q32Gkd6Oi5XtS9TmFnFs9SBrRCyqp3fDwgMwkl7w6QKbn33kj98+p2ywxUdc8ZWAJB5Gmuk
	4u6rDrKgbih4cRoGOyHIBtwJpq+t5C9x4N4V0kiOmcifhHfN6GOJU+x9sHnrB2Il1XPQzlFU6Lioo
	4NzmqxqxgX9GqBAVcG5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDMlL-00000003ZOq-1L2O;
	Fri, 09 May 2025 12:23:35 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDLmR-00000003Por-12E0
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 11:20:41 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-85b4170f1f5so66941839f.3
        for <linux-riscv@lists.infradead.org>; Fri, 09 May 2025 04:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746789636; x=1747394436; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NTSX0/tw8NEx2HZiz9FcVkfctrtBy+rS4Bs93fohJKY=;
        b=jtogjFCOxidJ9lWa0jzv8Jctbm7k1qKDUDgkjnQ3ai7VLH8X7+3LQjQbxbt8V7OCtH
         5WtJn9XqVZOm0u5taQvCY6xUQ8NY5JnQ11pKU5Y2IF5x/LiUU3tVM0pYJgKDoQJrLyJT
         n7S4MAsWpRhgHoo0CNL0N5xh77LmD++jogflDk8FBiTk/+w1csFMfpj4KEK0Sb4YGoKp
         fuW8zLRzypKWxTh5FXVbLgxGKFsxC1x2zOk2HYl/m2AKVsmbsr4xhr2OAXefCttN8JvU
         37C6rgkSAAoiUqOG8yuJPzYDrwIPdEVlKgqXQ7ADHuOWtqkrkExOeCHN/bF+liAT/S6w
         yRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746789636; x=1747394436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NTSX0/tw8NEx2HZiz9FcVkfctrtBy+rS4Bs93fohJKY=;
        b=JD7Qi8WxruUHA5B60Y3lzUqbygMvoAvN5/B73BX0C0shIy8c4ul8n4nPR1elGM0/bk
         3M2uLj52HaeceWNZu6lKKm5INw94z/RdPMSLlW49KvbQEToTSDof2ZyuXjOBr8OT8uzQ
         wfyIvMSIeMje/ZRPB6TflkPOX0itUPZkia5Z5fOfThDodM0uF/cEvKeUnmLP9kKrdMFl
         4SUUxT0M03E2omKvl0t4+NaHO5FiOf1fnW3FyJNaGb7F2Po9ZbYAS+jCFEwq9nSGGVjY
         Liy6r+6IwjaluGtJuxL0i6JXB4mBTk1cLuQn7cgbMDZbB/F89nh+igomTD+FpuQKi5Mc
         orTg==
X-Forwarded-Encrypted: i=1; AJvYcCWAFLP2JVqw6qJOss/z54HizVey9JgPAhmUnPdZTHX8DnJxdVkNCMArFPcH9OZYNXuvDM2qR0K9ili9Jg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxqGGZR7LzCw79AxKty3VRg2C5q1EXYM58bZYOdT5l7Upucb9IH
	LFAaIbP8cEtf4/3GzXcZHhcEfnQ8IJfglcp7izcc0Tmdaw0gt6D0j98g2XWMQJA=
X-Gm-Gg: ASbGncvH8M1FW7Y3EdxZa1mnXJgX4QAXk4eEECqOOWguetg0F+UJs3R4hA8MJ/tWIrZ
	PrF2OFQlj58EHsooFkMP5iLwgcQZCR+RFPRuRGQjIPKTfj1SC9c8zFYjW9VqTSuuFTNGfrgpDIp
	nojGcPFJRjKA56sF4pjV2B6RkCOlEZ2tuxU9t8Gpn7gI7N653UHp24R1yu9Rg/lobyozf6wWhap
	LpqoObSY2V5I83wfVGUlV+xVPNvU5pCbiRCE0synklZFd0ehjoW/XM9Bc6Nl+cEJAmZEMYepbEN
	9GkvRyGUiungFzlidmn0loWVtwFqBP59kyWJT/Kq+qzpkNylYkYd4MorJZlggsoOY3Dy/hDsWWN
	o2DNHRALgsqo0sg==
X-Google-Smtp-Source: AGHT+IF05PBHHDZrwWQcLeXCbxDAB8MCaPu4N0jfY4wA0OvXddQCJwebAgEaZT9GlDpW3ltbOgzKXQ==
X-Received: by 2002:a05:6e02:2489:b0:3da:6f46:5c1a with SMTP id e9e14a558f8ab-3da7e1e1b12mr36660425ab.2.1746789636400;
        Fri, 09 May 2025 04:20:36 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da7e10549fsm5136325ab.23.2025.05.09.04.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:20:35 -0700 (PDT)
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
Subject: [PATCH v8 0/6] reset: spacemit: add K1 reset support
Date: Fri,  9 May 2025 06:20:25 -0500
Message-ID: <20250509112032.2980811-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_042039_480846_DEB9E468 
X-CRM114-Status: GOOD (  23.97  )
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

The only difference from v7 is that the structure containing
the auxiliary device struct is now allocated using kzalloc().
Previously devm_kzalloc() was used, passing the parent device
pointer as its first argument, and as Haylen pointed out, it
was being (doubly) freed in the auxiliary device release
function.  Everything else is essentially identical to v7.

This series is based on the "for-next" branch in the SpacemiT
repository:
  https://github.com/spacemit-com/linux/tree/for-next

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v8

					-Alex

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
 drivers/clk/spacemit/ccu-k1.c                 | 225 +++++++------
 drivers/reset/Kconfig                         |   9 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-spacemit.c                | 297 ++++++++++++++++++
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 ++++++++
 include/soc/spacemit/k1-syscon.h              | 160 ++++++++++
 9 files changed, 741 insertions(+), 127 deletions(-)
 create mode 100644 drivers/reset/reset-spacemit.c
 create mode 100644 include/soc/spacemit/k1-syscon.h


base-commit: cb9c3aeae509b36afbdf46942a7a0a0dfc856ce7
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
