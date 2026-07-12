Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A587C44501
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Jul 2026 04:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L90L7iGPHYhPEDrj7lGY17BY5Hc3YHwqg+Cd7lZk7yU=; b=Q1ztEpndVLTsRR
	dCvtsFbSKRRkZcAJiN8AJX0AgSICMXcv9TYLZeRhgrWet9WAwoRL45QFa5p9cE1ynBaDK/DLZVlPw
	GvoG3gRMjLCl90QEBe5n9hDh5LEUyD7Mdg5g+dxqVymoF0Elo5Y03JRDRztaNUHDIkVFzeq02D2kX
	dMboKA7PI7758ueJMacZ/g0J83wHdrN+HCbyloXEC7bIw6YN4JC/QBH6KG2CrTyZqheq/MgYzMZAE
	1T7QlH38aKoTAtJkmlruKDLiQHFuEq9U5YpSbwEmJcM9Vz6IEpbFoClniolQAU7+YwzIehKNb8IE6
	Mnqjdy8XVwXpxhT6ltdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wilNI-000000076ri-1NRH;
	Sun, 12 Jul 2026 04:01:04 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wilNF-000000076qg-3Bqt
	for linux-riscv@lists.infradead.org;
	Sun, 12 Jul 2026 04:01:03 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1783828839; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AoIicxmLV6OUnyp0cFxOOjHslEVx3rB07tTxvdFjhw74lx720FeqKYjocfzFE/ujdL4urHG38iq12LMt4shTGflGuN+G7c7xLuir4Ek/rTf2m+W04hVwWf+//YyTUDhv3bZuZp2ObR8/WCfG/njL6sj8Aq0CB9e57SgKMwoGm78=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1783828839; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=sxgMUK4leE9QWcjxVwljumsqOPffhM1uKVFIxXk15jM=; 
	b=LHyh7drvGCjYnFXK15mBzkP88TC4qu5dyTfLR7E8xTUVsYomU5/HSm+ZY6ECD0CPGtq1UPqf4eHRYdQT9o6rmlFqhIC33qOdmSclWimFZ3cw9Di7XvVx+tItu4qEGu+KK/EdUbYEbKzj+TIKiE6nlMsWh+WL/GIme9y2TtuEfg4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1783828839;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=sxgMUK4leE9QWcjxVwljumsqOPffhM1uKVFIxXk15jM=;
	b=l2S7Hmft+4LQBWykqqWShcAXyzlWZI0Glx5oWLGMajMmGONhMlLYRuZzdrlYnlcR
	WkgWXIHh/l67Ajy/FnJ6HBxe7z1/Vif8/oqi/tbO/F0uOdfugLp/xolSr5qgBrShXD9
	pZwWtn8yaHLWh+d+ApFKdjj09MLvskaq2sHbyF0c=
Received: by mx.zohomail.com with SMTPS id 1783828837085345.73913355068294;
	Sat, 11 Jul 2026 21:00:37 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH v3 0/3] spacemit: k1: Add support for Banana Pi BPI-CM6 IO
 board
Date: Sun, 12 Jul 2026 12:00:00 +0800
Message-Id: <20260712-bpi-cm6-v3-0-8d1e2045179d@pigmoral.tech>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WNyw6CMBBFf4XM2po+Ig9X/odxUcoUJpFXi42G8
 O8WXGB0eW7mnJnBoyP0cE5mcBjIU99FUIcETKO7GhlVkUFymfKTlKwciJk2ZZVRuS0EKosG4vX
 g0NJzK11vH3Y4PmJw2seG/NS71/YtiHX9DwfBOMt4hlYUItOKXwaq297p+3FC08DaCfLbzXdXR
 rfiWCorVWpQ/7rLsrwByFNphPMAAAA=
X-Change-ID: 20260522-bpi-cm6-dc38f91e3fec
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Guodong Xu <guodong@riscstar.com>, Yangyu Chen <cyy@cyyself.name>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Paolo Abeni <pabeni@redhat.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783828822; l=2474;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=O03rd95rLTU1Dxveo4k6sEWLV/W7qWnJWqsuUvJW/Zk=;
 b=xx0DNzPTLuQ1kJQCbT8D2D8FunRl9hCmDJtpOmAD4JmJjRaB56Pcf22rOu2beVES1uAKHqrLo
 /CS2qpMvJxqB0c+zMnNMsf0IEsK6mIjFJ/bw8V9ddqMg/7BV7hSm1yb
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_210101_852890_C859F7E8 
X-CRM114-Status: GOOD (  10.46  )
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

This adds initial support for the Banana Pi BPI-CM6 IO board. The
BPI-CM6 is an industrial-grade RISC-V compute module powered by the
SpacemiT K1 SoC, featuring board-to-board connectors similar to the
Raspberry Pi CM4 form factor. For evaluation and development, the module
is paired with a companion IO carrier board.

During the board bring-up, GPIO45 and GPIO46 were found to be used by
the BPI-CM6 hardware as Ethernet PHY reset GPIOs, while the common K1
GMAC pinctrl groups currently mux them as optional GMAC reference clock
pins. Since the reference clock pins are not required on all K1 boards,
the second patch separates them into independent pinctrl groups so board
DTS files can select them only when the signal is actually wired.

Link: https://docs.banana-pi.org/en/BPI-CM6/BananaPi_BPI-CM6
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
Changes in v3:
- Remove uncontrolled always-on intermediate fixed regulators to
  reduce device tree bloat
- Rebase to v7.2-rc1
- Link to v2: https://lore.kernel.org/r/20260528-bpi-cm6-v2-0-d0eb3f236cea@pigmoral.tech

Changes in v2:
- Keep gmac_clk_ref pinctrl groups referenced on existing boards where
  the pins are routed to optional PHY refclk paths
- Remove duplicate vpcie3v3-supply property from pcie1 and pcie2 nodes
- Collect tags
- Link to v1: https://lore.kernel.org/r/20260522-bpi-cm6-v1-0-707ef1917a30@pigmoral.tech

---
Junhui Liu (3):
      dt-bindings: riscv: spacemit: Add Banana Pi BPI-CM6 compatible
      riscv: dts: spacemit: k1: Split gmac_clk_ref into independent pinctrl groups
      riscv: dts: spacemit: k1: Add Banana Pi BPI-CM6 IO board

 .../devicetree/bindings/riscv/spacemit.yaml        |   5 +
 arch/riscv/boot/dts/spacemit/Makefile              |   1 +
 .../riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts | 177 +++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi  | 217 +++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |   4 +-
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  |   4 +-
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts     |   2 +-
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts   |   4 +-
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  24 ++-
 9 files changed, 427 insertions(+), 11 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260522-bpi-cm6-dc38f91e3fec

Best regards,
--  
Junhui Liu <junhui.liu@pigmoral.tech>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
