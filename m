Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EF63606A31E
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 09:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gzGOlliF;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Wx+w/Vj1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cwVSBBom
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=w9GpjAj22VqVMh8TjC7D0/4wdssESuMxkjIsCeyEA7w=; b=gzGOlliFI7H0Lxihq6PpcAgopZ
	/Z8K5iRPAFr9tVNoRPa7FdsTKxWIng1upwes38AeM8OrP8NKieZUBP9YlbKZa9ig4c9eQkzKPAlWy
	6W1HbZRHPjVGFEk0NqaD7qgWXa3tpUZrThdktjOPup41JXoZ+JlR4FzSq40cPWC742F2ammOltmtK
	NXAWrN6YeEzZHrFKtu8XFBhy6YrDCHlWhIXaFVM9EqLPnWzyyVwoksFc8AMViUosdETqFfQn+kaQP
	C3uP450Y4uKwzkaKwu4VZM59AQNeW8E2SPykTatIeqNq85K1VmZPyw4osgIL7Cxtf53kADXH6tPTy
	Xi2yw12Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWDb-0000000Cegy-3Jec;
	Thu, 26 Nov 2026 09:56:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWDY-0000000Ceda-3OZ5
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 09:56:43 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7BDkM3548533
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 09:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0gHqynCP1e/
	J7pOrFVX3MzwomvRnH0tjhE7JkzjKmx8=; b=Wx+w/Vj1CQ+HgczuYa67jq3cnDg
	W0Q4nXuvO4KyynlqUJHw9o4Ge5t5PCqPW7x14Y5O5KIGTnGzrvzbjrFYuTpfJqQj
	woa0r7aRQcDfLemnS37AmxHpcyD1ESXb1jLB8ymonMIov5H0zJ3Wp6Khz9P8vask
	0dzu6UwOTxwIxpsaQ+vxSaKVKejJOurrTlXzm09bM+PLHunBQjOGZyq37hxhRJCZ
	7Wc0QLp/A+8ok5UPtIUjQcQC/IyvNqla2r2qU0TNu/j14yusQW0sDQrce6Wc37Bv
	CMI3Ns1xqylb0qIcU8Br1D9InQ7AZ3HMc9s6Q7inwuOqxfe55fgIC3MJCig==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vaud79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 09:56:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3b4208826so4862115a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 01:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687000; x=1796291800; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0gHqynCP1e/J7pOrFVX3MzwomvRnH0tjhE7JkzjKmx8=;
        b=cwVSBBomS7An5t7o4nwMtq8X14D0ieIVBgWZdn7WrYMJng5I+ZhucZgHQ/q+1x9TyW
         3Lj1qjrxsh5BsNBM6+nk1UeV+0lTak9HN+ZiQqUjH1f01JEhB+6mcXjfxB2FhFaILR1Y
         dZIc1JFf8qxfShJqNNnGV1eUc4uSRgaePUyUrPx6sUMfEihyL+WnhYJqhlWvvcxGvPSs
         uoM2WnQ2re14M2M1lDyjnY/fQWQbm+5WTnfUIUMVp+2eejIBzKBtIpb5C5ycSLkIJ9/y
         qowf7BbCDCGQG9rIVgNIrfdIPLwmv0nRbtAidmsY+PohTk7A6cwZ+RVgoz46JiS/J4Kn
         3c5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687000; x=1796291800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0gHqynCP1e/J7pOrFVX3MzwomvRnH0tjhE7JkzjKmx8=;
        b=KHJP+AKR2AHBazsnOvBjG7hjknPjZVhKhH2RhZW3JtlP0wbcDGX/z76hRX6gEqi2WT
         W88jknJpjbG9EEx4FSsX6hlmHxSrBwrFM0z3GkaRspuEsxgCDFC66/4uihl1Phnqa0Yw
         /F1m9SVQui/XgHnKePCA9nFb1nBRC8a5wyyI6u1fxG5QWrWDJxg0aTk/QN215diBbEwG
         6Q89V6oOTdpNz7EfvZpYr1C6mTgtlZLmtOO41mHtcyfJeBBYR95Q2OxgSyBc7hWNeAoW
         KXu0wI4CNqjk2S16e9mMvsHzGGxi5uBtaOIFuymFtEjEyXRawVvuHyOKNRvEOAGt1/Qc
         FzZQ==
X-Forwarded-Encrypted: i=1; AL+hErFKDs1ztq8BhMV4Diw3LqU8I19Dy+u8wIHM50Il3m0FPgRgHCxm1HHkVa4cW8jLEMnGudhLhtPLmBVruw==@lists.infradead.org
X-Gm-Message-State: APuU4Z85VHjwGsGY3bMhvRJ1vE+yio0kSSa0rAl5sniAbTXT/jXqyRUM
	6qCklMRppUXwGXROmM/DfxR1ZXyYzxsDP0r93D5oXiMp5KoNCFXi8+XRajBBVQf+ST38cgYmo13
	qOulE90tjJziDgM+DJ9R0+MTuWgJXBWBlxkVUmEswc3qILV5G9ceBph/mfJLU7c3evuqzEC8=
X-Gm-Gg: AZFdTZcIQNRmJ2XxH9SifdCbkVA6dIMbpDK1Tpbjix5k3JfI3Mkzn6+KnkaSk9QkmqV
	pw0anVNUEOPtjXamhgbb+u7WahOywXr8g6HLyzQEukX89DKi8QQdoEngOW6DZY3KQNasKbvyMkX
	e9dDmiZ6rlAUvynggKFJnisv/dBdMTrLV4kDHdb39A2wl/mksJHp5E/GOoxUorWQJWsNR1ueOBM
	30uk3vGDnpHM64mOoR24tLnW/UkBZg274QLZ2GGnvIh5YDdZXyddEquuA/srphblVnQoIyQkz29
	7AoiTU6Y4sN3NAh4zI4ZIR4gqYEsCsA/U79f/wfdx3r4NCkN5OpnFTtXFB/OBiM/YhaPJ/T4J6K
	690BICWs61b/SffIBjEGTyCecTOZ6LlOyit1j8/cJniGmfo0fTQpMujw/esfTQ6HMMxBsrIw41l
	gIA6QNmZNr+cqbRENi6LIsf0B02+FTrBxKYouJNU49r4OTql0IE+/epicaj4R8BqE1jwDXEsQAq
	w==
X-Received: by 2002:a17:90b:390b:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b41c56f34amr13282833a91.0.1795686999581;
        Thu, 26 Nov 2026 01:56:39 -0800 (PST)
X-Received: by 2002:a17:90b:390b:b0:3b1:d40:2c4e with SMTP id 98e67ed59e1d1-3b41c56f34amr13282809a91.0.1795686999021;
        Thu, 26 Nov 2026 01:56:39 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:56:38 -0800 (PST)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v7 05/14] gtrace: Add functions to start/stop tracing on a component path
Date: Thu, 26 Nov 2026 15:25:26 +0530
Message-ID: <6fcdae2ebe6a263f872357b2aff272f9cf7ebe32.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX0alDEI5muiTV
 9+2ckMBBKvbioPcZa9gknX4gS317Zm4mIddz/YSyKQIEJAqTfIpsQnP3QW856y/DoC0/QXbZoL0
 NtE69e/1pjwAMBKv9Y59Fx3xq85X1ec=
X-Proofpoint-ORIG-GUID: ymMdR244Gz2D1VSsv9fxyvtO2M_NtY3j
X-Proofpoint-GUID: ymMdR244Gz2D1VSsv9fxyvtO2M_NtY3j
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b080258 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=kiQ-iWSZUmGuUuZfK6oA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX6Kpf36ABZUBa
 CPdv6hav4QRL9tjS42567XVzoZoLxWUPe/xE1O82JRiKZx7Ua5Xccn98WyjuyK9r4XJd6fSVFPg
 VbC/3d69bTH7/vSq0aQwd7bXGahbiA7ncCkS1a1EgevLBIW28HA9sgL3cqs+gB5NT/mLEVGrjnz
 X1P8A6kQGiYjYOftzPsAQWR29fA4HFlzkgS9dH2/JkAjIiUvo2kiZbHpmyjfhZy5lMLivNM7FKO
 Woa+CK4TuWXNKRE+qnkDaUGD1Ssjg6hUY+sNq8Ff0CtlLmQsMA9Ypi1IS/GO5gBJt6HAMhOuZNr
 zJFW93zm5bxeXntw/HthKLqlgLyOZ90LdFyvmlgCwtQroDIbhbo7TcwN4GbHyR3D+D6Jd+17+jB
 1gE//RPvCeAe6xHqT9MhxEW717h7CUDUyuqt/DbqGnBDIlNMuqUUXWjyFkBart6qGFhsTsFSPh0
 I6QzlibSRj69lu8hQ6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_015641_778217_E2D1F82D 
X-CRM114-Status: GOOD (  25.29  )
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

The perf driver framework needs to be able to start / stop all components
in a trace component path during its operation. Add gtrace_path_start()
and gtrace_path_stop() functions for this purpose.

Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c | 128 ++++++++++++++++++++++++-
 include/linux/gtrace.h                 |   7 ++
 2 files changed, 134 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index 728235fc9bfe..754c5f71168b 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/percpu.h>
+#include <linux/spinlock.h>
 #include <linux/xarray.h>
 #include <linux/gtrace.h>
 
@@ -24,7 +25,16 @@ static DEFINE_PER_CPU(struct gtrace_component *, gtrace_cpu_source_comp);
 /* gtrace comp specific data, to be used by core functions only */
 struct gtrace_comp_priv {
 	struct gtrace_component comp;
+	/*
+	 * Protects ready, start_count and owner. Serializes start/stop against other
+	 * paths sharing this component and against driver removal. For a sink, also
+	 * serializes against gtrace_path_copyto_auxbuf().
+	 * Raw because the PMU start/stop callbacks are called with the rq_lock held.
+	 */
+	raw_spinlock_t lock;
 	u32 type_idx;
+	u32 start_count;
+	pid_t owner;
 	bool ready;
 	bool visited;
 };
@@ -121,13 +131,17 @@ static int gtrace_probe(struct device *dev)
 	const struct gtrace_driver *gtdrv = to_gtrace_driver(dev->driver);
 	struct gtrace_component *comp = to_gtrace_component(dev);
 	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+	unsigned long flags;
 	int ret = 0;
 
 	if (gtdrv->probe)
 		ret = gtdrv->probe(comp);
 
-	if (!ret)
+	if (!ret) {
+		raw_spin_lock_irqsave(&cpriv->lock, flags);
 		cpriv->ready = true;
+		raw_spin_unlock_irqrestore(&cpriv->lock, flags);
+	}
 
 	return ret;
 }
@@ -137,8 +151,11 @@ static void gtrace_remove(struct device *dev)
 	const struct gtrace_driver *gtdrv = to_gtrace_driver(dev->driver);
 	struct gtrace_component *comp = to_gtrace_component(dev);
 	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+	unsigned long flags;
 
+	raw_spin_lock_irqsave(&cpriv->lock, flags);
 	cpriv->ready = false;
+	raw_spin_unlock_irqrestore(&cpriv->lock, flags);
 	if (gtdrv->remove)
 		gtdrv->remove(comp);
 }
@@ -481,6 +498,7 @@ struct gtrace_component *gtrace_register_component(struct gtrace_component_id *i
 		ret = -ENOMEM;
 		goto err_out;
 	}
+	raw_spin_lock_init(&cpriv->lock);
 	comp = &cpriv->comp;
 	comp->pdata = pdata;
 	comp->id = *id;
@@ -692,6 +710,114 @@ static void gtrace_release_path_nodes(struct gtrace_path *path)
 	}
 }
 
+static int __gtrace_comp_start(struct gtrace_component *comp, pid_t owner)
+{
+	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+	const struct gtrace_driver *gtdrv;
+	unsigned long flags;
+	int ret = 0;
+
+	raw_spin_lock_irqsave(&cpriv->lock, flags);
+	if (!cpriv->ready) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	gtdrv = to_gtrace_driver(comp->dev.driver);
+	if (!gtdrv) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	if (cpriv->start_count) {
+		if (cpriv->owner != owner) {
+			ret = -EBUSY;
+			goto out;
+		}
+	} else {
+		if (gtdrv->start) {
+			ret = gtdrv->start(comp);
+			if (ret)
+				goto out;
+		}
+		cpriv->owner = owner;
+	}
+
+	cpriv->start_count++;
+out:
+	raw_spin_unlock_irqrestore(&cpriv->lock, flags);
+	return ret;
+}
+
+static int __gtrace_comp_stop(struct gtrace_component *comp)
+{
+	struct gtrace_comp_priv *cpriv = to_gtrace_comp_priv(comp);
+	const struct gtrace_driver *gtdrv;
+	unsigned long flags;
+	int ret = 0;
+
+	raw_spin_lock_irqsave(&cpriv->lock, flags);
+	if (!cpriv->start_count) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	cpriv->start_count--;
+	if (!cpriv->start_count) {
+		if (!cpriv->ready) {
+			ret = -ENODEV;
+			goto out;
+		}
+
+		gtdrv = to_gtrace_driver(comp->dev.driver);
+		if (!gtdrv) {
+			ret = -ENODEV;
+			goto out;
+		}
+
+		if (gtdrv->stop)
+			ret = gtdrv->stop(comp);
+	}
+out:
+	raw_spin_unlock_irqrestore(&cpriv->lock, flags);
+	return ret;
+}
+
+int gtrace_path_start(struct gtrace_path *path)
+{
+	struct gtrace_path_node *node;
+	int ret = 0;
+
+	list_for_each_entry_reverse(node, &path->comp_list, head) {
+		ret = __gtrace_comp_start(node->comp, path->owner);
+		if (ret)
+			break;
+	}
+
+	/* If a component failed to start, stop all the components that were started before it */
+	if (ret)
+		list_for_each_entry_continue(node, &path->comp_list, head)
+			__gtrace_comp_stop(node->comp);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gtrace_path_start);
+
+int gtrace_path_stop(struct gtrace_path *path)
+{
+	struct gtrace_path_node *node;
+	int ret = 0, err;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		err = __gtrace_comp_stop(node->comp);
+		if (err && !ret)
+			ret = err;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gtrace_path_stop);
+
 struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
 				       struct gtrace_component *sink,
 				       enum gtrace_component_mode mode)
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index 562cd1eca162..77b2835c1647 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -295,6 +295,7 @@ struct gtrace_path {
 	enum gtrace_component_mode	mode;
 	u32				trace_id;
 #define GTRACE_INVALID_TRACE_ID	U32_MAX
+	pid_t				owner;
 };
 
 struct gtrace_component *gtrace_path_source(struct gtrace_path *path);
@@ -303,11 +304,15 @@ struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
 				       struct gtrace_component *sink,
 				       enum gtrace_component_mode mode);
 void gtrace_destroy_path(struct gtrace_path *path);
+int gtrace_path_start(struct gtrace_path *path);
+int gtrace_path_stop(struct gtrace_path *path);
 
 /**
  * struct gtrace_driver - Representation of a trace driver.
  * @id_table:      Table to match components handled by the driver, terminated
  *                 by GTRACE_COMPONENT_TYPE_NONE.
+ * @start:         Callback to start tracing.
+ * @stop:          Callback to stop tracing.
  * @probe:         Driver probe() function.
  * @remove:        Driver remove() function.
  * @get_trace_id:  Get/allocate a trace ID. Returns a nonnegative ID, -ENODATA
@@ -317,6 +322,8 @@ void gtrace_destroy_path(struct gtrace_path *path);
  */
 struct gtrace_driver {
 	const struct gtrace_component_id *id_table;
+	int			(*start)(struct gtrace_component *comp);
+	int			(*stop)(struct gtrace_component *comp);
 	int			(*probe)(struct gtrace_component *comp);
 	void			(*remove)(struct gtrace_component *comp);
 	int			(*get_trace_id)(struct gtrace_component *comp,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
