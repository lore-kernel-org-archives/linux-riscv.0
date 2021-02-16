Return-Path: <SRS0=wY1U=HS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11CAC433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Feb 2021 17:33:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35A7264DA1
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Feb 2021 17:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35A7264DA1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=distanz.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WbQb5P3MwVUyy1t9wrsFDJE37YuOG2HWhrr+btQCaR0=; b=fbcrTU7Z5zhjxU8CkcFceKRL8v
	pFEm/PszN1VSv4E+PRp9wpTAla4syCGWa7LjE0JRBcPJVjbLnjzZDuwM30DAfI7058ywev+PB2dGb
	oOe1E6knm2iOlZgTgylchmwNQhvLteS8Fg6pWv3PEKJm4QswMkd1D5C2OAHERCFOoRb/0DJurbybM
	hcHxNyYW14me+uXYN/UJ64M6oJfJQHqECgkTbiqvXVXOoG2Oo7YifCwd30E68Vu4cLhATNUGthpu7
	7GeQjUvjDXAZIQMTmetkAjbkfEjCkj7DlFPR226AjmROFxr7QKrWSV53DRQefeESyvKQZz+NyW3RY
	T89Qq8IQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC4Du-0001NE-Hd; Tue, 16 Feb 2021 17:33:18 +0000
Received: from sym2.noone.org ([178.63.92.236])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC4Ds-0001MM-Fn
 for linux-riscv@lists.infradead.org; Tue, 16 Feb 2021 17:33:17 +0000
Received: by sym2.noone.org (Postfix, from userid 1002)
 id 4Dg7NK4nrHzvjfn; Tue, 16 Feb 2021 18:33:05 +0100 (CET)
From: Tobias Klauser <tklauser@distanz.ch>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH] riscv: Disable KSAN_SANITIZE for vDSO
Date: Tue, 16 Feb 2021 18:33:05 +0100
Message-Id: <20210216173305.2500-1-tklauser@distanz.ch>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_123316_648056_CA604A04 
X-CRM114-Status: GOOD (  11.15  )
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
Cc: linux-riscv@lists.infradead.org, Dmitry Vyukov <dvyukov@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Dmitry Vyukov reports:
> I've localized one issue with riscv/KASAN:
> KASAN breaks VDSO and that's I think the root cause of weird faults I
> saw earlier. The following patch fixes it.
> Could somebody please upstream this fix? I don't know how to add/run
> tests for this.

Verified the fix on a kernel with KASAN enabled using vDSO selftests.

Link: https://lore.kernel.org/lkml/CACT4Y+ZNJBnkKHXUf=tm_yuowvZvHwN=0rmJ=7J+xFd+9r_6pQ@mail.gmail.com/
Cc: Dmitry Vyukov <dvyukov@google.com>
Tested-by: Tobias Klauser <tklauser@distanz.ch>
Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
---
 arch/riscv/kernel/vdso/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 0cfd6da784f8..71a315e73cbe 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -32,9 +32,10 @@ CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
 # Disable -pg to prevent insert call site
 CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os
 
-# Disable gcov profiling for VDSO code
+# Disable profiling and instrumentation for VDSO code
 GCOV_PROFILE := n
 KCOV_INSTRUMENT := n
+KASAN_SANITIZE := n
 
 # Force dependency
 $(obj)/vdso.o: $(obj)/vdso.so
-- 
2.30.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
