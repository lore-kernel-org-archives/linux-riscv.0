Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B787C61CE8
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 13:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D63EAksGs7lifLTYrKJOXHR1WupjQvmrzePTTHbVUTY=; b=Wayt7/Al2bP5PB
	jRaMElJIjtgc6CWK/jVjxdWKPQqpgQmY+aLz+61lySBJp2aJ7AqGuTEUGG+/zwGw7UTzfpbiBzk+l
	mhm/Nj0YU1Q2o6xlXbbfhJ/iD0GW1L0mdM9mxVWSBwUbZV5hsak702FhS8txAVrZVHsgrcQlAIVmG
	PJs7iSOkNh3zg3zEK1tL1Gy6qux5600l8D+YoXZH1VGY7+rifg7AG8Ba13+dIhXLPDaaS0s3o+Rpg
	5AVotTizsnwjXDUPuSPSHCf4EQRtiaQFwbVEgJwTNvcedmvX1fuyUNwcpYf3A0t/CygFoP8tQGRQJ
	cOSjcKxNOg8E2odTe2ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOcyz-00000004JUI-1p1A;
	Mon, 09 Jun 2025 13:56:13 +0000
Received: from esa2.hc555-34.eu.iphmx.com ([23.90.104.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOcr4-00000004HoK-25BX
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 13:48:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1749476882; x=1781012882;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=401u0OSH88qHCJmEZO9VJhc7zw1kY/ESQqzyFm/CmVo=;
  b=c1DOmAmuAnxnfecgYep5TyILdfQJbWpY+poRoWdep2l7CghBEO1+YT/t
   8sz4+keQxIg4GfwlzbsjUC0IS2KoP2PCmhrF/yAp2i+YdlQQHKKGx5qmY
   e3asZY2CF54PnSlvCbKxl2zE2aPRDRhXDhgvjvdJiIYqV8Ad8KipFeFS4
   Uqkphb+UG9eAS+PVh3wvF+5W3tlMeNIT+GyIZHvD3XnfBFICJ0Daz/tqv
   28frQZg+XkfCrWjPWLB4rCz0bfuMvoWY5Cn77/UsATCRq6dDKuxHbWrB7
   lmNBJQteg0exKLpkDYrjLc6h/MEo8DfmzNb30i1cKAMo+2EK6RYwMm644
   Q==;
X-CSE-ConnectionGUID: FUCrYnvsRDOTGtVd6qky3A==
X-CSE-MsgGUID: 2LvpZjaFTz2a0dDG0gmmJQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces01_data.me-corp.lan) ([146.255.191.134])
  by esa2.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 16:47:58 +0300
X-CSE-ConnectionGUID: fNBtzWk5Tyilkr2G/AR+EQ==
X-CSE-MsgGUID: MUc4K3FVQWSfV2at324pHw==
Received: from unknown (HELO epgd071.me-corp.lan) ([10.154.54.1])
  by ces01_data.me-corp.lan with SMTP; 09 Jun 2025 16:47:56 +0300
Received: by epgd071.me-corp.lan (sSMTP sendmail emulation); Mon, 09 Jun 2025 16:47:56 +0300
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
	Ryo Takakura <takakura@valinux.co.jp>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: [PATCH v1 0/7] Risc-V ACLINT IPI controller
Date: Mon,  9 Jun 2025 16:47:42 +0300
Message-ID: <20250609134749.1453835-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_064803_027147_2A6DBEE0 
X-CRM114-Status: GOOD (  12.96  )
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

Risc-V specification for the ACLINT IPI controller
describes an "SSWI" device that allows to send IPI by
writing register from the S-mode (Linux kernel),
as opposed to the "MSWI" device that does the same from
the M-mode. Sending IPI through the M-mode requires
extra SBI call, SSWI is much faster. Support for the
SSWI exists for the Thead board, it is almost as by
specification save for reading one custom CSR.

Soon to be released Mobileye SoC based on the MIPS
P8700 Risc-v CPU has pristine ACLINT SSWI.

To support P8700, refactor Thead implementation -
provide generic one while keeping Thead-specific variant.

In addition, support Risc-v "hart index" - it is
required for the MIPS P8700 chip to be released soon

Patches 1 and 2 refactor "hart index" support, replacing
APLIC specific implementation with generic helper

Patch 3 documents generic "riscv,aclint-sswi" and optional
property "riscv,hart-indexes", same as for ACLINT.

Patch 4 promotes Thead-specific SSWI to generic one

Patch 5 adds "riscv,hart-indexes" support

Patches 6 and 7 do some minor improvements for the SSWI

Vladimir Kondratiev (7):
  riscv: helper to parse hart index
  irqchip: riscv aplic: use riscv_get_hart_index()
  dt-bindings: interrupt-controller: add generic Risc-v aclint-sswi
  irqchip: introduce generic Risc-V aclint-sswi
  irqchip: aslint-sswi: resolve hart index
  irqchip: aclint-sswi: reduce data scope
  irqchip: aclint-sswi: remove extra includes

 .../riscv,aclint-sswi.yaml                    |  89 ++++++++++++++
 .../thead,c900-aclint-sswi.yaml               |  58 ---------
 arch/riscv/include/asm/irq.h                  |   2 +
 arch/riscv/kernel/irq.c                       |  34 ++++++
 drivers/irqchip/Kconfig                       |  12 ++
 drivers/irqchip/Makefile                      |   2 +-
 ...d-c900-aclint-sswi.c => irq-aclint-sswi.c} | 114 ++++++++++++------
 drivers/irqchip/irq-riscv-aplic-direct.c      |  16 +--
 8 files changed, 214 insertions(+), 113 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aclint-sswi.yaml
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
 rename drivers/irqchip/{irq-thead-c900-aclint-sswi.c => irq-aclint-sswi.c} (63%)


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
