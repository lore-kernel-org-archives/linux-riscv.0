Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C818BC47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 21:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lH3Z0ldZwnnpfwSqvBF5/FVFAFdmlsKHFjWOqlYP3rk=; b=h7I09p7AOMr55b
	EFY0OX6rqfAkJETlSO4Ziftj9UKqPb4HCcpFp/P8aBsRGtqyIxYshiBKVXbunWgu+AgkMFBQZV/EE
	akc8Wis2yb8k0zNnrPgBItshQgxosrW5LTluC8xA6Zis9N5DUVAQ0upiRHEBACfKDtcd0L/4DdCbT
	qkVo5Iic9lNLTVUh0/+RKD/3xnk+a2yu23slhzagg1Jq7A2uSWj6soJTw6cMIULlHHKn3ihxDDONv
	JsKTDcqlPfY7Fw/HyyEWm9Xa9gllHim0Oi6VROMjXzlHafK1wsRSksZmzwMZy0jF/Ayo3CBIu+rXY
	v60DKabNfo5zoPumbUnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT78Z-00000001wwD-0adF;
	Thu, 25 Jan 2024 21:19:51 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT78W-00000001wvt-35Et
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 21:19:50 +0000
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40PK43rd012784;
	Thu, 25 Jan 2024 21:19:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=corp-2023-11-20; bh=CIHwyk4NLYRBuUR5KT54uIX0Wrw2fTYacCFWa0LyHT0=;
 b=kYDLaVVpLNcNBGCDJlLxAOkCXxKZXHn0YGq4ElpWkTZ1J6pyKP8kb/vNT1AJq/cbwu7+
 2eI0dMOqnXR0QnhysI1z7kCacKveq6BGRXHFJftzlcPs24GeOYZzQQf8phPVuFfTuD57
 KniFyT7EafQXxDuHgRhx+twEDixVeALELgLLUPJs0uuTz1Sm2bN/KsDCBjAwvI+Gp36b
 s0yTrZhDvxz+xjsz86uOEHmUCk5ME2++SVChNFZD3ANdaiuIwtAb0sMkaHsrkWAoySo/
 sVrbjfoTQGTGHH+PNASn/HceGh2njk8sxd5+P57dZfmPicXSjcNL9YKt7CJHwWZ+S1O3 Og== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3vr7cv0g35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jan 2024 21:19:45 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 40PL2Lfl030682;
	Thu, 25 Jan 2024 21:19:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3vs375gcqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jan 2024 21:19:34 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40PLILn1026551;
	Thu, 25 Jan 2024 21:19:34 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3vs375gcps-1;
	Thu, 25 Jan 2024 21:19:34 +0000
From: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
To: conor.dooley@microchip.com, daire.mcnamara@microchip.com
Cc: samasth.norway.ananda@oracle.com, linux-riscv@lists.infradead.org
Subject: [PATCH  1/1] firmware: microchip: fix wrong sizeof argument
Date: Thu, 25 Jan 2024 13:19:33 -0800
Message-ID: <20240125211933.409529-1-samasth.norway.ananda@oracle.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_13,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 phishscore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401250154
X-Proofpoint-ORIG-GUID: jxqHaME9gXUylLwjD3NvraxeA-8nxvEu
X-Proofpoint-GUID: jxqHaME9gXUylLwjD3NvraxeA-8nxvEu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_131948_802861_65D94664 
X-CRM114-Status: GOOD (  15.74  )
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

response_msg is a pointer to an unsigned int (u32). So passing just
response_msg to sizeof would not print the size of the variable. To get
the size of response_msg we need to pass it as a pointer variable.

Fixes: ec5b0f1193ad ("firmware: microchip: add PolarFire SoC Auto Update support")
Signed-off-by: Samasth Norway Ananda <samasth.norway.ananda@oracle.com>
---
 drivers/firmware/microchip/mpfs-auto-update.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/microchip/mpfs-auto-update.c b/drivers/firmware/microchip/mpfs-auto-update.c
index 81f5f62e34fc..682e417be5a3 100644
--- a/drivers/firmware/microchip/mpfs-auto-update.c
+++ b/drivers/firmware/microchip/mpfs-auto-update.c
@@ -167,7 +167,7 @@ static int mpfs_auto_update_verify_image(struct fw_upload *fw_uploader)
 	u32 *response_msg;
 	int ret;
 
-	response_msg = devm_kzalloc(priv->dev, AUTO_UPDATE_FEATURE_RESP_SIZE * sizeof(response_msg),
+	response_msg = devm_kzalloc(priv->dev, AUTO_UPDATE_FEATURE_RESP_SIZE * sizeof(*response_msg),
 				    GFP_KERNEL);
 	if (!response_msg)
 		return -ENOMEM;
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
