Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2D8EB64DD
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 12:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CeQjdO5Yfm4U1oz5j3zu24dkKFBF/RlahIIS3/e+SeY=; b=euIJjx5XS3prJv
	Eq2RwO7ZdOxEZJjajES784rLO3z1bPVmmPxeBgT3kY8zo2HAO2x1vC8WNyQkns+eJN/s8am5RPftb
	JoNzBCizjOmjRAeefEN/rs7uJHl8pEEeV5E2h3k/II8u+WdJ8lTSHYhbQuDkHdEOGqAsTjMiBq8pH
	KhpiHvopsKxVoeJGFrnf3fR7Wrxh7nG9fLloTLNmHkm/ENILE+UFxKAqV3BXuvTNNfKFIl9Y4J4JB
	cnsoGDpJkoC24rCwPpWJnjhmirvYmBv7k5TmKhOHSgIkyiPh/jfpqpHcVU9Cn/mhse4e4F82G5Btu
	2JCtH6xr/BJxQWDSRzCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvBT-003BeL-2w;
	Thu, 13 Jul 2023 12:12:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJvBR-003Bd2-0z
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 12:12:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689250353; x=1720786353;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/7sS6FP9LTjC31OWZxS14sLk//bNWTQVsuYQYTG9dS4=;
  b=yYbHlDXg3zZv5LS/c2sSWdVxh+DF+6K5BG8Sy3LLnkhGC9W6+em/aLtQ
   lJQ0aQ4G+M5U0IEgOreZG30+De0u0meejS/zggUx3UBwPY5dIsUF4bc6p
   DO/+kGJmlMdXu8C0ehoPJ/UqEbdP4RGSeV/va/eMKFYnVIHlCtQfPkCci
   FFzf6+Xg954ElOCdzA8+Xxhq4QoHY85/KI605y0Z4/3l1l2mhE0Tuo9K5
   5zzImMpG9mm3fJJcVBqcwu0qSvhoL+4f+wLaCuvALegH/FfMBdIWoLZn6
   2Y70OV1s7SF0MPFnsfgrXvfq7L7EzKm+QrBB2iPOmdAAaexe1FwVdz3nK
   w==;
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; 
   d="scan'208";a="235310965"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jul 2023 05:12:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 13 Jul 2023 05:12:29 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Thu, 13 Jul 2023 05:12:27 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v5 00/11] RISC-V: Probe DT extension support using riscv,isa-extensions & riscv,isa-base
Date: Thu, 13 Jul 2023 13:10:58 +0100
Message-ID: <20230713-target-much-8ac624e90df8@wendy>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3429; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=/7sS6FP9LTjC31OWZxS14sLk//bNWTQVsuYQYTG9dS4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnrX175KZUvprYw7LniWt4b7+0LnfYGL9z3rG7qy0xPrQe5 xXO5O0pZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjAR8UyGfyodqTXq87O25KUlLuC+zX dsglTF/H0KC0rkFoTfum/5LJ7hn56m/Nn7T22eh0XbJ1w48HBPoLvgaa3X1lpz50y8dDEyiBsA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_051233_348640_E0925CA5 
X-CRM114-Status: GOOD (  15.81  )
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

In v5, I've fixed issues spotted by myself & Evan. I'm not the worlds
biggest fan of the strlen() calls inside the macro - but that's going to
go away again almost immediately if the scalar crypto stuff gets merged.
I also spotted an issue with a rebase I did at some point, where the
dedicated properties did not use isainfo->isa & created a bitmap for
each cpu, which would've caused the per-hart extension tracking to
break.

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
  RISC-V: enable extension detection from dedicated properties
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
 arch/riscv/kernel/cpufeature.c                | 521 ++++++++++++------
 5 files changed, 439 insertions(+), 303 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
