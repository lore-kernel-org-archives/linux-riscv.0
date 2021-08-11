Return-Path: <SRS0=vOU+=NC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF463C4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Aug 2021 09:19:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 989E16056C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Aug 2021 09:19:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 989E16056C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+oGQP+8s0MrjIfZqPhVfSwY2PRP08YtqRdpLTHlPuog=; b=UrBGafL7i9XJwa
	kufMTGDDRo1LK8rDwMAC9ImGY83Nke8xExJVVqL3Kx8ekDQOvGx2ZakKwOatgMWSyrTe3giOOUbON
	WIPvcfn1XdH0d80Iu3s9b6E4+zfkU1hXLS/cZSLJWNCAJzlbBmuQi1IsNG6rIohlqp2h/mPRRjWCj
	QujreD9ygnR/RJ6zL/gfan7i1Sh+0MigB2aLvJjCY6bhB7Pubo/rMThWeeQCVXumc6jgPY0V2g7pZ
	lYiNDZ/9juhTs6Sb4p37rxc9EB6Ytep1TXDgm3ALKRlk8+8k84JbEXIkixNVaJJnhYnSugqeOUSV8
	lFQ1+yhbI77XcAzizTdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDkO8-006FSP-Eg; Wed, 11 Aug 2021 09:19:04 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDjxY-0067WQ-1K
 for linux-riscv@lists.infradead.org; Wed, 11 Aug 2021 08:51:44 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
 by andre.telenet-ops.be with bizsmtp
 id g8rG2500H1gJxCh018rGYY; Wed, 11 Aug 2021 10:51:32 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mDjxD-001yaB-TH; Wed, 11 Aug 2021 10:51:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mDjxD-0058wf-87; Wed, 11 Aug 2021 10:51:15 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Nicolas Pitre <nico@fluxnic.net>, Ard Biesheuvel <ardb@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Kossifidis <mick@ics.forth.gr>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Frank Rowand <frowand.list@gmail.com>, Dave Young <dyoung@redhat.com>
Cc: Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 Mike Rapoport <rppt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, kexec@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v5 0/9] Add generic support for kdump DT properties
Date: Wed, 11 Aug 2021 10:50:58 +0200
Message-Id: <cover.1628670468.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210811_015136_422071_AC7A1CD8 
X-CRM114-Status: GOOD (  25.19  )
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

	Hi all,

This patch series adds generic support for parsing DT properties related
to crash dump kernels ("linux,elfcorehdr" and "linux,elfcorehdr" under
the "/chosen" node), makes use of it on arm32, and performs a few
cleanups.  It is an evolution of the combination of [1] and [2].

The series consists of 6 parts:
  1. Patch 1 prepares architecture-specific code (needed for MIPS only)
     to avoid duplicating elf core header reservation later.
  2. Patch 2 prepares the visibility of variables used to hold
     information retrieved from the DT properties.
  3. Patches 3-5 add support to the FDT core for handling the
     properties.
     This can co-exist safely with architecture-specific handling, until
     the latter has been removed.
  4. Patch 6 removes the non-standard handling of "linux,elfcorehdr" on
     riscv.
  5. Patches 7-8 convert arm64 to use the generic handling instead of
     its own implementation.
  6. Patch 9 adds support for kdump properties to arm32.
     The corresponding patch for kexec-tools is "[PATCH] arm: kdump: Add
     DT properties to crash dump kernel's DTB"[3], which is still valid.

Changes compared to v4[4]:
  - New patch "[PATCH v5 1/9] MIPS: Avoid future duplicate elf core
    header reservation",
  - Drop "memblock: Add variables for usable memory limitation", as this
    is now handled in FDT core code,
  - Make ELFCORE_ADDR_{MAX,ERR} visible, too,
  - Handle the actual elf core header reservation and memory capping in
    FDT core code,
  - Add Reviewed-by, Acked-by,
  - Remove all architecture-specific handling on arm64,
  - Drop "arm64: kdump: Use IS_ENABLED(CONFIG_CRASH_DUMP) instead of
    #ifdef", as the affected code is gone,
  - Remove the addition of "linux,elfcorehdr" and
    "linux,usable-memory-range" handling to arch/arm/mm/init.c.

Changes compared to older versions:
  - Make elfcorehdr_{addr,size} always visible,
  - Add variables for usable memory limitation,
  - Use IS_ENABLED() instead of #ifdef (incl. initrd and arm64),
  - Clarify what architecture-specific code is still responsible for,
  - Add generic support for parsing linux,usable-memory-range,
  - Remove custom linux,usable-memory-range parsing on arm64,
  - Use generic handling on ARM.
  
This has been tested with kexec/kdump on arm32 and arm64, and
boot-tested on riscv64 and DT-less MIPS.

Thanks!

[1] "[PATCH v3] ARM: Parse kdump DT properties"
    https://lore.kernel.org/r/20210317113130.2554368-1-geert+renesas@glider.be/
[2] "[PATCH 0/3] Add generic-support for linux,elfcorehdr and fix riscv"
    https://lore.kernel.org/r/cover.1623780059.git.geert+renesas@glider.be/
[3] "[PATCH] arm: kdump: Add DT properties to crash dump kernel's DTB"
    https://lore.kernel.org/r/20200902154129.6358-1-geert+renesas@glider.be/
[4] "[PATCH v4 00/10] Add generic support for kdump DT properties"
    https://lore.kernel.org/r/cover.1626266516.git.geert+renesas@glider.be

Geert Uytterhoeven (9):
  MIPS: Avoid future duplicate elf core header reservation
  crash_dump: Make elfcorehdr address/size symbols always visible
  of: fdt: Add generic support for handling elf core headers property
  of: fdt: Add generic support for handling usable memory range property
  of: fdt: Use IS_ENABLED(CONFIG_BLK_DEV_INITRD) instead of #ifdef
  riscv: Remove non-standard linux,elfcorehdr handling
  arm64: kdump: Remove custom linux,elfcorehdr handling
  arm64: kdump: Remove custom linux,usable-memory-range handling
  ARM: uncompress: Parse "linux,usable-memory-range" DT property

 Documentation/devicetree/bindings/chosen.txt  | 12 +--
 .../arm/boot/compressed/fdt_check_mem_start.c | 48 ++++++++--
 arch/arm64/mm/init.c                          | 88 -----------------
 arch/mips/kernel/setup.c                      |  3 +-
 arch/riscv/mm/init.c                          | 20 ----
 drivers/of/fdt.c                              | 94 +++++++++++++++++--
 include/linux/crash_dump.h                    |  3 +-
 7 files changed, 139 insertions(+), 129 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
