Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B514CD6E48
	for <linux-riscv@archiver.kernel.org>; Wed, 27 May 2026 12:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ky+iXB8LfYf2/AGEnEXmStb9ezt2ip83Gjh+oMDtV2s=; b=bRbxAB1biEpfqj
	LG7yMLfqBFN9fNuWXTrbeh31O2luj5LVgbcKXogov/Cl2X8i5IVQ29R+EtisOFZxerVvFHgz/GnML
	VJLnaYiXixRN0/Kh4vovn2KMBXbiA8SuJ6L83MWkOdera5ow5hUH9lokdbhAQmuOcZ9KOrY+/x6u7
	rga5kBDlD204nJsMyhWbASdGm6oL6RFb/rjivHyHr2HsYrQRsrjD4gCO1OGz00WcI9gf3avdD25K2
	AEMmrUCClajwtfwnjUFMoVux2JM712Huh/X3sR3EUn028jJ2zHC/xa6XoUgtpHZPxrVyznmyRfW3j
	4dW+d3Q+AyNCAWtOhm5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDUD-000000046CN-1SU8;
	Wed, 27 May 2026 12:35:49 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDU7-0000000469V-3msu
	for linux-riscv@lists.infradead.org;
	Wed, 27 May 2026 12:35:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1779885341; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=dFsF/ziPOhr0CBkiF/x1YP/U5oNUfemZVFd5fy2/IJ4=;
	b=o4phwAmRJ2AL7GCJDxFUtNFzDs5daFnNqazCt8lDCDTrACbsMxrT51hULKcX+3KPM9cglEdMu/E6Sgc5iwMtZwPftxF7HCSnj7lXrvSUR/7O7Fj4yI02PJKtEfoJCh0VAP0tGLlhBkwYR7Q8a/i6+ZmUG0TW+XxnRsb+NPYbcx8=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=wanghan@linux.alibaba.com;NM=1;PH=DS;RN=30;SR=0;TI=SMTPD_---0X3jh1BW_1779885336;
Received: from wanghan-Workstation..(mailfrom:wanghan@linux.alibaba.com fp:SMTPD_---0X3jh1BW_1779885336 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 27 May 2026 20:35:38 +0800
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
Subject: [PATCH 3/8] riscv: stacktrace: disable KASAN instrumentation for stacktrace.o
Date: Wed, 27 May 2026 20:35:25 +0800
Message-ID: <20260527123530.2593918-4-wanghan@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527123530.2593918-1-wanghan@linux.alibaba.com>
References: <20260527123530.2593918-1-wanghan@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_053544_803421_B7914DE7 
X-CRM114-Status: UNSURE (   8.07  )
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

KASAN records stack traces for every alloc/free, which means it walks
the unwinder very frequently. Instrumenting the stack trace collection
code itself adds substantial overhead and makes the traces themselves
noisier.

Mark stacktrace.o as not KASAN-instrumented, matching the arm, arm64
and x86 treatment of their stack unwinding code. This is a prerequisite
preference for the upcoming reliable unwinder, but the change is valid
on its own.

Signed-off-by: Wang Han <wanghan@linux.alibaba.com>
---
 arch/riscv/kernel/Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index cabb99cadfb6..1cb6c9ab2981 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -44,6 +44,11 @@ CFLAGS_REMOVE_return_address.o	= $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_sbi_ecall.o = $(CC_FLAGS_FTRACE)
 endif
 
+# When KASAN is enabled, a stack trace is recorded for every alloc/free, which
+# can significantly impact performance. Avoid instrumenting the stack trace
+# collection code to minimize this impact.
+KASAN_SANITIZE_stacktrace.o := n
+
 always-$(KBUILD_BUILTIN) += vmlinux.lds
 
 obj-y	+= head.o
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
