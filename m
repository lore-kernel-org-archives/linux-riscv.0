Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD3EEDA6BE
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 17:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AEWvHsmvZaZThF47tbOgrxz9TOU5ukKL7HJhV93lBKc=; b=U/EaOwtIxz60Bh
	CMgbXCEWRmgb/tMD2EQBjlyr2zHwtJQC4FIzGyCV2BlSOF+XfP+VrzqcH4oRbtiWF04fWxGGOv0CO
	eomw6eiXrZLSYIT/vlw4/fSJEg/EzWH1Q87hJH6ycQSR2K87fQm6w6qxO14AlbVc3xeBMrh80L0pc
	n5srnsPWpj7ltcJaOBSIuWsrh3t5QDGdRPGBmbgKm7TKErgWBOJa2a9rfShXo7hrPPERzciGdo2yg
	imfjdMSvcHsenBwRUl/Sr+FxOxRytpY6TaSagczpAlud67sLojh++CFD4TVBfQm+Ldq0lX0p2P5Mu
	Mjl2XSp81ekFjVEdvq6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxTfM-0000000FetI-1dOt;
	Tue, 03 Mar 2026 17:36:16 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxTfI-0000000Fes9-4AKo
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 17:36:15 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-79827d28fc4so53966187b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Mar 2026 09:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1772559371; x=1773164171; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H6iTpKo42LQycXu04Lv5eBd6w/oQMbMtVO5fhoLyfQU=;
        b=WdMnsDWZ6/M+utFyJFuQ5akPGJHiJ4Te0fVze5gNocupd6LbX9G/35KOW928QAr0bk
         KQWwiUQ+E77IO9S4rpkyOpn3QlWZ//Yh36AEsrzqHyxgHXM5PiCnOOL3j8If6BbHryQl
         V1VWjSVsA5Ye0zYmDWcL8N/M+gYNlYcHIs4HzgAI8vXfxj2v3BYXOs/6rA2vMT3EiGP0
         /TT8alMreplpJcSlmN1E9TryaYHFrqmj8HqdCEMzdFHgb6Tit68+bHI5RcqWPEUWIPUl
         MTjjr2gnc5GIPQ2YdyiR53R8MCqabANDj7uviIxJkntsDjOofzOpoTuOuirFCDzoW3/b
         lNDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772559371; x=1773164171;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H6iTpKo42LQycXu04Lv5eBd6w/oQMbMtVO5fhoLyfQU=;
        b=vvWmbVajWctCwdQlLLQbI6jBSKDSYJ5RrXcrUmZPvjvzq1gJQggWO1zz5DlMcWahRu
         ClNUbbSYIPK90hGjZSg9w0S8vA8jWNCq1vwCdOntQM4x5anW+AGV2xBl+ZdHtJbuYI2Q
         yMD7ekXvY7854LVkHZPll6f0EhuAt6XqgYbrrZNXQgE+eMMwzuqKkpTb4Rs9wwG+FEax
         MuDOBM8M/7LdosXbRc5qzYld42SCxsMQikFUVibYFafED1PzgxO0whePK2dSebnJEwyY
         O8K5Ut5fXwPCfC5eUcOSwcki1tpAPVNu388DOtFvtiOg/YR0oriuBFJvI9tLwmko/NK/
         OPCg==
X-Gm-Message-State: AOJu0YzfbBTdu6YdskA2VUS+GdNmlFmVIAXdJ0j8qtP4+1BnfJWYbg3c
	HW3/Ac8FmUlFyZvi5657isJmwu8wkAGd3p810dlMCsF2BonWwS4lhzk0ySVSskaNjTc=
X-Gm-Gg: ATEYQzwPITIYkQtrTD9O0gFhbyq4fSyACHKdl09VD99Tdp6F0eZVju2e3kLToJY17Bg
	zd4VwWiMedL5u+J7jzgYtVRwxt6qnapleUSGXLwvzdsDjsGaYcAGEHOQIAwhx3RrpfDodzbnKj7
	sfC5SlNZUvgXBERhbd2ZxsA3cfxMWOdB6c1hnv3HPhlg253fit3oa70CVH/hH3KlagCVasSldsv
	F+2HZopoH8XPbk/RtDXjK/qu2WUph/g6ldJ9gxxWmdx/WCN8G0Oiu2ZNDv9lafLBkVI+e2/DKDx
	mmPwh9ooo7ouNou4nT7GeoV5pz4R1BTPSBWRDlMOpAUDRBL8/M/AzRG6P3e56s68s+RnqhNB/Mo
	+6vEmvghnCqEy2sXVFKfk2kTMrRajisdBlenHwZueptk7u9GSv9jQioFkdshNPAd0zOBh+s7Dro
	twzpSh3KNjOn9II+c964WBd7slXK/SLrbnSx+Xa7CsVidIATa9KCUkdmD2/ftrWV15cNQ0q2EL8
	nYDxh91q2CdA7sG3oaC
X-Received: by 2002:a05:690c:d8d:b0:798:78cc:3e54 with SMTP id 00721157ae682-798855df3b0mr150815947b3.48.1772559371384;
        Tue, 03 Mar 2026 09:36:11 -0800 (PST)
Received: from [192.168.5.15] ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876a8df9bsm64750477b3.1.2026.03.03.09.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 09:36:10 -0800 (PST)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Subject: [PATCH v7 0/3] Add Tenstorrent Atlantis Clock/Reset Controller
Date: Tue, 03 Mar 2026 11:36:06 -0600
Message-Id: <20260303-atlantis-clocks-v7-0-415c9dda086a@oss.tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAYcp2kC/3XQwWrEIBAG4FdZPNfFGeO49tT3KHtQM+lKt7HEE
 LYsefeahdJANhfhF+bzd+6i8JC4iNfDXQw8pZJyX4N9OYh48f0Hy9TWLFAhKQCUfrz6fkxFxmu
 On0V2yqkIToUTtaJOfQ/cpdtDfD/XfEllzMPP44EJlts/y2ysCaSSVhtistDhKbzlUo4j9wsxc
 D8eY/4SizrhSsJtqwmrFIm0BdKOifYlvZZoK+kqBQUE2hgDwe5LzUrSais1VWqoZYOtQYfNvmT
 +pXpsJVMl5RC50T764PclWknw5He07CnUVuSNi1Y/l+Z5/gU6XC1HKgIAAA==
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
X-CRM114-CacheID: sfid-20260303_093613_055646_051BAA67 
X-CRM114-Status: GOOD (  20.52  )
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
 drivers/clk/tenstorrent/atlantis-prcm.c            | 893 +++++++++++++++++++++
 drivers/reset/Kconfig                              |  11 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-tenstorrent-atlantis.c         | 173 ++++
 .../clock/tenstorrent,atlantis-prcm-rcpu.h         | 103 +++
 11 files changed, 1258 insertions(+)
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
