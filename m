Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB0F606A323
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 03:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mNQ2psi8;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=q7U2/shp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bQlvcZzHBB6el0M5MJuvSG18KhjDeH27XYtvWGELCbg=; b=mNQ2psi8jGwgXCxCqLpNgyduS8
	oSIgH3DKAk2fh8+DEbEarvhkG6201Qa92j6Mdb87K1Qz135zlBHPTnG9dRgLBJk03NsYc2uA6APHa
	1osPPalYuaEqiHGcipFzNd99kfeBJ0DKg+z7dWWVrYJR3m3oRvsosBaslG/4B+/TivNms7mqmPp8k
	ePaAO7VrMH71FrTNirP1YvKvCfKEk044V8oF7hfZMk44aR+GXCuRCQa5mZvMuIiFud5sN1cXCaUM6
	oDX5aaxTN1yvryI0rNnTIR224PWX/XoSv2z0Jrc7NbYfVI38d4BBfX+6jYwZDAt01+T7NxEPFxxrP
	v2neIozg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5nM-0000000FPSx-0iEl;
	Fri, 23 Oct 2026 03:18:16 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5nI-0000000FPHM-3qQs
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 03:18:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725435;
	bh=hrqZgpXEbRCXYwF/fMDlhxzbJHeEM8/U9JvY1dw+mwU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=q7U2/shpB8rGQW27OuGcKklxvj9080yTgjmwylDejO7cPDJH60Wi6R7TrMIsMmjmD
	 w+pN+rMkjXLPS39NvvZdrXsvqaloXNT3QYEmpm+ozAww0zlYMNzfqQ1iNJAt09E7ow
	 uoXnIbCKNgCMx/D1twmtberL/iNlIxpdQg0pjGBw=
X-QQ-mid: esmtpsz11t1792725381t9933039b
X-QQ-Originating-IP: zBnCj0Pl9x55BvX5w7GkJn8w3izRmCpCLEcc7pj1jOg=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:16:19 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8460341350556304876
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
Subject: [PATCH 19/24] gtrace: Add setup_sysfs_buf callback to setup sysfs sink buffer
Date: Fri, 23 Oct 2026 11:15:00 +0800
Message-Id: <20261023031505.2020925-20-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
References: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NDgMZBR9sMmatuPt4E/niLZWmzf9ctllFvLRuFuf9VDi0PMFIibxkBIg
	ItQi/Chl6XUzLiPKEEmXtnM0hzB/R3poQsDYk093maYr1/RG720Wb1JdvFxn53dMJO/567v
	LgqhM0BzlvZzwE5eNDwHNjx3DUgT6DoNFpKLU8ORwvIVUjiLHob4kJG0M0QUUFmyy1HNuns
	XmlswuFD82CKjUjJnacv/scwI1jfbmMBJ/9d7sLscrRIoGrOkC6Fn80FItuB2GdoBfqmP8w
	uy/kxheAPi/752GrcbjVM9KGZVLbh8sfxYRQBh8oAERITnBjJRjshSYOhdVAzhxL8x6D2wv
	aemlD+QEPYPogq6t5cBivTj/LR/zJq9ujrRSKl7zW0ORmhHIYXFAlaVFq8u3ENglWpM6n1y
	7eORglVodzHuqaJ/aKcisdAI8D5kXGWKq4ha201xOZsILfEf6mBSYM8pPKf30yGW6ykyCt7
	JtC+FVdCNFCoR1P9x7oby4L9q5XZqIP7RrnCtcAnN6vWMmWw5sL99I9rweB5tD2NjP7Ki8k
	SBvesNtizB21GHC2IJzkSL7pByXB1JMDXeW43nhivRywaRU923bjLCuf6PL7kfsuWHPR+pp
	gbJTe1+vHZ71eWKObyHNotIAOihP2TbJxwOjA4UjPO+i7VaGijsVAu3hBbOC889TdtuO+Qa
	5Wk4LbpEL2bBNRCQLosuv+wYA+hTCzfmhi03ejCfpV8wQ1goWjKpMQs08ezSQW/HEbcREDg
	dAVDyuhRtEPiFl8CspkAzwM0jVGH6xkKP7V4owtejstbDrXv01FCFLX5HzmbjjYW5bT4qfd
	7J4ycz11bF1VezUG++V68inN35axyyFkSCwYlZNiH6r2l8Tfi4s+sqSImDyhIUy9H9K/mhL
	p1rHmxHx+PsGFlXo1pI7jeM/jol8/ZyR7NEoR6hROL1CwL12dCnbytWNPVWSPl+rIiC58I0
	TtmONXWOlW+f0YHG8D3g4ZjFAQI6tMRWB4978LynQbHaMV+D9rYdhQqWxPbpKMzSjK/LKoE
	9OZjj595sSRLiNfe+8r6thtDBUjMGoU15c/VxXYtUTQ1YIVzU6TSVT9SaunCwL+QuiSwrao
	sJzeLnnomuC
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_201813_241504_5B6FA859 
X-CRM114-Status: GOOD (  11.61  )
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

Add a setup_sysfs_buf() callback to gtrace_driver and invoke it from
gtrace_enable_sysfs() before the path is started, so the sink can
allocate its sysfs trace buffer outside the spinlock held by the core
start path.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 drivers/hwtracing/gtrace/gtrace-sysfs.c | 12 ++++++++++++
 include/linux/gtrace.h                  |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/hwtracing/gtrace/gtrace-sysfs.c b/drivers/hwtracing/gtrace/gtrace-sysfs.c
index 5f4f3fcb56a4..23b0a21ef9c0 100644
--- a/drivers/hwtracing/gtrace/gtrace-sysfs.c
+++ b/drivers/hwtracing/gtrace/gtrace-sysfs.c
@@ -85,6 +85,7 @@ static int gtrace_validate_source_sysfs(struct gtrace_component *comp,
 int gtrace_enable_sysfs(struct gtrace_component *comp)
 {
 	struct gtrace_component *sink;
+	struct gtrace_driver *sinkdrv;
 	struct gtrace_path *path;
 	int ret;
 
@@ -114,6 +115,17 @@ int gtrace_enable_sysfs(struct gtrace_component *comp)
 
 	mutex_lock(&gtrace_mutex);
 
+	if (!sink)
+		sink = gtrace_path_sink(path);
+	sinkdrv = to_gtrace_driver(sink->dev.driver);
+	if (sinkdrv && sinkdrv->setup_sysfs_buf) {
+		ret = sinkdrv->setup_sysfs_buf(sink);
+		if (ret) {
+			gtrace_destroy_path(path);
+			goto out;
+		}
+	}
+
 	ret = gtrace_path_start(path);
 	if (ret)
 		gtrace_destroy_path(path);
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index a3d125882ec9..0957d0490c57 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -377,6 +377,7 @@ int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
 /**
  * struct gtrace_driver - Representation of a trace driver.
  * @id_table:      Table to match components handled by the driver.
+ * @setup_sysfs_buf: Callback to setup sink-specific sysfs buffer.
  * @alloc_buf:     Callback to alloc sink-specific buffer.
  * @free_buf:      Callback to free sink-specific buffer.
  * @copyto_auxbuf: Callback to copy data into perf AUX buffer. The driver
@@ -394,6 +395,7 @@ int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
  */
 struct gtrace_driver {
 	const struct gtrace_component_id *id_table;
+	int			(*setup_sysfs_buf)(struct gtrace_component *comp);
 	void			*(*alloc_buf)(struct gtrace_component *comp,
 					     struct perf_event *event, void **pages,
 					     int nr_pages, bool overwrite);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
