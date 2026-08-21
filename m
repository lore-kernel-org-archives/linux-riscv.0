Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A596EC5DF7D
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 11:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wfelT6nANAWlLn4TQVBVaE4sJL3XDzp7kmPxV2dpmqE=; b=O5BX2L3o4OZX91
	WeWLFniv2zz/PYnDlAJHKvbjnY3t0naz5EFXrjL7AZZSdfKAfy8E4DAResOW50DE9SSpPi5rpg8VK
	MDsPKLaC0efAOnA2vlc3qQTWGKRLdjFWchuf3rXc6TNhAVqO6sKoPJK5euWiEI+7DFOguBRiSXnRN
	ml35Qun1O5GQSBaevJTRfWU6/n496m0euNpPYkQw390rd6j4/Sz8L76i4ocnTTHho78+9vHob8Yk8
	mOWTHgOyNreboCLryeZOt3RjtLQZDwm7J6QIRA2Ck4xDYPz7c1p7xyXVLLpsSGhFdV9VeBeyC1I34
	WampSmylWa/r1nO4nqAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxN5a-0000000D9EN-25Se;
	Fri, 21 Aug 2026 11:07:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxN5X-0000000D9Dn-3vjw
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 11:07:09 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9Lhk01983011
	for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 11:07:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WCXwjdZu+PJCSyd21HPUi/ll
	3y7SJUQce3V2hZyDk1E=; b=oLKC5uXmzu5gaTuxOxwsx39YRklU9Xw0bnHXEvsL
	KPodcXn28i40xoPRlPC2HQDym1udGbkVONlnUWUYLW7oSwXjc1Vennkz7RuWpTgA
	A93al6xIdpDym8Lhi4JbMUfW+pCpYVxcxq7xTWDlKanFXfG3sIdn4fuWD045V/W3
	2htTNYpmQIWk7C+AMd5AZ4kPVZILA0PcDEjyfRCZZY8EKQbefpNyenNY+O0+7r9q
	b9Y5uHDhk6dBx7oadbon0+DYvlVL/dGb7qrzymTkn3gsw96Tjlkdwi9LhnvL3+S3
	XVhGPK0t0vNQstpy410bU8IwC8V54zngE7fql0nljj1vrg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6cdshyuw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 11:07:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936d067836eso87404885a.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 04:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787310426; x=1787915226; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WCXwjdZu+PJCSyd21HPUi/ll3y7SJUQce3V2hZyDk1E=;
        b=BGJybcZy1y+iuZDxwO/BX70DzBEn8sGoDYeeJrpzii1MInvJUVpErICFHFAc6fHvmY
         urgaS+AfFWfAH5bp/cFCGlJ1fNFfg/tao5o4YOGPVdcGRDSlqR6Dv3RydMDpuftHwxjY
         lkC4GhyJPB7atmBmP6ooziw5H0cotAIqq1hzyW4WbVKiUpHKlO/fj9vC68uY9DVvVwGV
         2ELEWQKEjxrxvguo6i5p0hhQnbElIaTraaSDhtSP3n1Ksd7PdQXEaNmI80p6v8IEKjuG
         zxYEfy7hILV8gPdYUNLFKi47O2SA08sDurN5ypG6qymzmo+lur3MJLQfyleksRUeboMz
         CJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787310426; x=1787915226;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WCXwjdZu+PJCSyd21HPUi/ll3y7SJUQce3V2hZyDk1E=;
        b=CBKKGmy0v57WyaG3NNwKc3EcckO2CbFxzLB2Bk37Z0Xfe2V36iogFwWDsvbWFJUSpo
         XRiD3CPjWqx3TB3dZS/S/mv6uPiWTbCESXuNOJa1Bbeye5NKNyBWadCeIfXKzxNfaZBg
         LYWDq8p/xrFxTKArCJDBB4/9eYDYjV0RXmxjg74qNonhkPJdIy55aBRYt76VMrR3X+nn
         zAfBNpl7LM9jh7Aeh8eoVxYcrsQcEGLRMf6kxv4Ia+mkcfyChi6eu8fHOdX6YCs8syaH
         vQOgdkiz4p9FjUz0z7u0Lsak6LpniU81mi/FGOh60lQy3NucOHqdMPIW1zn+vuiC7KF8
         vaRw==
X-Gm-Message-State: AOJu0Ywsqy+qB7RwJktBGyreeV/8nEFrXwy9LAQQPXrtsl/NkrqhTUIz
	h6Dw2Q9RYPfIkzobphuib5F2wJ8MHIuakXC4cb6cb2ihGA6nBJehZkdYEH2a21wPNeSBEXy/jsT
	TRuDV4nuu4/wDpUYHyYECW2x5NyIIHUWiHtikrD1c9oIOSPpAnepOUaP7QdqGRBCnWb5Z8kI=
X-Gm-Gg: AR+sD13NjUpxYqbwdE2qxAGOstg5c3Wqxa/JGq2faZoX2IK2c/qfwdfmwthHnFHH7Ud
	qNrg6ELZ2YtyeksW5qvvkp7sca6MdDllUgc8lDOp/aBdEIkV/NOiOjMN4p80f6fjFGlKSUpU7mQ
	XPm85G56lgaKo+zLPqhZDT512UH2rm4VKVt3wVSdEXzYcCB/Jz1Vr92l4RurGEZa12MYjGMYc0I
	by0U7gtdX2ZWxgOo2xhBSUijaq9niMC51Puz6HXdz79QMajs7JMMtcPglW2T5gKQG9Ylmj/cHMo
	IK9NUZd+8njFstB8cJbNDSN4yB1G4cRwi1Jpi5UKVgieUMouY8nP2vyUTa7P5YgoPjNlJGZK05/
	6xfDgC/k6C0uf4oZrxukdMgJOkLwslMzqTJY=
X-Received: by 2002:a05:620a:72a8:b0:914:bb06:288 with SMTP id af79cd13be357-9373960c63bmr382585685a.22.1787310426250;
        Fri, 21 Aug 2026 04:07:06 -0700 (PDT)
X-Received: by 2002:a05:620a:72a8:b0:914:bb06:288 with SMTP id af79cd13be357-9373960c63bmr382576885a.22.1787310425757;
        Fri, 21 Aug 2026 04:07:05 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b9a949f4sm11983695e9.0.2026.08.21.04.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:07:04 -0700 (PDT)
Date: Fri, 21 Aug 2026 13:07:03 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
        anup@brainfault.org, tglx@kernel.org, kevin.tian@intel.com,
        fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v4 02/21] iommufd: Add iommufd_sw_map_msi()
Message-ID: <gr2h3ktgacozyo7rdggkxsg5mbdtzcnimaawd24c37hnf2tun3@hqivsenaq5wd>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
 <20260820214150.545737-3-andrew.jones@oss.qualcomm.com>
 <20260820220908.GE244917@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260820220908.GE244917@nvidia.com>
X-Proofpoint-ORIG-GUID: 83_GBsdYnvDJFlQAJkmhbkVkIJ5KhTrD
X-Proofpoint-GUID: 83_GBsdYnvDJFlQAJkmhbkVkIJ5KhTrD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4NCBTYWx0ZWRfX7uDuiGEKjI5O
 Qvnlr1iTA8HoR3EtRpWYj/yeTlaM+SZRNSgSkBlbrT5l4+b3fTUfk/28Yfl55njbIoP4/Ys2gC8
 MxXB6uIrnHLPyRdqc5ULqNwEIDbW72E=
X-Authority-Analysis: v=2.4 cv=RN2D2Yi+ c=1 sm=1 tr=0 ts=6a88315b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=w2L93CZGMa0q8yLUHy0A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4NCBTYWx0ZWRfXwNsUt9qQTk3P
 hMjk4TMkUwVYspUSeH6HMr/7JL+slY69OA5WfxMl72lu7yfJeVEiNAJVxit/fc4QBBzMMRcJds8
 PD+DfmZZjXRwbbq97LhJMWi5nkwzqx6RsM68Bfu8UteOqIKraRVJlijrH7rTdXzvR+CUdMngiTP
 LgEK7tOpIGKsi3o8picdssJUoZgw2SBe7O0vJyFIMKXbpsTaO+0tCUsZBWYF4S1j+4AGfEw2VIK
 ZpeBoPtEYYyVolBzCT2j3KXYkC9J4012Bm7ziCzxlfxku9+jZQKTD3Th+XP0gvgwhRhjmo/Mb9G
 sKSeLGzZsiBc4nqkcUhcHRFVIrQhdhvsmqaFSPExZKKWrtyfVSMCXVqv+mTiLnadx4s+VNAQGI7
 hAomz2BNms26kerjDfQtXtj3yJIxz08bEDd/1KK+uKiocl1EIPyIUlfDDwUnv7EUl3qDuywOQYu
 n7gPkK8CNCox9chqKzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_040707_983351_F168DFF7 
X-CRM114-Status: GOOD (  31.76  )
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

Hi Jason,

On Thu, Aug 20, 2026 at 07:09:08PM -0300, Jason Gunthorpe wrote:
> On Thu, Aug 20, 2026 at 11:41:31PM +0200, Andrew Jones wrote:
> > Add a descriptor-free counterpart to iommufd_sw_msi(). The existing
> > function is tied to a struct msi_desc and stores the result in the
> > descriptor. This variant returns the IOVA directly so callers can
> > pre-map MSI targets before any descriptor has been allocated.
> 
> I haven't grasped why it is like this?
> 
> The cover letter says:
> 
>   ARM can map a fixed doorbell PA per ITS and cache its IOVA on the
>   descriptor because affinity changes only hardware routing, not the
>   composed address. An IMSIC target PA changes with affinity, and MSI
>   composition may run in atomic context, so mapping the selected target on
>   demand is not an option. This series pre-maps the supervisor IMSIC page
>   for every possible CPU into a domain-local PA-to-IOVA table when remapped
>   IRQs are first allocated, allowing composition to select the target with
>   an O(1) lookup. If iommufd replaces a paging domain while IRQs remain
>   allocated, the incoming domain's table is rebuilt before it is attached.
> 
> There are a few confusiong things with this statement:
>  1) Okay the IMSIC PA changes dynamically but since it can be
>     premapped the PAs required is fixed and known. ARM doesn't change
>     the PA dynamically?

ARM's PA is fixed. On affinity change it uses MOVI to instruct the ITS to
change the routing.

>  2) Why do you say mapping on demand is not possible? ARM's
>     iommu_dma_prepare_msi() is not called in an atomic context and
>     does do the iommu mapping.

By "on demand" I mean after IRQ allocation, when selecting a new MSI
target may occur in atomic context. Mapping then is not possible. Like ARM,
this riscv implementation performs all mappings at alloc-irqs time.

> 
> What I rather expected was for riscv to have a PA window that is very
> big and not just one page, eg adjust iommu_dma_prepare_msi() so you
> can pass in the entire PA space that you need for the affinity
> changes. Maybe this is a list of phys_addr_t ?

That's more or less what this series does. There's no big PA window
because the IMSIC PAs aren't generally contiguous. iommu_dma_map_msi()
factors the mapping operation out of iommu_dma_prepare_msi() and returns
each IOVA directly. A batched list API would be possible, but it would
only move the loop.

> 
> Then keep with the ARM flow where everything happens at the same
> times as today. Instead of just mapping one page you map the entire
> list.

The goal of this approach was to match ARM's flow as much as possible
despite the quite different architecture. Here's a table showing how
they match up now.

.------------------------------------------------------------------------------.
| IRQ lifecycle phase | ARM IR / ITS              | RISC-V IR / IMSIC          |
|---------------------|---------------------------|----------------------------|
| IRQ allocation      | ITS allocates an event/   | IMSIC allocates a vector   |
|                     | LPI. The MSI target PA is | on a CPU. The MSI target   |
|                     | the fixed GITS_TRANSLATER | PA is that CPU's IMSIC     |
|                     | address.                  | page.                      |
|                     |                           |                            |
|                     | iommu_dma_prepare_msi()   | iommu_dma_map_msi()        |
|                     | is called from the IR     | is called from the IR      |
|                     | irqdomain .alloc          | irqdomain .alloc           |
|                     | callback. It calls        | callback. It's called once |
|                     | iommu_dma_map_msi() once  | for each possible IMSIC    |
|                     | for the fixed ITS PA.     | PA.                        |
|---------------------|---------------------------|----------------------------|
| MSI mapping setup   | iommu_dma_map_msi()       | iommu_dma_map_msi()        |
|                     | dispatches to             | dispatches to              |
|                     | iommu_dma_sw_map_msi()    | iommu_dma_sw_map_msi()     |
|                     | or iommufd_sw_map_msi().  | or iommufd_sw_map_msi().   |
|                     | One IOVA is cached in the | One IOVA per IMSIC PA is   |
|                     | MSI descriptor.           | cached in the IOMMU domain |
|                     |                           | table.                     |
|---------------------|---------------------------|----------------------------|
| Initial composition | Compose the fixed target  | Compose the selected CPU's |
|                     | IOVA plus the event ID.   | IMSIC PA and local ID,     |
|                     |                           | then substitute its IOVA.  |
|---------------------|---------------------------|----------------------------|
| Affinity change     | Send MOVI to change ITS-  | Allocate a vector on the   |
|                     | internal routing. The     | new CPU. The device's MSI  |
|                     | device MSI address does   | address changes to the new |
|                     | not change.               | CPU's IMSIC IOVA.          |
|                     |                           |                            |
|                     |                           | The parent IMSIC irqdomain |
|                     |                           | irq_set_affinity() selects |
|                     |                           | the new vector and         |
|                     |                           | recomposes from the top of |
|                     |                           | the hierarchy. The IR      |
|                     |                           | irqdomain's                |
|                     |                           | irq_compose_msi_msg()      |
|                     |                           | translates the new IMSIC   |
|                     |                           | PA to its IOVA.            |
|---------------------|---------------------------|----------------------------|
| Message update      | No new device MSI message | Recompose and rewrite the  |
|                     | is required.              | device MSI message through |
|                     |                           | the IRQ hierarchy.         |
|---------------------|---------------------------|----------------------------|
| Composition context | No IOMMU mapping or       | Composition may occur in   |
|                     | lookup is required during | atomic context, so all     |
|                     | an affinity change.       | IMSIC PAs must already be  |
|                     |                           | mapped and lookup cannot   |
|                     |                           | sleep.                     |
|---------------------|---------------------------|----------------------------|
| Domain replacement  | iommufd_group_setup_msi() | iommufd_group_setup_msi()  |
|                     | installs the one required | installs all required MSI  |
|                     | MSI mapping before attach.| mappings before attach.    |
|                     | The descriptor's cached   | riscv_iommu_ir_attach_     |
|                     | IOVA stays valid.         | paging_domain() builds the |
|                     |                           | new domain's PA-to-IOVA    |
|                     |                           | lookup table.              |
|---------------------|---------------------------|----------------------------|
| Domain destruction  | The ITS MSI mapping is    | The IMSIC mappings and     |
|                     | released with the domain. | PA-to-IOVA table are       |
|                     |                           | released with the domain.  |
.------------------------------------------------------------------------------.

Hopefully that helps describe the design better.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
