Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD2AD1951E
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jan 2026 21:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2/hXqYSwstkwCfmRaPP5BNcH/jgTxm/nmPtwVO0LcDI=; b=p/CiyP0UzVqcAT
	rhJylylcc3jGmVXwCLDVxzgt5vcFR8DdUHWfzatBFeyrQp0ez2UWc1lD5yRImuL28/n+ymGMWK073
	S5TatznkqnrvSBMe3tskVawyQue0yuZbd4np3OM6oMoc2A/+Qz3d824Qan/SDjqiuFerbj+eValqz
	mu0yPV3OLQVLKYee1m1+ScHyD1F0Qoef9xPc8saM/yJDOAj3ByXgNsFWvRCT0ihPGs+PR2l8uwLdB
	nfS6h01loPLR5mERNbs3n6IrYWap8YaFQZ+/DIWU1h3u+rwLDVcuEpIFhZzmgiSnePCmfM5jBrEkt
	qZf7kf2vT1QWG16ZNYTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkTnx-0000000DFSz-3dMX;
	Mon, 26 Jan 2026 21:07:25 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkTnu-0000000DFRU-1rGr
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jan 2026 21:07:23 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-794719afcd4so6499397b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jan 2026 13:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1769461641; x=1770066441; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JQ+ZbTntkP2HXui9Ym0Sh9Ym8nTlNYxOBU+DQFXOvjc=;
        b=LcWlWp4mUgKEds4ZTmXm/7/3PFOHbKUD6DkNrYZionr3hP8D99hipS60qTNW1Lhllu
         iWcUiTuBsN9Alvz060yqJxuvinq1xRe+8lS/xQo+OQouGDN9gbVNSrHBhNLh8E2lto0C
         01IQ2LUHAMAZc9T7ATLyNswO7ziJShP6X13wg42LfvmlORlpViLbPP6rNgpl0+VDt/3L
         NOYd6iIkxg+IVIjsWlaPuvqE5BDxMyvlOj9OKvhUowpoOTDkgAcZBci1FGkYF7cOBioD
         cSihEx89Mz6YqWFVEfjyqlBNhjrdZCVT/OnOo46XSdgBJSx4xul2udk/73dFSD+UT9zl
         /v5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769461641; x=1770066441;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQ+ZbTntkP2HXui9Ym0Sh9Ym8nTlNYxOBU+DQFXOvjc=;
        b=CFSD1+55KtBCZnAhg10cA+dx7xBrMiE2g60mZW0SdnGGVZIihx3ltwo5CgfeXXVH7j
         5+TX/QaCrgsBU6avRf9NvySrNkLw4NFf1rb223qHNKXqbcZkR+Jizi97OStuIu3RlEkN
         x9SLuqP0ovZxiQGxcPqBl34tumY3KawPPc344QgwEhLgesKqa2fP4mqmfu8pkphOmfRG
         ZBssUSR6wU9zPLy2jEw+oQkeOKVjnjLlU712jeekiYULoCZoa8pL9C98AyRmUyfcfrkE
         Zju2uSqRqIwE9yqdJZB+xZwXcOXPgQBnfqlvg/Gq/jQOG3IpHBV77zyn4WyJvbds6DvN
         XYfA==
X-Gm-Message-State: AOJu0YzmTL/qZ/rZgqDTqjva7E8HLFcPi0fXMrBl+N6wa70UP8GQ0ESY
	FPSk/2I0AOJp3+E7CeJOQOm4ABBP+MSkQAjnTOdduUrVlo7fq9EdC82FUB79boXe1LU=
X-Gm-Gg: AZuq6aKtGsoXA2Ul/dt03PAg4LyOrNOrPGlnT2FAL3lDtxlRJmLLVODvf7p+DAtCznn
	EICM695xcOcIq2GhKs7CW9gWCXaEFuz1xON4GnLW4jiST2kuvfa3NyTu9PkJ6As2U6itShJ4k3E
	qtH3C0JAlwV1Tw7wI3Vg70sEfz2YdyGt/ziOyypMeNb05NXNOHx6jAxPUyXTTcbIT6SkBJTFGMW
	yoXyUK281B+h+DWVD93/th6Ts3Np4c/KpYBzxhrXVlELIY9vTP4uCJ7gFC9WHdiMMl/8H/5DPQC
	Jj156VELpWFkk0Afd/Wa0dwgR0VUsHxhM52ezD1RPAqQBWe87vuZWUaPhaXmHYEgLSK+3BkDs6S
	B0z7gLZFFd6p3FX5o1K8L9jb/KjGeDn2SDhJLWk1DCVnKEfmv+Qqysa/resQVF6g612wncElkl5
	13J+BfQJ43pcYWhA7s3nRih4IscJzmhlBEzYpc+iexN0j5sp2vKHxqpv/gCHc8T/kn5576dQm75
	RATQLKIYA==
X-Received: by 2002:a05:690c:ec7:b0:794:198e:943b with SMTP id 00721157ae682-7945a845621mr46975107b3.8.1769461640816;
        Mon, 26 Jan 2026 13:07:20 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7944bed27casm37948757b3.7.2026.01.26.13.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 13:07:20 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Subject: [PATCH v3 0/3] Add Tenstorrent Atlantis Clock/Reset Controller
Date: Mon, 26 Jan 2026 15:07:13 -0600
Message-Id: <20260126-atlantis-clocks-v3-0-b016135551b7@oss.tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIHXd2kC/23OzQqDMAzA8VcZPa/SD4y6095j7KA1zjLXjqaUD
 fHdV4XBwB3/gfySmREGi8ROh5kFTJasdzn08cDM2LobctvnZkooEFIq3sapddESN5M3d+KDaIS
 Rjehq6FneegYc7GsTL9fco6Xow3s7kOQ6/VrlzkqSC17pEhAqOai6O3uiIqJbiYAuFsY/2Kom9
 SOp/VdJZckA6EqCbhDgv7QsywfrNyQvAgEAAA==
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
X-CRM114-CacheID: sfid-20260126_130722_520648_78295787 
X-CRM114-Status: GOOD (  14.27  )
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
driver along with the auxdev definitions needed for it. The third commit
adds the clock controller driver, and the reset controller is created as
an auxdev of it.

Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

---
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
      dt-bindings: clk: tenstorrent: Add tenstorrent,atlantis-prcm
      reset: tenstorrent: Add reset controller for Atlantis
      clk: tenstorrent: Add Atlantis clock controller driver

 .../bindings/clock/tenstorrent,atlantis-prcm.yaml  |  82 ++
 MAINTAINERS                                        |   5 +
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/tenstorrent/Kconfig                    |  14 +
 drivers/clk/tenstorrent/Makefile                   |   3 +
 drivers/clk/tenstorrent/atlantis-prcm.c            | 941 +++++++++++++++++++++
 drivers/reset/Kconfig                              |  11 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-tenstorrent-atlantis.c         | 160 ++++
 .../dt-bindings/clock/tenstorrent,atlantis-prcm.h  | 103 +++
 include/soc/tenstorrent/atlantis-prcm.h            |  58 ++
 12 files changed, 1380 insertions(+)
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
