Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A745C5AC9F
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 18:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qB9oa4kw2r4fKNuuAAYlFpbm+InvY/S12A1jK2OEoKk=; b=24h7den7Qjpxo+
	vIsZZJByA4eQtGcFqgxOE4bwQzczSQLxvkBLTiMXTZMFJ3D+rbnVzIeM5yrQneourqJVM5D8aFNoO
	GyekjjZhPYT2xZ5tZn9DW887omTg197p/WN857Os8lmXE4E2U/cSoz5s0K6cw2OsVy2MPT3SQWZs6
	bHa3nqxHSqukqRoBO7MLEHnPx1kGYi4ktiRW1hKXxRSu+Wxir70dfuhOW4rfMKBQJOAcw3/4HkSx7
	fvzdQN1jSomoZ+MpnFLAKsawwkl4KFnx9UPPsS/FRq8LxesHwK/s3Zb3Rhv+4IGIVHGVdfKchYtfd
	aKfvP9M7EhT1AELd5f2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8S-00000008ZIH-2oMx;
	Fri, 07 Aug 2026 18:17:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8Q-00000008ZFo-30h8
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 18:17:35 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677GOkpj2041453
	for <linux-riscv@lists.infradead.org>; Fri, 7 Aug 2026 18:17:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jLH2lzhcItT
	X3xUJhpiKzl44Klgt40OlAokl433kV9I=; b=CrwD9ATtobyEmHGlwUeaA9X4S0y
	o8fByb3QLm31pLfhn9dYcgnTv0KgS0ZVuadEMj6RT/cT6tUeSX5k4yLOUAVeXFDf
	xbBCJctI+yUqKxi/Lrz0yszxmWR0Lzq3GlNevmBBwQ8XSGRpEKCaRHELtSNtPIjm
	gD1VERgGkSxEtXvtROPkkRrqf/T9zSquBYk5QzeIqvWBr9kl9wFTAszwEAoSFy+E
	QU9rh2Hh5yOU5ybdTBmgRgfZQ2Q7P6lqqUSq5614mcGIXDqsRM1MVywQMEWfvLGC
	Te201JAKnL4iseV87DanuNk+QOODCEMZf0tLZChAE2AgF56g08dB29sXOKA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwcjb2747-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 18:17:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a23afcbso39784291cf.3
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 11:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786126653; x=1786731453; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jLH2lzhcItTX3xUJhpiKzl44Klgt40OlAokl433kV9I=;
        b=OxKtUw8WUm6Zg/yNBwH44d5ttA+Xx+FVvqwQ2xJ3weUGvwJXPw7V8LWWYY80JzdZo2
         LEOkHHwJz663pCA6T48BjrnMidbmiJIWr7833TE/KKIAS9hdACZkoN3fpC/RjO+7CN4M
         y567/ZBfA/MSHhrUH4FTK4HOm2msOiWNMNuSHwdTCt6jXuLTNov8k/ytj/uWMNy3IvkH
         R/PISz6T6P2t/Kpa34RneZeHst/GGMY6AblgrbrwtkhleCsVxtV/D1piVnnavDUJIHyI
         Wvq0Bi/0J3MZKibzcKsVJmrVDkuwW9m1TzAXwtD8NdnDP3ttRYeFbt+KCy5pNPETyvRB
         q6AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126653; x=1786731453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jLH2lzhcItTX3xUJhpiKzl44Klgt40OlAokl433kV9I=;
        b=BidtSttIbxS13P8dQ7x6WmeOwQmwUQxdVfmtt4YIN5jKuRbbwcBunngbx7tLy8clX4
         dlU02os8NM66Al9F/vo06nuHSKUGlqamyIvOnhveSqadGG37/D6ZMtOaVWRx8/qxHlJo
         xV6OHlj6cAfHrKNL59UUxNlfkxuNGUyUOaNJPAdjHj3/dwN2Wwz9g0r63KzS2Q1X0SBn
         mnIaAQiWi1dX3CUiGSrhqQNIBpyHjMf7q9Y4Qtdx98pmVf+i4FSRTY6EfVG6l17WPhzH
         kus6lWzx6MP//fk+nr648Fe4l04mo75PQJh58dGzSXxftogagR6FpJHbPD5cftNOxciX
         E5PQ==
X-Gm-Message-State: AOJu0YzIzS3l/uCOJ2i97HzkH79ZR8aMaQYVhiu78YBURtJErrjkru/j
	TmnFuw1HolnM98o+Qv5wkHOmC2ex9wOtk5SxB92nw4SqKnSQBlkMMoLXRgA39uL0+i0sL7geWzz
	+zNTU5k0g9wIWLQhq4VMyjkFjZrKKoXbpE0Ni+/tZ4hp6DbbQs1rB4lD5bTeH7JFD+WX32CLMFv
	Rxx18=
X-Gm-Gg: AR+sD12t4n7E8D1LwK9A0v8SQTCaemiZVNWUZGt5EzmpruYT5xQKIzFOW83nxOLmZDC
	uTEJL1s1XUN/aXf7LwM3/vsQab8zLlc5oHEEu/FUy54uV32moLToC9aL24/IKxUcnO0PAioZt55
	wE9/KALYTQljnT7L45swBADX06v9GvYZKcLFX5FV5mdxn+cyIwOhPdpztzE/o5idqDapTz3C7lM
	opw2Miioa99AIRjqKZyxPHNSbyfCqOQ4vKZyEWRxLOWaDSNGsowaZvyeMDJt0nffpkK6jvjbbnK
	BsSo9nPisgJwOMZAUJexkOOak4ZaRJ2ZnCMCw4IsN4qERf3kFNiFBLKbjjYIC79LdeIgAgeuXNd
	X7wM5UaMC+sbIAHZo7Tj8v3q57cNMhnLpblBSIOY=
X-Received: by 2002:a05:622a:588d:b0:528:3882:386a with SMTP id d75a77b69052e-52d18e6e5b9mr64238641cf.11.1786126653004;
        Fri, 07 Aug 2026 11:17:33 -0700 (PDT)
X-Received: by 2002:a05:622a:588d:b0:528:3882:386a with SMTP id d75a77b69052e-52d18e6e5b9mr64238021cf.11.1786126652593;
        Fri, 07 Aug 2026 11:17:32 -0700 (PDT)
Received: from localhost (ip-86-49-241-13.bb.vodafone.cz. [86.49.241.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080cc3835sm85483366b.44.2026.08.07.11.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:17:31 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v3 08/19] iommu/riscv: Prepare info->domain for concurrent RCU read access
Date: Fri,  7 Aug 2026 20:17:02 +0200
Message-ID: <20260807181713.228535-9-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
References: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX1+cZaFBH5nmr
 XaiLkhzWBQmiBvicEtndtKFuKGpDnaBsC7Tr+Tp19lTfUIlXmL2KHaA/eqEdSCNf8Mop7XPQlxn
 JOQMu58vqcaOQ308zYBTmtH2agS/vy6aClb8ZYy7GKbDAs4PysW2YjS252x1mbe11FQjn0DhVh8
 nD1O1jhxaBicj3mgrLzpNqJn1hU3ltNVIAG8b/xGRV3jo4REclE+oASnoey1mXdvxl0gncd/cs3
 01aAIieK0W/FLfrw6buypRa5u0AyJXbiXC4uaBr+BNT7dUzoVm2vcOU5j5fqQdmIuenlkuQXvg6
 AIVrWxgcNyt12B9DYvpYKyJR2A5+pIWxpB2EGEuwGHhUazD8nRHZrqI8fe8+Ku5i9TqyU2QZjQm
 O7y1KK0dwEoI3waUXm6FimeHFgflH6B+Gn1rSVioOWaUsSLCPxSVJhDI4XXXB3tLWyHb+Z1qhUZ
 MwwiHjQrX1admyrYwQQ==
X-Authority-Analysis: v=2.4 cv=QsBuG1yd c=1 sm=1 tr=0 ts=6a76213e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=VPysOpcHbS0DNrM1Xqmyow==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=j3M2sUOd0rYxyD8OH6gA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfXzz7E73zSBVOi
 Uvg1tke6WV1x2YKzDqWvg8XV9uecI8Aui1yIz0q70S0ohuk0ANFGHP5qidT3JPv2wcny815y/Zv
 PKIAhYzJaTnWq7leBAEXSxHkV2QkoUE=
X-Proofpoint-ORIG-GUID: -ewVfMRQqeN-Hu8J7Wb5jajW_cCxzxWQ
X-Proofpoint-GUID: -ewVfMRQqeN-Hu8J7Wb5jajW_cCxzxWQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_111734_771237_EA086883 
X-CRM114-Status: GOOD (  13.00  )
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

An upcoming compose_msi_msg() implementation reads info->domain from
potentially atomic context, concurrent with domain switches. Apply
RCU in preparation.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c | 14 ++++++++------
 drivers/iommu/riscv/iommu.h |  3 ++-
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index bfe606a0cb9a..27dfd60834ac 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1241,6 +1241,8 @@ static void riscv_iommu_free_paging_domain(struct iommu_domain *iommu_domain)
 
 	WARN_ON(!list_empty(&domain->bonds));
 
+	synchronize_rcu();
+
 	riscv_iommu_ir_free_paging_domain(iommu_domain);
 
 	if ((int)domain->pscid > 0)
@@ -1296,8 +1298,8 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 	}
 
 	riscv_iommu_iodir_update(iommu, dev, fsc, ta);
-	riscv_iommu_bond_unlink(info->domain, dev);
-	info->domain = domain;
+	riscv_iommu_bond_unlink(rcu_access_pointer(info->domain), dev);
+	rcu_assign_pointer(info->domain, domain);
 
 	return 0;
 }
@@ -1373,8 +1375,8 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
 
 	/* Make device context invalid, translation requests will fault w/ #258 */
 	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, 0);
-	riscv_iommu_bond_unlink(info->domain, dev);
-	info->domain = NULL;
+	riscv_iommu_bond_unlink(rcu_access_pointer(info->domain), dev);
+	rcu_assign_pointer(info->domain, NULL);
 
 	return 0;
 }
@@ -1394,8 +1396,8 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
 
 	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, RISCV_IOMMU_PC_TA_V);
-	riscv_iommu_bond_unlink(info->domain, dev);
-	info->domain = NULL;
+	riscv_iommu_bond_unlink(rcu_access_pointer(info->domain), dev);
+	rcu_assign_pointer(info->domain, NULL);
 
 	return 0;
 }
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 5d83537911b6..ded18aec8010 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -15,6 +15,7 @@
 #include <linux/types.h>
 #include <linux/iopoll.h>
 #include <linux/irqdomain.h>
+#include <linux/rcupdate.h>
 #include <linux/generic_pt/iommu.h>
 
 #include "iommu-bits.h"
@@ -33,7 +34,7 @@ PT_IOMMU_CHECK_DOMAIN(struct riscv_iommu_domain, riscvpt.iommu, domain);
 
 /* Private IOMMU data for managed devices, dev_iommu_priv_* */
 struct riscv_iommu_info {
-	struct riscv_iommu_domain *domain;
+	struct riscv_iommu_domain __rcu *domain;
 	struct irq_domain *irqdomain;
 };
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
