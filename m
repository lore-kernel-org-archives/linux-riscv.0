Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87200CD6E41
	for <linux-riscv@archiver.kernel.org>; Wed, 27 May 2026 12:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LUEcedsaEQMlA2ODsGRlxs6mVR/FkoLIaK0GiPaW814=; b=L6thFqDP8hN7KR
	ya50JOOKN7i9toNLmKdO5b12ICFdbe+sUq7J8UgS/xxmQZiGqI9/BfWJf6H3I1PbCcJpt8EjWKJrF
	s+QzRXAiVgkImTmg2u0rONDcLEA70Omc0oO0Z/n1CZqsbytE3W6/oHu1F3YJgBfWJ9kZYrYyKWCcT
	QnqjnIN8C5t6PnkwijBY4ixrOl2opiYy0qemgcKy2WKspm830LqZIICBSwPQqEj1M0eMSBiSZIzLD
	5MxUweVl0k12wonz7daYuYW601SYh+kkXHx7faN7QPEmw3OVldCDsx6Y/cjFT0RLzE+tKf09E6mwc
	gwnJtqHWrhCO02KnvTCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDUA-000000046Az-0XUS;
	Wed, 27 May 2026 12:35:46 +0000
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDU6-0000000469T-10xI
	for linux-riscv@lists.infradead.org;
	Wed, 27 May 2026 12:35:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1779885339; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=Zpi+hBQSRQyziQ4dlT38MsXVu/GjD/Q4OPV9k9v34nc=;
	b=iC8Bd1k79Zr0GlgK10mLY/2xr+HEH/3Zk7Ebru0j+YAN2W1Ev3z9e0MF76tjksospiiCbyhD8bSvFLPyLtvjQkhVj060zq0uabQL6MUmSNR5Fo31l+6r1IYb6y7wAO9SHhLNGG1TWfvzggl3/L+FoBEu9vWJ5lxMTayopgcduUA=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R191e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=wanghan@linux.alibaba.com;NM=1;PH=DS;RN=30;SR=0;TI=SMTPD_---0X3jh1AO_1779885333;
Received: from wanghan-Workstation..(mailfrom:wanghan@linux.alibaba.com fp:SMTPD_---0X3jh1AO_1779885333 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 27 May 2026 20:35:34 +0800
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
Subject: [PATCH 1/8] scripts/sorttable: Handle RISC-V patchable ftrace entries
Date: Wed, 27 May 2026 20:35:23 +0800
Message-ID: <20260527123530.2593918-2-wanghan@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527123530.2593918-1-wanghan@linux.alibaba.com>
References: <20260527123530.2593918-1-wanghan@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_053542_967606_FABE034A 
X-CRM114-Status: GOOD (  14.05  )
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

RISC-V uses -fpatchable-function-entry=8,4 when the compressed ISA is
enabled and -fpatchable-function-entry=4,2 otherwise. In both cases, the
patchable NOP area starts 8 bytes before the function symbol address.
The __mcount_loc entries therefore point at the patchable NOP area
associated with a function, while nm reports the function symbol at the
entry address used for the function range check.

After RISC-V selected HAVE_BUILDTIME_MCOUNT_SORT, sorttable started
applying that range check at build time. Without allowing entries just
before the reported function address, the mcount sorter treats valid
RISC-V ftrace callsites as invalid weak-function entries and writes
them back as zero. The resulting kernel boots with no ftrace entries,
breaking dynamic ftrace and users such as livepatch.

The failure is silent during the final link because zeroing weak-function
entries is an expected sorttable operation. At boot, those zero entries
are skipped by ftrace_process_locs(), so the only obvious symptom is that
the vmlinux ftrace table has lost valid callsites and ftrace users cannot
attach to them.

CONFIG_FTRACE_SORT_STARTUP_TEST also reports the table as sorted in this
state: it only checks that the __mcount_loc entries are in ascending
order, which a fully zeroed table trivially satisfies. The original
commit relied on this check and did not see the regression.

On an affected RISC-V QEMU boot with both CONFIG_FTRACE_SORT_STARTUP_TEST
and CONFIG_FTRACE_STARTUP_TEST enabled, the sort check still passes
while ftrace reports zero usable entries and the early selftests fail:

  [    0.000000] ftrace section at ffffffff8101da98 sorted properly
  [    0.000000] ftrace: allocating 0 entries in 128 pages
  [    0.054999] Testing tracer function: .. no entries found ..FAILED!
  [    0.172407] tracer: function failed selftest, disabling
  [    0.178186] Failed to init function_graph tracer, init returned -19

Handle RISC-V like arm64 for the function-range check and allow
patchable entries up to 8 bytes before the function address.

With this fix, a RISC-V QEMU smoke boot with ftrace startup tests shows
the vmlinux ftrace table is populated and dynamic ftrace still works:

  [    0.000000] ftrace: allocating 46749 entries in 184 pages
  [    0.051115] Testing tracer function: PASSED
  [    1.283782] Testing dynamic ftrace: PASSED
  [    6.275456] Testing tracer function_graph: PASSED

Fixes: 0ca1724b56af ("riscv: ftrace: select HAVE_BUILDTIME_MCOUNT_SORT")

Signed-off-by: Wang Han <wanghan@linux.alibaba.com>
---
 scripts/sorttable.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index e8ed11c680c6..b4061c2c03e1 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -901,11 +901,17 @@ static int do_file(char const *const fname, void *addr)
 		/* fallthrough */
 	case EM_386:
 	case EM_LOONGARCH:
-	case EM_RISCV:
 	case EM_S390:
 	case EM_X86_64:
 		custom_sort = sort_relative_table_with_data;
 		break;
+	case EM_RISCV:
+#ifdef MCOUNT_SORT_ENABLED
+		/* RISC-V uses patchable function entries before function entry. */
+		before_func = 8;
+#endif
+		custom_sort = sort_relative_table_with_data;
+		break;
 	case EM_PARISC:
 	case EM_PPC:
 	case EM_PPC64:
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
