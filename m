Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8374A606A339
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 09:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qz9VIiAG;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=WwfClyRH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:MIME-Version:
	Message-Id:Date:Subject:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:List-Unsubscribe-Post:List-Owner;
	bh=1ivM5mLE01fYmaoE6wYFxwO8IH4Prm5D9eWxJKazCW4=; b=qz9VIiAGwTmyQXk4ZQY7Vknk9D
	oklxNDuCY7FlgaQQ/TS0BPvsEjAX2Wx33zCq7A+UL/GQYqyVA0bL7ylmuG/j6hHINH8omqtxJDwtO
	W/6a8eB5OQApdZmCHKbKVUaVxeGudfLTQ165BZS1o+O30A862j5/STPAVgsLw6VGYYd6Cn1BssiiE
	jrT4gsaA6ALDwVseUBzDvn6HNUo6cSCeCegpV3Bw+tZhzzxAQ2efFcb8dPL2CrmiEChlfTzXPkF8o
	eBSuxgfMd2kcuur9HR36Mk5ANPleUgfVcp1YD/q5Jscdrkchtoxq+0whIRcMpWPubRk/ZJy/p+c5r
	qS5n42TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnFv-000000068SF-46he;
	Tue, 24 Nov 2026 09:56:08 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVnFm-000000068MN-1D7n
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 09:56:05 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261124095555euoutp0145b43be85caa9b43d3a3fd73f49d6c15~q8pxswQpV0406404064euoutp01N
	for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 09:55:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261124095555euoutp0145b43be85caa9b43d3a3fd73f49d6c15~q8pxswQpV0406404064euoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795514155;
	bh=CYvIYIwuDiGcctglkMMhgqQL8VutkqVe7MrezV6RgL0=;
	h=From:Subject:Date:To:Cc:References:From;
	b=WwfClyRHLPK544Ef2cxjG7Ov23Q8bJc1uyBIoXqQ/zTWRtAjjMgQrdP+ewgEnvRzA
	 nbmf076xGVJY+37fSdQEpHRWAKENsIorrWAqmf0R28U2wPG/fKtbw5O54fs54qlkTe
	 XVw46ZZgbEtyv3nUj5/0DQ1BUsDQG0JnvxNasCqA=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261124095554eucas1p15e201436f33ffd2920ab65afc1a44e71~q8pxVQtHa2052320523eucas1p1e;
	Tue, 24 Nov 2026 09:55:54 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261124095553eusmtip2be9028c7f2a29e7979dde987e18f7400~q8pwcQXO_0411504115eusmtip2B;
	Tue, 24 Nov 2026 09:55:53 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v8 0/5] phy: Add the StarFive JH7110 Innosilicon HDMI PHY
Date: Tue, 24 Nov 2026 10:53:57 +0100
Message-Id: <20261124-jh7110-inno-hdmi-phy-v8-0-5e3008122cba@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALVeBWsC/3XOzWrDMAzA8VcpPk9DsRJ/9NT3KD1ktlJ7LE6IW
	7NS8u5zA9sYo8e/QD/pLjIvkbPY7+5i4RJznFIN87ITLvTpzBB9bSFRqgalgfegmwYhpjRB8GO
	EOdzAEHdu6FVLTKKuzgsP8XNjj6faIebLtNy2K6V7TDcQrbTfoPvgPkHm5KF0gGDkW+sNk1NOH
	3I/5ms6v7ppFA+vqB/j+VNFVWYg0laZ1lvN/xn9yzSonjC6Mr61pAwhGcS/zLquX1tzKXVFAQA A
X-Change-ID: 20261028-jh7110-inno-hdmi-phy-83e5cfa643e3
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>,  Manivannan Sadhasivam <mani@kernel.org>, Rob
	Herring <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
	Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,  Emil Renner
	Berthing <kernel@esmil.dk>,  Hal Feng <hal.feng@starfivetech.com>, Dominique
	Belhachemi <db@domibel.de>,  Michal Wilczynski <m.wilczynski@samsung.com>,
	Andy Yan <andyshrk@163.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Icenowy Zheng
	<zhengxingda@iscas.ac.cn>,  Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Joshua Peisach <jpeisach@ubuntu.com>, Byron Stanoszek <gandalf@winds.org>, 
	OOHehir <oo.hehir@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5181;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=rm2cOug6bBmR4Ol7dMEohetL7wgq09jQCr4wqNGckLg=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWSzxmsGP9VyZOsv2Mr0rk4z3tZLmmFq66rXvq/ZuaJYZ
	03IXZPWUcrCIMbBICumyHJ2Y7SR5D+Gp+XHH/+CmcPKBDKEgYtTACay4xrD/8warkWajP+2Npy/
	Wf69TG5pvscZ26B6w++BkqfqZDvVBRkZOvczn8+5J1uXslz/9jGm9DP/t6/JXbb/+of7fko3LKb
	OYwQA
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261124095554eucas1p15e201436f33ffd2920ab65afc1a44e71
X-Msg-Generator: CA
X-RootMTR: 20261124095554eucas1p15e201436f33ffd2920ab65afc1a44e71
X-EPHeader: CA
X-CMS-RootMailID: 20261124095554eucas1p15e201436f33ffd2920ab65afc1a44e71
References: <CGME20261124095554eucas1p15e201436f33ffd2920ab65afc1a44e71@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_015559_470990_AE95F5FE 
X-CRM114-Status: GOOD (  19.61  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds the HDMI PHY driver for the StarFive JH7110 and shares
the pre-PLL code it has in common with the Rockchip RK3328 Innosilicon
HDMI PHY.

Up to v5 it was part of the JH7110 display series [1]. It is split out
as Vinod suggested, so it can go through linux-phy on its own; the rest
continues as v6 of "drm: starfive: jh7110: Enable display subsystem".
Nothing here depends on the display series. The display series depends
on this one: its HDMI subsystem binding references the PHY binding from
patch 1, and it needs the PHY driver at runtime.

[1] https://lore.kernel.org/all/20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com/

The JH7110 has the same Innosilicon PHY as the RK3328, offset by 0x100
because it sits behind the HDMI controller in a shared register block.
Patch 2 factors out the pre-PLL config format, table lookup,
determine_rate, recalc_rate and the pre-PLL programming; patch 3 moves
Rockchip onto it; patch 4 adds the JH7110 driver. Pixel clock tables,
post-PLL and analog config stay SoC specific.

Patch 3 should be a no-op for Rockchip - same writes, same order, same
values - and RK3228, whose pre-PLL is at different addresses, keeps its
own register code and shares only the lookup. I have no Rockchip
hardware, so it is build tested only (arm and riscv). A Tested-by would
help.

Patch 5 adds MAINTAINERS entries for the common Innosilicon HDMI PHY
library and for the JH7110 binding and driver.

Testing
=======

Tested on a VisionFive 2 v1.3B together with the display series, using
modetest: all 42 modes the sink advertises work, with pixel clocks from
25.175 MHz up to 297 MHz. Display off/on at an unchanged pixel clock
and unbinding/rebinding the PHY driver work too.

Every commit builds for riscv and arm.

Changes in v8:
- Address the Sashiko review findings (Vinod):
  - Fix the fractional dividers of eight JH7110 pre-PLL table entries
    (25.175 MHz, 25.2 MHz and the six *.75 MHz rates) so that each
    entry produces the rate it describes; the 25.2 MHz entry
    (640x480@60) came out at 25 MHz and the others did not read back
    as a table rate
  - Avoid 32-bit overflows in inno_hdmi_phy_pre_pll_recalc_rate() and
    log the actual VCO rate
  - Make the JH7110 bias and RX enables follow the pixel clock prepare
    state, keep the cached rate across disable, and wait for the pre-PLL
    to lock when .set_rate runs on a prepared clock, so re-enabling at
    an unchanged rate works
  - Power the post-PLL down while its dividers are written
  - Drop the unused inno_read() and register macros, and use the
    macros instead of raw values
  - Get the reference clock and register the clock provider through
    devres so teardown runs in reverse probe order; drop .remove
- Add a MAINTAINERS entry for the common Innosilicon HDMI PHY library
- Link to v7: https://lore.kernel.org/r/20261106-jh7110-inno-hdmi-phy-v7-0-d49368303800@samsung.com

Changes in v7:
- Point the binding example comment at the hdmi-subsystem binding's new
  location in bindings/display/starfive/, where the display series moved
  it
- Rebased onto v7.4-rc1
- Link to v6: https://lore.kernel.org/r/20261028-jh7110-inno-hdmi-phy-v6-0-f3379684d97e@samsung.com

Changes in v6:
- Split out of the JH7110 display series (Vinod)
- inno_read() returns the regmap_read() error and recalc_rate checks it,
  instead of a failed read turning into a zero divisor (Vinod)
- Bound the pre-PLL and post-PLL table walks with the table size instead
  of relying on a sentinel (Vinod)
- Lowercase hex in the JH7110 pixel clock table (Vinod)
- New patch 5: a MAINTAINERS entry for the JH7110 HDMI PHY, moved out of
  the display series' entry
- Rebased onto v7.3, collected tags
- Link to v5: https://lore.kernel.org/all/20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com/

---
Michal Wilczynski (5):
      dt-bindings: phy: Add starfive,jh7110-inno-hdmi-phy
      phy: Add common Innosilicon HDMI PHY helpers
      phy: rockchip: inno-hdmi: Use the common Innosilicon PHY helpers
      phy: starfive: Add jh7110-inno-hdmi-phy driver
      MAINTAINERS: Add entries for the Innosilicon and JH7110 HDMI PHYs

 .../phy/starfive,jh7110-inno-hdmi-phy.yaml         |  49 ++
 MAINTAINERS                                        |  13 +
 drivers/phy/Kconfig                                |   8 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-inno-hdmi.c                        | 359 +++++++++++++
 drivers/phy/rockchip/Kconfig                       |   1 +
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c      | 169 +------
 drivers/phy/starfive/Kconfig                       |  20 +
 drivers/phy/starfive/Makefile                      |   1 +
 drivers/phy/starfive/phy-jh7110-inno-hdmi.c        | 561 +++++++++++++++++++++
 include/linux/phy/inno-hdmi-phy.h                  |  88 ++++
 11 files changed, 1126 insertions(+), 144 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261028-jh7110-inno-hdmi-phy-83e5cfa643e3

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
