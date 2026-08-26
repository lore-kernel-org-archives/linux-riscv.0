Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C53EC61DBD
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2026 08:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FaVM/PKs+kbo6pqdhfRKJLrlRP9VRFLNBEuTm9JdeFs=; b=WJw0Y3OvqA2OXj
	5xWt4AQXz6Q64AcBVx/L+d8SQs0z45Abj/Xl50dFbApjJDs/XW2e5F0UOrRBwQLri6++1nV24YHey
	hIx1no0NJi2IIZR0QWzKtPMANpBin+IwrMNVX0tJD++zAqDct1Q3bUlnvmKNTWG6Zm1VusDX22DjB
	vUmNGMIplVW4Ef9p0rWiYwATWY5jVaTY0Nr02JPCzG+yhkLEJrwZt5IB++M4zUcWymofXoylH0KEw
	Q/r6CRo46nosvF+oePiA3tSAtVuDL+VZM9Ug2POZsiuCFXsmU4dfuFe+0FAXClgOL9XN8iriErrsO
	0/nHmcqijedwE7MZTeZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8us-000000025E6-2ZtC;
	Wed, 26 Aug 2026 08:23:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8uq-000000025Dk-0rfl
	for linux-riscv@lists.infradead.org;
	Wed, 26 Aug 2026 08:23:25 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6RbK8105897
	for <linux-riscv@lists.infradead.org>; Wed, 26 Aug 2026 08:23:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=B6S0XSb7Xjf9sBqDwusWxhpG
	sdWSY98+rflXE12tMiQ=; b=duSEU5yYq1Ls1/kNz3Oz9ZRQs/OU6F2+/jnkEWKv
	Y03UEjjTY4C1opCcM3e+HKk/XBHo30MFFbuyM66iQdBoL5ZeM8aj912lga80432B
	QtMICHa/V2ZCPxSh3H6dMPkaKxRwQdx+IKuCmKr2H9it9SqzL8J5zH/h8Uq1tg3W
	cJEhAyQ6lcGpJOXBzQRhtxs3h9hlKfcPLMtjw0nFQ2ASYY//MKYbwkGT6zbwEGwg
	RrWa452PhVhoemS43EE5y7DInP+XFTU76B8KhgSzU31t9gp8Ljs/WUt6IJ/9nhGf
	J3WYn8JYaIu3RocBAM2cF/+U7gLYlXbGPMFP7qJaCkWniQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9r0k1586-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 26 Aug 2026 08:23:23 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52d7b3adda4so7417251cf.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Aug 2026 01:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787732602; x=1788337402; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B6S0XSb7Xjf9sBqDwusWxhpGsdWSY98+rflXE12tMiQ=;
        b=UdOWGSMPqif8wl2O36jOyXwkK8xyKFBGAqy2I3qXr50GLmOdP3ffeiYmgO7RFDv6NO
         Cdum1DBlTqHi3Zv3Mjcqi1omylEoHp56JulGYQZ0QTcUspwSCYrMINPOQxPU5tUofzWO
         0dgcRI3VnAFYACXfbjbHZPjtO3bcMwYkMD7b3pd3hDXYHGkTxoxUvH62cVizkrQVcwCB
         99MP4vOMuwfi39zlz+IvdsDA0b6+ShDKolmJp83qt9HmIp37Xjrx7x1KlGmbgNuklSWn
         86RQpCaF0mAbtPcKge6S4P/QyoNKEvj82BQfoLncSAX3GfX/Aa4V0O8VT/gvgrqyQcQR
         AxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787732602; x=1788337402;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B6S0XSb7Xjf9sBqDwusWxhpGsdWSY98+rflXE12tMiQ=;
        b=ATaWGIH2FxyAkwyIdh5x/HB5836Tl8wij8xKMmSOTpUEXfWqCrwinrdrroLUtMTCWQ
         dg8KXO1LvVEZo7OCpbRhGB/81FrGASj6YS2BVTG/z/Yv5Nfd+O2XCUi664V32lpXfqah
         Ku9EOAeCDuMycCsoZv0TNLyT31Nnhye7tdVgSRFZpy4PoLqYEk3QVQxX42kD7gHiww5U
         lzLB0SXbwQpRz29a5WqDpOuU7Dn71XQ8gno+1EFqoPE8SVDtFuj84zYRmeSW3x41xrZ8
         BEc6LPMZYPcl9rMg0VZG8LJQ1RAkJFCEBK3z4kW1NDGGdaO8g9dpKdxixV9dZ2ezrzn8
         KD/Q==
X-Gm-Message-State: AFuF++nwpkCgNqfXNeKsZobK5d5m0vweRtAVAZuk9FwHPuLOVxFqL6zS
	uO1Wj937+WtJAuss/r4sk+3Y5waYBNqipYS3abgrGONfsHUdzWl3nQ8mT86whCY4bxvqyyh/Ggy
	tX19fSz2QW6ziKnK7zyG/MnKP0ECbCimrA5VPtTuLrX1+rmQ/6eY+VU6Lll2rpZXnOKUNZB4=
X-Gm-Gg: AR+sD111OqD9zgGGrckTOdlyhELR5Nsw6PznZwWA/4MwC/xAkEaZAZ4Z4m9tbOFhPR0
	EOVXrVBqloPXp84deYqyi/oSOmANGj8jqTWQhmqRPedtUadlQQGOBf7Msc17tLBu9wuXMXFO+ZG
	oJRjq/nP49+YsKErE3fSuoQ8Ds715R3uMjm6vXuviYalFRb087W92aNJOkGO9hiJmWJ8cFr+TzA
	9Zecai56nXjW+QO2JFCW5gpey302P0bHz7XsYqV1BeuaUp6AegFalZ7fiZF3zM2lEkEL3t7v7Ix
	ATdyN2syBGh4ocUdPkNtIWxrWM2LoHJk/7xMAL8QlFpK6fAwqYhftz5ZVQiRpSAzY517nepT1l5
	DEbjqx+wf
X-Received: by 2002:a05:622a:1924:b0:52d:cfb2:4f85 with SMTP id d75a77b69052e-52e4223567bmr52103291cf.4.1787732602551;
        Wed, 26 Aug 2026 01:23:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1924:b0:52d:cfb2:4f85 with SMTP id d75a77b69052e-52e4223567bmr52103011cf.4.1787732602161;
        Wed, 26 Aug 2026 01:23:22 -0700 (PDT)
Received: from localhost ([193.165.40.195])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab569sm1924300f8f.16.2026.08.26.01.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:23:21 -0700 (PDT)
Date: Wed, 26 Aug 2026 10:23:20 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
        anup@brainfault.org, tglx@kernel.org, kevin.tian@intel.com,
        fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v4 02/21] iommufd: Add iommufd_sw_map_msi()
Message-ID: <pzutriwhwe4whonj3veoo4hzxmq5tlmmyui5u6gt4bgl5wxxrg@qjsq2pvd7by3>
References: <r47pwpyoc4ynv57vtwer73dwikqkev5nfy7kqyba7sqzh5pryi@teiqr5a4cw4p>
 <20260824125204.GP244917@nvidia.com>
 <fp5myre5qaersxxshitgoupbzkx2zwo3rsz3q5jfdiarmtwknh@gmfhz3cxuc33>
 <20260824170417.GR244917@nvidia.com>
 <3gdj54zcs5dncgom3zlntyredyuh2xe5ueg7nd4pdrcksmnwfl@k3fyky4h6556>
 <20260825140334.GA3325090@nvidia.com>
 <cxbneh42ui3gbkoqrsnoatxoec5exzbprfbgxcy4iekqmbceho@gouiwn5q5uzs>
 <20260825165209.GB3325090@nvidia.com>
 <iltwtfmgnmofsroo7eqrvjx6yhqbptwutywq65mgm7adudz7pq@2mdg3dhvtoud>
 <20260825175901.GE3325090@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260825175901.GE3325090@nvidia.com>
X-Authority-Analysis: v=2.4 cv=fPEJG5ae c=1 sm=1 tr=0 ts=6a8ea27b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=CzrpMg+lqiTzknPDBj2tlw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=_zQ45S9eJeQoeudCiGEA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA2OCBTYWx0ZWRfX69hUZzzUbkXG
 DAQgglMp2dEg2eAE/ZBvFjHM6r2W6ro6X4fRIGXkDwHolgAIC+CUTL05t/lhKv6DB9GKPWxz++F
 4OiUVDAm7HX1cVsIlwla0Cu3WTXKFYw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA2OCBTYWx0ZWRfX9BRGmcAX8diF
 tIsHyigEsL+3GnYT3ZS1D3QcDp+WhdgvmlQxkabAYrjxpwYz559YLIP93NM1XRr3c0YPrhY5Q55
 qiKwwkMO9NYPRTuid1AzajHB1JBhtcLsk9yZdCp0WYmIlSTJl20ag6Dh7cQjOiLr53I15h4oqqy
 sAXeO72jhSWyKsxtuNx1mmvbaEuDUYUkohal2SHJsMGt8SdOgFYGMp15eqoPV3uv6KnfaGHbhEE
 CLJh0oXvghCy/jGEjIOVabzJZbUP2sZJH0XIxhoFydtgRHOWPA5gKyzpri0QIwdXrADqiIPO9f1
 zEioEs3Z9GB0odFWdBfv+JDSBwnEmRhcCeaq61T25CHCNfQCCRaQXhhStGJtdrbx0/pdRgWjNYq
 sMXPEA93VsplnKfhJ8R54E5PZIG7CfsxPBDGHmAhCf8NzMGwW8WibezJ8Tapcjo2vNHwoBpHAKl
 GkWNueHwtsCpspTZXnQ==
X-Proofpoint-ORIG-GUID: SAkWzB97u6jQyatZjMsDxtlSNxn0ozKI
X-Proofpoint-GUID: SAkWzB97u6jQyatZjMsDxtlSNxn0ozKI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_012324_251573_742D58D3 
X-CRM114-Status: GOOD (  19.21  )
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

On Tue, Aug 25, 2026 at 02:59:01PM -0300, Jason Gunthorpe wrote:
> On Tue, Aug 25, 2026 at 07:38:50PM +0200, Andrew Jones wrote:
> 
> > The IRQ domain is per-device because it is part of the device's IRQ
> > hierarchy. It does not own the MSI table. It reaches the device's attached
> > IOMMU domain, which owns the mappings and MSI-table state. If a device is
> > behind parallel IOMMUs, the IOMMU domain implementation must program the
> > same mappings into all of them, just as it does for ordinary DMA.
> 
> The iommu driver should not be deeply involved in managing interrupts,
> its is wrong layering. Having the irq side present things it owns,
> like the physical page to iommu_dma_prepare_msi() or an entire
> remapping table, is much more reasonable, IMHO.
> 
> Even the x86 drivers with their mixed HW still put the irqdomain in
> charge of the msi related datastructures inside the iommu (including
> irqdomain directly editing device contexts!)

RISC-V uses the same basic model as x86 (an IOMMU-owned interrupt
remapping IRQ domain). x86 makes that domain per-IOMMU because its IRTE
resources belong to the IOMMU instance. RISC-V makes it per-device because
its callbacks operate on the device's attached IOMMU domain and preserve
that device's existing MSI parent. The IRQ callbacks provide the lifecycle
hooks, even though the mappings, MSI table, and device context all remain
IOMMU state.

> 
> > Right, the host does not use the MSI table. Host remapping replaces the
> > physical IMSIC address composed by the irqchip with an IOVA that the
> > device's ordinary paging domain maps back to that address.
> 
> That's what iommu_dma_prepare_msi() is for, it shouldn't be wrapped in
> an irqdomain.
>

As said, iommu_dma_prepare_msi() handles one fixed MSI target. RISC-V
has one target PA per IMSIC, so the proposed list API prepares them
together and guarantees contiguous IOVAs. The interrupt remapping IRQ
domain's compose callback selects the IOVA corresponding to the IMSIC PA
selected by its parent. That selection belongs in the IRQ hierarchy.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
