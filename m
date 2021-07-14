Return-Path: <SRS0=1/OQ=MG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7142FC07E9A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jul 2021 14:01:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33D02613C2
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jul 2021 14:01:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33D02613C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UeA052ROot5f1DtATxhMXbLKhCd5ux2qspcZmyeJUEA=; b=FGWujQ9G07m9fB
	XD9GG/VhX5IOk2KYBUyWHJOqsOXehxhnthZp6aDZj645ObULwKNklzzAQzfy+LaYKqzpBCQyAhhl+
	G0NLxZ+/DQbtEbDz/VVIga6rtAlixE1TfhmFVLJCb9oRacRx4rkbLLada5Khrx3tgizcjWLAReRoY
	8rBODTGB2j2Q0jYSliL6t8baEQlzNsYoCU9/RXqT7Y59BTlSzoXrHUWtspdGqVlthWDk20WzDBRCC
	J/SrPIwPEQ90PEo2W/6PnX6IIjueX9AI5KFNDmKzj2u57L+BC0Pq69dL5oGiZmWtPwOWJzVFWO2H7
	aOkYBzwnMOV4BMZ1aFdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3fRw-00Dlz0-TT; Wed, 14 Jul 2021 14:01:20 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3eLl-00DbGQ-2U
 for linux-riscv@lists.infradead.org; Wed, 14 Jul 2021 12:50:57 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:39cc:190a:2775:cfe7])
 by baptiste.telenet-ops.be with bizsmtp
 id V0qW250061ccfby010qWMr; Wed, 14 Jul 2021 14:50:49 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m3eLO-0018dL-En; Wed, 14 Jul 2021 14:50:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1m3eLN-00AaDl-Lw; Wed, 14 Jul 2021 14:50:29 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Nicolas Pitre <nico@fluxnic.net>, Ard Biesheuvel <ardb@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Nick Kossifidis <mick@ics.forth.gr>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Frank Rowand <frowand.list@gmail.com>, Dave Young <dyoung@redhat.com>,
 Mike Rapoport <rppt@kernel.org>
Cc: Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 kexec@lists.infradead.org, linux-mm@kvack.org,
 linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 00/10] Add generic support for kdump DT properties
Date: Wed, 14 Jul 2021 14:50:10 +0200
Message-Id: <cover.1626266516.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_055053_409258_DF6160FE 
X-CRM114-Status: GOOD (  25.29  )
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
the "/chosen" node), makes use of it on arm64, arm32, and (partially)
riscv, and performs a few cleanups.  It is an evolution of the
combination of [1] and [2].

The series consists of 5 parts:
  1. Patches 1-2 prepare (the visibility of) variables used to hold
     information retrieved from the DT properties.
  2. Patches 3-5 add support to the FDT core for parsing the properties.
     This can co-exist safely with architecture-specific parsing, until
     the latter has been removed.
  3. Patch 6 removes the non-standard handling of "linux,elfcorehdr" on
     riscv.
     I think this can be applied independently, as the non-standard
     handling is in v5.13, but upstream riscv kdump support is still
     incomplete.
  4. Patches 7-9 convert arm64 to use the generic handling instead of
     its own implementation.
  5. Patch 10 adds support for kdump properties to arm32.
     The corresponding patch for kexec-tools is "[PATCH] arm: kdump: Add
     DT properties to crash dump kernel's DTB"[3], which is still valid.

Changes compared to the previous versions:
  - Make elfcorehdr_{addr,size} always visible,
  - Add variables for usable memory limitation,
  - Use IS_ENABLED() instead of #ifdef (incl. initrd and arm64),
  - Clarify what architecture-specific code is still responsible for,
  - Add generic support for parsing linux,usable-memory-range,
  - Remove custom linux,usable-memory-range parsing on arm64,
  - Use generic handling on ARM.
  
This has been tested on arm32 and arm64, and compile-tested on riscv64.

Thanks for your comments!

[1] "[PATCH v3] ARM: Parse kdump DT properties"
    https://lore.kernel.org/r/20210317113130.2554368-1-geert+renesas@glider.be/
[2] "[PATCH 0/3] Add generic-support for linux,elfcorehdr and fix riscv"
    https://lore.kernel.org/r/cover.1623780059.git.geert+renesas@glider.be/
[3] "[PATCH] arm: kdump: Add DT properties to crash dump kernel's DTB"
    https://lore.kernel.org/linux-arm-kernel/20200902154129.6358-1-geert+renesas@glider.be/


Geert Uytterhoeven (10):
  crash_dump: Make elfcorehdr_{addr,size} always visible
  memblock: Add variables for usable memory limitation
  of: fdt: Add generic support for parsing elf core headers property
  of: fdt: Add generic support for parsing usable memory range property
  of: fdt: Use IS_ENABLED(CONFIG_BLK_DEV_INITRD) instead of #ifdef
  riscv: Remove non-standard linux,elfcorehdr handling
  arm64: kdump: Remove custom linux,elfcorehdr parsing
  arm64: kdump: Remove custom linux,usable-memory-range parsing
  arm64: kdump: Use IS_ENABLED(CONFIG_CRASH_DUMP) instead of #ifdef
  ARM: Parse kdump DT properties

 Documentation/devicetree/bindings/chosen.txt  | 12 ++--
 .../arm/boot/compressed/fdt_check_mem_start.c | 48 ++++++++++++--
 arch/arm/mm/init.c                            | 30 +++++++++
 arch/arm64/mm/init.c                          | 63 +------------------
 arch/riscv/mm/init.c                          | 20 ------
 drivers/of/fdt.c                              | 63 ++++++++++++++++---
 include/linux/crash_dump.h                    |  7 ++-
 include/linux/memblock.h                      |  6 ++
 mm/memblock.c                                 |  2 +
 9 files changed, 148 insertions(+), 103 deletions(-)

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
