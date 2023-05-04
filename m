Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BE8C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 18:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SQjMOtQCJaujQCdlZ8Y6fe4ehKiRj33VBhXFVbxobyE=; b=29Cqes3/q94Mof
	P30TyYZTB5EeiJeyXgW2RxkwtwqgRf7KNDup9IY9/uEYnz3hpD3meMHVUsIXdCbjdG2NltcGXw6Pr
	WlQeLZiyo6VTMuYU7Hc2d2nTiMbBKXSU3Kcw8Tv6wWdCvTL4TIDRNSbnpeXcbN2BWGsTYqgrku4yX
	JoUVkEjIXpWZSHgEyiy9SAPcZ+KdCfWX4HYhAV00Shs/26wk8PqjNz8EZK07GS4H5CXgdrF5erpdr
	kBxQGACimN8oQnoqzquLWJMEGg0FY1ul4vmr7xyEytMw2gLqdOICXnpWmTvYc8BuLXPdjiousL2eC
	v5K4oV5oJy/HeANF8wqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pudUO-008VPl-0w;
	Thu, 04 May 2023 18:15:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pudUL-008VOx-07
	for linux-riscv@lists.infradead.org;
	Thu, 04 May 2023 18:15:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7B8CF6354B;
	Thu,  4 May 2023 18:15:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26F84C433EF;
	Thu,  4 May 2023 18:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683224130;
	bh=ggkjvcIYvM/9TQoqLv7kTnU9EBJUnXkzGHV0xYO7DYg=;
	h=From:To:Cc:Subject:Date:From;
	b=BZSm8cqaj96OKGTFy7PFSqE3NRQX33OsIlrl2JuzdDqDdDjusa2rvsxqGoccqBURc
	 emSGwGRN2J0/o9KiN5VUdvhF4ksdJxno4v+3V4E/6R1cpassMJe9tivPCmRpYvKhGY
	 LihbCaneDBgbS6Iyj1gq+QME+MoeWpHkprlc5u4clYkoYUC6Zhfkt3IGIKjj02szZC
	 5mvbc+mpFWBpXWCtrqBcq/dIoHDBSU9POejgyYRzzG8veHPufyrXvCHzsLItmATlUN
	 wGtMZl1fbkdrZ6U8wBYlfcB2sZQPnE2mIoU0DJjnP7l4RnpzLfefgZbQcMFUdUZ+1C
	 eSuy8VtNuHUSQ==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Subject: [PATCH v1 0/7] ISA string parser cleanups++
Date: Thu,  4 May 2023 19:14:19 +0100
Message-Id: <20230504-divisive-unsavory-5a2ff0c3c2d1@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2798; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=JurEfnwZN1do6A+NXuLmd3pu6rTrm09BzzYUEQCYXQ8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnBX//G59p8dzZ/bnJ8Ak/B4sLQgv0KYvL2/9z32Tj5m j/75KfaUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIl48TP8j3B7pPv5BUvf6/W/ U3edXfXBXCjMMSPxSJ5nXmrSceeaNYwMS6Zr8tz/pHlWe/qFk4afPk/ZocaQv2ny3fm3umctYZ3 TwwoA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_111533_174684_8FA76CF6 
X-CRM114-Status: GOOD (  13.50  )
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
Cc: conor@kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

This stuff goes on top of riscv/for-next plus this series from Yangyu
that made me go looking at the ISA string parser again:
https://lore.kernel.org/all/tencent_E6911C8D71F5624E432A1AFDF86804C3B509@qq.com/

With that out of the way, here are some cleanups for our riscv,isa
handling.
One of these patches is yoinked from Sunil's ACPI series & tweaked
slightly since this needs to apply independently of that, that runs the
isa string parsing loop only over _possible_ cpus.

Other than that, there are some bits that were discussed with Drew on
the "should we allow caps" threads that I have now created patches for:
- splitting of riscv_of_processor_hartid() into two distinct functions,
  one for use purely during early boot, prior to the establishment of
  the possible-cpus mask & another to fit the other current use-cases.
- this allows us to then completely skip some validation of the hartid
  in the parser.
- the biggest diff in the series is a rework of the comments in the
  parser, as I have mostly found the existing (sparse) ones to not be
  all that helpful whenever I have to go back and look at it.
- from writing the comments, I found a conditional doing a bit of a
  dance that I found counter-intuitive, so I've had a go at making that
  match what I would expect a little better.
- `i` implies `Zicsr` & `Zifence`, so add them as extensions and set
  them for the craic. Sure why not like. Of all the patches here, this
  is the one I can most take-or-leave.

Cheers,
Conor.

CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Andrew Jones <ajones@ventanamicro.com>
CC: Sunil V L <sunilvl@ventanamicro.com>
CC: Yangyu Chen <cyy@cyyself.name>
CC: linux-riscv@lists.infradead.org

Conor Dooley (6):
  RISC-V: simplify register width check in ISA string parsing
  RISC-V: split early & late of_node to hartid mapping
  RISC-V: validate riscv,isa at boot, not during ISA string parsing
  RISC-V: rework comments in ISA string parser
  RISC-V: remove decrement/increment dance in ISA string parser
  RISC-V: always report presence of Zicsr/Zifencei

Sunil V L (1):
  RISC-V: only iterate over possible CPUs in ISA string parser

 arch/riscv/include/asm/hwcap.h     |   2 +
 arch/riscv/include/asm/processor.h |   1 +
 arch/riscv/kernel/cpu.c            |  32 +++++++-
 arch/riscv/kernel/cpufeature.c     | 114 ++++++++++++++++++++++-------
 arch/riscv/kernel/smpboot.c        |   2 +-
 5 files changed, 118 insertions(+), 33 deletions(-)


base-commit: c2d3c8441e3ddbfe41fea9282ddc6ee372e154cd
prerequisite-patch-id: 50cc6c119a7f8f60b06829b2fafc90c9817f532c
prerequisite-patch-id: 4e2f66d8590db938d2e1a4e9bfaad58ee0ab3525
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
