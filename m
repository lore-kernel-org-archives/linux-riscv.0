Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F01C5DF97
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Aug 2026 13:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xkylFN/LyKxP0YjYwrrRaJ6cdgfUBv7Jbey4sqsC6Rc=; b=uSPdjJxBc2aAEN
	aLjSx9/gVyV8TAvkIjdVeF43Ym6udK1nNBIFciM3NuDOW6qt/VOKt9ZSwRxRxCU9zOjLuq4Giq3Tq
	wjm9cEGNpvkMcR/mauC8kezN0BGlcVIx69qFB6jiFyXj8MgYUrLppRSlw8gQ3GuzUsjB90+6QvmgI
	L3L7msWBs87+wL7H1IQAsm+6okTKz+alA7xTfgxdkBHf/62Sw1Zmc3nG24rsHT8U7frH8GiGVNAYx
	gqwOCzB8Cl/LRDVUwHLhRjj3V8GRGjrEhdFnk5LIVnDm7OdGlu/gEc1M1VbBA9Lmo4DUhl21PgFen
	y3bDyHvjjKmrU1b0zL9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxm6v-0000000EYOU-1Siw;
	Sat, 22 Aug 2026 13:50:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxm6s-0000000EYO4-0INf
	for linux-riscv@lists.infradead.org;
	Sat, 22 Aug 2026 13:50:11 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67MB79e14064583
	for <linux-riscv@lists.infradead.org>; Sat, 22 Aug 2026 13:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MQZd3mlyLKLZ4bkYPOlYGln5
	yVbgJtgSpLBt9iGtXzY=; b=ZsIaUaB+fXg9v4plSBsAehTTAjOLzxDReSqFQ/wJ
	1u8QUda5o0Muo3+xu67YwXzexif52zZdJhDbN/EjQEjKrcCIc4sXe4ODo1xM+Hxw
	v1Q+0hXfZ1oeMlnRJqgPtxF0SFu6VSDMjkaAm6r4+zapbX1nH4JYIlbAJiWIak9P
	0Ze7ArWCT50dkAQt7aw208yaH7U0+rLXkiv4on60fRR6Tr+wVId+2UEDjbLvCQDm
	EO9M+dmfz0RldBS4Oxcd370Lr+JTBKmSsdoGvG6PlpVNNCyJDNfRq8zXPub97rqL
	fhzcpbM2GQjW26/qU7GC9Y5ok+IUmdH+bEOPb5VLeWSVpg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744qsaft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Sat, 22 Aug 2026 13:50:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92efd2ca21aso351001685a.0
        for <linux-riscv@lists.infradead.org>; Sat, 22 Aug 2026 06:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787406608; x=1788011408; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MQZd3mlyLKLZ4bkYPOlYGln5yVbgJtgSpLBt9iGtXzY=;
        b=I3xW9vQWHqTL30QIPrk2DIxqyip7MmPt8+zyxlzgoCThyipVuXG7+kbEn2p8M+AgGp
         V0OnfhRIiQVeBNPSj7LkBiDpCs1hf5+h6N60dEshZccXdnD76pX1Db5FxZNlq8gRhKyI
         MRFSwwbLx/AoCJO2QBPNQwXGHqND/oyXmlxhNgeAehn4Z5QBj0m0wlwdcNF2nG80Dd4i
         NDgEwz0l9yOG+rjCai+v/Zzj98Qu38QgeOV/EXv2Wj1z7+8hQ1pnAdyjNr/Ot8i03Lnq
         uMGEBQttMLlMLGxX/r2j9/TM2b/qpm11lBzeBKVwiK6MQx1Us2nMRPJ+aIkP0cDc9Daj
         wU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787406608; x=1788011408;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MQZd3mlyLKLZ4bkYPOlYGln5yVbgJtgSpLBt9iGtXzY=;
        b=GBWN3TQ5QPMn6yu/t4X3HOTje3y8U2DUkYeOvZaC9rkESKcegUhkQSYe1gG/u5FKoy
         RoiQbCfSRowVE3Obp+unFpJwbzsnlwcbVRvru+C7liAYaM7ztCJcq7leGqj6siLm29l9
         IxjsfvMxBVIgqGwafGNY7JH2Jr1YnNmbbuIqoXno4S06/qag85Tfl72B+E3JRfp4xfck
         7S+oVOjK6ave6PVMMlHscC5E/OIwzGcEio9r3tCLER+14PGLgst4UcJOyaBfwoDk2u0F
         Ye7qa6DG7h/GHbMN26H8soWKuYK/A377AnJZ7Lz3Hq3rSG1tglBAQhdyFprK3lY+uBXe
         fRog==
X-Gm-Message-State: AFuF++nt2QJJ3Q5qnnf1WBl9S/57Z5koU4lZkVYYQTxDh/IEg28q7n1j
	TabQXkSVISmfl3J19JNrFMHgSX30fgfZQZprAmWaZAX3eVZQ0yhZbtO2a5WMimLqtgPNJ/1YLlS
	Lutlh2POXTBx/rY/FcnH4g81SEI38o7Tt0WpNL1yXcC1SzniuQR683VXaCWvgp9pMtwFbZAE=
X-Gm-Gg: AR+sD12jhp7rgwJQA9gP5ff6EcSG4EYHOG7vzGqVCAYIDIU7ZEnjfk8wEIOXo4b/QOu
	5jYdccMPB87ZyzkXoI96viqG3vMItt/2+JkBFaaci5j7Qahj+PY141D+BeYIxdSzjzn/bsupAoo
	Ln4W9y4hrPhIfcQFAXgUc8P24wEdFXALjQJO8WTAY/y3xbN/GC8kh2MCyuH2XjK6lzJgVHWa/Zy
	z8qKNY/w0Ap01eRL7zGd5TaP1seDDySE0gxhMUYrjwMA8o3Z0WvV8EwPyFHPLXE9wXm5adYtTMh
	TKOQi7xL8xmhN6PXZyGnClyMFst4DP2ttq25aRhyNctKEg1Qx4wRsefAm1+qG+N+7Fv72TRtYA4
	OdOk+YKtkB6UgwZRQckidd+3kZ/1xaY1xgxA=
X-Received: by 2002:a05:622a:481a:b0:52d:f484:eefe with SMTP id d75a77b69052e-52e09cf363amr54379911cf.35.1787406607977;
        Sat, 22 Aug 2026 06:50:07 -0700 (PDT)
X-Received: by 2002:a05:622a:481a:b0:52d:f484:eefe with SMTP id d75a77b69052e-52e09cf363amr54379411cf.35.1787406607607;
        Sat, 22 Aug 2026 06:50:07 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9a95fe9sm39482445e9.0.2026.08.22.06.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 06:50:06 -0700 (PDT)
Date: Sat, 22 Aug 2026 15:50:05 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
        anup@brainfault.org, tglx@kernel.org, kevin.tian@intel.com,
        fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v4 02/21] iommufd: Add iommufd_sw_map_msi()
Message-ID: <t2l77h22pz2jg5vsgoth6324u36szra3orgr2g2xo7olyuhzlb@53wnsyhz7aqr>
References: <gr2h3ktgacozyo7rdggkxsg5mbdtzcnimaawd24c37hnf2tun3@hqivsenaq5wd>
 <20260821120204.GF244917@nvidia.com>
 <zygm4qm3fjv57nsgcectwikfa3cdnidxnhv55nxv4b6l2kllrs@dt36j4p3zhoa>
 <20260821140033.GH244917@nvidia.com>
 <yikhefui2flgfffmtbpdxemjtto2ryfmkgtlgdtmr2ndgxrw3r@rcjz523m3sw5>
 <20260821143155.GI244917@nvidia.com>
 <pzlzv2lzik4miqc5oejichltnyqabolyaezbkrufcl7nbttygm@7rdmkig3t56u>
 <20260821161256.GK244917@nvidia.com>
 <dug43layphru76sqleerwtryyerwa4a6n5s4xwrk4iyfru4o7m@al37eknignld>
 <20260821172015.GL244917@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260821172015.GL244917@nvidia.com>
X-Proofpoint-ORIG-GUID: bjxvfgWm88jYfr-MBjTFCSrjn33tbCVb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIyMDExNCBTYWx0ZWRfX+ZQPHZ6AGc1b
 BD1tzp73hOpEt/uowPyFKWq4iWaOR6AQBs5lxiiwE03+MsYRkBNMU/ZmZwWkDsmKff+qPpOP8iX
 UfNpTuj7ebCCeQ67/zDH3FKImbmHy9NLF2l4yK5Mm/UstRmOxyM+8VFcxRBp7acDCSUtkXbWsDb
 xp7pU8/qrxLtpPw8+8jEsNHy5UPmVu5GqzIlRWCQvuPq6pKtwG2CUMR8szWycrFuY0wUrR0I+iA
 7MD7hEd7FnVA7/e4gm3y/VefnkG8uzfEMINMSdzbDLjrBCahOXyWY/kRuLR3fGqycfKwuGxCW2N
 NlICFtasJAKTatTQEs7cRW6ptg09ud7NkZS1zPdacppiqYbI/nE9yIQsscO21AzMAJ8K+cE4HOn
 RqGAf8s36KJFuK7C+KhG5nQjWMJZxvMQ9F77lXuAvB0NN1HxgiZacA2eMTU8m7Qb07qSr4Jm3l7
 hmA+W5W4pxXSSqgc4Pg==
X-Proofpoint-GUID: bjxvfgWm88jYfr-MBjTFCSrjn33tbCVb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIyMDExNCBTYWx0ZWRfX5QmhO36TpRgO
 Vl3us0svbd8nfpp1W28fRbGNfyQw1oNM5gi5P28XxMrQEz7RPyXCaNFomCzF409K8xfCOx1Rxyq
 5fzlO2T1vT3JST42ZVCijcKKOe6R364=
X-Authority-Analysis: v=2.4 cv=BNuDalQG c=1 sm=1 tr=0 ts=6a89a910 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Q-Dk72any4QruATLw1wA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-22_04,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608220114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_065010_267074_CFE875E1 
X-CRM114-Status: GOOD (  29.60  )
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

On Fri, Aug 21, 2026 at 02:20:15PM -0300, Jason Gunthorpe wrote:
> On Fri, Aug 21, 2026 at 07:12:15PM +0200, Andrew Jones wrote:
> > > Does riscv absolutely require this? I suppose you have a new problem
> > > where you don't know what affinity the guest is selecting when it
> > > provides a MSI-X addr as you don't know what physical IMSIC page is
> > > under its S1 IOVA?
> > 
> > The IOMMU MSI table operates after S1, so it matches the resulting IMSIC
> > GPA. With a vIOMMU, the guest may use any MSI IOVA that its S1 maps to
> > that GPA. With S1 Bare, the device uses the GPA directly. In either case
> > the hypervisor provides the guest IMSIC topology and the guest interrupt
> > file or MRIF target needed to program the MSI table (through the IRQ
> > domain).
> 
> I suspect you should have an IRQ domain for the msiptp functionality,
> but IDK what it should do... Is this basically to remap vCPUs to
> pCPUs?

Yes, basically, it controls the mappings of the vIMSIC GPAs (which are
per-vCPU) to the guest interrupt files and MRIFs. Guest interrupt files
are pCPU resources that the hypervisor manages and MRIFs (memory resident
interrupt files) are just RAM that the hypervisor manages.

> 
> The viommu can set the msi_addr_pattern

msi_addr_pattern should be under the control of the hypervisor since
it, and its companion msi_addr_mask, represent a block of GPAs. It
will necessarily have to match the vIMSIC topology described by the
VMM to work anyway.

> 
> The existing msi stuff can place the physical ICMC at the right spot
> in the S1 to give to the viommu (Nicolin's series may be needed for
> this too, I forget)
> 
> Not sure how you provide the guest MSI descriptor and have the irq
> layer program it directly..
> 
> It is unfortunate you can't learn the vCPU the MSI is targetting from
> the MSI descriptor, in terms of linux that's a pretty difficult choice
> to implement.
>

With the RISC-V IOMMU MSI table and irqbypass support in KVM, we can
write the guest's MSI messages directly to the device without
interpreting the IOVAs. If all vIMSIC GPAs are pre-mapped in the MSI
table, S1 can map any guest-selected IOVA to any vIMSIC GPA:

  Guest IOVA -> S1 -> vIMSIC GPA -> MSI table -> VS-file or MRIF

Guest changes to S1 or IRQ affinity therefore do not require MSI table
updates. And, when a vCPU moves to another pCPU, or switches between a
VS-file and an MRIF, the hypervisor only updates the MSI table entry for
that vIMSIC GPA. The device message and S1 mapping are unaffected.

As I understand it, Nicolin's series addresses the ARM split between
SMMU translation and ITS interrupt remapping. The guest-selected IOVA
must be preserved for S1 while ITS routing is managed separately.
RISC-V performs MSI remapping in the IOMMU after S1, so guest MSI target
changes do not require corresponding per-vector coordination with a
separate interrupt controller.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
