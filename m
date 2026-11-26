Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF785606A31E
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 09:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jVMabJqX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fYchbVi6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PHPCE5I8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=QN+hWW/IFSoCpHXE39/W6ceoKJEUzv40UFaZ0iVIIiw=; b=jVMabJqXMFL4sOgK98HhqmaP4e
	uiLUQ4sDU2NG0dg5ip8Dr6Gcg1TnUDBciCwZ3xbb2SYwxCJXBYDnr8WkcCkz/8k9UjWQq0Z7aOIUO
	IJmh2ViscgrLu7qlJi5xYdYjX0dHBPAtkT4Vwkd0QYoLaigZSa5gwOfe+gf1Sl4J1EoC7G2U4e2t8
	jpWGl7kdfEAhY0ptrfFqzdQvwhAJaBkAotPX/oWQ40OX/UOqeNIT7QbC+R/LbsE6lp50S8HD1tpDX
	XtBSoDWvZY0d61DeEhO6OOCfb4C8YIhgcMumQeqgx72V58G7ZzCRLrI+U1icEicuWht8NFWBUOZqU
	br9REwug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWEt-0000000CfvA-1DPc;
	Thu, 26 Nov 2026 09:58:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWWEk-0000000Cfm9-2oZO
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 09:58:01 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7AxMi2175653
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 09:57:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=V5bOdURA8FV
	OA/hZUhmlwnRgu1GR98lkW/FXUKup9B8=; b=fYchbVi6CTlUVo/KWqt222aUOmj
	UIZL198acvWlJ6kMbJkrCvQDUtc405cnb/zRUtd1/VGM/Q4G8g3pdGeAFAdwzeLK
	E7y1drA7aOONrzRSAsDZrk3XLFJYg1YERgJp1Jrzy8H8dlbRBo/w0tve1ibl3EGk
	LdUmYu/rckMwlq3u7ID8P5E4d8HkuTowOggACQHmQ5nzBosJl9/tXlUyZGpG5yua
	jDyT083H+rjbxQ4t+DWTmuN2+huX4hYxM+/paL3sf3oi2B9epezozOFlZNyGbgW2
	NYYDDxV0DwHYbP4a1U1P4LmtDP77X1nMW0bJ9/7ukTHYAciTM8d1Yk+Q+KA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahuvvr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 09:57:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f074b87307so41165875ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 01:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795687073; x=1796291873; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V5bOdURA8FVOA/hZUhmlwnRgu1GR98lkW/FXUKup9B8=;
        b=PHPCE5I8E/73gfQzenHeB0aH/VSLiw/hpI1HdLpWwt1KeULqGg07Aonzs0Lc/IcvEV
         Z0kA/IlTeC5p6HMFI9TS8Peo4gI1lNWL80YJfoNefSDHc2LxiVPTYdBb+0V1rOZeZm1D
         pG4ZeIULqLV92oz5F85GmT7ZSPLpDX6JvBnxA7F+6V3lJkkmo0s9QZECVmz/xlc0hmDI
         91cqTE+jLstDn+lWr2+l7/n5vrbuYKuSzzHY9BRrXJtu6w4Ll8A3wlXzzVOWrH0VETIn
         Lq2mW347SnA01i1ipu1o0jYAwPqx7t+3qOqYjhEDwebcxaXKWs4S0A7QRFNpEP+tVhEH
         bE+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795687073; x=1796291873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V5bOdURA8FVOA/hZUhmlwnRgu1GR98lkW/FXUKup9B8=;
        b=gq10ltzaeu6jF8Uq1pjOPq6kHD2pEQ85xePUbiLXvsZBbZoch1VAycAwDC8TDdWxl1
         RignGus12zTm21eZ9BERy4o7ZVk3hQAwXtmlKPl2v2iUO6VVYSjU/LvBMB6mTQMjcEKl
         q+05PttCPMR8H4cCeUWltpJdbpmXWt8nHI3kfjjxEs5xzdfcHs8RB0koAs6iAMDkm7/r
         vvCUw9geUxGosuRbDW7McC0ykJZhY+VfvMZSMVQWe8euiuXfXeL4xyUT78M9QALS2MAY
         Jj0/7Tr+hyqh+EcHW8V5OMl6m6mDhsQCv1mXCO5Atq6bs9wvJMS3ftnO+srq/xCZ5J59
         h6kg==
X-Forwarded-Encrypted: i=1; AL+hErFPGB7NzSKJKwKueQ6h8oc2+uWUXMJTmXChFGMmNEvqSryTCGKfeCD9mbrWSnhA8pJn5jmqA0QbyypZJQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9UDbk4UAJyDs4WgEcf357wocZSLLR3E/7dMAyoW8X/wuKlzZ/N
	x9fqNU/l5MWAaIx1wT1ffYEfDhJoGrt/dokYZlyJo9hhS+O9UeYyKgSfBZCtrEsA8fRJa1yYCRq
	eHYNWsP5CTZjuRgwTJiTuJK4J0EmCY4C0BH1fkiE/MUevRvSj/vw5qzYKL8YfinL7Z4yqni0=
X-Gm-Gg: AZFdTZe/142BLTROHvMo3mGn4hRfGDd35pgjMYJ5D9yAii/+t/i/gc8qBgjrm+8XElx
	jw+zjEmhlbMUDriF6sjLxq38eQmSHxFl80/0v/+ei2Ehrb9wWj5vK/aDoalnc8XuVwKgcw7oaxH
	NKkQO6BrrDxd5PNVKJhpTxUwLxvK5Cf9JkUccVo+lvtFjBGt5WYJf5hzMWkI2cqkf8uBH8BlZFP
	oBHMxu59885t1L37iiGLYJIDdRsWR62RAERXxtkqmBi+9fyXThxEBEyBkEyhifuWcRirxvXx8VP
	LwDS3Kw3Ejl2Xy2aZXFB880pUrRPHtbrnqazGPg60Srj+UJwF1AoTlqe/+kszuMcOSk1W+uRd1x
	0mgaZG2oiZNs7aJcga94jTlLZEyhToyRPNxxos9iqMmka6rG3OhBUXeBHK3dRWiJYioBxbJ5Ewg
	P51IGoT/tr2+vUjLMCvLlziFXVXawzvA1ozO31G/JeSvoDDynqQUCxsEffxlgSGpdoN5cZa+0NV
	Q==
X-Received: by 2002:a17:90b:2b4c:b0:3b0:a7b5:c037 with SMTP id 98e67ed59e1d1-3b41c7b6145mr19812375a91.1.1795687073444;
        Thu, 26 Nov 2026 01:57:53 -0800 (PST)
X-Received: by 2002:a17:90b:2b4c:b0:3b0:a7b5:c037 with SMTP id 98e67ed59e1d1-3b41c7b6145mr19812358a91.1.1795687072994;
        Thu, 26 Nov 2026 01:57:52 -0800 (PST)
Received: from hu-mchitale-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-3b41abb2076sm32459030a91.2.2026.11.26.01.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:57:52 -0800 (PST)
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
        Zane Leung <liangzhen@linux.spacemit.com>
Subject: [PATCH v7 14/14] MAINTAINERS: Add entry for RISC-V trace framework
Date: Thu, 26 Nov 2026 15:25:35 +0530
Message-ID: <d5087c1c7ce28317339739df2fbbfcaa5838243d.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
References: <cover.1795512532.git.mayuresh.chitale@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Proofpoint-GUID: lGnBO2Y7qn_w36dtv5SbSxA6OZcVbpcP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX6Pleyf6TsnAu
 o+3QluPH4lHcfHIP9tgDt+Ks5kImaYCTpNZxnWTmHt7u/A21YKndSlCIv5H7BCQVj70+qOZqW9K
 bQXuWT700rBNo82WaDV98chZ54u9rcM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzOCBTYWx0ZWRfX9FQldOki0ptW
 WuNp+tkpBb91TJFYmN5DEz+O95nHtLCdRgde7hEuofG4+DhIrxdCd3gtNz6vKy+PbDd0jthBvVh
 guJWSiMDkDrWnU1Xsrdw0YLexff1GUVYx+PEPMFeYqrcQH7P/SK9BIKyqb9Gq1TxzJYHWFR99F4
 HOIUxTDs1gBvllhjZvYSXW+VKApkCBBx+MOJYKQuIOXfljtcqI6WgX0FlGYoxd3z0VdKaRAHv3y
 ANIrYNvJbXDi+4CDQX3l1R4v9lN+2RUmKaH7AYqC401t6goxAUkZywSHISwnY1NY4k1gwFLaaR8
 6wHopVSyNTeMsNssas2TfS+GNf5pyGK5neb7Dnr8GN4oUF8fre4D1rwfDASPWb9iZW50eFItk2H
 P4hPrhkI0gIw5ExDDU7JEAkwIPl87j8sQdIwwWJtiCIk0ALEtoKo17W5oNyoaQDJXNSpeO5X/XT
 0LK20AYUBNvEZV8jelw==
X-Proofpoint-ORIG-GUID: lGnBO2Y7qn_w36dtv5SbSxA6OZcVbpcP
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b0802a2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=W-_n0kkjAAAA:8 a=JfrnYn6hAAAA:8 a=UgJECxHJAAAA:8
 a=hzgbeqSfhi83Ps7mpaYA:9 a=GvdueXVYPmCkWapjIL-Q:22 a=qeNa2pbTr82C0GpJEZFS:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=-El7cUbtino8hM1DCn8D:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_015754_740579_2BE7791C 
X-CRM114-Status: GOOD (  11.66  )
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

Add Mayuresh and myself as maintainers for the gtrace framework and
its RISC-V trace drivers.

Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 742c4e6b291f..e582686ab218 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24318,6 +24318,17 @@ F:	include/dt-bindings/power/thead,th1520-power.h
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
