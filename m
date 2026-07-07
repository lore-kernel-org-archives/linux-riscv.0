Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39659C43458
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 08:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZeYFZTdarNCffmm7nTpSM5WztX3xup3HPclfUGgRXGY=; b=gKSHYdGnhqADyP
	CVCYeUeR17pbCrUWzRk7TJcYgIX5abUBFTs1xt0NeJscLcTnNYyzFpd115B2fsN7fYgwYMWWJmh1L
	ll5OhmiL+g0TgdCtNJ4IdMHAYcPz0U58GH6ajw18jgl7LVQZR8fbNJ6mskzEUAtYbGsa6HeuOLey2
	MRqqjxUCAc7+csrDjYBWZmi4KinFtfMaLiP/DeTtclPBaHfjPg7t3oJ6hSpX1fUyqK3T6fw3XPqwx
	yu9UloEBjBneUFTzsQo1SGbNo2X8ky/j17HlLMinEHvNdguXrHfNH8VAGe71ZRmJe9Pd+6isEnxQC
	CBZSqWuxFEUd/YU2cyMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh163-0000000EStE-1PxK;
	Tue, 07 Jul 2026 08:24:03 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh161-0000000ESsf-1jEB
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 08:24:02 +0000
Received: from hwang4-g16.bbrouter (unknown [120.238.231.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id 6202A3F69E;
	Tue,  7 Jul 2026 08:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1783412639;
	bh=otMAzx7L+EJebfLdNISLzbMHGsQZXuDqmd8aKwVYc/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=bnGGKTSUbNlNP0VVRDC3fO+W+Hj5ZoeBQD4xSTvu4gryGUXFGQmNMUjIFv7KuH0wY
	 579unEq4AXYrPnSlxw54cfLmMPah/0xtTZAJjlHo2EY5+szxtTZYo0UbFdnIvGKIdu
	 a5nJNnCu0NktB3qNsqhxW0W0LwhIetQVjZPNcDTLYps0HnPdlgtANIm5KGzjatv/0h
	 rY6AwhqpNFbqbWqFIS2dQgWuVK5JeoYiQ0xxgtLklreykYWZfY/o5f3EXXpgv+ngj1
	 39Ianr/6qpbJtPug/KKg20Yb9MMPkR3jXakjNpkb/0swBPkAGtIKAWKpyTRi5m1gWu
	 p5hbYOTEzGV+u5y5XpBKKFSJD5yfCev4cB2vnlrh0yMvLpTkWr33buPLFrD/a9RLKr
	 J8DBW19L/8i6xxNApEGIfPO8bgr8AqTA+Mjk0KNDAqyRpsWfJrU888ECoegcnLHwg6
	 ePPDRrPw506Jf7OGJQJt2td94EjuMm3M/xghT9bJ8zCior+PBc/bEOzNSd6HZl/C9C
	 DR7jn1THL+cfNKYI1TUEN+F6D6KpnzNhhzIhyCc4Q6ZwZpiiwd0/PCEphJ9YkMq+Kx
	 aSFA7t8suEaPxvpvCOccpJqe+SW1s8kItuSV2YRKKgLRdmBNpva/rmBEJz82JZPtHQ
	 +UcdWR2XmelrEadGr1yRJGK8=
From: Hui Wang <hui.wang@canonical.com>
To: mathieu.desnoyers@efficios.com,
	peterz@infradead.org,
	shuah@kernel.org,
	paulmck@kernel.org,
	boqun@kernel.org,
	zhouquan@iscas.ac.cn,
	ajones@ventanamicro.com,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: stable@vger.kernel.org,
	hui.wang@canonical.com
Subject: [PATCH v2] selftests/rseq: Fix a building error for riscv arch
Date: Tue,  7 Jul 2026 16:23:48 +0800
Message-ID: <20260707082348.36896-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_012401_570621_E3203F65 
X-CRM114-Status: GOOD (  10.29  )
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

RISC-V rseq selftests include asm/fence.h from tools/arch/riscv,
but the rseq Makefile only adds tools/include in the CFLAGS, this
results in the building failure both for native and cross build:

    In file included from rseq.h:131,
                     from rseq.c:37:
    rseq-riscv.h:11:10: fatal error: asm/fence.h: No such file or directory

To fix it, add the matching tools/arch/$(ARCH)/include path in the
CFLAGS and derive ARCH from SUBARCH for standalone native builds where
ARCH is not set.

Fixes: c92786e179e0 ("KVM: riscv: selftests: Use the existing RISCV_FENCE macro in `rseq-riscv.h`")
Cc: stable@vger.kernel.org
Signed-off-by: Hui Wang <hui.wang@canonical.com>
---
 tools/testing/selftests/rseq/Makefile | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/rseq/Makefile b/tools/testing/selftests/rseq/Makefile
index 50d69e22ee7a..aba6317f6cb8 100644
--- a/tools/testing/selftests/rseq/Makefile
+++ b/tools/testing/selftests/rseq/Makefile
@@ -5,9 +5,13 @@ CLANG_FLAGS += -no-integrated-as
 endif
 
 top_srcdir = ../../../..
+include $(top_srcdir)/scripts/subarch.include
+ARCH ?= $(SUBARCH)
+LINUX_TOOL_ARCH_INCLUDE = $(top_srcdir)/tools/arch/$(ARCH)/include
 
 CFLAGS += -O2 -Wall -g -I./ $(KHDR_INCLUDES) -L$(OUTPUT) -Wl,-rpath=./ \
-	  $(CLANG_FLAGS) -I$(top_srcdir)/tools/include
+	  $(CLANG_FLAGS) -I$(top_srcdir)/tools/include \
+	  -I$(LINUX_TOOL_ARCH_INCLUDE)
 LDLIBS += -lpthread -ldl
 
 # Own dependencies because we only want to build against 1st prerequisite, but
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
