Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C9AEB64D9
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jul 2023 09:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JXOE1lP5hgQ7T8a0oCJNG91YFCEuF+ykcSqDAfWRfDI=; b=R2GxwYlGZHOuMe
	MRtVOT5pZyJsLxRNti21LP5UYpB9MBu/D7moYgkHgcZZ8N4H6XYpzYR/4qlBlRbt2PfmZtsJdVQ8q
	CStPpPqrKF8QPo2X61A99ysKlwzlnx/xafKyhEoCCYlMZNsS8gVoaVGigGT0NHTEmONq8UdKMOUJy
	F/ewoJNQcX0/L36daqBcR+NoCNFQyLKXtcl03V29ERTGAd7qyAIPg/ZCy21JBJK2Rt0u5/+Aq3jTP
	ffSRRJYUQZZeFKQP+bmdOBI8trJakR8EuFZYNn9nSKljFqKNdi1P0Q23o/W14k2hJLKEWJs/C2JcB
	0Lt5YBbhyWZdQJhSDMqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qInJo-00B2mf-1P;
	Mon, 10 Jul 2023 09:36:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qInJl-00B2l3-2X
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jul 2023 09:36:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1688981789; x=1720517789;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9rB6ZsE5tPURsFe8y5ewohv7eTrARShb30ruo1UoOps=;
  b=zo3dJhZt2Xj7BNL0HdCZuGC85uiekaVUM2Tq4sLFeF/4Z20OXBi3ua8f
   iV3HH2PeXR8MZ2gLZ1ytUoys7lma8xYTSJ5h6bxJeC0i0sdShEf/mScuD
   k9bVvsh5oB+iE0pcVThx0TqLcPPHWasVFHs0YzcDLLU5XluJtFdSwuuAH
   3MpOburLorMG0QAvJ86apSAIA67iKkxduFEXVp+GIH3NdQCEu5mSuH/Ww
   TVJm8hsAf0LbkAKa+bfzOzdy2IsvgkbBo0T861e+YEWlsGInonfradihI
   ww4bY0fjv8zVC1N0xhtOIQxGiOiwobb2irosCoDEeYLMBthVjDKJTIn4J
   A==;
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200"; 
   d="scan'208";a="234573261"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Jul 2023 02:36:28 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 10 Jul 2023 02:36:27 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 10 Jul 2023 02:36:25 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v4 00/11] RISC-V: Probe DT extension support using riscv,isa-extensions & riscv,isa-base
Date: Mon, 10 Jul 2023 10:35:35 +0100
Message-ID: <20230710-equipment-stained-dd042d66ba5d@wendy>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2986; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=9rB6ZsE5tPURsFe8y5ewohv7eTrARShb30ruo1UoOps=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmrL1zlWb+3V/50SaXq/huKDB8Usyvkp3i5qi+/ymG78oX6 +kznjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExksTrD/9g/CvNNd37zqYub35Tscv q/+UyjYycbXKeFe12v8tJRKmP4X7g5fOnFvbsNO3Sv6r3b9b3xymKnbpFIO4/QGevP5eRsYgEA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230710_023630_011599_1D5FB403 
X-CRM114-Status: GOOD (  13.70  )
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

v4 just rebases on v6.5-rc1 and fixes the nommu build issue due to a
missing __init.

Cheers,
Conor.

[1] (it's in v6.5-rc1 now)

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
 arch/riscv/kernel/cpu.c                       | 179 +++---
 arch/riscv/kernel/cpufeature.c                | 519 ++++++++++++------
 5 files changed, 437 insertions(+), 303 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
