Return-Path: <SRS0=qsF3=BI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1BBBC433DF
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2020 07:51:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 904DB207F5
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2020 07:51:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cNbniZpe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 904DB207F5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=distanz.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C1vHWZqJL9IdpaFkWPVEiDFqwqpwD7bf1/p4rSwjkr0=; b=cNbniZpeMgDDdRXuJGgh6GbZvx
	AkKnMuZgHnBrf9SRnASfFJ+3jtD7pZNM1tRapAygmPuHDuPQedNo/ZVK5iDNM2XO7s7mfwXtPPBkA
	ju+jXrpQaEzJDWE4oEwK5Uj1ILu0CfkJkeHyRiakHlIXB29ojKcZtbWmcATU+zdK8njuYT6TU/yT6
	herM2DF0NsHZFqocNguqM1ZAQqfLlbIUtOeC0s5LH6b9NazljLMdV+AEjO6cx6CcziUyYj5OT5bXN
	kuuy1ETJwXWpuX+Pi8CaVtvhNccBmXV+m8SWtENCS54yAvqFqOHua83nnqSEDbvIpWElxLSHj2TQ9
	YWcH0zlQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0gsB-0004gw-3t; Wed, 29 Jul 2020 07:51:35 +0000
Received: from sym2.noone.org ([178.63.92.236])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0gs7-0004ej-NC
 for linux-riscv@lists.infradead.org; Wed, 29 Jul 2020 07:51:32 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 4BGm2T6MKbzvjc1; Wed, 29 Jul 2020 09:51:29 +0200 (CEST)
From: Tobias Klauser <tklauser@distanz.ch>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH] riscv: disable stack-protector for vDSO
Date: Wed, 29 Jul 2020 09:51:29 +0200
Message-Id: <20200729075129.11538-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_035131_950858_22E195F0 
X-CRM114-Status: UNSURE (   8.19  )
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

Currently, building the vDSO with clang leads assembler errors like the
following:

  /tmp/vgettimeofday-1ae0d2.s: Assembler messages:
  /tmp/vgettimeofday-1ae0d2.s:28: Error: bad expression
  /tmp/vgettimeofday-1ae0d2.s:28: Error: illegal operands `auipc a2,%got_pcrel_hi(__stack_chk_guard)'

Disable the stack-protector for vDSO to fix these.

Link: https://github.com/ClangBuiltLinux/linux/issues/1112
Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 arch/riscv/kernel/vdso/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index c8c9e40023c6..478e7338ddc1 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -16,6 +16,8 @@ vdso-syms += flush_icache
 # Files to link into the vdso
 obj-vdso = $(patsubst %, %.o, $(vdso-syms)) note.o
 
+ccflags-y := -fno-stack-protector
+
 ifneq ($(c-gettimeofday-y),)
   CFLAGS_vgettimeofday.o += -fPIC -include $(c-gettimeofday-y)
 endif
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
