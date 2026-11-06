Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A345606EE8B
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 13:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FWFcOVkf;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=KE4SEBQ2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:MIME-Version:
	Message-Id:Date:Subject:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:List-Unsubscribe-Post:List-Owner;
	bh=ExuglMcYKAx9e3KGfW3NEGbUNV/5NcG2o2QhVH0h7fI=; b=FWFcOVkfI1J8ZbCisw4wGu03Yr
	89H/Hv2s9eQ2/luo/ZxOcyt5uKyevzhMFtQOvJGZ8yDt/8J/kC3dvwZVX7YJCcSQrXoDPU1MYXcpd
	Dz9SYZ9hQZIb+EwKHr7MyTI+zULnodqgQKLDEAiJChLKyC6NXG9og/+ub/9JDfWs+puGqMUGwW2kX
	MP9Vsb7EB8GqaSXo40jz7wU27XGqbUuYEz+RETcPCNIByz2pZPCxxh/8a40auWt6IL4LzAJ192Jin
	n9mjkQTxgiIAcQ3Gj3sVlVlsEiKfvXR+CZcjlW6lngIe/Ei+DBgddZXNRf2OWq+oHpP9RcOAlCHFz
	nFYTlEPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKPY-0000000CUvJ-3IJH;
	Fri, 06 Nov 2026 13:55:20 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPKPN-0000000CUj1-0RDi
	for linux-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 13:55:13 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261106135505euoutp0140be44f448c5f1e02f5b5b40449cf6ef~leTd_hHww0206502065euoutp01N
	for <linux-riscv@lists.infradead.org>; Fri,  6 Nov 2026 13:55:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261106135505euoutp0140be44f448c5f1e02f5b5b40449cf6ef~leTd_hHww0206502065euoutp01N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793973305;
	bh=QWsQgLiwnkC/ulnhSGJ/u2XyKoE/N56d2d46C2Nra3g=;
	h=From:Subject:Date:To:Cc:References:From;
	b=KE4SEBQ26l6lxX381jqVk0oL+gySE9u77Wui03TMdem8UBwYWvzyU/dukgMGiGr5h
	 ayqV4bmD7lwcvLyE5IGn7GOrS5QMvJyHZgzHm9aKtJOV2IxgsQddru8Aw2r2cQCLPU
	 xdYnhkOQbMutJnmQlelaZUqY9YIXC+N5oY/N59oU=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261106135504eucas1p14138c1ce829febb8bcd63c4de1f29ffb~leTc9VSqF0517605176eucas1p1d;
	Fri,  6 Nov 2026 13:55:04 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261106135503eusmtip2ef623fe1ef475ee1b18554c6ad6b987c~leTcEUONE2093020930eusmtip2_;
	Fri,  6 Nov 2026 13:55:03 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Subject: [PATCH v7 0/5] phy: Add the StarFive JH7110 Innosilicon HDMI PHY
Date: Fri, 06 Nov 2026 14:52:58 +0100
Message-Id: <20261106-jh7110-inno-hdmi-phy-v7-0-d49368303800@samsung.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALrb7WoC/3XOwQ7CIAyA4VcxnK1hsAHz5HsYDxO6gXGwDCUuy
	95dtkQTDx7/Jv3amUQcHUZy3M1kxOSiCz6H3O+Ito3vEJzJTRhloqBMwc3KoqDgvA9gTe9gsBM
	ojpVuG1Fy5CSvDiO27rWx50tu6+IjjNN2JVXrdANpzeoPqO/YeIjoDaQKKCh2LY1CroWWp9j08
	em7gw49Wb0kvsb/p5LITMu5rIUqTS3xl1mW5Q2WKpyw/gAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3883;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=o256jFXr6zL1bPuxFl+13GnEJ0mu3QrvYdJuIVka6jY=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWS9vWPOLnuiU2bNPI1Dofp/3uuK2tQet5NvWtGb92D9h
	21Ncwy/dZSyMIhxMMiKKbKc3RhtJPmP4Wn58ce/YOawMoEMYeDiFICJKE1lZFgVuve2wErlg7xr
	z+ZmvBZYt0t5v/VqXRbxd9u3yBwW//iF4X/xmZ2/3u5yeVH6mn/BisSzEnY/gh8xbu5uFZq5c7f
	Lq4vcAA==
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261106135504eucas1p14138c1ce829febb8bcd63c4de1f29ffb
X-Msg-Generator: CA
X-RootMTR: 20261106135504eucas1p14138c1ce829febb8bcd63c4de1f29ffb
X-EPHeader: CA
X-CMS-RootMailID: 20261106135504eucas1p14138c1ce829febb8bcd63c4de1f29ffb
References: <CGME20261106135504eucas1p14138c1ce829febb8bcd63c4de1f29ffb@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_055509_765521_840B78C2 
X-CRM114-Status: GOOD (  18.04  )
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

Patch 5 adds a MAINTAINERS entry for the binding and the driver, as the
other JH7110 PHY drivers have.

Testing
=======

Tested on a VisionFive 2 v1.3B together with the display series, using
modetest: all 42 modes the sink advertises work, with pixel clocks from
25.175 MHz up to 297 MHz.

Every commit builds for riscv and arm.

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
      MAINTAINERS: Add StarFive JH7110 HDMI PHY entry

 .../phy/starfive,jh7110-inno-hdmi-phy.yaml         |  49 ++
 MAINTAINERS                                        |   6 +
 drivers/phy/Kconfig                                |   8 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/phy-inno-hdmi.c                        | 358 +++++++++++++
 drivers/phy/rockchip/Kconfig                       |   1 +
 drivers/phy/rockchip/phy-rockchip-inno-hdmi.c      | 169 +-----
 drivers/phy/starfive/Kconfig                       |  20 +
 drivers/phy/starfive/Makefile                      |   1 +
 drivers/phy/starfive/phy-jh7110-inno-hdmi.c        | 587 +++++++++++++++++++++
 include/linux/phy/inno-hdmi-phy.h                  |  88 +++
 11 files changed, 1144 insertions(+), 144 deletions(-)
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
