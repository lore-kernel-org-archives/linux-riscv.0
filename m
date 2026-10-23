Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021A4606A325
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 03:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rsbzGQ7K;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=cpLl6HrB;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=rBtD6q8R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mBaZxD23bEHmggt41sYQMVsbdCltHepscqpnenQ2+UE=; b=rsbzGQ7KYuIA5sIyBH3NE742Nl
	D+4HEwsXihJGc37C8JVXQUiJ6SJGYDRe0EWD+ABZmPb8A7m7u+UCM4D8HGuBspvSRYF1RmfQSTD4G
	6Tl8MKvUl/KHxO7OURAx1RGtIYXlXdSVE6Vt3vSQ+3QN1iGFwDb7ZFmvB8J8oVIpHTZ8ejsq9ihBW
	KYlSMrxPAuDdIJ1bpvGolB1tKLFsCu85y4pTMryLiqQu6SfMMwwMqSxuQgg2xQ/QxzJcaN6yIyj2j
	ZO+8jBcEz+nBV7ynxF3fk5Kk/3GxiESbDwPgQIs7HMAtBi/aVlI55jVUDaTfc02sOMNVNHlP4Kkv4
	rqhSHQEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5nQ-0000000FPYG-28DF;
	Fri, 23 Oct 2026 03:18:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5nO-0000000FPVg-3xFa
	for linux-riscv@bombadil.infradead.org;
	Fri, 23 Oct 2026 03:18:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IIzNbh4VgZ2+A4NRQQWGvVM2A0ZOY77Hg5b3LZspggs=; b=cpLl6HrBqExapFBmk64BVZYyrJ
	lb8Q4iWxH5NyzCiDF4938jSjUhjlWrMsAwYT9GQr3NApiW0XxV5pYwG/9El/QajVS9A9nrwD8QAM8
	CntLGwZBh+Pku5CuAS0MqUxqcN5xrKEMt8iBf2VdPuQPRvN3/3SQkYTLefocoKFlj4qi6nPXZQQ4y
	uX0lpz+Q7WKV6BuIH8nH08Qej3dtr5FKUkg6cp8T0LlQV0PO5XusSz5mmJ30RU5geOo+9s+e75EJS
	eRaN8wrnA9L7JinlnH0arRiG636a0ppTylOPSjY4b18ffaXCd6jIARNch/M4ZO4L1jUsTCXuBmbk6
	y5FNXLCg==;
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5nH-00000008cH0-2bEQ
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 03:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725431;
	bh=IIzNbh4VgZ2+A4NRQQWGvVM2A0ZOY77Hg5b3LZspggs=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=rBtD6q8RYXMkOTynqG6jiZ+gsmUZLowS3PmnHyt5c3RFTKXScLTzdCJxVCgKnTmVT
	 a+yX2zi77x4TbTfYx7UK5rjPRZ2aaa9LKTvCcQOUHOfT/vJtlchS+agGdPwvZNxBU9
	 h/yjNdiqKloCBw/cn2d0MIodP4G3JPO2EUqAbGPY=
X-QQ-mid: esmtpsz11t1792725374tdc004b56
X-QQ-Originating-IP: 69HE26miq7s3+N55bq0kU5fExvDLQGCVhHeFKR1CFug=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:16:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14460720927037419999
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
Subject: [PATCH 17/24] gtrace: Unify default sink selection across CPUs in perf setup
Date: Fri, 23 Oct 2026 11:14:58 +0800
Message-Id: <20261023031505.2020925-18-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
References: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: OWV6Cj5PHfJtQfQCVYNZHjtnNLErg9SgsmIWOtnZ9L6ZxcrSzzZeV3Fe
	Wvw0uqQ5piFiNyXmWJGs12klWZJLFY52MZNNO3IdCsXrF/CYHEJdcRHiDn859GlPf5YJvhK
	YDoScYNT6B92+yEYayWaWI4zZwatydP+Wn3THJEL4OeccRU0crY/jooLX8YQ3swI4jkEuI3
	BfC4euWEWaOjUx0lJcfSb0Y3VbPwKYAYz6HyukXg8f5n181cP970WJErx9cY4Nlun23GAs2
	RLzCgZhoDAGZ+0el+7fUcZH/x9984c++SGzRf7iF0xQ9uKz1Few1UDGE9eWj8/Vco1j4Ye8
	zVDOJE841FZgfB94JVI4NCrkp3VteY1de9IKhy8v6FcTWqZX+ED5XtyLc1YcT9A62+w4bTK
	5FBF3BQJT+6/AeRShMi+DcnFSbOme4SrJMx/fGlvqtoO/9pqCTdxmfKQp8lsXPa05qySc9Y
	o6pzm2RXRbrEoYRusz+XtOXxBp8ZDUzCN2zaQpWR7WIWuEg8Jq8B9KLNBU/m9p6BPuD2bbM
	LNFxLPtnmHvp+0+cGdn5DR3OTWZnYQzeIgoOx8BgAXTMWbcscpR1vM1peFQ9OMsKZlJQBKM
	vgeulQ5fsx2a/MED2fqWjeJUt9gjzhl/BaNoutYy2QyiYhnO2O6VHaOlA4yyzhfYJeuIBhO
	oV+dyFkTT0vFRh2APHrL1f0JUa9Ae6FssaECUX7xgvrDPPmOxmFVCh0zZSXAkGvAmd0noaR
	QkrQodyE2xNYfm/fGZLObpP8C26zKV6mOtm3OfnKpYLYfFnCM4rzYXx4odLF0cm0dRbHQjx
	slUIsyGrloTNEFosHRl4mwuvLp7x3sA5X7Z7abvXVV4vVWhmhajUhrA9rrl/Lv+ZiTzvq9g
	8IeDze7PFFRGi5ZDN+kqZCWxvTcV5PEkd0LK51R7AyXJWXV9uii+aMVAhpJtzb2AMElT6+5
	q/vaQV76Mw1QZ9QsTScALgRUSwAnxrPMq+8RvmyruHpglk8Dzw49bkEt+ZcwVpmzFKi6PXT
	UK6ymr211aoobA9Kfg9h1AF7Q9LFbjiJ+Y59iK3cQOHrZtiQgrU0AV+N6hK3/TeH+EtjrJF
	mQk7KBQo65In5YkfQ9r4IQr9NUXNb3UGg==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_041812_508922_C199DD64 
X-CRM114-Status: GOOD (  16.13  )
X-Spam-Score: -0.2 (/)
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
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In gtrace_setup_aux(), remember the sink found for the first CPU and
pass it to gtrace_create_path() for the remaining CPUs so they share a
compatible default sink. Clear a CPU from the mask when no path can be
built for it and abort when no sink is reachable at all.
---
 drivers/hwtracing/gtrace/gtrace-perf.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/gtrace/gtrace-perf.c b/drivers/hwtracing/gtrace/gtrace-perf.c
index 3c8b620df5a8..9b874daa807f 100644
--- a/drivers/hwtracing/gtrace/gtrace-perf.c
+++ b/drivers/hwtracing/gtrace/gtrace-perf.c
@@ -109,6 +109,7 @@ static void *gtrace_setup_aux(struct perf_event *event, void **pages,
 			       int nr_pages, bool overwrite)
 {
 	struct gtrace_event_data *event_data = NULL;
+	struct gtrace_component *sink = NULL;
 	struct page **pagelist;
 	int cpu = event->cpu, i;
 	cpumask_t *mask;
@@ -120,7 +121,7 @@ static void *gtrace_setup_aux(struct perf_event *event, void **pages,
 	INIT_WORK(&event_data->work, free_event_data);
 	mask = &event_data->mask;
 	/*
-	 * Create the path for each CPU in the mask. In case of any failure skip the CPU
+	 * Create the path for each CPU in the mask. In case of any failure clear the CPU
 	 */
 	for_each_cpu(cpu, mask) {
 		struct gtrace_component *src;
@@ -132,16 +133,28 @@ static void *gtrace_setup_aux(struct perf_event *event, void **pages,
 			continue;
 		}
 
-		path = gtrace_create_path(src, NULL, GTRACE_COMPONENT_MODE_PERF);
+		path = gtrace_create_path(src, sink, GTRACE_COMPONENT_MODE_PERF);
 		if (IS_ERR(path)) {
 			cpumask_clear_cpu(cpu, mask);
 			continue;
 		}
 
+		/*
+		 * The first found sink is saved here and passed to
+		 * gtrace_create_path() to check whether the remaining sources
+		 * have a compatible default sink.
+		 */
+		if (!sink)
+			sink = gtrace_path_sink(path);
+
 		path->event = event;
 		*gtrace_event_cpu_path_ptr(event_data, cpu) = path;
 	}
 
+	/* no sink found for any CPU - cannot trace */
+	if (!sink)
+		goto err;
+
 	/* If we don't have any CPUs ready for tracing, abort */
 	cpu = cpumask_first(&event_data->mask);
 	if (cpu >= nr_cpu_ids)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
