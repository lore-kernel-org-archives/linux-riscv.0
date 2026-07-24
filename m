Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A973C53215
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 15:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qB9oa4kw2r4fKNuuAAYlFpbm+InvY/S12A1jK2OEoKk=; b=Bo8Ta7vrapUeIR
	lD3OvfEX98fx36mpYG6KVtu3C9F1RsY+2FkYVpmnmWagCDmtjHAKYdv8AfQMFqeHMjeZWawC+KSrd
	Ypej1Cx3ENTfnp3/+xqh/MvC9xvCqRCh6mG0j9vl5J3FGEdSCt4SSsCgoQG/Z7opSAgh6tQMNHI+Z
	KPmXalwRU02sVqvyrpUCxe649pDrdpCo11MtvU514TF1W3+BA2Rz2qE1SQpvKSVgxjqnRApzngKDh
	di+BfB5MQb1r/6K6mGt2RdSd1jN+gSEz1hbUG5DM/Nteyj9HeYU21fC/Hx7642Qf77kOvl27C7Z92
	AlvaPVsQWM8Gi8mnEoQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHZt-0000000GfD5-1I6m;
	Fri, 24 Jul 2026 15:12:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHZo-0000000Gf5O-1bHn
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 15:12:42 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbXDb3178970
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 15:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jLH2lzhcItT
	X3xUJhpiKzl44Klgt40OlAokl433kV9I=; b=KxRtSikMc85KdQljMZ2gL3bnETO
	+pWUI6DZohiMQnzOmFnh7b9Oawlg2oYUSKtIxvngky2j04LNqNjShCOHJxKqEU8p
	EXfhdpuWrOTuU2erIIVlrpd99CYIf93FmNKAxivnldcOzVHbZ0UaV9CaYsIhK/Xo
	S/QqQjVE3lAwcim5f2bigSbX3edhuri+FcBveeUr8gzWnV6vNt3Sb3Yx8VPHzJjT
	LRbnj6G+W0+JfoKRg20A801izYx7Yk4/k1Mnt4Tz/9xTNNNzHLKZa4oV1HbuX0Qt
	3+yvMLjLy+r5NOH2qE1LibZ+Lb+WiZOxodNM8pW/7qkYbrw/Vl4+X0rdaYA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm5yah4m3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 15:12:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1c7f135bso8404341cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 08:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905959; x=1785510759; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jLH2lzhcItTX3xUJhpiKzl44Klgt40OlAokl433kV9I=;
        b=Kkuc8mEZw+jb2nU6aTpurB+J1RNqqINIGEQGK90vVnMtauc8ydfxsuPhwI8Pcr8Q/h
         +d/58XjlUMx7os+C8oMOvEGAobHQDI7s69VXxO1B/KPUiE2XATfYPlszUPSvxJlGHYEo
         dn744KEKkrgwiROguQ0hAcv+MfN3iZp72QQlWNUHfwbl2d9ip47CjGjQieOoWkXMGm0P
         lRdL051QfqTvzmiXdV7Hd8JUJ9Qcw3epr9+8qgpe0FyUt9FVc0g+fpmSYjSEhN5u9d2H
         G9om9tClKH3BT+Y9eync+KIyc/pRKcLnHBJua5n+cVgQS91i2T3X8PDWHzb3aKZym+yI
         ziTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905959; x=1785510759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jLH2lzhcItTX3xUJhpiKzl44Klgt40OlAokl433kV9I=;
        b=FqjJ8w02IOUS7Totsu3GLIuT0ro6OHdhtvrUOQGcLpun8EiZ7vYuVCRZh9G7xzgM09
         FO9eg8wVisPWST1w5YqRrTKn6RD4YGMcpQ1C4eonsUZ177q5njssuhVnHo7JWr8zhiF8
         iNOyXfupxqnhkxvuHA8T0sx/ktXv19ZM2Rj+Ao9sCYcA0L2Ly/6gYO9Kg21ztBVLZ0yn
         x/gtFPKusaz1oX6YYutL+Do7xEiN7r9gRdPcX9NT4TWEeY4oVLXlxaLmU7u/TOMPYkH7
         ObZEyydqSYlT2xBuLEz7EZehACtwdcXL4zlAzWxNa8hiiLMtYwZffhJN2reuVMUgulbm
         fQpw==
X-Gm-Message-State: AOJu0YzYXKh5GEyzAM8oM0VpYucJ4b98h10VFpOseDO7pjhBbRgP2w1d
	Eg5/MBANMAih0nUABSEF9nPiKGfAMH1uHHm6lh4KB00j4aZ5I9IbalDPMK2xUt9ncwHj6wmwe6b
	1+DeTUPU08s2Z3fESwO8gk9AvkNfRzKYxfBHiD/EzT7KEjTs1A2bzJh6ugBLeybHUboscVVSCZI
	ktixw=
X-Gm-Gg: AR+sD13EMdRJdZPCD5BSjsAHsRfzK8n9jLpXL2k5epjwcuLREQmEP6KmQ90Z+SbG1+L
	+D2zuwxAAV4VV/wKX4oBMxh8ZAzsec2LNptkqccIWX4uqtEPbxbEtYECpiVmNrAecmMRCl/8krV
	yPcf0tEbyK0DoxCgfBtDBybELtR/A+z+lu+6lYIipX75a9BlRxO+NeBz1MrX53kTSNWlFCVDCmm
	Kbc7q9nQtT8FFwvnYdr/O5mi9mR42wZEdUHfK8ToBl0zAK6uKqB1s2vrf3bPp6/hhlbSxPTtN2A
	k3x8mvAZYKV9SxyVvzCG7jL9JqgZSLbVE8MOgUf0WoIoJcJ6dhkSZUXcQsbLUHO1dcKv7BGsmjG
	o7ekyntk/GTkLWsBU38umUj0MJCuN/EwWi/p4
X-Received: by 2002:a05:622a:580f:b0:51b:ef2c:7bf0 with SMTP id d75a77b69052e-5283de597e6mr73886901cf.35.1784905958877;
        Fri, 24 Jul 2026 08:12:38 -0700 (PDT)
X-Received: by 2002:a05:622a:580f:b0:51b:ef2c:7bf0 with SMTP id d75a77b69052e-5283de597e6mr73886481cf.35.1784905958489;
        Fri, 24 Jul 2026 08:12:38 -0700 (PDT)
Received: from localhost (ip-86-49-247-5.bb.vodafone.cz. [86.49.247.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb51c9691sm151975a12.7.2026.07.24.08.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:12:37 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v2 08/14] iommu/riscv: Prepare info->domain for concurrent RCU read access
Date: Fri, 24 Jul 2026 17:12:12 +0200
Message-ID: <20260724151218.965929-9-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
References: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNyBTYWx0ZWRfXwAJnc0il0aqO
 w1jsxo9BGu1IQX4qxoLGkidW74FPF7CBzR5KrkeRq5js7ybhufIzXK4j52VGtY7x5aFn1gk/es1
 ALSk3C/tY4RA0qAM4DQICGQb+vSEXFE=
X-Authority-Analysis: v=2.4 cv=Rtz16imK c=1 sm=1 tr=0 ts=6a6380e7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=aYZ+cQcEYoLAp2L633VOig==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=j3M2sUOd0rYxyD8OH6gA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: zEEBDo6It8isLlvd5yl41tpLgmdfgvLr
X-Proofpoint-ORIG-GUID: zEEBDo6It8isLlvd5yl41tpLgmdfgvLr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNyBTYWx0ZWRfX4SPnZcEQsoHO
 v49rRWSvCHQkuRlYKWz2qqCpwQhqR8lHt/B6ZQHMRK26hqwof0HdRPsFKHAseEp65R3dzFo9eMk
 NqwEN/XhDIvZlFTsWrX+XsqYgyw7xbGr1VPzVBx6KSOdqzQro3Dz/Ye6K6FNGGxvIsuSrLBnkub
 4bR95BLy6+LzlEJ6PsnL3W4aVmGiymZ3PZkjW/gTOMkTlIYlArgycXfGsn9PJcAQdI/eTE0Z45e
 fs7QoL1thLWo+XY8Jq+rArrCWi190SwcGN8L2FzeAPgs3H0py7+bXe/k2Rx/XflF/S9Y1WMiAKS
 dXCobByFOIRVNxVM9TEAl9MsD0u21GC5Rf1lohmIQCSp/SVpYGbj5nsuXIFExpTk+EpZP7BBOUa
 twxUPAuDi5cF4Znu5NiTx/Wu1hQsEZCkgGVfdKTXJ22jIazRXyvktgscroUWp/84vzBFgP3ivec
 oaJnDOT/V3yZnzLsE7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_081240_552245_00C708E2 
X-CRM114-Status: GOOD (  13.14  )
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
