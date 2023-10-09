Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFF5E95A9D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 12:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lOsTbjfKee29s7SXbJTOSVNlQ1MqAsWn28tlZs9/oT4=; b=hlnCH2CK6e5o4t
	6NHlsTODf7vZgNH8M9AxUP6aWhZ73pesdRCTVgalGSs1AlmTzaVA9Xk7wEhJxXxXkyQrmFk5u3sEp
	iax+YLVNvGwT7q/WHu+WwFywH0DjNH58MKKHRyN7/St465Z39kNGI3ZbTWOglf5ABKqIcPDfHN3Lb
	bk4a9sapWS0Uj0Dge138BH8eL5919VjKLYh2hu0xcb8V//f1e5IsEJPt9hw2e2ej9LKqz64+VGYY0
	IGjABdzROefLZGBIQp8/vi5iVBRyB64jCaIqkk4hV062m+p/qcoPq0H90rPZeIsd09O8L+TNEnyG5
	miY06unnLYK9GNPhUZkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qppaZ-00Ahbu-1e;
	Mon, 09 Oct 2023 12:42:23 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qppaW-00AhZt-0S;
	Mon, 09 Oct 2023 12:42:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0337BCE137F;
	Mon,  9 Oct 2023 12:42:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29EB0C433C8;
	Mon,  9 Oct 2023 12:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696855337;
	bh=U5dRpNkQ/fqBLnscaXBlROlahn0CmiCXkgV4c0FDvI0=;
	h=From:To:Cc:Subject:Date:From;
	b=kI5SrLE3zsToT0oF3qzS1NvJht0qifBdMCiFQK/v9FTbI5L5n0EW6pYd5tuRl6ieP
	 HjcPlaqvxs2P1rdLZGTTdzoWudgM8hzKId9mZWBwXs6pCuJX6vnz+0E3ALlL+YFXWU
	 94ijd1tGExFHZ3B8P8E7hnKvTc3OsQF3vsMruK2UOg3+xlAFI12HkS7zNoWgeU9j5P
	 RqbGaNnpNq4mlV5D/TDLteQavy7GJgmfuO1Z3pz5lFVya+ir9OBnfBnLIK8QmIx8rd
	 QlNvlPOE9wtrWmdoNHUNCCaM0evOSeld2l1CPXbYgNd4+aOygWhRolJf7rUglqPuUx
	 wwtq9TTnaNu1Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH 1/5] csky: remove unused cmd_vdso_install
Date: Mon,  9 Oct 2023 21:42:06 +0900
Message-Id: <20231009124210.1064021-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_054220_359266_B3291461 
X-CRM114-Status: UNSURE (   7.93  )
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

You cannot run this code because arch/csky/Makefile does not define the
vdso_install target.

It appears that this code was blindly copied from another architecture.

Remove the dead code.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/csky/kernel/vdso/Makefile | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/csky/kernel/vdso/Makefile b/arch/csky/kernel/vdso/Makefile
index 299e4e41ebc5..ddf784a62c11 100644
--- a/arch/csky/kernel/vdso/Makefile
+++ b/arch/csky/kernel/vdso/Makefile
@@ -58,13 +58,3 @@ quiet_cmd_vdsold = VDSOLD  $@
 # that contains the same symbols at the same offsets.
 quiet_cmd_so2s = SO2S    $@
       cmd_so2s = $(NM) -D $< | $(srctree)/$(src)/so2s.sh > $@
-
-# install commands for the unstripped file
-quiet_cmd_vdso_install = INSTALL $@
-      cmd_vdso_install = cp $(obj)/$@.dbg $(MODLIB)/vdso/$@
-
-vdso.so: $(obj)/vdso.so.dbg
-	@mkdir -p $(MODLIB)/vdso
-	$(call cmd,vdso_install)
-
-vdso_install: vdso.so
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
