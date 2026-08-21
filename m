Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178B6C5DF89
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 13:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+8bg6bzYgn/bnx9rQhDSf0SWi6/FK3ewB6jdg2HZgzY=; b=YdzwCmIiDu+v0J
	wXS9WYABvtaP+EnI8+3vGrlx7YR2O8GGTg26gm/xdbeqGu5gHMQEE5EIqF0k0Y0cVO5T7WPW0S3t5
	ihd3S83OObEzx1kar/78GFWEjmM2lZ4/F6YR3RQHbbJ0A/YlyfduVke/vgysOEA/MgW+kIatxuVB/
	LAKwBIvzzzNsgoQjzkYylP30BSRNlhFhQhSaWnSrD9gewarFXwlR3bEfbe2BjBZtoca6ujjwn84NW
	UoRblSpXOTInTqk26yI1UCPv5pq1xAnJhDyq/CeobbDRwCo2AWEiz4bftLlsAuTLQuMlBySpOwo/2
	Zmp2p9At0pMLkTl0a61Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPaq-0000000DSKK-1asX;
	Fri, 21 Aug 2026 13:47:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPan-0000000DSJC-2z9c
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 13:47:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCokIj2257264
	for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 13:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=a5VCLxEl7X8qI/cglZ1ZCGty
	oFxlx7SBGtiXQblkcbo=; b=IsW6WxIBflBqDT/f4XGRYWwPnrAzhmAR417dydO6
	tFXBIVbYz8lw9pPT5X3Apjce/ic1oxLZcA+dpbrq3ogznNPgXnAGJ61/N7elwDTW
	BcRzvpzuVCygQfC8f+B1+uYNz62KG2tsGr5uxU+GB1Ht5Qw2tHLJvCqEy6HmZIaf
	9/nxzd+qdOWf7VnMcEwz1xmOvOd1qaOf/3e6F5GvJAKxsQvo4ss0lvheaJ7pLaRj
	ZQGEdcCW7PrrMk1YjpuBlKqKt5sO4767nNouICWOKh8vMwuvpPASS2X4GkGTTgfE
	O5HBaP5lBMgXl7Yub2p+ZqT4IQYRrz8/f8s6Xlw82z1Hbg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ecba7mx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 13:47:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93494527488so163323485a.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 06:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787320040; x=1787924840; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a5VCLxEl7X8qI/cglZ1ZCGtyoFxlx7SBGtiXQblkcbo=;
        b=R1pWS0AeuQyVF7NSpHMKX3nmiz4KXqF4X9XDmFwMgv4us2cRvDDkDvVebfIbwMyNQG
         hVSnEVDUy+i2h6fitGIgSwhXLma1NFTUZmZTjKy2DQ8+lwfR3oUTAGXCl4QP9uhe/nRx
         WBirigODxbPpg3+zjTamcHFQ3zp77e0f1VflH4D9Fz8Xxf/bII2D6weO8/4K1iOrDbW2
         SD6gRxnTF5TgtiRU1TnWZ+jvvt7ttsZH9UyHv8KDAQNGJ/EZCXReRoRUxOiwkPbw6NPa
         yUs9PofjdC7XI/gO0SA9KNKnMmUPmiNmwZOK9ehC4MNMr/uXiZMI1K4uCm68A6ejl4h3
         YWMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320040; x=1787924840;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a5VCLxEl7X8qI/cglZ1ZCGtyoFxlx7SBGtiXQblkcbo=;
        b=TyKFyQ5IsLeN0j0i3VmvR/zXmqGBD6Nqm4WXXgJb5UgRE0xQx7UEDrotMngAA5qfpr
         UIPLmG8HVLpPMqhgdxYLnoBqwpjUW9dEADI57DYnFdoN+z9o10uWzR78VED56fp1t7wY
         aB9vamE0pxYgwd+6eZiGaOgJ/PhrfEwb6kKmCjuguFE5hOdicaEe4WaoLNERTlGZ8Kaa
         lUrkEG0gkw8DSSH57qBqiw1GFQpLyTOJ3G1WipPPGnJF6PwHOEZ/A81lqiaLp7k53gr1
         oryfAWOjGsgDlpSK3mlAnN6X/NKyWt+qgzCVArWdH1jX667PiMkaHK1CsB/M8hECfBSH
         v0+Q==
X-Gm-Message-State: AOJu0YzKfnWZYJCSLFJurDPBaeLnxjCNFl+GWwglpEtUPXIe2caAQInW
	KC4vPXXgNcEFwi+85Z9p2YSVCzWFCcmuG5QM74y5OyXqargnzZn6wUV1WTIw1IQInmftFmwojn5
	bpK8LTYxlwrZCi930RpcOsEJl/I5DJq3ve1lTjCFvZIkblrccQWERoaqi/hQ4zShKlDpJiLY=
X-Gm-Gg: AR+sD12YeVfC52nKrxFuJLkwM9s8gmkRB3nIrNFirFQX8d+1s5XYt0uVaWw6/ytUw39
	XbDDdZTV5ILgegB4kKHDnpg59EH+bXca+OY2Xjs5fdDtN3DRT8VFGaV+qtZYxOeVzqSB+sRCoHp
	+8r88YOMmoaqjHLXvLJZhGqX75y0qiyR0ZuxkWcYbWxAFxp3rWgE5nXk7WGMKiYsUD4gZkN7RwG
	WFyvNy8JW4q5FBpPbd3o1agA+WGk/u1CPo62lz6W8FcZ7EIxCumiu+DQUiE5ceSb/ZJuYQBdNsq
	1YlrF4ge/1DOPcdHSNAbaoY7gE8jNwMc0u+8XMvrYD+2hWYmEh6U0a0QDGuBQ070yjlnc7/Mmho
	gnq6ByDj8ZveHa1Sr9tC2ZyjEJHn6Mv9KdZc=
X-Received: by 2002:a05:620a:1196:b0:936:9f46:cec8 with SMTP id af79cd13be357-937394a8786mr405267885a.20.1787320040136;
        Fri, 21 Aug 2026 06:47:20 -0700 (PDT)
X-Received: by 2002:a05:620a:1196:b0:936:9f46:cec8 with SMTP id af79cd13be357-937394a8786mr405263185a.20.1787320039671;
        Fri, 21 Aug 2026 06:47:19 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b145153fsm17252542f8f.12.2026.08.21.06.47.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:47:18 -0700 (PDT)
Date: Fri, 21 Aug 2026 15:47:17 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
        anup@brainfault.org, tglx@kernel.org, kevin.tian@intel.com,
        fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v4 02/21] iommufd: Add iommufd_sw_map_msi()
Message-ID: <zygm4qm3fjv57nsgcectwikfa3cdnidxnhv55nxv4b6l2kllrs@dt36j4p3zhoa>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
 <20260820214150.545737-3-andrew.jones@oss.qualcomm.com>
 <20260820220908.GE244917@nvidia.com>
 <gr2h3ktgacozyo7rdggkxsg5mbdtzcnimaawd24c37hnf2tun3@hqivsenaq5wd>
 <20260821120204.GF244917@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260821120204.GF244917@nvidia.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEwNiBTYWx0ZWRfXyfnHwzjp7D5O
 njfOlDK7O4US2lQZdJp/+Po71WtkIN+3FzFqfytRZbiXJZItymgeKfqnfq5w/BptWzaaG5PjZGU
 reoW6CA/4V5g0DyIXemKjjt0y4wZtYG10JuwaorR4e/OtEiCsWOJvKGKqao9TyECgXTRRL2MY3w
 HhvIbvrW/+OFopdKUr6CU8VoKo15P1x/1SWWIOBaZy1WDtyf/hEBU99YmANnYyCnHs/yn3AC/3V
 +sPUdCd8BhbYC4UE9YwC67oBQkf9C/rMk7qtgpR6JWlMvXuJh+Q+Htyj979nhVU9ycTe0JxUmY9
 N4siSBLQKHau/Q59vpypre74aC2DoNOncMDhHObw2Pm5lZoT5LVCtzKUolwzya55iLKcvZngpRL
 3839OAlF6qDj4hR8qie8KNj2iGzfwLXg8tise+iqq4rqHyN5HiAqHfp/9X55d27yMDapaxfnQBl
 Wb9ghKAMM+l43mIvFjw==
X-Authority-Analysis: v=2.4 cv=e/s2j6p/ c=1 sm=1 tr=0 ts=6a8856ed cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Ev1Hn8_tcGTgjV4NdAUA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: yzp31XehPAs5bMabkm13T4cFHFtxgIQG
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEwNiBTYWx0ZWRfXwQ2EhOQzpCns
 R1VUZAWRKdNJFO7bcfk1VTaasi2i/vprTf5J/fDhKeGupyqk4Pqv3KP2vflehHdIX8fS6tokt6p
 IylfPcJ/1O+S5muw1bs/yR5T9z3pMRE=
X-Proofpoint-ORIG-GUID: yzp31XehPAs5bMabkm13T4cFHFtxgIQG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_04,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608210106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_064733_863727_142F0043 
X-CRM114-Status: GOOD (  30.43  )
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

On Fri, Aug 21, 2026 at 09:02:04AM -0300, Jason Gunthorpe wrote:
> On Fri, Aug 21, 2026 at 01:07:03PM +0200, Andrew Jones wrote:
> 
> > > What I rather expected was for riscv to have a PA window that is very
> > > big and not just one page, eg adjust iommu_dma_prepare_msi() so you
> > > can pass in the entire PA space that you need for the affinity
> > > changes. Maybe this is a list of phys_addr_t ?
> > 
> > That's more or less what this series does. 
> 
> But it does it in a completely different way, and I'm struggling to
> see any justification for this.
> 
> Again, just pass your list of PAs to iommu_dma_prepare_msi() from the
> irq domain seems like the easiest and most ARM aligned thing.
> 
> When you need a new IOVA for an affinity change the PA's are already
> mapped a simple offset calculation is that is needed.

Ah, I see what I missed. The proposed batched API would guarantee a
contiguous IOVA range, so the descriptor could cache the IOVA base and
then the riscv IR compose-msi-msg could simply compute its target off
that base. That would indeed eliminate msi_iova[] and all its complexity.

> 
> No weridness in domain allocation, no messing with irq stuff in a
> finalize function, no hackery to iommufd.
> 
> > There's no big PA window
> > because the IMSIC PAs aren't generally contiguous. iommu_dma_map_msi()
> > factors the mapping operation out of iommu_dma_prepare_msi() and returns
> > each IOVA directly. A batched list API would be possible, but it would
> > only move the loop.
> 
> But it keeps the entire flow consistent. Trying to pre-map MSIs and
> mangle all sorts of things in the riscv driver is undoing the
> generalization and what is expected to be be common code.
> 
> I don't want to see any mapping of msi in the rsicv iommu driver at
> all, that should be the most important design point.

ARM calls iommu_dma_prepare_msi() from ITS since there is no SMMU
irqdomain and ITS owns the MSI target. This series adds a RISC-V IOMMU IR
irqdomain to replace the IMSIC PA with the corresponding IOVA, so the IR
domain's alloc callback is the right place to create the mappings through
common DMA-IOMMU/iommufd code.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
