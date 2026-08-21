Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB56BC5DF94
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 15:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mTCo9d9TcfzFqNOrhdRhDs9jytzb4X4ReOmUCrv5TPw=; b=bskQa0cmtfmBnB
	kwFBxDaKLpHnCRvR0n+Ae/SG7jf4JN5KEaxm47rMryIlw67jiigDh1+fzpAmqBM0T8UYEtA/Db+7l
	6xVfIHfZmBMG6iaaYuZG6jU4x/eSVgslFh1xZgMW7BbFA9f28+vdqTZJmusryn0ohjqL2kCXcYrtm
	I5Euo3Nar8VHJQm4yLOB6rPCzzzeMaHgNLqceKXU8K5Vrb/zsAsj60Vu9+h4JyHtlxB4QzACwdhbc
	NMDnDTA+mok7x9ijiBLKBd1c7ozIN+KOMrj18qMRnAYMslzGY6PaI6nqo21cbTn4lLyhsya/98SUR
	a2r60P16qRG1QdSRn5/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxR1J-0000000DeUY-1PV0;
	Fri, 21 Aug 2026 15:19:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxR1G-0000000DeTq-0UkI
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 15:18:59 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCoaDb2444194
	for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 15:18:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dX/zSjwf1mxvq4qpG3WDBnh6
	qmE58SGcbyhO+4DSQYo=; b=RwjqUrnQ/zSpRVcyGNE2iEgU1JMemav3ODErmA1b
	BjTI50UtlNlZWCy6bDlHTyh8FVQXs6f93FCbNXe77N4Vj4IUaHp/6/0je55qTrTt
	smAhAYo86lObVei53/KSChOVtgYcvKkOoQnrPR/eSYfbNGIWimG4yI+jzeHUbt1b
	ZhrAmSh0X7sNbSZgzMOsZHvI7LrVyjpLtk5NdvYmOqyyedrgqdjRvVdgWzeZoJn+
	47J8C6Li3MIasSZ+hP2lMXqAxC56F6Bqu0z4u9Pv9vdd49zw7ckw2lM/BA/CJPL0
	tMlM5wuKQUVJeuLXz8QwuoYbK7NL+NT6rxx42i36MbBgkA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6cdsjyhu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 15:18:57 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52de40127adso13128391cf.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 08:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787325532; x=1787930332; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dX/zSjwf1mxvq4qpG3WDBnh6qmE58SGcbyhO+4DSQYo=;
        b=a4owrsW5VpTcCL0G8YLMn1Ivy6NC7E9/WdA7AG0+f5CJ+6x6xryOIb3reRRwc9FdMl
         zsAxp08QijTPDq3jNKW438UXLz6Rra7HbCc2Q6rPRPN2vRkAqaOKjDlo/+r0oIPLDdVo
         jHxJoe6KbPD8JtD9NQZ5JEf38b2HLuB2an59ufSv5UlQJOqf2YY6iVFZgl/6e9MIv1Mo
         mlJvxGkf0lwiL/F4aAaYSlCzAwX++wV+9cP99CC3UqG/vssaw1OsvhAk4jrq8QYHb6+P
         1GFMxZSNNgLPHYSFINMLM5k8GO8HOgkfvpkW+X3rcaFiciKsrQ1+KGZIS+I0cZhnQSeN
         0AFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787325532; x=1787930332;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dX/zSjwf1mxvq4qpG3WDBnh6qmE58SGcbyhO+4DSQYo=;
        b=XxYyX7Xznf96AakH4/s850EHMEHJ3U5axLr9hwR9tkehDnsMUChIC9GLRb589EKoLD
         pGy7R600T/pUDpPigGBV9cAKTPNOPwx5JKLhtoD4EdjJoU3nYYV+MuTj/EKR+8yL8l6V
         froPcQf/GIANMC9kRlnEbcIeD76QbgFkVLvYGu7aL9ohhDYBV5Lx+7osiYCWCb6AXJRv
         3FbxrtRJmp65bmPXcf6/FLH959dza5STLyNdQxCLTF/8NekibvTMLZY0wQcdXwyCGs0N
         RkyTzq+GyKlPTeIzah5xTdB7Zlzp/vYVFmJ1uH/acDT3NOzEV8QVWu0dyrAoLQHAb+eQ
         d4Zg==
X-Gm-Message-State: AOJu0YyhO6hJ6w9/b/Zti5OZbL9bH9jDKgRSWeTkdAao5L2MhWFayXZN
	lzBigGWMJGJFTjzWlhlV8wBGm0Ccnvu5gqSR8t1TUL5iSSaUlHn1gFNvOSbggnltndTNEeJGL2I
	Q3iyO26VlFBv1Ek96dd3UPtBayJ1azMNqRGEy/bbEP1mOowxeHGydKSPpwv3HcFt65gmSJaqUWY
	N7vDE=
X-Gm-Gg: AR+sD12v0io3x2A0sRVcjipCbjgiyRMSJhQFVUab+xRAywfAYjoTFiwIDLuDVDS2C9N
	yDgtNcFN6a1DX3nYd/0p11H3MgGkZ8iOLBq2+6Z0Zt5nJ5j6q8nq6vCFANaBImlkUa9i3atCTaq
	RsJoRaNdV5Xa2r61mGs+9c47/rUdWPeVxB8xRcPIPRAKt31ccaWHfer+dofMTUTZcD3/JiYbWpn
	zt605cW5gTJbyt64TfxvA+3I13azY/OcHPEKCeYH4+ETvxrHktjf+Xr6LgjcxoVUf/HcaJwPItA
	cONbqsvtD7dp5ShFRKNklqGQTenixlsbc+WP+sw8a/4PljJjzXVzWOdQsFv0Jof35NDyAZBkpOx
	HTnO+6qkN89uXqTxEGg2UKyS4AkHwMMNQicY=
X-Received: by 2002:a05:622a:5c14:b0:516:e0eb:d7d with SMTP id d75a77b69052e-52df59aa83cmr65609341cf.27.1787325532347;
        Fri, 21 Aug 2026 08:18:52 -0700 (PDT)
X-Received: by 2002:a05:622a:5c14:b0:516:e0eb:d7d with SMTP id d75a77b69052e-52df59aa83cmr65608701cf.27.1787325531786;
        Fri, 21 Aug 2026 08:18:51 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499ba31efadsm26839395e9.3.2026.08.21.08.18.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 08:18:50 -0700 (PDT)
Date: Fri, 21 Aug 2026 17:18:49 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
        anup@brainfault.org, tglx@kernel.org, kevin.tian@intel.com,
        fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v4 02/21] iommufd: Add iommufd_sw_map_msi()
Message-ID: <pzlzv2lzik4miqc5oejichltnyqabolyaezbkrufcl7nbttygm@7rdmkig3t56u>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
 <20260820214150.545737-3-andrew.jones@oss.qualcomm.com>
 <20260820220908.GE244917@nvidia.com>
 <gr2h3ktgacozyo7rdggkxsg5mbdtzcnimaawd24c37hnf2tun3@hqivsenaq5wd>
 <20260821120204.GF244917@nvidia.com>
 <zygm4qm3fjv57nsgcectwikfa3cdnidxnhv55nxv4b6l2kllrs@dt36j4p3zhoa>
 <20260821140033.GH244917@nvidia.com>
 <yikhefui2flgfffmtbpdxemjtto2ryfmkgtlgdtmr2ndgxrw3r@rcjz523m3sw5>
 <20260821143155.GI244917@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260821143155.GI244917@nvidia.com>
X-Proofpoint-ORIG-GUID: -5dPhukt5kmbh2Lmz1soxsrBp07BErus
X-Proofpoint-GUID: -5dPhukt5kmbh2Lmz1soxsrBp07BErus
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDExOSBTYWx0ZWRfX9D74bktsDdX+
 pY88mtogmIRVJPyvSeA5cjhe4BVbWthqvV9I5xnI82furAUAXO3MO08oSwd/vkQHD1OQQsHzNYH
 ks9NDO0qQTMPkr9PPtUMBkD13bo97Do=
X-Authority-Analysis: v=2.4 cv=RN2D2Yi+ c=1 sm=1 tr=0 ts=6a886c61 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=2SkywTcMJH5Hle4V2y0A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDExOSBTYWx0ZWRfXwn6zckSB3R3O
 yCXG8752PFfJljKwKUYmyA7n2M8laXteI3MXCAGgvSVBEDaXpn8wDQXm58O0/h4xXBaMc7xkVca
 UwX34SIYfSWEo15b+nzy21OuVghnch6KmAzrUPW4lseMEgXfSnWKtXxLNyRMeyW15AUmGPlDCEd
 AEFEfHouteDcVh70AhzynFFJuBejMvBTPBSZ5FCj1/RNeABW55d813bgGlRenIOlcSHT9BiJy87
 ZihhxPGj0a0Xf4pRy7aLresgjUXDr/ihGtS3Y19/Py4ai5zwFG5mZRv2KztEI2zeCKd69Bfa4E4
 2M/PbNMGCTxdJ3aRniWpZSQPpoBmnWotMkf2Mzc8MXssNBPNlildRCDBBSncwvL5AMuSPQed2r4
 AflPu5c9nFAJlQZlxIAok3XBqQYyeAO72SZpdxZ7rxQFgnbRxYJ84dxh5m2cAnTRE8KzMGArDhp
 gMifg4tRrX5BF5Nmrpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_04,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_081858_537053_B8F5154D 
X-CRM114-Status: GOOD (  29.31  )
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

On Fri, Aug 21, 2026 at 11:31:55AM -0300, Jason Gunthorpe wrote:
> On Fri, Aug 21, 2026 at 04:23:22PM +0200, Andrew Jones wrote:
> > > But RISC-V IOMMU is also not involved in interrupt translation. Beyond
> > > it could remap the PAs which represent the CPUs, but you are not using
> > > it that way since it is statically setup.
> > > 
> > > So I'm not sure why the iommu gets an IR? Isn't it the same as ARM
> > > where the IMSIC itself just has a wack of PAs it needs to access so it
> > > calls iommu_dma_prepare_msi() to do it?
> > 
> > Right, this series is only remapping IMSIC PAs, not using the IOMMU MSI
> > table. The MSI table must be disabled when second-stage translation is
> > Bare, so it cannot be used for the host mappings here. It will be needed
> > for guest interrupt files (the irqbypass series I'm also working on),
> > where this IR irqdomain can then intercept irq_set_vcpu_affinity().
> > Also, keeping the MSI setup in this IR irqdomain avoids putting IOMMU
> > mapping knowledge in the IMSIC driver.
> 
> It's ok for the IMSIC driver to call iommu_dma_prepare_msi(), that's
> the architecutre of this at least.
> 
> Until you get to adding something more complicated, eg irqbypass, I'd
> suggest keeping this series simple.
> 
> I guess I would wonder why the IOMMU needs to be involved in changing
> the mapping down the road, why not just reprogram the MSI-X address?
>

For guest interrupts the MSI-X address is a guest IMSIC address.
Reprogramming it handles a guest reroute, but not vcpu migration (the
guest address stays the same while its host backing moves between
guest interrupt files and MRIFs). The IOMMU driver updates that mapping
through "the hypervisor to IOMMU driver interface", a.k.a. the IRQ
domain's irq_set_vcpu_affinity() callback. That mapping cannot be
prepared ahead of time because only the hypervisor knows the target,
and it may change later.

Since I know I'll need an IRQ domain in the IOMMU driver for
irq_set_vcpu_affinity(), I'd prefer to keep it in this series too.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
