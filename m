Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB64CA5FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 08:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zOLapjaU1P+1ozJd54ITKgMCOZldUlcXiIVdeD+6RtI=; b=llYjT0AozkzZ+T
	+4G62zDGzyVGT7XNmdQEZ/ywusETRJm1nFNxlyaySbbxE2UTeaqAmFhcqyZEAbJSsT9iDrwDkTjIE
	vZ1z3xD7WRi6ZL/tK/gvfOi9eJ9+VeAvoEU4ADoinAV3tJBHoptXJUJ7Qks7q3q+XeqbuI0NEqzOj
	mimqLO/YWqKWH9A92kNHcLAIvEvq29BLFdOekAR+3GHMuvylmSU/mmGvevc57CEyx3bcTmzdXSAHi
	+ya+ceW0swV4lLT8YIVxQlUq1uvZ+d6/eb1pxo0D1N9KHxFsc2JbGFT7OrEKEERab+tB1yfHKRt8b
	fL01iBMNxYOV7W9UxFmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTd8-00000002tCs-22qJ;
	Tue, 29 Sep 2026 08:56:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTd7-00000002tBg-0yV1
	for linux-riscv@bombadil.infradead.org;
	Tue, 29 Sep 2026 08:56:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=s4DpGg6gYN6rQ7jIzV1CefESyYzOIZ1FZ6SSXdL3274=; b=b1acn0U+2Scx6xpmxsK/PXrKS+
	ZU+hP3pTSLD8JeH49HvlBV9apUY0td7b6I56CecVMF2T6eSjBxtgnG2XnkUJaaOvx76lmL3Cugr6H
	G4uzVSvNMmN/M+suCOKxSB0bCqC5gTciZEMPnvwXmRWWDbaLL8wWFGH43y+Eeho/sls+jcXuYYfvt
	yyxjZObC6Bwbs7OlA6evascwXILLoSUrPhKYgaXsSKaSMZWW7uqCgghyD0VeKuiDh6mCwqfySd4UU
	GJZ3oJj2pZ2+aEYRiD12PoO1Gw6Y9j4ZxElmtEon8Mf7fRuzzaCdh/iBv4V3+MA28N2qq0Q8gfV2a
	9Ph1dNAA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBTd1-00000002O4J-3x5b
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 08:56:03 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7TrJx3684709
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 08:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:sender:subject:to; s=qcppdkim1; bh=s4Dp
	Gg6gYN6rQ7jIzV1CefESyYzOIZ1FZ6SSXdL3274=; b=SUfuzJt3BkSW4cVoHqFD
	v/hmWy27vgsfcHBMZCQfBpBlIXpbLQKpGy1J1ZzvbWYg4IzH3dLt6xOB3l7AZcKA
	nRMpj/AOjhJecERm1vtFDtr7sACZyc84MY2qCU0ei/la8jOpshZb/Ba5QBu9BAyS
	vULx5ly+CCS+UVhsAgHyPo6ZUuFXKXHbmdwku1ZEjScgahLNnZFM24U4m2FNXS9l
	sfSyU54IlDT7vWLWOfxVWBc+yzpWfk5sXCFKkp6y5Jvnrg6iZiRviZhJBHObkMSC
	n+BEZ9P5/3sRsw/VqDILPhWfyK99CR3dorF5Ztgik2BEfZzknVfo+VA613REfqFS
	aw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144t31j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 08:55:56 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso591892eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 01:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790672155; x=1791276955; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s4DpGg6gYN6rQ7jIzV1CefESyYzOIZ1FZ6SSXdL3274=;
        b=HYz+Gr/fIMQcEvz6R/UMNzRSRq2LSU6FbsctP+ZgpjER1HfJSKfnmRA5VFUMCoK0WL
         TraS5BS/tjN8gMhiuVT4JFQzP9CXvoVUcWYyUwtk4Qi8UFUw7/YrpL/2IZUCTc+pzfXy
         UrGrl8+QM++DjWe3axST3pjCKwu+kByaH94fI0cyghGwIAUMhTYdDedwOqDMzu5SB8yl
         gKvH7aaAg7tX+vRBg9z6kKRofM9FZMFJgtC2ZLoxJx3ZSCHUiRwlz2JZqsvIXGKyQCWR
         0XIPZfGOR6X7vAE3k1wSCzrltOH3bwES88t8EN6javyrq3eU5Nr9PCpm+biWKvdyUnbB
         YMJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672155; x=1791276955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s4DpGg6gYN6rQ7jIzV1CefESyYzOIZ1FZ6SSXdL3274=;
        b=g6oyExaE7nZ7vUW3nwPrm6x5RsOQw1oumC5GT530HZM+78e7kpGSNHucYyPTilLsSm
         F5rKi3QPsXMznTD7O8VGPVNGryzmvBnVt/JpCgndx8yEpCBaWUEWtEFzb+QTBt75CWjb
         9qmco/zQLU71YhKeAZmKj56OAMR65fCASPGxYREepCzb+w+JtPEfL4yritvJRCyUgh9D
         bjTGpkC+2byUfDLjD6SqUKk0IU00fjy0ayaG9b5PWhXhuqPh5FbfKbQalBkZyMRHGfBt
         S48AYpb0eSDeUneH/pkML20cU8yUcARwwf7//lTRZ2Wjh8Vvke7zaRrSKfJzdVxa7xI9
         MDlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYciDcv5ORmpFrUYbbED1ePkDHNGUBJxWdnSIpS2Le9Xld+D1CyMH8gGNNjTHcJirFIWuaNhkXVJowIw==@lists.infradead.org
X-Gm-Message-State: AFuF++n/pldS/UcWxnmVJtLzF6wvthxN4w1FCwwONyzbYyA4FsMDpEkp
	+AMnJlcwaivceaQ11GGWzVH6yJt+MoZrvBDufuSnba2KYMQPOeoKBQXT7m3tEowkboh6xkyRHBs
	iW/O/ad4vp7JByt+aP7jpdF3XsyBOtw5DLMTGS0bdHZHzt3C4qNKvobtuZhgrl+c6Fmo9ALQ=
X-Gm-Gg: AYBFou1BcNUURjGWyZx8oEM71voH7rTvgdgtzAkyOgUWoi5RGb4HhpPplJ9Ls/0TjEo
	sIEA6zOHIZMJNw3o1zsScsSM0z7c5GO3WS23xbPpjrXDSblP/v33nzPoPBRJUVfdXeyW/V+92GY
	DbgrjWzgEw40+SO/z4tylni2DPAhelHOZH+YLVuoX8BiIz4MV8gTOMVxOZJOdJat6UpJd/iJ3mr
	oeCJRcY3maht3ztHh4TOOqhK0S8vtFE7qeYpYo+zsLd3DOBrpKI1kOjRqrn+iErxtMqQ8090aA9
	OgQSAkwEoPz+xRb5hpoNyMn35AB4MTtICxenG8EgX1OXSnu8ASE8gEOSSf1Q/CMwkXyyvdJOD5U
	HQ3gwv79F5J1gNz1GldltFW+/z9W6Pc+jpslrz5J/Qyz+XWIk2suyEMJi
X-Received: by 2002:a05:7301:b0f:b0:33b:96b8:3818 with SMTP id 5a478bee46e88-34272a44a3dmr11169845eec.32.1790672155200;
        Tue, 29 Sep 2026 01:55:55 -0700 (PDT)
X-Received: by 2002:a05:7301:b0f:b0:33b:96b8:3818 with SMTP id 5a478bee46e88-34272a44a3dmr11169824eec.32.1790672154533;
        Tue, 29 Sep 2026 01:55:54 -0700 (PDT)
Received: from hu-sunilvl-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144f4eb9esm34294467eec.19.2026.09.29.01.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:55:54 -0700 (PDT)
From: Sunil V L <sunilvl@oss.qualcomm.com>
X-Google-Original-From: Sunil V L <sunilvl@oss.qualcomm.com
To: linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Mayuresh Chitale <mchitale@gmail.com>,
        Anup Patel <anup@brainfault.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Sunil V L <sunilvl@oss.qualcomm.com>
Subject: [RFC PATCH 5/5] hwtracing: rvtrace: Add ACPI support
Date: Tue, 29 Sep 2026 14:25:24 +0530
Message-ID: <20260929085524.1554507-6-sunilvl@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929085524.1554507-1-sunilvl@oss.qualcomm.com>
References: <20260929085524.1554507-1-sunilvl@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfX217rxINmRYdu
 KqyF7ll1NUtB0EJYxj1tV651wJy5WS+aiBZoMevqxPGXFvECugnaa1QdZxvNzVwMGisjpXluBax
 C/PqVORP9AQhOvQqrzPJ+GzP8xL8JYLtn6q3HcMYc0gTWOnuRPzm01KLAEWg0peF0Y06ktAUlj1
 XznKUk5KKshwUtKwVL6jiX9eo52HnbMbeOTmHQLI0FAv1PEOOI9dqzEnNZRAnK1pabnbU59WmN/
 Le1/40jO8GLtdxRPV2IXeMQ0MfXpauCw38JYUo9asevZ01zlBtlt05S5hh6cmbC3fp78uiYKOQT
 z7hlDVTVpKVjl+P33A9aa7oWODN3OrDcG38Leg7qrvbeg1PjRKDe6sovCtzNscG6XTLRh43cH++
 BKJDVKRBsK8XmNhoYWXwae8ROih1jyJQW7gOWRwaHPmGaltoG1KJOvsAGXRN8kirTt/sb2LENQ7
 equQ68+QiSunz+xvRIQ==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abb7d1c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=x5ONKeZPveTsSohF_q4A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: Wfd1gZjCCn8d-l_Qr2ii6xk5aLz9cuXM
X-Proofpoint-GUID: Wfd1gZjCCn8d-l_Qr2ii6xk5aLz9cuXM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfX1+5KXq8c9tnw
 i5GT5vj+sPamyIgNgWCH0BvTX9ATqOBAJIP05WZhRNNHyJ9UF0ZRnGKTmTr7MfDnS8apVyAUMg8
 lMT/GeqG+BssK3O9i80cyqqaHFFoWdI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_095600_625513_09723A3C 
X-CRM114-Status: GOOD (  19.72  )
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

From: Sunil V L <sunilvl@oss.qualcomm.com>

Add ACPI device IDs and ACPI-based CPU binding lookup for rvtrace
platform devices.

Signed-off-by: Sunil V L <sunilvl@oss.qualcomm.com>
---
 drivers/hwtracing/gtrace/rvtrace-platform.c | 60 +++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/drivers/hwtracing/gtrace/rvtrace-platform.c b/drivers/hwtracing/gtrace/rvtrace-platform.c
index 12330d9dcddd..44422d429ccf 100644
--- a/drivers/hwtracing/gtrace/rvtrace-platform.c
+++ b/drivers/hwtracing/gtrace/rvtrace-platform.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2026 Qualcomm Technologies, Inc.
  */
 
+#include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/gtrace.h>
 #include <linux/io.h>
@@ -174,6 +175,62 @@ static int rvtrace_parse_inconns(struct gtrace_platform_data *pdata)
 	return ret;
 }
 
+#ifdef CONFIG_ACPI
+#include <acpi/processor.h>
+
+static const struct acpi_device_id rvtrace_platform_acpi_match[] = {
+	{ "RSCV0007", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, rvtrace_platform_acpi_match);
+
+/*
+ * acpi_handle_to_logical_cpuid - Map a given acpi_handle to the
+ * logical CPU id of the corresponding CPU device.
+ *
+ * Returns the logical CPU id when found. Otherwise returns >= nr_cpus_id.
+ */
+static int acpi_handle_to_logical_cpuid(acpi_handle handle)
+{
+	struct acpi_processor *pr;
+	int i;
+
+	for_each_possible_cpu(i) {
+		pr = per_cpu(processors, i);
+		if (pr && pr->handle == handle)
+			break;
+	}
+
+	return i;
+}
+
+static int acpi_rvtrace_get_cpu(struct device *dev)
+{
+	struct acpi_device *adev = ACPI_COMPANION(dev);
+	acpi_handle cpu_handle;
+	acpi_status status;
+	int cpu;
+
+	if (!adev)
+		return -1;
+
+	status = acpi_get_parent(adev->handle, &cpu_handle);
+	if (ACPI_FAILURE(status))
+		return -1;
+
+	cpu = acpi_handle_to_logical_cpuid(cpu_handle);
+	if (cpu >= nr_cpu_ids)
+		return -1;
+
+	return cpu;
+}
+#else
+static int acpi_rvtrace_get_cpu(struct device *dev)
+{
+	return -1;
+}
+#endif
+
 #ifdef CONFIG_OF
 static int of_rvtrace_get_cpu(struct device *dev)
 {
@@ -209,6 +266,8 @@ static int rvtrace_get_cpu(struct device *dev)
 {
 	if (is_of_node(dev_fwnode(dev)))
 		return of_rvtrace_get_cpu(dev);
+	else if (is_acpi_device_node(dev_fwnode(dev)))
+		return acpi_rvtrace_get_cpu(dev);
 
 	return -1;
 }
@@ -308,6 +367,7 @@ static struct platform_driver rvtrace_platform_driver = {
 	.driver = {
 		.name		= "rvtrace",
 		.of_match_table	= rvtrace_platform_match,
+		.acpi_match_table = ACPI_PTR(rvtrace_platform_acpi_match),
 	},
 	.probe = rvtrace_platform_probe,
 	.remove = rvtrace_platform_remove,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
