Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12B8CD3445
	for <linux-riscv@archiver.kernel.org>; Sat,  9 May 2026 19:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9S2aa3qa3vRT6UpwPOL2xH3eizOrPXaAwpPjAOstujs=; b=AZxzMGcKG7hCbO
	vXKlw3ghojtrB8GriLrZvc/xGThM30bDq67YR5Eq3TDgZxDCMAUwGfRV/Ze6a6X0qLtp780muhQpP
	zrdJvs9aPd3bV4BKK4Ajoz+hL1X/KNohPG4MJi8yAl/pMchRz8DK1sVo0pYtLlinV2KhrRpsaYZ4f
	Nk/MZKtMyhCCTrCke5rpLnkcf8zyR0HFPzJtc7cY46a6ZEqhmLGl4esSlujp3xnR0n2QFwAi82yd0
	g6ignXgJt6w5sCyIV+VXY9e/Bs2U7HS2f+rZot9bbawdlJTvCuVVPUmhwIt9yZMzQ9wGbV0Q0JDkd
	NyY/12USkNrh561Glo9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLne3-00000009Z6x-09aC;
	Sat, 09 May 2026 19:47:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLne0-00000009Z6N-1BvY
	for linux-riscv@lists.infradead.org;
	Sat, 09 May 2026 19:47:25 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6494dl3n3076100
	for <linux-riscv@lists.infradead.org>; Sat, 9 May 2026 19:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qcUTwwXxkf2HWH/ifvHwwRpD
	M+pCbfceyt9Fwp8UIyw=; b=bAoj5RNyGHa4cWHWyenxJXHVHnKtWzesCTayuO7M
	IVzJieBSR277L4lYLrx55bvW2R3WQVeBhrerTSYm+aidgleZhnMTRIueGlPy0/kM
	M96g2GTOK0qD9r41EFKljpYtmlsi8GaeG01auIbn3olnKQn1MiXx5iceWSoalnnT
	fwjyuZp4nExTvQzjuzWxWBAsno4xGCUwPd28HGTIpZQ6hr1GMfS5B3+EZsDkLA5d
	PWCs5UerpSpZjpX5uMbQKWvp+OJMCzp+UMVmIjpOZJZKSX0rEUUx99eU6x5j6w5z
	GZDUZOD3/uixF/vyq+w+CNJouPrUOANKsSIZvid/pxfO/A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1x3k1gaf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sat, 09 May 2026 19:47:21 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12dc1c0b7ccso4013675c88.1
        for <linux-riscv@lists.infradead.org>; Sat, 09 May 2026 12:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778356041; x=1778960841; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qcUTwwXxkf2HWH/ifvHwwRpDM+pCbfceyt9Fwp8UIyw=;
        b=M3HVoApMoPoSn9tTIuoR0SCqWlyWqxYIh+qNxkAcrP59qBzhRIDKlM/rPSEOPxgpbe
         /gQW8+6JqgVx+YNFEmp2MEH7JdwZp0qnY5r97T+ep6bQbagL+KTxD0Qfxw+AGDF9067a
         mCGXJqtZqy7XVM+0h3AcotKD10kNTkzVu4CJRiHqr9Hq2kUIL0vW0chtEps/LoRHGRdb
         1pQg2f5WKxLiVyxK60FYQSGWICAjnMo/i8zPnBEvJJ5A8Tgs/B5K4MAFDVxcg8IGHvPd
         LNMbZWq/7M/7N+GpnpVNXVhRsB+GHG5NQxO3ixMutM9F8/5hszI5xEKIgaa7/JNsWcnS
         LzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778356041; x=1778960841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qcUTwwXxkf2HWH/ifvHwwRpDM+pCbfceyt9Fwp8UIyw=;
        b=iGV8MSEzpZIk55KyxU3JdTyWm8YOf9mxJ+TLEO0FTsvNl/LBMu4WFuq3EZPlfZR+5k
         eCTs7L1r54dzdw+uK3NNBru59XRFfH+TlVq/GcSkA/LVvhlNR1kFgO0gHstgeyVnWuOD
         tKR7R8gfeCVB/BhA5kBJ1UBWQ+VwsvgspI2dzZF8Y8RziX+ql6dj5EacEAjzyQM4GQQu
         fmffo0xDccKhTYzM9476Ice3RMImj1QTGH760C+tfEMdPdtzUo4BGdxHnF58ZOGlDT8G
         cpieclWA2hOTaQd/ydPu+f6H9ahv78GGtd5iNaxytnLNFI+GQ2FMbq5jLXMq9s4tRW3q
         v9BQ==
X-Forwarded-Encrypted: i=1; AFNElJ89n+ixjcFCsIjk/+1pQxv7NsA7pHu4WER8y5Nj8LGoIRKgpnZ+aC5y9VN7hFe6F4CMiNHPPOt+d2j88Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyrJTF5nWLJORLjibVHhVrXzfanlzm1HR2bcFD9MqdI2SK6ayOF
	XSNoBmgTCvlSvbmCeoRGwSGWL/nBqcTqY3F8iRG0umUXtTWJCAbleBSoC0Pb0qZNHfAVYrg9y3s
	liSsWKvkdQhzvZND8pbuqPye7CeuaUJefcImXHapQiTdzFT3IJ4f5BV/u1ovfm1RuSMUNVic=
X-Gm-Gg: Acq92OEwtztXCyVe00cizR4g/y1bVI3O6IEyEUPjrtbTaZZhmXVW+xDe/ziQVIBtjGr
	S8ZHI48O814+N+JgKeqvaKdXh1OB1C2bswTDgTqcrYqy+RkdUgGUZ/rSjx13Syxl/gC5iLxOxWx
	w24JCn8JleOKGq7wY3ko3Hkl83RcvpXJyRRUzmGk7IY1Kzke7dY0JZs5Pg/XK+Au/tOolU4lxYz
	qIAwmorAnxWpx8fcZ0k//MZ9ud8GstI/R74ZEc8JhASG4GmZuqi9o3QhyhocbKx9HvTbLpuGEvz
	jzScHnFFBFivM1dDFbSxTnXJjOoQSZpueEe2UO1WbBi6Tr+1gKVeJ7loD5JnrFy7NWY3bolCcgW
	eEiWsDwTxUJPX+zq5Smv8pOyKlWm0KeWX/qqia6nkyA==
X-Received: by 2002:a05:7022:618e:b0:12c:11d4:61dd with SMTP id a92af1059eb24-1323b0ad346mr5539109c88.18.1778356041161;
        Sat, 09 May 2026 12:47:21 -0700 (PDT)
X-Received: by 2002:a05:7022:618e:b0:12c:11d4:61dd with SMTP id a92af1059eb24-1323b0ad346mr5539100c88.18.1778356040555;
        Sat, 09 May 2026 12:47:20 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327865a1a4sm7642342c88.10.2026.05.09.12.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 May 2026 12:47:20 -0700 (PDT)
Date: Sat, 9 May 2026 14:47:18 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: anup@brainfault.org, iommu@lists.linux.dev, joro@8bytes.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, pjw@kernel.org, tjeznach@rivosinc.com,
        will@kernel.org
Subject: Re: [PATCH 1/2] iommu/riscv: Map IMSIC addresses for paging domains
Message-ID: <fhv3w4kmxd5kw26kdlj4uj7cgr5mhov7rytph6dedokdpe36d4@svjdhnilgnwe>
References: <20260508212339.381933-2-andrew.jones@oss.qualcomm.com>
 <20260509022113.53400-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260509022113.53400-1-fangyu.yu@linux.alibaba.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA5MDIxMyBTYWx0ZWRfX991eibmT9tWV
 wcKwQE1SdlCZx1XWA7AEsljuAhdMT813PpttH/oWcqDNd9bu4dg+qXerikCrq8l57IEjSrKa6gV
 97/msi6LKtpj3HeV42PJS8XCccvfu+++SNZXSEe54ahkmdzhXNnAUgpSpOeyVydfs08hjUnWOIc
 dxSfvcaPX4svYRulwe/7qijqZ+IJRpXG0dQXr87K4lCgFTbUcv5SyLAn5nNDupQ1rF13jYbt0am
 niBuWJigecaz7c1uUsNYDN3vAp3DUadsUYF8lDuYCS7WV9l2uCRN3HQvIM1lTr4jv2ojrc/vM7d
 nYJrgayxTOk8WFPQtxqmmonjONyG1ibWJTtEVa2gMcDvng+guLyujRO6vd/VuqZvG5KaWXQG3zm
 I6EW21QhHOm+XMLFxVvooi12b05fyUxQyUTWgL/dTInFqXpijtL7WEkpOd74nm+Bd9WoQTwYxV/
 DtFbC31STq6bVb7JHQw==
X-Proofpoint-ORIG-GUID: mMsBT1RAc85PAly1OWe7FVCjf_sFteNt
X-Authority-Analysis: v=2.4 cv=UNvt2ify c=1 sm=1 tr=0 ts=69ff8f49 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=SRrdq9N9AAAA:8 a=EUspDBNiAAAA:8 a=D_Gdn404MgaNtkQDlpwA:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: mMsBT1RAc85PAly1OWe7FVCjf_sFteNt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-09_06,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605090213
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_124724_403620_43928130 
X-CRM114-Status: GOOD (  27.28  )
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

On Sat, May 09, 2026 at 10:21:13AM +0800, fangyu.yu@linux.alibaba.com wrote:
> >When IOMMU_DMA is enabled, devices get paging domains and MSI writes
> >to IMSIC interrupt files must be handled correctly in the s-stage.
> >As the device always writes to the host physical IMSIC addresses,
> >which the IMSIC irqchip programs directly, install s-stage identity
> >mappings for the host IMSICs. But, use IOMMU_RESV_DIRECT_RELAXABLE
> >since the 1:1 mappings aren't required for device assignment.
> >
> >Loop over the cpus rather than imsic groups to handle asymmetric
> >configurations.
> >
> >Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> >---
> > drivers/iommu/riscv/iommu.c         | 34 +++++++++++++++++++++++++++++
> > include/linux/irqchip/riscv-imsic.h |  7 ++++++
> > 2 files changed, 41 insertions(+)
> >
> >diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> >index a31f50bbad35..3c6aa9d69f95 100644
> >--- a/drivers/iommu/riscv/iommu.c
> >+++ b/drivers/iommu/riscv/iommu.c
> >@@ -19,6 +19,7 @@
> > #include <linux/init.h>
> > #include <linux/iommu.h>
> > #include <linux/iopoll.h>
> >+#include <linux/irqchip/riscv-imsic.h>
> > #include <linux/kernel.h>
> > #include <linux/pci.h>
> > #include <linux/generic_pt/iommu.h>
> >@@ -1286,6 +1287,38 @@ static struct iommu_domain *riscv_iommu_alloc_paging_domain(struct device *dev)
> > 	return &domain->domain;
> > }
> >
> >+static void riscv_iommu_get_resv_regions(struct device *dev, struct list_head *head)
> >+{
> >+	const struct imsic_global_config *imsic_global;
> >+	unsigned int cpu;
> >+
> >+	if (!imsic_enabled())
> >+		return;
> >+
> >+	imsic_global = imsic_get_global_config();
> >+
> >+	for_each_possible_cpu(cpu) {
> >+		const struct imsic_local_config *local;
> >+		struct iommu_resv_region *reg;
> >+
> >+		local = per_cpu_ptr(imsic_global->local, cpu);
> >+		if (!local->msi_va)
> >+			continue;
> >+
> >+		/*
> >+		 * The device always writes to the host physical IMSIC address, so install
> >+		 * identity mappings directly. Use IOMMU_RESV_DIRECT_RELAXABLE instead of
> >+		 * IOMMU_RESV_DIRECT since these 1:1 mappings are not required for assigned
> >+		 * devices.
> >+		 */
> >+		reg = iommu_alloc_resv_region(local->msi_pa, IMSIC_MMIO_PAGE_SZ,
> >+					      IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO,
> >+					      IOMMU_RESV_DIRECT_RELAXABLE, GFP_KERNEL);
> >+		if (reg)
> >+			list_add_tail(&reg->list, head);
> >+	}
> >+}
> >+
> 
> Hi Andrew,
> 
> Thanks for picking this up -- enabling IOMMU_DMA on RISC-V has been
> along-standing gap, and handling the IMSIC MSI mapping is the missing
> piece that finally unblocks it.
> 
> One concern is that the current implementation emits one 4 KiB
> RESV_DIRECT_RELAXABLE region for each possible CPU. On platforms
> with hundreds of harts, this noticeably increases the cost of both
> .get_resv_regions() and the iommu_create_device_direct_mappings()
> walk.
> 
> Since interrupt files within one IMSIC group occupy a physically
> contiguous range, would it make sense to emit one region per IMSIC
> group covering the full group stride, aligned down/up to 2 MiB so
> the core can map it as a superpage? This would over-map some padding
> within the IMSIC PA window, but RESV_DIRECT_RELAXABLE keeps the
> padding out of assigned-device IOVA space, so it looks harmless.
> 

Hi Fangyu,

Thanks for pointing out this issue. We'll need to decide how much we
want to isolate the devices from VMs in order to address it, though,
because, if we do group mappings, then we'll also be exposing the guest
interrupt files to the devices.

I'll certainly send a v2 to do larger mappings when s-mode imsics are
contiguous (nr-guest-files = 0) and then we can consider creating a
way to opt-in to group mappings even when nr-guest-files != 0. How's
that sound?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
