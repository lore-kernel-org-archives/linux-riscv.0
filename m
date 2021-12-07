Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A77C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Dec 2021 18:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DSLUFv069Xr+ljSaP2sW6+2QIwzXZI25WZkR0w232Ng=; b=QD8MzEWzuZU40E
	j+wpWg0/Z4hbBlRRQdPmHSQJ+0CPuYREdkZlLnHzY6RukDpezQXXT7OhNMycrtDFX0EswcmzWOv9+
	g9M02ZM5LdkFwr/9qUJ5aextcBCJzQ47hRYP7lww36dFsb/ifCsRkBpql0BC2QtRBsQAspHXeIAJv
	2wOArszNr6pboYu49vthQ3dYCs/G6SQxw9GE3EzQGFBzXTCcMh1t1dpHDabxbYH7ojsiYeMHorWwY
	YG/NBiFjIImajCC0WrFzVdThoi6x7N27a2PUmboVFEAnwk++5XvoFkucqwv/HBM+Zzw0Mf3mFU/7c
	EIezyNSCIgC9WLiSZd/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muesY-009eRE-Ff; Tue, 07 Dec 2021 18:07:50 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mues6-009eH5-O1; Tue, 07 Dec 2021 18:07:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E8D3811FB;
 Tue,  7 Dec 2021 10:07:21 -0800 (PST)
Received: from e127744.cambridge.arm.com (e127744.cambridge.arm.com
 [10.1.37.151])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 10E493F73B;
 Tue,  7 Dec 2021 10:07:17 -0800 (PST)
From: German Gomez <german.gomez@arm.com>
To: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 acme@kernel.org
Cc: German Gomez <german.gomez@arm.com>,
 Alexandre Truong <alexandre.truong@arm.com>,
 John Garry <john.garry@huawei.com>, Will Deacon <will@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/3] perf tools: Prevent out-of-bounds access to registers
Date: Tue,  7 Dec 2021 18:06:50 +0000
Message-Id: <20211207180653.1147374-2-german.gomez@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207180653.1147374-1-german.gomez@arm.com>
References: <20211207180653.1147374-1-german.gomez@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_100722_874647_5C2EDE87 
X-CRM114-Status: GOOD (  12.88  )
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

The size of the cache of register values is arch-dependant
(PERF_REGS_MAX). This has the potential of causing an out-of-bounds
access in the function "perf_reg_value" if the local architecture
contains less registers than the one the perf.data file was recorded on.

Since the maximum number of registers is bound by the bitmask "u64
cache_mask", and the size of the cache when running under x86 systems is
64 already, fix the size to 64 and add a range-check to the function
"perf_reg_value" to prevent out-of-bounds access.

Reported-by: Alexandre Truong <alexandre.truong@arm.com>
Signed-off-by: German Gomez <german.gomez@arm.com>
---
 tools/perf/util/event.h     | 5 ++++-
 tools/perf/util/perf_regs.c | 3 +++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/event.h b/tools/perf/util/event.h
index 95ffed663..c59331eea 100644
--- a/tools/perf/util/event.h
+++ b/tools/perf/util/event.h
@@ -44,13 +44,16 @@ struct perf_event_attr;
 /* perf sample has 16 bits size limit */
 #define PERF_SAMPLE_MAX_SIZE (1 << 16)
 
+/* number of register is bound by the number of bits in regs_dump::mask (64) */
+#define PERF_SAMPLE_REGS_CACHE_SIZE (8 * sizeof(u64))
+
 struct regs_dump {
 	u64 abi;
 	u64 mask;
 	u64 *regs;
 
 	/* Cached values/mask filled by first register access. */
-	u64 cache_regs[PERF_REGS_MAX];
+	u64 cache_regs[PERF_SAMPLE_REGS_CACHE_SIZE];
 	u64 cache_mask;
 };
 
diff --git a/tools/perf/util/perf_regs.c b/tools/perf/util/perf_regs.c
index 5ee47ae15..06a7461ba 100644
--- a/tools/perf/util/perf_regs.c
+++ b/tools/perf/util/perf_regs.c
@@ -25,6 +25,9 @@ int perf_reg_value(u64 *valp, struct regs_dump *regs, int id)
 	int i, idx = 0;
 	u64 mask = regs->mask;
 
+	if ((u64)id >= PERF_SAMPLE_REGS_CACHE_SIZE)
+		return -EINVAL;
+
 	if (regs->cache_mask & (1ULL << id))
 		goto out;
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
