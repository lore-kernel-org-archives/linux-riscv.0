Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6895DCD5BD5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 May 2026 12:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qt1Xq67fPNw26QpX92xHkvrR8k74jZyWLSwgXi0BHU0=; b=quT01imIKe4w1R
	D8RqNOwzHFZrY//uN43khbN4BRkL6O65iW2DCOASrRj3DrKQtmWP9JhGkBGhl57BSu1t2C4Cwp5MH
	5tuESFDYwe4io/pp/Ms+t2P3nfTXbeaeIHHqwayCtLmEZKhk+0w/yeDw6mJbI7AMbOPSY9/oaBj2x
	L6agFG5Wu8pi2yMdHS5ZId9urNL8XHTiJa47HzqcYUHstncdu3IOvxJuQdNv8PhsrZ175WXtyrVnc
	5izvmtEote52vA2PvbqsjOOUgF4YNMRSkjhNdakbmJ0+6cRt7R4KMVq6UjkH+shHCknALxYu+0JB2
	IPVN/QKCQY7FbhcxQuHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDUL-000000046Gp-0cut;
	Wed, 27 May 2026 12:35:57 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDUH-000000046Df-01RZ
	for linux-riscv@lists.infradead.org;
	Wed, 27 May 2026 12:35:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1779885350; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=maEd3fP452xbwDQt8y5z93ErC5Xch2tj81t6Keb7XOE=;
	b=VydlyXKprs9fQhvdQcr+yF9QcvkAoBvSKiA8txAcNiJtUqLRz3rf80TwGZT9H3YTV75FpoyvC1mI0H4dZ1fumXoaddw+didmHuvXc85CJAuQGdq9+8jrNYuJNVMl6XnvI0H/fxxJmvACS3p9n7BLySiTAhtkpAo5HOWc05Q1z28=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=wanghan@linux.alibaba.com;NM=1;PH=DS;RN=30;SR=0;TI=SMTPD_---0X3jh1Eu_1779885346;
Received: from wanghan-Workstation..(mailfrom:wanghan@linux.alibaba.com fp:SMTPD_---0X3jh1Eu_1779885346 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 27 May 2026 20:35:47 +0800
From: Wang Han <wanghan@linux.alibaba.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chen Pei <cp0613@linux.alibaba.com>,
	Andy Chiu <andybnac@gmail.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 8/8] selftests/livepatch: Add RISC-V syscall wrapper prefix
Date: Wed, 27 May 2026 20:35:30 +0800
Message-ID: <20260527123530.2593918-9-wanghan@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527123530.2593918-1-wanghan@linux.alibaba.com>
References: <20260527123530.2593918-1-wanghan@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_053553_212035_5C7EF64A 
X-CRM114-Status: UNSURE (   8.37  )
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

Signed-off-by: Wang Han <wanghan@linux.alibaba.com>
---
 .../testing/selftests/livepatch/test_modules/test_klp_syscall.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c b/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
index dd802783ea84..275e4b10cf59 100644
--- a/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
+++ b/tools/testing/selftests/livepatch/test_modules/test_klp_syscall.c
@@ -18,6 +18,8 @@
 #define FN_PREFIX __s390x_
 #elif defined(__aarch64__)
 #define FN_PREFIX __arm64_
+#elif defined(__riscv)
+#define FN_PREFIX __riscv_
 #else
 /* powerpc does not select ARCH_HAS_SYSCALL_WRAPPER */
 #define FN_PREFIX
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
