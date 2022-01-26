Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98CA5C63682
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jan 2022 17:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3hgmv9TcdHLSwSUp+D+5mq4N0qYX/Qo6T5eyIiKtzak=; b=z4F1ew9ULxKqvN
	CoTTBcs2pkcJhef41GHjvbjLHQHsIa2EJBQUojBxdECgy869typ/VPAmWP6eyW7ax9ACO5mB6Jfa7
	v+rEMwLiXAk4+TXDpAk8jZedUuTFLwF032/PofUBcxMXv17/9LrKBlkVSHcqIut7QkVDsZBAg86XD
	Zunz7D7mn4oq9Yk32vLP7NfCgxORnCnrl6IBFSuDFdsoxFR40A+0g2WK210fPRBykOlCBNuZlZB0K
	KXsQ1cEbxa+qMrqE/o3SUU8rl/s1D6PA+KEIzwn7OiM5dpxXzhXcrgu1eO0EydK5KsJ8UqWzvoPR2
	Gy2DInxRffEmQjEYTd1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCmEs-00D3Ud-7N; Wed, 26 Jan 2022 17:37:46 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCltB-00CvWy-DZ
 for linux-riscv@lists.infradead.org; Wed, 26 Jan 2022 17:15:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
 ; s=202004.hall;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
 Content-Description:In-Reply-To:References:X-Debbugs-Cc;
 bh=JcMDygQ3jwximp20F0L2sMP6dOWvpxTtwX9dpTRf13o=; b=FgHcbTeJt+uvUQR6oh7qwpxdYX
 1mpfNXVC0gmKsHHP2B1yg368NoThRObuLXqxuTsbPF4W+OKfIMecSSYu/RJYBBk2TzT8ibhWgybsA
 NsKhDbpRmmL7KvxDQ7A7qlOfeGEKTdp0X0JNyGswv3KgbWdbLDl0P7xzzfj2aRCcG3dYYGtn59DDV
 c7WxPdrkOJWgoFEkyfqNdxgh2GC6W9vg00PNC6MCfjCdMDjDcT9rbGg7HyOA7g7DnebDsi4vr6JGn
 sqmPBPmpRrEa2twe0/A+fUU4UuXWAOyeKrT1IZDSLk5Bm00r7aSRLg48AI1OWKfK1HkNWZiX1Kqw7
 fThuM5Hg==;
Received: from [2a01:e34:ec5d:a741:8a4c:7c4e:dc4c:1787] (helo=ohm.rr44.fr)
 by hall.aurel32.net with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <aurelien@aurel32.net>)
 id 1nClsx-00Gm2K-NS; Wed, 26 Jan 2022 18:15:07 +0100
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.95)
 (envelope-from <aurelien@aurel32.net>) id 1nClsx-005cI1-6x;
 Wed, 26 Jan 2022 18:15:07 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org
Cc: Aurelien Jarno <aurelien@aurel32.net>, stable@vger.kernel.org,
 Kito Cheng <kito.cheng@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE)
Subject: [PATCH] riscv: fix build with binutils 2.38
Date: Wed, 26 Jan 2022 18:14:42 +0100
Message-Id: <20220126171442.1338740-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_091521_493144_4E7A4256 
X-CRM114-Status: UNSURE (   9.04  )
X-CRM114-Notice: Please train this message.
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

The fix is to specify those extensions explicitely in -march. However as
older binutils version do not support this, we first need to detect
that.

Cc: stable@vger.kernel.org # 4.15+
Cc: Kito Cheng <kito.cheng@gmail.com>
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 8a107ed18b0d..7d81102cffd4 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -50,6 +50,12 @@ riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
 riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
 riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
 riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
+
+# Newer binutils versions default to ISA spec version 20191213 which moves some
+# instructions from the I extension to the Zicsr and Zifencei extensions.
+toolchain-need-zicsr-zifencei := $(call cc-option-yn, -march=$(riscv-march-y)_zicsr_zifencei)
+riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei
+
 KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
 KBUILD_AFLAGS += -march=$(riscv-march-y)
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
