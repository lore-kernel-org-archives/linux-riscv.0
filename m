Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C39961125855
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 16:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bktzJTYFEENy/E9nziSvUEoESI66/9x7Jpkf98pw8eA=; b=szlYGo8YwUSAMP
	0jIjfigui1Y80vhFS/BR8gRt0qmpAJOU3pvna9QxIWncAU1oEmvjTggJV58+VLDPdijl7N71TY3pg
	H7Kqsk+dXVXNf3bBXpNDVeiqLR2Wia0Tpcg7fjl4wKQ6c1neOUAIHNLVY8yUcZDjjTU78UYdKJdfT
	d3K6Vp2sNFnMFKOyIsx81NG5cxSUq8HjR3WFLGixvAJHl22yTpDUKcmp+DtmO99PjL/GpjbfAYj0S
	8fcAybjsAm3phZPVNkcq2z6H6w4vdQvkbZPzYLK5Dt/86AKkQekB0TQh3J7psR9ga4ObFNn0nRD2p
	umtrU9VSQlBXu3XHJDxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Mn4-0000000Bww7-3zx6;
	Wed, 11 Mar 2026 16:52:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Mn1-0000000BwvH-40qy
	for linux-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 16:52:09 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BD7tAx4032606
	for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 16:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y3/JAW+oGfTE3BgR575SvjKP
	t61kz+8CmpWiBiOLuUw=; b=nbSFXa8zbVW04UR3iGjV/y2nQU0cIJB5fIuIpNrB
	dB/eJOcWljGTnFzeLjAeI0ABRqyBIyUKFJ1wdq7yzWKgNsTeQKuigY1qdb5PmnaJ
	oZ3fcgf6bTe+BeXglfvEQDBY1CRAfnhkoX6n+HEfwXzGR2D3iK05JY5xHpIC1IHZ
	3v+uF8Ga++9meEkPQ1pIXuyMVfOnbBc1KGT8w9hbKrzbzG0mObW6re0Cpv+mo4yY
	W0bZ6qbz2x0yWT7eMpMpSlcKGYRCCx/0sIyYJuTFLmw8ndJnBHJ8P26gQVeHXLR+
	VD9KYFwPYSnusa3S81pVF341iRDPIVoGioWuqdadGkoP/g==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu90t8wbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 16:52:06 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7d73c71f9faso1180248a34.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Mar 2026 09:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773247926; x=1773852726; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y3/JAW+oGfTE3BgR575SvjKPt61kz+8CmpWiBiOLuUw=;
        b=IJrQW/ATfN6FIvRgTSSJaScB+KrR+EqhAl3VMYnxock0LHaJc4YYfgh4e5KQNtAKdc
         n/NSksavatxWY6HK5nWlOAPBQJT3ng1BaYY1h+4AVNv3CBSKMTdNzmaSMJ04tHo9cUD7
         2yyLJqLuXYDCUWx+ZDjKs7rGCADZf8t0Fq/bXEJXF6UygvRqZMSJPatelMyHuAEhAhN9
         IGTjMigBwG50hPwZg9o3g/m02DCU8Y4TMjBkoizGBynwAilvNhIwCvlr086iiOCMjQNZ
         KrDmAZHqxKMOlk8gQ/EHFBTgPHMeT60vWnMm9FqeYrbsPNHItW6e7K8pNvfFqZN0ysEg
         nRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773247926; x=1773852726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y3/JAW+oGfTE3BgR575SvjKPt61kz+8CmpWiBiOLuUw=;
        b=e+6XBS4M6GysEnXMzhEoyoFVxmOG7j93D5TD5cXBZUUaeFct3jGqHirNc7OxuAEiPC
         R3/8ECQu4r/Q8A2ZZnMv9TGxwHTo1bUSAf0Pox+EG1pXauBuQJNN1hquq16qQvvlsk4N
         /8foNQIl9szA7mLVIx2APxGhUSk0TLsv5BimOYqaj4Quj5yJxh714umlhJMpgAb35PA6
         CAQqLs1bdnHEx5sS+VTiNoyC7Hv/RtAEiKg4074PoQACpHmjMnwNLv3Uu4UnZKAwUuhH
         zGjyjpl+y8m82fTuu28pDILVsfspCWS0WIZIG67+pHC7RFkgDRL1bCJJO5QL18ZU/b0m
         TSOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWn8VZg5nbSZQiADDgapzsbgNCFkQxYU3P6gHNO3pQYgTtptg3ONryKpI4vQ33tUovKvX1yWrRRNsaAQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzV8IO4Hxk1RkH1jAvJ/yD6XeLURgAbE0AC3jHddZTf2pJ72TyK
	bvMgn1UDrTRsNfPxZqNEOhGrQuKXyUc9x3bqQr2jll1B3zogDfx+A2pJ+6ZRDCwuG+sz680btA5
	YaQQUllO5k9c4OuyksWcXLYamDTwqcr2sZ0IrQpLi1S/HDPKHuxwYFWNcuuSnpLUMyQGU+AM=
X-Gm-Gg: ATEYQzwybiYkp0v9TwuCj5VJisgGWnxhuJZmmu4RQguCY435WuRZnFa5yA0De/ewIPd
	gyHsl4s/4IKx+LWg7rbbR7T1IwgWPm2+WP2tZHkuXz+OlOo0vggyiSSlK8dQP6UWoIqLo/PdXv2
	ZlwSHMO/6GIe3h2T+cULmKYsE49zP8bPNr7Qgx/4Y4RWS2w1xqXULz7M9nlYX9AaGLtcZwVPFoB
	VKAVtlHN3vE01p/xo9Cuf1XYg1M6QO4Od30fHZwW9fgmoTTcLEBM53cLJnAqjPt5FTunmZ1loJA
	w1+Gze28W8zEJyu9pLy1gA33KROpwstvyML5ad+w27D9AQlgM3dglcqsI47Of6q2U764fPGJ9nI
	gW3mhqMQLFqIKxWKCr0NUIvxfNIXO5JA=
X-Received: by 2002:a05:6830:6c17:b0:7ca:c7a2:c935 with SMTP id 46e09a7af769-7d76a79e74emr2127316a34.35.1773247926094;
        Wed, 11 Mar 2026 09:52:06 -0700 (PDT)
X-Received: by 2002:a05:6830:6c17:b0:7ca:c7a2:c935 with SMTP id 46e09a7af769-7d76a79e74emr2127304a34.35.1773247925706;
        Wed, 11 Mar 2026 09:52:05 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d7749f1f5csm389205a34.6.2026.03.11.09.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:52:04 -0700 (PDT)
Date: Wed, 11 Mar 2026 11:52:03 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Andrew Jones <ajones@ventanamicro.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <pjw@kernel.org>,
        Shuah Khan <shuah@kernel.org>, Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH v3 1/2] RISC-V: KVM: Fix array out-of-bounds in
 pmu_ctr_read() and pmu_fw_ctr_read_hi()
Message-ID: <2apicvahmomu57i7gjd2cgc5cakq4pxsbphz5xnl4cr2sqvp72@hqud4u6bo53b>
References: <20260310055557.835531-1-xujiakai2025@iscas.ac.cn>
 <20260310055557.835531-2-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260310055557.835531-2-xujiakai2025@iscas.ac.cn>
X-Proofpoint-ORIG-GUID: ECeGjGom_JNTwQcbpXipuAiBI9xu5wRq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE0MiBTYWx0ZWRfX7dDfBhLGFwqb
 vAyWRtESiu4zSSTVbOPiM3d8ZPB/NXsdRZcqrXzVD/oan9d56rxKJlIyU665CmuETa9lvEVObG2
 d9RoIFHPwfjIbK86BWy810VCfvWjxREwOJh7bX2/Jj2h+VgWnIml2ToORXD9Qe4C1UUBjvO1cwd
 2SndWdDgWRzWz7UuVzr0/Wm3SA+WsWj1pYN8BSfwXiDlmq7+kj7vgKGUKwvQRG24CkFWCcFluxa
 EZYmz2e2ZK7oE+Idv+oX9HC1zfN9Xq0YfvglxB2b20i06qfxsRr+8PJBTLGQqqLLnIaVDf2b3e4
 WnX6sVUQHsXINYK6TUvc8BARR7HD7kjaPR6aOcK0TazXjjcMWjlGbZy480yKeBEBsFsO3+Tdk0l
 BJafDOoY1Vtg3j6APVj8HtBFKJHTYvzmo/Le4rt/HsO/f30HkJh+iBnz3cKHG6bbq4UcFqH5IrY
 U3nz7ve1pOetvBISB7A==
X-Authority-Analysis: v=2.4 cv=DfEaa/tW c=1 sm=1 tr=0 ts=69b19db6 cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=RS4Nko6ylG0vjQzhQroA:9 a=CjuIK1q_8ugA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-GUID: ECeGjGom_JNTwQcbpXipuAiBI9xu5wRq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_095208_021604_B5D5DACA 
X-CRM114-Status: GOOD (  23.94  )
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

On Tue, Mar 10, 2026 at 05:55:56AM +0000, Jiakai Xu wrote:
> When a guest invokes SBI_EXT_PMU_COUNTER_FW_READ or
> SBI_EXT_PMU_COUNTER_FW_READ_HI on a firmware counter that has not been
> configured via SBI_EXT_PMU_COUNTER_CFG_MATCH, the pmc->event_idx remains
> SBI_PMU_EVENT_IDX_INVALID (0xFFFFFFFF). get_event_code() extracts the
> lower 16 bits, yielding 0xFFFF (65535), which is then used to index into
> kvpmu->fw_event[]. Since fw_event is only RISCV_KVM_MAX_FW_CTRS (32)
> entries, this triggers an array-index-out-of-bounds:
> 
>   UBSAN: array-index-out-of-bounds in arch/riscv/kvm/vcpu_pmu.c:255:37
>   index 65535 is out of range for type 'kvm_fw_event [32]'
> 
> Add a check for the known unconfigured case (SBI_PMU_EVENT_IDX_INVALID)
> and a WARN_ONCE guard for any unexpected out-of-bounds event codes,
> returning -EINVAL in both cases.
> 
> Fixes: badc386869e2c ("RISC-V: KVM: Support firmware events")
> Fixes: 08fb07d6dcf71 ("RISC-V: KVM: Support 64 bit firmware counters on RV32")
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
> V2 -> V3:
> - Added check for SBI_PMU_EVENT_IDX_INVALID.
> - Added WARN_ONCE for unexpected out-of-bounds event codes.
> V1 -> V2:
> - Merged the fixes for pmu_ctr_read() and pmu_fw_ctr_read_hi() into a single
> commit.
> - Removed the pr_warn, simply returning -EINVAL instead.
> ---
>  arch/riscv/kvm/vcpu_pmu.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index e873430e596b..c87a7b0037cf 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -226,7 +226,14 @@ static int pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
>  	if (pmc->cinfo.type != SBI_PMU_CTR_TYPE_FW)
>  		return -EINVAL;
>  
> +	if (pmc->event_idx == SBI_PMU_EVENT_IDX_INVALID)
> +		return -EINVAL;
> +
>  	fevent_code = get_event_code(pmc->event_idx);
> +	if (WARN_ONCE(fevent_code >= SBI_PMU_FW_MAX,
> +				  "Invalid firmware event code: %d\n", fevent_code))

Align under previous parameter, not the >= operator

 if (WARN_ONCE(fevent_code >= SBI_PMU_FW_MAX,
     "Invalid firmware event code: %d\n", fevent_code))

> +		return -EINVAL;
> +
>  	pmc->counter_val = kvpmu->fw_event[fevent_code].value;
>  
>  	*out_val = pmc->counter_val >> 32;
> @@ -251,7 +258,14 @@ static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>  	pmc = &kvpmu->pmc[cidx];
>  
>  	if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW) {
> +		if (pmc->event_idx == SBI_PMU_EVENT_IDX_INVALID)
> +			return -EINVAL;
> +
>  		fevent_code = get_event_code(pmc->event_idx);
> +		if (WARN_ONCE(fevent_code >= SBI_PMU_FW_MAX,
> +					  "Invalid firmware event code: %d\n", fevent_code))
> +			return -EINVAL;
> +
>  		pmc->counter_val = kvpmu->fw_event[fevent_code].value;
>  	} else if (pmc->perf_event) {
>  		pmc->counter_val += perf_event_read_value(pmc->perf_event, &enabled, &running);
> -- 
> 2.34.1
>

Otherwise,

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
