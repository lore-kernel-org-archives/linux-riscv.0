Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B68FCC5AD7B
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 15:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ykUsIsL4R1z/X56XQk5e64Cded3uu9hCA/EHeQm9UXw=; b=oq0pNQMNz6KGm8
	PMMem3d/dVkjADK0CBSRbPqAAJr2Qk+kMuNWYy81SnevFt6BX7TvheO6837wOnv/ju3OFtALMFOBD
	WJRTOKX1Li+kAODZmZOalkFuPN25DIq7RN3/2kMRozYb3aGoUs5NtEMtDF2rWw9QQZoAMsJx1Gj6d
	YGaoQIEgkAVVH+Tyr67D8u7aeCsgpURXcleEsqgXvyQZBxnDcV0T1FMSnE4ZzljRGlWxQFOPRbJrJ
	9Orzos92tv+kyr4Nz1XruLeN5Hwc3Upektmx5z8QMZJK3NW4ivYSRCPhLHcp8VU/H+ITlnkg5Rf0i
	5pfgyK4eqFr4gPp5sL+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRrY-0000000CEvA-0Zyi;
	Mon, 10 Aug 2026 15:24:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRrU-0000000CEsN-21Yb
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 15:24:25 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACjHTH1959732
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 15:24:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SXSG2wb2TZi
	XtJzB1T1a7hCG1Hby4CtDQXZZTgX0OkM=; b=pFd32wVpll8LxNuLEM3A6bKTvq8
	IdnWlw/vm5muYzIg/eHeCWVdmBaig1y6KaGS10dx18FVuJEncjd/G3xk5tueB1Ao
	ce8c+Zfz5Fnwotkii1MBgibPz/vv9GILwmoM2V/igu+p//LtC5sxx06+rQVg27mc
	Zhtb1cyjKEabNie3/l/2EqvGlebsdeAvS5Xg0tSluHDMLmiMBKVNr/Xb6F970YCh
	8GP04comFwhrrdv6Qlj5tKGJ9EW30xyGBROpi5/dzh7OEbI4zoXooi5OSO+occeA
	yk/9IWA6DCVF3kK/vCFdb4XUCnrNocZLkO/lkH3GtL/c1GaIdro4jvj6V9g==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy18xu9ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 15:24:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so1382196a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 10 Aug 2026 08:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786375462; x=1786980262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SXSG2wb2TZiXtJzB1T1a7hCG1Hby4CtDQXZZTgX0OkM=;
        b=COHQAOczphxdFJ8PO/wOulg8kkAuX4YyAcqUCX0cBGvxyiAytWZcyKf3Zh4Ak6wLWP
         LPreh8Rq86NEwPaiy7oZ0yZeDCzPrHnIqVPNRQIcUqvoEI48bMjctgfv335Af//ct59I
         mKDNbO4pAlfLIyM8O/tgdFMnxCjBSpR3ADVURzDAlU/I0yI8dRIjSLEvRdO/IYP+gZvv
         ysZam+8blnkm1NdHxEpb/oqJgxHXKeEX0sxrfy2AfC0rdqCrQm+9CqxNXbqvHGfX/xcz
         jmsDaZbplX/UcVb5d0GaBqU+RoIsBHmtv6cTQFzewA+0H65yyIJEkJll10f2LoVooKIi
         fCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375462; x=1786980262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SXSG2wb2TZiXtJzB1T1a7hCG1Hby4CtDQXZZTgX0OkM=;
        b=f7dNYoFeoIIPfwsPRFvhIsoQCBAtSP7TLkPSSNw35v3c9jPOipkAz5mz/Rh+4Om/+m
         MnDgJzL5ONW/10vL1hG5xa9GbYp8g3m0spbOmAVOcE12uRrQU3S4a+fLb9H0a5YagFQ3
         54MK5FCVNcveGjFozAducBld6nhXm5gHC9Mmqpi0KfETYdSk7H7SmIRk+FoSeiCr6vRo
         2zC57I+t0b4W5SSzkSKoAtscJkgwNR4lUbo1A1MgD66WMZqXuiNDWBpq9FfzD/juTqQ2
         udtygzLzkhT8ZQiWrbwgMyE4TWTzMsRUkgV6vVc5MIMox88X2fpYp8jcih+NP2vmHIIp
         hDig==
X-Forwarded-Encrypted: i=1; AHgh+RpHCCK3xZmOiuK0VGv2zldmmI2z+MDJ1Xu0rN/7T2cdnyi3WDMoj13yTj4thHcYiW3tBi8sGHGrkXhbxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyaF4v6aQl89W6NLQw/NT8iDy1uxgWJjh7UZvH53GKP5TFOjDqG
	Z1a+32vArqJwHoyo7wbzPTNuTZoIWh/V6nVup9n6r1eVa5iHHKo5Idf1IevXUrwbbMVR2NImn/T
	sCLx8VryU4PD8JyJTv/iUtE3BJ56N5i9h/mLcKEnPPduTng5+bb6YQDAHavpbp+o2lo7NkHo=
X-Gm-Gg: AR+sD11Z9OxzapKViUC+Ut84P2Pzb6qdXqVAx7w+a6bM8a7+BUL3J1tEMMD8F92xRVH
	SL6qqxgrm06dLeymqj1fEWDIs71KEI4ZULrOl/IFi+Q9KxFnMbFbWyKqHIbhHjKCLZz/K7Lctx4
	DK2q7FVq2IHLZ1WgQbZtARiJCYD5gJ3celRp/hLZjxKEJnQlkeIsOzOpdLZzS3ottnvlo+psqkN
	nB2jgNpsagoj4rZbGZua90rdVSws+sffK36ZvoIhzIKb62Ae/2Wdw/RTYekXn4PXJ+u6+sTOYkc
	mTkHCfEtT5bBD2PaUwkyAwXmXUd0E1Jlr66BUNO+VNNLoRvWcADXqLHyZpZ3QA2T8g7bFSZwtZq
	l6RTN3fwsIzbyQV7XNYkeo8JrYdqRKOBsmxqlxQzG2Xs08By+DanbbC6Y5VYwn8fxR19zWurXmE
	hZyFqIY0xsJe3WrncbBKpubK89cg==
X-Received: by 2002:a05:6a20:7fa0:b0:3c3:76a8:c0f with SMTP id adf61e73a8af0-3cbce6f17b9mr20866811637.4.1786375462251;
        Mon, 10 Aug 2026 08:24:22 -0700 (PDT)
X-Received: by 2002:a05:6a20:7fa0:b0:3c3:76a8:c0f with SMTP id adf61e73a8af0-3cbce6f17b9mr20866754637.4.1786375461670;
        Mon, 10 Aug 2026 08:24:21 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-cbe8f1af985sm4282634a12.11.2026.08.10.08.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 08:24:21 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Alexandre Ghiti <alex@ghiti.fr>,
        Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Subject: [PATCH v5 07/14] gtrace: Add function to copy into perf AUX buffer
Date: Mon, 10 Aug 2026 20:52:09 +0530
Message-ID: <20260810152223.3946743-8-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX+hxrmb4FfJTq
 3HLwudGfoIJasXQvhAqhW2m1ug/3JEa4i3THtVosWm4AlJkksRQDp4wVmBEMvEieois+zR8L1kD
 tqUDzfHQE7r7qMSGeqSivw3PAqT+nBI=
X-Proofpoint-ORIG-GUID: n0jkLB_eV2wyBx488Vu19AMRLOF5gd8T
X-Proofpoint-GUID: n0jkLB_eV2wyBx488Vu19AMRLOF5gd8T
X-Authority-Analysis: v=2.4 cv=bfZbluPB c=1 sm=1 tr=0 ts=6a79ed27 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=MNQjnuzN1gR2RwVUj5UA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEzMiBTYWx0ZWRfX1BuNX2PqaYf6
 4Mw5W61WqFe+juL4uw59nQF5KuwSMrUWHTzX8l2S7gS2dDuItrf9mz7h639dHBPaGVZ5LL121YZ
 w30zGueHNS7x/4dIvUPNyVhjpztpwc4RRMb8QbE95EC9pVI+H+So/b9t7DvdrUw8jD4CLHTH7NI
 gD/yEoSrb24W83lwjR1P079yPusiRGptJMZv4pJaZU4uRHTUBsZ+/XIBEP6JX/ipcVY/Ro1cWTr
 TjhNnliM3BTTnRMhIwgMG5jsDJDxb4xUaknb2tme5sONaVy3/U6A8Q76yv6LNYF/B2LL6iAmCj8
 BxL/kLuQVkNypDYmV6NcMXNAhoIMC2uCyMpeypm+uufqs9EWZNgF9trDL0z5KnaphFXtoOPKTI2
 u5ytE2/wQBuYmfg8TrhwbD74z0ocbgLuySOP0uz9Z98rP/auv3T1zl7VhyyvZ84AEz47jxMV6mD
 g9hp4ULYgvf72kJHKIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_082424_655426_820C67AF 
X-CRM114-Status: GOOD (  17.35  )
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

From: Anup Patel <anup.patel@oss.qualcomm.com>

The RISC-V trace ramsink will need a mechanism to copy trace data
into the perf AUX buffer. Add gtrace_path_copyto_auxbuf() function
and corresponding trace driver callback copyto_auxbuf() for this
purpose.

Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c | 22 ++++++++++++++++++++++
 include/linux/gtrace.h                 | 24 ++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index 6ff1b3087947..53a3679ba69f 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -626,6 +626,28 @@ int gtrace_path_stop(struct gtrace_path *path)
 }
 EXPORT_SYMBOL_GPL(gtrace_path_stop);
 
+int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
+			      struct gtrace_perf_auxbuf *buf,
+			      size_t *bytes_copied, u64 *format)
+{
+	const struct gtrace_driver *gtdrv;
+	struct gtrace_component *comp;
+	struct gtrace_path_node *node;
+
+	list_for_each_entry(node, &path->comp_list, head) {
+		comp = node->comp;
+		gtdrv = to_gtrace_driver(comp->dev.driver);
+		if (!gtdrv->copyto_auxbuf)
+			continue;
+
+		*bytes_copied = gtdrv->copyto_auxbuf(comp, buf, format);
+		return 0;
+	}
+
+	return -EOPNOTSUPP;
+}
+EXPORT_SYMBOL_GPL(gtrace_path_copyto_auxbuf);
+
 struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
 				       struct gtrace_component *sink,
 				       enum gtrace_component_mode mode)
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index 78e2ead3db8e..bc82814e2738 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -257,9 +257,30 @@ void gtrace_destroy_path(struct gtrace_path *path);
 int gtrace_path_start(struct gtrace_path *path);
 int gtrace_path_stop(struct gtrace_path *path);
 
+/**
+ * struct gtrace_perf_auxbuf - Representation of the perf AUX buffer.
+ * @length:   Size of the AUX buffer.
+ * @nr_pages: Number of pages of the AUX buffer.
+ * @base:     Start address of AUX buffer.
+ * @pos:      Position in the AUX buffer to commit traced data.
+ */
+struct gtrace_perf_auxbuf {
+	size_t length;
+	int nr_pages;
+	void *base;
+	long pos;
+};
+
+int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
+			      struct gtrace_perf_auxbuf *buf,
+			      size_t *bytes_copied, u64 *format);
+
 /**
  * struct gtrace_driver - Representation of a trace driver.
  * @id_table:      Table to match components handled by the driver.
+ * @copyto_auxbuf: Callback to copy data into perf AUX buffer. The driver
+ *                 reports the PMU specific trace format of the copied data
+ *                 via @format (see PERF_AUX_FLAG_PMU_FORMAT_TYPE_MASK).
  * @start:         Callback to start tracing.
  * @stop:          Callback to stop tracing.
  * @probe:         Driver probe() function.
@@ -270,6 +291,9 @@ int gtrace_path_stop(struct gtrace_path *path);
  */
 struct gtrace_driver {
 	const struct gtrace_component_id *id_table;
+	size_t			(*copyto_auxbuf)(struct gtrace_component *comp,
+						 struct gtrace_perf_auxbuf *buf,
+						 u64 *format);
 	int			(*start)(struct gtrace_component *comp);
 	int			(*stop)(struct gtrace_component *comp);
 	int			(*probe)(struct gtrace_component *comp);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
