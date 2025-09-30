Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E5D1CCA476
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Sep 2025 16:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ThRNFWYkRUJP0LUeT+3UYf7YcLVP4KrNnMCECBaJdCQ=; b=2w/O6Xf0r2OAdY
	cPNMHU9P3FDda2m2RqTcaIZ5Jr6yDU/fQhL9EuMmYAT3j6bgbR4siQyycy2qBlOaEDE3I79nLqz6H
	KIbzErhXS0BjmPq4PVyLosAkToQQc+7/yQEuxd76oQeSTxKkHKtgWJWCfjBz5rbhXPTATTyuA/9TV
	rmO6jY6f3LQ03bk0eax9U1kCgTCWodVtzqbW2YklIJTNpy47Q5pKPMyLRgj5VZm6cgrmYFWeXo/IQ
	OJQjd3VUi4lGaVeQeSk6rMB6DwUChnSRP/Y/pOyIj4RDISCtgieBLxmylmzyue1udkgHV/YH5czIc
	mGIYC6tWyqCUt7os4JwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ddW-00000005oax-0AOr;
	Tue, 30 Sep 2025 16:55:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ddT-00000005oZf-1pt0
	for linux-riscv@lists.infradead.org;
	Tue, 30 Sep 2025 16:55:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F359E106F;
	Tue, 30 Sep 2025 09:55:22 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82A923F59E;
	Tue, 30 Sep 2025 09:55:28 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 30 Sep 2025 17:54:54 +0100
Subject: [PATCH v2 6/8] perf test coresight: Dismiss clang warning for
 unroll loop thread
MIME-Version: 1.0
Message-Id: <20250930-perf_build_android_ndk-v2-6-2ea440b7ef01@arm.com>
References: <20250930-perf_build_android_ndk-v2-0-2ea440b7ef01@arm.com>
In-Reply-To: <20250930-perf_build_android_ndk-v2-0-2ea440b7ef01@arm.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, James Clark <james.clark@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 llvm@lists.linux.dev, linux-riscv@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759251311; l=1677;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=6JaO7UUmiEVn7pKrHNGJDEz9BYZJxL1KrwbjcRDT7O4=;
 b=IL/PtsxjrtyZRg6KRWstnSYp5wNt6/32M/wHANXmPmbiMF5O1tf7AOPJLXWhrVbYU1Tb3s5/B
 MMKbuhplGktCHa4HUqCP/OH0wowWkyrD+ugaDL6GNmXy9AZeLgP3bN/
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_095531_517554_78E8F52D 
X-CRM114-Status: GOOD (  11.49  )
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

clang-18.1.3 on Ubuntu 24.04.2 reports warning:

  unroll_loop_thread.c:35:25: warning: value size does not match register size specified by the constraint and modifier [-Wasm-operand-widths]
     35 |                         : /* in */ [in] "r" (in)
        |                                              ^
  unroll_loop_thread.c:39:1: warning: non-void function does not return a value [-Wreturn-type]
     39 | }
        | ^

Use the modifier "w" for 32-bit register access and return NULL at the
end of thread function.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 .../tests/shell/coresight/unroll_loop_thread/unroll_loop_thread.c     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/perf/tests/shell/coresight/unroll_loop_thread/unroll_loop_thread.c b/tools/perf/tests/shell/coresight/unroll_loop_thread/unroll_loop_thread.c
index 0fc7bf1a25af3607b40f091f62176134ddb7f9f6..8f4e1c985ca38ab545a05189432a14a6d888d34c 100644
--- a/tools/perf/tests/shell/coresight/unroll_loop_thread/unroll_loop_thread.c
+++ b/tools/perf/tests/shell/coresight/unroll_loop_thread/unroll_loop_thread.c
@@ -20,7 +20,7 @@ static void *thrfn(void *arg)
 	for (i = 0; i < 10000; i++) {
 		asm volatile (
 // force an unroll of thia add instruction so we can test long runs of code
-#define SNIP1 "add %[in], %[in], #1\n"
+#define SNIP1 "add %w[in], %w[in], #1\n"
 // 10
 #define SNIP2 SNIP1 SNIP1 SNIP1 SNIP1 SNIP1 SNIP1 SNIP1 SNIP1 SNIP1 SNIP1
 // 100
@@ -36,6 +36,8 @@ static void *thrfn(void *arg)
 			: /* clobber */
 		);
 	}
+
+	return NULL;
 }
 
 static pthread_t new_thr(void *(*fn) (void *arg), void *arg)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
