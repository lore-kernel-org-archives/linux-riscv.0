Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F3CCD8CAE
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 06:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sq892R9RCiZd9mSHWMuw5SDbwqfJP/1EFahKXMjpuOc=; b=DSWaCBk+i2BXbQ
	5MqL94aTMI6SX2BHZNNenphY7e3SSoPOHbF/NT8jN+uqFBN8ccNHkLJyr5vnAdyLdBq8b7V/iAWZF
	0gG+6GWEU9r05LpD05ODFxiNrkEPcRtc9RC2giS6K31btLGSogSAe3Ng+UQgYfIanWdXQbHtoe93o
	AgWVzuAvTmApFMpWgtCpDaFX4Ff2gF+wMtIy4Q5vbdHQ3Ysjt0FBmF0mZKo6Q+JZi7o3UVdeaTR0z
	JL2n9OxP1p4gw2pIUAEr/Vp408OmEAdC7+NCegD04G3kaCva/qk51tA5zVqqWylWPmM5xyJ75JKx3
	CSooQni17mkJXiSvQlnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpyf-00000004rsv-3qJh;
	Tue, 09 Jun 2026 06:30:21 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWpya-00000004rqP-3AR3
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 06:30:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780986610; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=HpStn/XduJk643BaG0YuGp2vRPrkHMDLODvCJ+7Dmc8=;
	b=CWFFjmkQ4/7movyFgrVe+9KLfYS6+e1WT6w95TdFJHzxQmpllkZD2BW4PCsxfveIKrFs0SyXEjUOwbVSIUAQPl7bs8wolI9iOuqfP0AcYHj9nDZWaKCnt4D9N4/LbI4gMfDqVDJpyhEp4+i8jr4AMQ/jSGEjPHNF8+nuQ31F5rM=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=wanghan@linux.alibaba.com;NM=1;PH=DS;RN=34;SR=0;TI=SMTPD_---0X4VD5-U_1780986601;
Received: from wanghan-Workstation..(mailfrom:wanghan@linux.alibaba.com fp:SMTPD_---0X4VD5-U_1780986601 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 09 Jun 2026 14:30:03 +0800
From: Wang Han <wanghan@linux.alibaba.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
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
	oliver.yang@linux.alibaba.com,
	xueshuai@linux.alibaba.com,
	zhuo.song@linux.alibaba.com,
	jkchen@linux.alibaba.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH v3 1/8] scripts/sorttable: Handle RISC-V patchable ftrace entries
Date: Tue,  9 Jun 2026 14:29:52 +0800
Message-ID: <20260609063002.3943001-1-wanghan@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.194d76e3a15b.v3.riscv-livepatch.wanghan@linux.alibaba.com>
References: <20260528082310.1994388-1-wanghan@linux.alibaba.com> <cover.194d76e3a15b.v3.riscv-livepatch.wanghan@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_233017_175794_70CBB127 
X-CRM114-Status: GOOD (  14.76  )
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
Suggested-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Reviewed-by: Steven Rostedt <rostedt@goodmis.org>
Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
Reviewed-by: Chen Pei <cp0613@linux.alibaba.com>
Link: https://lore.kernel.org/all/20260527113028.4b21a5de@fedora/
Signed-off-by: Wang Han <wanghan@linux.alibaba.com>
---
 scripts/sorttable.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/scripts/sorttable.c b/scripts/sorttable.c
index e8ed11c680c6..d8dc2a1b7c31 100644
--- a/scripts/sorttable.c
+++ b/scripts/sorttable.c
@@ -891,17 +891,22 @@ static int do_file(char const *const fname, void *addr)
 	table_sort_t custom_sort = NULL;
 
 	switch (elf_map_machine(ehdr)) {
-	case EM_AARCH64:
 #ifdef MCOUNT_SORT_ENABLED
+	case EM_AARCH64:
+		/* arm64 also needs RELA-based weak-function fixups. */
 		sort_reloc = true;
 		rela_type = 0x403;
-		/* arm64 uses patchable function entry placing before function */
+		/* fallthrough */
+	case EM_RISCV:
+		/* arm64 and RISC-V place patchable entries before the function. */
 		before_func = 8;
+#else
+	case EM_AARCH64:
+	case EM_RISCV:
 #endif
 		/* fallthrough */
 	case EM_386:
 	case EM_LOONGARCH:
-	case EM_RISCV:
 	case EM_S390:
 	case EM_X86_64:
 		custom_sort = sort_relative_table_with_data;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
