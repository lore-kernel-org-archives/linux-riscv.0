Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0564AEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 11:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Dcb9rwiPFUZ0ChOm1T61tpDpEW6gmF8TWgjJACpRTiI=; b=I1CvCRtHkzS2+t
	WRbe7s/sdcicGl1BFm7/xxiZs/X4EukXWuavtAAGwkQuxEXzUrLDBscv/TVmLW6FQPfV1Y2nROwlT
	5PT273brF4LEttBZT9st0gWpJMPrrEtCBoV2EGb7izXUWdjEdgb3m7AwMaeUBAodO4kV4QMD0ovqA
	redhbeh9TUMbUXnvQMwBxPx9/4ySlEs/tbX5w/G8ZOdvu+DXTus8mWugXpfseZvMr22jhXuEHVHW/
	SVgxkvRvmVsehfXoVdAoAbDE8/ewb80fP/+XFxQuPoiFpuOp0IFDKZ1Ot3Ls96zONnDwrZASD0Kxm
	1gooIFtYa4EwqxVg+0Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDkH7-00A41P-1v;
	Mon, 26 Jun 2023 11:20:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDkH4-00A3zb-0G
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 11:20:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1687778449; x=1719314449;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GKLHsJxKMBm+j/FpObibxtnIG6RkgGJwaNujazCwvSU=;
  b=iWjIxAG7e11mQ8Dq7R723pPpkGXx8QQ09nxGoDE97mVe+eSfRpCLsvbu
   iyOkw5Vylse6dVObBOsjdJ5ueUZo29vqoYZEMXIV+VPtlsWFXPGQs0w15
   HbHcvXFf5B7yMrnD+WTY7DaLjjBFNAUJ/f4Fr4DvIccNte0QkeJZz7sVC
   ZParapULg4RizEVPqvKqIL4bKQNzEfCEKftFKzksvsMuj94L0BxsFBxN7
   DD1iEvfD7FuDIsdj5R2W/CqJu5vG4DipXbJEkT0hqfl23MixnHWs+9j43
   R5L0PKeSe8/DLfUhX7ppOUgI2Df3P6Oxiv7YRVbBUDzWYS4JHCo2bCcjr
   g==;
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="232170729"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jun 2023 04:20:45 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 26 Jun 2023 04:20:45 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Mon, 26 Jun 2023 04:20:43 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
Subject: [PATCH v1 0/9] RISC-V: Probe DT extension support using riscv,isa-extensions & riscv,isa-base
Date: Mon, 26 Jun 2023 12:19:38 +0100
Message-ID: <20230626-provable-angrily-81760e8c3cc6@wendy>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2680; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=GKLHsJxKMBm+j/FpObibxtnIG6RkgGJwaNujazCwvSU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCkzS3yepB+9L2HW+6B+6qJ0C9NpSx9ns6mVy/959a3WdMY1 DfG4jlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzk605GhlUrDlxYbLIxU9zubE4rj3 Zql6Bnsvcs1c63LGX6T13ubGL4p9ZTfrHwWI92m8vetdLG1w5zfpyeeDZF48KSh5a78+2YeQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230626_042050_143263_3A55C2BB 
X-CRM114-Status: GOOD (  12.41  )
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
would be a good idea. I certainly would not be against putting this
stuff in hwcap.h instead.

Note that riscv,isa will still be used in the absence of the new
properties:
	if (!acpi_disabled) {
		riscv_fill_hwcap_from_isa_string(isa2hwcap);
	} else {
		int ret = riscv_fill_hwcap_new(isa2hwcap);
		if (ret) {
			pr_info("Falling back to deprecated \"riscv,isa\"\n");
			riscv_fill_hwcap_from_isa_string(isa2hwcap);
		}
	}

Also, I could not come up with a good name for the new function,
suggestions welcome on that front for sure.

Cheers,
Conor.

As a side note, I tried some macro fiddling to remove the need for a
\#define for each extension that ends up conflicting a bunch between
different people, but didn't come up with anything I was happy with that
worked. I'll keep tinkering with that.

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

Conor Dooley (8):
  RISC-V: drop a needless check in print_isa_ext()
  RISC-V: shunt isa_ext_arr to cpufeature.c
  RISC-V: repurpose riscv_isa_ext array in riscv_fill_hwcap()
  RISC-V: add missing single letter extension definitions
  RISC-V: add single letter extensions to riscv_isa_ext
  RISC-V: split riscv_fill_hwcap() in 3
  RISC-V: enable extension detection from new properties
  RISC-V: try new extension properties in of_early_processor_hartid()

Heiko Stuebner (1):
  RISC-V: don't parse dt/acpi isa string to get rv32/rv64

 arch/riscv/include/asm/hwcap.h |  16 +-
 arch/riscv/kernel/cpu.c        | 149 +++-------
 arch/riscv/kernel/cpufeature.c | 508 +++++++++++++++++++++------------
 3 files changed, 379 insertions(+), 294 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
