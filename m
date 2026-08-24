Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E5C6C5DF9C
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 15:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7JSzyqMBe0acLdzFGSN9vCWguamTk9s3E7i0BtuFRy4=; b=fX0uRLxTLQ0HQj
	05zNYCVW22dHvRDPV4BqxFCv18WGF7J2QhuZhfXn2YsSrrwpX6oq0J3JauKLqIi+u3nbWI82/X0Sy
	cBRxlqyTj0QEcP3z+FbhXZFZRf0vBCOeBSa4TVPF1nzgl6SirZqacxgmQ9nu+6CArhvYrb932A/0K
	rqCmMCj38Gp5eHr+iIEOgtQe4kUgR5ij7xKW8X0sAErxXtEkwkoVUdj1fxoN9+BCHsbBZ4Xvxe54H
	xwrct4aaUId9kwP+2ZANL3inR2aJGMVAWTaRfUc1/dUWaifuH84xoV/OZFW7nFPkt4UzQWw3hlss5
	8ueVrTjm0XBEbUhM2RCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWpc-0000000Gwzs-0rFn;
	Mon, 24 Aug 2026 15:43:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyWpY-0000000GwzG-12gT
	for linux-riscv@lists.infradead.org;
	Mon, 24 Aug 2026 15:43:26 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCuxj91880562
	for <linux-riscv@lists.infradead.org>; Mon, 24 Aug 2026 15:43:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JPxriDT4TyeXl7GuZnjO5GqL
	1w1hXm6wKfggUrOH0U0=; b=KDRhggI6LKxKcKQgK9ndPr6U6+/NJqGXK7N+RyfL
	9qUzhJL27TgxEDX67o8I41GWz1ZTwjt+v+bMcFuR2sc0rXhvdZMg7MQ7J65jtL+H
	9To7j/sqTuTAe/fnXcT91Y7xSyuLxqYMqStsaA14k2lbW/xfRYfF3TSQt+q6e12P
	ICgImxgvQ+DkxkhYDz66QH4aBmIysxp+e4V8xZZI8U+DytaUXYmTSuy8XIr9FZ3k
	LI/hgPYv9XpRvlkd7OJIgK5n8/nWc6VR2zEaoH0mnE2pZWJzn0liFaaNaimy9LCS
	Quz+R6z9t4D6ifoLlZ9bn6EPh9YOrCLFO+9dzHuASm+uiQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8huf20rd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 24 Aug 2026 15:43:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52827090cc5so376641cf.0
        for <linux-riscv@lists.infradead.org>; Mon, 24 Aug 2026 08:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787586202; x=1788191002; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JPxriDT4TyeXl7GuZnjO5GqL1w1hXm6wKfggUrOH0U0=;
        b=gUtCPoIGxBIOlVTGKWCa0ESbJFrqOxs7bbESpKPZsbiCtCkd4Ilvr14swCTcPGgE9A
         0doHXvWLXXXroVeSRs3k9jZumfRr+yeCMYdPuuEuDiJQW26zlWK8Br4j9ZCUaXgNWOZ3
         DKwULAXyu9mfLoTYbJJmf522c0t1f2cWkyiunGj1lv0HqPDfNcuKwZ+Zsd031ZxvL7Fj
         IRUq8PyTeq2zBxtRQmnylQfaVNreeFRz8H3u0n7RVNurK0zAHjsIiwaIkIO0+2blespM
         V0SftBVCxuCMvYc3thSqeWDEmMWnc80drgqu1JrUrrqiKcXei5oygovYvc7+grcu9HBV
         r1Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787586202; x=1788191002;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JPxriDT4TyeXl7GuZnjO5GqL1w1hXm6wKfggUrOH0U0=;
        b=lNW3zKLiPHbK8rneXeygEXtA/6gRrFzB58ahbaLQQ8DRn16rwIMj9wJCI6iP52oVtO
         32xONwPuTwp16uTuGeHQ1g3Jv5Ve2tpyTsXdN+TdyYv0GVTO+Aa61BhG2cvsMS9VlAJF
         wojouhtoEcVLR7kYfZcm18l191Cw5tsvcoT2wmfm/u+jeqiXM2d/AlofbKrg35KRR+QZ
         s1xMQin4V4PbbgQCLku7J67rPcfe4YFA2Ek9pk2m9omvTWeLJ72b1mNQBZr0x/Wbrveb
         3Dc4UAhTQXIiP12LQLxDFain5fZyc3MujvwHp5frH/cE9uaingNPv3Wr78BHGre+Ru2m
         HU9g==
X-Gm-Message-State: AFuF++mdyHugqc6Kg7wxS3oEhePbn7L6fMEmyLwl89FbdnzUl6X6WiaE
	aVrYvY+0oEYx7+eq5/TaIYecI1PqGvIAGR5w+kON2SisAwETamO5zFQXEhT+eZml17Dxhfv3nPb
	dTYkvkcg5GCPVyGgXG8i7N2LUZUhSSovzqlpCdLiOnFkYitwhiy2rhXef6zaN9FLVOr/x9mM=
X-Gm-Gg: AR+sD11+DN4GzB2malAnXsFu05DPIwHds31RF03LMcP6vshTc7UL0RlASPmWfaWT+96
	StlVUSGkxGmT3g9S+J6BR0AaGICUfqOwolTacoDVxwvigB39bTzwrYL78RCPH40syGrk2xFei0p
	xbz5zktbBRHztt+Cu3j5v7Dev8txK3JT49aXHVi0vK2O/iUhKHGT18rOW7HaLsIeeMbq+P7U6IJ
	gXdSczbwcLvk+PCRLgK2FFyjN/4A67prwQ6DD6DvUa/GaIAtBx5RBI2dU65kr0FTTPJsWQNE9k2
	FdHM+Mg40QUB03i2zU4V7L60eDJwyS2X1ggF37LmgwpY+XhGFSr5AxK19Lm4R9u55pefXEufJm5
	W6l6vvFomgScBDy8bMn0Ru49d6xl97dEVvPY=
X-Received: by 2002:ac8:5e0d:0:b0:52d:3483:ed0a with SMTP id d75a77b69052e-52e2ed154bbmr422631cf.18.1787586201976;
        Mon, 24 Aug 2026 08:43:21 -0700 (PDT)
X-Received: by 2002:ac8:5e0d:0:b0:52d:3483:ed0a with SMTP id d75a77b69052e-52e2ed154bbmr421881cf.18.1787586201366;
        Mon, 24 Aug 2026 08:43:21 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9bfcc31sm8488912f8f.17.2026.08.24.08.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 08:43:20 -0700 (PDT)
Date: Mon, 24 Aug 2026 17:43:19 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
        anup@brainfault.org, tglx@kernel.org, kevin.tian@intel.com,
        fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v4 02/21] iommufd: Add iommufd_sw_map_msi()
Message-ID: <fp5myre5qaersxxshitgoupbzkx2zwo3rsz3q5jfdiarmtwknh@gmfhz3cxuc33>
References: <yikhefui2flgfffmtbpdxemjtto2ryfmkgtlgdtmr2ndgxrw3r@rcjz523m3sw5>
 <20260821143155.GI244917@nvidia.com>
 <pzlzv2lzik4miqc5oejichltnyqabolyaezbkrufcl7nbttygm@7rdmkig3t56u>
 <20260821161256.GK244917@nvidia.com>
 <dug43layphru76sqleerwtryyerwa4a6n5s4xwrk4iyfru4o7m@al37eknignld>
 <20260821172015.GL244917@nvidia.com>
 <t2l77h22pz2jg5vsgoth6324u36szra3orgr2g2xo7olyuhzlb@53wnsyhz7aqr>
 <20260822140625.GM244917@nvidia.com>
 <r47pwpyoc4ynv57vtwer73dwikqkev5nfy7kqyba7sqzh5pryi@teiqr5a4cw4p>
 <20260824125204.GP244917@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260824125204.GP244917@nvidia.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEzMiBTYWx0ZWRfX6+t3CWlZRpPj
 H7C3lT2yA7SYUhpS4dziDdQy1Se2qrUNt6m3wLi31WblcTtpV9Qbr6hvnAhL7TN3z23GsWhKGrU
 K4DDZ1RZDtrQK18mUpW/b0qdSTQ0wMA=
X-Authority-Analysis: v=2.4 cv=Wac8rUhX c=1 sm=1 tr=0 ts=6a8c669a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=79VhuxMTkY9i6mNDBz4A:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: YMSNfqR6K_QDJpkEOV9H-0ycjy82JRx9
X-Proofpoint-GUID: YMSNfqR6K_QDJpkEOV9H-0ycjy82JRx9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEzMiBTYWx0ZWRfX26IHQuWrz8sT
 SWg7WbzzAH1InsfPU678ML/UspRnmNkdZf0UTuZAK3UNFW17gPtYyAuAiD8SV0L0j+HqqLVKTFl
 9kChFJjPopi0z6D9Z5ZgKdeGx3/7OtZo4eRNP8+xelASj2jqiTzY65Z8r/h6sP+lmeCWyAJlQEz
 PFl+kwdgyHF3yRwTOhEAG1bv90RcX6dmSydXcF5EgTwuMok7/NaFuJbpljN5FWgy0l5Ex9eim0e
 EUpDM9GlTD/G9ult2qucxS0NwKG3zCjIIlFAURNDhiNdu8mX377iWcNasQ+gv4fOuqNzMaR1fsg
 ufXlckF0pQ7Z7dH7S0tYlVR5te+0nE5USH7RtCC6ViAWbLZ2DB0D02q/QAxFAZ6Zz7uXkvedrIE
 xUhF5r8vz6VlpCC7hXUu5mZo0EZguzOsNcx/EjIKSrBwlddsFMZ2So2kCJRqHL5IN71+XYUJx5D
 WDyuigmOBhlpmlRTxKg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_084324_822974_6B778D12 
X-CRM114-Status: GOOD (  48.25  )
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

On Mon, Aug 24, 2026 at 09:52:04AM -0300, Jason Gunthorpe wrote:
> On Mon, Aug 24, 2026 at 10:50:07AM +0200, Andrew Jones wrote:
> > On Sat, Aug 22, 2026 at 11:06:25AM -0300, Jason Gunthorpe wrote:
> > > On Sat, Aug 22, 2026 at 03:50:05PM +0200, Andrew Jones wrote:
> > > > With the RISC-V IOMMU MSI table and irqbypass support in KVM, we can
> > > > write the guest's MSI messages directly to the device without
> > > > interpreting the IOVAs. 
> > > 
> > > Every architecture can work this way. Nobody has impleented Linux
> > > support for it, and if we do, it must be arch generic.
> > > 
> > > Not being able to discover the vCPU from the MSI descriptor means you
> > > can't use any of the existing less-optimal Linux flows and are forced
> > > to implement this hard thing..
> > 
> > The RISC-V irqbypass work does not require a new framework, or even
> > callback. It uses the existing irqbypass framework and implements
> > irq_set_vcpu_affinity(). Since that callback programs the IOMMU MSI table,
> > it belongs in the IOMMU irqdomain.
> 
> My point is you can't use the normal flow which relies on Linux fully
> programming the MSI-X on the host side and only uses the guest
> descriptor as input to that flow.
> 
> The iommu msi table doesn't actually help unless you can also directly
> use the guest's descriptor. Right?

I see a gap in VFIO's vector management for two-stage device assignment,
but I don't think it's as broad for RISC-V as it is for ARM. More below.

> 
> > > ARM is basically the same, the ITS page goes through the S1 and S2, so
> > > the goal is to get a valid ITS page into the S2, tell the guest to use
> > > it and create a S1 pointing at it then feed the MSI descriptor from
> > > the guest unmodified to the HW.
> > 
> > On ARM, the SMMU translates the MSI address, but the ITS performs the
> > interrupt remapping. KVM must therefore know which vITS the guest IOVA
> > selects so it can resolve that vITS's DeviceID/EventID mapping and program
> > the physical ITS with the corresponding vCPU-specific state.
> 
> Not quite..
> 
> IIRC the MSI entry itself tells which pITS page has to be used since
> they are 1:1. That tells KVM which vGIC has the vITS table so it can
> read that and get the vCPU. Now the IRQ layer has the pGIC, IRQ #, MSI
> # and vCPU. It then creates an entirely new MSI descriptor and
> programs the pITS and pMSI entry. The guest MSI descriptor is thrown
> away.
> 
> It is like this because this is how x86 does things so it is easy to
> implement.
> 
> However in idyllic ARM land it could work like RISC-V. The GIC could
> mirror the vITS table into th pITS table and apply the vCPU to pCPU
> mapping through an irq domain. Then the guest MSI descriptor would be
> used unmodified. These days x86 can be similar, if the guest has the
> iommu remapping HW it could be similarly mirrored into the physical
> remapping HW instead of reconstructing the MSI descriptors.
> 
> This has never been implemented because there are alot of missing
> generic pieces to use an unmodified guest MSI descriptor.
> 
> Now, risc-v doesn't need to mirrow TIS/remapping tables from guest to
> host, because it doesn't have such tables, but it still will need the
> rest of the generic machinery to use unmodified guest MSI descriptors.

With S1 Bare, irqbypass can fall back by restoring the host MSI message.
With guest-controlled S1, VFIO cannot silently switch back to host
delivery. We need plumbing to establish a guest-owned MSI mode, preserve
and mask the guest descriptor across the VFIO vector lifecycle, and stop
or reject the configuration if that mode cannot be maintained.

The guest descriptor itself is already available in
kvm_arch_update_irqfd_routing(), so RISC-V still does not need to
interpret or track the guest IOVA. The IOVA can be written directly to the
device (since the IOMMU MSI table is pre-populated with all vIMSIC GPAs).

> 
> > This ownership of remapping (for ARM in the ITS and for RISC-V in the
> > IOMMU) also justifies why ARM does not need an irqdomain in the IOMMU and
> > RISC-V does.
> 
> Yes, that's right, as I said earlier the irqdomain for the msi
> remapping table seems appropriate.
> 
> > The irqbypass support is already separate from this series. This series
> > only introduces the IOMMU irqdomain, which owns the IOMMU-specific MSI
> > composition now and will provide the irq_set_vcpu_affinity() hook needed
> > later. Putting the compose code in the IMSIC irqdomain now, only to move
> > it into the IOMMU irqdomain with irqbypass later, would add unnecessary
> > churn.
> 
> I'm sure you need more than irq_set_vcpu_affinity() - it still has to
> use the guest descriptor unchanged, and it still has to get the
> correct pages into the S2 at match them to the ACPI/DT description. We
> don't have any common APIs to do that, and every arch can use this
> stuff.

Indeed, irq_set_vcpu_affinity() alone will be insufficient for two-stage
guests due to the VFIO vector lifecycle concerns with guest-owned MSI
descriptors.

RISC-V does not need S2 page-table mappings for MSIs, though. The VM's
IMSIC topology identifies the vIMSIC GPAs used to populate the MSI table,
and an MSI-table match bypasses the normal S2 page table.

> 
> Without seeing the whole thing it is hard to be sure exactly what
> arrangement people are going to want to see. I'm also not sure how to
> combine the iommu MSI handling, unmodified guest MSI descriptor and
> this msiremapping all together. A guest centric flow and an normal
> host flow are very differnt in this model. This is all new.

I agree there is some new terrain to travel here. It'd be great to discuss
this at Plumber's.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
