Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70C0FCB638
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 17:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uXz5kwUxGbi64hsTVO+pSdXIymKqJLFDFOLBez3dVNQ=; b=bQHzQO2uHLCNov
	gAXZicUEhmnn2tyQ1mOb9mtu1lYA6tJjsxNU45ZqQptKS1Pqhw1jKBXDfu/wj4ah/tLeAFELRXbl2
	mwwr5ixOaWelNPRL8isitjTUcTLlPo9vmMUkiZWyIS+PSYIddo7mjwb1Ud/tYmNmOxmtDrgF+aVbL
	WBiaBA5/7xA6EZ0aFbrPz7Svvf9JxFAGrsSceft0S3aEhZdtABiDMVZOhRJ9mb2g1d95W07wfLzw5
	GTwnfqO9+v8wWmXCxAn0hmMVkqd6hVWyuy/g0GgOcTmSr84eCvLCls8w0+wd1K6DGVNPymQ4o8k00
	Ryy4XZ+QeRIqiPX1XdcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYj5-00000004FLX-3mUQ;
	Fri, 06 Mar 2026 17:12:35 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYj3-00000004FKG-1y13
	for linux-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 17:12:35 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-79868eae536so96724907b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 06 Mar 2026 09:12:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1772817152; x=1773421952; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o4TGiovKYE/NC2WLaNQ96o80qmi6PqcfNfFUs3pYMxs=;
        b=Gr4QlnLyqh3s/rUzYCuCnfG1Tzcro3gUhDRXWyJoe986iAlE0En4p+Faxj/8jjD04G
         sK+vpBQfPf/vAhZbIESu59Xj6uKPOsx72mRSGwogLTmgz0tndTGrBlsB+feoWGnVmRXc
         RGFg4N3f2P2g/ccnOl3tmAzTHLtgWWMV4zv34VA/YZO2562ItHg7ImznpAq0XQ8+3nxf
         15HeDp25+S9Zf21CogF3oJERBm95wvg3HGkd+iEElr6xqJd1ofG4gG/+zYSUgsRDW4ND
         WgMZs5wTCQ2hh14PYGPBHmOdJ19S57nL5RJk9BzIT8kwWVeyVzTpx/hPhf8WmhN9krOf
         B0kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772817152; x=1773421952;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4TGiovKYE/NC2WLaNQ96o80qmi6PqcfNfFUs3pYMxs=;
        b=TYomApsOFyOIbkApDGX9jS3T5fgWEVjELATkYuZaFduCVhffuUoMj4qgTv2L5lhH+D
         ifbrwPi8ZDS8n16G7LwJ/aeCiFv9X06PKKhZbpCOM9vOcccZkiRZ6btITMTYHYHTit4T
         YDvKCnzfzmZ+4qDWEm0ht/zScy7mUROT7YBmJHYWzDAYtEYTQxGKI1T9xixxbMtEt+cy
         iT5hwfSWUyz7z8bFpo70hZuhIHcbCjOnOv5mqvNYu3hklZLJJhriFSjK8YXXY/MmruUY
         Z5sMKp6Sz2nrB3EViZS+z8DrwfDruKN0vXHJaZwJHRQAIfkaVzCXwUHJFmP8Zokluw5C
         GFCg==
X-Gm-Message-State: AOJu0YzLa1iQQcdQhd4uvo/j9IN4tNcvfT8Dgk0EXZmCHnRn7D4qVkNA
	rHVZNSAXpYhnEuE+Rj3+WChLgSZQ+IP/b6OVBa9gNI3sItxXV3c+QX9Zg3lQzTYTZMVwkq9HPtA
	OCxwf
X-Gm-Gg: ATEYQzweEqqOoX4HWxM4maazwReeT5ly1RRgtgXUr9LTRdaIba2NIiCWnOvcPQeRY9S
	khKHQWTGrz4SDBlW6NMBv27Jl8o/p9dxlAkY74DxkK8Ukq1mJ9YBZGNUx7wW0oQBcMqTofzd3hZ
	70zMHsK81qDRB403XVgdk4lY/gg31nTJ8kPpAEq2Y4LbWj4+AeGfb50QhBarzhgn+nJHbTvDk8D
	+tLvpFYcFDPNL4QATYYC1E7HrA3gVAlS6iVWpXskrKSWibVS3fxtJaKBzigCQ3nA3g4hO75hYaQ
	0xBicW0dGLAMUUUb1jBBbtZiqAKgB3Jiqoq+/VLGInNyYv2/cYdpoIlq9WPXL3N9vLrFCB2QP9+
	IICk0izZQjpysUCjjowDigQ3osMKhX7A9rNxN1wevcSdSFLNd5XnKL9jvz0orLYM78fvaWE+pb+
	zmHReHA0akcKXa4IfXeftthUdHl6YH0ZMXCm7Ck8sknom2uqhif0dxN5GaKjEE5xt3wrpDVxiSO
	s9bGwbDI0w=
X-Received: by 2002:a05:690c:61c5:b0:798:5b9d:dcf9 with SMTP id 00721157ae682-798dd73a1bfmr25088757b3.40.1772817151985;
        Fri, 06 Mar 2026 09:12:31 -0800 (PST)
Received: from [192.168.5.15] ([68.95.197.245])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-798ded769ecsm9331237b3.23.2026.03.06.09.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 09:12:31 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Subject: [PATCH v8 0/3] Add Tenstorrent Atlantis Clock/Reset Controller
Date: Fri, 06 Mar 2026 11:12:16 -0600
Message-Id: <20260306-atlantis-clocks-v8-0-6c9b14a4aa8e@oss.tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPEKq2kC/3XQ3WrEIBAF4FdZvK6LM8Yx9qrvUXrhX7rSbVJiC
 C1L3r1moWzAeiMcwc8zc2M5zilm9ny6sTmuKadpLKF/OjF/seN75CmUzFAgCQDkdrnacUmZ++v
 kPzIfhBEejHA9BVZefc1xSN938fWt5EvKyzT/3D9YYb/9s1RlrcAF11JRJA0D9u5lyvm8xHEn5
 jguZz99sl1d8SBh3WrFInkiqYGkiURtSR4lqiVZJCeAQCqlwOm21B0kKWqpK1JHISoMCg12bUk
 9pHLUkiqSMIixk9ZbZ9sSHST4Zzra9+RKK7LKeC3bkn5IUsha0vt0oLwJwYqeGp22bfsFx2F9k
 nQCAAA=
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
 bmasney@redhat.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_091233_548974_FB3094F6 
X-CRM114-Status: GOOD (  21.32  )
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
Changes in v8:
- Use regmap_set, regmap_test helpers wherever possible (instead of
  doing regmap_read, modifying the var and regmap_write)
- Addressed remaining comments from Brian on returning status of
  regmap_write for atlantis_clk_gate_enable and formatting suggestions
- Updated names of some of the clocks to match the datasheet
- Link to v7: https://lore.kernel.org/r/20260303-atlantis-clocks-v7-0-415c9dda086a@oss.tenstorrent.com

Changes in v7:
- Rebase on v7.0-rc1
- Added Rb tags for Patch 1 from Krzysztof and Rb+Ab tags for Patch 2
  from Philipp
- Addressed comments from Brian on on making clk_ops const static and
  use of !! operator for non zero value checking in atlantis_clk_gate_is_enabled
- Removed multiple error messages that would be printed on failure to
  register a clk
- Corrected clock-gating bits for some of the PLLs and adjusted
  pll_is_enabled function accordingly
- Link to v6: https://lore.kernel.org/r/20260216-atlantis-clocks-v6-0-cb46d6a59c73@oss.tenstorrent.com

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
 drivers/clk/tenstorrent/atlantis-prcm.c            | 870 +++++++++++++++++++++
 drivers/reset/Kconfig                              |  11 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-tenstorrent-atlantis.c         | 173 ++++
 .../clock/tenstorrent,atlantis-prcm-rcpu.h         | 103 +++
 11 files changed, 1235 insertions(+)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260112-atlantis-clocks-f090c190b86d

Best regards,
-- 
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
