Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C17CD185F8
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 13:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GVZkzsY0S+gkseRZ1wDu0KLdpKUB3gj05X7pKATQ2mQ=; b=1g2bEhKzNOKdyc
	om30Tsq01CpkvfDIAokyEyLD93eNAN9PDWrvb1zhuD6qgVqRII/bWIWJoYf04M2vBEasbSRTE2YvW
	tt8xDK+BF1y+rb4OPbC7WVR5mFvSpQ25CVgVOT+JGQRcWSU0qWQFLR+qU/9xi4fbHxExJWx/5j8hj
	Jz+vkKaKUgNFX4zEmxKDeCcA4F5x5aHTz0ZUhdeVWv3bQDq31o/neOy2iir2CyRDyDUgGwU0tjf/B
	psAjMEDnkrwslpysPI7+akE1VUODwoT2DBYK6ODAeDNEGAUu3UjJCfJhnhLMnHsD9wwGqHub+nITN
	dBcRI4AdJnjUA8ocY6vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqFG-0000000HCI7-3bja;
	Thu, 08 Jan 2026 13:40:10 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqFE-0000000HCHB-44t0
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 13:40:10 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 60305341E78;
	Thu, 08 Jan 2026 13:40:02 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v4 0/4] clk: spacemit: refactor common ccu driver
Date: Thu, 08 Jan 2026 21:39:21 +0800
Message-Id: <20260108-06-k1-clk-common-v4-0-badf635993d3@gentoo.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAImzX2kC/23OQW6DMBAF0KsgrztoZmIMzir3qLpwwICVYLc2R
 a0i7l4XWqlVsvxfmjf/JpKNziZxLG4i2sUlF3wO8qkQ7Wj8YMF1OQtGroipBlRwIWivF2jDNAU
 PTUdtVWtdoaxFPnuNtncfG/n8sudo396zPO+lmGxKZpOPxY+rkbghXUqJumYgcD60ozOTOQ2Tc
 dcyPxPf2ujSHOLntnehjdsJxvtpCwFC13Nj0GhSTKfB+jmEMsRh0xb+K6gHAmeBm3OlJTVn2fV
 3wuFXUEh4eCDkDhQq6nSvtLX/hXVdvwDMMO/EgwEAAA==
X-Change-ID: 20251217-06-k1-clk-common-8d1c57995047
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>, Yao Zi <me@ziyao.cc>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2481; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=MuM8y2Uhoh4FKJuIFjdGlqJrAk5DSEPIoFtnZoY3ULk=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpX7Oi7Ane3/Bmlr3fYDnKiV4OlduH7cJBiHlls
 FV8m2galrGJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaV+zohsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0KKw/+KMWHaB7O4bXGMBABaGHg8yx7uzzhCg1oaEIzE2Szl9psEi2UulqM8
 XuSL+ohsKh+ZE3eH8FbKrhAIdYmM21Jn+ielMp9DRyO8LGTQRbAXg0D4X1DPGDJaMnlVndIi9lK
 9HwyyaWDphVOP3WAw7rI2bAD/Nn+d4+6+JpiOIqMpwDkDusG+Zr4vDoRWNMm3CH4VsUB4daq7Ps
 czNtMqEmHPV6keftu1/jiC03Tro0dsj476kX7dVJQEEGtmMaFphm/mmrgU5MQ7eOACLFHTzMFzG
 dArTDc7gjVQpOgJNWwzsjwXYtyYAEdxn6JPOjg7yBVAqtPij3bc8fyIKAApAU20vQfCX1izGAtC
 CMrCaWex8hQWEKR+p+v31cFNBDiBydzp72rANvgsCmINA9WcOjCkakvVCQph0+M8H5hRTh7ItcE
 HKq4l8QECge4PiaMNb6yzJ00RVJQxYxy4ULxF7d0K9j8ssS0OEnMNJHIkIYKPKkhco7nzG66AW0
 MyL5K8iGu6bpWzpqDu7rmIZfE/wXrqFVlJLG6Mj0xcNA6FPQM9+CAuuu4RwbnEeTW2/46m7Nvp/
 yUDC4V/9v8I/hbhKmazKr0cCq+4jYaXyUaz97/90fAiwmIbsrlKrfH23tC0etQUmLdomAIG1fwb
 daXPDk7VKTgraiWRcwiom4N8kAZ47U=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_054009_058568_22979769 
X-CRM114-Status: GOOD (  10.38  )
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

The goal here is to refactor the clock driver to extract common part, and
reuse it, so in the future, we can maximize the source code usage once
adding new clock driver (specifically, for the SpacemiT K3 SoC here)

Since reset driver register via auxiliary bus which requires a adjustment
of the auxiliary device id accordingly.

This patch will depend on Kconfig fix for building modules [1], and the idea
come from K3 clock's review[2]

Please note, Patch 1 is needed for both clock and reset driver, so extract it
out as single independent patch. Then it can be pulled into both subsystem.

Link: https://lore.kernel.org/all/20251219012819.440972-1-inochiama@gmail.com/ [1]
Link: https://lore.kernel.org/all/aTo8sCPpVM1o9PKX@pie [2]
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Changes in v4:
- add runtime dependency message about the fix to reset break
- collect tags
- Link to v3: https://lore.kernel.org/r/20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org

Changes in v3:
- drop reset macro, and have separate patch for changing reset name
- extract common spacemit_ccu_probe(), leave SoC specific change out
- improve commit message
- Link to v2: https://lore.kernel.org/r/20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org

Changes in v2:
- extract common header file which shared by clock and reset
- add SoC namespace to differentiate reset for auxiliary bus
- Link to v1: https://lore.kernel.org/r/20251220-06-k1-clk-common-v1-0-df28a0a91621@gentoo.org

---
Yixun Lan (4):
      clk: spacemit: prepare common ccu header
      clk: spacemit: extract common ccu functions
      clk: spacemit: add platform SoC prefix to reset name
      reset: spacemit: fix auxiliary device id

 drivers/clk/spacemit/ccu-k1.c     | 191 +++-----------------------------------
 drivers/clk/spacemit/ccu_common.c | 171 ++++++++++++++++++++++++++++++++++
 drivers/clk/spacemit/ccu_common.h |  10 ++
 drivers/reset/reset-spacemit.c    |   2 +-
 include/soc/spacemit/ccu.h        |  21 +++++
 include/soc/spacemit/k1-syscon.h  |  12 +--
 6 files changed, 215 insertions(+), 192 deletions(-)
---
base-commit: 99735a742f7e9a3e7f4cb6c58edf1b38101e7657
change-id: 20251217-06-k1-clk-common-8d1c57995047
prerequisite-message-id: 20251219012819.440972-1-inochiama@gmail.com
prerequisite-patch-id: df430730ed961011cee5c5d47b7ace84b3c5ebb7
prerequisite-patch-id: 64003618c33be925602e46b7543f2c13d3f36474

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
