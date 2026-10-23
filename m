Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F193606A31F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 03:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yHFQ1w57;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=gWOXXIIL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2xphWgCpgQHwtdobeDtKRs62ITT/EMoSjdxKCfn+RKk=; b=yHFQ1w57rFnO0lCMCa+PBJu0pP
	hXurJHRIT8AYl9c1A9uY0VljaKNkn//ulUu0snmAVmaKEGxcguUt2JzFcJ21q6AoaIkpYDN1F2nEQ
	sZPCt73jvnqrSOFNXsHY0AkF/6AoQb1yL/Ge6yaGoxPK0JwXSBQ42Cwkwurr4QuUdpooJ5zWyNck8
	CEGjjun7c9HKiCXqGYtmeJQFbka19s3dMHNXwikQ81n0dns0eebf9Rty8T1Fy8NbnzSqyZuq1PjVM
	A4nEjpQvZyoeKpIk2gukWi8C5sQi2Pyba8QYXvc/64W+/4WSMxFP4cyNy7Q4xP0KqX4D+j9ISQe3u
	4b5Xfq3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5li-0000000FO5R-12bt;
	Fri, 23 Oct 2026 03:16:34 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5lc-0000000FNzo-1uJK
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 03:16:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725337;
	bh=1lKL4WwRnDOqfNfYSGU9cmx6yk/pVYFWkgr7HmIHhnw=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=gWOXXIILBf735Iy7nxYR0K4DAF0jQ0DhzpGvFb4hDqsMV2e8D/1JNumrAG8wWrOBY
	 wJq+8FWyqfvih2D4JeqY8QFPLWJdefYqcHKaUgvTtQh+7XjLypk+/hnZypiOscpUio
	 3yVr4CkkoUOev1oV7BcdRS1cG0ejLzoTgReM9YqQ=
X-QQ-mid: esmtpsz11t1792725329t9f807f66
X-QQ-Originating-IP: t/ie3yyWrwAf9jrS8pPLtnApkqn64E5F59vTX0WOT1Q=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:15:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5328409807779775751
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
Subject: [PATCH 05/24] gtrace: Introduce some PMU format attributes
Date: Fri, 23 Oct 2026 11:14:46 +0800
Message-Id: <20261023031505.2020925-6-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
References: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: M8w/1a60XBliAgnoEfw/1d0/GnwvZoW8bTEP2Yg111mJP323F45vTY5M
	S5Pdsi934VUxg8aM3qJ671AMTcxsZ4aAg0Z4KTzZcgFXqFaedCwRByLd6ttB72APhftWdXG
	7CZ4luc39FGSSvtI34nIQB63tO8v0n5UKU3FQgcrGyzW/DaB2VHVH8RKBep8/r8jdiOUIHh
	7f32VWodQUoDRkMRz01gN+pUhd9OtAdTefyELP/hhzibuFnV1bAY1zEf6+vBUlTdyJqWl6r
	XyzOz0NbVQU2Bs7r+QvTfsZDegH0+A6Ae+k1TFoOG6ETSZL9OTTJcaxn5YulIXNBwd5RHPJ
	RmzshWnFB9SFPys6GrLphU1+PeTb8TkH5WdRmOwHWiz/EcWSrlsIYb4D6eVZTjIrmlHrSlX
	KeU+RTZicflapmVeb66wwiVZ6rIqw/sJnHR94Pd5QUiXPgW45tJS3ehptpDxLRHiB9MA8Br
	rKZ8mlz51J5phfkUxzamSk3dvLWLyt3Ztn24sd+VrTdnN01905zvGAPxBIZJXnE1B9adA4U
	3oxA4HLdbD2nqvx8m2KnWI4h8hELHWgBI9oMHiusVsybVI+2Z520QLXNnOLFS4pvLq2HJyg
	JZqWK1CUSRnqo4LbT9P2sg3xSif5ZIr37UxA5FJr6EfUMvXEPnJlKtKXFnVhjfBAtHc7Xqa
	2sRYmvkg3++erel4HBgaUzINKigPzB/0gcz/ghEYLbS1xjrs7ZMD3VdHR9yPutDvMID05ya
	6+0rZZtYwdNe9eZpVJFZVIHhx/4KWnavkVvONZbb8siEAexhVhMA5aslD92t8g04Ujg/nrR
	q9PeU5ZMKTENjfZSB4BhWFZAiZ26A2Wwxn6ogjRXr0HyicbAg4VhCqmaoxrzzZhoNmXzjRr
	4XAgIHwi4ylV7uabHK/UYeN9AZqEb+l4h+bQg5c6hFsYdDbLffDM71qVBNLqlyrPj9CpOKr
	DT2DoJ/CasZbmebcJVo8VT91dhxxrnhd3gDITBY/14m5OOkiB+ZrXd3Tjwa5ygA+xwbe45a
	PCfBxZs/rQX0/ii4xn9/IawkRsqIUGzyuNYW7M8JlusHXlFak19Y6M9E/pq9duMm6Anhe1m
	adKnP1PqrRHU4rO50kMW/4=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_201628_797487_ADC048D2 
X-CRM114-Status: UNSURE (   7.31  )
X-CRM114-Notice: Please train this message.
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

Add new PMU format attributes to support timestamp, context, and
synchronization controls. This allows userspace tools like perf to
pass detailed hardware configurations down to the gtrace framework.

Signed-off-by: Zane Leung <liangzhen@linux.spacemit.com>
---
 drivers/hwtracing/gtrace/gtrace-perf.c | 12 ++++++++++++
 include/linux/gtrace.h                 |  7 +++++++
 2 files changed, 19 insertions(+)

diff --git a/drivers/hwtracing/gtrace/gtrace-perf.c b/drivers/hwtracing/gtrace/gtrace-perf.c
index 56713c8ee850..703c12b95665 100644
--- a/drivers/hwtracing/gtrace/gtrace-perf.c
+++ b/drivers/hwtracing/gtrace/gtrace-perf.c
@@ -323,9 +323,21 @@ static void gtrace_event_del(struct perf_event *event, int mode)
 }
 
 PMU_FORMAT_ATTR(event, "config:0-0");
+PMU_FORMAT_ATTR(context, "config:1-1");
+PMU_FORMAT_ATTR(syncmode, "config:2-3");
+PMU_FORMAT_ATTR(syncmax, "config:4-7");
+PMU_FORMAT_ATTR(timestamp, "config:8-8");
+PMU_FORMAT_ATTR(tsmode, "config:9-11");
+PMU_FORMAT_ATTR(tsprescale, "config:12-13");
 
 static struct attribute *gtrace_pmu_formats_attr[] = {
 	&format_attr_event.attr,
+	&format_attr_context.attr,
+	&format_attr_syncmode.attr,
+	&format_attr_syncmax.attr,
+	&format_attr_timestamp.attr,
+	&format_attr_tsmode.attr,
+	&format_attr_tsprescale.attr,
 	NULL,
 };
 
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index 0a017f1f888d..76b1aa9cfe79 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -14,6 +14,13 @@
 #include <linux/property.h>
 #include <linux/types.h>
 
+#define GTRACE_PMU_ATTR_CFG_CONTEXT_SHIFT	1
+#define GTRACE_PMU_ATTR_CFG_SYNCMODE_MASK	GENMASK(3, 2)
+#define GTRACE_PMU_ATTR_CFG_SYNCMAX_MASK	GENMASK(7, 4)
+#define GTRACE_PMU_ATTR_CFG_TIMESTAMP_SHIFT	8
+#define GTRACE_PMU_ATTR_CFG_TSMODE_MASK		GENMASK(11, 9)
+#define GTRACE_PMU_ATTR_CFG_TSPRESCALE_MASK	GENMASK(13, 12)
+
 extern struct mutex gtrace_mutex;
 
 /*
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
