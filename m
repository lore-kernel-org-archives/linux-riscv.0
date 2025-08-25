Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3009CA0EFA
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 15:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5nxwMtcjjhzQmk0Z6RAiaXdHxBVcwiVZPFDqtZ92JwU=; b=cAMsjESaDdFbCe
	1WGI7O/JKf6Ng/qBczJPC73BngngLhhVkdBHQIsfAjHSJxzWdu2aH7EaBXfjQK6baSZaqXuowU/J7
	VLiONznuValqkkqlP6PXqfnN+vzjGdA27I2QUqa/13h0ay1cnF+eGbB55F9E6rT21sPccGFFJPXTo
	gqEhkIHKOEtXYKikdeMM6eIFlhyCt2E5hpjjYdCvzEHLO0lA1wJm7NRfrUtwxSNPGda6mtu5mrPO8
	UUEBoZ1Mp9BxKH1O6yKLYQSzICXvFcQnzQhdL/1uxQ9B8YBRHcKSMt37GSngOMyBveYgWSAwn8aVA
	/IH08jiOHEw0KH+ZD8iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqYg7-00000008Mt6-22gC;
	Mon, 25 Aug 2025 15:00:11 +0000
Received: from naesa05.arrow.com ([216.150.161.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqXBZ-000000084dg-12HC
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 13:24:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=3266; q=dns/txt;
  s=NAESA-Selector1; t=1756128273; x=1787664273;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dDGfVXPTXUc+lhk3Lg39/E3mFbtsIw6OKta/+0yOoR0=;
  b=Q0cV8XPJxArrMkuXvBonYSlKoxiwJV3YXjikAioptvzEKQWLttGYr1Rl
   CD48+p5oIPlvBoFPrOx8mFGwtoByhv0U32uD4MXyiE1n/Roa8zViEYZ3H
   DD3atekduMOvpoa3e0mC7EH37JkRfes+K/siPghHicNQQdq94cKJ2V+Z2
   8Tu7NNANcpMaiHGtY5swRCsONwvn4hGzrh/CF6qOgyGUh3skFX2cy2eRV
   nFIUC2kSwTYs7CyehQHxxC6SfKroCKh2IM9ZpZ07ZzMsqFQqlS3DUEtOh
   LnkV2zyHs2846cuc9YbPAHuHU7+K/aIbdM/clWCfZfcuXhtw6orBp15ha
   g==;
X-CSE-ConnectionGUID: rgkiRk+yQnKG1gZXvHIMDw==
X-CSE-MsgGUID: CEP03HbKSPq9T8xtLIZcBw==
X-IronPort-AV: E=Sophos;i="6.18,213,1751263200"; 
   d="scan'208";a="31566526"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 25 Aug 2025 07:24:28 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Mon, 25 Aug 2025 18:54:27 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev,
	linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: [PATCH v5 0/6] Basic device tree support for ESWIN EIC7700 RISC-V SoC
Date: Mon, 25 Aug 2025 18:54:21 +0530
Message-Id: <20250825132427.1618089-1-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-OriginalArrivalTime: 25 Aug 2025 13:24:27.0736 (UTC) FILETIME=[95074580:01DC15C3]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_062433_361542_A1D7FCE8 
X-CRM114-Status: GOOD (  12.40  )
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

Add support for ESWIN EIC7700 SoC consisting of SiFive Quad-Core
P550 CPU cluster and the first development board that uses it, the
SiFive HiFive Premier P550.

This patch series adds initial device tree and also adds ESWIN
architecture support.

Boot-tested using intiramfs with Linux v6.17-rc3 on HiFive Premier
P550 board using U-Boot 2024.01 and OpenSBI 1.4.

Changes in v5:
- Rebased the patches to kernel v6.17-rc3
- Drop "dt-bindings: vendor-prefixes: add eswin" patch (Patch #3 in v4)
  as it is already applied by Rob Herring [1].
- Link to v4: https://lore.kernel.org/lkml/20250616112316.3833343-1-pinkesh.vaghela@einfochips.com/

[1]:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20250825&id=ac29e4487aa20a21b7c3facbd1f14f5093835dc9

Changes in v4:
- Rebased the patches to kernel v6.16-rc1
- Drop patches that are already merged
- Added "Acked-by" tag of "Min Lin" for Patch 4
- Corrected the commit message of Patch 7 (Patch #10 in v3)
- Added "Tested-by" tag of "Ariel D'Alessandro" for Patch 7
- Link to v3: https://lore.kernel.org/lkml/20250410152519.1358964-1-pinkesh.vaghela@einfochips.com/

Changes in v3:
- Rebased the patches to kernel 6.15.0-rc1
- Added "Reviewed-by" tag of "Rob Herring" for Patch 4
- Updated MAINTAINERS file
  - Add GIT tree URL
- Updated DTSI file
  - Added "dma-noncoherent" property to soc node
  - Updated GPIO node labels in DTSI file
- Link to v2: https://lore.kernel.org/lkml/20250320105449.2094192-1-pinkesh.vaghela@einfochips.com/

Changes in v2:
- Added "Acked-by" tag of "Conor Dooley" for Patches 1, 2, 3, 7 and 8
- Added "Reviewed-by" tag of "Matthias Brugger" for Patch 4
- Updated MAINTAINERS file
  - Add the path for the eswin binding file
- Updated sifive,ccache0.yaml
  - Add restrictions for "cache-size" property based on the
    compatible string
- Link to v1: https://lore.kernel.org/lkml/20250311073432.4068512-1-pinkesh.vaghela@einfochips.com/

Darshan Prajapati (2):
  dt-bindings: riscv: Add SiFive P550 CPU compatible
  dt-bindings: interrupt-controller: Add ESWIN EIC7700 PLIC

Min Lin (2):
  riscv: dts: add initial support for EIC7700 SoC
  riscv: dts: eswin: add HiFive Premier P550 board device tree

Pinkesh Vaghela (1):
  riscv: Add Kconfig option for ESWIN platforms

Pritesh Patel (1):
  dt-bindings: riscv: Add SiFive HiFive Premier P550 board

 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../devicetree/bindings/riscv/cpus.yaml       |   1 +
 .../devicetree/bindings/riscv/eswin.yaml      |  29 ++
 MAINTAINERS                                   |   9 +
 arch/riscv/Kconfig.socs                       |   6 +
 arch/riscv/boot/dts/Makefile                  |   1 +
 arch/riscv/boot/dts/eswin/Makefile            |   2 +
 .../dts/eswin/eic7700-hifive-premier-p550.dts |  29 ++
 arch/riscv/boot/dts/eswin/eic7700.dtsi        | 345 ++++++++++++++++++
 9 files changed, 423 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/eswin.yaml
 create mode 100644 arch/riscv/boot/dts/eswin/Makefile
 create mode 100644 arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
 create mode 100644 arch/riscv/boot/dts/eswin/eic7700.dtsi

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
