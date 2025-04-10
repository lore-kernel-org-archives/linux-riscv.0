Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C41C3601E
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 16:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NJIf9WGlY6cCtfi2XKl+c83RokNtQIrxuhEtWv1UMwQ=; b=1fTJeqHFL3Gk7R
	AaFa6zM+A4vTyJlqLeNQORfNq5IU4aMuSnQUJoZXt/GSy2cQTQGj1dvRWwlYf6BSwG0ojP6v4JjZD
	Qu/9jVEyhz5aSP4GVkwzTGeLxPx1YIS4tLADZi4cv8dS/R5zs9j3X9Ql+SnByR8Qi81DHmenXS+b4
	UZk4StUeU5b6hivVylNygnKFD1b7NiRaNguhaiRwn1uG372FKSkQZJUIA3dN5cyT6m2/46+3e0vcH
	V1wGfT8SJbLe6OJg+/ADPEtlpA8YoGK5u2aT9E/qicO7bNuICkEqjTfvAgmgIfxT8DlFK6rwIEGX3
	L5Go66igIXFSEmeaFPMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ugj-0000000BA7T-42pF;
	Thu, 10 Apr 2025 16:23:37 +0000
Received: from naesa05.arrow.com ([216.150.161.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2tmQ-0000000B0RB-1cbM
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 15:25:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=2930; q=dns/txt;
  s=NAESA-Selector1; t=1744298727; x=1775834727;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wTMglkbKtKlUQaNdqRRsMnBsbEkE93BSbw4z93ZZKIk=;
  b=QrAymc7868vsCtuV7jI0chY21a7XlWJdDieKTNUBAJ5jEZJn6V/Bx6C+
   XDUSIno6Y8aYhdzB8M96RwTnuGPwb728GQoAuaDsgq9N8kPByPxLKcgiC
   63b9tOe2i/qVK3dRTMEfspzIxjkdNOXSIR87BwZ58HPwh7rSQnUpAoX8V
   5+uoHsDsQt3QscwrTlCFqk+NkeaWZdjGxkkgJT3+d8sUaoQPPA+npP1Y/
   86+ILXVG+bVONajjOV+rh8XR/1G+YGJ34ao+koTLe3M2jvEGVqzttlIXq
   EsK81U2/qBY5bVpAluoRG5xt2fE7PU21xmOFlcvvcjnEPIbg5wXrqcp4u
   A==;
X-CSE-ConnectionGUID: abq/A8neRh2C4UhefWauLQ==
X-CSE-MsgGUID: E/VmQqY5T6m1wLlA9INYtA==
X-IronPort-AV: E=Sophos;i="6.15,202,1739862000"; 
   d="scan'208";a="22515069"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa05out.arrow.com with ESMTP; 10 Apr 2025 09:25:21 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Thu, 10 Apr 2025 20:55:19 +0530
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
Subject: [PATCH v3 00/10] Basic device tree support for ESWIN EIC7700 RISC-V SoC
Date: Thu, 10 Apr 2025 20:55:09 +0530
Message-Id: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-OriginalArrivalTime: 10 Apr 2025 15:25:19.0568 (UTC) FILETIME=[C4DD4500:01DBAA2C]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_082526_492186_08BA6588 
X-CRM114-Status: GOOD (  12.62  )
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

Boot-tested using intiramfs with Linux 6.15.0-rc1 on HiFive Premier
P550 board using U-Boot 2024.01 and OpenSBI 1.4.

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

Darshan Prajapati (3):
  dt-bindings: riscv: Add SiFive P550 CPU compatible
  dt-bindings: interrupt-controller: Add ESWIN EIC7700 PLIC
  dt-bindings: timer: Add ESWIN EIC7700 CLINT

Min Lin (2):
  riscv: dts: add initial support for EIC7700 SoC
  riscv: dts: eswin: add HiFive Premier P550 board device tree

Pinkesh Vaghela (2):
  riscv: Add Kconfig option for ESWIN platforms
  cache: sifive_ccache: Add ESWIN EIC7700 support

Pritesh Patel (3):
  dt-bindings: vendor-prefixes: add eswin
  dt-bindings: riscv: Add SiFive HiFive Premier P550 board
  dt-bindings: cache: sifive,ccache0: Add ESWIN EIC7700 SoC
    compatibility

 .../bindings/cache/sifive,ccache0.yaml        |  44 ++-
 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../devicetree/bindings/riscv/cpus.yaml       |   1 +
 .../devicetree/bindings/riscv/eswin.yaml      |  29 ++
 .../bindings/timer/sifive,clint.yaml          |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   9 +
 arch/riscv/Kconfig.socs                       |   6 +
 arch/riscv/boot/dts/Makefile                  |   1 +
 arch/riscv/boot/dts/eswin/Makefile            |   2 +
 .../dts/eswin/eic7700-hifive-premier-p550.dts |  29 ++
 arch/riscv/boot/dts/eswin/eic7700.dtsi        | 345 ++++++++++++++++++
 drivers/cache/sifive_ccache.c                 |   2 +
 13 files changed, 469 insertions(+), 3 deletions(-)
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
