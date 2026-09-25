Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E15FC98325
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 15:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X+RlEMcXPARYmtizkeMXHaidOfJNMBgcJeWxNxncnLk=; b=YkLSzJvNDQ5MCU
	RIEsiVTVMlgnyZuNadxdEbTUZNfAA74K6qC4kD3FaiH1sm6zrmhRZ36xO49zrmKRXwQfZ/lS3Xrjb
	TiVVQ4QtkOSq2AlcBd3LCKbhb4l8UOcoz4XvG3UL1vZULZR0U76onDfZVxQlWLi4nz74UNPMkAKvh
	DxwcvergPUcxjMrJP9faNw6s+Vp3fgF2v5ylo4C0F5OsTLC79w9qjZUjHVq4tMBFWMrbUAyUvdcrK
	SGhNkFQa94lSPuX7mMwgAkO5pZFE0eI+EnE9qGyIYMMZ6ZyJ3iP94O5mh7NEn2E3FJQho+YgQPMWH
	GP6KVo3JjNtHTHwkIpTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7fl-0000000Djny-2OE5;
	Fri, 25 Sep 2026 15:17:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA7fi-0000000DjmE-1Otp
	for linux-riscv@lists.infradead.org;
	Fri, 25 Sep 2026 15:17:11 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PDOK861055735
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2Di7hXjezOC
	UALhcHgOGZSJbeZgIexdT/Z/W7mUl2YU=; b=VQ1Wo9OccKIVhqnOLCsJBz+TotK
	euZTwoFXCT+u8zdZvYN3t+mydoYsS5493vDLf4CROr/rCLtV/dmxw5bh40D4btyQ
	sEw8zVtraIU3nXKdeojYwkAWJ3oTQRbp3Zus3dk+/PqNsanf4DQi4zgtvHH/iRPc
	vrsGByVGc7cSt9SgbK0cQtCnxno09ziPqWYC/RuC1PSmN1LNC3ikLe/bP3ocbc4G
	DVx296DJvkoXyPPOAHe+JATV6S1m66adQ+j6m++vzq3qlOY2ZlwYa3d8RKKRrMs6
	D3zVYR/r7JGxgiokIHHoHNwxsk4VSpXoLTXt30qFEiuQ5WM4fv7BYvMgXMA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce7b0en-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 15:17:09 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7989d8ef4a6so224058137.3
        for <linux-riscv@lists.infradead.org>; Fri, 25 Sep 2026 08:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790349429; x=1790954229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Di7hXjezOCUALhcHgOGZSJbeZgIexdT/Z/W7mUl2YU=;
        b=PNDkITIIrleuMrXJzeD37tbDVcRKj7Z4B/sCNYZySFGRwZnT5bxaN9cMArceu5RBgv
         WJHNbxSkJw/VOgv9e2EKUuLgw+FqSEPIPMlYHEDbcnAfRWwtuxO6axTUPuO9HS3RC4aY
         8SrUj66EsZ2EhIxFhvbn6elmqvbwtFdMhUYUKihQ7b4cRyNPx6HJM1a0KqqLX/iwrSXi
         B1qwNdzBDCHXQxxjYwBFsoBUcJHwfpi5m0OE+caTCiIyc4pgUuUm3elzE2rG+0h8iqlE
         bmBDXEhp1tthE2n2Rxq1oEP61kilwWi3AygZOo9eYsoQd2gqdrfz2vvp1ZMnGfzJhJZB
         xfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790349429; x=1790954229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Di7hXjezOCUALhcHgOGZSJbeZgIexdT/Z/W7mUl2YU=;
        b=MKgZo4bx76LcjeDJtoEYfpo/hFIwwg/UOIKPmUCFG0FenLcdCRqZzuyqL8f9C0NpSa
         EMSSLTQCn8nMHf6h6UysjP/Qe5rPJPz1f+XxhRAbMaZ4m9ZfVl9X4zja1S2HcU3W2Ylp
         eakfBw+lUlzs42pVA09iU7Pi0+dCTYngUJqFdXfbPPG++BunKCAi208vbVjWei6gOHKy
         qo45QxWD+eZvwXJkq9CngfXBTnB1yJWpw/bKg3mtvAMX9VcOaXIXE3LZBIxU9MtER5a1
         2+gDW95Et3HLvnRggDNBIBBqSFrLWP5O/LmNrxnHUsNk2hioAzrZbkmfDbbDgXsf4GE4
         rHWw==
X-Gm-Message-State: AFuF++kbeqimFynHTrugAMXeApnNFsijhzSWGpxtwJGFqTJEw0kHmbVC
	5/1gKfoL/Op6AqtxVTkO40nTQsXL+6dLKZOWmU/90cugr2LlblUhg3OIsN5+zmUY8SIyFBiPkBL
	YGCA9856D+eevyZNGM+iTW3NOPCTg80uNnhXy9SaN+FeWIB2hOJbtcxLb062h8v2vGfLbdR60DT
	DWcGE=
X-Gm-Gg: AYBFou1WUSVBXjjbfY/oakat70HU+00SJocZYJ174w8OjMeu5kaAzL3E9FUeipQQUD0
	mSx5Wr4WP3qiPsc3u6WA3WOluwXP7FqWYzJnlutVjzK5u8CZcDuyNns4VY7WR1GzPVy4g+1VoxU
	aUcuFyllqwKPH4Yd4eCEmA9tN9E4cxOM7pWtDEZypkgvRcbG6RPQnRAx66AHwTGto61bK4MGYfr
	WT+u+9Q85Dp2iFDizFU51oKngQlfyTXBZG/60h1hsKdRQmwENYahAj7Dw85h1lZeym4yT/AEpch
	btMsWNiT1Cc7CFNDIt74OGcuLbO+/98sUeyGjMJeAgojpVJM+MNR2jQ15wFYtquY4oJ0vVhhhR/
	T9jzObGspcVQ2XMe7RKKsQCoeG4Ir30LD6bQjkZFAhIMu76YF
X-Received: by 2002:a05:6102:f95:b0:7a7:198a:c2c6 with SMTP id ada2fe7eead31-7b1d76ab79bmr910409137.36.1790349428616;
        Fri, 25 Sep 2026 08:17:08 -0700 (PDT)
X-Received: by 2002:a05:6102:f95:b0:7a7:198a:c2c6 with SMTP id ada2fe7eead31-7b1d76ab79bmr910381137.36.1790349428007;
        Fri, 25 Sep 2026 08:17:08 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a74538asm7857424f8f.34.2026.09.25.08.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 08:17:07 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v6 03/16] iommufd: Split software MSI map lookup and allocation
Date: Fri, 25 Sep 2026 17:16:46 +0200
Message-ID: <20260925151659.419512-4-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
References: <20260925151659.419512-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: r_Ec423O70QVdcWH3MH5_7qFjuFLt9Lh
X-Proofpoint-ORIG-GUID: r_Ec423O70QVdcWH3MH5_7qFjuFLt9Lh
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab69075 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=SRrdq9N9AAAA:8 a=_mR3RRazA89hjPCjrIEA:9 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX3AabbQ3CU24q
 3cdZ9RyO4/z7RPMLQ+/LFvrOhxCbLCduw9MgYKPEN+3IpnNNWl/4sPsPKT+dWigjMe5urzL6YJE
 dnA0+2MPImiS+SlCaiaBcx/TzwiblfBJip3s7PGlAJ/pMS9dgEitMaiBlCqcFnECqrVhtjGh4gU
 m5YUG+IV226HxL9+S1wbWuQv8ma3lhCDPDIOSEldi9InPhP07ExJ03xqdL5519gkUbc+IckBlc3
 V7STwaA/WGsv3o3uI0xdIevxJpIoafsUuwNuHAcVqh7SepocS6SICLiMuTs/522pYo8VrNGVy47
 w1UozB93PYwlZsYXklXFl7f1eV5lD25ovbHgZnHJFSQ1ZZ4AqfqBFFaTW0ncWlVdNFR3nVRL4Eo
 G8RhT2eFJFfDLICausUnJvKgz+0OxgqIK+lKYzgbyrAd0dfsbSeVWb3qnYzT063lhwjXvnrwr3Z
 SD36bgoaomMClre0AyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MCBTYWx0ZWRfX/JDWGT8dWsAC
 TXa7tcTBEWWtE9gwS4N6KIZgX2Ci1beZaQWMaoUsaATwnQmOk7RFOERuROJh5UQUvpm4rZAvoP7
 jckf4PB998d9IIKtPLSpaRuPgs59DAI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_081710_379573_C1941244 
X-CRM114-Status: GOOD (  15.69  )
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

Separate lookup of an existing software MSI mapping from allocation of a
new mapping. This prepares the code for allocating multiple mappings for
an MSI physical address list.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Tested-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 drivers/iommu/iommufd/driver.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/iommufd/driver.c b/drivers/iommu/iommufd/driver.c
index ea705e416139..501f1e1f2797 100644
--- a/drivers/iommu/iommufd/driver.c
+++ b/drivers/iommu/iommufd/driver.c
@@ -189,6 +189,23 @@ iommufd_sw_msi_get_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
 		       phys_addr_t sw_msi_start)
 {
 	struct iommufd_sw_msi_map *cur;
+
+	lockdep_assert_held(&ictx->sw_msi_lock);
+
+	list_for_each_entry(cur, &ictx->sw_msi_list, sw_msi_item) {
+		if (cur->sw_msi_start != sw_msi_start)
+			continue;
+		if (cur->msi_addr == msi_addr)
+			return cur;
+	}
+	return NULL;
+}
+
+static struct iommufd_sw_msi_map *
+iommufd_sw_msi_alloc_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
+			 phys_addr_t sw_msi_start)
+{
+	struct iommufd_sw_msi_map *cur;
 	unsigned int max_pgoff = 0;
 
 	lockdep_assert_held(&ictx->sw_msi_lock);
@@ -199,8 +216,6 @@ iommufd_sw_msi_get_map(struct iommufd_ctx *ictx, phys_addr_t msi_addr,
 		if (cur->pgoff == UINT_MAX)
 			return ERR_PTR(-EOVERFLOW);
 		max_pgoff = max(max_pgoff, cur->pgoff + 1);
-		if (cur->msi_addr == msi_addr)
-			return cur;
 	}
 
 	if (ictx->sw_msi_id > IOMMUFD_SW_MSI_MAX_ID ||
@@ -293,6 +308,10 @@ int iommufd_sw_msi(struct iommu_domain *domain, struct msi_desc *desc,
 	msi_map = iommufd_sw_msi_get_map(handle->idev->ictx,
 					 msi_addr & PAGE_MASK,
 					 handle->idev->igroup->sw_msi_start);
+	if (!msi_map)
+		msi_map = iommufd_sw_msi_alloc_map(handle->idev->ictx,
+						   msi_addr & PAGE_MASK,
+						   handle->idev->igroup->sw_msi_start);
 	if (IS_ERR(msi_map))
 		return PTR_ERR(msi_map);
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
