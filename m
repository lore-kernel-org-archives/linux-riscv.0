Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C059C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Nov 2022 22:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5HRAwCNhoF0oYackifLI+UZMAU6m1hT/y9Xbvop5ykY=; b=yEY0o1J9YhG5FH
	bcpeGXkO/Kaa3U9s+rhyKluSWpMqY33CsoA4R1JmOiJrXBlJvEgauLQakrxpivzTr+TqpcCx7vGzR
	1yrQOU0iOy0Dr9Yi3SYQvnoudUtnUNPeo79t1mOJwH8jzFNCEYrh/G+IBwr0rLlPNXnB534NxeBv+
	z5qPjsMG6FGYd7tEiKI+nRgBbzNqooPfi21aG9T0qwzWnTBanzCKTlU7qrxErFBXkNfIu74NdROz+
	7CnKuaec4YaD4hHsYmkyxRExV/oQ5wBgdtCqr7XLlg97uxh9b+kCutHStM3OvkCdMUMvapBeAdPn9
	0jwVrDhwXjJJio22z72Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or5Xv-005QGB-MZ; Fri, 04 Nov 2022 22:52:19 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1or5Xn-005QAz-Sp
	for linux-riscv@lists.infradead.org; Fri, 04 Nov 2022 22:52:13 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1or5Xf-0001sc-P6; Fri, 04 Nov 2022 23:52:03 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: christoph.muellner@vrull.eu,
	prabhakar.csengg@gmail.com,
	conor@kernel.org,
	philipp.tomsich@vrull.eu,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH RFC 0/9] String optimizations and call support in alternatives
Date: Fri,  4 Nov 2022 23:51:44 +0100
Message-Id: <20221104225153.2710873-1-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_155211_947692_05E0B304 
X-CRM114-Status: GOOD (  20.82  )
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

this is sort of a "where I'm at" with optimizing str* and mem*
when taking into account possible multiple variants due to
various extensions being available.

There are essentially two parts to handle:
- making str* functions able to replace what they do
  performantly for possible multiple variants

  This is done by inlining the core functions and then
  using alternatives to call the actual variant.

  This of course will also need a more intelligent selection
  mechanism in the future and as you can see also involves
  the EFI stub in a tiny way.

- actually allowing calls in alternatives
  Function calls use auipc + jalr to reach those 32bit relative
  addresses but when they're compiled the offset will be wrong
  as alternatives live in a different section, so when the patch
  got applied the address will point to the wrong location.

  So similar to arm64 the target addresses need to be updated.

As you can see the zbb part itself is not ready yet, as I lost
way too much time on the offset fixes so far, so my replacement
functions are actually "just" copies of the generic ones so far.

But the effect is similar. Without the offset fix, the function
addresses are wrong as expected and the fix seems to point things
correctly in all my tests, both in the kernel and modules.

So this is my try to get some eyeballs on all the things I may
be missing and as similar topics came up in different threads,
to also allow me to point to something.


Thanks
Heiko

Heiko Stuebner (9):
  string: allow override for strstarts()
  efi/riscv: libstub: mark when compiling libstub
  RISC-V: add auipc elements to parse_asm header
  RISC-V: add U-type imm parsing to parse_asm header
  RISC-V: add rd reg parsing to parse_asm header
  RISC-V: fix auipc-jalr addresses in patched alternatives
  RISC-V: add infrastructure to allow different str* implementations
  HACK: RISC-V: add zbb support to string functions
  HACK: disable strchr call in overlay-fs

 arch/riscv/Kconfig                    | 23 +++++++
 arch/riscv/include/asm/errata_list.h  |  3 +-
 arch/riscv/include/asm/hwcap.h        |  1 +
 arch/riscv/include/asm/parse_asm.h    | 21 ++++++
 arch/riscv/include/asm/string.h       | 96 +++++++++++++++++++++++++++
 arch/riscv/kernel/cpu.c               |  1 +
 arch/riscv/kernel/cpufeature.c        | 96 ++++++++++++++++++++++++++-
 arch/riscv/kernel/image-vars.h        |  6 +-
 arch/riscv/lib/Makefile               | 10 +++
 arch/riscv/lib/strcmp.S               | 25 +++++++
 arch/riscv/lib/strcmp_tmp.S           | 25 +++++++
 arch/riscv/lib/strcmp_zbb.S           | 70 +++++++++++++++++++
 arch/riscv/lib/string.c               | 20 ++++++
 arch/riscv/lib/strlen.S               | 17 +++++
 arch/riscv/lib/strlen_tmp.S           | 17 +++++
 arch/riscv/lib/strlen_zbb.S           | 80 ++++++++++++++++++++++
 arch/riscv/lib/strncmp.S              | 27 ++++++++
 arch/riscv/lib/strncmp_tmp.S          | 27 ++++++++
 arch/riscv/lib/strncmp_zbb.S          | 85 ++++++++++++++++++++++++
 drivers/firmware/efi/libstub/Makefile |  2 +-
 fs/overlayfs/super.c                  |  3 +-
 include/linux/string.h                |  2 +
 22 files changed, 649 insertions(+), 8 deletions(-)
 create mode 100644 arch/riscv/lib/strcmp.S
 create mode 100644 arch/riscv/lib/strcmp_tmp.S
 create mode 100644 arch/riscv/lib/strcmp_zbb.S
 create mode 100644 arch/riscv/lib/string.c
 create mode 100644 arch/riscv/lib/strlen.S
 create mode 100644 arch/riscv/lib/strlen_tmp.S
 create mode 100644 arch/riscv/lib/strlen_zbb.S
 create mode 100644 arch/riscv/lib/strncmp.S
 create mode 100644 arch/riscv/lib/strncmp_tmp.S
 create mode 100644 arch/riscv/lib/strncmp_zbb.S

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
