Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FAFC02189
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 18:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lhuBSbcuW2bme34IX8xy4J4FR7gMwwkgjrMj+X0sGyE=; b=idJGiPjzunGTE+
	eMGx5AMXMgX89uR2ZX3x8jRIYROUujnM58StxSDJ07GxOqo5Z/+/voIdurZRIAicnqG2ds/VBGzRa
	CnpJwbLP5qgdfaGvJCfj9VWN44oopU3F/rVAO9sdSMlV9MEl9MVF7FMK1LEScRARQXEZD5mKJjL4Z
	7/xZaeotzHaa252K4L5fDJ2wvJRH77Gpl1z+0ddvMzGwPR37ljkAypNgC8Fv5wID58WZ5UM4eyzG9
	CKwFyGtZpECkK0NL4FfJNkYXO7iAxR4+N7SQ6FRtI+6KvDVRXCewIlHXZ2oxUT82JSMnk/P9iUyHh
	+V0LJT9UA5c0exJ2c6eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlI6-00000009L2Z-155Z;
	Tue, 14 Jan 2025 18:05:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlF8-00000009JRG-0Er8
	for linux-riscv@bombadil.infradead.org;
	Tue, 14 Jan 2025 18:02:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cNwCh5fgGoJuTFO9fvGqFny78uJkIQRICFisC3zeCIo=; b=RCZysYUi/KCK+CxesKnTJd0YRq
	LiMrHHw8JvZitHJFt8MhbJvzFRkR29VN/eM2aB5htwqehNM1VHF39CA+dxQd3M8Gw5npDQnLvpxEE
	nH4OJ9hrK6ua+3qN1axHXkP5GtsCEXGyc91hB0LXYJKgX8Tr2q2Du5oromZ+7P/ISEz6AM71K8hDb
	cJd4cJHBqpH+Hf9jj8/ODKVFkx5u2mJdSY9OflQCTlZLYu/7CQ7WcfWmNrh6xxIkXLu5gxMaQgQDp
	E9Ej/WtOGxUD2W68NtA6An9J/8xfv+r3UyB0snCLP7zNBIWam+yPExG346T/AioSb2ZXq4Ww1U/sB
	b/F7RBsQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlF4-0000000AVtZ-1IRK
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 18:02:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736877737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cNwCh5fgGoJuTFO9fvGqFny78uJkIQRICFisC3zeCIo=;
	b=fW+8XWiKsFfXjWdAQyVsjzvxLrJvFAqM4URsE7UdU0FUBiELgWU99qgItTBUAQCdaCjnjo
	Q47tmqrc7IK6mT9KGzEIwOWTgl9AgFLwWU5hGtgrS7jIKQuvW4mx6jo2H/UzANUIHm7HXo
	pjzUrcPEyV9QtENB4KTkizgNl+NMvPc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736877737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cNwCh5fgGoJuTFO9fvGqFny78uJkIQRICFisC3zeCIo=;
	b=fW+8XWiKsFfXjWdAQyVsjzvxLrJvFAqM4URsE7UdU0FUBiELgWU99qgItTBUAQCdaCjnjo
	Q47tmqrc7IK6mT9KGzEIwOWTgl9AgFLwWU5hGtgrS7jIKQuvW4mx6jo2H/UzANUIHm7HXo
	pjzUrcPEyV9QtENB4KTkizgNl+NMvPc=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-230-RjarLQpsMFScdKhdOdyibw-1; Tue,
 14 Jan 2025 13:02:13 -0500
X-MC-Unique: RjarLQpsMFScdKhdOdyibw-1
X-Mimecast-MFC-AGG-ID: RjarLQpsMFScdKhdOdyibw
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E0C941955DBA;
	Tue, 14 Jan 2025 18:02:08 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.39.192.55])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 61C7C195608A;
	Tue, 14 Jan 2025 18:01:46 +0000 (UTC)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	virtualization@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	kvm@vger.kernel.org,
	linux-arch@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org,
	bcm-kernel-feedback-list@broadcom.com
Cc: Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joel@joelfernandes.org>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang1211@gmail.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Tomas Glozar <tglozar@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Christoph Hellwig <hch@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Rong Xu <xur@google.com>,
	Nicolas Saenz Julienne <nsaenzju@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	Jinghao Jia <jinghao7@illinois.edu>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Subject: [PATCH v4 22/30] context_tracking: Exit CT_STATE_IDLE upon irq/nmi entry
Date: Tue, 14 Jan 2025 18:51:35 +0100
Message-ID: <20250114175143.81438-23-vschneid@redhat.com>
In-Reply-To: <20250114175143.81438-1-vschneid@redhat.com>
References: <20250114175143.81438-1-vschneid@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_180218_520920_E253AB01 
X-CRM114-Status: GOOD (  18.59  )
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

ct_nmi_{enter, exit}() only touches the RCU watching counter and doesn't
modify the actual CT state part context_tracking.state. This means that
upon receiving an IRQ when idle, the CT_STATE_IDLE->CT_STATE_KERNEL
transition only happens in ct_idle_exit().

One can note that ct_nmi_enter() can only ever be entered with the CT state
as either CT_STATE_KERNEL or CT_STATE_IDLE, as an IRQ/NMI happenning in the
CT_STATE_USER or CT_STATE_GUEST states will be routed down to ct_user_exit().

Add/remove CT_STATE_IDLE from the context tracking state as needed in
ct_nmi_{enter, exit}().

Note that this leaves the following window where the CPU is executing code
in kernelspace, but the context tracking state is CT_STATE_IDLE:

  ~> IRQ
  ct_nmi_enter()
    state = state + CT_STATE_KERNEL - CT_STATE_IDLE

  [...]

  ct_nmi_exit()
    state = state - CT_STATE_KERNEL + CT_STATE_IDLE

  [...] /!\ CT_STATE_IDLE here while we're really in kernelspace! /!\

  ct_cpuidle_exit()
    state = state + CT_STATE_KERNEL - CT_STATE_IDLE

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 kernel/context_tracking.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/kernel/context_tracking.c b/kernel/context_tracking.c
index a61498a8425e2..15f10ddec8cbe 100644
--- a/kernel/context_tracking.c
+++ b/kernel/context_tracking.c
@@ -236,7 +236,9 @@ void noinstr ct_nmi_exit(void)
 	instrumentation_end();
 
 	// RCU is watching here ...
-	ct_kernel_exit_state(CT_RCU_WATCHING);
+	ct_kernel_exit_state(CT_RCU_WATCHING -
+			     CT_STATE_KERNEL +
+			     CT_STATE_IDLE);
 	// ... but is no longer watching here.
 
 	if (!in_nmi())
@@ -259,6 +261,7 @@ void noinstr ct_nmi_enter(void)
 {
 	long incby = 2;
 	struct context_tracking *ct = this_cpu_ptr(&context_tracking);
+	int curr_state;
 
 	/* Complain about underflow. */
 	WARN_ON_ONCE(ct_nmi_nesting() < 0);
@@ -271,13 +274,26 @@ void noinstr ct_nmi_enter(void)
 	 * to be in the outermost NMI handler that interrupted an RCU-idle
 	 * period (observation due to Andy Lutomirski).
 	 */
-	if (!rcu_is_watching_curr_cpu()) {
+	curr_state = raw_atomic_read(this_cpu_ptr(&context_tracking.state));
+	if (!(curr_state & CT_RCU_WATCHING)) {
 
 		if (!in_nmi())
 			rcu_task_enter();
 
+		/*
+		 * RCU isn't watching, so we're one of
+		 * CT_STATE_IDLE
+		 * CT_STATE_USER
+		 * CT_STATE_GUEST
+		 * guest/user entry is handled by ct_user_enter(), so this has
+		 * to be idle entry.
+		 */
+		WARN_ON_ONCE((curr_state & CT_STATE_MASK) != CT_STATE_IDLE);
+
 		// RCU is not watching here ...
-		ct_kernel_enter_state(CT_RCU_WATCHING);
+		ct_kernel_enter_state(CT_RCU_WATCHING +
+				      CT_STATE_KERNEL -
+				      CT_STATE_IDLE);
 		// ... but is watching here.
 
 		instrumentation_begin();
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
