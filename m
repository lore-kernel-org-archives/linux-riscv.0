Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 991A0C43334
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Jul 2022 01:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mY5lrl/0RscjSt2Yq+ZeOKCNnfLaEMsL8ZArI3a0KRY=; b=m+ZjRo3RLW1+5f
	0FCftXtGG+TmREW20hwuIPk3xJvZbsuAPInmnAACXXrcNbsFip89b9zRcva2mRlnXgE7G7y5GdXOi
	NVnr5V0NMIC1woljOOR9DFesOcYKGDndLc0PC4TEHc+m+Ed8jTOu82RqlVIAKSiRrijYETpE0yoL4
	s7w/BlZ5KKgUTkcs2OWUPwn6RJb2mrY0+rNn5q6JPz1kKXxu5QyjikZ+dcL2CpRM3FEzkAL/VNHHD
	jAJQL5rvRJcRiexcxc/XaKuxEiUyDrrAdBy9zPW+k3vrKvW2Tt4OJjBcdLH8/ARK3jIK8NquCbPM0
	brWvHCUcOEHtiqPBXQfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9zbJ-006i54-TF; Sat, 09 Jul 2022 01:49:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9zbJ-006i4v-9q; Sat, 09 Jul 2022 01:49:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=aHkveyM+Om9u2IdcFldBf9uD1c2apNFY/SnalVz/8kw=; b=UbHcmh9mUxnQGeVW674eJWgYeo
	P29zhK3BeUIsE3QES2Up8mHl0nWDHapO+/eOdR8iLIJqHKwh5WbDVf2bucZxjIXcIIFK/EONqVu/N
	ybjniFNFbj13lntQzf3R1YM218NE1r858HHZCI5EeF6xmjXYzejWD2tk2CTwqYMrrEji82xCHlEAj
	baQH8uMrP8uDUzp2tyE645adqxVwRwbH5F6pBs9cwNg8fVXajHHnOlHixRBmGhwFs9w54rv4wc9NH
	NhYL30uHz+bWDraLNLU5qNMBP4YY+/qN7xTsv2QKxpADicJQ4ibKZly9uMuQKLpfN+a5tcrzO0fh+
	ZddVrIcw==;
Received: from [2601:1c0:6280:3f0::a6b3] (helo=casper.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9zbD-0041Xe-Cq; Sat, 09 Jul 2022 01:49:35 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Wei Fu <wefu@redhat.com>,
	Liu Shaohua <liush@allwinnertech.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: fix RISCV_ISA_SVPBMT kconfig dependency warning
Date: Fri,  8 Jul 2022 18:49:29 -0700
Message-Id: <20220709014929.14221-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
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

RISCV_ISA_SVPBMT selects RISCV_ALTERNATIVE which depends on !XIP_KERNEL.
Therefore RISCV_ISA_SVPBMT should also depend on !XIP_KERNEL so
quieten this kconfig warning:

WARNING: unmet direct dependencies detected for RISCV_ALTERNATIVE
  Depends on [n]: !XIP_KERNEL [=y]
  Selected by [y]:
  - RISCV_ISA_SVPBMT [=y] && 64BIT [=y] && MMU [=y]

Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Wei Fu <wefu@redhat.com>
Cc: Liu Shaohua <liush@allwinnertech.com>
Cc: Guo Ren <guoren@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
---
 arch/riscv/Kconfig |    1 +
 1 file changed, 1 insertion(+)

--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -362,6 +362,7 @@ config RISCV_ISA_C
 config RISCV_ISA_SVPBMT
 	bool "SVPBMT extension support"
 	depends on 64BIT && MMU
+	depends on !XIP_KERNEL
 	select RISCV_ALTERNATIVE
 	default y
 	help

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
