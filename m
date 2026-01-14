Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F55ED39014
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jan 2026 20:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4dLs/PNbN4FgRQAdTWiF9bLzoxKWzKqXX0pBipL/xOs=; b=hS6Fmcwj/jVxml
	tGo0sXsIvYg/2JMpjaYk0kpmNFl2xHIXU8N8J0KKq2XwLdkc8nOv9CXN9W5G9UbZPvKX023/8W9tv
	lG8qeXQGSl9qQ/jVlqdjGi9dh2MjoYicQu8JEfAvP5Uprdp++Sx7sIbsBO1S6bKCwTfqZMpGsfqBA
	1t9Xg3obe0m8Ywi3Qec8/csHj2GfxMSxVJKWVTQcXfqeKY7ht+YQBXmMG7H0jl0hx7O/iJlVZbFNg
	8DtOT8xQzQ4p8wQuytMl+fOJ8wHVCKi/AgneJOVg8lswxwAgTGAvx2mTzW/0oq4YF65DjQsOUReHH
	cRf0AuQfsgSua9Q49QgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7Xq-0000000AdV6-1321;
	Wed, 14 Jan 2026 20:32:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg7Xn-0000000AdU3-36tw
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jan 2026 20:32:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EIDnAG3460406
	for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 20:32:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VR1pGYu1k6kGYDP61Yy+ZO9r
	3dhq0yO0jV49pm2zIRM=; b=a7xpqtydG761ASyzEx4bM7E+s9ss0qHEXHAmuHC2
	CgdekNrTTq31/OrjA7P4gy3rTeWLuReUSe1LIGCaZw5jI3dlYc7KoHP2IfCOeO9F
	GundZBnWePfjr/2JP/8gE1kZbuU1vd6NVGDrYm+v3uD2BXp4iKJWD+A/3Wh2o3GN
	8BTAhuhks4Y8QVPoSqhTSIwmNXIYCH8D9xxrdc93RzNR1H1jyl9QxdgUxTtJbAQH
	C2UgM21ZwHiwTnDIckHt8sdQN9C1aJvfdtp0whomyI1PkQRz/2ZsDUuRCefmhkGp
	LP2cYM1xKDdSNxcdGnFsyt2C8kH41EdWVkS4otmXRBqnNg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpg848d2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 20:32:42 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-122008d48e5so280523c88.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Jan 2026 12:32:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768422762; x=1769027562; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VR1pGYu1k6kGYDP61Yy+ZO9r3dhq0yO0jV49pm2zIRM=;
        b=HIfEnZDfTxd9x35gZm5cLBdqTK+Ow0YVsSa6hmQGqrICKPZXMCj07dMkjaA/kCf2vw
         aig2Kr05U7DxhL6qqsE7tkvb6FReWTR1pCVrezpmnykmchAlrhJRmtWXohQrVj2iH9dv
         sivwRvOsg2sb89sRO5KxmeNGTas1TzRrBFPO9mbW2yXPwU5+34p9gxg2WxOZrWQa43un
         vXK1BFLpfFGhBnWrDMHSShiI1fTnP7ADaWqpyMUspueekj5JwX4MesofkqsBVsq298qS
         B8O6ihiCvlQR2CtuhBBgJUyjVjQ5qrZ95crEpIUcZACT5mzGDuemwDFExphNjhW6tPJc
         W4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768422762; x=1769027562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VR1pGYu1k6kGYDP61Yy+ZO9r3dhq0yO0jV49pm2zIRM=;
        b=sGB+WGjhx1A7Fgt5orXy9wA5pT8bah+8Kx6/ojr72Qo4xnfQYEmB1E5G2q8F5VmIxy
         VimL3o/3e2k1ONnQpQig5TB6WLQ4gJ4KiSmwyE4bRCBvuHTGK09lmasmNoQ5yIbhe62z
         wRjsGmhlsgKrOI5cX2aQcV/Ny2+bAv7ljZUZFqqYN1DeLLNjIKdNlH+Eytjf/iUt+qau
         HtxENwdTDC116EVmJpzISmjh9YfnHlR+zHyfDv+nLjDM1rZzb5EO8qYlrcTOyymtUb4n
         fHR7NbtuU32U+N/4FE08VBImrydrVu9ihYRUdzUhtnm/TOI2MrapSwIoPFo+xNl7iiKc
         G0yQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqYCrp/Ulviqh8Gi0RcnnpEbU1yhHANHxcO74TCq+ppV34nWlQR+gpvsnZTGYlPbGSJjGWc8UOJI61yA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwoOZWwBaxL5T9O6VzVaUAPfeTaNSr9JvnzDP/PADXnFLxzyZb
	v4UjkPA8lcnMnSdOe4bLWqWZ+hoxkvWjtUnNs+6m44RbpCzPqaRrVrG2Z5Mycgt82mcQEBHcpBd
	+IMTqhFf2aSTtHEoWiAt45UMzLQyYxh+gxaqc1vD4xy8/KnVmYnS+EEP1PTxhQo5az7OYogM=
X-Gm-Gg: AY/fxX7bgvykCXVxQjpNcMKBROfbq9BuOD7f613+VBvI2avLTEsycwuh5QH0bEaioft
	0R+OHsX8+/Bqnh5PPhKR56iOsSomIe41yBGFPHYI/08OAwIogDqXBsXzGCfem+wBB/h6dn9YtL5
	P31LYEz4FUPWejBVOE7t31NRYsvg2ImCQNffiUtgNjxuXr8zXo6JbUqpYaVxPT84w7uwqnMKiku
	j6T9RqGLZhr+DKWTu9/ShItizfP1EJ73zbqT9TwmDyMDrESk0aooLlAdi7C6Guy3u7qtolaysUZ
	R3XaWxQGbOFmgHF+YFtzhCH7nq+WHYlNSgezIJucr46yRUjQHb7O/c+z22B8l3m+zzTDhKzOSaa
	31lDOjS92uo09NcIPG00=
X-Received: by 2002:a05:7022:1e09:b0:119:e55a:9be4 with SMTP id a92af1059eb24-1233696e203mr3863562c88.0.1768422761971;
        Wed, 14 Jan 2026 12:32:41 -0800 (PST)
X-Received: by 2002:a05:7022:1e09:b0:119:e55a:9be4 with SMTP id a92af1059eb24-1233696e203mr3863526c88.0.1768422761394;
        Wed, 14 Jan 2026 12:32:41 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12316f2db84sm12807661c88.14.2026.01.14.12.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 12:32:40 -0800 (PST)
Date: Wed, 14 Jan 2026 14:32:38 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: joaopeixoto@osyx.tech
Cc: linux-kernel@vger.kernel.org, ajd@linux.ibm.com, alex@ghiti.fr,
        aou@eecs.berkeley.edu, bagasdotme@gmail.com, catalin.marinas@arm.com,
        conor+dt@kernel.org, corbet@lwn.net, dan.j.williams@intel.com,
        davidmcerdeira@osyx.tech, devicetree@vger.kernel.org, dev@kael-k.io,
        gregkh@linuxfoundation.org, haren@linux.ibm.com, heiko@sntech.de,
        jose@osyx.tech, kever.yang@rock-chips.com, krzk+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, maddy@linux.ibm.com, mani@kernel.org,
        nathan@kernel.org, neil.armstrong@linaro.org, palmer@dabbelt.com,
        pjw@kernel.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
        robh@kernel.org, will@kernel.org
Subject: Re: [PATCH 4/6] virt: bao: Add Bao I/O dispatcher driver
Message-ID: <4rrof4lk2zxut63u7qwxlmygpslvq5owfraatbjq3sbybtac4u@2prxnxijartx>
References: <20251224135217.25350-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-1-joaopeixoto@osyx.tech>
 <20260107162829.416885-5-joaopeixoto@osyx.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260107162829.416885-5-joaopeixoto@osyx.tech>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE2OCBTYWx0ZWRfX3YmXMX8s/BEi
 RK0MTYfXDsUgFsXr3yHww2D+zrkZvIHDPeDoiTQ4h/GxNNxNHXjOVlXlGzDjr8cv+xcEe+S/y/6
 FlDvnTcQ5rRd9Fqs3UWlLsdE9HT0hpw+D9uppt6tS9gOwUUWntB+tEnKj+/FnWUHi3BWGkXN1SY
 9aTKSM6GOlGi6tMpEZzHXD0o1CR1+IcvipOHlv7ewOfZ1KrpncJ4drSEF+pUWeYObUzYpJt8cZY
 aI0sj2pS19AW9BD8i9bnw8LPqvWzc4GShFJjNCLd+LHHozm0VFBEniJHl5y0riTIILMbDNLkaHj
 y6xmlgvLbd+iPHfgjYP/klB8XUl0v8AhAOoEgXPmcuvq15YoS09l28vzwNIvSpi4JMf6R7py0mH
 KezJV1e6BEKHa5Db6fh9iNFrFsRpz6+xbnkouhMa8vJOO+zDamTtDwdhsCEAA9FcXQpH4/xScYq
 o7UxppVZShINzKxfoFA==
X-Authority-Analysis: v=2.4 cv=IO8PywvG c=1 sm=1 tr=0 ts=6967fd6a cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=N2YwmVq2Bvn80NP7DBUA:9 a=CjuIK1q_8ugA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: JrmbdrO9UV05YHeuVUkRwmifx7G190uW
X-Proofpoint-ORIG-GUID: JrmbdrO9UV05YHeuVUkRwmifx7G190uW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_123243_819547_74B82452 
X-CRM114-Status: GOOD (  17.83  )
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

On Wed, Jan 07, 2026 at 04:28:27PM +0000, joaopeixoto@osyx.tech wrote:
...
> diff --git a/arch/riscv/include/asm/bao.h b/arch/riscv/include/asm/bao.h
> index 35658f37e1bd..f04e6cd33fa9 100644
> --- a/arch/riscv/include/asm/bao.h
> +++ b/arch/riscv/include/asm/bao.h
> @@ -14,6 +14,7 @@
>  #define __ASM_RISCV_BAO_H
>  
>  #include <asm/sbi.h>
> +#include <linux/bao.h>
>  
>  #define BAO_SBI_EXT_ID 0x08000ba0
>  
> @@ -28,4 +29,33 @@ static inline unsigned long bao_ipcshmem_hypercall(unsigned long hypercall_id,
>  	return ret.error;
>  }
>  
> +static inline unsigned long
> +bao_remio_hypercall(struct bao_remio_hypercall_ctx *ctx)
> +{
> +	register uintptr_t a0 asm("a0") = (uintptr_t)(ctx->dm_id);
> +	register uintptr_t a1 asm("a1") = (uintptr_t)(ctx->addr);
> +	register uintptr_t a2 asm("a2") = (uintptr_t)(ctx->op);
> +	register uintptr_t a3 asm("a3") = (uintptr_t)(ctx->value);
> +	register uintptr_t a4 asm("a4") = (uintptr_t)(ctx->request_id);
> +	register uintptr_t a5 asm("a5") = (uintptr_t)(0);
> +	register uintptr_t a6 asm("a6") = (uintptr_t)(BAO_REMIO_HYPERCALL_ID);
> +	register uintptr_t a7 asm("a7") = (uintptr_t)(0x08000ba0);
                                                      ^ BAO_SBI_EXT_ID

Using the experimental extension ID space would be fine for an RFC, but
this can't be merged until an SBI implementation ID for Bao is added to
the RISC-V SBI spec. Then the Bao EID would be '0xA000000 | <Bao-IMP-ID>'

I think we'll also need to discuss whether or not firmware/hypervisor-
specific extensions are exempt from all rules in chapter 3 of the SBI
spec other than a7 being the EID. If not, then this function should
just call __sbi_ecall() and the Bao hypercalls will not be allowed to
modify any registers except a0 and a1.

> +
> +	asm volatile("ecall"
> +		     : "+r"(a0), "+r"(a1), "+r"(a2), "+r"(a3), "+r"(a4),
> +		       "+r"(a5), "+r"(a6), "+r"(a7)
> +		     : "r"(a0), "r"(a1), "r"(a2), "r"(a3), "r"(a4), "r"(a5),
> +		       "r"(a6), "r"(a7)
> +		     : "memory");
> +
> +	ctx->addr = a2;
> +	ctx->op = a3;
> +	ctx->value = a4;
> +	ctx->access_width = a5;
> +	ctx->request_id = a6;
> +	ctx->npend_req = a7;
> +
> +	return a0;
> +}

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
