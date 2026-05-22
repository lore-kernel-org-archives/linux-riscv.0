Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3814CD5BB0
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 20:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pCVYrPGAEqGQ6mOS3R0qV3XSJ5PJud/MzQx+7muk8xo=; b=QSEWOrdUiswTcD
	hhq8fYLdYo+0ogT2wula5DgJpNomzegpmczsjcgzE8LgvMd8CPetSgPj5c7ldwOFUtWeNjYDqSU1p
	NFoKAHiULwj1hMyvRI3JENSa+aGb2bE3zWu0AiylGJLorciyRimQDF+TmCu3rGBEYzEQFLcRgXK6q
	NT5X/ppIk1u02gRf90a5xckxziLb+NusH3/QMIrWGQl7JLdPw2y15m7oi7IbKW3LN2dAQBX2Y7j9r
	EOsFOdoYpInSeDjXtxz0ZQWVYqBQj/o8v8ZvEfIlqrWEzMqfC5P5pZxLNFfkCStNAJOSktbD809Us
	l77j7Anb8W15Z7qxEWNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQW4M-0000000Bpl5-0jlf;
	Fri, 22 May 2026 20:02:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQW4I-0000000BpkS-3LXg
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 20:02:04 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MBjRKT1960694
	for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 20:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M7QbZu6uVa6eCBuwfOAoHYGY
	FzA4oF8MbcIUZZUI49E=; b=Og0mFT02lSWh6xjzDrIMY1Y/jLRneKb25RFgYYO0
	KFh/C22why2ubeUfzD6rCV7tNA9PsxMrXybVLnqIqODwwvcpHbNkBT8vqE02RLqv
	V/V5ZJMyHeFfwX/+YhNhx5UcWvBZ6nIERq6lanp8RDUEXLYNcP+fBehXZ746Hf1P
	Mxg4/yu4MgXwF302AJDaT7SHPOCJS56cd9ODcIFrJngzHbqkPUruy8TnP9RTEMtF
	qX4WfXB0VT9IUnDeD2eCm/QltaviWgB+KYlKShHsSnTODydxfHjhOzvo48buFPWF
	X5hQnOAd45IVLfn0mWlWrFKaSRUXwK0/CzCDDolGkudWRg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eahxeu5km-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 20:02:01 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2ef37c3f773so8042606eec.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 13:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779480120; x=1780084920; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M7QbZu6uVa6eCBuwfOAoHYGYFzA4oF8MbcIUZZUI49E=;
        b=TfKLLV0dq1m42z8pjZm9ckl1GPvaIZR6A7DS1lII7WY4aH+iDWFtld0WsFNbSgsocT
         8+RHbGOEVesuyNl3j8SIGexAPMCVOIy+oDedbi086EacUALCgDT0KH9/bKn/aPY+xArw
         DRTUm3FrV9KbkZl4/FhYQrNgA4mvVz85c/F0ji4lEYxaH77n9jEH2EF+N1/uKv9frqsa
         wc+juF5G3905Se3kSV7v9jw2t+W9bG8YhxmdBh6Ehkd37Z4eiD/7NC6xZa/8di3dR6Q6
         xXZYRThsC3rPwQMbdOqhkT6o2Aw+3R5WSnk4w3IhNDpt4Z/xYrCyh5cFrvNqk/1hoEXn
         GfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779480120; x=1780084920;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M7QbZu6uVa6eCBuwfOAoHYGYFzA4oF8MbcIUZZUI49E=;
        b=C2+vjT4pwH800ryZ7ze0zQGNsuU1rZMk7XuLteLixDN4p/Vz0cMbz4OE8wsUpLHXj0
         0XB8AyNN221hEw0PbazHuwfN60TwBfaLFgAg3DYmQt5Qu7pValX870y4R8NHGX7iz+pk
         bnkbq4xAQapCpPK+mD+PuMsyNmE1nB4jZ2gDzz1HR73MgNPzoMLg8B5HuhJxfmCc1ve0
         hkx/f+FECPWrUCAQ/Bpc+7RXKwgIt0nTU90tSD9dZxypIECtkX/ARXhIuYKGTzteUEMK
         MiSLZh75TfbiKEXA/6lMRG9sz6wQCQoffPEnqnQ+3j1Y/HzKiYDWlmdKQRdEQpYWw8X2
         2HBA==
X-Forwarded-Encrypted: i=1; AFNElJ/ZiJTCfdqY4/h2EO9mx3UsL2r/PgDAJL67Oe1PeiaGKKVVg24t2JKCqHKTQpZCxWgiRefwKfmOmFar6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTEORwmzQWSBps99U0lu18Qbi5zE+Ne63TIjdhYOk41DpT9BzL
	uVqnpSAdzBA1KRcSsRDO/BywvCLSbziRln6xAz8a1I4Q5YJany+Bbp6Exc5e4HCrLvUAoWjwaQT
	kOKTtKXvx1XcJCSXelDNsk4P0PAxFX0rIs1arLJG696+IWo7tnti8/hCJj0Yto7LFdihEOiE=
X-Gm-Gg: Acq92OGuQB7h0ozK75dc05Ml0ZzdhGqCXBaeGsxR4KsdkOo/n5N5Q0YcXK/vhEXr9v2
	bq+nIH2iMonLxklFeCS5xt+iOgIck6l1AR01jGdxIcQ8wFLifjo46Tb0JcyYeCpd20y2Pa7De5r
	SxUrZ7tQdy5EyfI7bBwm1wfQELz1A4/fBJ0Qw1WlGjqMbyAfQ/nki+EotU/iTknp/PPManh910c
	l3EYzfvE1Z9CaKNuyAOo/FK+Jgecmv/VyoGLQJiQaReOU61ohbCEH+YFEESo+AtB0xOg2NpcIj6
	2fp/j/qXDmkiTzAYT4MiUae1TRIPDiPtLUtovx5DbXzxPrSUHxf71O9+A0yjsn0TCBKfQl6JjR2
	rTdC9BVGMZD9Q3ik763jEuP7WJTyCwg==
X-Received: by 2002:a05:7300:a10c:b0:2f2:6dde:df54 with SMTP id 5a478bee46e88-30449146a8bmr2631445eec.33.1779480120165;
        Fri, 22 May 2026 13:02:00 -0700 (PDT)
X-Received: by 2002:a05:7300:a10c:b0:2f2:6dde:df54 with SMTP id 5a478bee46e88-30449146a8bmr2631409eec.33.1779480119505;
        Fri, 22 May 2026 13:01:59 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30451f3feadsm2315564eec.13.2026.05.22.13.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 13:01:59 -0700 (PDT)
Date: Fri, 22 May 2026 15:01:57 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        akpm@linux-foundation.org, pasha.tatashin@soleen.com,
        andrew+kernel@donnellan.id.au, rmclure@linux.ibm.com,
        debug@rivosinc.com, baolin.wang@linux.alibaba.com,
        zhangchunyan@iscas.ac.cn, apopple@nvidia.com, namcao@linutronix.de,
        wangruikang@iscas.ac.cn, apatel@ventanamicro.com,
        liu.xuemei1@zte.com.cn, ajones@ventanamicro.com, cleger@rivosinc.com,
        charlie@rivosinc.com, hui.wang@canonical.com, guodong@riscstar.com,
        pincheng.plct@isrc.iscas.ac.cn, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, Qingwei Hu <qingwei.hu@bytedance.com>
Subject: Re: [PATCH v2 2/2] riscv: preserve hardware-updated A/D bits in PTE
 accessors
Message-ID: <ybjx52k3y55vnlzrhlsnhgazx5izuefhuhdbz56j7dm3yoqrty@nukezvjcvk2s>
References: <20260522142358.87589-1-cuiyunhui@bytedance.com>
 <20260522142358.87589-2-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260522142358.87589-2-cuiyunhui@bytedance.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OSBTYWx0ZWRfX88N1pPxKWNYG
 mgJwGJGn+0ShEDQKo0SWEGZiyEYL+Z4r5cic+i4omhBui+x0M7y+IL8VYJaY98qn8I0am64a0XY
 JPS0jMayk72OojLD+kUlIqCgcHOmaU9vYKuT6gZqiEm4Fpdun3N5p2hBB0kXRkbT+UUzdLiXSVt
 4jctKreRaWVq/uh5bQYTwFurdHUcsBcUFqabs/8/1SFpKHfaqZr/2eXYdGnv7tz5am8M+TxTluT
 xK4+AHx5r6pHJjLRpSQcvAdV+rkGflUJaWwPFVQvhS4EwnkYNDTBcKfgDBKhOOK7EO+m4HEBtsd
 y/kg8wUCsO+B/gscT+EFCC4zFxnfEnAPLBtr3gJKg2kfm5gkKU0HvFitOO5QKYcXJ5ZvTjG4YoF
 hnN3EYFqbC7Ke1cLFHcGJD31OVizpojojIDQo4GMPneqg5O9gevzT0CJzbwsVDaNivHl4CQZUQ0
 18s95IUVfMv6YdeeRSg==
X-Proofpoint-GUID: srFxwZr4ApIu9EHLw9VNuWps1yfpVMu7
X-Proofpoint-ORIG-GUID: srFxwZr4ApIu9EHLw9VNuWps1yfpVMu7
X-Authority-Analysis: v=2.4 cv=ar2CzyZV c=1 sm=1 tr=0 ts=6a10b639 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=968KyxNXAAAA:8 a=Xiq_kpehkPP9HRRxSDkA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_130202_961165_F87AB444 
X-CRM114-Status: GOOD (  22.20  )
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

On Fri, May 22, 2026 at 10:23:58PM +0800, Yunhui Cui wrote:
> Use cmpxchg-based merges for live RISC-V PTE permission updates so
> software changes do not lose concurrently hardware-updated accessed and
> dirty state. Cover ptep_set_access_flags(),
> ptep_test_and_clear_young(), and ptep_set_wrprotect(), and extend the
> same wrprotect handling to the PUD leaf helper used by huge mappings.
> 
> Keep the existing Svvptc flush behaviour, but only flush when the
> merged PTE value actually changed.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> Reviewed-by: Qingwei Hu <qingwei.hu@bytedance.com>
> ---
>  arch/riscv/include/asm/pgtable.h | 19 +++++++--
>  arch/riscv/mm/pgtable.c          | 68 ++++++++++++++++++++++++++------
>  2 files changed, 73 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 20663a466cf6c..984c37ca8aef7 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -668,15 +668,21 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
>  static inline void ptep_set_wrprotect(struct mm_struct *mm,
>  				      unsigned long address, pte_t *ptep)
>  {
> -	pte_t read_pte = READ_ONCE(*ptep);
> +	pte_t old_pte;
> +	pte_t pte;
>  	/*
>  	 * ptep_set_wrprotect can be called for shadow stack ranges too.
>  	 * shadow stack memory is XWR = 010 and thus clearing _PAGE_WRITE will lead to
>  	 * encoding 000b which is wrong encoding with V = 1. This should lead to page fault
>  	 * but we dont want this wrong configuration to be set in page tables.
>  	 */
> -	atomic_long_set((atomic_long_t *)ptep,
> -			((pte_val(read_pte) & ~(unsigned long)_PAGE_WRITE) | _PAGE_READ));
> +	pte = READ_ONCE(*ptep);
> +	do {
> +		old_pte = pte;
> +		pte = pte_wrprotect(pte);
> +		pte_val(pte) = cmpxchg_relaxed(&pte_val(*ptep), pte_val(old_pte),
> +					       pte_val(pte));
> +	} while (pte_val(pte) != pte_val(old_pte));
>  }
>  
>  #define __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
> @@ -1030,6 +1036,13 @@ static inline void pmdp_set_wrprotect(struct mm_struct *mm,
>  	ptep_set_wrprotect(mm, address, (pte_t *)pmdp);
>  }
>  
> +#define __HAVE_ARCH_PUDP_SET_WRPROTECT
> +static inline void pudp_set_wrprotect(struct mm_struct *mm,
> +				      unsigned long address, pud_t *pudp)
> +{
> +	ptep_set_wrprotect(mm, address, (pte_t *)pudp);
> +}
> +
>  #define pmdp_establish pmdp_establish
>  static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
>  				unsigned long address, pmd_t *pmdp, pmd_t pmd)
> diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
> index 9c4427d0b1874..b77e82362442e 100644
> --- a/arch/riscv/mm/pgtable.c
> +++ b/arch/riscv/mm/pgtable.c
> @@ -5,23 +5,55 @@
>  #include <linux/kernel.h>
>  #include <linux/pgtable.h>
>  
> +#define RISCV_PTE_ACCESS_FLAG_MASK	(_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC | \
> +					 _PAGE_ACCESSED | _PAGE_DIRTY | \
> +					 _PAGE_SOFT_DIRTY)
> +
> +static inline unsigned long riscv_pte_access_flags(unsigned long cur,
> +						   unsigned long entry)
> +{
> +	unsigned long pteval;
> +	unsigned long hw_flags;
> +
> +	hw_flags = _PAGE_ACCESSED | _PAGE_DIRTY | _PAGE_SOFT_DIRTY;

Why are we setting _PAGE_SOFT_DIRTY in something called hw_flags? Do we
even need to consider _PAGE_SOFT_DIRTY here?

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
