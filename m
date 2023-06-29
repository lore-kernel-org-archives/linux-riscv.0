Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7C0EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jun 2023 08:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sjF/Q/PH9wOxU53TkQ/zi5/Jl4w9A8eMYbLhn7Gndaw=; b=iSggRAhgjb9Fp5
	2D/WK2ejSJYdSSsjDN8Em0cyXN1xlYMBS7/lielRvPpdtBA09+Q3CJZnoPP0m5bjgICB/jJJTzH18
	00ItydEfv5a77dCkQjFrLzasI+Tf2thqOR3p1HEXnCsSHc9oUY8O6Om/oDc4Vk2xkim3brl8xtxBN
	eq5PTkE8vPvNuIJVfvjjsdx/mK273R6+c/XlZID1J889MAdnn1gtVshkSdYua7M+mV7PSFOfIAIWs
	u2q/IwvB0AiosWcZxVlgm1Ck9J/9QO8hgeEbktjMlDRkOT7rb0N51TNdAH85zyxvCBcNdYHQ6xd9+
	iLQ/SW2RghlcsrFk2Ytw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEn30-000OIG-0O;
	Thu, 29 Jun 2023 08:30:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEn2w-000OEQ-0s
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jun 2023 08:30:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688027434; x=1719563434;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KZlJAN5cRFkMBY+OE7iYPyyn0+Rt2+bwI5SCEwY9G6w=;
  b=12KX6nuJClfxgp1paKDw/O34ndtERYEHGsVP8XULPGUuPKiT8vsH4DYs
   zmLzbAmE10dtBOe8dOzrwrIas2MjP4zMPuNhuXzYPrBpQ2j1RD+wGSUhK
   5+79LOuqjCP/dF8NO6G/SUro3fe4hJEd6mPdkzt2X+4bIsUE8oMroI8Lf
   ZvG3HcYGihIddMJh23RAwJ4N19cTyhlK+ZLij2jUWCO0oYRXCVAa0UFl9
   LAi3Z9RAoigCfpUWbR+2GGKYu59HpV0fgwNfEdN4fplDoK+wCrNPQo0/W
   Tyi3Lu24x2vEvqoTxVG0al2StrrC1zIJ5TB1EbkiWvh10sO5fb1DN73h4
   Q==;
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="222438401"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Jun 2023 01:30:33 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 29 Jun 2023 01:29:47 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Thu, 29 Jun 2023 01:29:45 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v2 00/10] RISC-V: Probe DT extension support using riscv,isa-extensions & riscv,isa-base
Date: Thu, 29 Jun 2023 09:28:46 +0100
Message-ID: <20230629-rebuttal-vagueness-a699deb7c7b3@wendy>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2381; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=KZlJAN5cRFkMBY+OE7iYPyyn0+Rt2+bwI5SCEwY9G6w=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClzHQ6sUZ67SmqNvMmMG9E6TdErs2tDlNre2DdU5QauPux1 RCOpo5SFQYyDQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABP5ycHwVy7+XkjYS6+NnC/eOz6O+p 8+k+Ov1S7hneVrmIqWXX4lp8nwh+NyhL7gbKMN3G8bNXeL62yIUp187NWfH29Pznr95gDzK2YA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230629_013034_409788_A3074210 
X-CRM114-Status: GOOD (  11.80  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, conor@kernel.org, conor.dooley@microchip.com, Rob Herring <robh+dt@kernel.org>, Evan
 Green <evan@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hey,

Based on my latest iteration of deprecating riscv,isa [1], here's an
implementation of the new properties for Linux. The first few patches,
up to "RISC-V: split riscv_fill_hwcap() in 3", are all prep work that
further tames some of the extension related code, on top of my already
applied series that cleans up the ISA string parser.
Perhaps "RISC-V: shunt isa_ext_arr to cpufeature.c" is a bit gratuitous,
but I figured a bit of coalescing of extension related data structures
would be a good idea. Note that riscv,isa will still be used in the
absence of the new properties. Palmer suggested adding a Kconfig option
to turn off the fallback for DT, which I have gone and done. It's locked
behind the NONPORTABLE option for good reason.

In v2, I've also come up with a more reasonable name for the new
function I added & fixed up various comments from Drew and Evan.

Cheers,
Conor.

[1] https://lore.kernel.org/all/20230626-unmarked-atom-70b4d624a386@wendy/

CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: Andrew Jones <ajones@ventanamicro.com>
CC: Heiko Stuebner <heiko.stuebner@vrull.eu>
CC: Evan Green <evan@rivosinc.com>
CC: Sunil V L <sunilvl@ventanamicro.com>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Conor Dooley (9):
  RISC-V: drop a needless check in print_isa_ext()
  RISC-V: shunt isa_ext_arr to cpufeature.c
  RISC-V: repurpose riscv_isa_ext array in riscv_fill_hwcap()
  RISC-V: add missing single letter extension definitions
  RISC-V: add single letter extensions to riscv_isa_ext
  RISC-V: split riscv_fill_hwcap() in 3
  RISC-V: enable extension detection from new properties
  RISC-V: try new extension properties in of_early_processor_hartid()
  RISC-V: provide a Kconfig option to disable parsing "riscv,isa"

Heiko Stuebner (1):
  RISC-V: don't parse dt/acpi isa string to get rv32/rv64

 arch/riscv/Kconfig             |  16 ++
 arch/riscv/include/asm/hwcap.h |  16 +-
 arch/riscv/kernel/cpu.c        | 158 +++-------
 arch/riscv/kernel/cpufeature.c | 507 +++++++++++++++++++++------------
 4 files changed, 398 insertions(+), 299 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
