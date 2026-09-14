Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3833C88E64
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Sep 2026 09:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mA2+jhIb2LAWa536VfA+tniN0o86bVYETNcl9LH2KJ0=; b=cQ5TIduKdgc/W5
	bGaSXNiHXUNIb6yf/Z+ckVgMVA3EvlxbTqrwY5e6eXvTy65gPIm7JBjI8pvTTStekTBxNjU9a+riV
	rSKFIa/FqLq5aBaaU8qYTtiVaYIg/ZexQfJL+zvtFnvXblq6hESzYaFSjTS9pK+boJPMwC/bT1cYC
	SCzYQfrD8weILjvUMREKlsTx6gl34+W6h3ZOWSpCE5snAw17EpfvANeshG469tUXYB6I9McOJcyzb
	3cddEAHDmNA+4Pgrp4T/pbNC/wli9sd97550KGGRsFw0yMMUPy42S+nNJI680Y6s8Gs8ibcj1HK+L
	iB0RNJmV7ANKWVcNfyAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62y4-00000002x0j-3IJT;
	Mon, 14 Sep 2026 09:27:16 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x62xz-00000002wvx-2F49
	for linux-riscv@lists.infradead.org;
	Mon, 14 Sep 2026 09:27:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789378030; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=PEnkvP/MMeE/AyrREVwFeM/SBbfr0Ph1OGEBAs/dnV0=;
	b=w0mlITW2M1K65cmqt+MBPGmvtuwHyx9T+mgAaBSChYXw06KLJ8IjyblTQtbWfFxcS5KdvCExGAivllJxSnKd9urZRKqLzauBlqTYXFBktW+26lLHqRBabBG9KPx6W+9NT0DLPFL1DkKPzBJ719gsV3stqjeBYu5VSiecpPPzWjc=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R961e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=34;SR=0;TI=SMTPD_---0XAuO-qg_1789378027;
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0XAuO-qg_1789378027 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 14 Sep 2026 17:27:08 +0800
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
Subject: [PATCH v6 7/7] selftests/livepatch: Add RISC-V syscall wrapper prefix
Date: Mon, 14 Sep 2026 17:26:48 +0800
Message-Id: <20260914092648.51254-8-xueshuai@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260914092648.51254-1-xueshuai@linux.alibaba.com>
References: <20260914092648.51254-1-xueshuai@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_022713_092104_EED5CCC1 
X-CRM114-Status: UNSURE (   6.27  )
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

The syscall livepatch selftest resolves and patches a syscall wrapper
symbol. To use that test for RISC-V livepatch validation, add the
RISC-V FN_PREFIX definition for ARCH_HAS_SYSCALL_WRAPPER.

Without this macro, the syscall livepatch selftest cannot resolve the
RISC-V target symbol, and the syscall-related livepatch test fails on
RISC-V.

Reviewed-by: Marcos Paulo de Souza <mpdesouza@suse.com>
Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
Acked-by: Miroslav Benes <mbenes@suse.cz>
Assisted-by: Qoder:Qwen-3.8-MAX-Preview
Signed-off-by: Wang Han <wanghan@linux.alibaba.com>
Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
---
 .../testing/selftests/livepatch/test_modules/test_klp_syscall.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c b/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
index 08aacc0e14de9..9baa2a5f84c95 100644
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
2.39.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
