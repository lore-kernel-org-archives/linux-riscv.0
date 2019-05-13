Return-Path: <SRS0=1KMB=TN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55687C04A6B
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 13 May 2019 02:15:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2689B208CB
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 13 May 2019 02:15:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FVhY+u6C";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="r6kk+F6u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2689B208CB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=yl9ExqNU1+l6aJD8949Y2RPMWLaYPMor/TNsO/AhyTk=; b=FVh
	Y+u6CYRF2bGU/mLzQzlXs4A7mJKnFBxUTdQmr0vBvY4ljlziTnzCgQp3cwSwKXhDKakYiedprNvgM
	qWlQb8sLzD6+Za6op52wqCQ6Gkd75n03ilk6zuc+lHfV6WWl6tEembfJ5idFrRMyruLUfURzk+uaB
	M/jD5t6IbqLHEHl9lkjSXhfzjsED2Vhh5KhaeGjswNMlSanCD8b0BbP+jNB4UZpbxddRyGbIrZWUq
	yd1/uayBTPbCQcBCoGqxgWuRT5N2UzmHdLfnFjs5L3rFb5sfQp+pzIb9jHc98Ex0tWme1iz4f4+w3
	kaGY3g2APcIFFErBnA7NNgPyzZ7dXSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hQ0Uk-0005hu-Q9; Mon, 13 May 2019 02:15:14 +0000
Received: from conuserg-07.nifty.com ([210.131.2.74])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hQ0Ui-0005ha-38
 for linux-riscv@lists.infradead.org; Mon, 13 May 2019 02:15:13 +0000
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-07.nifty.com with ESMTP id x4D2EE3v031136;
 Mon, 13 May 2019 11:14:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com x4D2EE3v031136
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1557713655;
 bh=yt8WNEk/c0Lu9DjEl2IG91FINsXeZugKO1ysTYHMkOA=;
 h=From:To:Cc:Subject:Date:From;
 b=r6kk+F6uCUivwteO6G9WgYSMfdoPPwfH/BqDDKvNbx5AMfhf0W0nGULqDWAH22nbR
 dKAMHkzWShvXPE9Lb4uXuHxLz7rnE9reXOWD8HnTebl56KVlVcFH7g2msB5IL2RLIa
 NM8riQlijAhaMElRggAN8FlUu3ICr2bULjIv88u6K0WQZA3va+NISq5Ch7Rr7PIwlP
 FSGbs3u7E6fyxEGawjJ2vziiBOuQiKIWDFBY4dFrLpuZloFYEILOL7BNeGI9ezKTYu
 vNAEXMMveTRKDs1WLFYm6JwRjwze5S30HG4H8lmHklaH3IZaqJNazQke3oZLkUd1WZ
 77J4r6VWaYvyg==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH] alpha: move arch/alpha/defconfig to
 arch/alpha/configs/defconfig
Date: Mon, 13 May 2019 11:14:05 +0900
Message-Id: <20190513021405.12428-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190512_191512_344886_EA42A2E5 
X-CRM114-Status: UNSURE (   5.23  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 linux-alpha@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 Matt Turner <mattst88@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 linux-riscv@lists.infradead.org, Richard Henderson <rth@twiddle.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

As of Linux 5.1, alpha and s390 are the last architectures that
have defconfig in arch/*/ instead of arch/*/configs/.

  $ find arch -name defconfig | sort
  arch/alpha/defconfig
  arch/arm64/configs/defconfig
  arch/csky/configs/defconfig
  arch/nds32/configs/defconfig
  arch/riscv/configs/defconfig
  arch/s390/defconfig

The arch/$(ARCH)/defconfig is the hard-coded default in Kconfig,
and I want to deprecate it after evacuating the remaining defconfig
into the standard location, arch/*/configs/.

Define KBUILD_DEFCONFIG like other architectures, and move defconfig
into the configs/ subdirectory.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/alpha/Makefile                | 2 ++
 arch/alpha/{ => configs}/defconfig | 0
 2 files changed, 2 insertions(+)
 rename arch/alpha/{ => configs}/defconfig (100%)

diff --git a/arch/alpha/Makefile b/arch/alpha/Makefile
index 12dee59b011c..b3314e0dcb6f 100644
--- a/arch/alpha/Makefile
+++ b/arch/alpha/Makefile
@@ -8,6 +8,8 @@
 # Copyright (C) 1994 by Linus Torvalds
 #
 
+KBUILD_DEFCONFIG := defconfig
+
 NM := $(NM) -B
 
 LDFLAGS_vmlinux	:= -static -N #-relax
diff --git a/arch/alpha/defconfig b/arch/alpha/configs/defconfig
similarity index 100%
rename from arch/alpha/defconfig
rename to arch/alpha/configs/defconfig
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
