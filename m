Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD01C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 May 2022 17:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fJEBaa/F9pdH+ssk3eeMbyEXYsR4I9mZy3I0GgiLmDs=; b=zu0LxxywGOxhbL
	PGfZ9JayW1HbcKuvrQ3FQDrA8pm0pIuSpOkdoy5t9tAYKt+X0lqNKN1jFtJrp7USGKlLoDqeqS5tt
	orjyfYtrXqaRA3zwGqUnQVuJcSqn7EilkzR1qbnaTAJjUDrhmecCOpSCVuw4zUzSv1SNubRvZVOR5
	d9DCvmlFG4eB/c0e9LcYH1LNDwDpgXV7KJNwaJ3uVSPWsXTgzJKnwOSS+hQCCIQVJIhExTw6tSCl3
	qHRTbZYI/9lxrbDITUx5ZQb9tnT5sUM8hO4hHhEYbpN8cmnxIpsP3m6yz8OknmEBEipAl/Pkce+LQ
	glx9PwxbxWZe8Nu8iLLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntYEt-008kjZ-Fj; Tue, 24 May 2022 17:22:35 +0000
Received: from relmlor1.renesas.com ([210.160.252.171]
 helo=relmlie5.idc.renesas.com)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntYEq-008kir-R8
 for linux-riscv@lists.infradead.org; Tue, 24 May 2022 17:22:34 +0000
X-IronPort-AV: E=Sophos;i="5.91,248,1647270000"; d="scan'208";a="120749683"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 25 May 2022 02:22:27 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 146E9400F50C;
 Wed, 25 May 2022 02:22:21 +0900 (JST)
From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Prabhakar <prabhakar.csengg@gmail.com>,
 Phil Edworthy <phil.edworthy@renesas.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC 0/2] Add PLIC support for Renesas RZ/Five SoC
Date: Tue, 24 May 2022 18:22:12 +0100
Message-Id: <20220524172214.5104-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_102233_002487_2BF87594 
X-CRM114-Status: UNSURE (   8.28  )
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
blocks have edge interrupts.

[0] https://lore.kernel.org/linux-arm-kernel/87o80a7t2z.wl-maz@kernel.org/T/

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: interrupt-controller: sifive,plic: Document Renesas
    RZ/Five SoC
  irqchip/sifive-plic: Add support for Renesas RZ/Five SoC

 .../sifive,plic-1.0.0.yaml                    | 38 +++++++++-
 drivers/irqchip/Kconfig                       |  1 +
 drivers/irqchip/irq-sifive-plic.c             | 71 ++++++++++++++++++-
 3 files changed, 105 insertions(+), 5 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
