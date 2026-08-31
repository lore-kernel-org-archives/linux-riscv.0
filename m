Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08CEAC624A5
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 15:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EZ3aGOTMjP3DxFj8j7XrfHbhTLXiwr55P8XUuF7owhU=; b=IGSDmvi4TS7Ejm
	wbiETSOcZUycsYjvyehfY54fr6B39vnuxJuwuHF/7isxPW//rviOUnxKtvtoDLj/KjimPM/gVVcWh
	3AjzVIzpB+Tpf2Dy5yWzCHXCXxVGefCMfums5G6XxGHlpqz/VlQI4hfLZ0FqQmV2WC9wfDVW+zO4X
	Ym/zP5CXS13VM+M8svj9KrzXseBooBnHNqQztXlVKzIF98DriSp3pI4Kt4ZVp8z++7St4MchI8naN
	hPvCFz5CC06zw/NaLSpdfI1qgOcyuU8JJdzxXq85CXclY4Ij8AS3YJTTwxGAK8UK976hs6CT8THVq
	29BY3+K07xk9UQfVqMZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13Ub-00000009kmE-2gkC;
	Mon, 31 Aug 2026 15:00:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13UQ-00000009kW9-1FQF
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 15:00:04 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67VETahb3808063
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 15:00:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eiVni6GVMGT
	zz+EBs6k7T0jGsM2I7x+UuWedP57pHFA=; b=BbFOEZ/2MDMNRfK6RTgunAjE/Rf
	hU2CzD9dfAdJSkYUI2bek5twFcar/2eb3WWJgoYbwF9SQ3wauSG6U0lB/JCPsVhm
	foMLCoEiHj3Aus5LE0BWOWdHRfpvv3DFv7p9h2eogW9rsA3Gy8mkJwfc0fP1EB2a
	H4v5XOBYtoZdpriDVfY0VT/yBIMYGM8aDDIrAuWH/ngc2aSZ9xHYW1IJNAgPHPEO
	hpuEzU09vbccpG1noXSbAWgvxOCa9ksDnoeew7vgYTBI6fFDDaxnSowDRSp09x2l
	5wAOQq6beOhBSfclRCuz4HS+VgA6ag0gIRTLzZAqz9EkR/lxdD23qEPDXng==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv7wbajs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 15:00:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9382f9430deso564165885a.1
        for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2026 08:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788188400; x=1788793200; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eiVni6GVMGTzz+EBs6k7T0jGsM2I7x+UuWedP57pHFA=;
        b=Jy9wzQDyRp2TwPRORRc28cUQJ/eSTvyT5vYHZacqY1QXrI01u55mYesGog3NREc+W0
         TQ9wk4RpGB5bWZDH81zlPjKmTcW6eNlavjKG8yL14mpojRl3500Dw59E+ryHSKc3OtRk
         LMExraswp87J1q3iFLSNqqoJUdmOn9ZLcg+M7f33quCMzP0p/pjlN8OcF1VXtunysT6V
         EpLr/B1EsjpLQpwYc2uNBId3g1+dq72kAmeRMrZS1gvedxs4bfTciZKuej5KToXwkVpx
         eP09A6imEBo6v4PMhLP2JH4ybCVVT/+y+w13CsRdGZ21XZZwa8/vhLrZXAC/dCdlJOFa
         Y9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788188400; x=1788793200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eiVni6GVMGTzz+EBs6k7T0jGsM2I7x+UuWedP57pHFA=;
        b=MJANpLAHQzBt5A+kNuVK9OacQzCuTIrfb/Po+FRjW1jbYIUPtBcHKNpFEafDZGl5q5
         PvXaJXr1gicpcf52ampF7iTkmnkPL6nTwVFLvSH1pLOEAlRxzQDukEs/1pxgbway4F7W
         KH5vsKXLzMRTlcI8cG+PFfBUkAJIdOyYsj3Gpev7xZpKpxMtH0mWa9b/5bCLAPGYEYuF
         0G9zGMA4LJVQoQoPbH6Pc/AQoeEMY5+mv+8or9Ij8/Yr84J5tdTUdUTetREXx0iZ74Z3
         z1cnj0S8bsYcKS5o9kSFUOT97Ujxsm97CvmO2hiu290b/h/PO4numol31oA3b6TnEmA1
         iirw==
X-Gm-Message-State: AFuF++l6iNZONnQ+QskxVT5SMZpiru4d7LlpWVLNlyYeuKgmM/uygL/Z
	I2PjzRv4oxjp5VVXz5G9QyJxEs7Q6Q8KURn1gb3sN0J+FOOiQqLHbzcSV03lKPYr0vurtOlBuSg
	nR/mxoyQPT+yTHD9hH9mAc4ynViWDVVO3m583mb3VSuhNvs3RDCnvF8iJkEY0tB45hOu29qPYc4
	+bUqQ=
X-Gm-Gg: AR+sD10Kt29vW7GeH6z8jYgstt1PieWnmdi2EQoxABuZWHiQku/87RLq1jUBqnawxA1
	OnmfLoppk/7f3fjJ9Avfm08CwVq9BczywNcUE8kZ0ar5s99wjRiYmV4iAx7KNvyzUl79mXPzYnx
	2HldKRxDwQ8DdYeel56v0CvGHPM3J4yqVlYLssNKmGpVEr6vr+0etS0b7DpfyCu8zxZe5m31482
	Sd3fc2zMu97wgE4WVM0jmkcMZS6hs7zOf8H4tOjQF5b5g77hgDcnk3aDYHwFQFROrFDH5wdDs8N
	DoG3Z93HUsCsGYBMxmkdw0sakkH9pmsCkRtBsXxXt4UXXG3GzrxdX8HpJ+LpSiaXsKyfv0pRpfq
	ekTZYx+QaIokWAoEjE8ZTJJZcEpVI93KgEzo=
X-Received: by 2002:a05:620a:7103:b0:939:4890:98e1 with SMTP id af79cd13be357-9394890af20mr188724185a.42.1788188400550;
        Mon, 31 Aug 2026 08:00:00 -0700 (PDT)
X-Received: by 2002:a05:620a:7103:b0:939:4890:98e1 with SMTP id af79cd13be357-9394890af20mr188718485a.42.1788188400062;
        Mon, 31 Aug 2026 08:00:00 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4843dcc00a6sm5323903f8f.33.2026.08.31.07.59.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:59:59 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v5 09/17] iommu/riscv: Report cache coherency capability
Date: Mon, 31 Aug 2026 16:59:35 +0200
Message-ID: <20260831145943.313726-10-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
References: <20260831145943.313726-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=E9f9Y6dl c=1 sm=1 tr=0 ts=6a9596f1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Ikd4Dj_1AAAA:8 a=ITBYzW_wA1tX7bdzKc4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfXxWCg99PnUOf+
 ztl6ewbu8W35reIEsPT5J/lWnE8dh7ETmDDQHi3/98GIMXBV4bSMk88iF8UakCVXZLNIaCbqy47
 h6JH7zFa5KGLcBI0R3sVTd41oO2g+pQ=
X-Proofpoint-ORIG-GUID: Ftg5spop1YrwSoFUpuW-XfEarAzcOoup
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDEyOSBTYWx0ZWRfX1jJf7Xqx1ZX1
 QpsSMaRddUw9DsrhrnZzG9+kjASF/RPRiKhWKaS2vc5NgZ9AM1TMGOtkPDhMWviqeyKjT+vgYF0
 zY3TeaoBes13wVUR9JYkJ59Vul5AKPdMeDdRBev/4QwARuUqDBL/VvKsTKXI5N1zZ34HI+tFsJs
 7AefILpa5EH4z93pIzvLQQtKvz1OvnKTTdmVm1r9huGEzJGjFSsGaLcG51VD2M3XaO5Aj+kr/S9
 5+K+mENuqEIggkMPTqee5wTm0NWnqEUxl3E//3TOLAaKFC+nXz+d6e+cUOumzS2f2OGZ7Idm/kb
 eqwEv3XGNG87J/ZAw2TxRiTO1uhcYtoui3CxDrBh40QvzPGz1s19Z4RJbkwxIETMfXGO+R/kOhJ
 bKiqZo4QJOeyvEGdHx/lJB4EGn2THxUJ/bo9BNvovbs800bUahbzjg5mx+y2O9eHq1IqTdCe5ii
 7tvMp4ZJaDsP+3+Uurg==
X-Proofpoint-GUID: Ftg5spop1YrwSoFUpuW-XfEarAzcOoup
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608310129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_080002_643326_C840732D 
X-CRM114-Status: GOOD (  13.91  )
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

VFIO and iommufd require IOMMU_CAP_CACHE_COHERENCY because they use
IOMMU_CACHE mappings and have no userspace cache-maintenance path.

RISC-V page tables preserve physical memory attributes for IOMMU_CACHE
mappings. Svpbmt marks mappings without IOMMU_CACHE as non-cacheable,
but preserving physical attributes cannot make a noncoherent device
path coherent.

Report the capability only for devices marked DMA coherent. This limits
userspace assignment to paths that can honor cacheable mappings.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/iommu/riscv/iommu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index cec3ddd7ab10..e5818ce44515 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -16,6 +16,7 @@
 #include <linux/acpi_rimt.h>
 #include <linux/compiler.h>
 #include <linux/crash_dump.h>
+#include <linux/dma-map-ops.h>
 #include <linux/init.h>
 #include <linux/iommu.h>
 #include <linux/iopoll.h>
@@ -1422,6 +1423,16 @@ static struct iommu_group *riscv_iommu_device_group(struct device *dev)
 	return generic_device_group(dev);
 }
 
+static bool riscv_iommu_capable(struct device *dev, enum iommu_cap cap)
+{
+	switch (cap) {
+	case IOMMU_CAP_CACHE_COHERENCY:
+		return dev_is_dma_coherent(dev);
+	default:
+		return false;
+	}
+}
+
 static int riscv_iommu_of_xlate(struct device *dev, const struct of_phandle_args *args)
 {
 	return iommu_fwspec_add_ids(dev, args->args, 1);
@@ -1483,6 +1494,7 @@ static void riscv_iommu_release_device(struct device *dev)
 
 static const struct iommu_ops riscv_iommu_ops = {
 	.of_xlate = riscv_iommu_of_xlate,
+	.capable = riscv_iommu_capable,
 	.identity_domain = &riscv_iommu_identity_domain,
 	.blocked_domain = &riscv_iommu_blocking_domain,
 	.release_domain = &riscv_iommu_blocking_domain,
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
