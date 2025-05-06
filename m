Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E372EC3ABBC
	for <linux-riscv@archiver.kernel.org>; Wed,  7 May 2025 02:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MgA1TAk5jgQwkcmqAjQg1qkvWfQqTH+k2NDTgtL/FhQ=; b=dQTo6xp8VNuCcT
	2oaCfScIclIQ9vvhyo5EsZUhts1cQ1z5X7TgpuHvnADfhO3RwMH6UNa9uCAMSDJ/w8g06j4GPlWuE
	Ybeu8sh0JZ+Ke/VovgAmXCvPtyQS9r1QOTsQjaVyXekTVoJdb8F22/oUcVro9bcn/2C2cwwY9GWei
	m4VHPTE98PskOsf63mQs8tzaYn9zbFeHg/zCBWH9gTpgctnxUhUTD26cFCH+dCKaCNqDSiv8fjtOm
	EgF2WUacC6T3XLAbiD95DK1OIywX4EjfmU18snPNxIifsm7PcxZ1dTgfD8TCXxTbrOpfRr9Yd0TB5
	8BGBXEULCKmhk9BZZHMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUb8-0000000DvVb-2ZS3;
	Wed, 07 May 2025 02:33:26 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCPUz-0000000DPHg-0ZsD
	for linux-riscv@lists.infradead.org;
	Tue, 06 May 2025 21:06:46 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-85dac9728cdso170477839f.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 May 2025 14:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746565604; x=1747170404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ctQSvVihHY5dWsU4MBBsIjj+H5evIdxG47g04dOZUkE=;
        b=zYL/eGV3CloUOCViAO2vH8EiJshkl4H3Ckd2KSUzkr9BbHFT74Chij5yESe8ocJNDF
         /GJs0Awiiuy/bkbKxTd5Ni9+I7ll9fh/4vwcsKNQDVb28/07lXCSLx9V18f1CHpCRq14
         bD5pnivGX1tfJxtYYpjnWtR23O49men4JRM1LalDFBYRYIQeEt0bVBUQk/SAIbsdaYJ5
         orLRVny8a8JXjId4oNxbWpPSF1k1epe+EUk6/RAlyD0PFixuVU7wAHlTmald9/ClNigg
         srdQIABjfmErP7o4pAoOFtMmL+7xXafMUnzVAETAdtiiDe/ma3wAXZ4dISfUbN8ZZYqI
         6tGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746565604; x=1747170404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ctQSvVihHY5dWsU4MBBsIjj+H5evIdxG47g04dOZUkE=;
        b=ouKcd8wbFjTskv8pydNB0ezLJVpvkOqKpOdNz7KXxSFU3MExqQx7OEsT1bShAI8Ick
         tACwThwofSq1lXwSV7JUCMjtdKk5cdgfZ5Q7Sp1ZRzg0SeniDqDPGkScq8BlFxHHfuiK
         OxEQNr/gB0H66I4IobiU3jqfB686cdauynw/Q7uIrUB0X9eSCwjAxbVO3WgRIP90asuL
         J2+hBZZem0zUIVgacHXs7i6EsNDeDuT+7MNt92ND0ogbtpueFIDrqvlT/DP2nUeRVzHG
         ExeGhRcgd0bnoFKFgbdjLw/VINNjg4tYfIjXT71V67X1ubmO1plqzaZXekhjV9m4fIkm
         mBiQ==
X-Forwarded-Encrypted: i=1; AJvYcCX9U9jrhE/G920nNDHIKpTKdvsofTNLfUlSCG+xZ1mIUivPk0KFSloUuCVpgCNWdfz42RWgUf1Cm59lew==@lists.infradead.org
X-Gm-Message-State: AOJu0YyA7yYsOvxTThgP+J0BZvG3egDG4XlihrLLrwMUPbSZgNCLlwo2
	VtWv7ioQ3xhC5BW/0HjmgoA6BQmWNfq60Yl5mf+iz6iWUeULVqkY08bVyr7inkw=
X-Gm-Gg: ASbGncuSXWRctMzrXkJngqV81PUFcPmYYGg/Qar7tzwCdHNpIcip2P8BGuIWXssM51D
	5nw8UGQ76hzrAqmSQ6J7jq05Qyq8+La4xJRlvbEq2z/Fcor1/tV+XfOvT8CdE10aPTjTNgTuOLQ
	ehB+Nm8OlSeVeoSvn48RfG5qSvx8B40cC+w+ZRId+MNcbR0dqKOS9gkXsOh7BYhOdMNoyc9SjGk
	4SmCBQYYFm0b8OiWEDTA2y2/W3noyUuULjVfO30dSDuzpahLjjB8b9N1e/GujqvzEgeZ6TFexWy
	YhUuANpoFdYpheDVegeMXjeT37kcYtnN0KScYY5r92GIa0IES4UpA0DyiUZepmLqb9DXY7BWi1M
	lGfeLvXGw+8KeGg==
X-Google-Smtp-Source: AGHT+IHmLwR/RdxY6gKxsVffp2BFaQw1Bk6UdfmCxeRt2RRt1uEhRJSBeWBP2YNWT9ppTywhStu3jQ==
X-Received: by 2002:a05:6602:6b07:b0:85b:41cc:f709 with SMTP id ca18e2360f4ac-86747413db3mr136372539f.14.1746565603723;
        Tue, 06 May 2025 14:06:43 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f88aa588basm2419559173.79.2025.05.06.14.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 14:06:43 -0700 (PDT)
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
Subject: [PATCH v6 0/6] clk: spacemit: add K1 reset support
Date: Tue,  6 May 2025 16:06:31 -0500
Message-ID: <20250506210638.2800228-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_140645_304049_537E833F 
X-CRM114-Status: GOOD (  23.37  )
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

This code builds upon the clock controller driver from Haylen Chu.
This version has been reworked to use the auxiliary device model,
as requested by Stephen Boyd.  As a result the reset code resides
under drivers/reset rather than drivers/clk.  A new header file
holds definitions used by the clock and reset drivers.  The first
patch is the same as before, so I preserved Krzysztof's Reviewed-by
tag.  I dropped the tags from Haylen and Philipp, given the new
location of the code.  (The actual reset code is largely the same.)

This series is based on the "for-next" branch in the SpacemiT
repository:
  https://github.com/spacemit-com/linux/tree/for-next

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v6

Between version 5 and version 6:
  - Reworked the code to use the auxiliary device framework.
  - Moved the code supporting reset under drivers/reset/spacemit.
  - Created a new header file shared by reset and clock.
  - Separated generic from SoC-specific code in the reset driver.
  - Dropped two Reviewed-by tags.

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

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 ++-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 ++
 drivers/clk/spacemit/ccu-k1.c                 | 220 ++++++++---------
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/spacemit/Kconfig                |  12 +
 drivers/reset/spacemit/Makefile               |   7 +
 drivers/reset/spacemit/core.c                 |  61 +++++
 drivers/reset/spacemit/core.h                 |  39 +++
 drivers/reset/spacemit/k1.c                   | 231 ++++++++++++++++++
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 ++++++++++
 include/soc/spacemit/ccu_k1.h                 | 155 ++++++++++++
 12 files changed, 777 insertions(+), 125 deletions(-)
 create mode 100644 drivers/reset/spacemit/Kconfig
 create mode 100644 drivers/reset/spacemit/Makefile
 create mode 100644 drivers/reset/spacemit/core.c
 create mode 100644 drivers/reset/spacemit/core.h
 create mode 100644 drivers/reset/spacemit/k1.c
 create mode 100644 include/soc/spacemit/ccu_k1.h

base-commit: cb9c3aeae509b36afbdf46942a7a0a0dfc856ce7
-- 
2.45.2

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
