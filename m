Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD88ECAAA1
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Oct 2022 18:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r6O6zSY16jJoGyikqynL1aHmhB9csT+3WFm7hR5RmT8=; b=CQTW6Mw3v6eMph
	pdhktPN0UN6NF8TBAgL1eZ2qk4jhQhEpjlc1MhV3QMysZ3Dc28i3qpDNgxWNhix5pe8Rj2HRy2wLj
	s4ysy930XF8QD3t/2v0GIlyXRxArZQCGrclT1uUti502J7POYYUtyXd0tfwMlenhbuI0r6GrPB3Fb
	h6QcceZv98d++CpX8bwzQ0urdQl2RKcZ56nvGjbyyoHC2kMYXBW0H87XqAR5T0MFmeKDMU4MzPWPs
	YJmdLfQgOeOcwBCi3XzU+ARElM46+UAqnNFnk45CVC/nHW4GS5jViWX6vNwODICk1dJAd6oS5zoiO
	e/l/ncFAkM/C1MVpQN/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opZD4-00DcnG-CL; Mon, 31 Oct 2022 18:08:30 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opZD0-00Dclg-QX
	for linux-riscv@lists.infradead.org; Mon, 31 Oct 2022 18:08:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 44916B819D9;
	Mon, 31 Oct 2022 18:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 512F0C433D6;
	Mon, 31 Oct 2022 18:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667239703;
	bh=61NkTIRtTQDjIwj34HexqV/1v6+kaRU2hwR4uoY6668=;
	h=From:To:Cc:Subject:Date:From;
	b=fd+EMPKlIf4RbN8/XgdKYejclCTsYhbFwapr17e367PPTRZu7Zl0/vYawiVi/ZiqI
	 k11GcD3hURPp7Nf2llY3Chx1Vfu/fUsbTA2zM2v1Q3f7ejZBx4RNWQXiYvN0AqH44Q
	 cu2/Q1vOQdh7ABsRGp4w4MX5xvLPV7V905wxqN48ampidHhRv7HP4a2sKeQ3CgyLwU
	 cUPnqgQldXl8hyE6m9kLy/8m7ynMFDS9B8E6LS//sHrMWe/M+EnrV7ttMQ4W/R1kD1
	 LB0ePi+geOgbcUq6jNTQ3FDggCeXkXLpQ//4cyBFVGogjOfWBp7YDPwZlruarao2kt
	 4KjjU1d8S3nqA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] riscv: vdso: fix section overlapping under some conditions
Date: Tue,  1 Nov 2022 01:58:42 +0800
Message-Id: <20221031175842.1699-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_110827_024640_210DBB84 
X-CRM114-Status: GOOD (  10.94  )
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

lkp reported a build error, I tried the config and can reproduce
build error as below:

  VDSOLD  arch/riscv/kernel/vdso/vdso.so.dbg
ld.lld: error: section .note file range overlaps with .text
>>> .note range is [0x7C8, 0x803]
>>> .text range is [0x800, 0x1993]

ld.lld: error: section .text file range overlaps with .dynamic
>>> .text range is [0x800, 0x1993]
>>> .dynamic range is [0x808, 0x937]

ld.lld: error: section .note virtual address range overlaps with .text
>>> .note range is [0x7C8, 0x803]
>>> .text range is [0x800, 0x1993]

Fix it by removing the hardcoding 0x800 and related comments.

Link: https://lore.kernel.org/lkml/202210122123.Cc4FPShJ-lkp@intel.com/#r
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/vdso/vdso.lds.S | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
index 01d94aae5bf5..344209d2e128 100644
--- a/arch/riscv/kernel/vdso/vdso.lds.S
+++ b/arch/riscv/kernel/vdso/vdso.lds.S
@@ -31,13 +31,7 @@ SECTIONS
 
 	.rodata		: { *(.rodata .rodata.* .gnu.linkonce.r.*) }
 
-	/*
-	 * This linker script is used both with -r and with -shared.
-	 * For the layouts to match, we need to skip more than enough
-	 * space for the dynamic symbol table, etc. If this amount is
-	 * insufficient, ld -shared will error; simply increase it here.
-	 */
-	. = 0x800;
+	. = ALIGN(16);
 	.text		: { *(.text .text.*) }		:text
 
 	.data		: {
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
