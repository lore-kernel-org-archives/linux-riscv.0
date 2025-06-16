Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB488C71136
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Jun 2025 12:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HIMlf7Up5igpwNhigMZjPvFScTCFE/PVqj81DKQIlas=; b=FlCfHgqwqNwxrY
	1jtV4PFB0xdbgQ4Xnp6AsygrRRQc8zrdYaRniRd7zJuq0iHBVL0Eo0W2nNbEBD3Jb+w3Xs+3dyDeD
	f91JWPG9vQ2aLTO2+Wz4Apr3W86xsfjHdfEzOFcYgilZdYxiU4a6P19/GgdnZGBchBh9kgxA5fmrQ
	BWUdw2SQVX3A6h/C2v2bXcGbuPg6v3wNf3nEL7BgKdcjUhXkG0/LH24Ngm2aQDxLKCDdRysxt5Bcj
	P/bG6o42wkwkzkquYsgIRlmmWLSUh9pZQO1iwT9/UNhuP7FUhd0lzK2DKG3n11Qvm6t5vlz2zUDUr
	lQJesm/LaD5GVYZ73ocQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8nX-00000004L4Z-40gC;
	Mon, 16 Jun 2025 12:18:47 +0000
Received: from naesa05.arrow.com ([216.150.161.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR7vx-00000004BaR-0pq5
	for linux-riscv@lists.infradead.org;
	Mon, 16 Jun 2025 11:23:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=2938; q=dns/txt;
  s=NAESA-Selector1; t=1750073005; x=1781609005;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=npKvrSYMx0G7203vj1pvhDj5mrw+axGZsxDIgzM8hM4=;
  b=EgkWzC1Fbtndwl6T61VBAS7PNEAVuwhS3hBmVAje+1nQMv+rCQ3H7dc6
   4d0FY+FMI9zYQz10SmDH2OEAWA4bMmUER5/rYAeWp3xcWfi+q4Y3amw3V
   pxxiFs9f88Eu4lbwjKvbOJ2H7DOCXRV7tWnOx6MnOYmF2bh5YhA1ouZVz
   dOMCR0wBgHQ9EVW0L1eq302YxWilfHMqWc/glq0dcq+OH6C2cQYrEJz2l
   pGCf8Vgiwoou85eE/mHrtgnGSteD/fmFjoCBwUumaEJ8IXMw9N8luiWvT
   1HLC05bR5IG/8TlDSFSx9AWpQp2zy5PaUAhKXtfeoKFRZkPdNR6atak94
   A==;
X-CSE-ConnectionGUID: 5heFyusuT2CiECH8iHH56g==
X-CSE-MsgGUID: M+RciZ61RPe/1R332UDRpA==
X-IronPort-AV: E=Sophos;i="6.16,241,1744092000"; 
   d="scan'208";a="26863642"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 16 Jun 2025 05:23:17 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Mon, 16 Jun 2025 16:53:16 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/7] Basic device tree support for ESWIN EIC7700 RISC-V SoC
Date: Mon, 16 Jun 2025 16:53:09 +0530
Message-Id: <20250616112316.3833343-1-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-OriginalArrivalTime: 16 Jun 2025 11:23:16.0327 (UTC) FILETIME=[0E03CF70:01DBDEB1]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_042325_294262_F236D026 
X-CRM114-Status: GOOD (  12.83  )
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

Boot-tested using intiramfs with Linux v6.16-rc1 on HiFive Premier
P550 board using U-Boot 2024.01 and OpenSBI 1.4.

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

Pritesh Patel (2):
  dt-bindings: vendor-prefixes: add eswin
  dt-bindings: riscv: Add SiFive HiFive Premier P550 board

 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../devicetree/bindings/riscv/cpus.yaml       |   1 +
 .../devicetree/bindings/riscv/eswin.yaml      |  29 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   9 +
 arch/riscv/Kconfig.socs                       |   6 +
 arch/riscv/boot/dts/Makefile                  |   1 +
 arch/riscv/boot/dts/eswin/Makefile            |   2 +
 .../dts/eswin/eic7700-hifive-premier-p550.dts |  29 ++
 arch/riscv/boot/dts/eswin/eic7700.dtsi        | 345 ++++++++++++++++++
 10 files changed, 425 insertions(+)
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
