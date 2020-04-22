Return-Path: <SRS0=xrvF=6G=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78045C54FCB
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2020 17:24:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DF5F214AF
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2020 17:24:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RcVFetTs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1LkadNPx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4DF5F214AF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pIymMoWSymngUvHIOTcxPTZhEyz3gtbtK3CDsjhkX0Q=; b=RcVFetTs9PCPSVTmf1bu5vH236
	g0qSPh5TVmn/a1gKmpsyJxIQuBGV74UtqxJbJtA/9UkmqPPvbRuNzbA7gcaMlvCgSLT0hmKmtJ2pG
	ArOTK+Qi/YZXpk5nuUjLOhydJ5M6UAUwg2zYl9awvis2kTC6NicHg+0xEBKJcvnKBZ3aq/cltkVGa
	MhIXzaxLVpgPMVXSQ9sH4OgSJsWXnTlHjp5Jd/5oI4RSRmv3B2U7p1NK5lh7XIjg8HLk+xPGixZtt
	dfzv1ZNkYrj+WWX8Kl9CdQrPSshGjCyCrY6++0zGOTV8BgHb2kjFSkYIywNfta28LBR/QzFXf/hrY
	JmwPvsJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRJ70-0004KH-BE; Wed, 22 Apr 2020 17:24:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRJ6x-0004JE-Rt
 for linux-riscv@lists.infradead.org; Wed, 22 Apr 2020 17:24:37 +0000
Received: from cam-smtp0.cambridge.arm.com (fw-tnat.cambridge.arm.com
 [217.140.96.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 73B2120776;
 Wed, 22 Apr 2020 17:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587576275;
 bh=2Af0d9nbT5I1O4V4xc2Dg3F6cePg+ZwzJ43ReJokLcs=;
 h=From:To:Cc:Subject:Date:From;
 b=1LkadNPxSocPKyLj1tMqlJmeuKBzyXNIUq53b4G0mj7j1VV9z9JgZlX8EOQNCfvcx
 lxDObewwcIgdmCzOHyJKFcoyP8ocZXPSBepbvga8ZrSj24lCl2Clvae2pMYAgvI7Cn
 /lxibqDF1iQo3Nl5eCyZKdimvmshN3gdgHd0EO+4=
From: Ard Biesheuvel <ardb@kernel.org>
To: linux-efi@vger.kernel.org
Subject: [PATCH v5 0/7] Add UEFI support for RISC-V
Date: Wed, 22 Apr 2020 19:24:07 +0200
Message-Id: <20200422172414.6662-1-ardb@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200422_102435_941490_7D85C143 
X-CRM114-Status: GOOD (  11.98  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This is a rework of Atish's series [0] to add EFI stub loader support
to the RISC-V port. The purpose is to split the code in a way that makes
it amenable to being merged via different trees during the same cycle.
While at it, I added a patch to disable initrd= loading for new ports,
given that it is deprecated and replaced with a method based on a 
special UEFI device path.

My changes are logged in the individual patches.

I propose to take the first four patches via the EFI tree, and expose
them via a stable tag so that the RISC-V maintainers can merge it before
applying the remaining patches. That will ensure that both trees remain
in a buildable state, with working EFI stub support on the riscv branch.

Cc: Atish Patra <atish.patra@wdc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org

Ard Biesheuvel (1):
  efi/libstub: Make initrd file loader configurable

Atish Patra (6):
  efi/libstub: Move arm-stub to a common file
  efi/libstub/riscv: add arch specific efi.h header file
  include: pe.h: Add RISC-V related PE definition
  RISC-V: Define fixmap bindings for generic early ioremap support
  RISC-V: Add PE/COFF header for EFI stub
  RISC-V: Add EFI stub support.

 arch/arm/Kconfig                              |   2 +-
 arch/arm64/Kconfig                            |   2 +-
 arch/riscv/Kconfig                            |  21 ++++
 arch/riscv/Makefile                           |   1 +
 arch/riscv/configs/defconfig                  |   1 +
 arch/riscv/include/asm/Kbuild                 |   1 +
 arch/riscv/include/asm/efi.h                  |  41 +++++++
 arch/riscv/include/asm/fixmap.h               |  18 +++
 arch/riscv/include/asm/io.h                   |   1 +
 arch/riscv/include/asm/sections.h             |  13 +++
 arch/riscv/kernel/Makefile                    |   4 +
 arch/riscv/kernel/efi-header.S                | 100 ++++++++++++++++
 arch/riscv/kernel/head.S                      |  16 +++
 arch/riscv/kernel/image-vars.h                |  53 +++++++++
 arch/riscv/kernel/vmlinux.lds.S               |  22 +++-
 drivers/firmware/efi/Kconfig                  |  15 ++-
 drivers/firmware/efi/libstub/Makefile         |  22 +++-
 .../efi/libstub/{arm-stub.c => efi-stub.c}    |   0
 drivers/firmware/efi/libstub/file.c           |   3 +
 drivers/firmware/efi/libstub/riscv-stub.c     | 109 ++++++++++++++++++
 include/linux/pe.h                            |   3 +
 21 files changed, 436 insertions(+), 12 deletions(-)
 create mode 100644 arch/riscv/include/asm/efi.h
 create mode 100644 arch/riscv/include/asm/sections.h
 create mode 100644 arch/riscv/kernel/efi-header.S
 create mode 100644 arch/riscv/kernel/image-vars.h
 rename drivers/firmware/efi/libstub/{arm-stub.c => efi-stub.c} (100%)
 create mode 100644 drivers/firmware/efi/libstub/riscv-stub.c

-- 
2.17.1


