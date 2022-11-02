Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E637FC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 08:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Gu9Vua+6DUn7h7L8ZgEz99znO+q9gKbLZF/3t3rZcgs=; b=Ylp4KyS3nF/GmY
	HgsdGpJTUjRn34G9YXCW1CSJk3V8hq+pRyAWLXxaofkPrbnd7QS1QDZHKKv+dT+8vFBTgxJW+O76q
	2i1weUdN9bC1B9cYmYu/xs3HwWU7tzipzpOtNIUT1Lg8zoxv8lZJlRREF+uUMtwwf6fl+O3zfsYwB
	V0ca9jhfZY8WTQ2Z1DPtrU5x6cHZJbxJcqRm/lq1MYDnO1tMyLbtmAMRe5ovZE2mO4QGLNv886KzA
	WsKRbp8ntR8dV4g3wSdNVnCsqpBnGpi2xpU2+4uSTCC1bQOPnWfEHKerORAlOAKOrBuVzWJBYZPSV
	mVpj6QWN7EwZln7GBwvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq8uZ-008noz-KX; Wed, 02 Nov 2022 08:15:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq8uX-008nnU-53
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 08:15:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0B0F061853;
	Wed,  2 Nov 2022 08:15:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9ADCEC433C1;
	Wed,  2 Nov 2022 08:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667376942;
	bh=UxH40MzWMTgfzw2DpcmVuLk/WjWfLctWt4uq1vUp0i0=;
	h=From:To:Cc:Subject:Date:From;
	b=or6LzbYCHRbrao7fc8U/fz26mg1WS1im9d2FT2tbZCHMqTHPdBJS8v1KR65ucRjai
	 qxf5Mwqwjg3JE6Y3ZU6cPwDevAAN8Cz3PtxSYRjoZpLpWHTLzuhMr3JE932rS7Tjxc
	 s+6iC8znsYc8mF+z2PN8L22RM8o9HJiVmU+Sr0ODZKql2zSpEXd02z4paci1D+5dUf
	 WFyuen5Pg/RHPJHiFSk64ob5eELxSXQ9VRu6aNEzJ1+cu5M5F+kwbyM/DpNMxXNYZl
	 nMlszKcCisBqW2Rjrf2SKMzKVC020+UY0YAx2wdkdzMEkmyQXOTB4TS2TlHgbJHmPM
	 X3eOpS1BqUkDA==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	shuah@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	"haocheng . zy" <haocheng.zy@linux.alibaba.com>,
	Mao Han <han_mao@linux.alibaba.com>,
	Guo Ren <guoren@linux.alibaba.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Elliott Hughes <enh@google.com>
Subject: [PATCH] selftests/vDSO: Add riscv getcpu & gettimeofday test
Date: Wed,  2 Nov 2022 04:15:31 -0400
Message-Id: <20221102081531.882149-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_011545_283228_D9B3250E 
X-CRM114-Status: GOOD (  10.76  )
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

From: Guo Ren <guoren@kernel.org>

Enable vDSO getcpu & gettimeofday test for riscv. But only riscv64
supports __vdso_gettimeofday and riscv32 is under development.

VERSION
{
        LINUX_4.15 {
        global:
                __vdso_rt_sigreturn;
                __vdso_gettimeofday;
                __vdso_clock_gettime;
                __vdso_clock_getres;
                __vdso_getcpu;
                __vdso_flush_icache;
        local: *;
        };
}

Co-developed-by: haocheng.zy <haocheng.zy@linux.alibaba.com>
Signed-off-by: haocheng.zy <haocheng.zy@linux.alibaba.com>
Suggested-by: Mao Han <han_mao@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Elliott Hughes <enh@google.com>
---
 tools/testing/selftests/vDSO/vdso_test_getcpu.c       | 5 +++++
 tools/testing/selftests/vDSO/vdso_test_gettimeofday.c | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/tools/testing/selftests/vDSO/vdso_test_getcpu.c b/tools/testing/selftests/vDSO/vdso_test_getcpu.c
index fc25ede131b8..1e474f406a87 100644
--- a/tools/testing/selftests/vDSO/vdso_test_getcpu.c
+++ b/tools/testing/selftests/vDSO/vdso_test_getcpu.c
@@ -14,8 +14,13 @@
 #include "../kselftest.h"
 #include "parse_vdso.h"
 
+#if defined(__riscv)
+const char *version = "LINUX_4.15";
+const char *name = "__vdso_getcpu";
+#else
 const char *version = "LINUX_2.6";
 const char *name = "__vdso_getcpu";
+#endif
 
 struct getcpu_cache;
 typedef long (*getcpu_t)(unsigned int *, unsigned int *,
diff --git a/tools/testing/selftests/vDSO/vdso_test_gettimeofday.c b/tools/testing/selftests/vDSO/vdso_test_gettimeofday.c
index 8ccc73ed8240..e411f287a426 100644
--- a/tools/testing/selftests/vDSO/vdso_test_gettimeofday.c
+++ b/tools/testing/selftests/vDSO/vdso_test_gettimeofday.c
@@ -27,6 +27,9 @@
 #if defined(__aarch64__)
 const char *version = "LINUX_2.6.39";
 const char *name = "__kernel_gettimeofday";
+#elif defined(__riscv)
+const char *version = "LINUX_4.15";
+const char *name = "__vdso_gettimeofday";
 #else
 const char *version = "LINUX_2.6";
 const char *name = "__vdso_gettimeofday";
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
