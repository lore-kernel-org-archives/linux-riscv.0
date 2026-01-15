Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB997D44C6F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 16:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ikyu/dUO6hKNIz8r9xFgNuKezHxRve+E4GSReHyspY4=; b=wRAX4WLtVjbrLq
	822eOEAuzzQS6AQQeHruFSy5pMYDzfNHnATOXTi6q2Mn34uzH4QP3TOvd1F3M8dBJM22A5psfbBx4
	SVWykkidgcIK6fXUzj39R8iiOFyqGUNfy8TEnDcX1cxZUGnSf3k/VtbOODEK6LMi6PPrMwzSfyH6S
	ZZPAHgIhYVLNSTUWkjJfrlsC8JH8p6mUM+SWDZQotxsS7xiJHJvIcPoLoJ3SCsmerWdCKpSNWrCpO
	2HhJAx54vCCwkwwwFrRcPEsmHGOgrJvC0kvm+CFSlD8zWrRBQSacFYNb6DRti2+x0iEbHc9oeIhJ9
	/PaYxYoM3OCx3ay9mV9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgPoo-0000000CdQS-08PG;
	Thu, 15 Jan 2026 16:03:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgPol-0000000CdPp-2icp
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 16:03:29 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FFYDDA1722673
	for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 16:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qpAiy+UAsm8ui4VdC0IGHWk4
	if4UfPJC7sHXaA0lrT4=; b=pFbXukLODaLIwUdRamfwgGkAOEsOj0MLRF90MD43
	Xy3k5FChvUTtTYjSkMpPdRSoOCdp994C/TJPGUhmB12dWjRhITwTYXNqUaIdPcei
	nPwwaYoe2BqhaA8ElC5NH1fj3+9YK93Y4HOLMczxks7X1ToOBCrlbaJSiTtho+iq
	D3SO7xEEXkPJmBj0FPtCEHQw3+MtiIjQTlOe1P3JPTo5mVtqTaN2NgtiIjFC/Qv6
	DOxNVwzUtN3aCqJ24JLb3+YW0DGv64akc8IF9q/TL+vyuD2VO0CN1udLc/WDT6J5
	/8cU45KHPctAWBVlNUiIdJlu/4JdHP01Rgi1E6UfOwpAnA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptna1k0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 16:03:26 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2ae56205588so1553108eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Jan 2026 08:03:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768493005; x=1769097805; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qpAiy+UAsm8ui4VdC0IGHWk4if4UfPJC7sHXaA0lrT4=;
        b=HufEvNQhiXOlDVrQZi9btTZMgXG3lqQteG+gJUFRJM8ZtsrJRwOu8XJODXmynwfyhL
         Q1drsJH006ai5t3kg5h07VRs2tbkk2oOXqp4AbxVh/CnibEKI9Tj5ZRNHZnsxlkV2MWG
         4wtBWhZSspYYnD+AYyWxSs+YHKzUN5sNKErxAbnSI7MHxzQ9Oagt6i6Sy+HsA9IL80u0
         dqYLha+6O1xuF2UO53xlu2i/zKWrmydcyygQGSlfFxJFBRaiNhAcGvtg+cuI0k1Vg8rg
         33UYgD2Mjar1SWaslCwfgT81O3mL6fPZCfQK2B0ob2B4K6cDoZ+4gyvqJCT7MczZGkiB
         L62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768493005; x=1769097805;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpAiy+UAsm8ui4VdC0IGHWk4if4UfPJC7sHXaA0lrT4=;
        b=N+N9eWrTpT3U2d7f2CMa3eYu+9vnyuYqNFZgtVW6FD1H3I/U/aGsza4GrMVOwUbOgy
         Sii2kl0wNC094B7svXr0Ntb/LaRxq6vC4+RjdJ5xj0zpXGJEEN6ztGIJ2BvbPnW7rgXc
         RjiMJuBF06QOBhQRxM29cVz3Nr09Yfy9iuYTXgOYIEiuY82O8mFIPd/UIFjDsyquioMv
         vNy93TH9WSmlNWlAdOEw0Go2Oio0ypp2m1/XGd+i/Wwt6hwnNnw2HcRdJQ9PFqYbZT4Y
         Hej46nQVUmh/4beuohgTj9uxNBIpWfh7rHd5WzqPyiPlRMJVIM0mYq6tCgGnHVrZwmPa
         YL2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWiqJqxL3v3n53IKEeVY3AzDicRFFgiCvGDtoxBYUEtwV6Xn86/RPMwG1n5zjVDgnlwUselM8KoCzJpGA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTMTjYPoh0kOciX+Rcy4dBZrxqN7xTeFiJek6/swY1I0qhu7Kt
	1H8/41jmDWdCmNK7PQVO7WRlmwlTOEj4cT47LUIWbE2q0KQaR6ZEC4OxRxUzDwmFkRQK+/rKxNV
	lBkU7eKfzu+FsvM8hM5seCow5wcEtGejXr7P7WsHDXw//MQVkUshzijnSV81nfBhe/PiFufQ=
X-Gm-Gg: AY/fxX4s2zdQepDRXWRx29GaNFhJRE+V9x7s32Wao7fnX7LAoTV/Tq1IWF8k8tw8dQ7
	Sfqzacb+DS1h62G67cm6iF8VNooYBkra2jt+lG8ZFWv9r+ho/E5kgmACF5CyQVZ4g7c5ct9nD7m
	WIUdrh4HFt8JOEsLDL8Yg2zAtXg5nt/nty+P0Qshd4ZmnrZ5MpdFgxQxT+6rdcyG5Lc+T7ELi+w
	6SkD/jRqL3BFZZbFRHQZZH+LxZYC2/JDsrfxPlh/Z2lmrA858JbW8VpJDH42RgOpz9GocFtXno9
	SXqotZYjkhWQDP+Z97wlY6aZEG0BuLXivs6NrHOI+OG3o98se3uIys1ShRk83RqMMpzVrg5yaX2
	L0AlLatsIzAt9GPFauw==
X-Received: by 2002:a05:7300:6c25:b0:2a4:61d1:f433 with SMTP id 5a478bee46e88-2b48f22e44amr9011646eec.16.1768493004992;
        Thu, 15 Jan 2026 08:03:24 -0800 (PST)
X-Received: by 2002:a05:7300:6c25:b0:2a4:61d1:f433 with SMTP id 5a478bee46e88-2b48f22e44amr9011522eec.16.1768493002923;
        Thu, 15 Jan 2026 08:03:22 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b175bee31dsm19965870eec.32.2026.01.15.08.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 08:03:21 -0800 (PST)
Date: Thu, 15 Jan 2026 10:03:19 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>,
        Atish Patra <atish.patra@linux.dev>,
        Samuel Holland <samuel.holland@sifive.com>,
        =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
        Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
        Eric Biggers <ebiggers@kernel.org>, Conor Dooley <conor@kernel.org>,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Charlie Jenkins <thecharlesjenkins@gmail.com>
Subject: Re: [PATCH RFC 01/10] riscv: Standardize extension capitilization
Message-ID: <dparb2rk47gv4sqdihrdogn53jue3tqzdfcamx6tftkzdmdflh@lffqvfvuorcu>
References: <20251210-profiles-v1-0-315a6ff2ca5a@gmail.com>
 <20251210-profiles-v1-1-315a6ff2ca5a@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251210-profiles-v1-1-315a6ff2ca5a@gmail.com>
X-Proofpoint-GUID: Je1MEG24XjeAUuKTUq_Mzj_gYCrfUS0z
X-Proofpoint-ORIG-GUID: Je1MEG24XjeAUuKTUq_Mzj_gYCrfUS0z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDEyMSBTYWx0ZWRfX56mcKZtt7bqR
 RdYVVnCQiUKGf2tBIfcqN8qSe3xCWxBQLPucWtx6gdzrqrx43ZtkgCfd7gcIa6angtRHCo9UBya
 5UYF+spkpqJx2z8tfzjMYSLpQZD1facuD3TXUJQt4/klsstWnwVwvY4djLDHtgBBC8HLUqMPTgx
 OamLuVtq8E9wXN4cv4QuLQAUnVZLQjwH1nUm6d13cyhUi0/39H+BVSxCOsV8Xm58P71kpSA1shH
 8xhN1IvII8nefupVOyfNLIn7OZsNHrrlEWYY/n3eWxcgaA4fKyeMl8uuV09ZGi5RKIfcXB7HaOU
 VDQFn8YtPd4V6omV0MHhJrpJXKua4FtYag6P7MNARq/9qabb+F6o0Wzp0E4kkY46htdqFz/ujja
 Jl3KPPZ1MyYVmkObs3X0MrwySBRrXqz0OpJGcx3/tK+MqZVHCDMp+xcrPu0k9IJHkb8+9OcTSkg
 0IAmDUycVzBVKCgaKLg==
X-Authority-Analysis: v=2.4 cv=fsHRpV4f c=1 sm=1 tr=0 ts=69690fce cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=rWIAY8-JucIMhX48tJMA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_05,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_080327_811123_2BB7FCF1 
X-CRM114-Status: GOOD (  13.81  )
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

On Wed, Dec 10, 2025 at 08:13:38AM -0800, Charlie Jenkins wrote:
...
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index 865dae903aa0..b6f5d1a74aec 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -26,14 +26,14 @@
>  /* Mapping between KVM ISA Extension ID & guest ISA extension ID */
>  static const unsigned long kvm_isa_ext_arr[] = {
>  	/* Single letter extensions (alphabetically sorted) */
> -	[KVM_RISCV_ISA_EXT_A] = RISCV_ISA_EXT_a,
> -	[KVM_RISCV_ISA_EXT_C] = RISCV_ISA_EXT_c,
> -	[KVM_RISCV_ISA_EXT_D] = RISCV_ISA_EXT_d,
> -	[KVM_RISCV_ISA_EXT_F] = RISCV_ISA_EXT_f,
> -	[KVM_RISCV_ISA_EXT_H] = RISCV_ISA_EXT_h,
> -	[KVM_RISCV_ISA_EXT_I] = RISCV_ISA_EXT_i,
> -	[KVM_RISCV_ISA_EXT_M] = RISCV_ISA_EXT_m,
> -	[KVM_RISCV_ISA_EXT_V] = RISCV_ISA_EXT_v,
> +	[KVM_RISCV_ISA_EXT_A] = RISCV_ISA_EXT_A,
> +	[KVM_RISCV_ISA_EXT_C] = RISCV_ISA_EXT_C,
> +	[KVM_RISCV_ISA_EXT_D] = RISCV_ISA_EXT_D,
> +	[KVM_RISCV_ISA_EXT_F] = RISCV_ISA_EXT_F,
> +	[KVM_RISCV_ISA_EXT_H] = RISCV_ISA_EXT_H,
> +	[KVM_RISCV_ISA_EXT_I] = RISCV_ISA_EXT_I,
> +	[KVM_RISCV_ISA_EXT_M] = RISCV_ISA_EXT_M,
> +	[KVM_RISCV_ISA_EXT_V] = RISCV_ISA_EXT_V,
>  	/* Multi letter extensions (alphabetically sorted) */
>  	KVM_ISA_EXT_ARR(SMNPM),
>  	KVM_ISA_EXT_ARR(SMSTATEEN),
>

Thanks to the case change, we can now also consistently use the
KVM_ISA_EXT_ARR() macro here:

 KVM_ISA_EXT_ARR(A)
 KVM_ISA_EXT_ARR(C)
 KVM_ISA_EXT_ARR(D)
 ...

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
