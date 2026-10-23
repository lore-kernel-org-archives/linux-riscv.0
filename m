Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3F9606A31E
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 03:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=361PrJ2g;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Sdli9E5P
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RIQ56p+vcYTbu/oYmY0OmLNCCr9r6XuDOukc8GUvBnw=; b=361PrJ2gWrWqt/0T1ZxstJd3xd
	1KGjBcbFE7er11mJ4WCXJQbcul8iGsaDzI5KcmOVJDCChHmGnLcsFxVomoG5cUmrlWHR8M1M8GCjF
	r0Y4fWweto9fGRn6Yef2/Ba7CaWWmxxrBYZsS27CFxRhKe5I7cbHs2+P4w/wT1vAPze5jVsegh2R6
	lKoUSaFDOfEgtUdH9ftzCRpKJb1/Gevfrb93vgF8dgkn+qE0PZDR9yhOCoN0Gvrm8GCvYi/FftiDL
	g1Dd9dEcNwJQAMuvpeVRCHAnN4vndbvHdMYR+GGYgEKwbkXNJ0LAWXvvxVIIqizGTt9L6K5NZD/rH
	4kcwZe+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5m0-0000000FOLa-1qFT;
	Fri, 23 Oct 2026 03:16:52 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5lv-0000000FO5W-0SII
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 03:16:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725339;
	bh=agQ+74FSxZS+AQ2bKZyg5UFSSbvxZz8jhUlTJIaIkkg=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Sdli9E5Pa7xIu3HdcBVui3KUvQVVhv9Wu7OXOHqex2q+RGzhHMYwVXjDKeYn1nv/H
	 8vR8Fs9xRzmZyrjSeDuO7L5bpdE5BhXaSVstq1FxhzHvwfLDyooD6fomPbTcOmCWpQ
	 oO3+vpxbaXFyNHA790lhm2hvzsLCaGd9B8FzJ694=
X-QQ-mid: esmtpsz11t1792725332t2413c7a2
X-QQ-Originating-IP: z2kObITc/I9gIbeKVsCchJumtTr1zVVJZUDXOCA4ViM=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:15:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12303599440400516652
EX-QQ-RecipientCnt: 26
From: Zane Leung <liangzhen@linux.spacemit.com>
To: gregkh@linuxfoundation.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	alexander.shishkin@linux.intel.com,
	suzuki.poulose@arm.com,
	mchitale@gmail.com,
	anup@brainfault.org,
	irogers@google.com
Cc: mike.leach@arm.com,
	james.clark@linaro.org,
	leo.yan@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	alex@ghiti.fr,
	atish.patra@linux.dev,
	andrew.jones@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	liangzhen@linux.spacemit.com,
	zhuangqiubin@linux.spacemit.com,
	coresight@lists.linaro.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/24] gtrace: Replace owner PID with perf_event pointer in gtrace_path
Date: Fri, 23 Oct 2026 11:14:47 +0800
Message-Id: <20261023031505.2020925-7-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
References: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NDgMZBR9sMmaBCRONdrM3P746ARtphw2NnsOCyjNE1VwQ3l0UDoptDZu
	wR/b7mE1YKaq/9fdIUx6ukCey2WfctVxT+0B5I5SQdjKDr0kGPeeHhSwHG6Y0r/FlObUDEF
	sOmY9Q+twkv/BiG7BxzQxtsEQlDtRl4FlomlXvwFsSKaFAe5AmY8I/FRTW8X2EFqRrdPgnU
	T7m4tmHIw4vPonLJFFVB8BDgBCGdOe92NUFe1x8RIsf1UhMyW4wdAWHo2Dk7YGp+QvwDl8I
	KDJXMRx3kUdROjPGTEX4A484ljG0TipVfxmNkx2ZBQ4TGmElmqGbBB1EfJOLv5iRQoqnQbS
	fXabKCNi5nDwaVD6gOR1RSDNIf0r9F3z4MJAeeQB6ZmA60lLZT2mWF0u7nmSRVTo77yQq03
	w6ExpAU52iEgn2aHB5CEQQ1ZVNPyior4OGNXFHAwCK/aO/RLU0g7Uj/s1VGLlZ+FAJpIWK2
	wpyHt55WAwE0a8lgdIh+bQcmt87T/b4Mnelj3WZ7P+axrzaw9NHwG1ZO4SoXJfQjsmpKnkN
	+yomScN9Kzj429Rqbde4kzQbMCw6aqcXkU4QMrhLQJUmwbBz8MbcDDZB5U0c0CTWnQ5LUSi
	TUU0LTM1wjXcO/417PlzShYHqlKMf8a9cxqDKX0xdrvYv2p701PVTBNdvCFO/3YGzKNvMqD
	SdGZvqkseSjJ4hzK9Tbal1451PJVgAm+BEOAoGEbX8qELwOl3TbxopYUggggnZ4TyAeNvi9
	8Cq6MX8uXCM2k01BKp9ZvVfoZeJ3O0RoqbpGO20JC8LjuhRFvR8wA4dFFXtGN0+Rhv+Vmu8
	bnGsw0GepSTwkHrdtIi7/KY2Hl251pTGGb3c37ZkC+LpoJV7xzEcKPl3CX5yQSerpMjAeHa
	MnXzb3jsvA5I0N6Ww+hHDZohU4prFP7a/RgpZ+ynL6jvZJhLh9vUQN7EBwDf7v4LgfV9yZt
	YxYEushH82Aqcz08WQnzBxI/Bs90ufHMvGQtSEaNTG2mXXfi6ntPfyA26Yz7GYDZqv6PMDH
	MjFmIEIOa/9PUwEoDN7UfK6fqiA794+TLvZlPGwKmiRJ5wn1qp4MicinQA5TbbRZxlNbY1z
	CSyve3yVs59
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_201648_011960_0DD2DE72 
X-CRM114-Status: GOOD (  12.63  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace 'pid_t owner' with 'struct perf_event *event' in struct gtrace_path.
This allows component drivers to directly access the perf_event for PMU
configuration.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c | 12 ++++++++++--
 drivers/hwtracing/gtrace/gtrace-perf.c |  2 +-
 include/linux/gtrace.h                 |  2 +-
 3 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index cae0a7fa820f..3f55d8b7302d 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -13,6 +13,7 @@
 #include <linux/spinlock.h>
 #include <linux/xarray.h>
 #include <linux/gtrace.h>
+#include <linux/perf_event.h>
 
 #define GTRACE_POLL_TIMEOUT_US_DEFAULT	10
 
@@ -665,10 +666,16 @@ static int __gtrace_comp_start(struct gtrace_component *comp,
 
 	raw_spin_lock_irqsave(&cpriv->lock, flags);
 	if (cpriv->start_count) {
-		if (cpriv->owner != path->owner || cpriv->mode != path->mode) {
+		if (cpriv->mode != path->mode) {
 			ret = -EBUSY;
 			goto out;
 		}
+		if (cpriv->mode == GTRACE_COMPONENT_MODE_PERF) {
+			if (cpriv->owner != task_pid_nr(path->event->owner)) {
+				ret = -EBUSY;
+				goto out;
+			}
+		}
 	} else {
 		if (gtdrv->start) {
 			comp->path = path;
@@ -678,8 +685,9 @@ static int __gtrace_comp_start(struct gtrace_component *comp,
 				goto out;
 			}
 		}
-		cpriv->owner = path->owner;
 		cpriv->mode = path->mode;
+		if (cpriv->mode == GTRACE_COMPONENT_MODE_PERF)
+			cpriv->owner = task_pid_nr(path->event->owner);
 	}
 
 	cpriv->start_count++;
diff --git a/drivers/hwtracing/gtrace/gtrace-perf.c b/drivers/hwtracing/gtrace/gtrace-perf.c
index 703c12b95665..2fcfbae9acf6 100644
--- a/drivers/hwtracing/gtrace/gtrace-perf.c
+++ b/drivers/hwtracing/gtrace/gtrace-perf.c
@@ -137,7 +137,7 @@ static void *gtrace_setup_aux(struct perf_event *event, void **pages,
 			continue;
 		}
 
-		path->owner = task_pid_nr(event->owner);
+		path->event = event;
 		*gtrace_event_cpu_path_ptr(event_data, cpu) = path;
 	}
 
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index 76b1aa9cfe79..3d769b405030 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -325,7 +325,7 @@ struct gtrace_path {
 	enum gtrace_component_mode	mode;
 	u32				trace_id;
 #define GTRACE_INVALID_TRACE_ID	0
-	pid_t				owner;
+	struct perf_event		*event;
 };
 
 struct gtrace_component *gtrace_path_source(struct gtrace_path *path);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
