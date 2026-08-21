Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D35DEC5DF7D
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 11:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GX9p48WmFRuXzoZepWh585qVvHS5/fz3ncu+XaRRq7s=; b=cUbpze+/eJ16Mu
	QUjCaBMyjsKS15FkTczoXMHycycLDPsYe2GR9j70LBNyzCgyKMDKzkeYe4hg+WnN7VtkDwfo+r6B1
	ecffhhvynoaXZXda+ZNe66RKT8PbQUCI2j1VuZGyGMQcQg2M4e1yWy415zpvWdnCNmlBslaCPMz+c
	AUAcGrmL0fwjZklMve1EVi/qAEXif5YKqa1ICb0VSTS8HeO1aPfOZVfCbe6Ide6IQX95K1Q6SDS4T
	tPHqZUF2HMmsI3YZcsA9raJuj/KO1wCMAbqwr5MniH8xRHKhp+lmzb/CGDyxfemv4J+GtWLUnaPV1
	DDykCJHRivK4Ism1CUqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNDb-0000000DAB9-16Ch;
	Fri, 21 Aug 2026 11:15:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNDW-0000000DAAE-3cOj
	for linux-riscv@lists.infradead.org;
	Fri, 21 Aug 2026 11:15:26 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9LiAs1983083
	for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 11:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hzHnaq9Npns7wIBlsqeJGHfp
	uRuzgcX8JekRmNl9OHk=; b=e7LhV1Dd6mrkmqk7OyLIFud+rasyy0LiYuAyQmWE
	G3jJ7CwxbsLSGgTe8M0SOlrZy5HwdulTL7UOvJrBjJbobo7qxfsDryAG5Ag44uiA
	ZprIzcqrGewXYMcX9FaR73T/RP4ZX2tx09IYr8QDKwYEOtl+1DtfpCclLyTUeaQZ
	pF52tLVjoMRajOpjeN6A+MeZq3c5Xszthn3y0whyjFW7C4MlUjGp45HVoUxo+eMV
	1+mDCfOwC2f0dhhz0zvoKX0j/J32mbw+xhxYRBgaWXcxA7js9kZrJ3x/qD4S+hsF
	4RlWMxeMhRVYlTKj3SA6lSjMSNkRI8jWKt2AXc5rozzgfg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6cdsj0q7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 11:15:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e82060977so88311985a.1
        for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2026 04:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787310921; x=1787915721; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hzHnaq9Npns7wIBlsqeJGHfpuRuzgcX8JekRmNl9OHk=;
        b=Pq4x3wLiY3H8PEHLoMiOM/RmE/egBMeQZN36PNbHWfE63HX3Otre2ezm2tArODUVJS
         jXI8aTR2PGHYEoD8r8zRBhuHL4aC/44xOR0usedQeK9XlS5psadK/AUVYnfoocoITeuz
         XC4a00hr2qoZbBBjonaIb4NIrGvhHgc7kUp+u+4KVf4dPosgosKl8hjvGKhox8zAFSFQ
         ABqDyycV3mbia56NjEWZ0GBWwMzCTTPHEIw792rq133ADK8sYtD8rSLa15SRuGeqSAsZ
         pTT83GViKk9sGvnrWfF9gE3tK7c00gYcjXfQHGz0SamhF6VoWUl9uBpt/o6m+6FyH/1Y
         /8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787310921; x=1787915721;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hzHnaq9Npns7wIBlsqeJGHfpuRuzgcX8JekRmNl9OHk=;
        b=AMGWq8xeimzZ+bbuD1atH4nZSdsABjJO6rfgsBLisRtYhioIfFv5JdgQ3KDE1zbpGV
         8bVGJ6ehE5bPNjO5VPZtax0q4dc2DTjNMpi0EzwPpyI2LlGDe+B2Xn3tT8nLpu3MMSky
         7NZDPIwfl6n17ah6wjysftH36bJBIx7WG7m4FIQhpWL8RsZ9kbx678gonyrSi3/S6hcP
         Q3kc6cRizm21IZXFb8kJYYEKcuxpUQGXwcB0jJj2eJe2HnefG2KAXdWQdkpNBhHQZcv+
         GSUmZEGXAxF5M73h2H/PrFWB2b2m6Z2TQRunu9IHeSAybV5z5Tx1w+HR/ZE0EbQNyYW/
         jw5Q==
X-Gm-Message-State: AOJu0YyUzNalRWQhiESc0mZ9tleCT6/aN30+AUjYOZvyI0Q+rzNitucC
	YhfsRV+OMhl5IXkupDT1Dr+AqfI9UtkNT8pSxex6UynNTjpun529ni41z52lxxom8XJ3ZXENPIh
	ZcU8VOdeozMWXEl3cWGCa2OFxbCbIKBNT+8vT8X4e6P8hJlE/lV5xqFyMoK25Jm49FGCixl4=
X-Gm-Gg: AR+sD11nWbWY95f9ZveQxWUZJf2PDXKrdqO2SKL4iQmkSPy1rAisyPwjedJfdUA9JxJ
	WJ3JDFpRlZx0NbNS2J5pqwHb2FbVIk3zmYnr7Sbqdx68ON0xQ0k8O7boptqeKU2DeGveE996bOi
	zKiKUpm4NLqR8w9U85SJ6c4xk4fgfgzs+OLtgZlMUuiKuB1BZERV2jkcNtNeUhCNckZLbbrEpL8
	B2eFMNGsLJ8kh2Ulev85Kyucur/8jxlckkcBnzEmd/SOFyuCCE3DiME/bYf3HJak4MYOpuYvNHj
	2gIlT1VzcqxH5rz18Bo7c4tQroK2DVOImwPXYdhg0y4ZQo55AzD36B46QnJB/XUEXGYbImy6N96
	wqGe9SZKHZkv2Rp729yjelv6x4njeoqqwcU0=
X-Received: by 2002:a05:620a:7003:b0:936:ce17:7792 with SMTP id af79cd13be357-937283bd34cmr1289000885a.8.1787310921378;
        Fri, 21 Aug 2026 04:15:21 -0700 (PDT)
X-Received: by 2002:a05:620a:7003:b0:936:ce17:7792 with SMTP id af79cd13be357-937283bd34cmr1288994785a.8.1787310920874;
        Fri, 21 Aug 2026 04:15:20 -0700 (PDT)
Received: from localhost (ip-86-49-251-7.bb.vodafone.cz. [86.49.251.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499b915cda6sm28004285e9.14.2026.08.21.04.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 04:15:20 -0700 (PDT)
Date: Fri, 21 Aug 2026 13:15:19 +0200
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, tomasz.jeznach@linux.dev,
        tjeznach@rivosinc.com, joro@8bytes.org, will@kernel.org,
        robin.murphy@arm.com, pjw@kernel.org, palmer@dabbelt.com,
        anup@brainfault.org, tglx@kernel.org, kevin.tian@intel.com,
        fangyu.yu@linux.alibaba.com
Subject: Re: [PATCH v4 17/21] iommu/riscv: Report cache coherency capability
Message-ID: <dvh336e6ra47vkg2rahzgsqsq53ryl2cc6lkb3lapsee744bal@5z37ncf2t2kh>
References: <20260820214150.545737-1-andrew.jones@oss.qualcomm.com>
 <20260820214150.545737-18-andrew.jones@oss.qualcomm.com>
 <20260820214730.GC244917@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260820214730.GC244917@nvidia.com>
X-Proofpoint-ORIG-GUID: 9NMDrjbNm7Re9x5ujH9R6Ns5hudpf_xt
X-Proofpoint-GUID: 9NMDrjbNm7Re9x5ujH9R6Ns5hudpf_xt
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA4NCBTYWx0ZWRfX8kIZTwIgPA+/
 /hr1WMbPaSaP9AtlJx5ajekjgOWGMRy8KCjdahuD2IKnSJCsEmjbh1eavCktXJyze+m6AioUHq8
 9FSff+uKzJ21XSUlsiRXXXMV2NJ4Q70=
X-Authority-Analysis: v=2.4 cv=RN2D2Yi+ c=1 sm=1 tr=0 ts=6a88334a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=on9AXyaqQ0RhfYpiXjjEXA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Ikd4Dj_1AAAA:8 a=od_w8G5EaJPSkqSz1mEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA4NCBTYWx0ZWRfX2bY3QwoDJt6g
 e3hvyZSw5o8jO4rNrw5u48eGUH+dIlxOjRu6kppuK36T3wjT+xMC7b3whmPsOpQgH8Gk6C7emu5
 WI7GxFv3D6NJWbon6g/nLziEs6DeXVIPlptc7/7bHIzo4xYca6gLPVQ0MJuwlx9yBbSkexYUWRl
 rMrIRub7H5W4crR34x/VJbTxRscbZ0dlLpeOhLRJq0j28b/hXpuJeCtEUPuzLSqe7cUSiGDvzFN
 sCaCoWaHd3kOUlIvrM1zndvNM6XNx+nUndkM6S4cRCJeQZzjtpdpoWcCpPhdP86bP2Zr13TP+1I
 Jk43csvWvKqNJ7jCxELA7DbKo/x3vPwgb9bYPRz7iq9JQeToRAeKqYNFjYq9aDCOQU8Iy2i/x7F
 oIS1PYu3tTv5e6181UJCPnkZNDdMSr9H8fTeV6h4Iu5un6NGoe3aUH1pL7AXF2aV/s91BA8J/Wp
 /Qrqj9InZsZ3Hbsolkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_041523_647973_7ED81003 
X-CRM114-Status: GOOD (  15.67  )
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

On Thu, Aug 20, 2026 at 06:47:30PM -0300, Jason Gunthorpe wrote:
> On Thu, Aug 20, 2026 at 11:41:46PM +0200, Andrew Jones wrote:
> > VFIO and iommufd require IOMMU_CAP_CACHE_COHERENCY because they use
> > IOMMU_CACHE mappings and have no userspace cache-maintenance path.
> > 
> > RISC-V page tables preserve physical memory attributes for IOMMU_CACHE
> > mappings. Svpbmt marks mappings without IOMMU_CACHE as non-cacheable,
> > but preserving physical attributes cannot make a noncoherent device
> > path coherent.
> > 
> > Report the capability only for devices marked DMA coherent. This limits
> > userspace assignment to paths that can honor cacheable mappings.
> > 
> > Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
> > ---
> >  drivers/iommu/riscv/iommu.c | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> 
> You can send this outside this series?

Sure

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
