Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E68CCD199
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 15:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wkG931orpuDzOxqK6Wl0m1wxRn3b581keC1TMMG7lwM=; b=ynMdw3bGvXBnQ1
	1bz1vqJryXwk+qg5WinQCT7bVtGQ4UYMdL3PbjTJ1ubN1CLYhP76TmzQf07WcHWZcaLihgNGYp+S5
	/gX9sWO23WqDJvXjMQvnfUXXto0klSr9O7dP2Xq5yjIm882qJGxX/HA0SgBgLA/WwwdQGeGHuiWoa
	72L5H3cCyzKfA/WZKXSfci6aplYmcj2q7tqcslKGVwuekeljCRqaKL7xDKgemAl6qmXdUESyZRFLI
	iD63fjSKsWp19T7HN5sZS98mgK3ZLaSehV925xUNGDI6/yjKeQPQQK1M3vWuQaXaKFKR6QxYYLkMf
	AKCKRp5SOr9HEKgXz1JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mS4-00000008Hje-3OsG;
	Fri, 17 Oct 2025 15:33:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mS1-00000008Hi1-1V0o
	for linux-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 15:33:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF8694B6CE;
	Fri, 17 Oct 2025 15:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B5BC4CEE7;
	Fri, 17 Oct 2025 15:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1760715184;
	bh=LiKIWFDNYNNAES7eZnL2gzfDuBzjxqEOphFOwMWdHrE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nc1VWl3uSn0+5q4pOFcb70EJbz+FWE9fpH94zJEWKW8u9mUZ3/GaF1Oacm7pDR5XY
	 FghuHkKA3YjOqExtEZBU7oxL6NNx/sHh5SwODlifkdoaMIm9PYyh61EgyXQyhansHe
	 rxJAa2J3AZy2GJg4bY3J9fhaqVLNC6DBgJ7YNzz8=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	patches@lists.linux.dev,
	Leo Yan <leo.yan@arm.com>,
	Ian Rogers <irogers@google.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Justin Stitt <justinstitt@google.com>,
	Bill Wendling <morbo@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	James Clark <james.clark@linaro.org>,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.17 095/371] perf python: split Clang options when invoking Popen
Date: Fri, 17 Oct 2025 16:51:10 +0200
Message-ID: <20251017145205.376305398@linuxfoundation.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017145201.780251198@linuxfoundation.org>
References: <20251017145201.780251198@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_083305_453767_56689CD3 
X-CRM114-Status: GOOD (  12.43  )
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

6.17-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Leo Yan <leo.yan@arm.com>

[ Upstream commit c6a43bc3e8f6102a47da0d2e53428d08f00172fb ]

When passing a list to subprocess.Popen, each element maps to one argv
token. Current code bundles multiple Clang flags into a single element,
something like:

  cmd = ['clang',
         '--target=x86_64-linux-gnu -fintegrated-as -Wno-cast-function-type-mismatch',
	 'test-hello.c']

So Clang only sees one long, invalid option instead of separate flags,
as a result, the script cannot capture any log via PIPE.

Fix this by using shlex.split() to separate the string so each option
becomes its own argv element. The fixed list will be:

  cmd = ['clang',
         '--target=x86_64-linux-gnu',
	 '-fintegrated-as',
	 '-Wno-cast-function-type-mismatch',
	 'test-hello.c']

Fixes: 09e6f9f98370 ("perf python: Fix splitting CC into compiler and options")
Signed-off-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Ian Rogers <irogers@google.com>
Link: https://lore.kernel.org/r/20251006-perf_build_android_ndk-v3-2-4305590795b2@arm.com
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: Justin Stitt <justinstitt@google.com>
Cc: Bill Wendling <morbo@google.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: James Clark <james.clark@linaro.org>
Cc: linux-riscv@lists.infradead.org
Cc: llvm@lists.linux.dev
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-perf-users@vger.kernel.org
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/perf/util/setup.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/setup.py b/tools/perf/util/setup.py
index dd289d15acfd6..9cae2c472f4ad 100644
--- a/tools/perf/util/setup.py
+++ b/tools/perf/util/setup.py
@@ -1,6 +1,7 @@
 from os import getenv, path
 from subprocess import Popen, PIPE
 from re import sub
+import shlex
 
 cc = getenv("CC")
 assert cc, "Environment variable CC not set"
@@ -22,7 +23,9 @@ assert srctree, "Environment variable srctree, for the Linux sources, not set"
 src_feature_tests  = f'{srctree}/tools/build/feature'
 
 def clang_has_option(option):
-    cc_output = Popen([cc, cc_options + option, path.join(src_feature_tests, "test-hello.c") ], stderr=PIPE).stderr.readlines()
+    cmd = shlex.split(f"{cc} {cc_options} {option}")
+    cmd.append(path.join(src_feature_tests, "test-hello.c"))
+    cc_output = Popen(cmd, stderr=PIPE).stderr.readlines()
     return [o for o in cc_output if ((b"unknown argument" in o) or (b"is not supported" in o) or (b"unknown warning option" in o))] == [ ]
 
 if cc_is_clang:
-- 
2.51.0




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
