Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B4FC88E6A
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 09:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l9/lhVbuLlJ0H7YZiDV8IJNKx15nADAp5BI5lsNDsnI=; b=l2iSCJ/fcD8E4F
	GWqcGnAaVU9URwJOWq/OaXc96g0pTVG8V+wpGeD8913IebaK9FbFvuBvGT14JbpzI0UAitmqh6TUm
	v6UkfLt+UENR+AssxtsQYmy/a8hnbEH2n7Ftdg9vZUfqBXW8HqSQQjrOfdcRR3fliYNQSi6Zg3gcE
	he/v8BrgYU+6Ka2zuysimDvV8t/PQvRi32gWNLTzAfqv+YjyvDr0Lf5gTQktNkSXBoW0cWbR2RvVx
	LLpiV0SYIwPbyUdmrmkaTGcXySehBYrV8fVKdTceMQLSNVG/Qhv1w0/xIGgO3zQLstK/ZRUNIbZ7A
	MgSw3awMZAxGx5XYkdrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62xr-00000002wrA-2XTE;
	Mon, 14 Sep 2026 09:27:03 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62xn-00000002wny-2KI8
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 09:27:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789378018; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=LEtjDojkW0StONXmozHIm/bJ7xi86aarazNel8UTP5g=;
	b=LHt4O1QsC2b/10u+LhnwEZyR6Uyo4IdKotw28c6E8PTzpYfV2TP+d4kVTb434ueAg02MWz44gK8ucC9fHcjmRmJeFqPpQ2hA7Pu9wLngassgNLctEi2c0niKszXC0E5Ng7EZEqvL5GhFs5POROjvGMf+fOMZ9XS1ltJsSNGQvFo=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R791e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=34;SR=0;TI=SMTPD_---0XAuO-n8_1789378014;
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0XAuO-n8_1789378014 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 14 Sep 2026 17:26:56 +0800
From: Shuai Xue <xueshuai@linux.alibaba.com>
To: palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	oleg@redhat.com,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	jpoimboe@kernel.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	joe.lawrence@redhat.com,
	shuah@kernel.org,
	mpdesouza@suse.com,
	oliver.yang@linux.alibaba.com,
	zhuo.song@linux.alibaba.com,
	xueshuai@linux.alibaba.com,
	jkchen@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v6 2/7] riscv: stacktrace: disable KASAN and KCOV instrumentation for stacktrace.o
Date: Mon, 14 Sep 2026 17:26:43 +0800
Message-Id: <20260914092648.51254-3-xueshuai@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260914092648.51254-1-xueshuai@linux.alibaba.com>
References: <20260914092648.51254-1-xueshuai@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_022659_760346_4FAC6A69 
X-CRM114-Status: UNSURE (   6.37  )
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

From: Wang Han <wanghan@linux.alibaba.com>

KASAN records stack traces for every alloc/free, which means it walks
the unwinder very frequently. Instrumenting the stack trace collection
code itself adds substantial overhead and makes the traces themselves
noisier.

KCOV instruments every basic-block edge. The unwinder is a hot path,
especially with KASAN enabled, so KCOV instrumentation has the same kind
of cost and noise problem here.

Mark stacktrace.o as not KASAN- or KCOV-instrumented, matching the x86
treatment of its stack unwinding code. RISC-V keeps the relevant unwinder
code in stacktrace.o, so a single translation-unit annotation covers the
equivalent scope. This is a prerequisite preference for the upcoming
reliable unwinder, but the change is valid on its own.

Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
Assisted-by: Qoder:Qwen-3.8-MAX-Preview
Signed-off-by: Wang Han <wanghan@linux.alibaba.com>
Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
---
 arch/riscv/kernel/Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index ebe1c3588177b..bf4645bb52403 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -44,6 +44,12 @@ CFLAGS_REMOVE_return_address.o	= $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_sbi_ecall.o = $(CC_FLAGS_FTRACE)
 endif
 
+# When KASAN is enabled, a stack trace is recorded for every alloc/free, which
+# can significantly impact performance. Avoid instrumenting the stack trace
+# collection code to minimize this impact.
+KASAN_SANITIZE_stacktrace.o := n
+KCOV_INSTRUMENT_stacktrace.o := n
+
 always-$(KBUILD_BUILTIN) += vmlinux.lds
 
 obj-y	+= head.o
-- 
2.39.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
