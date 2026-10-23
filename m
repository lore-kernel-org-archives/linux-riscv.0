Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02596606A31A
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 03:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CtHm8q2u;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Mdy4OiIT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ow0yyiH9rVHnz4N/KCat3LcNWdXOrC7Alfqi8EVakjc=; b=CtHm8q2uQhrB9wKS2KL0w2W+R9
	5SQDvDtnaR6EXeu6EdmSJTQcph+XA5TeoBKAISWjXUAmo3QRXEq0R32DpkWXJ0HzTcxViU4fEt2hi
	OdyZjkxkP+Evejqm4miELx1DQ0g4VV5EhdJAlOW378Ldln7hqLgxpLky/InqJFoccQz0wJQzVifPU
	PLDn7d4oQXAQVJpct0p5M0rXmhWnnkBbZ/3B0Dr1+TpwK+3ZVQUtPIlQJQUGKn0R1C/oNnDx1UufK
	XsIPfwzeuedu0RQZCN/3AOg4wD8kUSLgRvDb3OxnoGIzpTAU03JI9RjBPC6TsuqCAzdwYZPAitchE
	UefPB7vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5ld-0000000FO2T-31kd;
	Fri, 23 Oct 2026 03:16:29 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK5la-0000000FNz1-1oIa
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 03:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1792725347;
	bh=P7Y0HqqweaUG6sybM7W7gpXncgeyqYn9AypD9au0wmQ=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Mdy4OiITdaiG2WJLZrrTC9buFys62cIqd9I6asrWeVnjKqXRud8tLX+xj69DtjzwX
	 ECdct3lDUiLWTi2CRk5Wbb4pQdxNm+WFfH0r2iRr0ayUsMpmmglutOBRucDwumzO1Q
	 U+gFMqnLg1WGHtU4ETYA8C24zGucqps+Azs53kTQ=
X-QQ-mid: esmtpsz11t1792725340tfeabd856
X-QQ-Originating-IP: ur0wHfOUobow94QIjgQea66Gz3QbsRCxcDrMRSb18wQ=
Received: from snode5.. ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Oct 2026 11:15:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6433505646100044952
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
Subject: [PATCH 08/24] gtrace: add perf symlink support for gtrace components
Date: Fri, 23 Oct 2026 11:14:49 +0800
Message-Id: <20261023031505.2020925-9-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
References: <20261023031505.2020925-1-liangzhen@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NCpJlJNuW3CNNfQ4WfD4zqto1Iw4NW26qIGiE9L3ba2lH/lOd7MET1sZ
	Tx4EnDL+p0z9bYA+ONlaR2E/uQN/lRimGjLmUitU8LME1EB08UqX4nQExFj71fS0bFt8kUh
	Lk14rihabSLYbmF2DV0roJoMqCDtREM5VJdSvhgmKrCTFuFAv0dTw2lRea+D9kGTVcAI0DG
	wlFzzS91gkoKbJDt1drfHCvXAKH4+/hEOPer/uE1d1byvfcORJ6+mpvm2vrAK/HFdEKzwZJ
	FjZ+uzwXs1ZQXi6d3m87xiiHM1Ssf8f8ialb5KtxbZ3mmuPQKA3/YCRcipP/BYyLFSTD7bd
	bFXna17upuqajhNbPjfH1df9sMqLN7YYR0ecWs6lk+0owqS2qhIDxQwD4DnSD5iHINoubju
	NJpMYdyUUJjKFg1rx2md8wLr+ypR/HNTMOMp6Z8INHlkEWX6LSuribqeYrXdbXodPVM9bTI
	G+WkoFxVj0+YtehCUoEHOx+LSgOOpsfQvnfPoVgVF50R8WSEb/XSsB3C0vaTbf+QJ1uljhh
	fB7UAYxrKTrMNpx0px//DctlVV6n6LIQk2n9Q2lAxd+tBpUAiwcpVFeVF3FJEentdm4IxMk
	e0glo8c4bS5BXbvrUE2Klo/TPHKeSqwDHjtpTKJq6ngaQ2PuXaYhPcOAWvQPiCPg0ja2+3P
	d6ZLBPBZQ8G7Sqvt+gkTPnHB8H8bns7UDJuuIash8ShI8wf7V2OjUtu9pnhm4jyej7SmBjp
	0KtMNeQiE8vRLGicIBeIZ8GnEHtdEybZ3qJ5Dl+VD5whJGDD6bancqXliBxXUb7rs/Eu9b4
	0IQ1EOhmNybEfutyC6g+xGifMtoCZxTevz7GKO7iN3ydyeETXn9qXDirbuumTRll+ulyJLw
	wkLriNAv3UUey908l1Hu6yynEgGrWYpVvDpkv7kuhcNpTzzjgXvz2CD0/xDFzEmxSJZHtfd
	HGoGqT/mCox9C4mBcktkcovyA3g12fRDjkVBNOFAxclXzTIiogP7i1xjNyV9MDQrtOcgEnG
	hMfOjWrwORirOtgflflZUVQrfftOeSKzXd7jXJCfSEmEgM6naLguFaCfmO9tOSnFY7Y8uRu
	YASivDMBKcTuRm+ZxRuXUg=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_201627_001557_7694AD05 
X-CRM114-Status: GOOD (  14.41  )
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
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Implement gtrace_perf_symlink() to let RISC-V Trace encoder
link themselves to the gtrace PMU directory as "cpuX" based
on their bound CPU.
---
 drivers/hwtracing/gtrace/gtrace-perf.c        | 29 +++++++++++++++++--
 .../hwtracing/gtrace/rvtrace-encoder-core.c   | 10 +++++++
 include/linux/gtrace.h                        |  2 ++
 3 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/gtrace/gtrace-perf.c b/drivers/hwtracing/gtrace/gtrace-perf.c
index 2fcfbae9acf6..604b673a29d5 100644
--- a/drivers/hwtracing/gtrace/gtrace-perf.c
+++ b/drivers/hwtracing/gtrace/gtrace-perf.c
@@ -23,6 +23,7 @@
 #define GTRACE_PMU_NAME "gtrace"
 static struct pmu gtrace_pmu;
 static struct workqueue_struct *gtrace_wq;
+static bool gtrace_perf_up;
 
 /**
  * struct gtrace_event_data - generic hardware trace perf event data
@@ -351,6 +352,27 @@ static const struct attribute_group *gtrace_pmu_attr_groups[] = {
 	NULL,
 };
 
+int gtrace_perf_symlink(struct gtrace_component *comp, bool link)
+{
+	char entry[sizeof("cpu9999999")];
+	int ret = 0, cpu = comp->pdata->bound_cpu;
+	struct device *pmu_dev = gtrace_pmu.dev;
+	struct device *comp_dev = &comp->dev;
+
+	sprintf(entry, "cpu%d", cpu);
+
+	if (!gtrace_perf_up)
+		return -EPROBE_DEFER;
+
+	if (link)
+		ret = sysfs_create_link(&pmu_dev->kobj, &comp_dev->kobj, entry);
+	else
+		sysfs_remove_link(&pmu_dev->kobj, entry);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gtrace_perf_symlink);
+
 int __init gtrace_perf_init(void)
 {
 	int ret;
@@ -373,10 +395,13 @@ int __init gtrace_perf_init(void)
 		return -ENOMEM;
 
 	ret = perf_pmu_register(&gtrace_pmu, GTRACE_PMU_NAME, -1);
-	if (ret)
+	if (ret) {
 		destroy_workqueue(gtrace_wq);
+		return ret;
+	}
 
-	return ret;
+	gtrace_perf_up = true;
+	return 0;
 }
 
 void __exit gtrace_perf_exit(void)
diff --git a/drivers/hwtracing/gtrace/rvtrace-encoder-core.c b/drivers/hwtracing/gtrace/rvtrace-encoder-core.c
index 817535ff9558..17a3dde1314c 100644
--- a/drivers/hwtracing/gtrace/rvtrace-encoder-core.c
+++ b/drivers/hwtracing/gtrace/rvtrace-encoder-core.c
@@ -129,6 +129,10 @@ static int rvtrace_encoder_probe(struct gtrace_component *comp)
 	}
 	dev_set_drvdata(&comp->dev, priv);
 
+	ret = gtrace_perf_symlink(comp, true);
+	if (ret)
+		return ret;
+
 	if (boot_enable) {
 		ret = gtrace_enable_sysfs(comp);
 		if (ret) {
@@ -140,6 +144,11 @@ static int rvtrace_encoder_probe(struct gtrace_component *comp)
 	return 0;
 }
 
+static void rvtrace_encoder_remove(struct gtrace_component *comp)
+{
+	gtrace_perf_symlink(comp, false);
+}
+
 static void rvtrace_encoder_parse_event_config(struct rvtrace_encoder_priv *priv,
 					       struct perf_event *event)
 {
@@ -240,6 +249,7 @@ static const struct gtrace_component_id rvtrace_encoder_ids[] = {
 static struct gtrace_driver rvtrace_encoder_driver = {
 	.id_table = rvtrace_encoder_ids,
 	.probe = rvtrace_encoder_probe,
+	.remove = rvtrace_encoder_remove,
 	.start = rvtrace_encoder_start,
 	.stop = rvtrace_encoder_stop,
 	.driver = {
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index 3d769b405030..4bbe5ac835ec 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -437,4 +437,6 @@ int gtrace_disable_sysfs(struct gtrace_component *comp);
 int gtrace_sysfs_add(struct gtrace_component *comp);
 void gtrace_sysfs_remove(struct gtrace_component *comp);
 
+int gtrace_perf_symlink(struct gtrace_component *comp, bool link);
+
 #endif /* __LINUX_GTRACE_H__ */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
