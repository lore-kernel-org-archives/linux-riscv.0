Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106DDCD4F24
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 16:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P00MtXlhXlZ9Uj0o9XDm+xEvfEYRolYGCf4Q5LhlkYU=; b=gy0aWWkjVoCBKc
	4CXqrMySuV6eDJ3C/2qKBXeyUNcNHBMroclgk3Yab5Qha9x4i5xyA4l1pyfEYlp25Be9Ha0r1U71I
	rTf8s3yXTdTsSAoHJ5hPsC3mpKK/fWKty+TQc/N+xFCelizOIUtTlHEs268zVcea/1UCglk1v3jsb
	NmTznfkqOn4a7CgNHAnFUyobPhHSSc+ZvGOx4w9t1Yzl7a5cGd+JTZ+fj2NwbUmEdP2RNxG1eq1h4
	D9fH10amHwVDa6LaeTA2l0PshxeS/Ln+GBcQF5VoAInZjhvMj0NY/9JkwqNp95RJGBiE/25v5LuM0
	qbsFVFk8fGQk/GDqDt/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpsp-0000000HLYS-0aTm;
	Tue, 12 May 2026 16:22:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpsn-0000000HLY2-0gXH
	for linux-riscv@bombadil.infradead.org;
	Tue, 12 May 2026 16:22:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qRwPFmafq8aDitqqdeTEYsYaCrD01rZu4CmP4WMZOns=; b=N2I0FTENX4srFO7KBIL/DmP+NO
	bAIkKTNI1ySJuKyWR19t1PfR+B1P4lFS+l3C2oowUJcRcv4sEm0C7r3j/yWkSBWemcJZnMxwkKFeN
	4Anr02bHVQXrBD4adXTImpje/fINQPxmNzbPoD7Gd27OyaMbc4o2fsVF4PFjmMhQiXQjVX6RpDJZ9
	RpY1ImYxHbYVa6QBHwZcj7Go4nxvVgIdejXG265RRUq5I4PEy9Z9DRVBhN8/lQ6fCh+nKrujDVK7z
	d4TpjJXG9H40gGrB3RpS2zhAltx+qfBUiBJ9VbzFfrTV615XYJbPncbeSNiMAkRMsTzMuF6pwdFiY
	SK6JeBMw==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMpsj-0000000FJV4-2Vj1
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 16:22:56 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB5N5q591937
	for <linux-riscv@lists.infradead.org>; Tue, 12 May 2026 16:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qRwPFmafq8aDitqqdeTEYsYa
	CrD01rZu4CmP4WMZOns=; b=fcTXazxA9Q0AqDAPozRchcdRbAoxg2fXRLgSTcLX
	A0pBdC6/4sHYz7KzqKVPjnhtC04FUr8MDphD2wye/GfUmhgNwKOdowAsgLyViX0Q
	T7TfTDbE/bxssWZjUDTjDAq5ERyhTTRnm/C3Uf+pw1Uh0SXOKa4xQC0R1FZMOFID
	vbU0YQN6ZZDTcK8Cv84CfXTSJBi7kUJifUHQp5atyBrdEqe3j1uA4CJzZgempPy1
	IUKdfYrj1HH5Ye6CbacD56RKn40VNMSRq6JpkMoWw+TkZLL6JxfNuq5eJynARtmS
	+UHTThjiHL3ayRSFPTWm9tGsdIX+2WQQLwvxBQ/uNQWgjw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4319s9t8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 12 May 2026 16:22:50 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2f525565b33so6924029eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 12 May 2026 09:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778602969; x=1779207769; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qRwPFmafq8aDitqqdeTEYsYaCrD01rZu4CmP4WMZOns=;
        b=gun0cnuTcpZfHYTqkvKyPdigVEf1qw/sv9dr2eaPF4OHMtZcoN6cSgEdd7uIUYxBRV
         rQUI2erjbAD5X73UgEm91DbNNa1cfuTtQI1mjo+pNUd4+agTKJuku1AkUgVjTLoEGC2t
         7TIkuyc23t9orWX7N4mAdUBrm8DdVFHJPmkALZ56M8KgBD9XuiwaNc4HqTqEMHZ2EWh8
         Lr/2OTnm558dYHAb8qEqK3b9PNxaQuKvHtqYoe0ZCvHyMb+8sRkfgCroVC326pc/cleD
         5kEcesSC1TaCdE0YWFQ0CfWApFK8G3gxGEABriN39gXdUP/a1FaENO7TdKFw6Snvs8fa
         v/0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778602969; x=1779207769;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qRwPFmafq8aDitqqdeTEYsYaCrD01rZu4CmP4WMZOns=;
        b=MCHHUsRmt2i0VbgcTWnDIvwBBPKkCK4hqFtF1xoXOUAIZOlo+UfBipLl0KYki9aDJ7
         DBzhSkQEgsqTBY2DweoGdM4mS/6xihVzgxTjp73k9aUEaNa5k1f7+pujx3yKXrYnd1ve
         IFjyo0l2U/aZV7ifn7xAbXtOBrzJsg2Jo1qs8toGhymSaI6G8llKyxvaY9IxW/Xrcsad
         ZiJ2grnk4oQnZnHFRQ2N1nrHkzQ5d9qmDlere1Y3losW358wxIv67+xD8cfnt9AyLtzy
         QxjeA763Ux++uKTSIYQbpjN/S7D2n3Oq/fHvtVpvebqlr2wmv7AeJdATZ988LEt+WkiF
         X+ug==
X-Gm-Message-State: AOJu0YyaHqpp1t84K11L8bzrNdE6tahhxC1w4MfF5P21GFB6da2NUP+i
	2BcjwdbJwgCN0fTTYT8A26I18kUDMoY8vq/oVz03N7IrhwYTZimyXeeHjIB21nM4ZTB0BOn03w6
	1SLrXLyHWl01URKa/YeEitMBSpfOeBX4j8XU8yY/mtmRWBxaAMP9WluBLTrebGmukk7BiG90=
X-Gm-Gg: Acq92OGw8jgBuQ6AIqKSsKlb2ewA6CjKjYKpapXvrG2flLkUiUgM1bRZggFtr66G5zA
	JDCwJwD43eBRuPVDD40MgTWlx7Kpv+RUQPDTwN6NRoNgyK7F42nzKjxXxTC9klwk3ix/fAAJwMz
	5Kv8jjwN9b9CitDdpX7mgv3XA1zY4uih1Ll/4KJI/4fnUi4CLqhiKA7qX575y6VFxDWRExOsbzP
	hQ2vtgjUq0Ou2/4PyoRFQZDFRKM+fufz0tAFEPsyYoIuGUAm0/xru7Z8+IhzTjhqNJxVxr+09DG
	uJ+n7F8qVBeqyt0n94w/gbnPq6eBAmJzoD9WXTGI0A0gjgJqJEw6ZIR8Az9LpAyr24KfPT56/Fr
	D9BloGIg1DKpqni+dgACb2lbHTj7CDA==
X-Received: by 2002:a05:7300:6ca8:b0:2d2:96e8:1bf5 with SMTP id 5a478bee46e88-2f54d696b08mr15324441eec.3.1778602969032;
        Tue, 12 May 2026 09:22:49 -0700 (PDT)
X-Received: by 2002:a05:7300:6ca8:b0:2d2:96e8:1bf5 with SMTP id 5a478bee46e88-2f54d696b08mr15324396eec.3.1778602968356;
        Tue, 12 May 2026 09:22:48 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888e3e285sm21663793eec.27.2026.05.12.09.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 09:22:48 -0700 (PDT)
Date: Tue, 12 May 2026 11:22:46 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, tjeznach@rivosinc.com, joro@8bytes.org,
        will@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
        anup@brainfault.org
Subject: Re: [PATCH 1/2] iommu/riscv: Map IMSIC addresses for paging domains
Message-ID: <eiikdvzbjffmsnejcsmpv34ljo5afurz2m7g4do6jxrrpkhnes@dsfruyaccvkh>
References: <20260508212339.381933-1-andrew.jones@oss.qualcomm.com>
 <20260508212339.381933-2-andrew.jones@oss.qualcomm.com>
 <20260512133854.GA9129@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260512133854.GA9129@nvidia.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDE3MCBTYWx0ZWRfXw+4yaDFhrbaP
 VDso+W3SE8267Y8Hjbo9AvpCXWZfuKUAIKIfqeFxfU7xTruvJsMcBFW9ZSTW9YjMdwlHJq553Ui
 oX8yJuV3NV2+BBQsykc30YOUkubrlw10ts0Gfl6P4Wn0RsH73bxiJDJtX4d3Y03Oevvmil6TnIp
 offqhR4wcc8YQa9aDWM4XO/0wG1zxJ+qVuleL3wh2vzEGhTG29D01drc4v2YOQENvYhaNTvaFnf
 pXAZSBMZYR4btoSIX5d+riUhVN+CR91Sto8sjaTYbAhr06Us66y0aPfV3qypkKsxkGtqyptujZW
 a5Cwqxh8Q94wy+SoIsdIOalNJtbG+gpee9c6++e7P8yGaB6oZ09nV9TYVZiV1mWVp80Kk+c7yhb
 KK7aRCpfpErgTbwyuzFwnesWrzv9IVlySpCod+m3yDCuoIoR4rAAnqfhFXgcIOz0ztB0+bVVBMi
 O/GhCw4PW+R339LYl8g==
X-Proofpoint-GUID: gtwTVD1xNq7F7LrJFVIDaOoej9QpxM8O
X-Authority-Analysis: v=2.4 cv=bp98wkai c=1 sm=1 tr=0 ts=6a0353da cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=yzZ8afvO4vg2XN0Uw84A:9 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: gtwTVD1xNq7F7LrJFVIDaOoej9QpxM8O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_172254_295218_8015E4E4 
X-CRM114-Status: GOOD (  24.14  )
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

On Tue, May 12, 2026 at 10:38:54AM -0300, Jason Gunthorpe wrote:
> On Fri, May 08, 2026 at 04:23:38PM -0500, Andrew Jones wrote:
> > +static void riscv_iommu_get_resv_regions(struct device *dev, struct list_head *head)
> > +{
> > +	const struct imsic_global_config *imsic_global;
> > +	unsigned int cpu;
> > +
> > +	if (!imsic_enabled())
> > +		return;
> > +
> > +	imsic_global = imsic_get_global_config();
> > +
> > +	for_each_possible_cpu(cpu) {
> > +		const struct imsic_local_config *local;
> > +		struct iommu_resv_region *reg;
> > +
> > +		local = per_cpu_ptr(imsic_global->local, cpu);
> > +		if (!local->msi_va)
> > +			continue;
> > +
> > +		/*
> > +		 * The device always writes to the host physical IMSIC address, so install
> > +		 * identity mappings directly. Use IOMMU_RESV_DIRECT_RELAXABLE instead of
> > +		 * IOMMU_RESV_DIRECT since these 1:1 mappings are not required for assigned
> > +		 * devices.
> 
> Oh? Why not?

Hi Jason,

I should change the comment above to be stronger. 'not required' sounds
like a choice is being made, but guest devices must not have mappings to
host IMSICs - that would break their isolation.

RISC-V AIA has the concept of guest interrupt files. Assigned devices must
write the addresses of those interrupt files to deliver MSIs to guest
IMSICs (virtual IMSICs). Also, the VMM can map the virtual IMSICs where it
likes, which will not necessarily be the same addresses the host IMSICs
use. We need the irqbypass series I'm working on for guests, not these
direct mappings.

Also, I actually discovered IOMMU_RESV_DIRECT_RELAXABLE after first trying
IOMMU_RESV_DIRECT which resulted in "Firmware has requested this device
have a 1:1 IOMMU mapping, rejecting..." failures when running the vfio
kselftests.

> 
> > +		reg = iommu_alloc_resv_region(local->msi_pa, IMSIC_MMIO_PAGE_SZ,
> > +					      IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO,
> > +					      IOMMU_RESV_DIRECT_RELAXABLE, GFP_KERNEL);
> > +		if (reg)
> > +			list_add_tail(&reg->list, head);
> 
> This seems like quite a hack, the ARM was seems much better, the
> interrupt controller should be using the iommu_dma_prepare_msi() path
> to obtain an appropriately translated MSI address for the aperture.

The difference between ARM and RISC-V is that on RISC-V each CPU has an
IMSIC and the device will target any one of them, depending on its current
affinity (i.e. the MSI target changes with irq-set-affinity). ARM has a
single doorbell address which has a single IOVA->PA mapping created for
it that never changes. The ITS manages everything, including affinity
changes. Even when I get an IR irqdomain posted that implements
irq-set-affinity to help further isolate devices on the host, we'll still
want get_resv to pre-create these direct mappings since we can't
create/alloc them at irq-set-affinity time which runs in atomic context.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
