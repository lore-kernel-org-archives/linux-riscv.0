Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7179FC5DF81
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 21:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mAseqRg0XL81eH997gJo81Ok/IQ3E6ZxQyZivm8YCcg=; b=hXcFXsj1FMJuCO
	r7DA1kbLkAXNI6FmfcBs2DPfommzW5XNMBXSAImjNbrUfM1Fwp5CbdglmaXoRgPti8cbFl7Ai/B8L
	LScv5BWl5FYAsebqhYIbIrQhkvYInanG480eYPnGdS0Mx6zQufxNv5tVNg3vM6spU60Sjb8xlsTM0
	+taS+mO/OKWuMwtRVnbLpu15gRvxwLuoTuAyxNjyPH3rHAag3uNFcLSO0Bn2CN9XKUD7qChTAZc08
	vOgYctcxTrRqomLslyob7cXzxUcGgaWTn+Hir52ECweu3aFsZP1yMozL8GUhZR6EU+HPeX38S8u7W
	CTS9pZVNhjOtcxjA51kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAXE-0000000CEUc-0Fpq;
	Thu, 20 Aug 2026 21:42:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAX3-0000000CECg-18UH
	for linux-riscv@bombadil.infradead.org;
	Thu, 20 Aug 2026 21:42:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=TkV4Y148NbGwrVCtbfFhs8oeQskF5fVQw0EynKCSZS8=; b=ZYxD7NOzQnbGa7LPquLIwyrj2t
	PYiKl2rmHQONEuSSn1ovQjA4+iL0P2BXdLkTvtN/PYqKrKBpb5vDmNvjRRDd0N/72oaFIu+wRLbch
	5Iu3U4seoA36N8eihsr6Rxcw3I1UAlNZA4FBZHf9aWnswXQpKEBEmMIpvMEIQGygUZpc71V5cFu+w
	sLuLSStD9mBi6k6O2G8ZhgO6p3dNnWzWx9TsZfkZoRQjVIvJWZ621wbUwaZJm4ramrOVnHYCZlL4q
	0xQKigCSeFcSD4AdV0HCtc3w3WPwzbtHM9vzgwZ4+FAVMEoqiUjUnpVgMsp6/Q7hCHEHdoDlWqgzN
	APdesLIA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxAWy-0000000GLsQ-3aIv
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 21:42:40 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KK7dFv267995
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TkV4Y148NbG
	wrVCtbfFhs8oeQskF5fVQw0EynKCSZS8=; b=dsQA39g656utHIxkpCZFTIvh8y5
	kj9jzHWTitilDoWJx+qd3PFJ+AZwUHKSyW/QShFv0ohcFNYFl0pL6ql/gBOqJ0Tb
	b+lF3VGdWPL3dUww5XcbnQejEJE72xMDYKLE/9LF4boRbSSQC2FhH5G23ueULan3
	GPvWmKVXvei1A01lrjjYPH/MD+dniBZNtHkCvmYGpX4ddZ1KREQ6rGBng/OI0q2S
	bpQfECW1LxzhfOHFFzxdKsVatxxwCiuenOSbxeUSfp2HQIvGFReSmDwXd98JZPLh
	2vUeL6wbxqxy1YosZIuXYu12ZmsbQecUb7jdNG3Qc0p1e6IN4pwsjPB3VRw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5yg1b3g7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 21:42:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d827597fbso4334221cf.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Aug 2026 14:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787262153; x=1787866953; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TkV4Y148NbGwrVCtbfFhs8oeQskF5fVQw0EynKCSZS8=;
        b=b2hSXwSW4ALHk6rOLViDFj0FW/kO3GyiaHou+7X9xs0cQ06XDUXM5PjFD9rZgoFXiz
         +zFYfiqohsnh3IkL6kETPcNfrHo3sQOi4ZYQGtcpTQhgjlL2kKVh2jQtKFAOr1enD5iX
         Wv5yqm4hqRoarjlTIyrc4vxzp/R9HlTsiUnxK0oZ6pfmiRW9SPA452OePaaYjGQxRFTq
         H4579BE83dKOG/2dQ+sf0KFKXvhrLNKcKfKU4CUBcbXdKJpAwdzdLUH24ZixSD06gDS/
         jrEfIXmmR2/Uk5n5mRk6Jum8OUgyXvQhvd3upZzhRKfyQFnWRlRbBvvum1dKkQYsh9Sv
         gyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787262153; x=1787866953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TkV4Y148NbGwrVCtbfFhs8oeQskF5fVQw0EynKCSZS8=;
        b=KWyGCKODciGBBo1nyvNQa+M/UbjIBPsEXxeCXzOQQXCEcRp+0QHTpbW3SagRGW5LwH
         K04CG2uRe3GJzZfilkRdkVgNr6rsFum3LdoCEqkPTzHk4+birPhz0Nh1Hgo2p1CFYsZY
         UbWGcDfxNFTQ5AcEbx51NDpZgvh2AsU4/sdNmmjWIlwR0AgoFU+uJxAL0Bjwf/cHpj7b
         IIAlPhdNEAIkb++/G5gu/rUTTLKv8xZdH+D47NCeTwnzOHNieZPbtpAq9wGu68NFeNuV
         itp+zHeoLYh9VcGC8PUvW/d5WZxp5YikzLlswtHuptgU4juSnyR8DkYBk7nQOQ6xTqAx
         0AJg==
X-Gm-Message-State: AOJu0Yxmvi2xFfZwXPAXu6l0FLOvX+RVFZPwmYnUIQ83GpDnVxfZcS7q
	aM+axkMqetc8c791t/y2j2OjfyW2wfAjQmT3DfJlaaowzgyi3PdvHpcFaFlusGvPA1NjpDQiyFv
	rCsbjGuS47v6gCrOsOqAKpgvyesAr6JKq7ofOYqO040XMfnF69lCJJdvd5OERWYBW8LZloLcfsG
	FRHzo=
X-Gm-Gg: AR+sD10DsOk132AMsUempsFiuZTICWjmnNgL2I2zHVolYjVcv90IZQOeBdf9LLCik9R
	4gaoI/dI1urjCGx3K8uLjCZnyzgp7JXXSy54rrg/bHnjb2yVBdypFSgc3EJ4Rkm9sbNk5bSIN+Q
	VfqvJpKIUTHjXKPDkUvZmZaP50c4Byt0oQsYHV/D3dsVpj6m3RgTfg7RpEvxEHxCJnvlhw1PwDC
	vO1AyCo1WJpAb1SY+fEiuF8kXiY9GLpFb5G54xtfEm/nIlYWDyoX+aEbh71mS2MTLUUfALEJbsF
	xbL1bzk2Z7Je1GV+0N6HrO9jLFZGsnDYuHL4RuO+JC5sZql/tLDH/0SbxAHsFWen2HRNhlHolk7
	x0nFUiI+X
X-Received: by 2002:ac8:5cd1:0:b0:528:583:a6ca with SMTP id d75a77b69052e-52df5741738mr15764391cf.14.1787262153083;
        Thu, 20 Aug 2026 14:42:33 -0700 (PDT)
X-Received: by 2002:ac8:5cd1:0:b0:528:583:a6ca with SMTP id d75a77b69052e-52df5741738mr15763861cf.14.1787262152637;
        Thu, 20 Aug 2026 14:42:32 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14514d5sm15515307f8f.10.2026.08.20.14.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 14:42:31 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com,
        Nutty Liu <nutty.liu@hotmail.com>
Subject: [PATCH v4 19/21] RISC-V: KVM: Enable KVM_VFIO interfaces on RISC-V arch
Date: Thu, 20 Aug 2026 23:41:48 +0200
Message-ID: <20260820214150.545737-20-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: EtC9ZkNQi_cTGug-gTofga5XIPWDDZlq
X-Authority-Analysis: v=2.4 cv=G7Is1dk5 c=1 sm=1 tr=0 ts=6a8774c9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=h0uksLzaAAAA:8
 a=EUspDBNiAAAA:8 a=69EAbJreAAAA:8 a=Hp3hLBw8nfLOXl02dSwA:9
 a=uxP6HrT_eTzRwkO_Te1X:22 a=MSi_79tMYmZZG2gvAgS0:22
X-Proofpoint-GUID: EtC9ZkNQi_cTGug-gTofga5XIPWDDZlq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfX6LeROLo0dx0P
 EPQGZoSvSJxclb7Pt9gevfc0x5SBK2aGk8emT+CCLHfjuHW7ASBAfiHIJCcvExQAq6zttdfYWAa
 Gk8GY1UYrxngFISax5jBf6BHc2vi+BM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDE2MiBTYWx0ZWRfX+zOe1lTOP3tJ
 zeedXnFoJ+ZRgH/qEOfQhpfANzc48gCBj89sCM1+BSeYUZdCv04Ro0ayK69FrXjPd4TUfIyl24A
 fugaoHdynIjTfNOnnOqoF8wJk1Pjs3n5CAD3g7BvfiqHJlP/O3iI10crF3ETpUiecmpG+GDIDpZ
 iQWpQjmLYoTpROsKJmuWciHAkg0ynUQalBn33BA1vTwSCFlaZYFPZi0xafkCn+Ey0FketekZjJ6
 bt8pr65jIPG6zz3Bs/kplMxhBxzdjQGvSaIUlLGWCGtpFzX6JhdNoQ+feo9uibXlaTzamGxMoz3
 NuOLomUxe5V0aSC4NssPGzzWgke0A/RBUUFAXReBjDsyIAihs3VIymlrGJjaAmuhKnpFnhBiuby
 y8hsK+gX8p9mbhJSDuMVXNXRmPBhMlQ8AkQjchl1FRYOWN/hSDMkIkBHxF45tzq91DK+GaOcO9J
 D122bZWVr4KVkJagzhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-20_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_224237_134289_39AA55DC 
X-CRM114-Status: GOOD (  11.30  )
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

From: Tomasz Jeznach <tjeznach@rivosinc.com>

Enable KVM/VFIO support on RISC-V architecture, now that VFIO device
assignment is available on RISC-V through VFIO_IOMMU_TYPE1, so a
RISC-V KVM guest can be notified about VFIO-assigned devices.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
---
 arch/riscv/kvm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index ec2cee0a39e0..49179aae9504 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -29,6 +29,7 @@ config KVM
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	select KVM_GENERIC_HARDWARE_ENABLING
 	select KVM_MMIO
+	select KVM_VFIO
 	select VIRT_XFER_TO_GUEST_WORK
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
