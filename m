Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5004606A31A
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 03:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e/4UJLdp;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=ljH0oWtk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hYioLmbGIDGeEV2kyHP8gdkISP8rJjzlY5b5iOE4GZk=; b=e/4UJLdpE7uxKcByrU9u4Z2agA
	pz0Ggsi81jiEjDYUKmiHk9QiHkiAaBRGwDoB37iw51zSX3pzkGGtLGftYDtKDZqgh8M1nXVv3MxHI
	rTxxLF6lItAwk4jrFHSLgXUhPz5Vq9Zc/L+a9dmyBWTs+vaAtOAiKp/L97Y07OHXBauvVw7xPf6WR
	dhEklx7ozmkJDgIci0ri8WumC7+Pp3St196h7iE/QQlIQ0qxx1dbe293w9cf16AZrFF7qbeFSAegS
	wxsWXmsWX68rwvxjB9kMDL4j0mK0knCTvlHm0XzPhqj5Nf0xWxDGq4EE5y1TgKpAVKvg1HumMJVbJ
	KJIV0F5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5mz-0000000FP3i-1F1Z;
	Fri, 23 Oct 2026 03:17:53 +0000
Received: from bg1.exmail.qq.com ([114.132.65.219])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5mw-0000000FOzN-0lfx
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 03:17:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725432;
	bh=2vph+OuFIOn3SzY2fv1CwAlrQbisuy00yQG7/Va3ANI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=ljH0oWtk9+CrDXCHRn86qd2imMHGedUsH2CyIUv6DW/8mFWcnY17HFyvOLbiR/qrX
	 gsBVsmV06jO8bRtlPn1PClvWH20RMhdzxPiRRwlU+BlIe7UCvmTj6HjDh+b3PA4Abc
	 qSuD+bgqN49d6rRC4v89tm5eNwDxzWcF+MTYr7UA=
X-QQ-mid: esmtpsz11t1792725378t92e44d2c
X-QQ-Originating-IP: CtAhbqwKALyAvtWqn+oIZw26M4DKpk4Gn127AatmzdM=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:16:15 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10579745703144097967
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
Subject: [PATCH 18/24] gtrace: Add sink-specific buffer alloc/free callbacks
Date: Fri, 23 Oct 2026 11:14:59 +0800
Message-Id: <20261023031505.2020925-19-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
References: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NuQRJUP0KJGkyewuBfcl5UNvnoHbxYUmAbj7i3cpGLMs+xIYWSLMfShn
	WqnBmVbfoRp/LAfatP29naaLyT4j1M5NUId+Vqh+9hYJ538FgBshSWJ9WG2yOmIIHaDDoZX
	kk+0r80YxF8UyLKu5fB86lohOYGfp7pZkzN37Z8mtF7L0Jor5s0VQCxgx3bpCwCrdtRc1Jq
	QovFGIUYfQSdkvA8nQQc4G0rY2Ln5CojzT5WDBfuvtot3UoFa8rhjkUyurzWoywDbG5IkBo
	nhRs4OlA23ZVP8lAcgAKUfWXeZFriUTe40VbT+FOVbvBmFjnU3z+dIYF+vQ7SAvEwJIo/Mh
	Kp4Y58EI3v76zuV6NHf/EtXKZScJlfttTSx5+eMenIQqUEdjE+6pbdQHLJz9DJeSezE5TxC
	vsG94MsViciMHV+aeDezVtNsc8jKRq7EdIvG39O2W9FneorKwbkzZ+C6AU2diwRVGQ44VZZ
	jyzWkI5ncu+skMVSekR8NFHNaPVaTpDDXdjdtZVdEWBJqqalo/jM9l8P4EekVGOLpH5BzcP
	gEoSjqdtEPT5F5OU9QK5x4RC2c7Yn7LW1GaY0DVEzdQ7BRG+IxgAolByWbHH0VwvsQm2yOh
	LEMizkVyUsEPqK/tC2ofxIupRM9QzyvMUT7ScVZWjYt66tFyPbVVDwhdZNC7ogEAOwlRg2I
	1gJEeJzH+pFIzZg1Lq7LW2RQ/fbpIRnAuocho8iIqRK2ehH7ISi3zBvklxy7agYSc4w74nj
	Du9f0FpqvtxemMjvv94m/t9LaQdKvkwp0xxYYKEW4rtAg4HX+vqgM9pqm3gYFqlU/Xz1fKk
	Cj22Lm8uWwGpRGzKa1RwX3f45Aum9UyvNeZ+auKtmtVrVwS9QQnVFmkhjloBwDSHRnhmYJm
	Jn2qD5cK7vg5MWYZndvEWVz213Y5R4E/tJsVpJQBNTs/wfeHywlPFari8odErhgQUeefA05
	/gIcj8738kCA4zbODNmLsH1JfDvHAUAaVxK6KxReAPKo5VtA4NgEecHJLa26eVJWqjJJDoZ
	6ptSicPtwACTDa7N7PHICg/WhF+8fQHD6Xzcv3Z/FUWQU4UNnhIhkGGvWljx+a/cslrDfEl
	nrKp6gKEjuHFb0IvMVtDBk=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_201750_579426_4DD1A721 
X-CRM114-Status: GOOD (  14.55  )
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

Extend gtrace_driver with alloc_buf() and free_buf() so a sink can
allocate its own buffer (e.g. an ETR SG table) during perf setup and
release it when the event data is freed. Store the resulting buffer in
gtrace_perf_auxbuf along with the event pid and snapshot mode.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 drivers/hwtracing/gtrace/gtrace-perf.c | 34 ++++++++++++++++++++++++++
 include/linux/gtrace.h                 | 12 +++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/hwtracing/gtrace/gtrace-perf.c b/drivers/hwtracing/gtrace/gtrace-perf.c
index 9b874daa807f..e05a833aa6a4 100644
--- a/drivers/hwtracing/gtrace/gtrace-perf.c
+++ b/drivers/hwtracing/gtrace/gtrace-perf.c
@@ -86,6 +86,27 @@ static struct gtrace_path **gtrace_event_cpu_path_ptr(struct gtrace_event_data *
 	return per_cpu_ptr(data->path, cpu);
 }
 
+static void free_sink_buffer(struct gtrace_event_data *event_data)
+{
+	int cpu;
+	cpumask_t *mask = &event_data->mask;
+	struct gtrace_path *path;
+	struct gtrace_component *sink;
+	struct gtrace_driver *sinkdrv;
+
+	if (!event_data->buf.buf)
+		return;
+
+	if (WARN_ON(cpumask_empty(mask)))
+		return;
+
+	cpu = cpumask_first(mask);
+	path = *gtrace_event_cpu_path_ptr(event_data, cpu);
+	sink = gtrace_path_sink(path);
+	sinkdrv = to_gtrace_driver(sink->dev.driver);
+	sinkdrv->free_buf(event_data->buf.buf);
+}
+
 static void free_event_data(struct work_struct *work)
 {
 	struct gtrace_event_data *event_data;
@@ -95,6 +116,7 @@ static void free_event_data(struct work_struct *work)
 
 	event_data = container_of(work, struct gtrace_event_data, work);
 	mask = &event_data->mask;
+	free_sink_buffer(event_data);
 	for_each_cpu(cpu, mask) {
 		path = *gtrace_event_cpu_path_ptr(event_data, cpu);
 		gtrace_destroy_path(path);
@@ -110,6 +132,7 @@ static void *gtrace_setup_aux(struct perf_event *event, void **pages,
 {
 	struct gtrace_event_data *event_data = NULL;
 	struct gtrace_component *sink = NULL;
+	struct gtrace_driver *sinkdrv = NULL;
 	struct page **pagelist;
 	int cpu = event->cpu, i;
 	cpumask_t *mask;
@@ -175,6 +198,17 @@ static void *gtrace_setup_aux(struct perf_event *event, void **pages,
 	event_data->buf.nr_pages = nr_pages;
 	event_data->buf.length = nr_pages * PAGE_SIZE;
 	event_data->buf.pos = 0;
+	event_data->buf.snapshot = overwrite;
+	event_data->buf.pages = pages;
+
+	sinkdrv = to_gtrace_driver(sink->dev.driver);
+	if (sinkdrv && sinkdrv->alloc_buf) {
+		event_data->buf.buf = sinkdrv->alloc_buf(sink, event, pages,
+							 nr_pages, overwrite);
+		if (!event_data->buf.buf)
+			goto err;
+	}
+
 	return event_data;
 err:
 	gtrace_free_aux(event_data);
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index 39ae13701615..a3d125882ec9 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -355,12 +355,18 @@ int gtrace_path_stop(struct gtrace_path *path);
  * @nr_pages: Number of pages of the AUX buffer.
  * @base:     Start address of AUX buffer.
  * @pos:      Position in the AUX buffer to commit traced data.
+ * @snapshot: Is this run in snapshot mode.
+ * @pages:    a handle to the ring buffer.
+ * @buf:      Optional sink-specific buffer.
  */
 struct gtrace_perf_auxbuf {
 	size_t length;
 	int nr_pages;
 	void *base;
 	long pos;
+	bool snapshot;
+	void **pages;
+	void *buf;
 };
 
 int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
@@ -371,6 +377,8 @@ int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
 /**
  * struct gtrace_driver - Representation of a trace driver.
  * @id_table:      Table to match components handled by the driver.
+ * @alloc_buf:     Callback to alloc sink-specific buffer.
+ * @free_buf:      Callback to free sink-specific buffer.
  * @copyto_auxbuf: Callback to copy data into perf AUX buffer. The driver
  *                 reports the PMU specific trace format of the copied data
  *                 via @handle (see PERF_AUX_FLAG_PMU_FORMAT_TYPE_MASK).
@@ -386,6 +394,10 @@ int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
  */
 struct gtrace_driver {
 	const struct gtrace_component_id *id_table;
+	void			*(*alloc_buf)(struct gtrace_component *comp,
+					     struct perf_event *event, void **pages,
+					     int nr_pages, bool overwrite);
+	void			(*free_buf)(void *buf);
 	size_t			(*copyto_auxbuf)(struct gtrace_component *comp,
 						 struct perf_output_handle *handle,
 						 struct gtrace_perf_auxbuf *buf);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
