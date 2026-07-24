Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFD2C531FA
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 15:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5nOOjoD3sgD44xW1+8QeuKcSI2RHTJsud2+XMvvf0vI=; b=b0fenservu6+3F
	QCPPsdKM/mMnb2hagy4bjzdVsY+0lf+d3iSUDOT9aM9/6oF8POWPs9B1gOXEPkvVxHtINI5KlYxdO
	AbMlQV3qadm0IiIHOg4rge7IUMI9fAG3UfmFe5a5Qlw4vOJCpoIeq+ST62rn+hdatQZgHR1pxEDN6
	E6CGPmLrjCJpdPrOA6lqRExVX7Fr2m/pyhXw3sWSfOBtvlXq4B1F7H8DUueLiwjQ6mmX5t7AJiyaz
	XKdOn8Q4qDwSRLvva1aAesv+XzqnxSy3XYC5h6fBOoxfafWdtUxCWcpBNz3l6Ouccc5t5oMHPC72h
	oIihJHvCC/FpmdZD8zPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHZt-0000000GfDD-1q4I;
	Fri, 24 Jul 2026 15:12:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnHZq-0000000Gf8N-2Boh
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 15:12:44 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbBTB3089353
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 15:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Kb1rc9qc+9I
	g+1s2Cbs39l2fJgnJC2UI3clybMIXgk8=; b=bvAiqVQp7grUisnCTHhD+A7eZZi
	Qc/4VEqNeBTp584Awjzc1wQKXrYPeZgJEBmUYmM7b4BQk6UzKELb2Zgqq2gmXk1Y
	UjJ1ZG46Uah4a3JG3OahfmS/T3GOEk0GJdycqmYmAYNcnmWW3j3oI8Iqu4LUCpWp
	9HhSEf+HAzfvZRNO5To9FSFzgTwbkXdtZN2wS8Izr0jYOq3ClUhl33NwF3UAIjS/
	OoxeOhhqblEl67J3nHTbg9ApsTJqel96UOXwh2ltyHNwk2z1gPADAYfQ0/hjHidM
	dUE/l4XNbT8K7BxcQoeMzImf1XTYVRbFror+cMQ33EhkhNpPejCYW57fvvw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cgghtm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 15:12:41 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bec738909so7603241cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jul 2026 08:12:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905961; x=1785510761; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kb1rc9qc+9Ig+1s2Cbs39l2fJgnJC2UI3clybMIXgk8=;
        b=V9Z0agplClg9eqGncAROC517Z/gfHB+yHsZHz8OciGLboM/3T/5NSkj6JPS/Ryg8tX
         E1W3orhLCDorQuVHtiM5uoz9iOAdCMMso33/3CXAtWJMbN87ca0qk32UGZrnfWyZ8fzt
         /ukGneeUOHFSh6RDUNkUrEpjS89OkSxnYTp63RNL9/jjHdhnXUFApA/z7s0ke2SP+uZ1
         82PAThw4kC6oEUU30etWA1M49GiRFgny2OOHDSkbO0BN6HDiU9O6IzDqo2sQdFTI4GKu
         pcgnYZV79SuAEFDCB8dORvfC/pr+AEvgdsXMMdcw6Slx4ZckhG51Ivj1xNobOcMLA51x
         RC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905961; x=1785510761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Kb1rc9qc+9Ig+1s2Cbs39l2fJgnJC2UI3clybMIXgk8=;
        b=pB6XJsiI/TG4olYCTbfU8CCm2x5q30v1OLNvjW4p73hBmekUuWq0oaMIhDGA+yjsxV
         LGJ7IVaoEgIBiadW9wm6Wx68Na8x2auRDvyaaS0qLpUXLlWBZaL4nlTXN3ssUnn7x6vM
         ElT8kBqnp6V+svQ12iPoaNZsjZyD1HeZ8UGC6KE0zeEKE1kjzhD56qHUgnVTemT6Lg1p
         uPU3S+kIPaYevfy9ulNu6sWFb6EpHMyM7Whqgh5SxI6HeF6y41bKXAfBXS0d3XExUtVh
         2w3q5xyb37AOOanPFaVx89VQmBXh4cjoe9eVvTn3hTol0luDJEN+MKcyFRfCZalDOmZS
         KAew==
X-Gm-Message-State: AOJu0YwYldKiPBaA6DLaVl7UdYLgrfUuR08TA7LueHPLNQHnCgL6XjiY
	M44mf2+8YLUMagJexA3YLzO8s04GkJ5cKMi/ors5p8PvgkubzC6b+5zzvTQNHJ2Qs7nvvHQ+NJY
	JGG+UROUn5reIjUrW4CHq0wrMsOIz2RI92rbeOCTvCnVi5JF2pezCSlXpbbkyEp07ITANeqN8gZ
	J9/Vk=
X-Gm-Gg: AR+sD13H3AirRIL4eERgpn0SO4EgYbfwY56zrJpItkNhSV173+mtAgPuF+CZSQckpN1
	gLV00+bx+CB5tP9uL3r/0G+QnMg5bwfDA2jp/hi7gYKVgcSnEj68MYD3cGs/MDNrnPow/9nk5s2
	uyOtGOExiRQ9hXXGjPLQbT/aJ0Tmoly6Y77FizZyuz/Z2Ue4XAqSPonqdym8JtmoWRaR+A3ULxN
	3NTIwmY0ilb66wvM+JuVLo2ZzrJPbeZglvi2VmmaGsrYMQgLTome25FK60YPZTCmHrxmYLrd3vi
	s8miKrmFGF4YKleqyFTUaz4XxMGa3DzHeJOJzCWel8R83mQ6bnntzHfbM7HQ/rPNSfBdO53D6wP
	1I5MF+Oj6kSEFeqBoUu1IdvvZNTaWsn2GgPKe
X-Received: by 2002:ac8:5c83:0:b0:528:15e:d1d4 with SMTP id d75a77b69052e-5283ddc7afemr77628841cf.4.1784905961003;
        Fri, 24 Jul 2026 08:12:41 -0700 (PDT)
X-Received: by 2002:ac8:5c83:0:b0:528:15e:d1d4 with SMTP id d75a77b69052e-5283ddc7afemr77628281cf.4.1784905960493;
        Fri, 24 Jul 2026 08:12:40 -0700 (PDT)
Received: from localhost (ip-86-49-247-5.bb.vodafone.cz. [86.49.247.5])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a76fcdsm364218566b.4.2026.07.24.08.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:12:39 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v2 09/14] iommu/riscv: Publish IOMMU_RESV_SW_MSI region for iommufd MSI remapping
Date: Fri, 24 Jul 2026 17:12:13 +0200
Message-ID: <20260724151218.965929-10-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
References: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNyBTYWx0ZWRfX/Nqrr6be1hl+
 0Qto9tu8UpYQOut1KKWTywN8i4EdgXuhLGcjIhbMztezZeazlVVZR7AkwiY6XgjXpb0tI4l+j+1
 st/But2OhEQySzVhh+FgzjzY3IwUv7i/LV7WPgkpQJn9TrvGYpbpHUAw+Z+Do7jcb0VrL+CsqMM
 btZ/mb2/1H20bmQ47OhaApyweVV6C3ldfg7n7eg3O2GyA4bYRx0ODsQMe1pYHJ/0N5CzkQQ+E2Y
 n42ZBIznvSPuhLzLqZvAHi9pt28YtEw19pGZfufXhB05JRkR1wb+XAu30rNhEW9M17nqJhxuml+
 T3Hp2XbJFyrlVUHTmdFz6+ilKb9XfSuNGxZ4EdxS2ilPwCqVsok7/sRm6DblndpotEz9dp50LZM
 6kxWdeaR2JQN7DcZXibA90cpcooMFUK7qSzhGTWVJsE9XJ3o5Arl+5uruISf3DWs4dmO5UACHOg
 sCVvyKTSs+6PlTHM+aQ==
X-Proofpoint-GUID: wDkKA7IBHpkOghVUI__HSOLVxtaVpqd8
X-Proofpoint-ORIG-GUID: wDkKA7IBHpkOghVUI__HSOLVxtaVpqd8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNyBTYWx0ZWRfX8qeG8BKdSQ3K
 7iKEVlVwFajqD6WQjh1JbKt1NQYlZUbc0rTfcXES8vfG8TEgCdA8aOY2UhV8INtd/WVNzC9pvKS
 hSSeSNVENPk2O6Vq6IhaKkqQhN11WR0=
X-Authority-Analysis: v=2.4 cv=P9sKQCAu c=1 sm=1 tr=0 ts=6a6380e9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=aYZ+cQcEYoLAp2L633VOig==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=2xh-_RnL3qr1f2O9miIA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_081242_594006_01CB02C1 
X-CRM114-Status: GOOD (  15.64  )
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

iommufd's SW MSI path (iommufd_sw_map_msi) requires an IOMMU_RESV_SW_MSI
reservation region to know the IOVA base (sw_msi_start) for MSI page
mappings. Without it, sw_msi_start stays at PHYS_ADDR_MAX and
iommufd_sw_map_msi silently returns passthrough.

Add a get_resv_regions callback that, when IMSIC-based MSI is in use,
reserves an IOVA range of num_possible_cpus() pages starting at
RISCV_IOMMU_MSI_IOVA_BASE. This is large enough to hold one 4 KiB
IMSIC supervisor page per hart.

RISCV_IOMMU_MSI_IOVA_BASE is set to 128 MiB, matching the ARM SMMU
convention. That value is arbitrary for ARM too; its introducing commit
(f3ebee80b313) calls it an "arbitrary MSI IOVA window", so there is
nothing riscv-specific lost by reusing it here.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 drivers/iommu/riscv/iommu.c | 16 ++++++++++++++++
 drivers/iommu/riscv/iommu.h |  3 +++
 2 files changed, 19 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 27dfd60834ac..98ce9ec50e65 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1493,6 +1493,21 @@ static void riscv_iommu_release_device(struct device *dev)
 	kfree_rcu_mightsleep(info);
 }
 
+static void riscv_iommu_get_resv_regions(struct device *dev, struct list_head *head)
+{
+	struct iommu_resv_region *region;
+
+	if (!imsic_enabled())
+		return;
+
+	region = iommu_alloc_resv_region(RISCV_IOMMU_MSI_IOVA_BASE,
+					 (size_t)num_possible_cpus() * PAGE_SIZE,
+					 IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO,
+					 IOMMU_RESV_SW_MSI, GFP_KERNEL);
+	if (region)
+		list_add_tail(&region->list, head);
+}
+
 static const struct iommu_ops riscv_iommu_ops = {
 	.of_xlate = riscv_iommu_of_xlate,
 	.identity_domain = &riscv_iommu_identity_domain,
@@ -1502,6 +1517,7 @@ static const struct iommu_ops riscv_iommu_ops = {
 	.device_group = riscv_iommu_device_group,
 	.probe_device = riscv_iommu_probe_device,
 	.release_device	= riscv_iommu_release_device,
+	.get_resv_regions = riscv_iommu_get_resv_regions,
 };
 
 static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index ded18aec8010..9a8fd5300675 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -20,6 +20,9 @@
 
 #include "iommu-bits.h"
 
+/* IOVA base for the SW MSI reservation; same convention as ARM SMMU. */
+#define RISCV_IOMMU_MSI_IOVA_BASE	SZ_128M
+
 /* This struct contains protection domain specific IOMMU driver data. */
 struct riscv_iommu_domain {
 	union {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
