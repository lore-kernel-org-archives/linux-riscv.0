Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E87FC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Jun 2022 00:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=88By5NbMnF/cakbURQdhAeOxM8I7KbL1b5C/fvKdgMY=; b=rNhrqu61qj3G1I
	lTEHNP81q7H4SL3HmgPrzsG7FI9zYHi50I9QygxgGiObxJ5IzLA1qPs9UYbou9JwoyGDkp25oHyqD
	29q4FxiCPhakua082b2t/3xOf04ZRfOzoznW22OIOCKXjU9A/8RRj60OJXh1fmhiJcRXmgPHQAFhX
	cLjoKF+IfrnbtqRzzHR7JSPXhoGkRiVyvZsZ+46PoPo0lZ+zwMJwVaVnOPyB/TanHWNAvx0W9JpDd
	mEG47XokW0RfnOaaxVjPeyS0AjKGHszOka69C50mCxdhntpK0nJ/Egl3TAYK2dx1Qg1uoc2JePSrH
	J8pk44KrxBZ+tsuAObtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5GNy-008jbf-Q2; Sun, 26 Jun 2022 00:44:22 +0000
Received: from relmlor2.renesas.com ([210.160.252.172] helo=relmlie6.idc.renesas.com)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5GNv-008jZg-Di
	for linux-riscv@lists.infradead.org; Sun, 26 Jun 2022 00:44:21 +0000
X-IronPort-AV: E=Sophos;i="5.92,222,1650898800"; 
   d="scan'208";a="125658100"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Jun 2022 09:44:14 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0B8314008C71;
	Sun, 26 Jun 2022 09:44:09 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] Add PLIC support for Renesas RZ/Five SoC
Date: Sun, 26 Jun 2022 01:43:24 +0100
Message-Id: <20220626004326.8548-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220625_174419_601030_9C8EB441 
X-CRM114-Status: UNSURE (   8.16  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi All,

This patch series adds PLIC support for Renesas RZ/Five SoC.

Sending this as an RFC based on the discussion [0].

This patches have been tested with I2C and DMAC interface as these
blocks have EDGE interrupts.

[0] https://lore.kernel.org/linux-arm-kernel/87o80a7t2z.wl-maz@kernel.org/T/

v1-v2:
* Fixed review comments pointed by Marc and Krzysztof.

RFC-->v1:
* Fixed review comments pointed by Rob and Geert.
* Changed implementation for EDGE interrupt handling on Renesas RZ/Five SoC.

RFC: https://lore.kernel.org/linux-renesas-soc/
20220524172214.5104-2-prabhakar.mahadev-lad.rj@bp.renesas.com/T/

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: interrupt-controller: sifive,plic: Document Renesas
    RZ/Five SoC
  irqchip/sifive-plic: Add support for Renesas RZ/Five SoC

 .../sifive,plic-1.0.0.yaml                    | 44 ++++++++++-
 drivers/irqchip/Kconfig                       |  1 +
 drivers/irqchip/irq-sifive-plic.c             | 73 ++++++++++++++++++-
 3 files changed, 113 insertions(+), 5 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
