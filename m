Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E65C6CA5FB3
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 05:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AqIn86JNwxru19xV6AMAoWPsGfe3HqBQWXnZkjhX34I=; b=u+0D9130kvLvkw
	ufEEiK3/Ic2uRO3iQ53LHWVyMvuT6/z3QXCusoCFAiDG+5fZlKXCL2b8HeWRrQvl0t4xd3bCpYguM
	Z0yjrw7ZjkuwXoskx63JH7I24RnCcDRwaNSJJIDYgdXUBYMoelBOkhRFTWhM6Q9UPGEQaNV/llmx6
	LFS1YwuyFyEKW5sEtD9Us9grFyzOFIJ9q/jwYALS1nyZqTyOxo9o2zv7N8aPpO2Q/faefLH3IhvNr
	xckp4cJZ0q40OXzZLeLGZxNWKs8srZTh+MAr3TXRo5DVDfZW/cUNxlXBF5lcPYcH2e9hLIS55avvN
	n01h/RVbkOYHS0kgRYIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9IH-00000007oOD-37QA;
	Thu, 01 Oct 2026 05:25:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9IE-00000007oKd-0Zjm
	for linux-riscv@lists.infradead.org;
	Thu, 01 Oct 2026 05:25:20 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6913gXYc1089225
	for <linux-riscv@lists.infradead.org>; Thu, 1 Oct 2026 05:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=q55aiCcFgIH
	x6hiu0PyATGC9kqjNrh9qZcfBmGGijjA=; b=XqO5RFMJDnX/m7Rj2cHGHSQ10Ic
	zTwF5bqkuhJYCWP8TBr3QD+r4OzR8ZGII3nlcFVUzXKpWXiwoGZANt7/dbFKqsxu
	Z7tytmV2+pzoBvwPZBBIWVdd658LKtjB0R0VoLsKUF8GoV8Z76txmhA0u3xkoqAZ
	GHBn1NPRJbwOgI9Il1OiFAIQiu4hFfgPSHcQ9kyq7JBTDr/S22KqjwTdUnWE47cf
	UAJ5ITdID9lFuNEAzIyClH1ElwMseOeIMyckcgZGFIcZhhPOIRl3/HDnLF98LYec
	/bhuFOQb4auuqwYClMufud3Ew8MVAh7J/+LwWlj3w/HzIEt730GIihXHDWg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188sswev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 05:25:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df5a65671eso6108505ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 30 Sep 2026 22:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790832316; x=1791437116; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q55aiCcFgIHx6hiu0PyATGC9kqjNrh9qZcfBmGGijjA=;
        b=FDCamu8w8bqpt3Mr60xmNOb23gfgNXvYIEp8uqbzD8UisRGCoTqiqnRch2kTjX5gvR
         z9f/6rQSTzQLCrpHjMfo2erVy1bcczdgE3ZTA6IftVbZ74/Fryr5RD7fOmzk+EMSo4gC
         5K2Km5NSSrGPgIZM5Yoq4N14WOuvDLWQuqC5MYMfobYX8tNwJqCExSMBHaMcmX8IsWJ5
         tgELYBcLnNzflOAMSUG885Xo7LhF0F7bgC123G3VONVuf3yEqDfPmBICeD9qYFI4FE7F
         ICRgB4EbnGhSAETx30/5UCxkv+YOXHh7xe3v2VTfalkJSo+bBW64ew9ziqpoQ3HyPye3
         q//w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790832316; x=1791437116;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q55aiCcFgIHx6hiu0PyATGC9kqjNrh9qZcfBmGGijjA=;
        b=H9Fga2nOvT1GaKRw4wXihiw6d8+s5ncB21wsUFhNdhMi5cLDa6AQb8MVrbXLnHxhfm
         SN3G65UdNKbadwoSfgbmQnsSHcc6rvi8kL8DuRRv+K3xGErDqkL8CmNDAAH/LEA984c/
         OMQ13k3lGHJJO4H67OKIiE5qdAsUCOcp8Zuege4iCy5iBXJAb8sr2UCsYr7K6K10QTjC
         j3rj4OTJ4Owm6ImIjTJ6o1Pfwt0BZpyNMom5v5bgIdm9xJu3JaMdrttNzRfF1iz+vyt7
         fLQbf31t3m89xF2tSdz0mOrHnMFjVmshc69WI/PrEtboPAzMkaCeYetl6on5LANFuFRY
         f7FA==
X-Forwarded-Encrypted: i=1; AKwUvBz7SGoidYnXQTuMaLlFJzlsmuXnKZUjx8Pi8G5Bb6p2LaHESvOtlaVFSyeyRtVKU0nE7rXoXQbClboF5g==@lists.infradead.org
X-Gm-Message-State: AFq9FYK6wUB9pVKAmGOX/CaXvzfMG2GBYaKnQXkPlYcZFUd0qrVDO6sw
	yf+IMGNrq4bzfEDQCywqZ0cgM8tVAExG8oMyyuDkOrG7x+alwwM7eKUnSBruf366GSG9Np23nFj
	em7g6VEk0zpcIDjPuf60NC+6IY/Pj9/y/4oRdvgVwp1asDSKONx+Jhd+Y9Dq9jwZsJr+FHQo=
X-Gm-Gg: AYBFou2W9GBrU2mioRGofS/VfiRcyuU0K1guMqYh86d2K2fXmxhiuRVeFzlcBUaL8JM
	b8IuFbylzlH4OXJdbkob6uSdqCgAnE5jtS64pGXgLPJCIWE5EghpcoZNtYSdldJzfW15Coiw1+T
	x1uzBMs+3UsiUNxng2OlGZz168t8VzYdZolSa4VzaDwkFPJzMcpOjkFSQQjEYXgksqesttwQ4+B
	CLMWeK+FvN1JhYQX85fPiklnyQ4R+chSZEzaVjPCZvReeRV/QBSMk/9IN/XxHSPERoaAl4QRawA
	X+F0ceJTA97apAtPVZCPi4z22q0Lgqy6gxpl1TNuH6I5s+rltuLr4n3OrudwfNtyzeasLKv0bQ0
	uF5GTd/p5+krSLAsAFQalSIVwFZLEQshABt9WagqtJ6Z9KYKt+H+GH4yxd/NJm0rSGjibNkef/n
	O41wIQSjqFok1hJQ87vhDCpbZe
X-Received: by 2002:a17:902:9302:b0:2e3:2c8:66c6 with SMTP id d9443c01a7336-2e302c8695fmr5785535ad.32.1790832315740;
        Wed, 30 Sep 2026 22:25:15 -0700 (PDT)
X-Received: by 2002:a17:902:9302:b0:2e3:2c8:66c6 with SMTP id d9443c01a7336-2e302c8695fmr5785285ad.32.1790832315254;
        Wed, 30 Sep 2026 22:25:15 -0700 (PDT)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2e300b851b9sm5152715ad.78.2026.09.30.22.25.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 22:25:14 -0700 (PDT)
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
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v6 14/14] MAINTAINERS: Add entry for RISC-V trace framework
Date: Thu,  1 Oct 2026 10:52:25 +0530
Message-ID: <20261001052243.3042627-15-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
References: <20261001052243.3042627-1-mayuresh.chitale@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfXwlZOwc4yyAyO
 FoNKwngCx3JJUo0on7smY2WESU0Vj57HO67EieOAxqb2oi03pizebjTOC329TfF7mKBhhlDfagc
 iPUKi8FvoaVCDdZltG4KGDXILy6lVng=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abdeebc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=W-_n0kkjAAAA:8 a=JfrnYn6hAAAA:8 a=UgJECxHJAAAA:8
 a=hzgbeqSfhi83Ps7mpaYA:9 a=uG9DUKGECoFWVXl0Dc02:22 a=qeNa2pbTr82C0GpJEZFS:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=-El7cUbtino8hM1DCn8D:22
X-Proofpoint-ORIG-GUID: Frd83FTPCoEUqkm2-ghTEhCTRMJn94mw
X-Proofpoint-GUID: Frd83FTPCoEUqkm2-ghTEhCTRMJn94mw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyMSBTYWx0ZWRfX7Vx4ovxuLh3U
 WTU4kPIJ6rP1VnJ0rpWi7F9xsjqdKVSnmDF0dlKM77hCvX/LtuldNXrIkvYXnz4Np76lZ4A44j3
 zNFc1fE+JOu3upH8Izn0DfyQuCCkdEIBhBWihcILHLfjDQtVOrOfUhaVBdQ3oUEbDvVxQ/FYrsK
 JDcchd7cWyYFj7puGK1fWrFGVN0TvpZ0qhu9Xi9aAPVQx2VCqDX/FLHdhXB0BiM66rez2ah+LHR
 GcJotPR/MVApnIEUvhpH/AH1fuMReywr4UJfoOzPLNMNc0PLhf3KCHBNotpGvQ0RbGiJrUGVP7G
 rPVswmxUJ2FbQOAPlPLh1bXQ8ZHBdXzSrmsrFeWefF+WZ0VaU1Jxs9PX0XDaEdRunjII/zOJvdB
 V9/E7rr8gl4f30g7OJLzkF2CMTsJI9ybo/8vkqbnfvQlJ1tLG/DdsH4yqx2EEzGg7bCOYRbU/gZ
 DOlT1XqaTHGHA0HxZow==
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
X-CRM114-CacheID: sfid-20260930_222518_325034_7AAD26F1 
X-CRM114-Status: GOOD (  12.03  )
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

Add Mayuresh and myself as maintainers for the gtrace framework and
its RISC-V trace drivers.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 360977678f70..8b5bd2815690 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23656,6 +23656,17 @@ F:	include/dt-bindings/power/thead,th1520-power.h
 F:	include/dt-bindings/reset/thead,th1520-reset.h
 F:	include/linux/firmware/thead/thead,th1520-aon.h
 
+GTRACE FRAMEWORK AND RISC-V TRACE DRIVERS
+M:	Mayuresh Chitale <mchitale@gmail.com>
+M:	Anup Patel <anup@brainfault.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
+F:	drivers/hwtracing/gtrace/*
+F:	include/linux/gtrace*
+F:	tools/perf/arch/riscv/util/auxtrace.c
+F:	tools/perf/util/gtrace*
+
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
 M:	Jack Wang <jinpu.wang@ionos.com>
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
