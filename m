Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C26B4CD5BAC
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 19:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3MH2VBJ66/q1AcG0VZifwjmGOogk1wJFUTWQpJZ0g3w=; b=4qaRvxDwmQ/Wuh
	pC5ISRuNgkAnT4zqdFRHKKCboq3Ki8Q18BLOmkNmfhUzLD1fj3rKIj3u8hTtuaQ71Ua+vnzHcpa1V
	fpijpL1wEyGP+Suc6z6btrwnxvRzdE4aKFmq99boIXRdhPqdoOrNQ+sN9Kc9Ifzu9D6FVtukdt+pG
	8pxNcCIohRdsee1BFjed8GCLGsvIbFYs1YIhLuPMz5kEhODhxmYvbrQemkQgeXNYYO7QTt/Vjg7v0
	+wAvSz24JBMzNf5bY08bSMc8VeIHPtO0wbuhXSLLzjicugoTioASVUzf824BshyhDNZHnZRUhsOVC
	fLJ7Tmza8Kl+axfbrTkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQW06-0000000BpJ6-2nGG;
	Fri, 22 May 2026 19:57:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQW03-0000000BpIQ-0b8l
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 19:57:40 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MFrUlr3005127
	for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 19:57:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fuZ7l++VcF0ZoA9bYLl5upaI
	75/PC/8s9Uo+sxXFJG0=; b=KZLBAJEEreo46x0+IDHQlJQ+FvU6O6h3KUcKi42t
	1RQavoXykQoEs9VsBOABEKDHUutcVkfy+XDMBJwTZXnFWm0R5NQfCdnGAkjyJdqM
	y1AHD4o9kn7UaeofjDOK0gpIwfHUrv35y17kYODQ8Erl0ZrGsYn8ClduTPMIExGy
	zoXJTcN8e8nAnJLhNVq/8q5YZhhOJ61XEDDrFrdSsk8T39G9i43CAutaxwJmDql6
	AdCSGTFqaPBYZR1fIxnhGQdgpjY1rk+v+E1mKgmr5fk2tol2qYp3wZiv7M7godfH
	xf/q+6pTRViAGam5DzOalct/5dDbODbc5Syy+2DNzHrwdA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrtbq7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 19:57:38 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1353bfdbf99so10024912c88.0
        for <linux-riscv@lists.infradead.org>; Fri, 22 May 2026 12:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779479858; x=1780084658; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fuZ7l++VcF0ZoA9bYLl5upaI75/PC/8s9Uo+sxXFJG0=;
        b=f04ftcxjs38oZ/zxLzmiU/Ebpb9DSyBa6az009iUSkWOl431gPaGcj2WbJ1r1IdlEU
         1UiU7XzmEqWjadzLGpfqrapcAsNhtFcRnz8EGEqrDVKTZJvYxdbIt0ek+lJkIyJ3Oc1C
         yhnzQum84KbMKyuXViL76buUacj2bx5F8PLYT8G7NWyK+Q31a/w4julbLho4FWmg/oE+
         ztIp4jZCzanboMC6DV1pgTDV2MH30bHNxhrBKkH51uDSDSAIdrvx+fXTHSZp3OuJKegm
         p9rTgZ3mXIAxxPUzws2Yf99reN8V1YU2THGG23bE9QD6laQLZh1txCTU5Rno50vyqdUW
         mbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779479858; x=1780084658;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuZ7l++VcF0ZoA9bYLl5upaI75/PC/8s9Uo+sxXFJG0=;
        b=XwGd8ky9Qhei7k7D2+/XFtjQmzaeVJ/019V6pbZoGdDYVIDZ/mi3brLM4vxA/O67yU
         MZXufHMAOof9OMYs1YD/2gobNMnjFG0bYGVKahvqt6Lc4Pd1LxvVbFr9C7F/sfCUPelj
         An2dLNDkydLZ2bnUIr5ctJ04QYk3esjJGWpXJu9tSq+0pKX/pUqrmcdGf2BVnApwkMyb
         neMolhQsnnez7d27H++sjSq+90xm3tW1S6ySKxCY/jDWvpasUiWRlPjFUveBOT1VHUXu
         S7jH5PmPbNeKh7widTi2XdwisRNrqLdH3kSiQ8vmIswc7jCmfNSfHA86BF2vObT1SPhw
         kMVA==
X-Forwarded-Encrypted: i=1; AFNElJ8q8BWRtO8qRGxr9k6ZK1wB21voq1z5gVBc0TfBq/tUSlRi57kyWzkM9c8RfpZb7rew5sUbEIksxNfhlw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxIQMMFtro3DrSPzCvFtWv2aCL8ssausbqOfnjPkUvwHFfcjqn1
	Gd38BE0AcgXst9VPiXDL4+n7gMeFHKdG1ivMvd1O/USzkddMIClZPugIw+fCHLkGUx+z/LhydC7
	BKZrXbMiemgK4cEQxHnaEs7AvMP0QfJ+Musbl0491+34HqOjB0Oe+pp1mx4kOHzXfXEZlxoY=
X-Gm-Gg: Acq92OGeONUUmvw7moyzkJgKYY9YD0wYix0iThyxTrUX7r6CE7Z9yB+H0+tfAmZkFS8
	VMt4Fj8cHeUyKh4hqt62zd0YkVL5HWP2KfuXLpzQfQZ7M4NIzljCkgmY9sL10mHxNFeYx79ehyl
	fEonh0aGaUxiQVrbGOgiY/VDKJOnevmiNMN+mecKW+lNRKIgNHXLXF08E4ti/mB4ShPxg0i01sm
	2oxUPK0CETJT3l0iHkKhlumrx4d7YlsOqHt52bMsoZxYQpJVopx3NZoufI7KFV9X56kD+FuauWB
	r78qI5/qIyV2XDrKB6fASQV3k70lCoLmGNOxfB7Q+ieRNDH1NyR+SWsLquOqQa6pXKVUCzZpqL/
	oTj308qwuNifkkS3/aOkA44HVfgVxpw==
X-Received: by 2002:a05:7022:fa9:b0:11b:f056:a19b with SMTP id a92af1059eb24-1365f926a43mr2104617c88.18.1779479857630;
        Fri, 22 May 2026 12:57:37 -0700 (PDT)
X-Received: by 2002:a05:7022:fa9:b0:11b:f056:a19b with SMTP id a92af1059eb24-1365f926a43mr2104602c88.18.1779479856967;
        Fri, 22 May 2026 12:57:36 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13669c6a2adsm1712995c88.0.2026.05.22.12.57.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 12:57:36 -0700 (PDT)
Date: Fri, 22 May 2026 14:57:35 -0500
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
Subject: Re: [PATCH v2 1/2] riscv: track effective hardware PTE A/D updates
Message-ID: <eklh2rwzk4gcmeampzq5gj5kktspgtsm6znc56bqvg77rrg4yl@vhjrhmg6f2n2>
References: <20260522142358.87589-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260522142358.87589-1-cuiyunhui@bytedance.com>
X-Authority-Analysis: v=2.4 cv=JN0LdcKb c=1 sm=1 tr=0 ts=6a10b532 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=JfrnYn6hAAAA:8 a=968KyxNXAAAA:8 a=T73VAGx44BR4sEiwUo4A:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDE5OSBTYWx0ZWRfX+i3DP/1Z72rT
 l/L4cnUJnxOAV1GflN+rn0FG43r9BGvmZUhjiDkT1Q491PczL6iBQd0SaetiAG7Y0FNJX1rmiNM
 uxTLMqDtxlTswtm8lFZi+ckfRxSUz2/Wkpc1nmDp4nVmrtd+tWu4kyIRw4AGmg6G07bcPF2AgQW
 KpjpTG78AgkkQqCvqfmT9BT/cshRKn09Utj0Ff79Gwe6etwHYIzkJm8dkw2L35TWwACCnMFMmh0
 lyGW6dJ6tTGB7YQc4mpIL4vr9rSVJRW2X3R85ZjrqE9mWy1IG6+wN6KiAoeS0JepS9gzWSNPiiR
 7kOa5DJircY9Pc33/TrI1GTvNXwiHJyc6vIFZA6y7QeVCDZ270bG56X7Al4TV6UkEsTU4jTWutV
 /t48MUJ1h8re+2y43xJO9xTdLSLtOJSmayjQjfmHEasolywpLBbnl1+yOEC9OJt+mBvwufAdyVI
 nm5Gf1xaVrAoNBbvLAw==
X-Proofpoint-GUID: 9OSOkxnkMzDtg5mjE1n-_fT8GEFa22s2
X-Proofpoint-ORIG-GUID: 9OSOkxnkMzDtg5mjE1n-_fT8GEFa22s2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_125739_188025_D684BA5B 
X-CRM114-Status: GOOD (  34.93  )
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

On Fri, May 22, 2026 at 10:23:57PM +0800, Yunhui Cui wrote:
> Track the effective hardware PTE A/D update mode separately from
> Svadu capability discovery. When both Svade and Svadu are present,
> enable SBI FWFT PTE A/D hardware updating on each online CPU via
> CPUHP and use the resulting runtime state for arch_has_hw_pte_young().
> Fall back to software-managed A/D updates if enabling hardware updates
> fails.
> 
> When Svadu is present without Svade, assume hardware PTE A/D updating
> is enabled from boot, and document that boot-time behavior in the DT
> binding.
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> Reviewed-by: Qingwei Hu <qingwei.hu@bytedance.com>
> ---
>  .../devicetree/bindings/riscv/extensions.yaml |  6 +-
>  arch/riscv/include/asm/cpufeature.h           |  6 ++
>  arch/riscv/include/asm/pgtable.h              |  8 +--
>  arch/riscv/kernel/cpufeature.c                | 58 +++++++++++++++++--
>  4 files changed, 65 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
> index 2b0a8a93bb214..b09888e9988de 100644
> --- a/Documentation/devicetree/bindings/riscv/extensions.yaml
> +++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
> @@ -294,10 +294,10 @@ properties:
>                 of the PTE A/D bits or page faults when they need updated.
>              2) Only Svade present in DT => Supervisor must assume Svade to be
>                 always enabled.
> -            3) Only Svadu present in DT => Supervisor must assume Svadu to be
> -               always enabled.
> +            3) Only Svadu present in DT => Supervisor must assume Svadu is
> +               enabled at boot.
>              4) Both Svade and Svadu present in DT => Supervisor must assume
> -               Svadu turned-off at boot time. To use Svadu, supervisor must
> +               Svadu is disabled at boot time. To use Svadu, supervisor must
>                 explicitly enable it using the SBI FWFT extension.

Looks good to me, but I think dt binding changes are typically in separate
patches.

>  
>          - const: svadu
> diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
> index 739fcc84bf7b2..ad9fad6eee55d 100644
> --- a/arch/riscv/include/asm/cpufeature.h
> +++ b/arch/riscv/include/asm/cpufeature.h
> @@ -128,6 +128,12 @@ struct riscv_isa_ext_data {
>  extern const struct riscv_isa_ext_data riscv_isa_ext[];
>  extern const size_t riscv_isa_ext_count;
>  extern bool riscv_isa_fallback;
> +DECLARE_STATIC_KEY_FALSE(riscv_hw_pte_ad_updating);
> +
> +static __always_inline bool riscv_has_hw_pte_ad_updating(void)
> +{
> +	return static_branch_unlikely(&riscv_hw_pte_ad_updating);
> +}
>  
>  unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
>  static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index a1a7c6520a095..20663a466cf6c 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -732,14 +732,14 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
>  #define pgprot_dmacoherent pgprot_writecombine
>  
>  /*
> - * Both Svade and Svadu control the hardware behavior when the PTE A/D bits need to be set. By
> - * default the M-mode firmware enables the hardware updating scheme when only Svadu is present in
> - * DT.
> + * Both Svade and Svadu control the hardware behavior when the PTE A/D bits
> + * need to be set. The core MM code only cares whether hardware updating of
> + * the accessed/dirty state is currently active.
>   */
>  #define arch_has_hw_pte_young arch_has_hw_pte_young
>  static inline bool arch_has_hw_pte_young(void)
>  {
> -	return riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
> +	return riscv_has_hw_pte_ad_updating();
>  }
>  
>  /*
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index f46aa5602d74d..831dd6a7c1a06 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -35,6 +35,7 @@
>  static bool any_cpu_has_zicboz;
>  static bool any_cpu_has_zicbop;
>  static bool any_cpu_has_zicbom;
> +DEFINE_STATIC_KEY_FALSE(riscv_hw_pte_ad_updating);
>  
>  unsigned long elf_hwcap __read_mostly;
>  
> @@ -287,15 +288,60 @@ static int riscv_ext_zvfbfwma_validate(const struct riscv_isa_ext_data *data,
>  	return -EPROBE_DEFER;
>  }
>  
> -static int riscv_ext_svadu_validate(const struct riscv_isa_ext_data *data,
> -				    const unsigned long *isa_bitmap)
> +static void riscv_set_hw_pte_ad_updating(void)
> +{
> +	static_branch_enable(&riscv_hw_pte_ad_updating);
> +}
> +
> +static int riscv_hw_pte_ad_updating_starting(unsigned int cpu)
> +{
> +	int ret;
> +
> +	ret = sbi_fwft_set(SBI_FWFT_PTE_AD_HW_UPDATING, 1, 0);
> +	if (ret) {
> +		if (ret != -EOPNOTSUPP)
> +			pr_err("CPU%u failed to enable hardware PTE A/D updating: %d\n",
> +			       cpu, ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int __init riscv_hw_pte_ad_updating_init(void)
>  {
> -	/* SVADE has already been detected, use SVADE only */
> -	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_SVADE))
> -		return -EOPNOTSUPP;
> +	bool has_svade, has_svadu;
> +	int state;
>  
> +	has_svade = riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADE);
> +	has_svadu = riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
> +
> +	if (!has_svadu)
> +		return 0;
> +
> +	if (!has_svade)
> +		goto enable;
> +
> +	state = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,

I don't think CPUHP_AP_ONLINE_DYN is correct. Setting HW A/D is something
that should be done at _STARTING time.

Thanks,
drew

> +				  "riscv/pte-ad:starting",
> +				  riscv_hw_pte_ad_updating_starting,
> +				  NULL);
> +	if (state < 0) {
> +		pr_info("riscv: leave PTE A/D updates software-managed (%d)\n",
> +			state);
> +		return 0;
> +	}
> +
> +	/*
> +	 * A successful CPUHP_AP_ONLINE_DYN registration means the startup
> +	 * callback has already succeeded on all online CPUs.
> +	 */
> +enable:
> +	riscv_set_hw_pte_ad_updating();
> +	pr_debug("riscv: hardware PTE A/D updating enabled\n");
>  	return 0;
>  }
> +arch_initcall(riscv_hw_pte_ad_updating_init);
>  
>  static int riscv_cfilp_validate(const struct riscv_isa_ext_data *data,
>  				const unsigned long *isa_bitmap)
> @@ -584,7 +630,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_SUPERSET(ssnpm, RISCV_ISA_EXT_SSNPM, riscv_xlinuxenvcfg_exts),
>  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>  	__RISCV_ISA_EXT_DATA(svade, RISCV_ISA_EXT_SVADE),
> -	__RISCV_ISA_EXT_DATA_VALIDATE(svadu, RISCV_ISA_EXT_SVADU, riscv_ext_svadu_validate),
> +	__RISCV_ISA_EXT_DATA(svadu, RISCV_ISA_EXT_SVADU),
>  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
>  	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> -- 
> 2.39.5
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
