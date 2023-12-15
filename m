Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA026C41535
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 09:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Subject:Cc:To:
	From:Date:Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=CO+jOs1SeZl81y2DrLd31NVvnew+0GrAmSc5OaUlgxI=; b=GqKqjRc0n2211L
	ZiXAG2ngePJfdIzhwdgG1xUZGrRtMuOfJRzLoCgJ9UG7BZOQY115qjlzbhxNk3/4/DspXKWjP4A93
	zikUPdl6sybDfF2xD3pD3FJdTpoBelvv0G7yO5lcYDjtXEJDAdFEb0NSzZ/rwfhWLusbNas8+vX4D
	XXr85c56JkHMSqesATd2hZmQvCqkcKu+VwXEZR21NtYWU1xbkJRK825Buc7KZ8OT06L3qZ+RF/Mgk
	xqVnkC3PI8TSPczRff1JXAUnzeCNxPgxkMYicH3vM7dTeqViQXjvmBquZXYJRCjKS0SfcpYvAs9Fg
	tjI+MYkMjf54dliU9F1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE4ZU-002daq-1e;
	Fri, 15 Dec 2023 09:33:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE4ZO-002dYl-2L
	for linux-riscv@bombadil.infradead.org;
	Fri, 15 Dec 2023 09:33:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-Id:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=cG37Lky4vNGjI+/dn78V8dged+rcVq6oxgHwY0WVgrM=; b=HnOlO/cKUyALtWFkVS+r+9xPPj
	W8PtzBF/Ag2XAodU9cpkAPlJOKG6sCB7AjvimCTrEb5e15JI6mbhdhAuLXKjD4qhF67REnTRkcT5R
	Q9F9ePvPqYS8n6SN/4cevBgqVZ0Sct1sdx5cs2oMDt6nEZLZlkzQ/Monzno8X29cLfBZhkWyB/OKW
	S4Ywj+Bu2R6eV5V9m0DrxorpYikjPcmvTjIgwrJqLxZBLVz1t2BziAQ5XgunVD/XEU7gGG20fFUPk
	eOYHdeaPSr2R1cqz/Gsr8qy5oAKCQpncNzmQuBU0ZaX4w6tudaj+eth8AK45GC4Snht/g5h+uQpB2
	Ex/lSrZw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rE4ZF-009rG2-0y;
	Fri, 15 Dec 2023 09:33:14 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id EB92A3006F6; Fri, 15 Dec 2023 10:33:11 +0100 (CET)
Message-Id: <20231215092707.910319166@infradead.org>
User-Agent: quilt/0.65
Date: Fri, 15 Dec 2023 10:12:23 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: paul.walmsley@sifive.com,
 palmer@dabbelt.com,
 aou@eecs.berkeley.edu,
 tglx@linutronix.de,
 mingo@redhat.com,
 bp@alien8.de,
 dave.hansen@linux.intel.com,
 x86@kernel.org,
 hpa@zytor.com,
 davem@davemloft.net,
 dsahern@kernel.org,
 daniel@iogearbox.net,
 andrii@kernel.org,
 martin.lau@linux.dev,
 song@kernel.org,
 yonghong.song@linux.dev,
 john.fastabend@gmail.com,
 kpsingh@kernel.org,
 sdf@google.com,
 haoluo@google.com,
 jolsa@kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 samitolvanen@google.com,
 keescook@chromium.org,
 nathan@kernel.org,
 ndesaulniers@google.com,
 linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org,
 bpf@vger.kernel.org,
 linux-arch@vger.kernel.org,
 llvm@lists.linux.dev,
 jpoimboe@kernel.org,
 joao@overdrivepizza.com,
 mark.rutland@arm.com,
 peterz@infradead.org
Subject: [PATCH v3 7/7] x86/cfi,bpf: Fix bpf_exception_cb() signature
References: <20231215091216.135791411@infradead.org>
MIME-Version: 1.0
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

From: Alexei Starovoitov <alexei.starovoitov@gmail.com>

As per the earlier patches, BPF sub-programs have bpf_callback_t
signature and CFI expects callers to have matching signature. This is
violated by bpf_prog_aux::bpf_exception_cb().

[peterz: Changelog]
Reported-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Link: https://lkml.kernel.org/r/CAADnVQ+Z7UcXXBBhMubhcMM=R-dExk-uHtfOLtoLxQ1XxEpqEA@mail.gmail.com
---
 include/linux/bpf.h  |    2 +-
 kernel/bpf/helpers.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -1484,7 +1484,7 @@ struct bpf_prog_aux {
 	int cgroup_atype; /* enum cgroup_bpf_attach_type */
 	struct bpf_map *cgroup_storage[MAX_BPF_CGROUP_STORAGE_TYPE];
 	char name[BPF_OBJ_NAME_LEN];
-	unsigned int (*bpf_exception_cb)(u64 cookie, u64 sp, u64 bp);
+	u64 (*bpf_exception_cb)(u64 cookie, u64 sp, u64 bp, u64, u64);
 #ifdef CONFIG_SECURITY
 	void *security;
 #endif
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -2537,7 +2537,7 @@ __bpf_kfunc void bpf_throw(u64 cookie)
 	 * which skips compiler generated instrumentation to do the same.
 	 */
 	kasan_unpoison_task_stack_below((void *)(long)ctx.sp);
-	ctx.aux->bpf_exception_cb(cookie, ctx.sp, ctx.bp);
+	ctx.aux->bpf_exception_cb(cookie, ctx.sp, ctx.bp, 0, 0);
 	WARN(1, "A call to BPF exception callback should never return\n");
 }
 



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
