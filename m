Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E9ECA5FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 08:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cuqMpsoFFZfzwdEXmgbe32VP1eh/6lJAARQRSI+6YK8=; b=1SlreSxEkg94rd
	EB/+qnMS7q2o/R2YHsUTMojASRq5N/OHWLqrU3hCcswZ8448yxTvAE6VZuX3qS08xnmGUdwXWOPC8
	QqSNJgWxRfZjWsUdQI5UyuDWpavthFc1eILuxcHRz0w4BFdFCX6QK1056SZVYSjofcfQhEKBxPIUF
	RT9VwEQaWOMgRZbZLMIRelkJWpHEmo4aFkRki0fQlyybio0ATaZQWF282M/Mj3BrcgSiOOdYEgF/n
	VfMImkZ4v77QRkc2mgi59etyJ4qMMYdX+s9Ja10Fs9y9TFbqChJiFCijNUwEu+16E6RcIX5bFaFU9
	zhyzwqMnhIA4jgsBnFiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTcj-00000002syN-3gWf;
	Tue, 29 Sep 2026 08:55:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTch-00000002sxF-30o8
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 08:55:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T7TtNb3127075
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 08:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:sender:subject:to; s=qcppdkim1; bh=LRSv
	BkOxmFfSvvHyBkj/0oA1CyIi1zJhk4YuPXTiP1I=; b=XDNo1BXtzNMvcXKDCBUs
	M9P/Fn8yOAAUJ3c1i6jwUz5rYUd63ZeTRJm5dksyefSQnuPBYxDD5HM6fJPjCzMs
	iK2NLig4GwzlfkoWxQ4CjQfgeffBTHAGyHbF7VM0EGtWX8tH6PwBXBQEIF2gIzN7
	AcKDXkdW4YC/dDsg/BQtN0whsPW/Sf3PzURD2RmzIn5qycNZci/RnuIk5HRp4ERT
	6FTzbSoomYORsBhoyM5IJNQKFneDB0op5a5GHCmFfJgrxUva7yvL6sZ0L4cu5Pu/
	SuPrN12wxCJmdN907M77DeML0JbNR8UF+J9tGBxK52TG2NY/UJvkhvLDc75V/Zku
	kw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h02mjhs9t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 08:55:38 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-341eff9e381so3394854eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 01:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790672138; x=1791276938; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LRSvBkOxmFfSvvHyBkj/0oA1CyIi1zJhk4YuPXTiP1I=;
        b=fsnHKIYho0atAXif19qtESloTOzCBlWwCgUloUK+qqpxZBS9QyzseHQpwOXEZSA9VT
         p6t4EsVu+9dap/QwTSHE/5OVeZMku7b4hHauyD9v4w6H159pZ5Oj9Hrk5W2WBIYeFmsY
         hmg53P78omQbQe3l+KjsALHIQBfj5ueLggqaWWnL+mRRyu7QuRZaprpkDDONa6UnulUo
         OYRfj/ExpM5dAB6c2vqIkGOT0/PusktwXR7jRgKHp/O67pFtRLy3kmDnRxthncgF6ygy
         jdA/hBxriylApJBPKj7T6A3rYl52k6xWl5nvZoSayxJaOHWKXKro0yAEpeDj5Rayd8Jk
         b41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790672138; x=1791276938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRSvBkOxmFfSvvHyBkj/0oA1CyIi1zJhk4YuPXTiP1I=;
        b=Xi871mBUgw20qStvcSgad/NdqmafwzYBzOtZaPwS7gB0KbcnOLt+3v/5W/Bb0kovOl
         DdUQkI+YHN+lc50o/IeeiQ0Cf07+AccR37WWkv5r1Uoegn/7MQJmupD2TjfKQwsyX7b6
         X2w1kmm+Zu+0wyAQJpcxDFk89YUNwMjRsK145HUtZUfSfOisdAGoUwQg1msqjxk5tBHA
         oYCyX4We57BPCtDWxSqJ24VSwPl30ctNHlhEWLYYKqgOLH/5uvvjy6+ELf4FolfZw+c5
         ifdt1z1AYvNhBA29vmB6auVmKMTLUFstY93SXpsHA4fVws/6WrNU0McLs6fCf08sds57
         pMQQ==
X-Forwarded-Encrypted: i=1; AKwUvBz12NMH+ESxg7dQqtetdmLndFgis90Nyk71C30l7H6INu0vZUnx8PZWFouN9ukl1Gt+i2t7fZ3IrKDEtQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYLY0rwXUvw2sPqMWUlaJLYqQUc+LsrXUMaFfsKJCMweP4ExB1Tk
	uXGtayZGDnL3OaXlSby0vs4s8iEPG1Wj5dlMurbGFfjZGrksFWGwVfoMzpG9Vm8R7FPocr3bWGf
	T7XLWFFwhNJPKrEPtbLRV19jOIaZvtREg0HThiiN11PurvYRu8fTuM7YeMg1zzdGIKNBl93arII
	7g358=
X-Gm-Gg: AYBFou0w+4CPSkA8LQ4gOSp+YKDNRzUeZJCxgVHu+ZIeL257xGA/4InanuZmlT2Cshi
	iStJcLmt46Fyr6DUSZNJQ+w4L8vC6O9kdUjrYoWri/ONbbT6U8gk9w/nbVK+EWtNBA7M9i0b8fs
	OsTTC6UGrxK7RcTVgheIVB/JE5bfWUnfKMHvCaS3lA8L5KhW97S6sMDqKMf6mI8DJV7dDUf7+GJ
	kvbBO7zjfpDKRn6TPZYcB0FPpsUw3rRvJezKsoJUEIOU5Sduk8dNATaOElUTXM/9/B5sClMyktJ
	++rSOJNlfJ8x2A97GZ4cLg6wbdge2oV1A7H3v5dZgSoITt34femjnEM03gBKNG08Z//1bDYANAO
	GLyqlTBHvKoq7bcL3sb8pH6ymrq0kjERfNm7aiINWaHawMaIgziARSune
X-Received: by 2002:a05:7300:8189:b0:342:e7a0:2829 with SMTP id 5a478bee46e88-342e7a0534dmr16856658eec.26.1790672137496;
        Tue, 29 Sep 2026 01:55:37 -0700 (PDT)
X-Received: by 2002:a05:7300:8189:b0:342:e7a0:2829 with SMTP id 5a478bee46e88-342e7a0534dmr16856617eec.26.1790672136873;
        Tue, 29 Sep 2026 01:55:36 -0700 (PDT)
Received: from hu-sunilvl-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144f4eb9esm34294467eec.19.2026.09.29.01.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:55:36 -0700 (PDT)
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
Subject: [RFC PATCH 1/5] of: property: Add in-ports/out-ports support to of_fwnode_graph_get_port_parent()
Date: Tue, 29 Sep 2026 14:25:20 +0530
Message-ID: <20260929085524.1554507-2-sunilvl@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929085524.1554507-1-sunilvl@oss.qualcomm.com>
References: <20260929085524.1554507-1-sunilvl@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfX8/dUJiXzlaLQ
 bJI2onxr9aiMjaC5fm3e1aTAhVwiJOC3dgGLBM/ESBg6tRyRWQL19BCVCwQwZp/bi+f0P5fiA08
 E13JBMYWV+2/mYoMQGxrGEdnfGfOBo60J+Qytic1WzYX6DJ2xDPsvY3s8YTXs9lLCmJ3LzhMibg
 qkWQXOvkq1C5tuDFEjsLqezDcRHjQneO6Qdcge3K/+phbmIjCAX/6CVyocpNegXQ3bnD64EYyGo
 Ds9Gp3wFPkfY2b8Aq3NF0bU1b5Njf400o6S9VVkeagZ71nzU/owCnDb52kYZhGZweTbhEs+2uya
 qmCv/4XjO4euNHeia/QaL44Rsrjv7OUED69+Stmfc/Wg+pGWRCaBzwMGfy/G997fr/XrjdyfqCW
 j76pvvpVOTpdcSA85IwbUnUfd4x6DlgH1W7RFn+GyfNXD2lJkad+7c6CuQELuYs5retAC9GiAUq
 vhrEiY2wywRzbBz8+9w==
X-Authority-Analysis: v=2.4 cv=OdgNnRTY c=1 sm=1 tr=0 ts=6abb7d0a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=DZTdMQFrvkQ_zHhSGZ8A:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzNSBTYWx0ZWRfX+V37TpKPcYx3
 qDMPksJ5TibhP0pMKmFn1FncJuvUDQSe0EKpiMCKrdGeXEJui1rcB/iEmWnu67MTl2+bbszbn9X
 MIiGsdiig4DmdrmfwZoBfexjOJW1rhQ=
X-Proofpoint-ORIG-GUID: cBKWNzeC3hBpxdm4M5XuGKeMLnPthQ4O
X-Proofpoint-GUID: cBKWNzeC3hBpxdm4M5XuGKeMLnPthQ4O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 spamscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_015539_902730_AEE2E682 
X-CRM114-Status: GOOD (  15.56  )
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

Similar to its OF counterpart, the helper
of_fwnode_graph_get_port_parent() should also treat "in-ports" and
"out-ports" as container nodes. Without this, fwnode_* interfaces may
incorrectly return these nodes as port parents.

Extend the check to skip "in-ports" and "out-ports" so that the
correct parent node is returned. This change helps in using the
fwnode_* interface instead of OF-specific helpers.

This change is similar to commit 8f1e0d791b528 ("of: property: Add
in-ports/out-ports support to of_graph_get_port_parent()"), which
addressed the same issue in the OF specific handler.

Signed-off-by: Sunil V L <sunilvl@oss.qualcomm.com>
---
 drivers/of/property.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 72cf12907de0..c259ac1f0457 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1228,7 +1228,9 @@ of_fwnode_graph_get_port_parent(struct fwnode_handle *fwnode)
 		return NULL;
 
 	/* Is this the "ports" node? If not, it's the port parent. */
-	if (!of_node_name_eq(np, "ports"))
+	if (!of_node_name_eq(np, "ports") &&
+	    !of_node_name_eq(np, "in-ports") &&
+	    !of_node_name_eq(np, "out-ports"))
 		return of_fwnode_handle(np);
 
 	return of_fwnode_handle(of_get_next_parent(np));
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
