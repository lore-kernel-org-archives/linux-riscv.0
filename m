Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BF7C7115A
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Jun 2025 18:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=75P4TKbVP8/mtIab490hpHQ8m1EyOtxUoxfo44K+M/g=; b=nS0ABGpuW+JyJb
	NVAZv6uGZr645EaXEKPk8nGJ4aL2+1QiRBZt2K3yVdiB9iKoNuz+2OdMh923Dzum9VbwRvyiYDSCr
	budbca/7Jbe3vG46UMzV0A6/Purbnj53Mb4g1XWO173+HNnqD8Mqa7K1PECnlNWIjMWK1195eMdA5
	qk/fEE4Khzp2njLwwlzImU9kRpGKPixz7e2qcfMUfRo6ulLqyPiDCndDYEbd3DjQBUGYSTLNCUovz
	fgAGQhNH7RP+7bkcMy1Xh3jqVrA6UZaCuZcD55GcUNGYyGEBwcsFAiBoaTl0QyFLVhjgXG0QcwPff
	KbBdtzs9u9c2HEUP5ciQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTP3u-000000014cZ-1Pyz;
	Sun, 22 Jun 2025 18:05:02 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTP3q-000000014bj-3awQ
	for linux-riscv@lists.infradead.org;
	Sun, 22 Jun 2025 18:05:00 +0000
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MFOsmY012084;
	Sun, 22 Jun 2025 18:04:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=2ZadFmUpgwRwCkvnChkIoUOWgsfQT
	tHLA1DRXKQ/D1I=; b=LgjkSwdFpnuyut+cLviGogaOJXEodYmiPtQGgYndEItrK
	O76AHi9vyskAjOcZHdYYEDbRDu+/Ctnhofoqajp00Qmysk6u2zeT3L29XSpGeFic
	n6dCQ8U4z+Qnzi8DK99rzLHkuN4TpdiHBpnt+w5muSAD581I7n161m2X3ZOReHz1
	hD4KiUXptAkw3ohAhuC8Y1gz+Fjjmsdu7uqwviEuXQL7wI6J6LMno57uHgsZgpwV
	tX1/kLqUD8BIeL7xORQn2fE5KPtAFvuwDB0UT1/OrscWjUfNIparaG2X6WBsvaie
	9KA2lTxsbvzDCErwP1chdeVeO2A3pGnIJC8yDuadA==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds87s9v0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Jun 2025 18:04:53 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55MCHR1g005018;
	Sun, 22 Jun 2025 18:04:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehq1kx3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Jun 2025 18:04:52 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55MI4q8O039284;
	Sun, 22 Jun 2025 18:04:52 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47ehq1kx3m-1;
	Sun, 22 Jun 2025 18:04:51 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: conor.dooley@microchip.com, daire.mcnamara@microchip.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org
Cc: alok.a.tiwari@oracle.com, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: microchip: mpfs: Fix incorrect MSSPLL ID in error message
Date: Sun, 22 Jun 2025 11:03:49 -0700
Message-ID: <20250622180352.4151679-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-22_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506220115
X-Authority-Analysis: v=2.4 cv=a8gw9VSF c=1 sm=1 tr=0 ts=685845c5 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=toDgYEdFdHzvqbp0uI0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDExNSBTYWx0ZWRfX6PGt+odVXGr2 XfLf9nAOge5rjjx1uBXZogG92CFvN0ScQ2yNRBc0+5wLVkBsdnn1VMLr7i6YUmtLvd2mLagm4l3 glST64u+VBtu8UcLDUiCar6w6yWs1U4ypWKFAWxiG5mzEhQdqm01TjgD94If819sDIBpT1lWawg
 DUyA7XM60JDMUQVsFzRs1xlpPWVkcevT1qRTW4wEACG93Giq+GsGvM6JRoOoxYIVe9EXnPGe/e0 NGcqisiFedSOGNYDX4R8zGncjRsQ690RZi4Sd8TC1hFZOy6e3sy/Fc/xJXhnhYd3j1oETEz5Wtw kCb+H4Bws6FmnERIObvCeQb1o2Dju7n/TFV2wAjqZSm2igsGa/RSaIc1CgXm2vFD/Gl1Jzy3iRo
 U0OAZFdG7IfBMjQyj5Y7Nw7qOZtRF2RN1ZJ+yrg7e36SxkvrJUtYzmwXjUImr/28XV7LG1nn
X-Proofpoint-GUID: iVe1w60Qm8PEt_UYtpad-pB6n6NaiNST
X-Proofpoint-ORIG-GUID: iVe1w60Qm8PEt_UYtpad-pB6n6NaiNST
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_110458_895679_C83C325D 
X-CRM114-Status: GOOD (  10.90  )
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

The error message in mpfs_clk_register_mssplls() incorrectly
printed a constant CLK_MSSPLL_INTERNAL instead of the actual
PLL ID that failed to register.

Update it to msspll_hw->id for accurate diagnostics

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/clk/microchip/clk-mpfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index c22632a7439c5..d12b7120f16ff 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -160,7 +160,7 @@ static int mpfs_clk_register_mssplls(struct device *dev, struct mpfs_msspll_hw_c
 		ret = devm_clk_hw_register(dev, &msspll_hw->hw);
 		if (ret)
 			return dev_err_probe(dev, ret, "failed to register msspll id: %d\n",
-					     CLK_MSSPLL_INTERNAL);
+					     msspll_hw->id);
 
 		data->hw_data.hws[msspll_hw->id] = &msspll_hw->hw;
 	}
-- 
2.46.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
