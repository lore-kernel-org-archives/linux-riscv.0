Return-Path: <SRS0=qsF3=BI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 554EDC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2020 04:44:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 212F12070B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2020 04:44:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EkZwjfMr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 212F12070B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=distanz.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MBdv5+Iq+8NDkkvF5hc5L3dPnGY/4Bovla++fhwBBmg=; b=EkZwjfMrXsgLkW/JG3B83Y4P5b
	JTaU/acRxScZ7OJnJijY4oOt4HlRkRBCCQ9WF+1kVn4xqTiWq8KKOIASle/t48UChfro/Mz6dqt1I
	F97x2PtgTLRvOHyFLjq5l0HBY6K/20ONMGClGBoW+Xugce3jugI5hAfPC94oaIA4JneOCuewiW3V4
	X1SA0tsY+CvHsrM2Djy1k8XEk4RT3qyV+rVPYunkL2kg1kPya+yhNrBnmuDG+JwQWxLFQlv1LsrEF
	ORM1QITYNEQ8j37ZV8jZ07MW4NNKD5r+rnvtqfzqCSBth5F6KPUURUJu0Kc2p5d+IZno0VOBCr29a
	hr7MEMlQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0dxE-0001u2-MO; Wed, 29 Jul 2020 04:44:36 +0000
Received: from sym2.noone.org ([178.63.92.236])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0dxB-0001t4-OJ
 for linux-riscv@lists.infradead.org; Wed, 29 Jul 2020 04:44:34 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 4BGgth5FSmzvjc1; Wed, 29 Jul 2020 06:44:28 +0200 (CEST)
From: Tobias Klauser <tklauser@distanz.ch>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v2] riscv: don't specify -mno-save-restore when building with
 clang < 11
Date: Wed, 29 Jul 2020 06:44:28 +0200
Message-Id: <20200729044428.32460-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20200728131252.15407-1-tklauser@distanz.ch>
References: <20200728131252.15407-1-tklauser@distanz.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_004433_909052_5C5A88C1 
X-CRM114-Status: UNSURE (   8.85  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmerdabbelt@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Clang before version 11 doesn't support -msave-restore and
-mno-save-restore [1].

[1] https://github.com/ClangBuiltLinux/linux/issues/804

This avoids the following message when building with clang 10 and older:

  '-save-restore' is not a recognized feature for this target (ignoring feature)

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
v2: use cc-option and check for clang version

 arch/riscv/Makefile | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index fb6e37db836d..30e34946af86 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -44,7 +44,14 @@ riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
 KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
 KBUILD_AFLAGS += -march=$(riscv-march-y)
 
-KBUILD_CFLAGS += -mno-save-restore
+KBUILD_CFLAGS += $(call cc-option,-mno-save-restore)
+# Clang versions less than 11 do not support save-restore. See
+# https://github.com/ClangBuiltLinux/linux/issues/804
+ifeq ($(CONFIG_CC_IS_CLANG), y)
+  ifeq ($(shell test $(CONFIG_CLANG_VERSION) -lt 110000; echo $$?),0)
+    KBUILD_CFLAGS := $(filter-out -mno-save-restore,$(KBUILD_CFLAGS))
+  endif
+endif
 KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
 
 ifeq ($(CONFIG_CMODEL_MEDLOW),y)
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
