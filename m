Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0394C43458
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 08:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZeYFZTdarNCffmm7nTpSM5WztX3xup3HPclfUGgRXGY=; b=HMVT90xQokPKjM
	B8OppT3d3uyK5FNxvzrenYN5f4ggnbqI7gU99+fpeWXPIDYrzrC1iRDlRxgfpRtbXrnl894vkoyCB
	wDkTbRpBMh1WQSYi6aNGAbVie/tMADR4PY/uULbj/+YMiZFbNtvaDM/5opUKEZJ2F0NRAbJKTPrjm
	6jhc41qxeH+JR8oWln2v9T4jEjtbGYdouYldc8u/fysNrt80lo0XHUHUco3Dzvjw+f0u76niEeLXK
	YpjDKDZBQN44/qRGBg2Q3eB28bPTo6S4QCbtV9W0jmvilPTPrlahHdJrhxCHsprKxI2pAwr79pp0c
	r7mewm1D0woflcKcXVng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0zm-0000000ERdW-32jk;
	Tue, 07 Jul 2026 08:17:35 +0000
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0zj-0000000ERd6-3VFV
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 08:17:33 +0000
Received: from hwang4-g16.bbrouter (unknown [120.238.231.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id F3EA93FA33;
	Tue,  7 Jul 2026 08:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1783412247;
	bh=otMAzx7L+EJebfLdNISLzbMHGsQZXuDqmd8aKwVYc/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=jt6Jcxn0VYub3FkHe82hTT3pEN+eoES0gf7ubygT9lWMEF181m6AU4aTZ5VOpIAsb
	 hlzltzbipxfTABlDYYnhMVVjc8q9i6g/x2vvUL1C5bAXcQdBZvWu+WwhcmrpZo9CO9
	 4OWZiFgR34V+DM9jf8pFVkX6x7WYlrahUjiVWHmxfn5o/gq2VX+FuPZm83KChwbTIy
	 X+VEnyoscPHPJusZgOWy91yYnU1SjXXAklFhM4w4qgbd0E5RECGtsDK3yGaLVjAlIG
	 TnCA3sN8XINmn9yNecqF8TWP6mRBbFe/BGsHn0vWyOP7qD0XyrYtqSwnifKroGfwmB
	 OopHLPPMj9CwnH2OucrOfJ9t+VvYZHgYBtoy0W4nDS78tbJRz5kL23VxFOjqb3jDCh
	 B76U77e8o59DTHMUx27GfTzP41f2jKLzp6phPaChoCFxGS+G6x0ItDd0fol0EWvSMz
	 OwkU5I8/8vzaobaoGsd1q3zhddlhqx71EEfDh+MqmAYqAp1oCsCWx8DNqKPfA672YS
	 AMkTsPOd6ZE4Fw/MgoThW8FBV0K2p5KJH7jUFRaoq0H+QQVuX9Mocb/dku3ieT4j2e
	 6gjZs7pJmKFkJf9ZPOprLOPyrYcaC1Nas5wKlYe0CmJEI0Nx0tEljUQ+ETc+EetIKJ
	 9DqZNvQxehSS4bkYnfxhYF+A=
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
Subject: [PATCH] selftests/rseq: Fix a buliding error for riscv arch
Date: Tue,  7 Jul 2026 16:17:20 +0800
Message-ID: <20260707081720.36510-1-hui.wang@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_011732_265076_C1826F18 
X-CRM114-Status: GOOD (  10.26  )
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
