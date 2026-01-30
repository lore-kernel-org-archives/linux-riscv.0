Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C764E6BF39
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 20:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q//Sk9piLgJd4B2NQSUMD9gWEYBsr/ISmSSE19Izzus=; b=HLAo0UBndwRWQk
	6Bj1/lnzB0+UbKmmUayBrX6nb59yIq3FO8KdRFaro0OA5Sxi6FP0VuzMymGDpXDkvHPvLMlIdpxIQ
	fDaOVngkQkCoBEvgWf+mMFLGZtsMySmLjjYfmaIlMO1ADPYomO/wcG9OIlkVQcyCVlsLIdhOEjXTn
	UGc/RL3yfQw/dd+Kp8bDB98MsQ9WI2CF/aOpVcDkr5HlFXYlvoO5gPcDMjbnHzHIZcGkWn/UYgrNo
	KMBd+gOv6ws00SwNuZHdpDoOlKOGpr1GpSVGhEblYbQGMfDGEnzI3XAleHBrnV/aIjsUS2xPpqmWO
	55Ya32p8T7RtnByLaXmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlvPU-00000001xIh-1WZL;
	Fri, 30 Jan 2026 20:48:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlvPR-00000001xHY-29Zl
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jan 2026 20:48:06 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UJEWY82930022
	for <linux-riscv@lists.infradead.org>; Fri, 30 Jan 2026 20:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nX+GGcv58sT3+6A/ukn6uGr+
	PmhTbKUYkNYsXb8LOA0=; b=dXGSsY+hqRrbv8uy3gXwlzkQquz4q7A/7+sVeh3e
	nX8WJvsbcVFnGDcZJIj7ud6qWqx7iABDzrIi1nv3BefikVOd5wkvFYNVHTrgecLe
	Ctwfl6nZorKuaOpWe+sDzuuuwry9hcKsV4VcP7IDLus1gyXpciZ/heo61UvnC7Vb
	yAJ8rkTnnD+GMitvFkFG5RJotv11bKlIZDak4/6SCXN3Y6a/eSgi5vFkIl6yYC1B
	LOubGkAHI12SZrGeu9/C+Pex1I5qpasESHiysC7RzAGuUCAw3CRRGmUQVDfIYYcw
	asaJh2+/uNgLcistcwBM1jMCPqk8EORuWQm/RmWIVDk2QA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c12mmg8kw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 30 Jan 2026 20:48:04 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b6b9c1249fso4053641eec.1
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jan 2026 12:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769806083; x=1770410883; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nX+GGcv58sT3+6A/ukn6uGr+PmhTbKUYkNYsXb8LOA0=;
        b=WMIRjqc2cVBzUV0O3caRT7JfRLZ9FlOab25OhCCbLkaK1XajYirq881NhyrBtu7rf8
         zlWM61H8qE+u1C8FqvAIelrLRzLQy2rBk4qjaNMaS9cPAFNIzRNIBpC+6cVvXoNonPnm
         hu9ckCBlovsYvJTOCgNFkG1nk8f8uh898YR5/cj2Gxebeby/WcIIBhLik5MdCm+5vQqK
         NhQwwYuo5OYqru/oq30dUqPb8K+bwRCutG0Er4KGQo+nNd0cYTBGtmjW0irMwxWgqb2e
         8nhm/g7cSzAQ4Jd7PaylJT/ETtb9YNxokMSMcRvOLfMo6Aghrrec1WF40WV3GZAwE+NL
         MtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769806083; x=1770410883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nX+GGcv58sT3+6A/ukn6uGr+PmhTbKUYkNYsXb8LOA0=;
        b=ehxYlvuejK1hN7zlI1rOP8aR34B+fyDZFAe4cwWTystVR0QwTLDnD8ugasHL8xBdt2
         qmXNrDKoJdTsRh2xK5ImwxeRxVaBH+MbJ1E6yQ3/2puN4WnOWQTUUF3iCPbUzgXfFeLk
         F4Hpf4QnNr23PUR/Tnijm1o1AKRwdqLOG3Vvz1JHWItUDqiNBmMrDjwBbaGsD8fv9t2i
         C2bsMunVNiEY+CMZ0DVMVyIrTqG4hl+ty1NCK1ds99Z6i4BSXBZ4nwqNOdoEltichQiK
         qQzrw3599w4zp5Z5jEiQjrVJEW+j+QqCgocUbaFQI07zfKewgg+EuCdYVTWafpH1jyuA
         mmKw==
X-Forwarded-Encrypted: i=1; AJvYcCVYfVKJf5J1WolD8w+zhrC0UaoggAnnmHgOo+WdTMZ5lheYpt/x3Nr7+EE+5//6fA03SD4bStjf0hNJ9w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDSnCq6V+UaQ6hTQWMHzuH3UKcFasmF/SIwuIxJO9Xd/fggu+I
	PAMAAXWHx6WRfoptQDXQ2eF5pnss5mZgWhUjCQKH+UWEcSMyzvGmXotRLgtsMK7vjhoxvYPIVTh
	vn/kRX+aoSZrG51HngQgyUZT+tXhIMZem6/ClWMeC1C2ZymoWWrrXgZ4SwVuQAZKcLHd+1lw7Cp
	9HP5Y=
X-Gm-Gg: AZuq6aJKHA35eiNvJIV4thJ2l/J1LIKfvfISjakNd3pze9j2MHYro4tKqJnP73taS/O
	QI29ej1FeJYEJOWhNBcUYTFxbKX6XYI38hpV6rEcYek2bkR0Zrw179OdHomNsy34SJRUM03syYc
	owXGWQKAkOE9B8jSLXUfNN6I8frsgLGG97bBC7RR5tDJ9zppLsRMPd214oBo+vis0xJ+vzLVCCM
	8pH7HIonZOiUdlFU7lvcELHKXbQnf0ZdxYtwzoPXWYgLHw2Hhibbi+KoAf4t5s5P3yo2IjQkHfI
	LDd767L4vFMFKCmL4QY/rSIoHVnjUbJC1XeTfqeKEKoa8V4mYD+pM41RN4H9ky7cUj0xQTJRZTL
	EBinXg8dOoUesZpj45vo=
X-Received: by 2002:a05:7300:4302:b0:2b7:1d38:3596 with SMTP id 5a478bee46e88-2b7c863300amr2186700eec.4.1769806082986;
        Fri, 30 Jan 2026 12:48:02 -0800 (PST)
X-Received: by 2002:a05:7300:4302:b0:2b7:1d38:3596 with SMTP id 5a478bee46e88-2b7c863300amr2186680eec.4.1769806082432;
        Fri, 30 Jan 2026 12:48:02 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9d6b906sm12831536c88.4.2026.01.30.12.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 12:48:02 -0800 (PST)
Date: Fri, 30 Jan 2026 14:48:00 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <jiakaipeanut@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>,
        Jiakai Xu <xujiakai2025@iscas.ac.cn>
Subject: Re: [PATCH] RISC-V: KVM: Validate SBI STA shmem alignment in
 kvm_sbi_ext_sta_set_reg
Message-ID: <ydibz63oh6tj66utjlemeikxg7iateqoox3bwg7r4pdvbwijoj@5zxhlhesvv2t>
References: <20260124022042.2168136-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260124022042.2168136-1-xujiakai2025@iscas.ac.cn>
X-Proofpoint-GUID: mvD4YApdM30WoFbiYCKBqhjcOyPsOIRZ
X-Proofpoint-ORIG-GUID: mvD4YApdM30WoFbiYCKBqhjcOyPsOIRZ
X-Authority-Analysis: v=2.4 cv=fZKgCkQF c=1 sm=1 tr=0 ts=697d1904 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ZDiY3XfEgKCrtrtHt9QA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDE3MSBTYWx0ZWRfX2om7FQ5sZjTg
 xo/ijrOx9cXC+6s3vlyFkSoI1dkUrDczB59a58Q4FXfS/OUTZEn6/SDIvXL21djgg954bWbcsWJ
 K9q30J21+reZmdGh5dcSPWjeMMsLuW5N6KjhUbelD9R4pRiwsk6Gsm+bD2yOdZ9EtVieAN1EX/u
 MlYeo/tzyrBmZgvixXnGKSQgGi8QHaZzINAEB6BMdQfKyxKadK9HTp0JoLQBdL7dbb6Zpf0R24R
 UwfvaTFKtbTqrRpJEj1KliV7SM8rbwIYhHbu25iq8VHdbWBy+BzznzVtH10vZ6E+iQXmTmKZ6sI
 E0KYN6PH20are+rU9XV6H3t7/bdAAhokeH1NavZNzrAVTuUawLqtP0Z/qItDunh/aaFCa7kNe/A
 2xLnI19K4H2XfStCIHV6d3RGzQyydnNc2TUxbsGgtwR2NHGpAiO5hCWCVhKdg77ftvart556iVQ
 ilUGLWcjbtYPSiI8gVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_124805_673233_F15FA317 
X-CRM114-Status: GOOD (  18.78  )
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

On Sat, Jan 24, 2026 at 02:20:42AM +0000, Jiakai Xu wrote:
...
> diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
> index afa0545c3bcfc..7dfe671c42eaa 100644
> --- a/arch/riscv/kvm/vcpu_sbi_sta.c
> +++ b/arch/riscv/kvm/vcpu_sbi_sta.c
> @@ -186,23 +186,25 @@ static int kvm_sbi_ext_sta_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
>  		return -EINVAL;
>  	value = *(const unsigned long *)reg_val;
>  
> +	gpa_t new_shmem = vcpu->arch.sta.shmem;

Please declare new_shmem at the top of the function and there's no
need to initialize it to vcpu->arch.sta.shmem. Actually it appears you
meant to initialize it to NULL, based on the 'if (new_shmem ...)' check
below.

> +
>  	switch (reg_num) {
>  	case KVM_REG_RISCV_SBI_STA_REG(shmem_lo):
>  		if (IS_ENABLED(CONFIG_32BIT)) {
>  			gpa_t hi = upper_32_bits(vcpu->arch.sta.shmem);
>  
> -			vcpu->arch.sta.shmem = value;
> -			vcpu->arch.sta.shmem |= hi << 32;
> +			new_shmem = value;
> +			new_shmem |= hi << 32;
>  		} else {
> -			vcpu->arch.sta.shmem = value;
> +			new_shmem = value;
>  		}
>  		break;
>  	case KVM_REG_RISCV_SBI_STA_REG(shmem_hi):
>  		if (IS_ENABLED(CONFIG_32BIT)) {
>  			gpa_t lo = lower_32_bits(vcpu->arch.sta.shmem);
>  
> -			vcpu->arch.sta.shmem = ((gpa_t)value << 32);
> -			vcpu->arch.sta.shmem |= lo;
> +			new_shmem = ((gpa_t)value << 32);
> +			new_shmem |= lo;
>  		} else if (value != 0) {
>  			return -EINVAL;
>  		}
> @@ -210,7 +212,10 @@ static int kvm_sbi_ext_sta_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
>  	default:
>  		return -ENOENT;
>  	}

Please add a blank line here.

> +	if (new_shmem && !IS_ALIGNED(new_shmem, 64))
> +		return -EINVAL;
>  
> +	vcpu->arch.sta.shmem = new_shmem;

And another blank line here.

>  	return 0;
>  }
>  
> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
