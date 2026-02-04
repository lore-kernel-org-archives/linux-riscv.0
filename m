Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB828E9D408
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 16:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i6unvi4IGCAmN6ENfgHFJwTcdgE5zjadrZBXdF6cbOU=; b=PsYVedqHUmlEED
	E2pZi1w3mQJq9XkA3YTe2tJ5HSXry6vSu0YIMTSkYd31jvFUBw91PGe/77izzYVR2cAR+saU0p02n
	Gx+hIpu/RZl9i5aNnPSC9PuCGwyaswk21I3KsAEg1emcJqYAmcjRD8Fq2pLOVCNG5mcRA6M0NqWDH
	ShuPPTQAeiDzLTN/hzrivMuJwGfAnN4H08v6hAuZW1z0RuQw0I6q3mkK+1+1sQphsgj12t8SVK/Bh
	qjPbt4fASLSE4yc7nMz5oLDCLDfrycM17ZFFukB3XgTKzVig1oimGTlY+YMzjWb4VdnDQJjgcc8Ns
	jwfc7ZYmKWQ+x5GUSv7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfS9-00000008jR7-1bn2;
	Wed, 04 Feb 2026 16:10:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnfS7-00000008jQk-06La
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 16:10:04 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614E4V0i946588
	for <linux-riscv@lists.infradead.org>; Wed, 4 Feb 2026 16:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cfk2AxvSUaOW6gTcg737om3J
	rAPlsakGmZKpL4ObUwU=; b=iotCLpR+MUNKsJaGaSaLwpHUjtrsFLqlafbgHX47
	QEq1AOjsjDh87wO13lUIj8MSyXlPbLm9icxg1UVJA4g3EX1SG2/qv5RaoCChX5Ve
	EpxiQRQjsWclmrEINKGbfJ581H+s6+2dneGGHsGtQTKOByV4wHx1mX0fMOFWCKBt
	hC1DHFFDbKwJSOdufwbidZZ/RwLMStXJuEd4utvc8FboH8DP4frVq6E4dMDRfsj9
	f9cYM03E6QvB5bRZ8ivO58Zs2V1lLm9hHmQjEJGQooXx2fNpauUOqVD3WPFStd4M
	xF07fj+1+5DhTvpmq1FrKzJLvlzfl2MyO23pOuv4zAWU4Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c47ja0eac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 04 Feb 2026 16:10:01 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b8295e5703so10997784eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Feb 2026 08:10:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770221400; x=1770826200; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cfk2AxvSUaOW6gTcg737om3JrAPlsakGmZKpL4ObUwU=;
        b=hZocqm0AbigCIVHoQpOa9394bKhJUFqDvkM4BtSFjPIJB95xSeLYm2p8SGbMW2ECnK
         SORlXb0IFV61jBxkM0Yk3jUBvi8ew/TqrwtM6oxzEDE9RDA+mkitD8APyyAVQwGl/gWO
         ouRMYOUoOoi6dCdz9gl5pE2kA2N+xZiXlQVTKSf7dfIzVm78TYvfQd3eERCFt5AqO/lx
         L3TmjEFlNda9pi2L8m/irnd9VFArFoMEAWOdZ11+NEC+ErtqVSjWRfZtJckds/pzgfM7
         7lJrELJtRu4fC1KJKp1u+TP4GYEYtQI5B6MdQ0UNMpp1iEg3rAm6AKOYNBHef3DOsjgz
         Vi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770221400; x=1770826200;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cfk2AxvSUaOW6gTcg737om3JrAPlsakGmZKpL4ObUwU=;
        b=FwNxsqozrv24OKH2/Qz3kqnoZ57crmhhICIn9mSY9ZEyYUMAy1cauY9khJ2uAgJD7m
         d6z1SFjkIoA/MHAGPXmwaZE+ydsDVixHqvzXIM1x+gYOBtBXHrfV4wDERVjStNqCGuHp
         k1+DqXogvlG7RvV/NliLSf+Z0rqN6wnm9TVwbY/OeLf+SdV+ROyfu4uxWmwwgpchfg/C
         ZGtDseUUoeXjlG1CEukQAxDFPHj2wi4Wm9R7BOEMmswdjHGnRgrVLejLRdMdptFPo2id
         nqqvt9WQfmGK+wicH6Q9vqY7798BSBGKfE1xGGnWTlJBcwbxzFRAjJvZXeXGmyNJRDiM
         S9oQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+Yv2NTwmeMGAr5x+XzcKfjtSxHNEUHtELEe7mRlfenjPhYodFHgOGcBP7ChdmYZi25a2Cdlj08rcjoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuuU7TIMpXNX28rf7ln4dmmcryhoBJO+vZKIGS/gEr2J68BRAC
	LK2YmDW+QZzNjjDdHqGGYnK1d8OKaS5cmHYJdsUcZ4fTTQ/uQMGAe4QIHkCcLNLRYvwyIW2OKy5
	To0V9VMtlVUHMpXm85+CdbRzTpgqlRunIYl/cuipVJrX9TjBAKlkM8y8umTk2E9Jy2zSiEG4=
X-Gm-Gg: AZuq6aLkFrxlF8Eg64B3M9cOL9sew3BSWdUwX/JYCc9GzOt+f0OpJ6pl5TVMK+MFDNg
	B39mtwJRXQ9jV1tJha9t85oD49jSc2SmBtLbLaLc/bdOlE7UK5Z4zmwZxdFTK8lHZ9jTFhGpsqP
	l1s5yAilzxu1INlyr+NNIMtfQD4+DNHnXdC376ApzLYJNKlntoOJ3UjJ74uGFAgGSlvtc8HHSNx
	zqtdECxK8PngdvGWRQFqeK29dBgW/eTJXm2MJfARGN/wC4orN1Ydc/LMOXqcMK0lHaY7A5ih1as
	HYLJAhf+884xqwglogkj/Qo9godBcgDcfoYy4/m1KfzYXo2wRaxLtEuJBWOg4DjfSzyqAI1vt3l
	RRwfszAFjTJohDlHSIMU=
X-Received: by 2002:a05:7301:1296:b0:2a4:3593:646b with SMTP id 5a478bee46e88-2b832a556a6mr1776492eec.27.1770221398519;
        Wed, 04 Feb 2026 08:09:58 -0800 (PST)
X-Received: by 2002:a05:7301:1296:b0:2a4:3593:646b with SMTP id 5a478bee46e88-2b832a556a6mr1776447eec.27.1770221396480;
        Wed, 04 Feb 2026 08:09:56 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832f8e78esm1613358eec.16.2026.02.04.08.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 08:09:55 -0800 (PST)
Date: Wed, 4 Feb 2026 10:09:54 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
        linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <pjw@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Tomasz Jeznach <tjeznach@rivosinc.com>, Will Deacon <will@kernel.org>,
        lihangjing@bytedance.com, Xu Lu <luxu.kernel@bytedance.com>,
        patches@lists.linux.dev, xieyongji@bytedance.com
Subject: Re: [PATCH v2 5/5] iommu/riscv: Allow RISC_VIOMMU to COMPILE_TEST
Message-ID: <5vwi2ayg7mr7ug7ydlyonlrcser5o44pycjsjhg7nyvppuwhhx@gd3s5x6gzhhe>
References: <0-v2-b11ebca8abb6+c096-iommu_pt_riscv_jgg@nvidia.com>
 <5-v2-b11ebca8abb6+c096-iommu_pt_riscv_jgg@nvidia.com>
 <dn7bsft2qvjod3sm6omneq37pwr2jtdzgobapy6obpgccg7soc@ctvs3c2w4vob>
 <20260130234434.GK2223369@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260130234434.GK2223369@nvidia.com>
X-Proofpoint-ORIG-GUID: 6OfnU8XE2IDhpDoKwHCfKV4gW0NKqlk2
X-Proofpoint-GUID: 6OfnU8XE2IDhpDoKwHCfKV4gW0NKqlk2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEyMiBTYWx0ZWRfX7VYqFYzwPCr0
 oEeLyL+NLEyCuJ38QwOK4329cMc6wHNvjTRkC+1HeV9sflTSWTMnNq/ONXjZnKe6V9wSf6vwkQF
 hiCu0FHtiCkbuV7Yuk+AgSIVCZQHMFjVu+rcfIfYW0w3FCFVINtKmjfaXlZ0t2Cg1gZ/us4yR7v
 EpucP194yklGxxUkaYyJjCQ1c0MQXZ1hLoMqfPAThcrJKIZyG8ai+6KWQoNlndoHOftKl68WEa4
 6IxKHwE0LUqtkZcOiwwX8sRoURyHZ6Y4zTSGMK37k1gIL4Gh97XCxywCo1S7AFFeFoWaGaw5CnT
 abxklenl1qHndHS/Xvpo+S2Um6+VNGG3JGG9HNnN5duMcV1a0txnK5m27AKeUoqSKi+yAN3sE6b
 4N5xE+3mNTnKk3akgKfyg68/VoVMWxyNGLcbo2KcfAlCum9fRpwOx+KnA9nLNhJoI8Lwp/EjLbY
 WcAOxzY9yyAP1GX8Wig==
X-Authority-Analysis: v=2.4 cv=a8E9NESF c=1 sm=1 tr=0 ts=69836f59 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=mqPRyWp8_4GUfDidQbUA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_05,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_081003_208266_A7EA2965 
X-CRM114-Status: GOOD (  19.88  )
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

On Fri, Jan 30, 2026 at 07:44:34PM -0400, Jason Gunthorpe wrote:
> On Fri, Jan 30, 2026 at 01:58:51PM -0600, Andrew Jones wrote:
> > >  config RISCV_IOMMU
> > >  	bool "RISC-V IOMMU Support"
> > > -	depends on RISCV && 64BIT
> > > -	default y
> > > +	default RISCV
> > > +	depends on (RISCV || COMPILE_TEST) && 64BIT
> > > +	depends on GENERIC_MSI_IRQ
> > 
> > This new depends isn't called out in the commit message. Maybe it should
> > even be its own patch with a fixes d5f88acdd6ff ("iommu/riscv: Add support
> > for platform msi") tag, but, either way, thanks for the fix.
> 
> I think if riscv has a 32 bit configuration with iommu HW available
> then you'd want a different fix to make it work.. Probably include one
> of the high/low headers to get emulated writeq
> 
> This is just intended to make it work with COMPILE_TEST on eg ARM32.

I was pointing out the new 'depends on GENERIC_MSI_IRQ'. We had the
64BIT already.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
