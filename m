Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EE8FCD4F21
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 20:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HUiyy1CVX0V94chPYQZkUDJIqvvNrhHqbaSmi2XsH6o=; b=oZ25667fKYnsCI
	YsHMGJ/m/G/t+bnNtw6JMwjQQ6xPqAnk/BDQ7b7bluQvSUUOasst3JNNjqigggD3YKSwvKOXbEv2S
	iMcfY8fvkqtR3Yt36Jd4jpAus0mBElI0YEDjkX6mN2GOjm8NDc+/BI7LcqBIkYLapcv/bqmcT0HWf
	+zmCMMuR+6BqzA6ZmH50jzlTFF/TfyAF8SPqeROfjuw/3ZKZjnVuW/kqXrswUvoAU9jFK7rdJL7dC
	CgX7VblPF+zAqpr2xDvue5eSECMuygPfO43yPuGX3KcdF3fCd1b2brRudAmw0DA5ZnzYeeEj8fw6g
	vCwgwj9IlNM8ObcxYxuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMtib-00000000L9K-1U2w;
	Tue, 12 May 2026 20:28:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMtiY-00000000L8n-3KST
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 20:28:40 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CEYYxh1733306
	for <linux-riscv@lists.infradead.org>; Tue, 12 May 2026 20:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZdFCLTngGpWA30C2bWFo2s/6
	cKEcVqUVdYFFi/jmxbU=; b=TWUAGtMqQAj6Fi7WhbqJCAusyvFOT1ynlnnaE9Dw
	VeEvA1rUFb/TfKmQ4JocbrGAaEyy6/Bp4Qq09zDT5vrvgvB6TkmOy6TrVohe3OAb
	D3Vsolaqh4oVBl+qW8Jd4+pWRYZKQ0TojpbVCTuTcngVgDBS2d1AicSjQe9BlkIk
	RbbJ/7e0uRnQSdIImNbuO41+LQyKuPcvgnExpIOzXEYyrQmphXopYQHTizeUHtRK
	3dbuSbzI1tT2pLIHa5AzU7PNYWypUeZZtrptOE7rOucqqRxJ9c3GIPMaNDBT+uiH
	1e4sZP0FtL6n0EZ4lQVVa1byvCvv2Jbj2BcGq9nIW3kU2Q==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e463dhbtc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 12 May 2026 20:28:38 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-13312be8a31so10145261c88.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 May 2026 13:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778617717; x=1779222517; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZdFCLTngGpWA30C2bWFo2s/6cKEcVqUVdYFFi/jmxbU=;
        b=VuE0rkKVxGJ0dKwAVX1GFokIRrJBMqNHs0Rieeiwb23Rd6SgTKFKNGRJZ67xcX4ewe
         p7sateD9Z3i7ovOKYhbqECfrnN7HRjv89X8l5ktAKMA3KXLNHCmL1o5Q9Kf+E0vHeoQS
         7CDK44e/JuIqI/2npospxtS92dYI9g8tg+Ocjo9j0k2yBiVHErWIjuaxGP4Rv8ifFclY
         LIuTzDQsVDZdY7mg3S7Su/xXVwaba89/vreOlFO2jjzMbNBL7g09QTRWoGfWtbqVGT0o
         J12Y56EEg034E8ZOL0iwKX9TIM+XGg/ohQ7t3iH64O59jJ+tCHAdD5RH2AerdiZ7kDpG
         9iXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778617717; x=1779222517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZdFCLTngGpWA30C2bWFo2s/6cKEcVqUVdYFFi/jmxbU=;
        b=Tp6xqAG2lietnkPCizpCCYCGUFRxYOlnHb5mZHRtueOZpSxJJyqivhkFoQxjo7Fqpk
         yIHxUh2Irn+xE3Ede/4UlEhgVaZ2oGDImfYF0YKrq8Qnl19uUcNnt14/dCCzZsDj+Lwi
         Vu6De7rgYag5Ls1PhWwI0W9L+YmSJTAoMtv5iQPgASiJxPAV7YtRDdt5nlzh0L3weFgR
         KdjxfCGbkujtXA2Ya5hU6Fv1xghQDDo10uVdmLbI2Ye8qjyKqcFu8nOA/06hHb75AnNA
         fmBiA3wZXKcYXNYDOL7cA5+FZjLXj8VAXAeifmB1EUSYMaE2Z3r+pSiWA/lvkXjwOCQT
         aQVw==
X-Gm-Message-State: AOJu0YzBzdtjLaic6XG81k5YXfAAKTMmWqXRY2Bbd3b2l/nehcX86jxd
	9BvKt/0QAzMgxb0xjyQxPWyRSBexIJr66pTquQnh4UNHy508OnhKkpoS5Co8+rN6rtVY1oCG3/n
	Jucs5ATqwabV7wmD3qJ7/ZaGiYgub1fC7uGDSQFCuqzK0C1+pnfrpL0qt0qFpCPU2tHe6FAw=
X-Gm-Gg: Acq92OHfFTFKCkVEg9ipxc4dWjN7yrunnxsQWSZJbmznUtEZvfDXAvyImW+U06CSY/5
	KU2grbf3YETgRpRru6ZB5bWAb59nkbVOThAXDcDfd/YUMRdry2jGEtHUCwD9r2sf9+aNsOQ+LtS
	r5ORnzbpFZzcNckPje7LuKj8IPCPvbSZobk+kaMzkL6Jwa/UO/7ixvB2ydlKcSsC+Rj/hoFRsRk
	cGe2xrEqm6Q4KxJYV6ttWY1gcsRYY0QhqPniNRakzgk4fwaJCHaE8LmpgQgLFjwPLMzgWmbok2e
	Gx69h20TPddZW6LZ2rXFw7RR1bYcfUuYu9qDJ38Kx/+aRF2IU6L2CEdd+NKxINE8DiVWIlTWC9v
	+7n+c2wp/LDT9+nzUxkY9uC2mOjIRod4=
X-Received: by 2002:a05:7022:e27:b0:128:dedf:f56d with SMTP id a92af1059eb24-134369a04f0mr278949c88.24.1778617717420;
        Tue, 12 May 2026 13:28:37 -0700 (PDT)
X-Received: by 2002:a05:7022:e27:b0:128:dedf:f56d with SMTP id a92af1059eb24-134369a04f0mr278930c88.24.1778617716854;
        Tue, 12 May 2026 13:28:36 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1327865700asm20416753c88.9.2026.05.12.13.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 13:28:36 -0700 (PDT)
Date: Tue, 12 May 2026 15:28:34 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Tomasz Jeznach <tjeznach@rivosinc.com>, jgg@nvidia.com
Cc: linux-riscv@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, joro@8bytes.org, will@kernel.org,
        pjw@kernel.org, palmer@dabbelt.com, anup@brainfault.org
Subject: Re: [PATCH 1/2] iommu/riscv: Map IMSIC addresses for paging domains
Message-ID: <ldiup5n5iglz6pabfup6hpvyi7543wmqu2bhtzxzysia7msg3u@tgp7adxloyy4>
References: <20260508212339.381933-1-andrew.jones@oss.qualcomm.com>
 <20260508212339.381933-2-andrew.jones@oss.qualcomm.com>
 <CAH2o1u4kUFyJqzRVOH4W0NxC0znabvi4V8VTQsURgBDErC8hTw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAH2o1u4kUFyJqzRVOH4W0NxC0znabvi4V8VTQsURgBDErC8hTw@mail.gmail.com>
X-Proofpoint-GUID: PCbxzpMK0ARZYUBqXXqIaul0rQMrs_8Z
X-Proofpoint-ORIG-GUID: PCbxzpMK0ARZYUBqXXqIaul0rQMrs_8Z
X-Authority-Analysis: v=2.4 cv=aLTAb79m c=1 sm=1 tr=0 ts=6a038d76 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=aZ6Tqwf-Lbvtu0Vc3D4A:9 a=CjuIK1q_8ugA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDIxMCBTYWx0ZWRfXy8gZLdcEvKCj
 iSVZyNXgtlg77vQPwUUELmeAd6/7ReuZn9dErLeBbjbJH6F+mzvF53gWajdrs788T+KNeBkacqh
 MsXy0Neu1RVDgMRVZGHo1s7hj+ZbGXdAgg/tCVLQTXIflsw+i1jQEe4XXNj86iHkOW0akyeLaCB
 yaBz6xi2/9ffEtcQDCfK6DHsHss83JXz+M4/X9TtuVEjOMR4yrD5D/v/g19iRzPXonj3gNGkrbA
 E5y88nD/nctZNWHa6BQxMupS15M04UFb09qe7bP8vQStU7M7RJ2M/KculW2QcY/Iu1rc7o3l6B8
 BRS+qtGK9nYd7NpfwsBkOzH/wO7RFsJ5KiVchYgJroi4GNdYwCJr1qNS6MaURgJjApJFIayfHQF
 k7ogshDxlxwh8hW/8CXxEq6ye/kOV2tKMiwHExGXpWlt7gu7SMcFwiZXu3M2CRMfeETNm+Vlz4B
 joxwKy7lmXvkavkI2Qg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120210
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_132838_866825_ACCD2745 
X-CRM114-Status: GOOD (  10.02  )
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

On Tue, May 12, 2026 at 10:21:22AM -0700, Tomasz Jeznach wrote:
...
> I would prefer to use the iommu_dma_prepare_msi() path, as Jason
> suggested, or implement complete IRQ remapping for RISC-V IOMMU.
>

I'll drop get_resv and bring in the irqdomain which uses
iommu_dma_prepare_msi() in alloc-irqs. It'll even be a better first
step for irqbypass since the irqdomain will finally also be present.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
