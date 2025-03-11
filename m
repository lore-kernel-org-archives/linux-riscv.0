Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE14C28B2F
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 07:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g00bgd8c1EZnRk4vSV9DOyxdG7h6C4Z/PvWyRy9bFPg=; b=EtSzpuPxj6zMgH
	3BPhYqj34CxHYYYi3QIEfQvnIAFeTr6NYsg1sL5ioMMbPwwJonR2co/iJTzCmokZoBlDg4i7atK2P
	shwmbDJQ05XoIcL0aNOOpqQg/6E41e0kuPrGlfJSfud+JO0l1AMaeZ1eQPMTEnjef2v+Pc9ixx7iL
	ZTxorO5DP2TpcQWpoV3d+bDvLNzkv+5l8qZQzHolelAvPrIfLUdr2hXRtt9zsEvdxZlQXUcZQ7F8Q
	ugV7QYC+qizZZA4TVoEsNi+1l/FrkX6+pXYdZwzYcFPTQtw4y8o6Q2a/L3QoaDrBrcFIfaQ2b7470
	whxe87RMCOoTnltqFkog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tru9b-00000004qz1-2buX;
	Tue, 11 Mar 2025 07:35:55 +0000
Received: from naesa03.arrow.com ([216.150.161.23])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tru8M-00000004qda-3mlz
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 07:34:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=2107; q=dns/txt;
  s=NAESA-Selector1; t=1741678479; x=1773214479;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=j+xRRvEsQ5Zde71RH9nSywG6D5xyLD8tE9QtSC9gGFo=;
  b=M9oo8DhBRynK3XoO++7teQ6L9V+KyHnSD6jeBeRYIcY18kd4KQOPlst9
   9kRhDRaPGUWAVF6swo6fKeqjxPEDVchpw+Q8MYCJ9xSN7DaBDPDgkfyT3
   5N/c/vIR2N4byqWeSEKBl87bTTl/8QJvAexnFtz0SESvMMC1py3WelZih
   3vMFlLHKofqkTkletcI6I6TKWkbCn+xb+hY3SdK38RdGuwMHiBhoosVyx
   BkdESYRbn+NuA2eBXj3I7sOqoJlzc6WyCDM6OLARgcNgfDazTamfXJGqR
   HPuYyg7XlzAXvGFw11Gt3VrC8faqcNJq2bfQPAMH1ACXe4kLmEfTIxMoc
   w==;
X-CSE-ConnectionGUID: A5Mnuea5Ska2Pw6AKqXuDw==
X-CSE-MsgGUID: 8+mk7G2URVe+q4fIuxczNQ==
X-IronPort-AV: E=Sophos;i="6.14,238,1736838000"; 
   d="scan'208";a="79624698"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa03out.arrow.com with ESMTP; 11 Mar 2025 01:34:33 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Tue, 11 Mar 2025 13:04:32 +0530
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
Subject: [PATCH 00/10] Basic device tree support for ESWIN EIC7700 RISC-V SoC
Date: Tue, 11 Mar 2025 13:04:22 +0530
Message-Id: <20250311073432.4068512-1-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-OriginalArrivalTime: 11 Mar 2025 07:34:32.0718 (UTC) FILETIME=[080982E0:01DB9258]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_003439_003796_7148123E 
X-CRM114-Status: GOOD (  10.88  )
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

Boot-tested using intiramfs with Linux 6.14.0-rc2 on HiFive Premier
P550 board using U-Boot 2024.01 and OpenSBI 1.4.

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

 .../bindings/cache/sifive,ccache0.yaml        |  28 +-
 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../devicetree/bindings/riscv/cpus.yaml       |   1 +
 .../devicetree/bindings/riscv/eswin.yaml      |  29 ++
 .../bindings/timer/sifive,clint.yaml          |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   7 +
 arch/riscv/Kconfig.socs                       |   6 +
 arch/riscv/boot/dts/Makefile                  |   1 +
 arch/riscv/boot/dts/eswin/Makefile            |   2 +
 .../dts/eswin/eic7700-hifive-premier-p550.dts |  29 ++
 arch/riscv/boot/dts/eswin/eic7700.dtsi        | 344 ++++++++++++++++++
 drivers/cache/sifive_ccache.c                 |   2 +
 13 files changed, 450 insertions(+), 3 deletions(-)
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
