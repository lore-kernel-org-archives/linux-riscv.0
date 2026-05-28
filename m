Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3135CD5BD1
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 05:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qsYL4eIeHOB8rfsCosWQykyGXI8Ju+czUZeEcX8bN9s=; b=FSszAHQmYr00TU
	nByecg6BA762NwS8gPbjm+83+mldBwb6nH8JvLlkfLnQsEwsIQoVedtQ/GeOpWk5X7U+l05u1RSn2
	fRcNnVJ5IXMdKqnJ7WNVpulw6PLvX7T1NsdI3ugLrvWXbXz8JQ8TD35G0ovALW4mPFRNDQAe7TxCz
	ahw8faxRCwhhNHS5KxAJoIb6QaweJfO930LfsjhvkVaRwgOtf9rKtaT9Xk6XZbvQ61vdadoj40ch1
	gbMDwZV1LK2GTT4mytLYHN1N/iyYVPVxPyUE8syY7mt7iR1MYt6Zolil0dDsuQuApKf8WPDDxDKxc
	XvZdomRxfAvbJAcE+AmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSTEM-000000058YM-1wYE;
	Thu, 28 May 2026 05:24:30 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSTEI-000000058XS-0Hea
	for linux-riscv@lists.infradead.org;
	Thu, 28 May 2026 05:24:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1779945837; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Lewwv/E5GzToO6cwJ6qFAQjwPR3Tepy8489G9ze+/TW3pwkSZXhaf3JngsOo56ETKwhOfj808rpAm0+jaeW+rbKgKs/06uP3Guy0TKyTGXGaDXvlJeMbRnW7MVKYI6U0nvbWfA4kc1UTf8jhS8ti3mScww+tpHisJrr06wvtFpU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779945837; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Lzm3YWrKP2JFz/K4efBOj3ww3Vn5sEbCNURK4uiazgU=; 
	b=GoHFDTkwXTxbYptD6is3LgwfxmPJZ40ilAZ28sgmDxlARpPWkJKe4iliTrTlbuq81K8gbjRkxQcFng8ECf8Ap1XtI4F8C81byfQ+Mx3uIXUud24WFeLvbvY6NJz3+230SnwJ5gYZf7gw6HAenYZXsQIvO5svdwUPHJBDyVJQfoQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779945837;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=Lzm3YWrKP2JFz/K4efBOj3ww3Vn5sEbCNURK4uiazgU=;
	b=hjYKjbxPTSUqcPo4vIfxLEctXjILEQ6WGd4CbtyaD9eJBpOhe2yuXwtQ8BQzaKjG
	f1oFYmj4THMHW2BcZqjq99wqTIcPDPAO4jfnVzjocP4jVpz2XYtuPAvP862UTpaDVkj
	esWKTQEi9Wt8IqbplrEYZaSm9SJn2D0neOliHNVc=
Received: by mx.zohomail.com with SMTPS id 1779945833882509.0231225374149;
	Wed, 27 May 2026 22:23:53 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH v2 0/3] spacemit: k1: Add support for Banana Pi BPI-CM6 IO
 board
Date: Thu, 28 May 2026 13:22:46 +0800
Message-Id: <20260528-bpi-cm6-v2-0-d0eb3f236cea@pigmoral.tech>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2WOyw6CMBBFf4XM2po+hCIr/8OwKGUKk1jAFomG8
 O9WWLo8N/e1QsRAGKHKVgi4UKRxSCBPGdjeDB0yahOD5LLguZSsmYhZX7DWqtJdBSqHFpJ7Cuj
 ovTfd64MDPl+pcD5EaExEZkfvaa6yMseLzbVSttXw8/cU5zF89iOL2AN/m4tgnGmu0Ymr0Ebx2
 0SdH4N5nGe0PdTbtn0BQUHBKdIAAAA=
X-Change-ID: 20260522-bpi-cm6-dc38f91e3fec
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Paolo Abeni <pabeni@redhat.com>, 
 Guodong Xu <guodong@riscstar.com>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779945818; l=2323;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=J7f2wQORWMO7HgLfF+c02eIZh8ngHo2O6iOfc1N+TAY=;
 b=1SnXTx7VIrfVrpucpNpMyxNBnAH1+6J0bVAg83wpH/aXVz7mSfyftCijL0pgzTJJnHp2oCvPd
 D7VDck2e2iVB6fXVeCcYQpjgT06vVrK8Vwdsow8LcshIYBQmC6KLbMB
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_222426_514792_70B185CD 
X-CRM114-Status: GOOD (  10.12  )
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

This is based on the "dt-for-next" branch of the spacemit-com/linux.

Link: https://docs.banana-pi.org/en/BPI-CM6/BananaPi_BPI-CM6
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
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
 .../riscv/boot/dts/spacemit/k1-bananapi-cm6-io.dts | 213 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi  | 227 +++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |   4 +-
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  |   4 +-
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts     |   2 +-
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts   |   4 +-
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi       |  24 ++-
 9 files changed, 473 insertions(+), 11 deletions(-)
---
base-commit: 85e4c5733cd7efa39f10d7200095c016ce4a2815
change-id: 20260522-bpi-cm6-dc38f91e3fec

Best regards,
-- 
Junhui Liu <junhui.liu@pigmoral.tech>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
