Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD009CA5FB3
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 05:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ef3CyPyqYft7S/zYwOPaaD+I2nX7SG9JxD/KHtG/YJ8=; b=lk6LpOcxfY62hJ
	VRRVX+k+j4PLqH9NH55mmmdOKkY2f1vfyYEu8v3CUc/kL2Sabc9YUSIhOgJE3py2UcXMAIcQKSHPa
	hC7SU88cuB4pRk6qMVsTp1+151GagrXRCnT8k9t+UXpcmy2CQLz/LpPa5IjSBVOLN6a+s+OOCOVj8
	2z3ybIovxD6wkWFcFNpfzanuGa42Acb42r3AkT1w/VJtJKwzc0dM80bTYewvXkKnu+lE7qAq62r04
	kpPu4YU8NXuE7Kg+Z8dpgq5MTKCCK2nc/gEtmfPNviaoBGWfnFgX8jleP4zZbwytgj84lLVrRrtGj
	+xFKbdtrjXo9luDIxvkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9Ha-00000007nnq-237u;
	Thu, 01 Oct 2026 05:24:38 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9HZ-00000007nn6-1G3I
	for linux-riscv@bombadil.infradead.org;
	Thu, 01 Oct 2026 05:24:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HZjVRtF8Ja3Eebp0/BccuPRRLSdbeb1VPoYbtbjst2g=; b=SXnwrdhubb1dG3s95PVxtJeR56
	j6ZZM1Am2LiblrBMBTsNOsOq0UWTWk8NJgH+sKAwsGbKf4Lji73ciV5foumFDqHX5RvuLVq6vyRXy
	+Hj50/TrltZFvzQegGJ34vAejjEq1asFg9hi51Nq2oCwfYqFCXy+EEeEXy3CZFsigTkyImeDpDu6K
	Ah8+PtJTZPllyq2ZT2MqdWk2sHzUPBApug857FchDRtNZ1WBjbMZMyuOFviqxW1zTVHs31RdeMdnr
	g6/1BuPYRRhkHOKBe/VlroskC31miKgOUJcTpuMBsCuegcMbuiezYjLsK5/z0mDP38DOXsTS6Ep7I
	0nsJspOA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9HV-00000005Sjj-1QK2
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 05:24:36 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913gXYQ1089225
	for <linux-riscv@lists.infradead.org>; Thu, 1 Oct 2026 05:24:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HZjVRtF8Ja3
	Eebp0/BccuPRRLSdbeb1VPoYbtbjst2g=; b=MuGXSLwfMJan8tpwaJeqJ7exgtH
	17939RC9gawl2BdnmnSXxzNkD7BZ79HMf6btYMKtNMm7QS4EkSG8xkwQwETWT9/b
	ppmKu9gXgRcfohdUFGSmuG6KmsBFQCog1wVTm1uEq6ghQGPP3n2AfTUttCbRmD2Q
	NyWVOBfp806/QxGOyMOyE+oQ9qrCierf6JW/QPCKQgMkhUzQgg8WV51NAUreCNRa
	r1kkyMLD3sdbBkVhGICyUDF0qXP/ZNlYi8dgiOpGo0xlfmzVQgYsiy4qQbMUDqGw
	0KqgrKYJwtdGRvMI84Zom/u8EvD1R/U833v/XKpQlXIit415H5ueS9YjDRQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188ssw9n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 05:24:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e2e7425601so4900255ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 22:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832268; x=1791437068; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HZjVRtF8Ja3Eebp0/BccuPRRLSdbeb1VPoYbtbjst2g=;
        b=S/ZRLeIJU3oFkAWMyefalJ+FUAZBKQQUN5UuA55Xnc3FFA2CtlgTyWO2/29t04GA0R
         L8q3W2SPLz0M13xClt23o7AXFQ82iYazdo2aAWI0NVgNNt7TW2FTE+Cdntl8+I/gxOrX
         28Wap2D8+s4VSOwLfMD9/t64CzViA+QIO5fAvadcSFNaGLpsgXyteskl+RRgF1QjkbFK
         7g/45QJA0fSg7KiUPej2+5V+dO0jH26VmWEvpyeqlX0ejp/znIMs15GH5QhlE6AdPGvS
         fEZYpX7e5YSVAuYmUqussA6OO6xDt9Vcq2Po7fWnwgoE136hv6oCQ0uDcIuZRakQfakR
         7Gsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832268; x=1791437068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HZjVRtF8Ja3Eebp0/BccuPRRLSdbeb1VPoYbtbjst2g=;
        b=ZmPXI8Cu5JWzyqeb3PFtXqyJSY1yhfz7ekoO+SQlLwEhm+Qfc8+hEjhl+7N7cd17/7
         lhuIlPNfn/ZwCDuj5QkS3MPTiE0fWXCAjSz+Jl32I3D9DzpPa5dnatPptd/ARf0IyrSh
         UdJgOvp1eolB1EDW9wTz6cJLr5NedOBtZTPcZP2CeyduSO1tTmNHtGug7LejKP/JHRFW
         ZBULzn8pFheYnrSlMW+I9GfVcZiAif3GNFCUHY/ZxS8ji5z+bEui8niLtvwn8gujc3Fn
         bw6t/2/lEe5X2ANLtOzvze7FCJbaF4GkA1o29X9Zl2DuoX1P+iFws7Nsh6ImyrqmKQQy
         RPlA==
X-Forwarded-Encrypted: i=1; AKwUvBwYRFHmsibFrZLS450p96mmgNP886LkTU8lNSQxTCbJGI5gvctSHVfa7L8O0JiB+AVRbyjimXRST+oZ7A==@lists.infradead.org
X-Gm-Message-State: AFq9FYIkex+h2/FqhjS+m5qGbNUjbylqO0p/n2GUUgUyPw649huTBsGJ
	ItK7F8TvlOTkAll4PAQRppmE5MGeSYvfeEams1hCXATiqP+GKlumwSpT/0GGtM6oVmAymJACRa1
	ft2fGPg1zXpOgyKozkR0EDi9wIOYkgS3HDfENXHD6hBPFo0/ZNwqHj54gL92ZbHpMc9ND4Hk=
X-Gm-Gg: AYBFou2/mw0sQ+MXaNMbISv3TL8AD0nOd+KOqLsXSSSErPbHCWciHtDT6BkHGZacQOp
	h5tZCz3kGQUo9jdXwNh+PkBrh7iUfeGv8YnR250WwDNlGCNbKQFXttwEowXu7gazmEuyS94959q
	9c5uX/DJfkWUfH8jhwuyVBKZxAwHmIxEigmrO6PMzR78T6Yzq/rHKI4ppYgrlO5B0JyqArqnV0i
	RGTt/1jEkCVcHOFEvbU6a5HCVQEu/l3vOXltHiN6HDZkNtVktAYvkQ8WN8TY0Onl3s4MAebmdoH
	ltHCXomzZIIIWTywoQJQd4OFDk+dvkfC0m8YSQ09TQjGC4qvqrmS8wLhDFns0TsCNUEFn+GaBya
	cwdubTRaeqCE5n+p4ghTq1csDiqUvCTHxQbeKqg9C7sbU6G7T5AiWyGRwCAm4Ah4pKtbKdlKKw9
	VxhdoN5ag0NiBJWBPnb1vjK+Ry
X-Received: by 2002:a17:903:2407:b0:2df:9489:83f7 with SMTP id d9443c01a7336-2e3004226bbmr9535345ad.40.1790832268042;
        Wed, 30 Sep 2026 22:24:28 -0700 (PDT)
X-Received: by 2002:a17:903:2407:b0:2df:9489:83f7 with SMTP id d9443c01a7336-2e3004226bbmr9535315ad.40.1790832267519;
        Wed, 30 Sep 2026 22:24:27 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:24:27 -0700 (PDT)
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
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v6 08/14] perf: Add gtrace AUX buffer trace format type
Date: Thu,  1 Oct 2026 10:52:19 +0530
Message-ID: <20261001052243.3042627-9-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX4NxJZBdHXo+O
 lpEf81trUq/tfZMJ39zlbAXa4FyPCM9eGP9EMu7ZyBF7iBmdjXgBlnzJxbZBNLJwjOLlaBTkQEg
 nl3LaL1ixNWgoCY558uwfHoROR2WmbM=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abdee8d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=EjOQMhZftjg6WCmXgxIA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: C4f5NLc0xNaLBazcGeJAU-f_71QICC2G
X-Proofpoint-GUID: C4f5NLc0xNaLBazcGeJAU-f_71QICC2G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX0YDt8eENCaJk
 h/A2ISt4HzJVlmZ2Aq9ON9zGk7e4rkn+/DGeDe1oVVX9v16OLkMNMym9V1OSIJmpfiYN38YwAVH
 +S7wTysoCwj9OQxybBrqjTXSIhrvci8qZppGG/acZN5fIq0MXNj70GRUxNjhZdu2tltAc4R9c/Q
 6wDdNcMwGQMgRObusv097twNgh5zDk5cVYFeumEL8/uZJQbSjeSAUKQUHDEW2HBWgFjYwLdVFKq
 U4YUhFfEMDZNRACCL0LW+79dnxL/bGT8FryUqea5VjQtf+Fj0h2ILEGJ38wyGVtiPArGSB8p/O8
 JU0k+d1INN+RPK0bowFUwoyqcrJLLr7rpV7PqydRTQUe+YqJDxqzjChOPFVEbROmKEm9GsME7OB
 E0SatPn1IEcArtpRjFUxB6wuY1aQDIpnFo3L4BHndhTpOxJDjJ7oF96EunmuA5fX7ZKBi7jTXVd
 h1P5wpBa4W0MCiKHWgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_062433_604975_C5B356F9 
X-CRM114-Status: GOOD (  12.72  )
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

The gtrace PMU can host trace components of different architectures and
trace protocols, so the recorded AUX data needs to carry its format as
well. Define PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE for the RISC-V E-trace
format which the perf tool can use to decode the payload.

Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 include/uapi/linux/perf_event.h       | 5 +++++
 tools/include/uapi/linux/perf_event.h | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
index fd10aa8d697f..2ac00a409a04 100644
--- a/include/uapi/linux/perf_event.h
+++ b/include/uapi/linux/perf_event.h
@@ -1311,6 +1311,11 @@ enum perf_callchain_context {
 #define PERF_AUX_FLAG_CORESIGHT_FORMAT_CORESIGHT 0x0000 /* Default for backward compatibility */
 #define PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW	 0x0100 /* Raw format of the source */
 
+/* gtrace PMU AUX buffer formats */
+#define PERF_AUX_FLAG_GTRACE_FORMAT_UNKNOWN	 0x0000
+#define PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE	 0x0100 /* RISC-V E-trace format */
+#define PERF_AUX_FLAG_GTRACE_FORMAT_NTRACE	 0x0200 /* RISC-V N-Trace format */
+
 #define PERF_FLAG_FD_NO_GROUP			(1UL << 0)
 #define PERF_FLAG_FD_OUTPUT			(1UL << 1)
 #define PERF_FLAG_PID_CGROUP			(1UL << 2) /* pid=cgroup ID, per-CPU mode only */
diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
index fd10aa8d697f..2ac00a409a04 100644
--- a/tools/include/uapi/linux/perf_event.h
+++ b/tools/include/uapi/linux/perf_event.h
@@ -1311,6 +1311,11 @@ enum perf_callchain_context {
 #define PERF_AUX_FLAG_CORESIGHT_FORMAT_CORESIGHT 0x0000 /* Default for backward compatibility */
 #define PERF_AUX_FLAG_CORESIGHT_FORMAT_RAW	 0x0100 /* Raw format of the source */
 
+/* gtrace PMU AUX buffer formats */
+#define PERF_AUX_FLAG_GTRACE_FORMAT_UNKNOWN	 0x0000
+#define PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE	 0x0100 /* RISC-V E-trace format */
+#define PERF_AUX_FLAG_GTRACE_FORMAT_NTRACE	 0x0200 /* RISC-V N-Trace format */
+
 #define PERF_FLAG_FD_NO_GROUP			(1UL << 0)
 #define PERF_FLAG_FD_OUTPUT			(1UL << 1)
 #define PERF_FLAG_PID_CGROUP			(1UL << 2) /* pid=cgroup ID, per-CPU mode only */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
