Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5734C2A09B
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 18:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ii1ysbZdElrm3WB2M5TZg5uYGXc0xi6CpcDvqlB7zhM=; b=gRsrGLSMxOtTlY
	Uaf9yw8o+m41I1O564oKcG++U8DjogQgf2TViwn7CjdSL5XkhFwcblfsB1vKuV49ET9XHZEk1tiF6
	wcZZRdDj7rDAT74eGFMoBFsKE+8Yd7JK5ZQfIzz9QN+FRoMJBvM4fL3rN7NyK3MulaTZvmFTdcSvJ
	8ozt+8MNS+D+wHLxPdK5vBHKz0AQF/6aKKbe9aq5UWH18WLBBSMT8K40IjweE5eaciHi+Mn+KNnpa
	rqmMvVEWQxAAHd9PipDIM10VOvjO63G75Y/cJv4n+hlGweHESxlMaGv3H9lf2rxsGgEbN+qFHKbyW
	DwhECQQDX8X2rIaClYRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8s-00000008ZrJ-0ICj;
	Fri, 07 Aug 2026 18:18:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsP8q-00000008Zov-1v5E
	for linux-riscv@bombadil.infradead.org;
	Fri, 07 Aug 2026 18:18:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=NMovdxH0w7XE2JSsdhyhOuYe63iAjdbny0JPkBF+9ZE=; b=FD7IYs2OCOTSVzFYwhnUScYFJr
	aWMstYYK8QEhVzUlabKLsxNBfLayb6+m4JCC2HQQDYQLEnJonVwjTZWGUn85aioBJvoRxJGZVzBK3
	ZxX88W59w4fythKES7Ev7LJr4Xcp8cLH1oYJqK1e2dxuONWRpwk46l1ys3wDNYTcEUaTrMeRiK/6Q
	Mbz0v8VuZmreK0uo5E3XSOnpErDd3GqRq0cPPECi4e9XcDbcnjpJfW4tkQdyhtRUkas6fDQgJ9UCL
	5X7Gk/X4TrQDdiQMslFuBzvXMX/BUoAjp5JdoNUfwd4zHkz2y138y4eUbM2DiCG9VFbaUwxXaQWiZ
	i8PAtU3g==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsP8m-0000000CaIV-0WWt
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 18:17:59 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677GOMDm1807633
	for <linux-riscv@lists.infradead.org>; Fri, 7 Aug 2026 18:17:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NMovdxH0w7X
	E2JSsdhyhOuYe63iAjdbny0JPkBF+9ZE=; b=SKB4x6LbbGe0RBEfXO6gu2z4g8M
	Q7kKh54USsLY8Lf/otMC1il42BC+jrIKFbsD+Bp6F7/zCLgg2k74zSPcGw4h2kwN
	BxpaZ6vsh5EV2pD8OK+SnSbos1qM8pJlXTUdL/aJPPrKI4zwb1Dm3W8u0KjIiPsT
	m7+7GHRvlAGQlUhYxDitSX0G8FgvIVHbP7Fok/dmJKwOLxUIad2TbCth+Kh+ujVT
	pesY7Nkd8GoFwwdFUINb0S/AWKa0Y8sWwF8TCCdAt3kZdnCybLKrYMvcEfuEyc1f
	hY6RS95Wl/hkCEsMmr08ICFZ4riLbdV7pbPhziDluGaqQaNK296bWHI5WHw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwgewh75d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 18:17:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5283fa0656dso29271191cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 11:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786126673; x=1786731473; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NMovdxH0w7XE2JSsdhyhOuYe63iAjdbny0JPkBF+9ZE=;
        b=H7+IPfLZRXsPfFXfNDjip73IlaiaPcmOsf2aCQM2yIbJvVEUhz8iGYPD74+TufpDCV
         RXyuUvaS9+P6VhRj8M+nnHWW7jUg5qM0TrpY5Yv0hoUw95eqdM465J60AA/edRkNsP/H
         Zr+QvdAcRXV4XgX0Nx0JEKnbZ3+uYXbX861duRI9WkLGkn/RReN4B7Zrn5092Kytq1Sq
         QvJhMDhWxM/dcVcWf/LP40ecWWDPRRmS3zmh7fmdsKMoCZIDLOJFDF8Q6JCJMbgQs/Hl
         +rcKST/qbo1Pl2zScozVzXSG/WTCn2AG1Uljf0NwZU/9zAV1dFPuWhEKmRTWWlzUUhq+
         XHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786126673; x=1786731473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NMovdxH0w7XE2JSsdhyhOuYe63iAjdbny0JPkBF+9ZE=;
        b=RUN4L0Sqstgy1X5j59Zy+dl4yd91nkrJUD2uyjNkZE3AirRvWlUks8MrZduq/uXw7o
         ett1NwFSmVm9pobDdNUnLo61xmFsDr+1Ly2hrVhzLTC34JZHbI2GZqyybDcRbWmM1XIG
         dKRoHZBdFSpPNn2d5GNegQy1yHasNKxuE4UNQRg5k+WExDvKbs123Ycl4Uf6qz5Q1sZT
         A8MgSxK9HyWXMLFdYc5sQu1ENJyHEANN5OSysCQequVoHndrEEzju3uDHpwncRr5CML/
         yRTA3AKczmD4r/Lpw0nY4cY+iD17mG6moo3r9bsTZB4YUoKFSu2WFeeOq4nQT2Cp6gLy
         hi3w==
X-Gm-Message-State: AOJu0YwJJ81i9TZuN6+mCmfLub2YtWNSUjo65UYfUZ9zODwt6tjmHtwd
	CJ7t30uR88YVvq/im9F7NZOTvI01TSV5sSnNkuA1yNkSHw8jcNLachGrdygwKiyIbm38Ddl3F2v
	48pC5Ie2M+IJk3pypxyM/q4rhRy5jawsY8jjoOlsKEsrYuVEm/Ut5BPhrrQ6hgbwIc76tMiqt/U
	y61n4=
X-Gm-Gg: AR+sD13VRSQ1+kYFgi0okmer65mVIWg6fxcl3kKLbbKs/IRjpFY75dyn7WpSkdCAQ3p
	oeE4pIiN+A5gqRpipKK5a9cT48qcxHsTmCTrFRkZJb/DP89hP8d779eQclvUvoUUSPIdwDrhdvf
	3SucTzJJFjdVWztHGPnVonfRYDOedagnizbkYNYQcGaR5UQFFFPj+Vlc9Y+adYk2MdbGkrLAUYL
	agj//AdzVMmn9otGuC5yyFUPafyJppjrPCf+tTQ8qxJnf/kcmsb931IGiQrIZbzGMXAW3OaN9kn
	w/+ncliHuiCoPqP4MSo7V5OKQmSZ+kjUgv1fxDiLLBoDVT8wJI68lqmz0SmQBb0ev+Iqb+bt6N4
	SI4sbVex5FrHpDCMq+dgGxKD4WPDgQWhMQjs2uhg=
X-Received: by 2002:ac8:580f:0:b0:51c:1f35:4638 with SMTP id d75a77b69052e-52d2384efdfmr7512731cf.21.1786126673283;
        Fri, 07 Aug 2026 11:17:53 -0700 (PDT)
X-Received: by 2002:ac8:580f:0:b0:51c:1f35:4638 with SMTP id d75a77b69052e-52d2384efdfmr7512311cf.21.1786126672838;
        Fri, 07 Aug 2026 11:17:52 -0700 (PDT)
Received: from localhost (ip-86-49-241-13.bb.vodafone.cz. [86.49.241.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080cc3963sm79683366b.50.2026.08.07.11.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 11:17:52 -0700 (PDT)
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: [PATCH v3 18/19] riscv: defconfig: Enable IOMMUFD and VFIO
Date: Fri,  7 Aug 2026 20:17:12 +0200
Message-ID: <20260807181713.228535-19-andrew.jones@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
References: <20260807181713.228535-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX2XK8xkPxhXxe
 hHU3q9DrvlXofKJzMGM1k6awOAR0q1WHb6mKN8cozsTmfRaehQuBHn1ux1/eolFhOmq4qZC/ijI
 haOHT5/v2eujhwOBCSWa78fW7lhyYRc=
X-Authority-Analysis: v=2.4 cv=N5cZ0W9B c=1 sm=1 tr=0 ts=6a762151 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=VPysOpcHbS0DNrM1Xqmyow==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=B9Crq1QHcyRNgBBHHYMA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: BkyUdPywWvTKSscsHsWnOTZYFuZmxDZW
X-Proofpoint-ORIG-GUID: BkyUdPywWvTKSscsHsWnOTZYFuZmxDZW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDE0MyBTYWx0ZWRfX0/IkfygWOmFA
 eSR4JZz5Eindm8VHZ/+mnWizgVhsd92zVGDhvw4gRFGknZ3kSEUk3latuDGYKMTTMtFe+ZRwTbK
 MZrp9E9Oc0P7jfTEc45YTHwuVaRmqq9z6+CCrL4cFCf++CizhVzCVa1XkSExsFBemE4R3vDA2LM
 vHyRMHkZsfm+MnF7s5vli3CBCiO/d0OYjj+n+Wa53hi8Lg+aII1I7VD35LmfrsFhWyf9eGIUzix
 cv5wlQbUzDdZK+2kb8xr1jbutK2jNM77OX1aNKyozBDYJg5hqw+7XcMYGVQbjw+GwakEF0/oayb
 A6TOSmLknCMzPffzHXWiaaJdng9vgqAwdEINI1B6GaIMBmVBLx1VAStBTO3zD3mNyiC38ju8pra
 FATi9MhoOMxjoVk59h/sIl+wXLDje3gs9TsR62GJqvEv68dz+OCs8h/xUBHMrFOAB9JQJjPWYYM
 rn8WMLagn6l7aOtZXBA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_191757_774919_B35BAC72 
X-CRM114-Status: GOOD (  10.11  )
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

Now that the RISC-V IOMMU driver supports MSI remapping through
iommufd enable IOMMUFD and VFIO.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
 arch/riscv/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index ed605b5e3162..bae9a0f32f89 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -249,6 +249,10 @@ CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=m
 CONFIG_DW_AXI_DMAC=y
 CONFIG_MMP_PDMA=m
+CONFIG_IOMMUFD=m
+CONFIG_VFIO_DEVICE_CDEV=y
+CONFIG_VFIO=m
+CONFIG_VFIO_PCI=m
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
