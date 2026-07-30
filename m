Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7942C55165
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Jul 2026 13:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NMejSFXC2kk404BXTD6O22lLx+8GmV0s3PRs81Hf/9s=; b=rt+hQTUy7YgA5Q
	TVfkCq5aolo4tAmsSfYsZAmIGyMQdJ3AafTSP7EdsVWyANctawqa3H03soQHeeXJ2eA5uEQoHbmQS
	xW/RYTsig98R60sPqXIO1ycv3+AUF/aRbgBg2yCb19zBktOy2ik2/b0Jxc40eWKVN1wPmQrIvQZSR
	SswgzlfF3LIDCuQ9/3tW7j6BTgck9Z7xuJkLrSLhSmkQRKiTfA/3B84BKzvmRKI7HODdqu4XpfHPI
	pPHFme2y0/AS0MJtykDN3RCuhXNV5pEfNl5ZZyaKBM8oJZ/9oLQNKzHpogQGjpV4YEpXf8RHGnvWm
	h0lArAnDQqt8NSCxI3gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQSX-0000000AXSt-1Mvl;
	Thu, 30 Jul 2026 13:06:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpQSU-0000000AXRq-1Ool
	for linux-riscv@lists.infradead.org;
	Thu, 30 Jul 2026 13:05:59 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UCoBxJ1009059
	for <linux-riscv@lists.infradead.org>; Thu, 30 Jul 2026 13:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NICqcAYvnXDPIDCBr1xsnUKW
	pknOwaDQB2vFtiBvz0w=; b=ZREqpcrQ0s2EIInl3rCfi5kPp3bmNzWfnUcreBDV
	pfEF83YkU7qLYVQZNJkYs/zynL+88iF+YtdaQgZtHoyCgknGcQXo/Ff1V2tpiYQj
	H13Danx6CyAADaSHqRc8ObHZyuUr97CwPeE/jpu0LxTplnUgTvH6RkJZYj9KtIWH
	7LFgGrplkFJl4Vh5PXJUsi177Uyqne9e+sMsbaqfJ9kO4PKnr1sXF/PELpqVcBqQ
	AnXkazXvqExk8AYI+BppQdO5VZHCH8sr3rLzLjQcAt7TtqAbdw9RWESzX0LMQPfu
	g5XqfEJkYVZz3D6e2MTCLzrY1PHlHfCmhPkTIw+rXsV4ww==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6yfr2a4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 30 Jul 2026 13:05:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bf321d786so24410581cf.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Jul 2026 06:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785416756; x=1786021556; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NICqcAYvnXDPIDCBr1xsnUKWpknOwaDQB2vFtiBvz0w=;
        b=j/NXfPqE8ZZg99dDsgQzgg0C6x2HfLMWBGibQkReLjZSaTUl8g9X9giw7cMGa+MGdq
         NFnD7EGnoVDZCOYgsQGOIBuqMupg9dc2WOVNPB5Mlf/Bqtu/TaiZ0KgQPbANbkLlg+VY
         HottTYPlkSn3bjCEHqSybsmmRgyeO0l+F2Rs/rJk6sF2vxLyE3mHUGnAwA7q1CsMNjg1
         ONamz47HIH/1ZJrpOvcvqZZtQJRo89b/rWU5WVG8DNBFn5A8Tp8YRNaryiR9v+t5m7u4
         LtFnUY205YC1jBk8nI6OzSqUfRZQ3QVQr6HAWS0M14o2ZQI4kJAnmaST/WULRUGzHArS
         5Nkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785416756; x=1786021556;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NICqcAYvnXDPIDCBr1xsnUKWpknOwaDQB2vFtiBvz0w=;
        b=UvQ/l2cFVSqO4G2KI8VqqU0LaVesu3j2+Tv5zsM9TyGwxcC3RSIu765sMR6iuWKWHV
         W/MroiYL/kLdOHBJyvtYc32mYll+MWt39xsicvvw/cn9EoLsGn534RxByZpTUNvjRzcN
         0/VLmqBjuLJy+46q1qg93WJvDvtaRTR9fTbJf2ZzQCDeFLEMGMbmkzDEKJbGHJJS4KZ6
         1I/29cXKHP1/zrDZqeU1GCptmUxU9gKwedCt/lfr8Jht3XKxNlT8RpfOkF3Bb+lubXcz
         g4h66LHbkLfkMZIWFKI1mEFIWwuHI/AHVbesh946h5HdId+HfEQnTS4jaOrimhjamRwv
         0QEA==
X-Gm-Message-State: AOJu0YzWmM5LR2cyGGnrlCnM1W3O/BolcpjT9bkVM45dL2UE40cZzUYl
	jfFGx5xuIDowQvNNEi8j9jW4tJKYaW7TZAnvopEXpUCs9CGnNKvRnWQvxQXWzP/U220Y/DK4SWm
	0TlL3FE8DQlhE29ZB/unJRd0se/pGkUklxSlQTboXTvkHRnUY2pv04AbYhuRbyYFiey3tsr1201
	rLXKw=
X-Gm-Gg: AR+sD10wsULjQMwE/oz2eoh+WVdEPXmqLmRUUOoedDl3mKWaKwYLYgl7X15YFtmR9EW
	L+E72hzNub8brc4HQHTWMHEVXvXTRrc9A6Rwn0IorqUy+1a+4/uyWiqdJlhQ4MBvhd7LIn56RiI
	96LGQC93ebNirwrO4zR6xbx6WsgCb8dGpEMw6+EtxQpOGJvtIWxEkwG1tp8zJBzZYTH6gexsWZR
	qTPvYqjii4zyp+UOwwZwUFnqHEuWJKf4SXHnrNGsHDnufsWybfTJ7mdRNred7hkX2k4LRIJauYG
	qTwJY3auE1No3/uKBDmLr6oIsZZjzX9A2i981pVlROTENfq1ysfm7+0wrfnOxkH7LmGtEJ+RgFq
	mjLe4jNw841f3dk7OgcN+3LMaxnp/gGiBW87+S+E=
X-Received: by 2002:a05:622a:5a12:b0:51c:844f:28df with SMTP id d75a77b69052e-52b386ba398mr26868371cf.75.1785416756146;
        Thu, 30 Jul 2026 06:05:56 -0700 (PDT)
X-Received: by 2002:a05:622a:5a12:b0:51c:844f:28df with SMTP id d75a77b69052e-52b386ba398mr26867661cf.75.1785416755588;
        Thu, 30 Jul 2026 06:05:55 -0700 (PDT)
Received: from localhost (cst-prg-94-50.cust.vodafone.cz. [46.135.94.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07cb79672sm655629a12.13.2026.07.30.06.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 06:05:54 -0700 (PDT)
Date: Thu, 30 Jul 2026 15:05:52 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: linux-riscv@lists.infradead.org, iommu@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, jgg@ziepe.ca, jgg@nvidia.com, joro@8bytes.org,
        will@kernel.org, robin.murphy@arm.com, pjw@kernel.org,
        palmer@dabbelt.com, anup@brainfault.org, tglx@kernel.org,
        kevin.tian@intel.com, fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v2 00/14] iommu/riscv: Enable MSI remapping and IOMMU_DMA
Message-ID: <fcshuujn27rutywntqixbmyvvxcsbz3yg7kk6ngnphxql6byyb@pvo6vaishsdz>
References: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260724151218.965929-1-andrew.jones@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA5OCBTYWx0ZWRfXwpGdrGUU6BN2
 pFQwtggrPaoqgHzpeESKvRN4KYPXq4n+iaXvVOtLi/8cB9pT2xavbnc1HKqn2BCXr+w+pbkILr7
 V73xj2oojZdJmoCe/8bRPa+l5m4Dg6JihxpYT/ROU4LFqjOohnhre15eCrkqO89MfauG2Il9vcM
 i/tJTJSHNf7C15/RxOSCy1TlxShp2wwfDrKdgbaU1cy11++8ONbFoAch0bc2A9G09nzqjc3HrRi
 tCDKpn5YwRfXSWTPujldPuHlR/CRDKhLIbFktyF++5xeQT1/lO7vwgpz3w1ZSDe+kSR0YRzWcmB
 PzCOREeBGiZP8gxhYBTNBIXnezy0TuWF+h0fZwUSwPJYvhPcTZzF84QGYu4SeQWwWMODigFrWG4
 pt/fgz4UEnLaBkI4Hs6VNs8Eor/4pcxkn9+Lg6rzYU+b1I/mO70jekI9005K3+mBgPSHsoazIrA
 4eRMYPFivUNJThl7V2w==
X-Proofpoint-GUID: fbHpC9pvkefCXI-CJ1jnDcObwGDmniUd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA5OCBTYWx0ZWRfX0v1iy5VFCTIQ
 OLNUuXXfyA0NQ0M1REpw3iXA2JfFOBqGluyieNROJdbGTeWob7jssys55viV58fhuTswm3nDcyd
 8gRCXx2dKDJKBxRYdJaVlJB9CW9wlO8=
X-Authority-Analysis: v=2.4 cv=Tv3WQjXh c=1 sm=1 tr=0 ts=6a6b4c34 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=K44ovq/QSKyRiRxWKRAbdQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=c92rfblmAAAA:8 a=EUspDBNiAAAA:8 a=vdDDTV-ePma1-M1uuSoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: fbHpC9pvkefCXI-CJ1jnDcObwGDmniUd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_060558_488810_779DA71F 
X-CRM114-Status: GOOD (  22.56  )
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

On Fri, Jul 24, 2026 at 05:12:04PM +0200, Andrew Jones wrote:
> This series adds MSI remapping for IMSIC so a device's MSI target gets
> translated the same way its DMA does, allowing RISC-V to enable IOMMU_DMA
> and paging domains by default.
> 
> v1[1] used get_resv_regions() with IOMMU_RESV_DIRECT_RELAXABLE to identity
> map IMSIC pages, but that was rejected as only a workaround, and the
> proposal for v2 was to follow ARM's approach. ARM calls
> iommu_dma_prepare_msi() once at IRQ-alloc time, caches the IOVA on the
> msi_desc, and lets compose replay it via msi_msg_set_addr(). This series
> follows that structure by introducing an IRQ domain and a new
> iommu_dma_map_msi(). Like iommu_dma_prepare_msi(), it dispatches on the
> same domain cookie types. Unlike iommu_dma_prepare_msi(), it returns the
> IOVA to the caller instead of caching it on a descriptor. That allows the
> caller to collect all IOVAs needed (since IMSIC needs one IOVA per host
> IMSIC page). Like ARM, msi_msg_set_addr() is used at compose time to
> direct MSIs to the appropriate IOVAs.
> 
> The divergence from ARM is required due to where the target address
> actually lives. ARM's doorbell PA is fixed per ITS instance (affinity
> changes only retarget hardware routing, never the composed address) so
> one IOVA cached at alloc time stays valid for the descriptor's lifetime.
> IMSIC doesn't have a fixed target, the MSI address itself changes on
> irq_set_affinity(), and that runs in atomic context, so mapping a fresh
> IOVA isn't an option. This series pre-maps every IMSIC page into a
> domain-wide PA-to-IOVA table at first IRQ-alloc time, and compose does an
> O(1) lookup to pick the right one.
> 
> LLM-based coding assistants were used during development for code
> exploration ("super grep" as one of my colleagues calls it), patch review,
> test execution, and commit-message iteration, but all resulting code and
> commit messages were selected, reviewed, and finalized by me. Per-patch
> Assisted-by tags are omitted in light of the ongoing discussion about
> simplifying coding-assistant attribution[2].
>

I'm addressing sashiko's comments[1], making a few other changes, and
adding a couple patches that I think belong in this series more than
in the next series I'll be submitting (guest interrupt file support, a.k.a
irqbypass) which is getting built on this series. So a v3 is coming soon,
likely tomorrow.

[1] https://sashiko.dev/#/patchset/20260724151218.965929-1-andrew.jones@oss.qualcomm.com

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
