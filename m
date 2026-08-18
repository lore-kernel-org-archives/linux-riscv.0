Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA187C5DF7E
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Aug 2026 11:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7NWWUwj1hFaYMYkFLhcHhRym0RcMhLkD3JAkxL+wnfY=; b=imhZrg+Uos9wL3
	mD0smTe7HJQIF3qzqf39+kSPI0zgdixfB+kx5KkNzHDEVh5qqV1iJ+eWAaamt5Ygu3vb/mh08Qn17
	DX6fHlAobcZ6rb87VAbTzEvSvlwniI8Zudmwhcf4Bgb4FXG0brLE7usuZWAqRyC+E5SVQTdlfSyHF
	dPCQilD4GxaYOFQg4KoWFi6bEFw29JRF6AW6bb9jX0uscU/SEJ3TcH1U1PMQXXvBhTsfsdOGZO44u
	xcOmSXMhz2G3pi3ZLPOUrEYG1P1FuHH0EMHwK74ERSJTSYQSSDFRY6BoXnLQY7hB1c35RKa825+3L
	xFZUWpOKGJYV0pT0kwEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHXw-00000007ngF-3tri;
	Tue, 18 Aug 2026 10:59:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwHXt-00000007nfQ-2tKu
	for linux-riscv@lists.infradead.org;
	Tue, 18 Aug 2026 10:59:55 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABlBR068849
	for <linux-riscv@lists.infradead.org>; Tue, 18 Aug 2026 10:59:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=97oyElD7Ik9opXwUE5qADXHh
	NFeKHDDf3nqCTfRJei4=; b=J60TawLLIuSg8NbfgtjwGsJfjgui/RptVu344kDD
	llEnlZc99ED1Odhs98GrZXdsPCRnQXysN50fi6sV9C+tdTfr8EeVCR0vmQoGfl5v
	ttGcLdBFc4b3bHstiQfuRnCKqD2HG/GF+oDwusUL8IyyGkBDLRsTpgqntLKj32Zq
	Ckl0AG/gfe6B9jxGHt+3vo34GRPskctLjTG1igjzEgrAhaEjaaky361TJZsdtzzm
	/kvE5xvcEwWkGGhW0oSDiAEl0ncmwLymcCCFDMV8+6Nhdjl5Ubp2v9+4G5iLCxA8
	s2WM+NId3pst9+pYQVSHe6uLWZNX/muG//QOMJel0lrPDQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4f5pstmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 18 Aug 2026 10:59:53 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so100518385a.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Aug 2026 03:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787050792; x=1787655592; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=97oyElD7Ik9opXwUE5qADXHhNFeKHDDf3nqCTfRJei4=;
        b=ECWysfS3Tx5c+leN0TSq24yVI9HCgbwGPQewIDKJS0ryyAhGzYP8Jsbc7CULqTDgzI
         CTSZ73JPVGGhFOBlmmoslt23f/w0F3Py8Z9UFM2NDGzN7cnd+3OkTw3k1UjsRaledpFs
         c0fMJq/eN7x/yV+9SkHyVnHXC6mbokbmDXxbf5Mp8SXSVd0QFOVL02gma7I8D3wOdAfK
         L9ymyGguhE47Yfyd6DytcTvFrOdot64MGrhJxVs+m7OEeTVFu2XNa2YNFtaI3xY/MkhQ
         NcmdFbHIAdnax+YuXV1hQ8Bv5GzdeuQkwQWcnnZDM5a3piTpC8SfMrXqyQn/kFLa2/i5
         9rVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787050792; x=1787655592;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=97oyElD7Ik9opXwUE5qADXHhNFeKHDDf3nqCTfRJei4=;
        b=rO83tiplytp/ADFUDAnYMH8JkGUZp+uHS+cfh/XlGBrQXjZD4dTHjsvnKUYkmE3EyN
         725zj6a2ZQ8y9fWYdEmaYh1yo7RkpjC6dwvD6GhMVXvinw8QALdgwYNlhHyz/9QuH+d6
         Sf+IIScdgq1+uwAk1o2ltULOrkG35Ao6wM+N1BbjTnUdeHnoEN3Ry9JdIgiDjS2S0G3y
         J4aRymrMy0ucfzG8jRMS9+fzl4rarBrioE+zOKgrCT7OVymZyViwY0KwxyLaiHeiJWB2
         zQCux1o+53niT3AoLFyd+xiSx1OHeunRf4Y+eoAQwPkKxWIOdiMwBvpkH2lZwGeaUgVK
         Xj8w==
X-Forwarded-Encrypted: i=1; AHgh+RrcocayG0z/wLbRO7dAL+rG/JsHqQxq0jCaSWX64F9ED5kuLPwigPoyhgkMrFZlVOksauYJGcAbiVv+NQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6E6oVLC4RNr/f5AExyz7/iIDQZAYkrElkrcX9oi5poceTu5E7
	N1yzBt8c04bhL+MoPB+tKw7wOMtgsPBDJJ3jtRILzgur4wgSEhY3+7p6BzXC0LHlSOMU8I7BR1a
	mxrmJAUsd+hjm7CecEYNfOS0MzaUM5WTA1Z5B7d6d5JK+dTpvpIBkIkCeyUerDUUTpTsceXU=
X-Gm-Gg: AR+sD13/6wgzqT4/lhbv6A+cDGaKanunis4idNN4MavV9PbfODbH4yP58UsDw0sc9xZ
	7Qgzwg6/hWtAb3emcQpfLoNwtOmnnXmjs4sUXhixLsiu4Z+TSLlCsIJLObXam5W6e/rKX/VSsln
	TV2fsQCv5+iP+qMK9N+DlHqMkYJwvxArq7uNbgONVnrd6cxQEGu51s78w1Mwkn09fYHlEOzzYaB
	aUwG8MPzX/PBOcbIwJLrP6bnJtETK4xRfa8GCgXbXn5UCyjV1rBNbLfE6nkUzTeajDrVY+Osnke
	IiBrbxi5oPy4O4zZ5XmG2pmkuku8U6OGa1L7+FGom0LJn5FYgnT3xF/kjZSq6oGEfr5mU5eFjo1
	GlZWmk+gstdM6qA5kdcX6swEtypaksiJcQV4=
X-Received: by 2002:a05:620a:280e:b0:936:a8a0:cdf0 with SMTP id af79cd13be357-9370662ee48mr557157285a.15.1787050792144;
        Tue, 18 Aug 2026 03:59:52 -0700 (PDT)
X-Received: by 2002:a05:620a:280e:b0:936:a8a0:cdf0 with SMTP id af79cd13be357-9370662ee48mr557152885a.15.1787050791724;
        Tue, 18 Aug 2026 03:59:51 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482a5b783basm11499220f8f.30.2026.08.18.03.59.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 03:59:50 -0700 (PDT)
Date: Tue, 18 Aug 2026 12:59:49 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        tjeznach@rivosinc.com, jgg@ziepe.ca, kevin.tian@intel.com,
        baolu.lu@linux.intel.com, vasant.hegde@amd.com, anup@brainfault.org,
        atish.patra@linux.dev, skhawaja@google.com, jgg@nvidia.com,
        guoren@kernel.org, kvm@vger.kernel.org, iommu@lists.linux.dev,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Zong Li <zong.li@sifive.com>
Subject: Re: [RFC PATCH v2 05/10] iommu/riscv: support GSCID and GVMA
 invalidation command
Message-ID: <4mcwrlk7yc4kozsqbrumf5gbknydquzwdb4g7lv6bgjk7m6ob2@alld2yusipnq>
References: <20260507113706.11400-1-fangyu.yu@linux.alibaba.com>
 <20260507113706.11400-6-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260507113706.11400-6-fangyu.yu@linux.alibaba.com>
X-Authority-Analysis: v=2.4 cv=S+/pBosP c=1 sm=1 tr=0 ts=6a843b29 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=SRrdq9N9AAAA:8 a=VdMlnMEb94GnahmMsAwA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: hQFlVM0xTgCttG5SKS2pDZGtcOsioaYu
X-Proofpoint-ORIG-GUID: hQFlVM0xTgCttG5SKS2pDZGtcOsioaYu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA4MCBTYWx0ZWRfX/z4mZ16kCQQP
 TaJMlP+57j96q4H39Xj9FJlQa9Y0GHHKiiBSko4xtQKDPseEzFXcfVkFAjgcDNjnTP/uf7E/9de
 VX4ujbJQ+lpLwf1jzYGHXe+lzOTJ+bjc4JjpXZaMyt4nZV+twW+TVipVipOqEmLH9dhsTEaXwcx
 wG5tPKPYhitUPFvAiB8mMg2mWtaNyZmCqCHtIa82nSlKqaqa2qlVBSfapBS+lmbq4MH7sNu/7dJ
 xdZSq4D8CwxrPcQZttbIckewMLpx0OqhtWe5WcHfkWdEPWTiSbasqd7TkDGgfjQWnPpYR3L5Mir
 UDJymAEiBE1gz/YSZRGkMVoWfmHBizEPhkXCwUuNv1YU81VLuhI78qwE0tJjjx8SpNfffegx6V2
 upwg/0CjwpXqepWKCvR9FeQZjteE1ZmqZYAVVErzWuat2Tzyw5Upy2ZBqkPkLHqpkvkUbOPgmvY
 F8klunNUgyUkgLAYZew==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA4MCBTYWx0ZWRfX9yqilpSKqsDw
 SWCZNoNGj1yKROQnsOAsWnHkPaJLMI2iI4B+SC3tT8PIaiqVA6YdKxQczKmenJ/X9A5RTavHHGq
 Caoxgt2bObHn8fMg/uB3sVOrFVMiBKM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_035953_740060_B0D529BE 
X-CRM114-Status: GOOD (  16.59  )
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

On Thu, May 07, 2026 at 07:37:01PM +0800, fangyu.yu@linux.alibaba.com wrote:
> @@ -1212,8 +1225,15 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
>  	if (!riscv_iommu_pt_supported(iommu, pt_info.fsc_iosatp_mode))
>  		return -ENODEV;

This needs something like the below diff squashed in.

Thanks,
drew

>  
> -	dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
> -	      FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn);
> +	if (domain->gscid) {
> +		dc.iohgatp = FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_MODE, pt_info.iohgatp_mode) |
> +			     FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_GSCID, domain->gscid) |
> +			     FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_PPN, pt_info.ppn);
> +	} else {
> +		dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
> +		      FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn);
> +	}
> +
>  	dc.ta = FIELD_PREP(RISCV_IOMMU_PC_TA_PSCID, domain->pscid) |
>  	     RISCV_IOMMU_PC_TA_V;
>

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 307baf33c646..434d2d4f26f5 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1262,9 +1262,9 @@ static void riscv_iommu_free_paging_domain(struct iommu_domain *iommu_domain)
 	kfree(domain);
 }
 
-static bool riscv_iommu_pt_supported(struct riscv_iommu_device *iommu, int pgd_mode)
+static bool riscv_iommu_fsc_supported(struct riscv_iommu_device *iommu, int mode)
 {
-	switch (pgd_mode) {
+	switch (mode) {
 	case RISCV_IOMMU_DC_FSC_IOSATP_MODE_SV39:
 		return iommu->caps & RISCV_IOMMU_CAPABILITIES_SV39;
 
@@ -1277,6 +1277,21 @@ static bool riscv_iommu_pt_supported(struct riscv_iommu_device *iommu, int pgd_m
 	return false;
 }
 
+static bool riscv_iommu_iohgatp_supported(struct riscv_iommu_device *iommu, int mode)
+{
+	switch (mode) {
+	case RISCV_IOMMU_DC_IOHGATP_MODE_SV39X4:
+		return iommu->caps & RISCV_IOMMU_CAPABILITIES_SV39X4;
+
+	case RISCV_IOMMU_DC_IOHGATP_MODE_SV48X4:
+		return iommu->caps & RISCV_IOMMU_CAPABILITIES_SV48X4;
+
+	case RISCV_IOMMU_DC_IOHGATP_MODE_SV57X4:
+		return iommu->caps & RISCV_IOMMU_CAPABILITIES_SV57X4;
+	}
+	return false;
+}
+
 static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 					    struct device *dev,
 					    struct iommu_domain *old)
@@ -1294,14 +1309,17 @@ static int riscv_iommu_attach_paging_domain(struct iommu_domain *iommu_domain,
 
 	pt_iommu_riscv_64_hw_info(&domain->riscvpt, &pt_info);
 
-	if (!riscv_iommu_pt_supported(iommu, pt_info.fsc_iosatp_mode))
-		return -ENODEV;
-
 	if (domain->gscid) {
+		if (!riscv_iommu_iohgatp_supported(iommu, pt_info.iohgatp_mode))
+			return -ENODEV;
+
 		dc.iohgatp = FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_MODE, pt_info.iohgatp_mode) |
 			     FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_GSCID, domain->gscid) |
 			     FIELD_PREP(RISCV_IOMMU_DC_IOHGATP_PPN, pt_info.ppn);
 	} else {
+		if (!riscv_iommu_fsc_supported(iommu, pt_info.fsc_iosatp_mode))
+			return -ENODEV;
+
 		dc.fsc = FIELD_PREP(RISCV_IOMMU_PC_FSC_MODE, pt_info.fsc_iosatp_mode) |
 			 FIELD_PREP(RISCV_IOMMU_PC_FSC_PPN, pt_info.ppn);
 	}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
