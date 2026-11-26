Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E136606A321
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 09:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dWuR5Dj6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XqF0juaE;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sz/Znive
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1qKwcM3vYgMBCFLCpJhDwaZECAkIMsxK6dTpBB80ijo=; b=dWuR5Dj61JNWqkrQcBEQcKCv3g
	JGZd8ukQLYPFJN5DQYeAZukaiNpGf3JlGeoyeQMADpk9cF3tgbncH2/JDe0n7JqN0+/UPOXsfROmy
	VgasiiKeRFJaKtZ4p9eDxjdw0LUf0MsXRtFjkdrUjYzOwIKZNt4r6AY077vLsylR54wMh3mcnOH4K
	WuVE55iwFpLK4TfpJekx19SHcDPF9jr0KZ37UUXpD2Iu5JypYetzjW/c3oKavpJzVkGddKL5LBBow
	t5N+0as1u+3nKQ1lTSi8wUdENDCQQy+nQWKUboKVKmQQ9eISC6hqonQ3enmJXxEHrs9gCZNPB09r1
	/wdQErTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWDw-0000000CexF-2rGK;
	Thu, 26 Nov 2026 09:57:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWDp-0000000Cerc-2EUA
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 09:56:59 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7B2W02175756
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 09:56:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+crTlNC0lbP
	a8pWvtZ8JsD7yZpwNswzgOnluEg6w6YU=; b=XqF0juaEDFRjGukOOdZlnb5Pezp
	+kHyIY49U+ZlHDYS0RTH+Z6k/pjUIBp4G9B4PT3hxhKY5j1SZ1939t8+o49lOvdO
	bwJ2GffkfuHxzgnrSB42QycFV9LucjgcvCpTzRgaSA+SxUZxnDWnbk1MTxGyFB3I
	AQLNcEF+u4bAW5n6sIl4goAS//OmxMcieUgt9TvXYHbQYfyboN0nYHCRFVnrJP3j
	6xj/JLWSWdNQ8bzYFKwuJpNagBtTjD+hfVYGcmALyUg+WOViLVJyh276NvMTQtI4
	4HtxF9orzD0LnVYdUuT9jUR8clAqK+dA0Wl3W3ZxAEKPxtVe32eG0MpqxCA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahuvr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 09:56:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae19907a31so6557987a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 01:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687016; x=1796291816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+crTlNC0lbPa8pWvtZ8JsD7yZpwNswzgOnluEg6w6YU=;
        b=Sz/ZniveRORgsv85ihFkjdU6D5P9aSkHsdXgnqhi/ypYRTTqEYhxQP0bHu8pOgEec4
         vEzLSDXoZgsdp1ylNRFr8YBqTxVChQeuI1EsYMBpSLkXuC6/xmCL455Ovkyq4ciCBVqK
         1tlmExs3eOWg4BFstvsniyY3vTSdgYNBiFiXFs5MWJ2qL4wE4uZxlGdhdbFHz+Xwueb/
         3lQEd5O71ZvKkM4+4T6fZhjKMluGGrxza22T80KCBpP2JuGlNDOBZE189+0Vu/srgzyu
         MaZ6+QYNecLFtqZIyf5RShWo55VYX6o0KHgv76e3Tz/yaf8UTSJoBlNY2D5hm+dV/6+P
         7Ing==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687016; x=1796291816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+crTlNC0lbPa8pWvtZ8JsD7yZpwNswzgOnluEg6w6YU=;
        b=dVPKC3d4j3V/bFTE/Wu2sb5/I5dJpVIZ5v8+j73DRq8ktVy9VY8LXKwzn3PrTXS39X
         blcOi8plnoskwZJE0EKhMwHzdT9oeOraWQxdVYhaNE8UuF2C9Pl6PrHW17TwBBRWcd9M
         u6torZhy8Mw99dD2e4FPZl8sOtJ+zYH6ymeg/tVzitpj2XQcZvihb34zi1CgekItElPP
         Q4oo9buubqWZifKtp1yh6Fc7ZPcAYPAphkxrg5IqbJp054OSKvaupjNjVKxSRtkj7uMl
         Zj6KDaBp20GiBKvlGR/rKrUttAR/JPoBlzN4t7JuD9Bj9e5kv2Ss+C2zY+ij6r4gOzay
         CXXA==
X-Forwarded-Encrypted: i=1; AL+hErGkdcU+YFtDmpFcveo09okJjueizGmmiEgtamlLVWsVXpg6z2BK/36ZjOGino7wiwO1+0yl9igR32lx4w==@lists.infradead.org
X-Gm-Message-State: APuU4Z+DH+MoeDPtf0mdes3q2rh/9/ixUI5vJZ5eJs3lfVc1wZDZvhka
	iktnVhp5aD69Ad+/QYTi+9Ykl+s0UmAJ1QQhThxzuiiwjOdAXyPRYlZ+urCKez0lt8RxcxsO92l
	D/hx2pYfsbG5dpwRPradzI3EAgOsZSeHZPDVJtl0ez//jNei2bAm/3I6xu+qfHdsKfQSWmjo=
X-Gm-Gg: AZFdTZf8k8N9WYLag8jogCX6OdzFxXJ2nkj/w0+4yqN8lg+Hw3ZfSaI07Yqx3inYhgY
	03Yd21pJI1+98roZEwLpSuoYSmyVBv1OiJnmoYlKcoDtZLQ8P2Ml942cHN+X4JPXo7gN7uJUo+W
	ZjLp84/JOEFvruu0mWQTNIwcsMF8hDSaleaRyLurW9TiUYGKNww+hQWK1SyvWATSm5yWUABtuNR
	Ee7c+PeBQFTSC6zEwzNQ0bDdSqYdH8y6oMtZqfjfYBi1qxky4hSVeAW2t0PZxkRo8AYq133Esh4
	A72thq6SSBXmJlPHTPgCtP3lfHzXrC9gKUzjuk+/h+z73UpryfmBgo80znXOM1of5XGVg77Maqo
	hWS2PopZjY5HHcSP5z8CBo2l/riNTj+sahz3H4Bos5KPFqEyTzXyYuPQcHT0dBHfi8V0u9pYK7q
	icYvVZNUVXEZWzSFUZjW25TuI4VmE8CXNwOcRJsF2f2CMC+lrRYROz3h++0M7D8cUWUbZKWXmRH
	A==
X-Received: by 2002:a17:90b:3c11:b0:3a4:7195:ecba with SMTP id 98e67ed59e1d1-3b41c907eb4mr11742361a91.20.1795687016153;
        Thu, 26 Nov 2026 01:56:56 -0800 (PST)
X-Received: by 2002:a17:90b:3c11:b0:3a4:7195:ecba with SMTP id 98e67ed59e1d1-3b41c907eb4mr11742331a91.20.1795687015626;
        Thu, 26 Nov 2026 01:56:55 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:56:55 -0800 (PST)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Ian Rogers <irogers@google.com>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
        Anup Patel <anup.patel@oss.qualcomm.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zane Leung <liangzhen@linux.spacemit.com>,
        Leo Yu-Chi Liang <leo.liang@sifive.com>
Subject: [PATCH v7 07/14] gtrace: Add function to copy into perf AUX buffer
Date: Thu, 26 Nov 2026 15:25:28 +0530
Message-ID: <115ef070f1edfe8be3e7862dc4c90ef9eb19d568.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-GUID: nieQyK446otf7UrnodA9BSOGWcxJLm2g
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX+OWx2CQa3nNT
 nhC5hEP4bdPRxqDn9+Ygvd0QhvMQzpy6OGLEQeYL6A7rpKxfX5+Fh95ThokYlm718dMflv+AJBd
 /phnkRo8QOsivbwtqzE29uDA0FxZEjA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX2A+VZQxRCtYH
 9UNtk4x1QZx+hWAAHVaEios7uJ3yVAhxNGMSVOyviBYReW4xdCiw56nGkFoN+KC/C8QTeBMDJXt
 Pqo4xWSuSZOocJphxBvpTAIiRld3dCZXIClbyIN3RqJqUR8CTGXJt1TixjgonvALPlTVzp+5m/0
 bbwN/dznIT4C37M5EYuDND+7G92y/9WYQW9ExPtAMTqmZjJflpk5ZsdXkP01GVCauxxB2haw2kP
 slUAee4dNwteTcqW9Lc6N7zjrpBL7gsVoBRFFqfWd2myTRXXDat7O5p91eGt4G7WI/dbRqGaMFg
 u66SbyPWfqBOSDEgE56z68tzrsLeR5OLYW1z9EGXmZgjhWDAsVRfszPY3vQy4puk0Lhocg9cBbi
 x0fKoT83Q1yCwaXX77DtkMoqHplvwa+qpleOKh0O9Pt/FOW2+C1J/mmpFTNEoOFT04q2/uwch0h
 gFUxnAHQ3CCcgbdhgZQ==
X-Proofpoint-ORIG-GUID: nieQyK446otf7UrnodA9BSOGWcxJLm2g
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b080268 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=pFyQfRViAAAA:8 a=_A7cn5ShWJPA6JD9j4sA:9 a=iS9zxrgQBfv6-_F4QbHw:22
 a=oJz5jJLG1JtSoe7EL652:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_015658_038915_C1711FB6 
X-CRM114-Status: GOOD (  20.02  )
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

From: Anup Patel <anup.patel@oss.qualcomm.com>

The RISC-V trace ramsink will need a mechanism to copy trace data
into the perf AUX buffer. Add gtrace_path_copyto_auxbuf() function
and corresponding trace driver callback copyto_auxbuf() for this
purpose.

Suggested-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
Co-developed-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c | 42 ++++++++++++++++++++++++++
 include/linux/gtrace.h                 | 31 +++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index 754c5f71168b..af282cc95b55 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -818,6 +818,48 @@ int gtrace_path_stop(struct gtrace_path *path)
 }
 EXPORT_SYMBOL_GPL(gtrace_path_stop);
 
+int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
+			      struct gtrace_perf_auxbuf *buf,
+			      size_t *size, u64 *aux_flags)
+{
+	struct gtrace_component *comp = gtrace_path_sink(path);
+	struct gtrace_comp_priv *sink = to_gtrace_comp_priv(comp);
+	const struct gtrace_driver *gtdrv;
+	int ret = -EOPNOTSUPP;
+	unsigned long flags;
+
+	/*
+	 * Copy only after every path using the sink has stopped; otherwise the
+	 * hardware may overwrite data being copied, or the same data may be copied
+	 * to aux buffer twice. The last path to stop does the copy. Holding the
+	 * sink's lock also stops another path from starting the sink before copy
+	 * completes.
+	 */
+	raw_spin_lock_irqsave(&sink->lock, flags);
+	if (sink->start_count) {
+		*size = 0;
+		ret = 0;
+		goto out;
+	}
+
+	if (!sink->ready) {
+		ret = -ENODEV;
+		goto out;
+	}
+
+	gtdrv = to_gtrace_driver(comp->dev.driver);
+	if (gtdrv && gtdrv->copyto_auxbuf) {
+		*size = gtdrv->copyto_auxbuf(comp, buf, *size, aux_flags);
+		ret = 0;
+	}
+out:
+	if (ret)
+		*size = 0;
+	raw_spin_unlock_irqrestore(&sink->lock, flags);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gtrace_path_copyto_auxbuf);
+
 struct gtrace_path *gtrace_create_path(struct gtrace_component *source,
 				       struct gtrace_component *sink,
 				       enum gtrace_component_mode mode)
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index 77b2835c1647..92265efb07f2 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -307,10 +307,37 @@ void gtrace_destroy_path(struct gtrace_path *path);
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
+/*
+ * size is both, an input and an output parameter. As an input it conveys the max_bytes
+ * that can be copied by ramsink and as output it returns the actual count copied by ramsink.
+ */
+int gtrace_path_copyto_auxbuf(struct gtrace_path *path,
+			      struct gtrace_perf_auxbuf *buf,
+			      size_t *size, u64 *aux_flags);
+
 /**
  * struct gtrace_driver - Representation of a trace driver.
  * @id_table:      Table to match components handled by the driver, terminated
  *                 by GTRACE_COMPONENT_TYPE_NONE.
+ * @copyto_auxbuf: Callback to copy data into perf AUX buffer. The size parameter
+ *                 is the maximum writable byte count, at most buf->length.
+ *                 Returns the actual copied byte count.
+ *                 Reports AUX flags via @aux_flags, including
+ *                 PERF_AUX_FLAG_TRUNCATED when data is discarded to fit.
  * @start:         Callback to start tracing.
  * @stop:          Callback to stop tracing.
  * @probe:         Driver probe() function.
@@ -322,6 +349,10 @@ int gtrace_path_stop(struct gtrace_path *path);
  */
 struct gtrace_driver {
 	const struct gtrace_component_id *id_table;
+	size_t			(*copyto_auxbuf)(struct gtrace_component *comp,
+						 struct gtrace_perf_auxbuf *buf,
+						 size_t size,
+						 u64 *aux_flags);
 	int			(*start)(struct gtrace_component *comp);
 	int			(*stop)(struct gtrace_component *comp);
 	int			(*probe)(struct gtrace_component *comp);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
