Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F311C60A381A
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 01:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ym9mMq3t;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=NElttxdM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=CPqXpP8bVdnPaD3gCUwwQW2sSOO0RpMjKanq8GEPfmY=; b=Ym9mMq3tPf0TtFZOLQLtd0wvek
	cV8S02IVj0OPVmf7h99TCrlusSPPO1jCEpmQQOg99uiTV3XB45kES/eSkqNYqmgyK/bYM/IsUlR+K
	tLRfmtbGAw0ADZJICd+xJOzbbgiFXOvg2XyjJN7qBGrvXSXeMD8fPmMukst/nlhu7IHVqsprt7JQG
	plq/My8PyxOefYgTjAXmOA3//Bhb26HAfyzGherkEDxsi7W/Dne80ePXIvZwZZnEoxZMndhDdBl1F
	QyNSgsvqH8KVtuDzwyUIXFwSBqUUdmAKOUCL1/T5yV9GBRiYn2iSmvYtCInGl9LBQezG/lDds/MKC
	LxtQ09Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaoR-000000026G9-0zUu;
	Tue, 10 Nov 2026 01:38:15 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQaoI-000000026Ce-0fNz
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 01:38:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1794274684; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=UIO64a3mT9fiK4+NP8JbdHWsQ2JRHiaO8iZSQOj4mJA=;
	b=NElttxdMqo2k8FhGd3BpZWD0XxAYRjElEwOpk+xmP5/eJBEidWLIn5yG+dtzyCO66xDPwx6dF4EqgK1+cw3lRRJ0ahTdXbYuTCRFh1tZB2pg6aH08iuhamUNzlOeMqkv2ctEIIYBriVmj0/Vd3XbYoPA6vdd8dQnRR85XbVYhY8=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R351e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=36;SR=0;TI=SMTPD_---0XETOX39_1794274680;
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0XETOX39_1794274680 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 10 Nov 2026 09:38:02 +0800
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
	martin@kaiser.cx,
	kmehltretter@gmail.com,
	oliver.yang@linux.alibaba.com,
	zhuo.song@linux.alibaba.com,
	xueshuai@linux.alibaba.com,
	jkchen@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v7 03/10] riscv: ftrace: use the frame pointer as the function graph return-address cookie
Date: Tue, 10 Nov 2026 09:37:43 +0800
Message-Id: <20261110013750.36800-4-xueshuai@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261110013750.36800-1-xueshuai@linux.alibaba.com>
References: <20260914092648.51254-1-xueshuai@linux.alibaba.com>
 <20261110013750.36800-1-xueshuai@linux.alibaba.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_173806_380935_28B80FEC 
X-CRM114-Status: GOOD (  12.39  )
X-Spam-Score: -17.6 (-----------------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The function graph tracer stamps every shadow-stack entry with a
cookie, ftrace_ret_stack::retp, which stack unwinders later pass to
ftrace_graph_ret_addr() to recover a return address that the tracer
replaced with return_to_handler.  The match is an exact pointer
comparison, so the producer and the consumer must agree on what the
cookie is.  On riscv they don't:

  * The dynamic ftrace path stores &arch_ftrace_regs(fregs)->ra, a
    slot inside the transient ftrace trampoline frame.  The frame is
    popped as soon as the callback returns, so the stored cookie is
    an address that no consumer can ever reproduce.  It has never
    matched anything since ftrace_graph_func() was introduced in
    v6.8.

  * The frame-pointer walker in walk_stackframe() passes &frame->ra,
    the ra slot of a live frame record.  That key matches the static
    mcount path, which passes the callee's ra-slot address, but not
    the dynamic path.

Since distro kernels only ever use the dynamic path, the net effect
is that the shadow stack is never consulted during unwinding:
whenever the function graph tracer is running, dump_stack(), perf
callchains and __get_wchan() report return_to_handler instead of the
real caller.

Switch the cookie to the architectural frame pointer, i.e. the
caller's frame-pointer value.  Every party can reproduce it from the
frame records themselves:

  * ftrace.c stores (void *)frame_pointer on both entry paths.  At
    ftrace entry the frame pointer is still the caller's, which is
    the value the callee later saves in its frame_record::fp.

  * walk_stackframe() passes that value, frame->fp, to
    ftrace_graph_ret_addr() instead of the ra-slot address.  The
    static mcount path has to switch too: its old cookie (the
    callee's ra-slot address) is exactly what the old walker key
    matched, so leaving it behind would regress the static path.

This is the convention arm64 already uses: (void *)frame_pointer
from ftrace.c, the saved fp from the unwinder.

function_get_true_parent_ip() keeps passing the entry stack pointer
as its key; that key is only reproducible on architectures whose
return address lives at the entry stack pointer (x86).  On riscv,
as on arm64, it keeps falling back to the raw parent ip.

Fixes: 35e61e8827ee8 ("riscv: ftrace: Make function graph use ftrace directly")
Suggested-by: Martin Kaiser <martin@kaiser.cx>
Cc: stable@vger.kernel.org
Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
---
 arch/riscv/kernel/ftrace.c     | 6 ++++--
 arch/riscv/kernel/stacktrace.c | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index be8b68514417..0facd824c911 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -245,7 +245,8 @@ void prepare_ftrace_return(unsigned long *parent, unsigned long self_addr,
 	 */
 	old = *parent;
 
-	if (!function_graph_enter(old, self_addr, frame_pointer, parent))
+	if (!function_graph_enter(old, self_addr, frame_pointer,
+				  (void *)frame_pointer))
 		*parent = return_hooker;
 }
 
@@ -267,7 +268,8 @@ void ftrace_graph_func(unsigned long ip, unsigned long parent_ip,
 	 */
 	old = *parent;
 
-	if (!function_graph_enter_regs(old, ip, frame_pointer, parent, fregs))
+	if (!function_graph_enter_regs(old, ip, frame_pointer,
+				       (void *)frame_pointer, fregs))
 		*parent = return_hooker;
 }
 #endif /* CONFIG_DYNAMIC_FTRACE */
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 28c5744889ba..a5abb705d43b 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -96,8 +96,9 @@ static __always_inline void __walk_stackframe(struct task_struct *task,
 		} else {
 			fp = READ_ONCE_TASK_STACK(task, frame->fp);
 			pc = READ_ONCE_TASK_STACK(task, frame->ra);
+			/* the cookie is the caller's frame pointer */
 			pc = ftrace_graph_ret_addr(task, &graph_idx, pc,
-						   &frame->ra);
+						   (void *)fp);
 			if (pc >= (unsigned long)handle_exception &&
 			    pc < (unsigned long)&ret_from_exception_end) {
 				if (unlikely(!fn(arg, pc)))
-- 
2.39.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
