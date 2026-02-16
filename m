Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08874E83840
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Feb 2026 22:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=f10z58Xn5dZjOJpKpnH3gHR5lLUGBbwgWSFzomuMg48=; b=XwY7rTMmG5GHJt
	MCJPZ/TRKtXzwmZ/kKHVxu8sYWxB5wskLNvw11M+0rH/GoHvhQxKlr7qVIGO1cC8P32KVKNN4hTPo
	ulTRXbmqaB+6BxTfsafKNCrOtlj9UzemxVdXWnWezfcdp6tjJGy3UUpvUtp9aVFsV30hSel5p610f
	UHPANi2AHlhwCG0hxg1za+FsmBuGrKCL3rNhvqexILz4lDf5bjAKAl9ZNK5nu/ht2XNGOpicimsOp
	NBZwomcHOhD/Z07OZtox4df3YMCyceO8/RzoMd0npF5STnQkp7DaMqJeueE68PcoA4tahwYiNtxEi
	+F8xJLEjxmRglN6IEwuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs6tc-00000007Kdc-2ptz;
	Mon, 16 Feb 2026 22:16:48 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs6tZ-00000007Kcc-0Vb9
	for linux-riscv@lists.infradead.org;
	Mon, 16 Feb 2026 22:16:46 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-64aea64bf15so3195155d50.2
        for <linux-riscv@lists.infradead.org>; Mon, 16 Feb 2026 14:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1771280203; x=1771885003; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6GyMKAk0KNPhLrIPgkeZaOJ2e5FaaiPOPN4sMAsFFnc=;
        b=NTKgjbSN/e5nWqgFQ+lECbPl6M4TXvqEtLLN9kmbDZag/gAcdK9pUQpB51FxaVoJbX
         eGBRoXWIiPPZXAzI5OlcMJm1usoPcCMWbBSIMPtbjc+xofhfbByU6gy/xbj1+RsjZQQ2
         kRElfzQ6qcldkzKg48ZQt4MraaCSMznlhHsYcqWtcRRQxJUNXKH/pdqFMOudYbHTZOLn
         JcwqWMSkg3lp/VRKMSkra6e6cheU2FlvEMIIQ1iETiZDI/a7pmwegPu4a1pygZzWKc5V
         4bOucF0h7kTdetqzXqp4mERF3rf+zznUsCMtnoaAgglld2WCI6PBskSYFouq9fpuECob
         nN7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771280203; x=1771885003;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GyMKAk0KNPhLrIPgkeZaOJ2e5FaaiPOPN4sMAsFFnc=;
        b=STvgOOYCkru0JJoqzzJ9fopjcPG+pGUFxwqoV7FEswLJJk6xBAajrZjjBK7LIDvofL
         IJ+3TkyMA8RJ0jNT4SGO5lp7VoB8/9YK7uv4nXIjlNGTH13JRbBZFrdHinHpp8dVD7pu
         o/K5xDM3jLXgkNKcsLtKE3JreTfmu2MO4gU+6WFBsmj8Q/wIavQkQC5WZlyryh876PKH
         x6xLwtqBTASJ1TL5rKWCy/gl6MjbeftSU+qNOb7HSkR+uYRk+M4kCOLh7zS2aQDVTKpp
         vwns74pS3l+h5Y/36Ie9Ip2RmF8mZ8HJ3kl645TRKxthR/yrSm3v+YBn4IqbdE4o1dBX
         ulkw==
X-Gm-Message-State: AOJu0YwivJy45oD47rVMWpqBlk/QiaYuLs5svGvL/+HVLEODcd2IMqvC
	aStZUZanHBaUjPMwTlkstrHLY0hDs0NQ6osa19TH3yvVgHGSDgGg6lKceOqqdnNx8mAveJttpwR
	oi73Y
X-Gm-Gg: AZuq6aLBMFfSiw0J0jlOTT3Zgp5I//uqn0KNVKmthf6BV+5d9gNAkSs3Ibk3Ss/WBQi
	v9xvutyMuGhZiNiVfSMGgdtQCSAflslyKcjJcEfQEuWmmVpOhEecSNoQ4dyYNi3Ku8UaYCpVdy7
	MJDtAA16ZseuivvEBR+RV6nYEQp9ieAhzeSvPHsNLbt1ZbHMdB0l6r2JAmqsGlEeIYCi6pLMg9a
	HMQF/6zaz4R585hIygUfeT0vaHW6iOaaMEPu42bYULyOygZrK820fhNRDLBua7PEZT/8a+mrWsf
	VsogpjFPBKvE/1xP9BEU6DYcEZytoXdE9vFOWeediyNgDXaAhjqkA4DTDv4eBgfjydppNgSVWR5
	wUEfJlWqiM/9hyUdC8zTELGPCou0qOf3U0UoJ6BOjxYh0HsCbSjKg2F7ne9ZqMRvG7Ru92qp8o1
	3+wXKUXk/QYWQ9uTGK9YyjFr7oemtsnXXaDOXO15937/LY739uURX+7754L7ltRRQcpNuMFyvbO
	cuKDpmO60s=
X-Received: by 2002:a05:690c:6612:b0:796:4b03:7390 with SMTP id 00721157ae682-797a0c05ab7mr210848857b3.27.1771280203365;
        Mon, 16 Feb 2026 14:16:43 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7966c1a8222sm106705757b3.23.2026.02.16.14.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 14:16:43 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Subject: [PATCH v6 0/3] Add Tenstorrent Atlantis Clock/Reset Controller
Date: Mon, 16 Feb 2026 16:16:31 -0600
Message-Id: <20260216-atlantis-clocks-v6-0-cb46d6a59c73@oss.tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAD+Xk2kC/3XOwWrDMAwG4FcpPs/FkmOl6WnvMXqwHWU16+xhh
 7BS8u5zCmOBLBfBL/g/6SEK58BFnA8PkXkKJaRYA70chL/a+M4y9DULVEgKAKUdbzaOoUh/S/6
 jyEF1ykOn3Il6UVtfmYfw/RTfLjVfQxlTvj8PTLBsfy2zsSaQSrbaEFMLA57cayrlOHJciMxxP
 Pr0KRZ1wpWE268mrJIn0i2Q7phoX9JribaSrpJTQKCNMeDafalZSVptpaZKDfVssDfYYbMvmT+
 pjq1kqqQ6RG609dbZ/6V5nn8AWHWoneABAAA=
X-Change-ID: 20260112-atlantis-clocks-f090c190b86d
To: Drew Fustini <dfustini@oss.tenstorrent.com>, 
 Joel Stanley <jms@oss.tenstorrent.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
 fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
 npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com, 
 bmasney@redhat.com
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_141645_196309_F6B5BEBD 
X-CRM114-Status: GOOD (  18.16  )
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

This series adds support for a multifunctional register block
called PRCM in the Tenstorrent Atlantis SoC, whose main functionality
is to serve clocks and resets. This block is instantiated multiple
times in the SoC, with each block covering clock/resets from a
different subsystem. This series also adds a driver that covers clocks
and resets from the RCPU subsystem, which covers most low speed IO
interfaces found in the chip. The reset controller is implemented as
an auxiliary device of the clock controller and shares the same regmap
as it.

The first commit adds bindings documenting the PRCM block, along with
clock and reset indices. The second commit adds the reset controller
driver. The third commit adds the clock controller driver, and the reset
controller is created as an auxdev of it.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

---
Changes in v6:
- Renamed bindings for PRCM module from "tenstorrent,atlantis-prcm" to
  "tenstorrent,atlantis-prcm-rcpu" so that filename matches compatible
- Updated reset driver to fetch parent device's regmap instead of using
  auxdev structs
- Moved reset register offsets from include/soc/tenstorrent header to
  reset driver
- In light of above 2 changes, dropped dropped Rb tags for reset
  controller patch from Philipp Zabel
- Moved clock register offsets offsets from include/soc/tenstorrent
  header to clock driver
- Removed shared header file in include/soc/tenstorrent
- Remove boilerplate code for initializing and register reset auxdev in
  clock driver and create it using devm_auxiliary_device_create instead
- Removed struct atlantis_prcm and it's occurrences as it is actually
  not used anywhere
- Fixed an incorrect use of boolean && instead of bitwise & in pll ops
  in clock driver
- Link to v5: https://lore.kernel.org/r/20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com

Changes in v5:
- Replaced to_atlantis_*/hw_to_atlantis_* macros with static inline functions in clk and reset driver
- Add Rb tags from Philipp Zabel
- Link to v4: https://lore.kernel.org/r/20260130-atlantis-clocks-v4-0-46de52d52924@oss.tenstorrent.com

Changes in v4:
- Dropped !rcpu prcms and custom property used by them. Will be added
  later with rest of clock tree
- Link to v3: https://lore.kernel.org/r/20260126-atlantis-clocks-v3-0-b016135551b7@oss.tenstorrent.com

Changes in v3:
- Fixed warnings reported by kernel test bot
- Addressed comments on reset driver bit set/unset value
- Changed auxdev macros to use inline functions
- Renamed bindings and clock driver to use block's name of "PRCM" rather
  than syscon
- Link to v2: https://lore.kernel.org/r/20260122-atlantis-clocks-v2-0-c66371639e66@oss.tenstorrent.com

Changes in v2:
- Improve the documentation about the syscon block in bindings
- Implemented all clks using custom ops
- Removed custom lock/lock handling functions for regmap
- Addressed comments on header file ordering, newlines and typos
- Removed code for mux parent setting
- Squashed down multiple commits that added reset/auxdev separately
- Link to v1: https://lore.kernel.org/r/20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com

---
Anirudh Srinivasan (3):
      dt-bindings: clk: tenstorrent: Add tenstorrent,atlantis-prcm-rcpu
      reset: tenstorrent: Add reset controller for Atlantis
      clk: tenstorrent: Add Atlantis clock controller driver

 .../clock/tenstorrent,atlantis-prcm-rcpu.yaml      |  54 ++
 MAINTAINERS                                        |   4 +
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/tenstorrent/Kconfig                    |  14 +
 drivers/clk/tenstorrent/Makefile                   |   3 +
 drivers/clk/tenstorrent/atlantis-prcm.c            | 901 +++++++++++++++++++++
 drivers/reset/Kconfig                              |  11 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-tenstorrent-atlantis.c         | 173 ++++
 .../clock/tenstorrent,atlantis-prcm-rcpu.h         | 103 +++
 11 files changed, 1266 insertions(+)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20260112-atlantis-clocks-f090c190b86d

Best regards,
-- 
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
