Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8B9C44502
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 06:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Fq8Otao7az9tz+AHHBf3bSWmPQFU08jj4yAWSOjyDw8=; b=hG5e2c8yRpiQ5m
	SWa+q/yKo5LEQW/yXoXa+TD6ldJV4zEV2NbQ+kXqkDplEiHMGBHO3A6M7J3pG9xrEnJgwY5vDOKJG
	Yqsf3pqzCkSTCgXez6Sw6pJgokeBFU8wLRUcRt/qgvf8Y1TPIbYXhg6DpR4RjqDgADQ74juLf6RQ0
	ms1QZh2SijKLjI2wz75w893vaBNkwUW1KDy3LQAAEKdw7OgO4f06xZLZOXq3XMn6WFBUHfAE0jqIB
	MvG05Aai6hHD/iDsk9uipTNs0Jqxib/OCxyUHfPvqAFekhLIb68rSxe7rt4mz7Q7LxMuDeeUVt8jB
	mfe9ytzSSfbogh0tvqOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5hh-0000000DmRD-4C0u;
	Mon, 29 Jun 2026 06:42:50 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5hf-0000000DmNv-0ovB
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 06:42:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1782715365; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=osYv4PyMOH+hGuFQLUeP+UmPCqW/DzeJKVWPMYqOR5E=;
	b=tHT6diOO2A4CXGbPtzdfEN4m7NtwYZ654zyEEE+P5c6ITgf6FItzDl4M7BEAjLO1jcH3W7OK1MV96Ytcvg6mhb60THvWKWO34DrxhV/HLIpHIyjwTWIZngF+J1SaL4yznTPL/zo9AmnXxk7wCx3HBXo8b9/F2W7ohjGrnDe/I+I=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R871e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=wanghan@linux.alibaba.com;NM=1;PH=DS;RN=34;SR=0;TI=SMTPD_---0X5nWtf9_1782715362;
Received: from wanghan-Workstation..(mailfrom:wanghan@linux.alibaba.com fp:SMTPD_---0X5nWtf9_1782715362 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 29 Jun 2026 14:42:43 +0800
From: Wang Han <wanghan@linux.alibaba.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	Oleg Nesterov <oleg@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	oliver.yang@linux.alibaba.com,
	xueshuai@linux.alibaba.com,
	zhuo.song@linux.alibaba.com,
	jkchen@linux.alibaba.com,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 7/7] selftests/livepatch: Add RISC-V syscall wrapper prefix
Date: Mon, 29 Jun 2026 14:42:28 +0800
Message-ID: <20260629064228.3195856-8-wanghan@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_234247_408630_5FDE2BE4 
X-CRM114-Status: UNSURE (   7.94  )
X-CRM114-Notice: Please train this message.
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

The syscall livepatch selftest resolves and patches a syscall wrapper
symbol. To use that test for RISC-V livepatch validation, add the
RISC-V FN_PREFIX definition for ARCH_HAS_SYSCALL_WRAPPER.

Without this macro, the syscall livepatch selftest cannot resolve the
RISC-V target symbol, and the syscall-related livepatch test fails on
RISC-V.

Reviewed-by: Marcos Paulo de Souza <mpdesouza@suse.com>
Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
Signed-off-by: Wang Han <wanghan@linux.alibaba.com>
---
 .../testing/selftests/livepatch/test_modules/test_klp_syscall.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c b/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
index 08aacc0e14de..9baa2a5f84c9 100644
--- a/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
+++ b/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
@@ -24,6 +24,8 @@
     #define FN_PREFIX __s390x_
   #elif defined(__aarch64__)
     #define FN_PREFIX __arm64_
+  #elif defined(__riscv)
+    #define FN_PREFIX __riscv_
   #elif defined(__powerpc__)
     #define FN_PREFIX
   #else
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
