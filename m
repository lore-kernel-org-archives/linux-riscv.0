Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E848606A32C
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Nov 2026 09:18:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gXuQbkxG;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=baidu.com header.i=@baidu.com header.a=rsa-sha256 header.s=selector1 header.b=QaGTAqh5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ngHIuJyvK4esftPE479SDYv00tsWAoQ/FByI95CoGL4=; b=gXuQbkxGtMmaVniobCIo3DBlbx
	geE/eizCW0tb/t5RNbv8VFJbHDU4RqDXdtav4JIngnGnOc3c15yFdqSZBrqcODQJMqGbAbqZC8aKn
	j4E2b4+qTBxssYixBliJiHsmvwhZcw3Oe4SFhQo9WcbaNWppEMUmwsetUD0rwq960y4PyaErkusNh
	YMqK3B2a+Mg5TsFIAxGM+2zgjMSNVD3i/cD6wqhjjLA2TsY7GuOZqewrM7L7EMXvJyw0Dgpwd1Ywn
	VXkDX9JhdrIFuH1Mz6E9j4IDnkgD9HQSpbwcwLHGfti4Mc5FnTllSnRX4jxjKeoMi7u7ogRPO8lAP
	VY2G0FFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoBa-0000000Fyez-3Dis;
	Mon, 02 Nov 2026 09:18:38 +0000
Received: from mx24.baidu.com ([111.206.215.185] helo=outbound.baidu.com)
	by bombadil.infradead.org with smtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNoBV-0000000Fye3-0QZC
	for linux-riscv@lists.infradead.org;
	Mon, 02 Nov 2026 09:18:37 +0000
X-MD-Sfrom: lirongqing@baidu.com
X-MD-SrcIP: 172.31.50.47
From: lirongqing <lirongqing@baidu.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim
	<namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Alexander
 Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Li RongQing <lirongqing@baidu.com>, Atish Patra
	<atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>, Shenlin Liang
	<liangshenlin@eswincomputing.com>, <linux-perf-users@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH] perf kvm: Fix RISC-V VM-exit duration accounting
Date: Mon, 2 Nov 2026 17:18:09 +0800
Message-ID: <20261102091809.2215-1-lirongqing@baidu.com>
X-Mailer: git-send-email 2.17.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: bjkjy-exc6.internal.baidu.com (172.31.50.50) To
 bjkjy-exc3.internal.baidu.com (172.31.50.47)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baidu.com;
	s=selector1; t=1793611102;
	bh=XcbRLYGB82m3MgaPiEO3IYAwJ6GpxW8GbWCS3Wtb9Xo=;
	h=From:To:Subject:Date:Message-ID:Content-Type;
	b=QaGTAqh59VJmYEyQkD08q3w0vGj4YFhITfHtYX1uz2jXSYjtggLmQ+KD3uH09wDlH
	 R/Ym+pWCCUyLabnZ4ex5LpqBitWIyM8AvxLaS53KXd/eK/eihx+vIER57blefyObCL
	 cq7g96xqj91yO4wudC6Xi9KyRMwxGrkhkYftCjCTYbtAFnbUqq09aRoL+BTb9XaQhm
	 cQpY07863XfCjI2ZwAIDz5/TL+y5TxcyEbU72e+s1n7rPOlTwM2jChrHOqL/0UJ3m9
	 Qo/lvS/cvATyFLomyQnKtrqYBmGeKiVNXojCp6kP/NrR7t7fiD29lirNBkmatr9nPs
	 9lcVzgrRBnj8g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_011835_869726_12CCF0EE 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Li RongQing <lirongqing@baidu.com>

Use kvm_exit as the start event and the following kvm_entry as the
end event for RISC-V VM-exit statistics. Keep decoding scause from
the exit sample.

Before this change, RISC-V measured guest runtime as VM-exit time.

Fixes: da7b1b525e97 ("perf kvm/riscv: Port perf kvm stat to RISC-V")
Signed-off-by: Li RongQing <lirongqing@baidu.com>
---
 tools/perf/util/kvm-stat-arch/kvm-stat-riscv.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/kvm-stat-arch/kvm-stat-riscv.c b/tools/perf/util/kvm-stat-arch/kvm-stat-riscv.c
index 967bba2..09c9c7d 100644
--- a/tools/perf/util/kvm-stat-arch/kvm-stat-riscv.c
+++ b/tools/perf/util/kvm-stat-arch/kvm-stat-riscv.c
@@ -31,13 +31,7 @@ static void event_get_key(struct perf_sample *sample,
 }
 
 static bool event_begin(struct perf_sample *sample,
-			struct event_key *key __maybe_unused)
-{
-	return evsel__name_is(sample->evsel, kvm_entry_trace(EM_RISCV));
-}
-
-static bool event_end(struct perf_sample *sample,
-		      struct event_key *key)
+			struct event_key *key)
 {
 	if (evsel__name_is(sample->evsel, kvm_exit_trace(EM_RISCV))) {
 		event_get_key(sample, key);
@@ -46,6 +40,12 @@ static bool event_end(struct perf_sample *sample,
 	return false;
 }
 
+static bool event_end(struct perf_sample *sample,
+		      struct event_key *key __maybe_unused)
+{
+	return evsel__name_is(sample->evsel, kvm_entry_trace(EM_RISCV));
+}
+
 static const struct kvm_events_ops exit_events = {
 	.is_begin_event = event_begin,
 	.is_end_event	= event_end,
-- 
2.9.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
