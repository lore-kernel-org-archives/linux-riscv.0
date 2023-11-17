Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F157C072A2
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Nov 2023 12:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TRZFZPluKHCIBD/cVwXkKCEUwPIFmUL2rqdQjGm3+5k=; b=McjxPtHH04ukIc
	gZtkbCvxkcFNV76+vvvyB78WpOMIIFBjud/iTApRE33wAjpjzRNDOWPqJfkZBkwuNtUKUi2tHSVm7
	q238mXFTXc50PqywA6MDSQzFtO1Vv1I5DqNB5KNTeVUvLsgneVDwwjOQJQCRsSLapTcKz0dYgUxMV
	fwqjgMJ766IHECUyV86vo8VOyX1PAb7CuuNcfXroW1Zm2QyVmoJgtaMF9bwubXssXvajQFvRvhlZi
	J1Td/gr0VvGP5Ct5jeuUpM0ymFui44CzwoMfJe7h/ggpDMn2EEA5hPOYWDjFH7/m0S83acrSReeW+
	QRJvaa4pz6N8KhJKHrXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3yQt-006ahU-1E;
	Fri, 17 Nov 2023 12:58:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3yQq-006agx-3B
	for linux-riscv@lists.infradead.org;
	Fri, 17 Nov 2023 12:58:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 79AD861D94;
	Fri, 17 Nov 2023 12:58:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E749C433C7;
	Fri, 17 Nov 2023 12:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700225928;
	bh=OvD5lK7GMYVRYYlKjmppBf7oa0LKNZejc/ZeYibOSY4=;
	h=From:To:Cc:Subject:Date:From;
	b=CcO+7b/V7SMWBnGrhKQqxUgQPaPotUYf310+4G1KdltChT90h+lmjl6MjYPkPYkNx
	 OuIUmRkShA1vBFhcQBH80P/zw/LEQGCYFsJ4v2WLAbegnn9yDQtysu618dwGFq25V/
	 c2yrcrhBjSF+6je4idzCAZCMeWHUEa5ZdPhr2mo5ES5ZYmF3F0Pf9GJXFf5UZ5vBBD
	 T7HE5LYxrKLOeReVAVHtRY6flWY9CYG9xyyJSteNrW4Ya0awg6otMCe346JVAFZOOh
	 2SnjVpP4u0djkbR/JTUfBUxVd+mrM1C8vKqJcRKZScrSm/ShU/KCtKQ3f313y4LDzk
	 nIhoju8jt807g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] riscv: compat_vdso: align VDSOAS build log
Date: Fri, 17 Nov 2023 21:58:43 +0900
Message-Id: <20231117125843.1058553-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_045849_066838_AB23B4AA 
X-CRM114-Status: UNSURE (   7.73  )
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

Add one more space after "VDSOAS" for better alignment in the build log.

[Before]

  LDS     arch/riscv/kernel/compat_vdso/compat_vdso.lds
  VDSOAS arch/riscv/kernel/compat_vdso/rt_sigreturn.o
  VDSOAS arch/riscv/kernel/compat_vdso/getcpu.o
  VDSOAS arch/riscv/kernel/compat_vdso/flush_icache.o
  VDSOAS arch/riscv/kernel/compat_vdso/note.o
  VDSOLD  arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg
  VDSOSYM include/generated/compat_vdso-offsets.h

[After]

  LDS     arch/riscv/kernel/compat_vdso/compat_vdso.lds
  VDSOAS  arch/riscv/kernel/compat_vdso/rt_sigreturn.o
  VDSOAS  arch/riscv/kernel/compat_vdso/getcpu.o
  VDSOAS  arch/riscv/kernel/compat_vdso/flush_icache.o
  VDSOAS  arch/riscv/kernel/compat_vdso/note.o
  VDSOLD  arch/riscv/kernel/compat_vdso/compat_vdso.so.dbg
  VDSOSYM include/generated/compat_vdso-offsets.h

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/riscv/kernel/compat_vdso/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/compat_vdso/Makefile b/arch/riscv/kernel/compat_vdso/Makefile
index 62fa393b2eb2..3df4cb788c1f 100644
--- a/arch/riscv/kernel/compat_vdso/Makefile
+++ b/arch/riscv/kernel/compat_vdso/Makefile
@@ -74,5 +74,5 @@ quiet_cmd_compat_vdsold = VDSOLD  $@
                    rm $@.tmp
 
 # actual build commands
-quiet_cmd_compat_vdsoas = VDSOAS $@
+quiet_cmd_compat_vdsoas = VDSOAS  $@
       cmd_compat_vdsoas = $(COMPAT_CC) $(a_flags) $(COMPAT_CC_FLAGS) -c -o $@ $<
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
