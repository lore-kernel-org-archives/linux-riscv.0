Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC2ACA5FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 08:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MlZY+W9fkw96fekyvnA3mxH9DjvPUDkbuD8Q2YM8XZs=; b=Om1a+eAiKgIPSZ
	9S2Qfuw+tFXcncIkQPGzxQYRYRkKjSYZpN/uC3vo5CYx3rEL6/7iyk/ms3IKTr+z3SfuMUiVuiLh7
	rlaiLlDSnoSnIPR0WeZIEIQfyuZsm+xUKCd5QWby+LqEzUmZ6foQKka43RH0oef6CnNbOA5rqLGdr
	LX6xwq1xskSH6VixGMCeWQT2lsHFAmL+Dd6dmXRFsNqyER3+tAxA0QB2MHQveCcd/RSWu8lP5SlxR
	KBC7fVBKUUDHfRFPpjU5jZb/YSGfBmqLpU/o3j34l0ussCZyYSQVtnRoeBlQSDiSQJqEZmxjXC8eY
	2SMniMqb+nsztlJXJyBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTcp-00000002t0m-46w6;
	Tue, 29 Sep 2026 08:55:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTcl-00000002sz4-06QL
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 08:55:46 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7U1vA4087184
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 08:55:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:sender:subject:to; s=qcppdkim1; bh=D0fd
	WJiPI4zTrPZPiW/54gX7rmk7pvMm7nCasduv66A=; b=d+HCvsK8rkfRgbKlSJjz
	mF9Kp8cBsvtLgH6rtfrYXKyptCwLdfqHxfD4me04YjP9boM6gjfhOZdzoPIpW4K6
	FcVwRgrJBJ6oun3tAFMH1/d4cUoaodzHYX4o+5c5wirjEQaia1pBrofd9okGb/qo
	cqtShsdD75+3oxya1hvWtudUm+dZiyWS92Avy9+FqIndG6NR9VjWk6+iNW3oXhKu
	4NdctLqahlfSPQXbxGudX5Xpn3VQHo7Tzu/nMJJvo8Ci5P+MpzqFEtFh4nLuVJEC
	OfORIcpAEUI2snjhp67Ww6wtuyWuLZDRltpRPDm7h5TNC10bmq6PMRYvjx/e/Z8s
	5w==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4t5rw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 08:55:42 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1438492fb40so567268c88.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 01:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790672142; x=1791276942; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D0fdWJiPI4zTrPZPiW/54gX7rmk7pvMm7nCasduv66A=;
        b=L3SyS4odDGXi0v0M3fymlhY6KdGTdyHu3Xq7WlxRuIKnqZ9FOmgdAi3cUTa1yV88d8
         ZyaIPVPPVkecF2Z4cH8v3VKyD4PV4Qtqd0eIhBgi89/jv4oJPM5HB6qHc9N1mY036ldT
         6elcm6ycH3Te2XBUcKxU2WhZfFmrQgkb0yCJPM4VF3yeWyJJluzIbD6rSi5EEphOqxpq
         oDEq4l1uiQ4dALHmvXm959HsGvB1JNwr12LLC9ZljE4P8QKjQfOtVJXACk38GuVHhLGe
         Rswu7f62HPjMUDDPwa5tLhXPa8sKq/6aus7Fa9/9P/6nKi6JQ+iq9DlVNzuYSadOrNSX
         pkwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672142; x=1791276942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D0fdWJiPI4zTrPZPiW/54gX7rmk7pvMm7nCasduv66A=;
        b=X6jAoli4WTJBfNrbiSA9DbuCys8OTBhWkPEsPsN36CA4zJ72WG7osu7pvg3K8gurZP
         BX4lwbelZgpSR4lWE36nFQOgd7H/O2dU2ZjK9tTiwvaPmRtdqOPdOMPyLzpU/gT/wGmT
         OqHyOFhy04sjIcnS7N5+M3IgvZMG26TrkwIO0+1B8X2RU27jOdW2clTc893ykhNvB8dw
         myXQovjRKl8S/9+3iFKdUg9LhgJdXsBJ+5zU8LQNGGZiG7c4jg72j5eYsf+Yt21h0HpT
         ESmR6sewfWhBzfpoCJa+7WhwWQI0ks4vEGVH53i5vkYowW8uhTkXKUPJFD7s0C2wGi3m
         u5Ag==
X-Forwarded-Encrypted: i=1; AKwUvBxh0Es9R9tBsj4vMyGuHvFpd+SBkNrXrSPcajz6PCOQyfEHLI1eLrh3wsf499C0QURxCIiR0ZPjGE3agg==@lists.infradead.org
X-Gm-Message-State: AFuF++lgLMdvqa0+juXmmuy+e+j2LyNi2WTlICIf4JNh7Qi/HeKz+hCu
	36DceGfoMhMO7eRI6F8LUMkz5dA4ST71QWX/qyBJkSbKbmDXQr+MNVwQAo4Z6VlDjFu+44vUIi5
	zLomUDcaIhG248qEO29r3oLcYjImlwsGvivcW65UmaVqa9TQbbTktLJJTaUSEViOtAwWIvVfe6h
	nUh1M=
X-Gm-Gg: AYBFou0ovMjdKyVjM/WuxIXDrkqdeuPISYoWf+2jkv1CB/8qWZAZVpAKsMpJiwlI38v
	DfgF5YSVBGdU4yscAKPexS13doNgDb6OU6vOku4q6yxr38sJfVa8bnwLbFxcLl6ubftvAwAayfu
	rv5Kid7wlfLLIvgkdKzfS3axTvo/v9z1GefmYd3o5Z7PX6SEsfyICS9qQr28aGhZ2jtBq7iBT6W
	d5HuGU8AYHq3CmEkV97eVb/wxIv6l2XTeaiRx7QdXYlOb4nnayWhwwl2D7lgwCGKK32qDhbAolN
	feoHkBv6N3hsMN3qZD+o7zOlz1uH8nyTRMlOoIUWUY8KDezKW1H6KPepY+3gYC3yKXkCimCZdTm
	q8eC+CygKuwdaINryr+Hx1CNrTmXiDK8xbnsW89TGWZOK8zSicOOlcDz6
X-Received: by 2002:a05:701b:4593:b0:14a:88ce:74fc with SMTP id a92af1059eb24-14a88ce7a2bmr4402862c88.41.1790672141656;
        Tue, 29 Sep 2026 01:55:41 -0700 (PDT)
X-Received: by 2002:a05:701b:4593:b0:14a:88ce:74fc with SMTP id a92af1059eb24-14a88ce7a2bmr4402845c88.41.1790672141119;
        Tue, 29 Sep 2026 01:55:41 -0700 (PDT)
Received: from hu-sunilvl-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144f4eb9esm34294467eec.19.2026.09.29.01.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:55:40 -0700 (PDT)
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
Subject: [RFC PATCH 2/5] ACPI: property: Add ports/in-ports/out-ports support to acpi_fwnode_get_parent()
Date: Tue, 29 Sep 2026 14:25:21 +0530
Message-ID: <20260929085524.1554507-3-sunilvl@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929085524.1554507-1-sunilvl@oss.qualcomm.com>
References: <20260929085524.1554507-1-sunilvl@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfX6e/NAU2P6IQy
 lL+rNUwoEPLw9zxbmeJasys0JrBVk1S8udqxYGdfStxo+1L9hbYHpAhxgBARDQ9GLK0FTMZb33U
 +soO1+leZVPE4l8W3EjSa7emgpr5DmE=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abb7d0e cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=UbLugLop3-FzA3s5YSgA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfX92oxbFCQZ0Cn
 mwop4X6R1aZpPWfAcw1Mb7SHCMhWvTT9baTLg0PKgOzdNVdIGoS2bSPLwkqEpBDD09tX29SZqpF
 TbrqjFwn6roi3D28RCdK5DaM7yzD28zhu7I3DNPzf7T4hQTlXry4/fXWDWWtbrsk5WZpXoTmg3I
 AztOtMaOkdtXH+te4RXswkJnfK0dFUxSLRcsf9hRkSKTLjnkqQl5p0BYwttB+Ji5TyiIET/odgz
 2o1pXQ+LUGcQFIXiuFSdc2/DQ6OPkcC0p3S2fujW32WUKIxNy5HQY56gbIXtOtsRSTxVULI7cvo
 dlbuOz3ejl+io9OUVsHoBjLqRDx3HvLOiqb8I5/yImDIUcTD32Xejn7cIrMl/HVIMUsE4ohxmDq
 izrWLEa+/cFnbaj29Vj85gTEWKPYeDMFuQB0l7XoWm8G/cUBn6wFQl8ANQ+3CUI+NvkLGsQ7Bp9
 zwgGAjVG8M0mHS1hUUA==
X-Proofpoint-GUID: CCufjvFKPgQioRMRUEFGsZzjFflEoAPh
X-Proofpoint-ORIG-GUID: CCufjvFKPgQioRMRUEFGsZzjFflEoAPh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_015543_095152_085FBE74 
X-CRM114-Status: GOOD (  15.20  )
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

For collections of ports, the node name may be defined as "ports",
"in-ports", or "out-ports". Currently, acpi_fwnode_get_parent() does
not handle these container nodes, which can lead to incorrect parent
resolution when parsing remote-endpoints via common fwnode_* interfaces.

Extend acpi_fwnode_get_parent() to recognize "ports", "in-ports", and
"out-ports" as container nodes and ensure the correct parent node is
returned.

Signed-off-by: Sunil V L <sunilvl@oss.qualcomm.com>
---
 drivers/acpi/property.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
index 8ee5a1f0eb48..78400620390b 100644
--- a/drivers/acpi/property.c
+++ b/drivers/acpi/property.c
@@ -1422,7 +1422,7 @@ static struct fwnode_handle *
 acpi_node_get_parent(const struct fwnode_handle *fwnode)
 {
 	if (is_acpi_data_node(fwnode)) {
-		/* All data nodes have parent pointer so just return that */
+		/* Keep the structural parent for generic fwnode iteration. */
 		return to_acpi_data_node(fwnode)->parent;
 	}
 	if (is_acpi_device_node(fwnode)) {
@@ -1703,7 +1703,19 @@ acpi_fwnode_get_name_prefix(const struct fwnode_handle *fwnode)
 static struct fwnode_handle *
 acpi_fwnode_get_parent(struct fwnode_handle *fwnode)
 {
-	return acpi_node_get_parent(fwnode);
+	struct fwnode_handle *parent;
+	const char *name;
+
+	parent = acpi_node_get_parent(fwnode);
+	if (!is_acpi_data_node(parent))
+		return parent;
+
+	name = to_acpi_data_node(parent)->name;
+	if (!strcmp(name, "ports") || !strcmp(name, "in-ports") ||
+	    !strcmp(name, "out-ports"))
+		return acpi_node_get_parent(parent);
+
+	return parent;
 }
 
 static int acpi_fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
