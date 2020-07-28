Return-Path: <SRS0=Fr2v=BH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F95CC433E4
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 13:13:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 476BF2074F
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2020 13:13:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LuHv16V2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 476BF2074F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=distanz.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=knTLiCiqJW9zGE0kzvsXH9+BiA0MTiSzP7eOIA77Y2E=; b=LuHv16V2X75YPhbp8rLXYO8Zk2
	nWBzqTp+LYSeXm2F4g1gBMQYwCBnLOTYw70xq5kEpIiGGjn3XOgaDGLoIPQpMv5E9qKsTkQXoNpwh
	cIwN9NbI7+iEa3VYtkIpiMIX98yp7OknMpvx6FetjUlcXXi3BwHbSQggCiLD+LU4m2LTct3j1/AgC
	vlRenrYWVlUwLy9NWQqgaVR/nxMX/FeZ35I+v2YkiCTPC1/oVUmNsI8Cxk4pPSIZzjH/9/g8mew2I
	L2WLXYBTfcskMvmtcgRJy2wgG6aqnOjAo829VVwpBG/xzw/mDLhghlIZqNJREt7Qgldj6xQKh/yGS
	ehbOxdaQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0PPf-0005T8-Ck; Tue, 28 Jul 2020 13:12:59 +0000
Received: from sym2.noone.org ([2a01:4f8:120:4161::3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0PPc-0005Qe-Iz
 for linux-riscv@lists.infradead.org; Tue, 28 Jul 2020 13:12:57 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 4BGHCm655Zzvjc1; Tue, 28 Jul 2020 15:12:52 +0200 (CEST)
From: Tobias Klauser <tklauser@distanz.ch>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH RESEND] riscv: don't specify -mno-save-restore when building
 with clang
Date: Tue, 28 Jul 2020 15:12:52 +0200
Message-Id: <20200728131252.15407-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_091256_783922_D2FC4A9F 
X-CRM114-Status: UNSURE (   8.65  )
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

Clang doesn't support -msave-restore and -mno-save-restore. This avoids
the following message emitted by clang:

  '-save-restore' is not a recognized feature for this target (ignoring feature)

Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
Resent due to infradead.org mailing list issues.

 arch/riscv/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index fb6e37db836d..cd3720bc45e8 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -44,7 +44,9 @@ riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
 KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
 KBUILD_AFLAGS += -march=$(riscv-march-y)
 
+ifndef CONFIG_CC_IS_CLANG
 KBUILD_CFLAGS += -mno-save-restore
+endif
 KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
 
 ifeq ($(CONFIG_CMODEL_MEDLOW),y)
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
