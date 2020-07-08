Return-Path: <SRS0=nZh1=AT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7740BC433DF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2020 11:52:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04B8B2065C
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2020 11:52:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2//d1vDj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04B8B2065C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=distanz.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gf90cefXif3RZTPgl58ahLz3qoEXw7oLhNjRJG3wT6w=; b=2//d1vDjnUKBnNKI01evkN7R0Y
	Vg9PxZPpaNK3i5K5fJynP1Plbpcxo2ztvVTGLEg3oa1PTQ8NIpRlE0BIJU0yFq+dDOGnt6UJVdLqr
	Fm6amR8S60SDNiMKKIrO5WBhEJbYJBYkWiqFuq4aUnPno46lg202xSS+duZp+1qL1l1PGiqJP5qrC
	gDbazuqpTeB2Sdgia4ln8CwQQDJb4Ra2AFIYAikRTudKWj5conWSEIjIpxG8Z6Za6wZII9ihjSaI8
	/DlseMIOBaqJAC1wQsrb2Lph1aYgO27X4JbtGlG21gxjy4DfhL+o8KMnDAc0zj4di/bCm5PniunmS
	pI11TEyw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jt8cu-0002oR-22; Wed, 08 Jul 2020 11:52:36 +0000
Received: from sym2.noone.org ([178.63.92.236])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jt8cq-0002nL-U8
 for linux-riscv@lists.infradead.org; Wed, 08 Jul 2020 11:52:33 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 4B1yND11gXzvjc1; Wed,  8 Jul 2020 13:52:27 +0200 (CEST)
From: Tobias Klauser <tklauser@distanz.ch>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH] riscv: don't specify -mno-save-restore when building with
 clang
Date: Wed,  8 Jul 2020 13:52:27 +0200
Message-Id: <20200708115227.8584-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200708_075233_093938_26110F76 
X-CRM114-Status: UNSURE (   6.72  )
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
