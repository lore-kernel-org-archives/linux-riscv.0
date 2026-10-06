Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7051CCA5FFF
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 00:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CUDEkXujT76tfSIEEFn2b0BJD+RsqqNT7XaMX7+R+9o=; b=hsbuaanYEtw8gX
	AsFr9zhrVJlgNtePPwApMYSfBexIEGZ34lVuVyDshrJ/TA5qXNBRzhluwkHihabOv2G2GFFDF5OTI
	EHQpkOWbaG+0FPJLZgLCCCn81qlXcK9d+RZiLvBio/sln18dI9+k0HiEEQJ6GI53BN7qKE9UvUjdv
	Wbi2tINQYs1MA74DoRmQq2fDhQg7HfuHfADTvafz2MwoNYUdsD6Rds5nZHyYzFtrxufWKV2xgUyaE
	pof+ngSwQLiO8VxIieytNwtdLnabBqV35UYkOK2n8oIm5qn33eQbzQo2y/ue+6/dH7jI2AOqsgbB1
	q8LldUl56zIFoK+ucwEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDtDq-0000000HP0J-3ltd;
	Tue, 06 Oct 2026 00:39:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDtDo-0000000HOzZ-25MZ
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 00:39:57 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KNSXK2597287
	for <linux-riscv@lists.infradead.org>; Tue, 6 Oct 2026 00:39:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TyCY3djL8PN+a1DxJAYuBVVySj7YPULq6/PcA5HDv1k=; b=ZA10ErgSLT5HyZY/
	Y/v6nBvWCR6Qu9GdffazmR+/AhVDkA7RSXUQmK8zR6MB/avSOV+MH6alNdBF07QU
	TO2MT3rprFdLcyL+t5zpwHsFWC2N0LqE72EYdcYnbREVB4h833h0/vAqaQlP4NRD
	X+PmL3+EFnrpUgd6X+M/zMmFZpQ8hT0SLmmPk1Gvnv07D5OxHfTk0r/JxER8Udf4
	OcmjtEYBl5oij8mdAs2RVf4ZWBCPJxtaF23MryLm5ivkqzXnqT7WeieyxOibraXJ
	uDeIxTeBvqev9ff+RMn1NoA16XR8oWYEq1K/n9dYbcKrY8YBTVeSVQ1+AO1Q8PpS
	YK7o9w==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4a7dtxwg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 06 Oct 2026 00:39:55 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34d62bb27a1so9514172eec.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Oct 2026 17:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791247194; x=1791851994; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TyCY3djL8PN+a1DxJAYuBVVySj7YPULq6/PcA5HDv1k=;
        b=kJMml1aMXGpTZGuK9b66vFN9Vf29OM/FZA4rJ1H8T856BXtTU5uU7RxmiVv19quLst
         y8e8VgA9i0MGi1NyFT+EDMost5SCGhBsNitRxyKnovw7o5YufT3b4jhPV8P53E3T85mm
         lJBAElr0HE0048CM7+0RGLXsKUlqhgVP5JiEQPd2K+ervUw9xHV+Q43EWl5VBgX9px8H
         AuH8Vw9vpRQ7WJ+Wt8M2QhnIVmxeN22KyykCGr4tjOwc1oM4M5r2AHfOnJ99gngfhZ/9
         hSsvEnWhC5/tmpR0xnSbfCb1xnP5Vdkodhg6enQQseRFC13BtF4oEi05Edxc9jlTssee
         VCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791247194; x=1791851994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TyCY3djL8PN+a1DxJAYuBVVySj7YPULq6/PcA5HDv1k=;
        b=mil4wCThQafPDGWGT03JC9QI58Z6cXlB9/+Be0R7G5+GkGiTrGxRUpMiUCDmn0c7k2
         bKAsHp5ZzwlEUPXzGC1z77Y58ho+sCTGzc79KeIAoSY9ouypKl3HYc+TX0HZMOIxccau
         Z115POx1qFIvkVaRPUvR1ZWaNqQ95hNEIKHe38z1tBGKgBuWylpQ+JLuc+geMr6bCYgP
         +aLWOH9G6JeR+nywDVPFLx5vdCO1S6v8h3A138B4ZINACfPio1G/aPor5beb5jovv/DF
         eT42MJQlc6c20pP+tnZsG0Oih8aQVVLnC8rCUK2sxN3V115jUsl6xm5tY1fmCTjLpBFA
         lapA==
X-Forwarded-Encrypted: i=1; AKwUvBwjFedaBQRZtdRNSyImMC189XJrJ0L3OBU7t6lTZXtOBD/2nxp9xt2n+Z/Uj6AS7BmF7QTJ8xQlAnROLQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYL5P6/AGEmaTWHwdjL71tMF+mYaTtBN3Ispjc203Zb8ZIPXLNLy
	qDbzsvTh8I+jL0kkufU9a02ShHw3HtG6V+atyvZi7qfq2JkcKqh2Pmc6ZdELXH4NOOwRIwKkZoU
	+TsrwFvJXRsA8BZ0qxR+gFThA8QcY3O7RUtmKCD6cKrwZ0SF4WT/F6rH0JJbLrFjZVKEzgw==
X-Gm-Gg: AYBFou39B0X4Juv/foXW53BCfWvx00WmINqAPiF99LKivbK8ybujJFTFKbRFyPYncyI
	Ec7/5CeTgRJSFdakyrL1ct4ekFBEewKzuztx9HzsTPa+kiVGLcGJLiUPzbaQIgeO6qJkCfyXxIF
	NuOOeqV13J1uHv/6qedPO1YkssI846j0S/okWeycAZoTk5rQ1/7HF2utQYmo+oHjppYfNRltVMT
	irVj/V/tdAlOOajYTL4vyJ+Avt/i/XLQWlmXVGcGwOAtjDHUVSNKbUdsi80D49S2fPDMiWnvPpK
	8Sjkn7bZciXhInUGmGKOilL6os/jfZZLjZq/XySZx2+XtdJ780o2SdY42Pyedw6IpOKuNjHWwFP
	14cj7Tc7HShGSBfpmC8KSnmckTvEBfDqXDX7suTOe3F4Iy5KDeklNuyzKJA==
X-Received: by 2002:a05:693c:20c1:20b0:351:1b39:9e49 with SMTP id 5a478bee46e88-3511b399f8cmr9534070eec.8.1791247194334;
        Mon, 05 Oct 2026 17:39:54 -0700 (PDT)
X-Received: by 2002:a05:693c:20c1:20b0:351:1b39:9e49 with SMTP id 5a478bee46e88-3511b399f8cmr9534042eec.8.1791247193689;
        Mon, 05 Oct 2026 17:39:53 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35146ac078fsm2108874eec.22.2026.10.05.17.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 17:39:52 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 17:39:45 -0700
Subject: [PATCH RFC v2 1/8] tee: optee: allow RPMI transport builds on
 RISC-V
MIME-Version: 1.0
Message-Id: <20261005-rpmi-tee-service-grp-dev-v2-1-72f222e23ec1@oss.qualcomm.com>
References: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
In-Reply-To: <20261005-rpmi-tee-service-grp-dev-v2-0-72f222e23ec1@oss.qualcomm.com>
To: Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Rahul Pathak <rahul@summations.net>, Anup Patel <anup@brainfault.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marouene Boubakri <marouene.boubakri@oss.nxp.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfX7Ch1afni1JgB
 yEgqn5M8ZsyxXU5OWlwKATscjcEr2/L1ev58CUpSWwa0pdBGZezW1DJUr3hSVpZryC94vBmgeqK
 axJ/7KWG4UH/Tz+k3erMNDXOGXtfyYA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAwMSBTYWx0ZWRfXxo1rK4pb1fTn
 uApAhqXtX2Pfe0/nxRn9S0/0nt0F/vl33jQcEcSCHlEc/mEZC/XiNnpn2h3eyG4scxIrNYFWzz/
 4UN6A5IwCC+pqQxyHqtn1gJFxz0P1FKY8Wr3gSKRflTKjqYNlmGOCq+dC5cxToW3iOPW4PJarPU
 N0wCRKdQYDjW+MvQSCWOKbey7OyK1SOiIdVaBmbG4QYuSJW2dL+qSwpZTvNmGe250wEW+1vxDAY
 pHAp5/rzCU2MhE1N4DnlweLt6X93flJyPCXLfXPjBH2W0C1ajajrZuay/Z0vym7zlyYi5N2N5xl
 3egRuqlPREKIrnMO0tlyZpSKShoIFAexQ25Z+YAn7UFMfhJGfCaT00/CevVzXaR5aZDSCdzHF40
 0ElHiJMKMDRqpZnhE86N1beqXAXtNwcNjITxM5kdNDPU/pINsKW6E7eZEX35MEY1kof8H+vW+lc
 92SAg+XSymDvx5M84iw==
X-Proofpoint-GUID: Tnp5GuPNLDVuEVCTKHFvcFq92lgOZcdq
X-Authority-Analysis: v=2.4 cv=SvwFe/O0 c=1 sm=1 tr=0 ts=6ac4435b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=FVoukCuPRgDGiLv7d_oA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: Tnp5GuPNLDVuEVCTKHFvcFq92lgOZcdq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_173956_658862_6B269B46 
X-CRM114-Status: GOOD (  14.44  )
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

Allow the TEE subsystem and OP-TEE driver to be selected on RISC-V
systems with the RPMI TEE transport enabled. Prevent OP-TEE from being
built in when the transport is modular.

Common OP-TEE code checks the memory type when registering shared
memory. Add the RISC-V implementation so that code builds without
reaching the unsupported-architecture error. Reject mappings with
explicit non-cacheable or I/O memory types.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/tee/Kconfig       | 3 ++-
 drivers/tee/optee/Kconfig | 3 ++-
 drivers/tee/optee/call.c  | 2 ++
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/Kconfig b/drivers/tee/Kconfig
index 98c3ad083940..ad754b647a3c 100644
--- a/drivers/tee/Kconfig
+++ b/drivers/tee/Kconfig
@@ -2,7 +2,8 @@
 # Generic Trusted Execution Environment Configuration
 menuconfig TEE
 	tristate "Trusted Execution Environment support"
-	depends on HAVE_ARM_SMCCC || COMPILE_TEST || CPU_SUP_AMD
+	depends on HAVE_ARM_SMCCC || COMPILE_TEST || CPU_SUP_AMD || \
+		   RISCV_RPMI_TEE_TRANSPORT
 	select CRYPTO_LIB_SHA1
 	select DMA_SHARED_BUFFER
 	select GENERIC_ALLOCATOR
diff --git a/drivers/tee/optee/Kconfig b/drivers/tee/optee/Kconfig
index 891dac63cab8..cc057c76de62 100644
--- a/drivers/tee/optee/Kconfig
+++ b/drivers/tee/optee/Kconfig
@@ -2,10 +2,11 @@
 # OP-TEE Trusted Execution Environment Configuration
 config OPTEE
 	tristate "OP-TEE"
-	depends on HAVE_ARM_SMCCC
+	depends on HAVE_ARM_SMCCC || RISCV_RPMI_TEE_TRANSPORT
 	depends on MMU
 	depends on RPMB || !RPMB
 	depends on ARM_FFA_TRANSPORT || !ARM_FFA_TRANSPORT
+	depends on RISCV_RPMI_TEE_TRANSPORT || !RISCV_RPMI_TEE_TRANSPORT
 	help
 	  This implements the OP-TEE Trusted Execution Environment (TEE)
 	  driver.
diff --git a/drivers/tee/optee/call.c b/drivers/tee/optee/call.c
index e046aff61828..267513cf4ec0 100644
--- a/drivers/tee/optee/call.c
+++ b/drivers/tee/optee/call.c
@@ -604,6 +604,8 @@ static bool is_normal_memory(pgprot_t p)
 #elif defined(CONFIG_ARM64)
 	return ((pgprot_val(p) & PTE_ATTRINDX_MASK) == PTE_ATTRINDX(MT_NORMAL)) ||
 	       ((pgprot_val(p) & PTE_ATTRINDX_MASK) == PTE_ATTRINDX(MT_NORMAL_TAGGED));
+#elif defined(CONFIG_RISCV)
+	return !(pgprot_val(p) & _PAGE_MTMASK);
 #else
 #error "Unsupported architecture"
 #endif

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
