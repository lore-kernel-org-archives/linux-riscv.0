Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2BCCCA471
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Oct 2025 16:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ThRNFWYkRUJP0LUeT+3UYf7YcLVP4KrNnMCECBaJdCQ=; b=IPNkx/+2k/WAzd
	fpWismyRj4xPJa1lPWswZnWqZTmkoXfg/0SAYwPuziHNuqBZ7KQ8/6O5uiAz69dREEfFjH/4hDHRR
	U5i18VDVGw0nOt5hB8K7B67iJeNUIyCBbsQTfA3w8/p8bC19gqnZ6akVzrOPRgBocjLaAWH4w5L28
	EWW47p+h0IxKa1cVwaTQLXitjDHxd2f8CX/E7e0QFpQF0d84gOsqZtYgj2Z4i5FMkkagmBJ5l4Axb
	TlJ4G1COFsbrYuIj5nfB+6UDYH7oxV8r3tVhqHU65dU/CI+XnzZADOf7zlSN9PkDhVCiUWcVsMYj2
	SDtJ1NybNBz4oAbiGdZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5nyL-00000000NJd-1AoL;
	Mon, 06 Oct 2025 16:22:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5nyJ-00000000NHi-2GkW
	for linux-riscv@lists.infradead.org;
	Mon, 06 Oct 2025 16:22:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2749E1515;
	Mon,  6 Oct 2025 09:21:51 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 926983F738;
	Mon,  6 Oct 2025 09:21:56 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 06 Oct 2025 17:21:29 +0100
Subject: [PATCH v3 7/9] perf test coresight: Dismiss clang warning for
 unroll loop thread
MIME-Version: 1.0
Message-Id: <20251006-perf_build_android_ndk-v3-7-4305590795b2@arm.com>
References: <20251006-perf_build_android_ndk-v3-0-4305590795b2@arm.com>
In-Reply-To: <20251006-perf_build_android_ndk-v3-0-4305590795b2@arm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759767696; l=1677;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=6JaO7UUmiEVn7pKrHNGJDEz9BYZJxL1KrwbjcRDT7O4=;
 b=Lt1QqvHfOSB9vlFHFsS4Jsx07yuXXDBJvHmH9ANcX4UcxoVzli1my1N8n0DqahPDTvzLHJsdb
 AG1Hvg+beaLDrTNowNSUpqt/TUBAaJzkKKDZ63Txa8cZJotCjhVyBMC
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_092159_621756_4AB6FF2C 
X-CRM114-Status: GOOD (  11.13  )
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
