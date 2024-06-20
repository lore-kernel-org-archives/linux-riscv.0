Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA03BC27C79
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 03:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pVSQKIWaJWymyraHy+ijWRlFj/K6T+r9mw0Fa8fu3RI=; b=O9aFN1RlSKuig5
	Gmbqf7b1zry2hkI4jWvNgzBNcC7Jbvio8aKJg2EWl05m8JpnhAitrI6u+yhm1mkr9Ikuc5EC/mOVJ
	N81ScUAZTsWl8z66gkGv/TAi3TfZWO3E8HgaMs2ybQX1GZufCi4VY90N7YNsSv+r6zZc25oOMY4qn
	cyBIfXZPRp6SFuY8dSFEIYjCnVfuJWuW+RtmjoZYYAL/2GFgL1pstNnwZMgKtjipgUej0YurFCqsF
	tuCG9Th1uG0mzczJpvifDl2RyTpeAEOXTYJLdNBUPobzKU92H5xEOR/Sl/zFQhKiZOInQOf58Eeaj
	L4FBE6IdI8lMY/u1JVWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK8Zw-00000003TqY-2POP;
	Thu, 20 Jun 2024 03:35:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sK8Zs-00000003Tpa-15xI
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jun 2024 03:35:14 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45JEw7Da025146;
	Thu, 20 Jun 2024 03:34:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/8F1oqaHP7W8dzdNx4W8F2
	ghTuXXnl53DkuSaN9iNVo=; b=YTm9juk53ITPUX4Twa7CGMgzmDel8/dF2w0bWV
	3LrHg7sSjTH2fyGJA94aWtcuV1TLMaACXwuTLVpyUUuFSiDlwjo08EZHPZKQrA0d
	KWh/DuCZ8qJQ9zzfTaAwj7OeUOml+N4B8E9URyVvI0Ag+h/5znk/lhgA2YhlCoVy
	cSEo6Ys2barVGyWtnPnChK62iLJAXnQ8OSLCciIiU0YCVTMqwlC5mowdQinGhKXu
	OOQGAWaHsxNvM3IE4oYp5k0QkTorEn/1pfjvl/v7EIgEL26jYV2mfdYnizU5edwZ
	1FlVh4JAOS2mtdeEJQ5js0X/1/hGumiZmOPuWweDSNkfHU4A==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yv1j91a05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 03:34:54 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45K3Yq7K002169
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 03:34:52 GMT
Received: from zhonhan-gv.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Jun 2024 20:34:49 -0700
From: Zhongqiu Han <quic_zhonhan@quicinc.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <andy.chiu@sifive.com>, <conor.dooley@microchip.com>,
        <ancientmodern4@gmail.com>, <ben.dooks@codethink.co.uk>,
        <bjorn@rivosinc.com>
CC: <quic_bjorande@quicinc.com>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <quic_zhonhan@quicinc.com>
Subject: [PATCH] riscv: signal: Remove unlikely() from WARN_ON() condition
Date: Thu, 20 Jun 2024 11:34:34 +0800
Message-ID: <20240620033434.3778156-1-quic_zhonhan@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4w2VTZiM0lcOsouI3XGulbIfQtvP8HMm
X-Proofpoint-GUID: 4w2VTZiM0lcOsouI3XGulbIfQtvP8HMm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_01,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxscore=0 adultscore=0
 clxscore=1011 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406200024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_203512_582304_23709D8F 
X-CRM114-Status: GOOD (  10.17  )
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

"WARN_ON(unlikely(x))" is excessive. WARN_ON() already uses unlikely()
internally.

Signed-off-by: Zhongqiu Han <quic_zhonhan@quicinc.com>
Reviewed-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 arch/riscv/kernel/signal.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index 5a2edd7f027e..dcd282419456 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -84,7 +84,7 @@ static long save_v_state(struct pt_regs *regs, void __user **sc_vec)
 	datap = state + 1;
 
 	/* datap is designed to be 16 byte aligned for better performance */
-	WARN_ON(unlikely(!IS_ALIGNED((unsigned long)datap, 16)));
+	WARN_ON(!IS_ALIGNED((unsigned long)datap, 16));
 
 	get_cpu_vector_context();
 	riscv_v_vstate_save(&current->thread.vstate, regs);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
