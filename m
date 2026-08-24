Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4157C5DF94
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 08:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pfhRzUO3psfLEyfiX/72ou1FpSvuYeSdi1KM9SHaw58=; b=PezQuo1oL9sjTR
	n2UpstZC210AzDyUddaBO/0D05R+zJGbQK8jQaGnucKfI5iMRLxTlTpdO0xAExdqSmSu1Ha2unUWX
	RVaxTpurap9RtIVa+SDdUUPPgogpb3AdrTiG95D7N2Fg4cKbmLGGfdSk5Qb8A4jlP5S/Za5zo4o8K
	FHB4lkV3nQINbIfeFU+wqZj86exMRhqRYi6zdOmEpP547yB9u8xJ53GZD5yodtbsGanrkiyZ19l6W
	nllJ3l8TJY7CXqalU+WtO3vkxQFCBQWrUphwioByx5xR1n5H/566zEs8U+3vl/+WEQ7uJYbFRd/XZ
	X7OR5ax6YwHXWwyvmbfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQNl-0000000GEO1-3X2M;
	Mon, 24 Aug 2026 08:50:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQNk-0000000GENY-0Fxh
	for linux-riscv@lists.infradead.org;
	Mon, 24 Aug 2026 08:50:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O5R8XN2041417
	for <linux-riscv@lists.infradead.org>; Mon, 24 Aug 2026 08:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+4gKgrnxjNoIWkSGUuG04M4x
	7jQgXnRYwDNE0RxA+Ps=; b=HbHc3tXRp3zjS579RDThqdJ88jgrktxjgLtUhnA2
	dPzVudGHnc7d7/zZsI37ijMeWBxWTV8XZBIY7FtCsLok+qHbdTclDxvyL6NUo2rh
	b/HA9T+u/WYnSWcWT9rrFTm7B0OyoWqCyrz0BVJ/blSTmFVpW33bqxEh95NHH0Sy
	K0vifXlm+uSW4Y5pWPFawyIHrBgiX397qo8fam67jyMSsX1YjfXHJuBHd02EI5id
	X6TvVZNHmEpGTosYzABKWqjCAsntRoB0f3j7rRZJPb9fOCsr+4wMirW8k3Qz2KsZ
	NqwT6seDNSZzmZJJi67nEEwtFQdQ9nQn1KU2ntRGydespg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88k7hr33-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 24 Aug 2026 08:50:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52d7b3adda4so33237111cf.3
        for <linux-riscv@lists.infradead.org>; Mon, 24 Aug 2026 01:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787561411; x=1788166211; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+4gKgrnxjNoIWkSGUuG04M4x7jQgXnRYwDNE0RxA+Ps=;
        b=AvdAaFx/P5TRQR/SFjREHdBKR0+JMo6syIijNtaTeCkrsOkPAHQnAW92BfUUmyz4xF
         OTNAMlVJ4udoF+TppSZH4AtwKU9gCZD67P9Hfz5EFmQcsK9649SoOWtJ6dij0cVKsiUu
         nzuZKfBqXxC/PnZq5UxVVYGI/pctUfKfUIFQq7l78Nn/DcpgQvcT+kudsQ2K5qDpQ81L
         F6OBb+vzIbrjxFitpN3cw25ViQejvO/wBxPKTMsGmKMIpxv2S1QiSwbO0x08qpJh07ET
         ITteiz+voSRRAV3x6WBQJ0mGQ7OdhU+VTxpp9IB1hBJ3sBE/tZof8aKVCSjsGS2FgRyq
         InVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787561411; x=1788166211;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+4gKgrnxjNoIWkSGUuG04M4x7jQgXnRYwDNE0RxA+Ps=;
        b=kxixqJYeNfTKRyI8BwMYQdJ0tgJe1ys0suOgOAVQgzE/xbyepxt9wO3XrU6EOJqMbg
         GVGUH/6xY1gEaX3uky5e/xVm1Lu3N/NtGAGRWk6A8lpTZQuTBuWMMlZrZ796ZKiBazIV
         0+nTBZKQWPndtwbDaRjIDBED4hx685LUVvBZhR0CvPMPSTgry4HWod5BPQtdgdVCWwfh
         F40zYUBLMAy6Id8ioqCuBXZr0B5XsyLO0zfM0imYCWeMHrLywOPb6g8Jxi3EA5p8YhdX
         hlDnsusdPeZfgU6ShkZgytd6Sufy3SO3feBxBJaob8O5TIADWLRj2b2zs95CaSgXQwwa
         lF2w==
X-Gm-Message-State: AFuF++m1QKGGX9V4APJIC8Yvbf5mQiE6d2l10HPaPVvtOgTCSVax4LTd
	mfkUL23Ndjlco0svRWtBRxzPbWN3zGtY3+qwCuZHmVHtvjU//2Yoeqfjt3RBPu61KS05Kor8a/F
	+EnV8ktN3gWP+y8j566opfK5fJrtgJM6f+X7j4JVXJX5looVKlChglkKSc4PEOWrQvA0xr5M=
X-Gm-Gg: AR+sD128h4GyhAvCrM6/0bOq8BGtKfiqnozCG0QqpnaCtdxqQ0TDe67Gvdrrq+m9kD3
	44Rqpy4JuT6sah38Vkex9mDyVFQ3dXX7M4O6mQiTNGz1SmRKBvXziWBhpVy8157PVfrE49WvnN5
	uRIsQhV2eCz7h5zIUPAdWAEJuRRRxAsQxMwwt8WdzWiiZB6s4SLXBaidq+qMReXn5nIwg2v6gyQ
	jtx8YvwvWqj+ZbLtz9MQFJyjbkq1cF64cS8NYWI2TbatKkXD9TRsnB6nQe3CEvyRpjnJcp6GYsM
	Wsg8AhWOLMFTKUvJJAyT9c/ICOnkcAhGhLce4vjHVv5xAVkkz4zgTCkD0kV6/MaziY1snFh90Jl
	cK68I/staLOZHlxxdQZoIj5eA0MJpMsXnbFo=
X-Received: by 2002:a05:622a:4d8d:b0:527:7813:a439 with SMTP id d75a77b69052e-52df5a09808mr275658631cf.27.1787561411232;
        Mon, 24 Aug 2026 01:50:11 -0700 (PDT)
X-Received: by 2002:a05:622a:4d8d:b0:527:7813:a439 with SMTP id d75a77b69052e-52df5a09808mr275658531cf.27.1787561410762;
        Mon, 24 Aug 2026 01:50:10 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499bf9efa89sm59322725e9.4.2026.08.24.01.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 01:50:09 -0700 (PDT)
Date: Mon, 24 Aug 2026 10:50:07 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
        anup@brainfault.org, tglx@kernel.org, kevin.tian@intel.com,
        fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v4 02/21] iommufd: Add iommufd_sw_map_msi()
Message-ID: <r47pwpyoc4ynv57vtwer73dwikqkev5nfy7kqyba7sqzh5pryi@teiqr5a4cw4p>
References: <zygm4qm3fjv57nsgcectwikfa3cdnidxnhv55nxv4b6l2kllrs@dt36j4p3zhoa>
 <20260821140033.GH244917@nvidia.com>
 <yikhefui2flgfffmtbpdxemjtto2ryfmkgtlgdtmr2ndgxrw3r@rcjz523m3sw5>
 <20260821143155.GI244917@nvidia.com>
 <pzlzv2lzik4miqc5oejichltnyqabolyaezbkrufcl7nbttygm@7rdmkig3t56u>
 <20260821161256.GK244917@nvidia.com>
 <dug43layphru76sqleerwtryyerwa4a6n5s4xwrk4iyfru4o7m@al37eknignld>
 <20260821172015.GL244917@nvidia.com>
 <t2l77h22pz2jg5vsgoth6324u36szra3orgr2g2xo7olyuhzlb@53wnsyhz7aqr>
 <20260822140625.GM244917@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260822140625.GM244917@nvidia.com>
X-Authority-Analysis: v=2.4 cv=b4iCJNGx c=1 sm=1 tr=0 ts=6a8c05c4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=DL6v956EkLcqk1V5DJcA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3NyBTYWx0ZWRfX519wh/aqqcjN
 oSdFzXI0NQVBBI86hHcZGxsHKxE1k2NNxOMCUotbq3fOtBxzfVuUe6KKvRCwLvmUK4MbsNSD2ja
 Vc9jfW/RjWclBQHI7wNQXftVBQ0gUM4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3NyBTYWx0ZWRfX6RQ/+lzKT0Hs
 qNfEkB6lXDppE/Q4omdq1zgxyfH5aifQwGbjAcsJyD35hfuPcLVRGs6ljYS9d3SUEXUEbKknZuN
 u4+eFv9nz5og6gOVkDdBdIk30E9iaQv2I0hZoaR/40LPEL3DIcq7fmXJ80otap3MABPvo0gsgjY
 Bk0NN+xKY69exbXSDRAJ8secdwZKRrP0HvOAHTGY5TsvLNQW7THYmo/SFC4hijD6WJo8aTdbQ2A
 0qvqsy9pDH4POV4uaY92rBPicjtmM8eQAW+eW5pNGLeYAkS8MP3yALpmjmGRxTMs3/iWTfaV3m/
 B0GGZa1hja1obztYBH75BZ+NKFluNG7wd85WEr39w1StT9ZakkYSiFAP0Kv64V/ZQhptMylFhZR
 tE4SooMtr8Sa37FkVEesaCRUb2cyus1HJL5Y2YWUHzVSJO9ln/DezbyOL/Oe+Q1+VVdKXg7OZXi
 UHI5liakvFWt6uULMPg==
X-Proofpoint-ORIG-GUID: yuomCc6lE9dM2qNxBpfkHQdNnyHpngXf
X-Proofpoint-GUID: yuomCc6lE9dM2qNxBpfkHQdNnyHpngXf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_015016_134122_C8465808 
X-CRM114-Status: GOOD (  40.87  )
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

On Sat, Aug 22, 2026 at 11:06:25AM -0300, Jason Gunthorpe wrote:
> On Sat, Aug 22, 2026 at 03:50:05PM +0200, Andrew Jones wrote:
> > With the RISC-V IOMMU MSI table and irqbypass support in KVM, we can
> > write the guest's MSI messages directly to the device without
> > interpreting the IOVAs. 
> 
> Every architecture can work this way. Nobody has impleented Linux
> support for it, and if we do, it must be arch generic.
> 
> Not being able to discover the vCPU from the MSI descriptor means you
> can't use any of the existing less-optimal Linux flows and are forced
> to implement this hard thing..

The RISC-V irqbypass work does not require a new framework, or even
callback. It uses the existing irqbypass framework and implements
irq_set_vcpu_affinity(). Since that callback programs the IOMMU MSI table,
it belongs in the IOMMU irqdomain.

> 
> > Guest changes to S1 or IRQ affinity therefore do not require MSI table
> > updates. And, when a vCPU moves to another pCPU, or switches between a
> > VS-file and an MRIF, the hypervisor only updates the MSI table entry for
> > that vIMSIC GPA. The device message and S1 mapping are unaffected.
> 
> I'm not sure how you will end up controlling the msi table..

Through irq_set_vcpu_affinity()

> 
> > As I understand it, Nicolin's series addresses the ARM split between
> > SMMU translation and ITS interrupt remapping. 
> 
> ARM is basically the same, the ITS page goes through the S1 and S2, so
> the goal is to get a valid ITS page into the S2, tell the guest to use
> it and create a S1 pointing at it then feed the MSI descriptor from
> the guest unmodified to the HW.

On ARM, the SMMU translates the MSI address, but the ITS performs the
interrupt remapping. KVM must therefore know which vITS the guest IOVA
selects so it can resolve that vITS's DeviceID/EventID mapping and program
the physical ITS with the corresponding vCPU-specific state.

RISC-V has no equivalent ITS state. An IMSIC at msi.addr simply receives
msi.data. If every vIMSIC GPA is mapped in the MSI table, the guest IOVA
can remain opaque. S1 selects the vIMSIC GPA and that GPA selects the
correct MSI PTE, without ever deriving a vCPU, or having ever derived a
vCPU or any other per-IRQ state, from the guest IOVA.

This ownership of remapping (for ARM in the ITS and for RISC-V in the
IOMMU) also justifies why ARM does not need an irqdomain in the IOMMU and
RISC-V does.

> 
> Exactly the same as what you want.
> 
> > The guest-selected IOVA must be preserved for S1 while ITS routing
> > is managed separately.  RISC-V performs MSI remapping in the IOMMU
> > after S1, so guest MSI target changes do not require corresponding
> > per-vector coordination with a separate interrupt controller.
> 
> In ARM you'd manage vCPU mapping in the GIC since it is already doing
> translation lookups, this happens without involving the iommu. It
> doesn't need to change the descriptor to do this.
> 
> But conceptually it is the same thing, there is a part along the MSI
> chain that maps from vCPU to pCPU. Either in the GIC HW tables or in
> the IOMMU MSI tables, doesn't matter much, IMHO.

ARM needs the VMM/KVM to track gIOVA-to-vITS mappings so it can program
the physical ITS correctly. RISC-V does not.

> 
> I think the two x86's also have a very similar thing where the iommu
> interrupt remapping tables can do the vCPU to pCPU translation.
> 
> Again nobody has built this and if we do it must somehow be able to
> work generically for all arches, so it will take a while to get it
> sorted out I think. Since riscv's HW design boxed themselves into
> doing all this work I guess you have no choice.
> 
> I strongly recommend you keep it seperate from this initial series
> (And remove the irq domains from this series) and come with a proposal
> that everyone can understand how an arch could hook into all of this
> machinery.

The irqbypass support is already separate from this series. This series
only introduces the IOMMU irqdomain, which owns the IOMMU-specific MSI
composition now and will provide the irq_set_vcpu_affinity() hook needed
later. Putting the compose code in the IMSIC irqdomain now, only to move
it into the IOMMU irqdomain with irqbypass later, would add unnecessary
churn.

The design itself is not especially complex. Most of the current
implementation complexity (locks, RCU, deferred MSI-domain attachment,
etc.) came from maintaining msi_iova[]. Dropping that cache in v5 removes
it.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
