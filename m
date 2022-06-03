Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7DAC433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jun 2022 16:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9QY3bS5685D0GEXxpGfCGZQHqYWIXOV0mWNUceEEg/k=; b=GPvUdcPDpSprSW
	fIRMF7dVqjN/LOxV51BC+OSiFgkfoXtO6kzvJJTuNt7kLvefHCiyXY+BP3wWflleurCV6/mdGvjs5
	kt5Tx99SAF2Qj3o2E9GBZ/dFn/ss4DoD8k49a0DT4mJ4kneT2AyfLal4w0bY0Ej8atEkDqIjJ2+v9
	+tj6EKkip9f/mgR0vYgegwdCCQ+pTJHV73fJ35IdkbpeuYka1HJ4XIx40/gCGTi0WmI/yWLudPKIx
	gbXvbS7ybPyttc8IDrrTm2SXfWx9bYlje/KPBeAwnu2BCZdFSbBTsMte33NWdcBOTaTcJJfJXNvo6
	yj0Be+zY9OxILowGaDVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxAFI-008Aip-3e; Fri, 03 Jun 2022 16:33:56 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxAFE-008AhY-AI
	for linux-riscv@lists.infradead.org; Fri, 03 Jun 2022 16:33:54 +0000
Received: by mail-qv1-xf33.google.com with SMTP id b11so5937980qvv.4
        for <linux-riscv@lists.infradead.org>; Fri, 03 Jun 2022 09:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:cc:from:to:message-id;
        bh=jmS9+muNRBp2jnRn4fOY2N20O9KfoqE+IiDXN9dcqrM=;
        b=UHz9NCtym8NegjyXl7gyK9SuR5nldXoPINn+bRik9fh0SLL8K7UIwOH6LBLp5myTpk
         wnTskz3ocPTRLxh6cr5Ez6O074AUwgNuQHlGM4IxmHw1EJkYPidUpxcJ7EFN73SBb0m7
         KI9SNvVlphbGJehjOnZq6i3fjGEEarEg2d8jhkRURC50UC82WfxWay63Kw7hx0RVHGfk
         2hMMV8I4mFIzT0QLHoTV6nRLh1GwCj95qpv7QZw4PcyPGKA6mJuVLx0qQmr+aJJJ6NEQ
         D60xd395cd2tQEE3INfQPRxFeZNh9AolJykywXzh4qcvhsbegc4UUZhic9rn15QbyI4g
         Aajw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:cc:from:to:message-id;
        bh=jmS9+muNRBp2jnRn4fOY2N20O9KfoqE+IiDXN9dcqrM=;
        b=vua67d0XPZZXl2RV4Q3cZ7yuhbRqKmEFIzqACrXr4EuRvoVSxy4f9EE5khE937FLaa
         ivocVxAXeBu/a6yWyZT1zFwiP9Wm5ru6+vyNP3zO1awDPi2VMN+RNf1N5f70fFoG5a9X
         EfkE2wKDx5c/mDPl5ctUF8ERjxuiYWsRkutzk9vIZvMdOxV++JSYUnR3oqVx1N8NZPQB
         WZoyWonmtp7ok/IRjlYgSrK/4n1f4unhJ0sV8XcjaaJ4hAsIK6fHCUWfjmXvUQY8/uyS
         V+IxY/r8GxglJHgepqUeMW/JQBdQue7eBo+36x/ArVbDofXGrP/INE8cscoVemFUTbg9
         1wNw==
X-Gm-Message-State: AOAM532FbpTjKcobkKt5m4LfD1n3mpUPqIMzFfpDblmjp/T3wLdOWnV3
	5EB54DSQ0sQgaRrX+79pHFPGMOnhX4njTg==
X-Google-Smtp-Source: ABdhPJxZoE4jsbVPqtWPd5lko6Oa2FLNbG7wszeizLjMbpm+bug1FMywcdicUra99nZiJ1WeMZZDIw==
X-Received: by 2002:ad4:46ae:0:b0:467:db1b:f38b with SMTP id br14-20020ad446ae000000b00467db1bf38bmr4091953qvb.57.1654274027125;
        Fri, 03 Jun 2022 09:33:47 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id h9-20020ac85e09000000b002f93c5444e3sm5481315qtx.52.2022.06.03.09.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 09:33:46 -0700 (PDT)
Date: Fri, 03 Jun 2022 09:33:46 -0700 (PDT)
X-Google-Original-Date: Fri, 03 Jun 2022 09:33:44 PDT (-0700)
Subject: [GIT PULL] RISC-V Patches for the 5.19 Merge Window, Part 2
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-98b420ef-9b28-4e40-971e-7275b8f7c6e8@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_093352_615077_B1A97BCF 
X-CRM114-Status: GOOD (  11.49  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

merged tag 'riscv-for-linus-5.19-mw0'
The following changes since commit 35b51afd23c98e2f055ac563aca36173a12588b9:

  Merge tag 'riscv-for-linus-5.19-mw0' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux (2022-05-31 14:10:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.19-mw2

for you to fetch changes up to 61114e734ccb804bc12561ab4020745e02c468c2:

  riscv: Move alternative length validation into subsection (2022-06-02 15:55:22 -0700)

----------------------------------------------------------------
RISC-V Patches for the 5.19 Merge Window, Part 2

This is mostly some DT updates, but also a handful of cleanups and some
fixes.  The most user-visible of those are:

* A device tree for the Sundance Polarberry, along with a handful of
  fixes and clenups to the PolarFire SOC device trees and bindings.
* The memfd_secret syscall number is now visible to userspace,
* Some improvements to the vm layout dump, which really should have
  followed shortly after the sv48 patches but I missed.

----------------------------------------------------------------
Alexandre Ghiti (3):
      Documentation: riscv: Add sv48 description to VM layout
      riscv: Initialize thread pointer before calling C functions
      riscv: Improve virtual kernel memory layout dump

Conor Dooley (10):
      riscv: dts: microchip: remove icicle memory clocks
      riscv: dts: microchip: move sysctrlr out of soc bus
      riscv: dts: microchip: remove soc vendor from filenames
      dt-bindings: riscv: microchip: document icicle reference design
      riscv: dts: microchip: make the fabric dtsi board specific
      dt-bindings: vendor-prefixes: add Sundance DSP
      dt-bindings: riscv: microchip: add polarberry compatible string
      riscv: dts: microchip: add the sundance polarberry
      riscv: microchip: icicle: readability fixes
      riscv: dts: icicle: sort nodes alphabetically

Jisheng Zhang (1):
      riscv: mm: init: make pt_ops_set_[early|late|fixmap] static

Masahiro Yamada (1):
      riscv: move errata/ and kvm/ builds to arch/riscv/Kbuild

Nathan Chancellor (1):
      riscv: Move alternative length validation into subsection

Palmer Dabbelt (2):
      RISC-V: PolarFire SoC Device Tree Updates
      RISC-V: Only default to spinwait on SBI-0.1 and M-mode

Samuel Holland (1):
      riscv: Fix irq_work when SMP is disabled

Tobias Klauser (1):
      riscv: Wire up memfd_secret in UAPI header

Xianting Tian (1):
      RISC-V: Mark IORESOURCE_EXCLUSIVE for reserved mem instead of IORESOURCE_BUSY

 .../devicetree/bindings/riscv/microchip.yaml       |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 Documentation/riscv/vm-layout.rst                  |  36 +++++++
 arch/riscv/Kbuild                                  |   2 +
 arch/riscv/Kconfig                                 |   8 +-
 arch/riscv/Makefile                                |   3 -
 arch/riscv/boot/dts/microchip/Makefile             |   3 +-
 ...pfs-fabric.dtsi => mpfs-icicle-kit-fabric.dtsi} |   2 +
 ...hip-mpfs-icicle-kit.dts => mpfs-icicle-kit.dts} | 105 +++++++++++----------
 .../boot/dts/microchip/mpfs-polarberry-fabric.dtsi |  16 ++++
 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts  |  99 +++++++++++++++++++
 .../microchip/{microchip-mpfs.dtsi => mpfs.dtsi}   |  11 +--
 arch/riscv/include/asm/alternative-macros.h        |   4 +-
 arch/riscv/include/asm/irq_work.h                  |   2 +-
 arch/riscv/include/asm/unistd.h                    |   1 -
 arch/riscv/include/uapi/asm/unistd.h               |   1 +
 arch/riscv/kernel/head.S                           |   1 +
 arch/riscv/kernel/setup.c                          |   4 +-
 arch/riscv/mm/init.c                               |  72 ++++++++++----
 19 files changed, 287 insertions(+), 87 deletions(-)
 rename arch/riscv/boot/dts/microchip/{microchip-mpfs-fabric.dtsi => mpfs-icicle-kit-fabric.dtsi} (91%)
 rename arch/riscv/boot/dts/microchip/{microchip-mpfs-icicle-kit.dts => mpfs-icicle-kit.dts} (95%)
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
 rename arch/riscv/boot/dts/microchip/{microchip-mpfs.dtsi => mpfs.dtsi} (98%)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
