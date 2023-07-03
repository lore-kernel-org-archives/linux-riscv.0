Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5944C001DF
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 10:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+ujBQHMMGVvOrqZ/A3f8CjrBu28LErJLY/dpBJ2q07M=; b=zJ1LsM6D+yUTN8
	YVgHxy79naUCCSj3nRXweT0G5ygFiV4DYsStoImqe2xhwIR0ld5WjvRvv2nQBHfjW+YMVCOluFgJz
	OqehPsQHDPkRApb1KiM7XIrCOJ1oFpm5cYvBiZiLjsOZFQoQZVQQhh/rD4eNstoMsSUoRcx2qUaHP
	N73UIbfPnY9eKR8STYVnvsRLjMHbqcka9i49YoOOIT9d2R1S6SdoF4sVDmSvZ9AUWCW+aWuHFOAn/
	CMuOFlhyB3++G4embiksKQ0JappSE9YWu3DmrUj+xg/JhJVZSRzi4cZbJA+wLZDWhJEK11CClbv3F
	7VuXiq8uBmxhxebABfdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGnz-00AEL7-1B;
	Mon, 03 Jul 2023 10:29:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGGnw-00AEI7-0y
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 10:29:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688380153; x=1719916153;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9gC2ucQs56hznJJn3CZLdBAIp3rcInl7wiNCLwEz1B4=;
  b=OwDvpfSaJLs5klUXqz6QmEnRT2qmXdRmSmCDDdbbJY1mLQ+KXmJB96AM
   RVRVkz8UdzNdvHu7QcYWlXkaFx0bJP678xHvNYTi2a4mgI5bxSb5ffVBz
   Wvi8ic7cIA2YyhemBQ+z2qra8EoeG0jJaaojVsxwqQ3YKb5cuMz4U469h
   F1zM75F5W2LqAPaNoflEcj4nPt59Pl8NHjXfIkPyZNsZfUknsfvZlaG38
   +RkOsbTV8HhjjJQ/DMb0xDz2GFRBmbQhlGHTLF8Ad93QZegwYSdUVnX9Q
   DddLLWw537dyrsHUGMIW7eJ8nNvRR0XZTNTdJcNL3YpTaZQPi/esHB1+/
   g==;
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="221754598"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Jul 2023 03:29:11 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 3 Jul 2023 03:28:57 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 3 Jul 2023 03:28:54 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v3 00/11] RISC-V: Probe DT extension support using riscv,isa-extensions & riscv,isa-base
Date: Mon, 3 Jul 2023 11:27:52 +0100
Message-ID: <20230703-repayment-vocalist-e4f3eeac2b2a@wendy>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2944; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=9gC2ucQs56hznJJn3CZLdBAIp3rcInl7wiNCLwEz1B4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmLFq3c6XLDgcsgL1aUrfGD5vL/W466rspkq/9zR4tna+QZ DpOYjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExk2x1Ghu8+n1RN27+92X9uocHiE8 6tyyyy+3WtDfe0SiZzPO00KWZkmBIyVe4o6/f1bWeWsrbdyNysnzvNTX42u1DbhL2zj1Q+YQYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_032912_354178_67CC76B4 
X-CRM114-Status: GOOD (  12.61  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Jonathan
 Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, conor@kernel.org, conor.dooley@microchip.com, Rob Herring <robh+dt@kernel.org>, Evan Green <evan@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Heiko
 Stuebner <heiko.stuebner@vrull.eu>, Andrew Jones <ajones@ventanamicro.com>
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

In v3, there's the new commandline option that Drew suggested. I have
Also picked up a patch from Palmer that adds more helpful prints where
harts fail the checks in riscv_early_of_processor_id(), and I've
sprinkled a few more of those prints in my new additions to the
function.

Cheers,
Conor.

[1] https://lore.kernel.org/all/20230702-eats-scorebook-c951f170d29f@spud

CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: Jonathan Corbet <corbet@lwn.net>
CC: Andrew Jones <ajones@ventanamicro.com>
CC: Heiko Stuebner <heiko.stuebner@vrull.eu>
CC: Evan Green <evan@rivosinc.com>
CC: Sunil V L <sunilvl@ventanamicro.com>
CC: linux-doc@vger.kernel.org
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
  RISC-V: provide Kconfig & commandline options to control parsing
    "riscv,isa"

Heiko Stuebner (1):
  RISC-V: don't parse dt/acpi isa string to get rv32/rv64

Palmer Dabbelt (1):
  RISC-V: Provide a more helpful error message on invalid ISA strings

 .../admin-guide/kernel-parameters.txt         |   7 +
 arch/riscv/Kconfig                            |  18 +
 arch/riscv/include/asm/hwcap.h                |  17 +-
 arch/riscv/kernel/cpu.c                       | 177 ++----
 arch/riscv/kernel/cpufeature.c                | 519 ++++++++++++------
 5 files changed, 436 insertions(+), 302 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
