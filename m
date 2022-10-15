Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC15C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Oct 2022 11:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LJTNgIutm3yiQkgKs4GdqRVpwXJUXFZeXuTDCDAYaO4=; b=FRc3gWgfP4p1AQ
	yPAIOxb1RtLVFpCt7TnGJp09f+KYPkLFoaccSfkk0rQzJvgtD8UES4xlSJBGMDzo2wwBmLoWj0aAl
	sLBXnMva66DNkwnimN2nCOi8gWlMpegEe7hYHAp6HSAU13Z+OX0hOzK9MuUMmw/BxqM92BUjj0fKh
	Waww1+OhEN0Na63Q9d51OcyHPgJPVBPdP+pyT1UgmPdOuMevP7zEOJS6xADvwCRZdEWB8F+BNoozz
	RPpObbpRpxxtjF9W/AGU0nhVH9KqUCJDgMm5OkNuKipbr/s9X2QMo/5pz1Dm5lLuBB2RLXZGmZsqT
	Yj8GEMM4vlMWtQs6z2pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojfCS-00Go1y-4O; Sat, 15 Oct 2022 11:19:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojfCO-00Go1R-R0
	for linux-riscv@lists.infradead.org; Sat, 15 Oct 2022 11:19:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 08D0760AB4;
	Sat, 15 Oct 2022 11:19:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1C12C433D6;
	Sat, 15 Oct 2022 11:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665832762;
	bh=KHG7HVZ5S6NDYVXtRkMF2CxdWRI0GuJHWCxCvCd4QxI=;
	h=From:To:Cc:Subject:Date:From;
	b=Z6N4NItkXTF+NfBC4NW8Wl88UVogHp7/XExpFUFpjDMs2EO0UXRqS+oOH4OuHVxAq
	 +1JMu7xwaE6FOfAPi9FqpFDpY7zxvH72qy69jCeKaNRKjK/yqJSlzg3v08c8m7U9d3
	 mkuNUS+7vW/zSx1qvc2YLBk295d4LVOJbC5Vi/v8QYqDLevDAeZNDgeSTpDkOaEBc/
	 Agp+arXDl4nftHmRUFzbaHwC2+K7PXlweDP92zreNn5QvQne3wrPM3XGAlHfjZV693
	 SlmQp4LnVebVgrgDB0nur+gO1RFK1xMgcHmJcLbFR0bprRzGpYV6bnPiY5DTSFtFwL
	 9aE472bkCtfvg==
From: Conor Dooley <conor@kernel.org>
To: stable@vger.kernel.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 4.19] riscv: fix build with binutils 2.38
Date: Sat, 15 Oct 2022 12:18:57 +0100
Message-Id: <20221015111856.3869148-1-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221015_041925_008329_7658AF43 
X-CRM114-Status: GOOD (  10.69  )
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

From: Aurelien Jarno <aurelien@aurel32.net>

commit 6df2a016c0c8a3d0933ef33dd192ea6606b115e3 upstream.

From version 2.38, binutils default to ISA spec version 20191213. This
means that the csr read/write (csrr*/csrw*) instructions and fence.i
instruction has separated from the `I` extension, become two standalone
extensions: Zicsr and Zifencei. As the kernel uses those instruction,
this causes the following build failure:

  CC      arch/riscv/kernel/vdso/vgettimeofday.o
  <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h: Assembler messages:
  <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
  <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
  <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'
  <<BUILDDIR>>/arch/riscv/include/asm/vdso/gettimeofday.h:71: Error: unrecognized opcode `csrr a5,0xc01'

The fix is to specify those extensions explicitly in -march. However as
older binutils version do not support this, we first need to detect
that.

Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
Tested-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: stable@vger.kernel.org
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
[Conor: converted to the 4.19 style of march string generation]
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: linux-riscv@lists.infradead.org
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

lkp has yet to complain, so here you go Greg..

 arch/riscv/Makefile | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 110be14e6122..b024029a2247 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -49,9 +49,16 @@ ifeq ($(CONFIG_RISCV_ISA_C),y)
 	KBUILD_ARCH_C = c
 endif
 
-KBUILD_AFLAGS += -march=$(KBUILD_MARCH)$(KBUILD_ARCH_A)fd$(KBUILD_ARCH_C)
+# Newer binutils versions default to ISA spec version 20191213 which moves some
+# instructions from the I extension to the Zicsr and Zifencei extensions.
+toolchain-need-zicsr-zifencei := $(call cc-option-yn, -march=$(riscv-march-y)_zicsr_zifencei)
+ifeq ($(toolchain-need-zicsr-zifencei),y)
+	KBUILD_ARCH_ZISCR_ZIFENCEI = _zicsr_zifencei
+endif
+
+KBUILD_AFLAGS += -march=$(KBUILD_MARCH)$(KBUILD_ARCH_A)fd$(KBUILD_ARCH_C)$(KBUILD_ARCH_ZISCR_ZIFENCEI)
 
-KBUILD_CFLAGS += -march=$(KBUILD_MARCH)$(KBUILD_ARCH_A)$(KBUILD_ARCH_C)
+KBUILD_CFLAGS += -march=$(KBUILD_MARCH)$(KBUILD_ARCH_A)$(KBUILD_ARCH_C)$(KBUILD_ARCH_ZISCR_ZIFENCEI)
 KBUILD_CFLAGS += -mno-save-restore
 KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
 
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
