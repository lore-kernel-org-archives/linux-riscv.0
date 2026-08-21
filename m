Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93429C5DF93
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 14:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BaSHEMAFejghQQaQZ9Mik8NU2LKVlm3PIqcW9BUppzQ=; b=UjvnZ++Hd7HxWh
	9ecr4xslEb9dFryF4SQz2woPEw0l8LkliAG6T7x0ZHlmY5wJJaOmVAZ87o2VRmWZYdD3552/MQJ/e
	OpFGLLTqROXprYBMwHHyTmP+YnoJyk0qj3yY/HoG2hvDnEfVMbuK6lef+cTyZzaExUo5YZYSMsla5
	ut+cPqSiS4+xTgR0kbhPxG/IvLJPWPUn4BV3UexBnpbeFW58XXB+97rKs1ZQv97Q+OJ0UxCNIvxhj
	U95PcHFDmpzvrFpUaea2Onf/EOGJk5t7nADwLei6V3XvyAISG4RPbfYmt4xgGcN8VHyFSGdZ9diyK
	saUyFO5V9eIQJJjvSCqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQ9Z-0000000DXYY-1XaC;
	Fri, 21 Aug 2026 14:23:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxQ9X-0000000DXYC-0Ejm
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 14:23:28 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCoYNP1249466
	for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 14:23:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aAjaC/eX97Qc62891l39Bqzx
	7m2BZLa4DWDzydgpsxg=; b=eNmHpPL+w7A9GNDiGNVj+XKJ+bMy5ITEt+9oMU/8
	69ywfuFRDIMju/pzphcM2O6jd+UmqSjSEUTtMH+EeWizoSJBEPRP1v/vunWt6YUA
	86s4KafCRdHh5xkRHy1oPVo0qNQp+iqFGQ2+vodk2qZ6/LXUrJt87UOZOD6Yb0M+
	pUBECBKBEVZd744x7tAB7z+YED5iSINFmlNxhwon5uWlhesfIxpomnIKJfzdwWd7
	Phl+unYXDEZQmowRqkqCQ++wakLGmW0dGGuuwukqIOmcog8lLRANQWcSP7BbZE4O
	alKpwJsGa9iJqrl+DJSA9y+0w2xOn0Dm52zshRzjagblQw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6ebutdju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 14:23:25 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bf321d786so9939141cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 07:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787322205; x=1787927005; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aAjaC/eX97Qc62891l39Bqzx7m2BZLa4DWDzydgpsxg=;
        b=e71l1/DBSpsGVR2XkzeYgSiUkjFZoV4TcPIJgZ3ZMKdEe1mPycbMK76nmmZcgbKRq9
         buDHc2pNpGkgITWFw2tMbMLtfT2/qqPzb7YH2GKeZpCAQwbpKfPboR9Z18JmHQaLsIgj
         qg3+t97too4qlZzpugI/RIR7l8kn5iRKY9ci7VBIUIzPu4lTHuUMawWPY6A9SkortDNs
         ML5E+GS4BcoOFYZnA7pBRF2OBgTOembaM/R7mvC11psh11tQfv+3p3/H4UkKBtl+ioEu
         uTaAmjYfAYjsKXZUyfdkyQh+J4aWBcwEKBURMHDT22kIIPf+/a1et9jLN2IK33u+4uqC
         VB0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787322205; x=1787927005;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAjaC/eX97Qc62891l39Bqzx7m2BZLa4DWDzydgpsxg=;
        b=aKQDqyIqwSfZNf9KGEpc/OSqb9KpPzHSTM46SlBK+nzRB+oIiY6rFOTIU6d+lVDnTO
         u6EeNp2fTyDIdG5KRfidMk0OhIGo+E5zIDVyonpRiCT4y6R3jI5mZrsNZohm1BoW9c1H
         zxUSt7yjWXsvVc0GQB2yeVS4XSkt9OBF4X4TAx//dfMW0rJVahEpQYjwYDdlLNu2i6Si
         X/sD/jdhm/tZnPR0EEHkcBP8NrAxciZWj4iza3tN1i20Go+VrEWdIcbtHLe8e03ivRPw
         R9WB7yDex/lRIn9CmqQYVg0H2sfGjQuDMeiqj91A+7olrXjKV7UAnxkhzRwmHu+4H/uk
         3OPA==
X-Gm-Message-State: AOJu0YyupIvdK3myArpvKS43ZZKwFrMN3SA/5IKP38HZDsffCMmOvWpe
	3bh/AkCu7k5d2y/e6az0R4bMKXR6XsXXk95xXOAShHIn4EPLvuFmPkGwkPQoC3KH4VV0IOEKDUh
	abHDgS3Tp9fEebAVvFqUC0rhdfhWeWFX3H2sZwYAg/ZpcOLNK18b30DGHPR9e3aqAjHG5kCk=
X-Gm-Gg: AR+sD12amUuLX0JZAf3yCYxPIbWa6+1n/eckvHFE852mr+WimfBSBBMPnaPd20i/B+q
	mgvNOHwVI844QN6Y896D3HHucbpBFz/JJUARC7bSKUEMX7qxNoo02PFwJNsIHsVeRE9uZU1VqHU
	l/HIKZy3VFIigzxjp761JUfLTH0l6mnke125Vv3CDDi5uf7yKL2uG+fQ1TjFZmDBEBtaCj7Fmxy
	KYHmvmPHMHXltw9NYinTFV/ZhOdlEAEyhDJ8m8xVJ8obiBZixpWfAcZvN+BX6Z6Ani8yfNEcwL+
	8Fm4xP8A5OzXXJRUbRqggVf+8CtQ08Z3EbIaLsZt6iVS7PUwEyi6mvy7yUvXwDY51N5pTqpvjgu
	xFunE10WPhMlSQPP9yVy7mrCpHmIEY/1kyBQ=
X-Received: by 2002:a05:622a:a11:b0:52d:918b:92e2 with SMTP id d75a77b69052e-52df56f1740mr67349861cf.6.1787322204977;
        Fri, 21 Aug 2026 07:23:24 -0700 (PDT)
X-Received: by 2002:a05:622a:a11:b0:52d:918b:92e2 with SMTP id d75a77b69052e-52df56f1740mr67349071cf.6.1787322204377;
        Fri, 21 Aug 2026 07:23:24 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b915c6ccsm29704055e9.13.2026.08.21.07.23.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:23:23 -0700 (PDT)
Date: Fri, 21 Aug 2026 16:23:22 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
        anup@brainfault.org, tglx@kernel.org, kevin.tian@intel.com,
        fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v4 02/21] iommufd: Add iommufd_sw_map_msi()
Message-ID: <yikhefui2flgfffmtbpdxemjtto2ryfmkgtlgdtmr2ndgxrw3r@rcjz523m3sw5>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
 <20260820214150.545737-3-andrew.jones@oss.qualcomm.com>
 <20260820220908.GE244917@nvidia.com>
 <gr2h3ktgacozyo7rdggkxsg5mbdtzcnimaawd24c37hnf2tun3@hqivsenaq5wd>
 <20260821120204.GF244917@nvidia.com>
 <zygm4qm3fjv57nsgcectwikfa3cdnidxnhv55nxv4b6l2kllrs@dt36j4p3zhoa>
 <20260821140033.GH244917@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260821140033.GH244917@nvidia.com>
X-Proofpoint-GUID: yCtJt9OFZSTWZ9KXI798FX_5vGEOKshf
X-Proofpoint-ORIG-GUID: yCtJt9OFZSTWZ9KXI798FX_5vGEOKshf
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDExMSBTYWx0ZWRfX8h+PnfXzEmlV
 2uDmuSs7vpl6Uo1FHOgXoZzCz3qTDexkEBukczW9JvKOIqCaLj21D12dHnGrmrtSas/D1GgGe/i
 CPz5aiD5IuvhcBks7XJFN92b3HlwiMA=
X-Authority-Analysis: v=2.4 cv=QJlYgALL c=1 sm=1 tr=0 ts=6a885f5d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=JO-7leH7fczbGu3iEqoA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDExMSBTYWx0ZWRfX+361p9qb/vqe
 qXm6AbXhwzSg2BA0xiGgWls8MfrARSe8GIpqiOxQhRDmMWYgra3lzgSClp9hkXDcoz/X6FyTDLa
 M9XG+hPtFOkbVYWxGGiCaIw8F/mImp7sCtfQdo+AUtKV00mDWXTAiNz94EewCXAJsqpxGdhvdLY
 TU3ka26otT7wo+oaBM1C+vox75jzwGW2/wF3z+KUXqk9VG5sRv4fSx5S8SNP3h5PmSU+UhViRgf
 3wou8Ll9J3hnnxEi0lKFPOq1aMSiFPaJ4ARA9+cauw+UGCwWbIhV4VvRwEfVKa4CFOw/Wib9lgD
 QkJhKRFdeN8n/4sG5GZvY3P9yDCz/fjhYaDWxM/R7pJLTvIvKe5K0kaJKMm4NBy25SIY2DzB6DW
 PPDTA4nnyZ+taTRRJhhZE/eYGb/DLUDcBrckt+YfzR+GJYg8P23o60oTK055ikYG0+ec+KiUDkA
 d/zoYKaKnq5Itv1FKMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_04,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_072327_220288_7E76EA1C 
X-CRM114-Status: GOOD (  35.76  )
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

On Fri, Aug 21, 2026 at 11:00:33AM -0300, Jason Gunthorpe wrote:
> On Fri, Aug 21, 2026 at 03:47:17PM +0200, Andrew Jones wrote:
> > On Fri, Aug 21, 2026 at 09:02:04AM -0300, Jason Gunthorpe wrote:
> > > On Fri, Aug 21, 2026 at 01:07:03PM +0200, Andrew Jones wrote:
> > > 
> > > > > What I rather expected was for riscv to have a PA window that is very
> > > > > big and not just one page, eg adjust iommu_dma_prepare_msi() so you
> > > > > can pass in the entire PA space that you need for the affinity
> > > > > changes. Maybe this is a list of phys_addr_t ?
> > > > 
> > > > That's more or less what this series does. 
> > > 
> > > But it does it in a completely different way, and I'm struggling to
> > > see any justification for this.
> > > 
> > > Again, just pass your list of PAs to iommu_dma_prepare_msi() from the
> > > irq domain seems like the easiest and most ARM aligned thing.
> > > 
> > > When you need a new IOVA for an affinity change the PA's are already
> > > mapped a simple offset calculation is that is needed.
> > 
> > Ah, I see what I missed. The proposed batched API would guarantee a
> > contiguous IOVA range, so the descriptor could cache the IOVA base and
> > then the riscv IR compose-msi-msg could simply compute its target off
> > that base. That would indeed eliminate msi_iova[] and all its complexity.
> 
> Yeah, that is pretty simple like that
> 
> Then you just need to teach everything downstream to have a list of
> phys not a single phys and thats an easy to understand delta
> 
> > ARM calls iommu_dma_prepare_msi() from ITS since there is no SMMU
> > irqdomain and ITS owns the MSI target.
> 
> Right SMMU is not involved in interrupt translation
> 
> > This series adds a RISC-V IOMMU IR irqdomain to replace the IMSIC PA
> > with the corresponding IOVA, so the IR domain's alloc callback is
> > the right place to create the mappings through common
> > DMA-IOMMU/iommufd code.
> 
> But RISC-V IOMMU is also not involved in interrupt translation. Beyond
> it could remap the PAs which represent the CPUs, but you are not using
> it that way since it is statically setup.
> 
> So I'm not sure why the iommu gets an IR? Isn't it the same as ARM
> where the IMSIC itself just has a wack of PAs it needs to access so it
> calls iommu_dma_prepare_msi() to do it?

Right, this series is only remapping IMSIC PAs, not using the IOMMU MSI
table. The MSI table must be disabled when second-stage translation is
Bare, so it cannot be used for the host mappings here. It will be needed
for guest interrupt files (the irqbypass series I'm also working on),
where this IR irqdomain can then intercept irq_set_vcpu_affinity().
Also, keeping the MSI setup in this IR irqdomain avoids putting IOMMU
mapping knowledge in the IMSIC driver.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
