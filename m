Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413E9C61DC2
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 08:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=usyURfVwY+9AyMT6dn9IuBw1aTbiBbokyH1vMLJpfj8=; b=AWMNV6d8Em7kye
	sND5PvOYo2DqiagIgqpTj5KxB4HZCLKGvtSA2JLhQssGE9fPZ/ae0wnD0CwWb9tuG1mq7luS6mrBV
	5TkmF6ZybpC2ESXOE36HXGVxLlD6/HifAV5J9rEMNmA/dLmTqWUGrX3UxUTEWkGjZKOVy0gPWQRqZ
	FFTqcyHI+FiUvUvsNTelASnkmVov112aESyOffJN9qNt0iHtfD9iLLRJa1oqTbBKDBA1RWOmkUdJW
	yo91UZM7BOb5njg3tH6PDjjJXIku7lYEkPkUMBVJT2zAYVKcc7x2A/Pk+mqCPTpbPHdi/3MMKQJmR
	9BLI6Z6j2WqjeISONVhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVm6-00000003gDf-41vu;
	Thu, 27 Aug 2026 08:47:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVm4-00000003gDD-3veq
	for linux-riscv@lists.infradead.org;
	Thu, 27 Aug 2026 08:47:54 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R6RCXd2074830
	for <linux-riscv@lists.infradead.org>; Thu, 27 Aug 2026 08:47:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=L6SX71fzzR7itcx4t/pTijxV
	Fm3CAO7RKTuuqSh0i70=; b=MbGNhjXmN1zqZeS/hPrCbCFJzkgAjdFDjFnDS99R
	f7IOPISYwKyUVhzbXudIN4/qCIMOTaNmezSJYoNDiLo24hYUELj7xP0Ibjlr4Wv9
	Hc7kQ2JN4Ocx7Lb4LLN/NPSWLRJe2oy7q537rNdQuEdyN5bmVU9McbSJzd+b/33i
	FMgRGWxeqFs6Kr4YHwbggNyTqq1fLK/l/0azLWqrfxOOotXSk2I8J+0j7jF6P9v4
	8DXfNZHhRmCKDRrulhC7nvjAeGSkXC6wrFuCE85CaHKUB5E963M/YFccNb6y2HV9
	ABThaIHjQxukZnWFfGUhbnrreQc/o0tX9YsxpDshUfGQww==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gaa3bhpkp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 27 Aug 2026 08:47:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d137a68so34480201cf.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Aug 2026 01:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787820471; x=1788425271; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L6SX71fzzR7itcx4t/pTijxVFm3CAO7RKTuuqSh0i70=;
        b=T0yUNyuDSXjDfIiso2AjDIM0Fx9RPlNzIAzV22+mObR6m0z+DZxwELcnUL5FVe8tmJ
         xbFZ0DEKa6rsX4Jif+l7j4wJWMGUIWJc9rjwDBMCJLG1pHvxqrI4bCj+fCJTXTdIDKSs
         p1xl2TG/pAxWKELdsNnZVjxtnZfMKoMP6Gl8niEJOZfaxhkY+v424/Kq4vpT4LLFU7xW
         2OuibEUE+jt5lK3vhU4XIvP9vNqQf6ETUVmIBzMI07HF28rQiq2XKW70fTHWUWi1YNUc
         EKJUKdhKya2A7YVpxX5OSaHNA9AUQv+687ACCDc0FKk1QKttOA5mVbFbv4+TnXQr0zWt
         7WUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787820471; x=1788425271;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L6SX71fzzR7itcx4t/pTijxVFm3CAO7RKTuuqSh0i70=;
        b=PhdvzZcFmgDSM1p9xs7ETEPagEpMubjCf8OqKFkapUC5CY5doCk1wvnS3tS3jimE1J
         ydHgks13PsoPW3uhBcTwsFCc8QdVKAofTDVhYoHRd5v8yqKHujn/Edh6h/9E5/JTkzWr
         rabl1mbdphhz4TIANVrrMc64Xs8pAgNq95R7aTM+Xx8r0GkcEgbnATQtSj068uGBQsqf
         EDnzxBuvgWZp8AyRD/YWzXp/73kvErWu7LBqv8N5MT+/PEWFaarRc8s9prNZ1oFbsmWy
         DvuZDcjYqFrxV3VJjBtdncdQ5zuna/dZ9P5kMvBzF7QAHCYqZXyXAaGEiUV/ylKuXttp
         8UAw==
X-Gm-Message-State: AFuF++l1QZQ69yWhufr8QfpHL9sfIqAX77d0Ug1uJUTHnRzKoxskKpxx
	kuGCcXo4pLyDzcqoWNUWE520qW/Q8eLkMspQRtVUbrwc3iFbzumQ+Kz9XUHbpAiXPPrjuyc5YSt
	TvSNma3x0LB24jqshqZKzkNDrZ+6XsLUReajLya7MPnfTOZmlB0MwbSMAr6eg/4eme9v1b8s=
X-Gm-Gg: AR+sD13P9kN+r4B47/RukM0rqefHS+D8WOY8w76fsyLkZz6VM2x2PlFXO4DV97pNexe
	LFZra2I45Xy1Ed1kdz3JMwqweOQeMQ2m5PpfbSK2Et+jjsT4QK4Ev2oXfOlTCWL85vqj7+tvUaK
	rGkh4c4a0GO9zcipYg/yqPESDAOcpEE8R0oeoMmkOJZs63NC8dyN2eycxjN1R5RJltG/aZBYY2w
	qomxVxJ6kmumg4xdOksup3Vg8kGC2BsdXZt4/qs0R9BfxG2W/KgmkeUtZ1KMadk7cC6uBkeU0gE
	+7AxiZEoJU11mOD0OjIUQs38TWAIxxYdreKVy0/bf2ehT2TLaUDx8vfSBu7iOcPhMaoS7biYCZv
	H0u/KIXps/JPTa+co/NRBhHva9pbfEn3G+X4=
X-Received: by 2002:ac8:5fc3:0:b0:52d:6c92:b5e1 with SMTP id d75a77b69052e-52e423e01d9mr134394861cf.27.1787820471031;
        Thu, 27 Aug 2026 01:47:51 -0700 (PDT)
X-Received: by 2002:ac8:5fc3:0:b0:52d:6c92:b5e1 with SMTP id d75a77b69052e-52e423e01d9mr134394501cf.27.1787820470600;
        Thu, 27 Aug 2026 01:47:50 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd56dfb8sm50721065e9.3.2026.08.27.01.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 01:47:48 -0700 (PDT)
Date: Thu, 27 Aug 2026 10:47:47 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
        anup@brainfault.org, tglx@kernel.org, kevin.tian@intel.com,
        fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v4 02/21] iommufd: Add iommufd_sw_map_msi()
Message-ID: <lxrej2bonrvt5ew7e6wjupcaptj7nxpesnzwvktjusawg3od2u@v3zb2bdjdilo>
References: <20260824170417.GR244917@nvidia.com>
 <3gdj54zcs5dncgom3zlntyredyuh2xe5ueg7nd4pdrcksmnwfl@k3fyky4h6556>
 <20260825140334.GA3325090@nvidia.com>
 <cxbneh42ui3gbkoqrsnoatxoec5exzbprfbgxcy4iekqmbceho@gouiwn5q5uzs>
 <20260825165209.GB3325090@nvidia.com>
 <iltwtfmgnmofsroo7eqrvjx6yhqbptwutywq65mgm7adudz7pq@2mdg3dhvtoud>
 <20260825175901.GE3325090@nvidia.com>
 <pzutriwhwe4whonj3veoo4hzxmq5tlmmyui5u6gt4bgl5wxxrg@qjsq2pvd7by3>
 <20260826163234.GN3325090@nvidia.com>
 <l3xyzbhqfremod6swwiks54znvoqy57hmqpsdlpcji5czjja4w@4qgiuwhwlie3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <l3xyzbhqfremod6swwiks54znvoqy57hmqpsdlpcji5czjja4w@4qgiuwhwlie3>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDA3MiBTYWx0ZWRfXzofNaszbPM2B
 KaCwt5gGnpinG8O11aWz+aL3r2GrTNtHD6z0KgzEy4mU90Rcf55SEhptF7PL6KUmZ3lthqdj+AN
 wMYhFrQxnQqmxBtjDbM9c6p+2fqKAhyx+33BF2i/U7+5sd1VsFJ6k0bqEOIBEuS5gnZmdEkX6cd
 gC25caIFEtgUUlzcgYQ5zS7fpiEl3atl/AkBtwIsBuHAupsw4lAKsakoRl/X8tGaXNNFaO2tUaY
 kIQmfdr+mLFpOhknCiJGQsIEUcTDENf2RGvScs6ogSMz81Kukqwsc3rBemtjOA2KsGrrlwl2C7m
 gTRgUq7FfsVwt7+o0my6ox71YidJpHV5VM/P05kglHVxAU/M8AW6l4mR9qOC6SckzXR3EaSKfgo
 8i7jxDlYiAGcpOS/EemzeE1sAEH4bTFO3cM1YlX32qrSWHmnOUz/doKobsKFPiFvOiP0rh4Jo9a
 7c64bADFHwv5Wty/w0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDA3MiBTYWx0ZWRfX6OUKOzSxnDPP
 l7tS3iGkIwVYNVHzIi2UmM1d9Ac+Md983Qjc4bnrWELCCDS93bW0HEq0jhJenS5KijrNCSB1tcw
 aOfD9kG2BGU6S+YtDn0STB3aIguy0NE=
X-Proofpoint-ORIG-GUID: GiaNOM1f7os51UqQCJCj2mzmwfJacaSP
X-Proofpoint-GUID: GiaNOM1f7os51UqQCJCj2mzmwfJacaSP
X-Authority-Analysis: v=2.4 cv=KbfidwYD c=1 sm=1 tr=0 ts=6a8ff9b7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=iiT1TCLmThQewConTdcA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608270072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_014753_095182_B0A8BC62 
X-CRM114-Status: GOOD (  24.06  )
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

On Wed, Aug 26, 2026 at 08:11:58PM +0200, Andrew Jones wrote:
> On Wed, Aug 26, 2026 at 01:32:34PM -0300, Jason Gunthorpe wrote:
> > On Wed, Aug 26, 2026 at 10:23:20AM +0200, Andrew Jones wrote:
> > > RISC-V uses the same basic model as x86 (an IOMMU-owned interrupt
> > > remapping IRQ domain). x86 makes that domain per-IOMMU because its IRTE
> > > resources belong to the IOMMU instance. RISC-V makes it per-device because
> > > its callbacks operate on the device's attached IOMMU domain and preserve
> > > that device's existing MSI parent. The IRQ callbacks provide the lifecycle
> > > hooks, even though the mappings, MSI table, and device context all remain
> > > IOMMU state.
> > 
> > The irq domain isn't per device, it is per msi table, many devices can
> > share the same table, and the VM should have a single shared table
> > across all devices. That's the core uniquely RISCV wrinkle I think.
> > 
> > IDK how Thomas would like to model this, but you will get a better
> > result if it is very clearly explained and asked.
> > 
> > I would like to keep the iommu out of it, so I prefer if IRQ code
> > patches in its MSI table pointer broadly the same way AMD does.
> > Though AMD doesn't have the restriction that remapping only works with
> > a S2 domain :(
> >
> 
> The per-device irqdomain model allows multiple devices to share the same
> S2 IOMMU domain and MSI table. Unlike AMD, however, the RISC-V remapping
> state belongs to a replaceable S2 domain rather than the physical IOMMU.
> The IRQ hierarchy must remain stable across domain changes, so a stable
> per-device irqdomain which operates on the currently attached S2 domain
> may be the closest practical equivalent. I'll explore this further while
> reworking the irqbypass series.
>

I think it should be possible to follow AMD's model more closely. I'll
create one IOMMU-owned irqdomain and install it as each device's MSI
parent at probe time, provided the device currently uses the expected
IMSIC MSI domain, which will be the IOMMU irqdomain's parent. The
irqdomain will contain no per-device or MSI-table state and its callbacks
can recover the device and operate on its currently attached S2 domain.
This is better than the per-device irqdomain since sharing it avoids
redundant domains.

I'll give that a go for the next posting of the irqbypass series, based on
v5 of this host-remapping series. v5 itself will not introduce an IOMMU
irqdomain.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
