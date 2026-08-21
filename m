Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3260C5DF8C
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 17:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nBnGtNtApIuMRh1kV2S7ElhBWrKxKWfxfiZxsj9TfWQ=; b=JFvtwxJG7N2+5u
	crdgoXiut4bP6UZgVp2CkTA09A1vmfCalannRn0t0ZBjzogC8sDGN8FS4pBbwNCWTQnukzXC9T65G
	cbZcRYpM5IgIoq65dq0d3pkRGeL0YdkwariBPAvXYdmcqQ40GQ0uDqOhS+SituGd0DFt6tDMyHVUl
	SXwONtiq1e08jM99hJRM56kNDAuZusVN6SEbrZeyP0bIR0Pd6KgHJs4WTwc6M4pSxtCqA1UUZ2bKk
	HsY9k8vzioVeRgJ6dFHNW5u9NEAVJGu/W/jcXOONUXKFrL4hFFYxPV1mmoNL7AK0JQO6vWLwt63Od
	A4J4D/ojXF9f2TUa5/2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxSn0-0000000DsyK-1eTy;
	Fri, 21 Aug 2026 17:12:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxSmx-0000000DsxM-283t
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 17:12:20 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFm53P2855854
	for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 17:12:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iWroj1XK/89RuRQdeZH3447C
	p381kc7TI3fTsbTR3po=; b=P6eejvYb0PShyDlM7a6MJ+xMVcmavUQ5To440ums
	pzrXW4SgRJgNPmabCGeDejKextTrXYECh3dH+XGOWhvnQlzsbQZr3t7D4oN7rpMD
	U9EVxv5/ON6cAFX/Qqd/BJ2qjdj68AnKV3a58FPGYBt+njk4JZ7FUcqLszuOQnSX
	fMrLhDCSUEsIdCjXXkc/Ib9RtdA+qLwjOuvX81Mxloh9lSJZS6dUOtVJBnQZY1vl
	ZTaTOAxCebddaMzVclkPbAh5iZf7oZ+LHoFowvKdhyN0tsD2mj86pRxNXc50AmDn
	/Xc4J/Yv9lMyRrcZnaP6jFlVGYSrDJlqJ11ble168tlpWQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gddjpak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 17:12:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c26012cd0so13427281cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 10:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787332338; x=1787937138; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iWroj1XK/89RuRQdeZH3447Cp381kc7TI3fTsbTR3po=;
        b=QvWAKXbRZjcpwPpUlBk3nEYoXV7ta92OYTtQF7RO1Dw22Szo9P3QAGPYNTL2lVWXnx
         6oPpRuUh44GQ3wER4x0dxgM+/0XCehjGIPGFu4iHLYArTBeKKpjmbYyGEwqDEtNi7laA
         GmCd+YQl94DtwqVgm5XSO2MaU9Vvltk516o1tL3DCiENzZHz1grW/4EQgbS0m5hDJCTb
         dIF4+KkW6BBYNmp4pMgtG/m4jad4r4o5+ZO2r7Shole9IS2giEUt8WUatU8gudvMmPOK
         AXzj/NFwXtakt53A0+3VJu54nJ656Gut1CaPaBuLYCUslFFLn2rxT3f4Jp/RiOvMKXjh
         owrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787332338; x=1787937138;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iWroj1XK/89RuRQdeZH3447Cp381kc7TI3fTsbTR3po=;
        b=qnh7JO4o2uyLNzRuQIJnsXOHxsAY2cxNv0WUzE/l1ugza4nDgu1Z8RY5HROf5Qc53b
         Mmai3GX/mv9fMyOzJO0J/n2P/BAJr2rqDUQQls+FN8XGsMh03fD1RAXo78pl2odi3VM1
         jyH+k7kXg2RMgFQsrRenu8VrREBvZAct3xZV1wUqueWcD7reXXcgFPg+NMJMGCemHQSL
         pW15/gAnZglIJd1T4Jz6fn9XL8nuCEBzmZlpesxpVOR1pAfdEzV6TUJ9pODldJ+tqECs
         SyVfPlWddQQKwzHz+F7RmP3yb++Ov9tCZLkpzvLjM97Bz540mbtZw9LKCYdMMBMHz6AQ
         PHWw==
X-Gm-Message-State: AOJu0YxpXm2o5fG4vxFABzPVjG9pL1PMcfVuSC4Pk4o+04EZG7RZw4Gb
	JxDzxmdR/Kqy71fIBWpKVtFypA7CVJDDQOY8t0VAzddhVtNcOazXX18AXqHFBu9HGiHnqAIEr7T
	2uQYfhvSdNu4z5CfMol2WgaCjCtnmaQn+tG+1VvexVSBgFqTrnBkmkfsVkuoT8EIqVHXFYwY=
X-Gm-Gg: AR+sD11k00u5z+kNDhLuyD6tyDx/CehzcCR3m9CPObcwoBW3p5s4oys1ZEljBKrWZgT
	d95JwZlzWW8b+Oo5r4+Xfv0E4bTdgmLSXuLIWgoteoq2Eh5j+XQ3ikeFyUSdDnn6qx84ZiDZkiR
	iVmhtzL4AuystsjtNRkeTsyPB6r5IVwByXcAMxXjLLLoeSz+zfODLRtWTVYUKgqk7PhGiC5jWFQ
	cGwb2qyftP+nCyns1IrPo6zxhqqnXcVzroqxUogKRTUEcyYRBYE+UwM0RJ66RmUsTJ+QTw7vz4a
	+mHLQod707td394d3iNT2r9+jCLiJk+4BPutOzdh0SGWneaVkjgSKYWtZlhikMQsKla2cdymNDu
	4NwHQpFyj8UqbvR+e9qQ7+EAQJUKh6xlpefw=
X-Received: by 2002:ac8:5f52:0:b0:51c:a8:51cd with SMTP id d75a77b69052e-52df569457bmr68674401cf.1.1787332337862;
        Fri, 21 Aug 2026 10:12:17 -0700 (PDT)
X-Received: by 2002:ac8:5f52:0:b0:51c:a8:51cd with SMTP id d75a77b69052e-52df569457bmr68673121cf.1.1787332337130;
        Fri, 21 Aug 2026 10:12:17 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9ba2813sm23502605e9.4.2026.08.21.10.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 10:12:15 -0700 (PDT)
Date: Fri, 21 Aug 2026 19:12:15 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
        anup@brainfault.org, tglx@kernel.org, kevin.tian@intel.com,
        fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v4 02/21] iommufd: Add iommufd_sw_map_msi()
Message-ID: <dug43layphru76sqleerwtryyerwa4a6n5s4xwrk4iyfru4o7m@al37eknignld>
References: <20260820214150.545737-3-andrew.jones@oss.qualcomm.com>
 <20260820220908.GE244917@nvidia.com>
 <gr2h3ktgacozyo7rdggkxsg5mbdtzcnimaawd24c37hnf2tun3@hqivsenaq5wd>
 <20260821120204.GF244917@nvidia.com>
 <zygm4qm3fjv57nsgcectwikfa3cdnidxnhv55nxv4b6l2kllrs@dt36j4p3zhoa>
 <20260821140033.GH244917@nvidia.com>
 <yikhefui2flgfffmtbpdxemjtto2ryfmkgtlgdtmr2ndgxrw3r@rcjz523m3sw5>
 <20260821143155.GI244917@nvidia.com>
 <pzlzv2lzik4miqc5oejichltnyqabolyaezbkrufcl7nbttygm@7rdmkig3t56u>
 <20260821161256.GK244917@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260821161256.GK244917@nvidia.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEzNSBTYWx0ZWRfX8JhmAjCOJbYe
 XD3Bf+hXu8yxhPVPf/r2dwGQHMxDtCYwqzyfEhKRBY67IydhH85Asb7skvm6qjlQCuAVe4WVb/a
 7x4hHa60iidY3yEP7NTYQmF3+tZVFNA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEzNSBTYWx0ZWRfX8jWAiN/Cgslc
 KWtNCMNoNkH8NdHaXez+Q6n2MoikMN7+zU5CECmZ83Tc9TISnvmNT7b6B56YNxluxFLrebiH1FS
 aLP4xRyRB436TjA2V+3gIw+P1x2pqzlRtgN54BDoNlPTnH6bH0elxf/H+BmDQnftbZabZldrfBm
 K8dfOzoaBP4rvnHblUZvjBGk8YIi0T64zmgKT0XJ6pD47IYxs0NGR3WHeaWHIlWLpkSKgkZ2SJ/
 uUeO4HwnBLPeeT5egbfI+17X6kEHuB/KtExWPezgNGVkXjnGmVCFJr2mpysEkCa/kF2+/xdIF8d
 NrKe/Kc+FtkhIXfgWKhcqh0+TWQ2dlMl54/l3F8aVase93u34tny2mWz1MKiSAMs2XVJM057Xld
 5tYTsBektKCy8aM2cQedhr+YAo464ttZBQ3ZlBMRRAkn/M7vlLpqrvL/+jSBNeoUrKI2ffi+j/D
 f6cdMwE5arqIP5K5+Dw==
X-Authority-Analysis: v=2.4 cv=ApHeGu9P c=1 sm=1 tr=0 ts=6a8886f2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=M3lcFmtXjUYoSr91DZcA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 3Gvvl9V6rWt7gk0p0IrfA8yMC6mYEFIE
X-Proofpoint-ORIG-GUID: 3Gvvl9V6rWt7gk0p0IrfA8yMC6mYEFIE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_101219_678486_3566865E 
X-CRM114-Status: GOOD (  45.01  )
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

On Fri, Aug 21, 2026 at 01:12:56PM -0300, Jason Gunthorpe wrote:
> On Fri, Aug 21, 2026 at 05:18:49PM +0200, Andrew Jones wrote:
> > On Fri, Aug 21, 2026 at 11:31:55AM -0300, Jason Gunthorpe wrote:
> > > On Fri, Aug 21, 2026 at 04:23:22PM +0200, Andrew Jones wrote:
> > > > > But RISC-V IOMMU is also not involved in interrupt translation. Beyond
> > > > > it could remap the PAs which represent the CPUs, but you are not using
> > > > > it that way since it is statically setup.
> > > > > 
> > > > > So I'm not sure why the iommu gets an IR? Isn't it the same as ARM
> > > > > where the IMSIC itself just has a wack of PAs it needs to access so it
> > > > > calls iommu_dma_prepare_msi() to do it?
> > > > 
> > > > Right, this series is only remapping IMSIC PAs, not using the IOMMU MSI
> > > > table. The MSI table must be disabled when second-stage translation is
> > > > Bare, so it cannot be used for the host mappings here. It will be needed
> > > > for guest interrupt files (the irqbypass series I'm also working on),
> > > > where this IR irqdomain can then intercept irq_set_vcpu_affinity().
> > > > Also, keeping the MSI setup in this IR irqdomain avoids putting IOMMU
> > > > mapping knowledge in the IMSIC driver.
> > > 
> > > It's ok for the IMSIC driver to call iommu_dma_prepare_msi(), that's
> > > the architecutre of this at least.
> > > 
> > > Until you get to adding something more complicated, eg irqbypass, I'd
> > > suggest keeping this series simple.
> > > 
> > > I guess I would wonder why the IOMMU needs to be involved in changing
> > > the mapping down the road, why not just reprogram the MSI-X address?
> > >
> > 
> > For guest interrupts the MSI-X address is a guest IMSIC address.
> > Reprogramming it handles a guest reroute, but not vcpu migration (the
> > guest address stays the same while its host backing moves between
> > guest interrupt files and MRIFs). 
> 
> Linux isn't prepared to have a guest controlled MSI-X addr,
> AFAIK. I've wanted this for a long time but we are not there..
> 
> Does riscv absolutely require this? I suppose you have a new problem
> where you don't know what affinity the guest is selecting when it
> provides a MSI-X addr as you don't know what physical IMSIC page is
> under its S1 IOVA?

The IOMMU MSI table operates after S1, so it matches the resulting IMSIC
GPA. With a vIOMMU, the guest may use any MSI IOVA that its S1 maps to
that GPA. With S1 Bare, the device uses the GPA directly. In either case
the hypervisor provides the guest IMSIC topology and the guest interrupt
file or MRIF target needed to program the MSI table (through the IRQ
domain).

> 
> > The IOMMU driver updates that mapping through "the hypervisor to
> > IOMMU driver interface", a.k.a. the IRQ domain's
> > irq_set_vcpu_affinity() callback. That mapping cannot be prepared
> > ahead of time because only the hypervisor knows the target, and it
> > may change later.
> 
> Nicolin has a series that worked toward making ARM work properly, it
> is not at all like this and it isn't done with remapping domains.

I'll look it up.

> 
> You want to preserve the guests physical MSI-X info directly and plub
> through the proper mapping so that the S1 -> S2 translation setup by
> the guest actually works right.
> 
> If you don't do that then you can just have Linux adjust the MSI-X
> addr like intel does and use the RMR trick from ARM to get the IMSIC
> pages into the S1 IOVA. Still no need for a remapping domain.
> 
> It's so complex, so I think you will have an easier time doing tiny
> small steps at a time..
>

Right, I have a working prototype where the hypervisor manages the MSI
table through the IOMMU driver's IR irqdomain with
irq_set_vcpu_affinity(). Splitting that into upstreamable steps is what
I'm working on now.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
