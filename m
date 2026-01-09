Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198C0D232F6
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 09:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x0AWHQpKwu0SyFpeSi7lGoIAcwym+kicQABVukhcWo4=; b=EifudBDfq1UVw1
	K6YNJvWvWdKdTZxt+pXW9keiECDgyMvPylxjZnX2rdZEk2PQ10XcZ229Axgj5+pVr3UHSjhfSxITZ
	CPBifj1e3+S4ui7Xc7ke8G5pqds5zX5p+mX+8mwrkqkydKK8bfjL026TLAKvcFpCVT5KDlZTMZ8tq
	0cgacp5dvxemHS2A+03Ujr6BJ520zAOifHiCi3zqs5nOzaOFrelYEbl4SV7OZ0hBp37yGno9ONQ+O
	yeFiIOWGZTY0f0KKgiqDIYfCSIfZpl4jMgBL1pzf0udRtqOfFgzXq/4+1vAZVfwGKsv/+O45pNGFi
	/Li/Qh+dikJuNN1uetaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8Oi-00000001xQ3-2kIf;
	Fri, 09 Jan 2026 09:03:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8Of-00000001xN9-43nc
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 09:03:07 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6091qSem3324804
	for <linux-riscv@lists.infradead.org>; Fri, 9 Jan 2026 09:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=asLWQeaR4rF
	QlIKMK2s38SWm7Eqp5rcJ/qvyglZlI+Y=; b=j9naqlU7FvOy/xPALLlXbSgEqH3
	n9vTSdmk2dj0lEWOCOz8hG7TiXaBDugBCyDyE6a8HXeuIOAi2OYqXvwrrOn7MUJh
	07XALIKMgcCv86VYtLSvU+wEzidral4Ejc0vPTx6pq+S/lBvYAHIazkLHKuWyBro
	DEX3HhPVk49ZnIheyBZaTwBIfX6+coq60a7g+KvTmtxpPCuNVaF0Nk9FP5sbaSi4
	bNt9wmwYL9KZatmrw/TeBEicrfN1+b8ZpwZx3nRw/AUneHycuZ0JrQF6rKCqIDs5
	4FNf+Q9mlTC0VsNJeCveoWhxw91bIlNYZZTkXpKUeFTJPgaZfi9UydAuV0A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjrd6h4vm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 09:03:05 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-815f9dc8f43so4564807b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 01:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767949385; x=1768554185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asLWQeaR4rFQlIKMK2s38SWm7Eqp5rcJ/qvyglZlI+Y=;
        b=SUxIbb0DLRV1Y4waYPn8jeKkzwS/KUqgO16qIWUF4RdrjOfoU0m+hxLY9fS6LJ+1Ou
         VsxvGEE2UV/yOVzEChl6WfoENlAIqvfAlqQp2Mu+8/LccskfMRll76v/7pS2zjLfLPqD
         Ec80zxC3CL1Wk4OrHdyfhPWLz1u9iZl8KU5GYiznjCX9j2FLSlm9QdQFO5dxj6CFmVKg
         wIY8UF96mkvOpgRWd0MovgOL1yanIJ3+TgFJouuSu1qFzNh2UskSpzobDoEwUY+ifRZZ
         2yGZZj30JvGDcc+Sb/9NCylAi8Fz9C0fERlBz4GpUh48VlWCGZPcoalW/sAq79J/SbU0
         Bq6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767949385; x=1768554185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=asLWQeaR4rFQlIKMK2s38SWm7Eqp5rcJ/qvyglZlI+Y=;
        b=hP63WYs5f/AOmsNBGqIryruX60LiPmkw40PY9gA4g4LhuwnxsRDpd0y2kYOU/k6ItQ
         /iquyUPcv4gZrQCU1hqgWKLwdSx1ZrMlWqWoIhDWKUgd+V/hW/NSwQsEmLpRUycFvfim
         7+/iBa28diMbMgotHN+UrcWRzB42CZ206gEIAsx4dCRPjyIs9QjCI+KQcWJEIF8jjvDc
         M5xMpkBGnqwPFT07/Shn7gVRuEVPGx5+W0FRI8zJJ1gfWf7l+Q5Vk/24V586iNBS68X1
         iQKrCSIZA2OsVxxaC+d6Vov65/K6ebMZQJSzcu+uF0bujB8p2a21dh80pmfkkuWSEYkg
         1OvQ==
X-Gm-Message-State: AOJu0YwsKoaLk5K0IGLxng12XwrpobffAiLb4oNcZkoB6W7pwsJdxL75
	MUriU/nOmwZCrzy0x2gTqzqn/X/hbmykDd+7R6y0e0qrqARpCmzyzY66BAXQmPbMWBPASXebSOD
	yflcGAxLS6Er79ldKiGFT5sAW0Jz9C2pJxeF0JCo6+k00EZJ3QG5anbGJe7ENHna/H2749q+iPp
	98bdg=
X-Gm-Gg: AY/fxX4kg6XaP5UE2PZeqeHZRUnV6TxIi4XG8bxrdLMfPjPQ20GJAsa3C6gLWDWQA7d
	EjqKGzxfoMaMcCUx/zH9cvuBfTsClbLEK15jVqU7MUiHXnlb0xmBvpKpp7V7Ciq3d+kU+dKoH6W
	K08Yrbs7KaRZauocUOuDZ1bmNNm8CeaPT1E9OJtgtwBJt3/T4Ch/odtY22KaC+2F70WPW8rssFn
	o/UvYECrAThFCGP/7e5idbbHMrjvE8sGElYX9aOMMdz9OY1CEY2lV1PHoTCSl3WZclQzKsIN/gj
	+S1NPUbAGvAbO83UwpSjIioRCT1Jiqmt/fji17Wz6NIm9jWgAAn26tebmZRHTMK5Fhl4dGcQa6e
	x7XmUNkjsG+TrF3gQmcMlRwLRVfB5fWR+Ky0IMPB/5i9Jt+rvBKWap3p5EoyG0fttq8oYs9iU5f
	IhwnBPEHN2YI2PcfqPrK8vvS0xM/Sd3E9Aeg==
X-Received: by 2002:aa7:808a:0:b0:81e:96c9:1335 with SMTP id d2e1a72fcca58-81e96c9166amr509862b3a.21.1767949384612;
        Fri, 09 Jan 2026 01:03:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQwj/yWlof0KqeGRkT5R3hBYh980k6Id0SZ+6+0ezp1wE4OVTwE/4kvoozGGXmSkIj0VWIKw==
X-Received: by 2002:aa7:808a:0:b0:81e:96c9:1335 with SMTP id d2e1a72fcca58-81e96c9166amr509835b3a.21.1767949384107;
        Fri, 09 Jan 2026 01:03:04 -0800 (PST)
Received: from hu-himchau-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59e826asm9831562b3a.54.2026.01.09.01.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 01:03:03 -0800 (PST)
From: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-efi@vger.kernel.org,
        acpica-devel@lists.linux.dev, paul.walmsley@sifive.com,
        palmer@dabbelt.com, lenb@kernel.org, james.morse@arm.com,
        tony.luck@intel.com, ardb@kernel.org, conor@kernel.org,
        cleger@rivosinc.com, robert.moore@intel.com, sunilvl@oss.qualcomm.com,
        anup.patel@oss.qualcomm.com
Cc: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Subject: [PATCH v3 07/10] riscv: Add RISC-V entries in processor type and ISA strings
Date: Fri,  9 Jan 2026 14:32:21 +0530
Message-ID: <20260109090224.3105465-8-himanshu.chauhan@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260109090224.3105465-1-himanshu.chauhan@oss.qualcomm.com>
References: <20260109090224.3105465-1-himanshu.chauhan@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NCBTYWx0ZWRfXx9CPnMCgPSGm
 rw1iuffyB6jn6l7a3w5C8jIyvEi7hjyN90PwbVxOxKyozcmMfM3Djc+UzCoS0jIAfzkQl5xxPbw
 ujhXQEBrMqGDX3TalqHzNCUam8O5W08HoVu34+Ed0DeGd6tsPdtPnss6uaPLTzuQZ37ihSDqeur
 hIhfIpiu4+JQJGACGoiiqPDRcXNHQfrj01Z0+/d85D9jSj+uhTJRDQJwtK8jBIw3VQagooSzWUe
 Ru9Wc7sHMEqboIynGdqRR2UXqejMi2rLQy3IU8P5g1q9esXmh6MADhJzACiXrbX4n8kw5ImjSei
 LvnZLryK1dG7xwE7HyejC/3G8xMBio1C0dg+hr8mRs+THS1Kc4DFBLWGy4CJ3CJbZ4dfsWmkLYb
 VVzqu+ywkhM+DtxYHlUm9hKzOXBCk5le+Kv2WUozQzd6xe1kLawjhYyQBZe+RscFcAtujbb5QqH
 STMxQDhDWFsQUwWPxWg==
X-Proofpoint-GUID: R50vft3_kGG1A3UMfizAJ4V3lpxBEBLR
X-Proofpoint-ORIG-GUID: R50vft3_kGG1A3UMfizAJ4V3lpxBEBLR
X-Authority-Analysis: v=2.4 cv=Xtf3+FF9 c=1 sm=1 tr=0 ts=6960c449 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=aZI88Kzba1cNDf5AQqoA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090064
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_010306_011756_210FD0D2 
X-CRM114-Status: GOOD (  11.36  )
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

Add RISCV and RISCV32/64 strings in the in processor type and ISA strings
respectively. These are defined for cper records.

Signed-off-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
---
 drivers/firmware/efi/cper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/firmware/efi/cper.c b/drivers/firmware/efi/cper.c
index 0232bd040f61..9d591a294327 100644
--- a/drivers/firmware/efi/cper.c
+++ b/drivers/firmware/efi/cper.c
@@ -170,6 +170,7 @@ static const char * const proc_type_strs[] = {
 	"IA32/X64",
 	"IA64",
 	"ARM",
+	"RISCV",
 };
 
 static const char * const proc_isa_strs[] = {
@@ -178,6 +179,8 @@ static const char * const proc_isa_strs[] = {
 	"X64",
 	"ARM A32/T32",
 	"ARM A64",
+	"RISCV32",
+	"RISCV64",
 };
 
 const char * const cper_proc_error_type_strs[] = {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
