Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF195CA5FA5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 14:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pI3eL/tv9p0Zrl0lDFozBpYR2JMg9AJEPA3QQrdj4vI=; b=oNnKkPDtJyXWeM
	tbD26Tyueu/dVDCT+465zFL8wRMTwZQNXmQ4NsYM66s+4RJ42U+75p0z4t1/ZuIJeaswnzNQOjNKE
	7gjPNoAYgdEzY0tU4t52F93f9aOzPH9aD43H+apQUKY4bjwXeCBcmioyVpluJCyujqdk0Ny/TLmYs
	0k1KxtDimBxt9FNhigNTTuOq6B56HzChAwvSlZKuGjgwnIM/qEQ1qqiwAeS1e3suEScWion+1OMaf
	HG5i6wX6Sz40wHlLf04leC/KYzcbpZV1sI5tAD2VXrol1CBRLTGhHX/oUxniiHLaAZUO+2fOWbaJz
	KGWGCaoSQsurmTk78WbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCWP-00000000nfl-22FB;
	Mon, 28 Sep 2026 14:40:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBCWO-00000000nex-1poW
	for linux-riscv@bombadil.infradead.org;
	Mon, 28 Sep 2026 14:40:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=x8hihcxDh4vdXDXwpEyXNTTs8PuHmt2UDYR1utBPvS8=; b=mbmiuAPhpcNIAooxGnAal89Ux5
	2XCgu8nMtkSIooF5tc2CxIUO16Erkh4JLRA6Gkb3ACj/U0qh/uLrZlaw0tvdlDYaM4GipO/IIqX/A
	QCOIWWsWy2Q4wE9t/6JtB5tlqEmrpZNa0txtTbpsOTA6tsJm08fKlqolMrFfbhCyOE3PQ9lYWP1/X
	FfWnv250NL/HSK13WmBMW2jGWjqOjG2pvIkYtpA6yi/HZe3374FLyWJ/ZgzWCMl3dT1YJW2MHYdhs
	os6EAx5VZxiCIlPyA/51DrubrGfaigBXsLZfoiwA/fPEXzuWsqqPD/FMF+mZcTG3hmjrkoy+wfRfM
	t1fhj5pA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBCWK-00000001a3q-22w4
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 14:39:59 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SBADr6481624
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:39:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=x8hihcxDh4v
	dXDXwpEyXNTTs8PuHmt2UDYR1utBPvS8=; b=DQh2DnuUabqm9/ORt7u8x6SNgJO
	S0gCMFqIFtppT9jcPG2Q6KRvgguxsg1JozzSSBSYi8titOZc7N9/gGHm9wQ3mLTJ
	hxxHYX6s9abAAp6b2yAx5XO2t7NvToQBApOkiqfPF7TRHts6Dr068OABC5A7fXdy
	4Rq22H/pscgK1b/9Jg+ccqKL7NJbKEBAprYPCbT3jFs4Y9uJfT2TKVjG+dr1Rf1U
	7L/CEsC94Liym0yKEG1ZbW28nJTLwJVKNxPEivUuPlZVLUDVNhxK94isvVcJbEro
	vzzM0sTIiJVQpHWx97vcuYjJBWN2MgcW54sAiuvW2EEoKviePxi24HmVJqg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjt11vrp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 14:39:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-914355c5a51so57037766d6.1
        for <linux-riscv@lists.infradead.org>; Mon, 28 Sep 2026 07:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790606393; x=1791211193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x8hihcxDh4vdXDXwpEyXNTTs8PuHmt2UDYR1utBPvS8=;
        b=cFPemt9oxYxufZzf3YHGRBOGCjc7mbs0KiNPJ9DuCS5Sp7eYhqY80CdyXtHQ/8ktxY
         bufDixW/eRZK1g19vGeZQ7M7Ps3hGNUdtEJF7it5TgTXqJwewkOP3VwPKI9AEvhkwTZr
         NeHqd1FBGKRBnISls63quoLXe/GtnIKDBdfNX2xz7n5psz/AEq1lcq0FuWx7cCbv1Mt+
         KZej+G4cNQptwWmJAn5RnIqWJV8HLmEiEg1ZWyyKtqGksaoYqxY5T4NawrjWXGU6cIi0
         /sjQ5FdqLEIuZ4eeS5mLGOnoIyJ+6pOB6Oth6KwTcVsQbRdX7WEM6qV//fbcg9oTQZjV
         e4HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790606393; x=1791211193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x8hihcxDh4vdXDXwpEyXNTTs8PuHmt2UDYR1utBPvS8=;
        b=XqgyBVZOpmOVHCiizFFFJ44NkRfE+30YAduxI495Vlv46rVHfTu8nDy0mSEJjp0Lyp
         h7zpHhVyNPpSrzSxvJLBQao3FXrjzr1m58Dvhb6f+/tfooyBlsT3/tHJqTkFws9pQaVM
         HRdk7A3/yKt/SWyeIROjibzBYJFVs4Yn+k3ZhywLoeQc77MiPzzZXcekMG6nwrZjAhI5
         tT113oMR9XX6/LKU2H2/J3bM6PsQublvFbp+DIJOZVukxM9ppoIUwoMBS4wSIB/kZ3Rf
         t4MJS+Eb4qVKb9t1uPlv2OmRRkDkqQopvRSbNpUHjv40YhstN420f9D7e1MKIF7qnUGl
         cdzw==
X-Forwarded-Encrypted: i=1; AKwUvBzIf9Tej6CXhUX7oPfs3ZQ9aHMsZd/xGGTunewwr4Wx4r7sty8027vsGpxOZstzoFBP4eccHVBN+JMx6g==@lists.infradead.org
X-Gm-Message-State: AFq9FYKKPTe9LOxbW/YJxV39wcehRz5zSu7DVUy5GJFINVcEsQSzPt8v
	b640o8dIg5poaznoi94QPK5tNZ2ILaczoN1iZ+5TmgWZ8N56bwlAlYo7mL/3+YzNbAznVpLkKqm
	veeHTf98rlp8hdQt8EtThzzDfbT72iwf54BfZk1wVwAJHFGY2fe1Bgl3q879kGD5/HzRsR8WZZm
	X+IvM=
X-Gm-Gg: AYBFou0fmifPYGEL3G5gTY6GH/flhldgxOwv+pc0lKyhWcI3qAoYHw5zy86Wcoez1V0
	BbBFCQnTlGLk/pgW3JdPFayQTPVAoGJYwbDEArepi0kjquJBBRwEanW1p8bkqSp+RuOcFb0DTEY
	QGINad9bh/MnzcBh4q+t/f+7dcwDUOyU1bFqiBHhLUKYoNtbhf0NoZ+43cD5hLCr6If1Sm43mM7
	XrhSYqfqIaWDaJ2Zz6+etDmB8jMz6Kbl0eulH8q3VMP7CcG19SyinnRkVf6108r32XUh4evB+qQ
	b1myTXOFo4wQn64L+2bRYY4XjqINOo+hA912MN/RTwlyaFiXqgViFhaZbIVZ7YYh5uw5xycHCtM
	x4IUt15MegOWiapT8qZcGcQp+Dvqcy1904r70Wg==
X-Received: by 2002:a05:6214:21c9:b0:917:6587:cc2a with SMTP id 6a1803df08f44-9176587d042mr32752956d6.15.1790606392223;
        Mon, 28 Sep 2026 07:39:52 -0700 (PDT)
X-Received: by 2002:a05:6102:36d4:b0:7b1:6028:5475 with SMTP id ada2fe7eead31-7b1602862b3mr1832613137.12.1790605901953;
        Mon, 28 Sep 2026 07:31:41 -0700 (PDT)
Received: from localhost (ip-86-49-245-11.bb.vodafone.cz. [86.49.245.11])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae6069145sm488812866b.0.2026.09.28.07.31.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 07:31:41 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: tomasz.jeznach@linux.dev, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, tglx@kernel.org, anup@brainfault.org,
        atish.patra@linux.dev, fangyu.yu@linux.alibaba.com,
        zhangzhanpeng.jasper@bytedance.com, zong.li@sifive.com
Subject: [RFC PATCH v3 05/14] iommu/riscv: Derive the IOMMU from the device in IODIR updates
Date: Mon, 28 Sep 2026 16:31:04 +0200
Message-ID: <20260928143113.49838-6-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
References: <20260928143113.49838-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfX22WAOyGbbHAC
 9bzbRu55pzMVN1+fWdophTYxeA/0Pxr6POQTMHPop5f7Vv0CODRH+YSMrzmJ2fMxBVXXgJvqg6L
 T1iHC9hyW5iasRVbQR5yXtV+59yI25m9NHIPT/0LaUrgCmVuXq83pNIiTQTJpFaA8AH6U9X5tTd
 RWwJYb2HJIRCRmiEBsX4EBhx1lgDQYTiFNUKZUBePq5ggW4uiPN4SUjbg8JMy29mhV3dMisdgGN
 UwL6+GqLZpYRfXUP4Nyz0jHw1uduJsoODoHfJSfIQXzCrhq4VQUUxofWvlIbUBhmDqejkwHGAw0
 xHYESs91TQG9erZKJvTJ2nqzT1/vm6V0lENmTIu6yFmUTgLEOhIwPNFv3ybSR8wXxkVStw7wreT
 HwXOU2eEnYD1q7Ttvn91/+Buh0NhDUpV/lapSaAoK2zmvT9b0E2YRIXUR0rPnXUwG2QyZnYTvs8
 8Usq+lcJo87FjrCVzSg==
X-Authority-Analysis: v=2.4 cv=V8foQuni c=1 sm=1 tr=0 ts=6aba7c39 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=4CXLxsOAgPM/krjtHEZQyA==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=5LAesA1oWso2HGznwIcA:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: jg9OQ-mbOCPp0BuKfL95yzvhd6z1sDmo
X-Proofpoint-GUID: jg9OQ-mbOCPp0BuKfL95yzvhd6z1sDmo
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA1OCBTYWx0ZWRfX/UJRebXwpZr0
 BYtf5nbYFcAbhYEoY3ePYMA/2MTVdU6Vy5gpPaGNp/TKr+QM1Rrb7YkMgw9EiQkKtZvNjNNIEJs
 csnrnNAXSjWSPWswyb5xnyJGvXhckwI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_153956_800411_72F69C4A 
X-CRM114-Status: GOOD (  17.58  )
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

All callers of riscv_iommu_iodir_update() already pass the managed
device. Derive the IOMMU instance from that device instead of requiring
callers to pass both objects.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index d48667112cd9..2cee87ffc122 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1265,10 +1265,10 @@ static void riscv_iommu_iodir_iotinval(struct riscv_iommu_device *iommu,
  * device is not quiesced might be disruptive, potentially causing
  * interim translation faults.
  */
-static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
-				     struct device *dev, struct riscv_iommu_dc *new_dc)
+static void riscv_iommu_iodir_update(struct device *dev, struct riscv_iommu_dc *new_dc)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_dc *dc;
 	struct riscv_iommu_command cmd;
 	bool sync_required = false;
@@ -1514,7 +1514,7 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 		return -EBUSY;
 	}
 	riscv_iommu_bond_link(domain, bond);
-	riscv_iommu_iodir_update(iommu, dev, &dc);
+	riscv_iommu_iodir_update(dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = domain;
 	riscv_iommu_msi_tables_unlock(old, iommu_domain, flags);
@@ -1660,7 +1660,6 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
 					      struct device *dev,
 					      struct iommu_domain *old)
 {
-	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
 	struct riscv_iommu_dc dc = {0};
 	unsigned long flags;
@@ -1669,7 +1668,7 @@ static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
 
 	/* Make device context invalid, translation requests will fault w/ #258 */
 	flags = riscv_iommu_msi_tables_lock(old, NULL);
-	riscv_iommu_iodir_update(iommu, dev, &dc);
+	riscv_iommu_iodir_update(dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = NULL;
 	riscv_iommu_msi_tables_unlock(old, NULL, flags);
@@ -1688,7 +1687,6 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
 					      struct device *dev,
 					      struct iommu_domain *old)
 {
-	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
 	struct riscv_iommu_dc dc = {0};
 	unsigned long flags;
@@ -1697,7 +1695,7 @@ static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
 	dc.ta = RISCV_IOMMU_PC_TA_V;
 
 	flags = riscv_iommu_msi_tables_lock(old, NULL);
-	riscv_iommu_iodir_update(iommu, dev, &dc);
+	riscv_iommu_iodir_update(dev, &dc);
 	riscv_iommu_bond_unlink(info->domain, dev);
 	info->domain = NULL;
 	riscv_iommu_msi_tables_unlock(old, NULL, flags);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
