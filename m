Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B0EE7DF11
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 18:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UG70dtQ5oOaKaaSuaCZkHqA2MLR9tM0jA4sp24ATydU=; b=WVJQXLmD7GPQfv
	lpFC7kWcuMgUUW+0bD8E30cqvOXei9JzZktHRvhczl+rnMHnEvq/5fyWF3+N+F07UaQdRLcOtAr2J
	RUZdG25p7wcGxumtDprtkOw0t638iGRMfrNswVuaz2J1lUO1UiLjlncno0cxsaDAE2MSCJS81MFBm
	MFLE5EvWeWg4kKNva8EuaA03BuXCYUDY+D3xaHGgteFIhVc+niif4YY7ydJkDCNuelp1R1kk8vF1u
	EL76JxhPZvKoZ1G35qZuPPEekJ2bSPv//wgoQ0ornkyy4x1HSqldnv8mlqZO42AALTlq5Xpbxc3gd
	OTMFQHO9GyTECY9ygqHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyve-00000005SpA-3lrV;
	Mon, 02 Feb 2026 18:45:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyvY-00000005So1-3dx5
	for linux-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 18:45:41 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612B0Mrx2899904
	for <linux-riscv@lists.infradead.org>; Mon, 2 Feb 2026 18:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F3pTCtfOUHdevSdvNcn6XqzL
	AXxPpY1f4QI0AgduT8w=; b=A6vQWelRxUO5ssU1d44HbW04LSRdJPcgJDyxrVRY
	Pc2aHeWYECNXWzDegYEcHfxupof23ZBmKMNWIGEP+3bnwrkj/iCzv6qYArKL12u+
	JFhpG3dfm6h/wOfRjiLBR41kilUIeIbNRjFKd/vMepW+pqb9sv8ln4ME28IUginG
	YOk07VoqVwmTpLvO7q12pqmW1iRis2xpqm3p1W/GVdEI+6S+0TyMmQ2hT9It0aPT
	Q32w4ITgOW8x55wWCvEF/z9HQ3XUCu3JehBwgFuAvlbhag+FMzXatRJ888aBxoD0
	fJSdRiOsoBtfbuBsFuJV8mKGqlEi/tKvOStg9UYB/w+Wfg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tp0sdrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 02 Feb 2026 18:45:35 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2b713fa927dso34121eec.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Feb 2026 10:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770057935; x=1770662735; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F3pTCtfOUHdevSdvNcn6XqzLAXxPpY1f4QI0AgduT8w=;
        b=bSWZigLjM9vhCIHu8/P5iElrAJckw3iT35I2KpnAuW5tL/HBzD5VQI66Sxu8jNBMSH
         L9tuSliqN8CbiApoon8I1mqJhEFNKOvk9OCOP//Uh6IKuBUIIcL/2hVBjyZXQwLdPUEP
         Ljhj41GvgrcPIwaOuMJCSHrVOX52V8cMZ9oPPas+4loexwPx5PbXpUvpVZ8HkQH7ys7O
         T5kOisq9jIbH2K0aDmWnQYAZqfZ+4lQGkyLynYIkLlJ5CseVtN3gCsY8gi+d5ZL8Hk61
         8PnMIQQPaU0yQvnCgbXD3XKu8sL5RbNUcWiZSlGWPk6trJwj05lJ8d630IfmpnhJU/ZA
         3o8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770057935; x=1770662735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F3pTCtfOUHdevSdvNcn6XqzLAXxPpY1f4QI0AgduT8w=;
        b=iU+2sYfO2mbPEEsGrtfp+czz8UTlRNK1Ideiir7eVy5oQt5dAwd14quwTAUiEYbOm+
         F07aJNCLtfmuDELr5d+Be5mlgzxXI/2poJ0MLThRCVB0VZ7aQc24isMIYI8uPkFXKnMT
         rLQLjBxBqNC7wm+i9elhtU8ztvZIRooPa03oqu2v9SkKyFIxW9GYTpq+pyFKDhSJO3aL
         BUMT7AyBE/77Exddv19cxBH+SXMTU3sOzPqs9jw2+z1tMsNXsp1Liz2gT8fpYGXqpTVC
         FMxgGv9bWS9n5MmQOPMMBJCVtcjaSr3C9zivZbPD/RSDPWlbJL2daTjXdNvN4sZvI7AB
         YeiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMGYU1/L6sQ1FUzI3uUAMPnuLMkVlQHcgwhY6x9x2d3peXGhU8Uk2y5xFdM2QPX5PEF+dPwobypiQA/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyoWrDSAHWlkfYDGrYq72cNI77A2Y2MwLzZoH6+uo7Nviul4nts
	3wAZG4hZFScSEvvmhscPLIvGx9oWSQ19fKRNBktLVzZ1M2tI9Di9LTyCoijQRZnqEtq7p5Y3pEq
	QMVTypO6Mo8yFk/pbrQS0CyCBf44gL13yjNApet2dB5xT2sPa64ungIMlzbFfPI2CIiiD9Mo=
X-Gm-Gg: AZuq6aKOfl8lzhzaEZsaBd2xI1yX+8bUO/TmbjgT6B5QadMbjSeJvEvWt5QlOrkvFiN
	fxR4fw4Fyt6p3noRNRjFsYvgWFAKtqZJ4usVvXpoF+yZPz0jezLNka41h5CAYnP4pkiqRzsdXOp
	tbvw2eFiGCexba1fbrX2dErHStWn4S1tFCdTC5K50BGHXrYb62UQVI4KTAyLGhN7Ad0ND5qfkwi
	H6ipSmeiz1Nh55uIv0Ab7WJXg90tLw1lhK4kFLJoyd4kLtNtTjg7Zgmu1ssVQA98OlGRUFjXiw4
	NZCkh/NmtcTO5w3zAKkm/FAxqtr4KpChm7wTxBgoO8YSRzxG5n0Tcr+iR4M2MaVV3UsqIm481sn
	kufFMiOsz1yFK5dk30rc=
X-Received: by 2002:a05:693c:2289:b0:2a4:3593:ccbb with SMTP id 5a478bee46e88-2b820e4d59cmr181279eec.2.1770057934515;
        Mon, 02 Feb 2026 10:45:34 -0800 (PST)
X-Received: by 2002:a05:693c:2289:b0:2a4:3593:ccbb with SMTP id 5a478bee46e88-2b820e4d59cmr181263eec.2.1770057933918;
        Mon, 02 Feb 2026 10:45:33 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16eab80sm20197175eec.9.2026.02.02.10.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 10:45:33 -0800 (PST)
Date: Mon, 2 Feb 2026 12:45:31 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: pbonzini@redhat.com, corbet@lwn.net, anup@brainfault.org,
        atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, guoren@kernel.org,
        ajones@ventanamicro.com, rkrcmar@ventanamicro.com,
        radim.krcmar@oss.qualcomm.com, linux-doc@vger.kernel.org,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] RISC-V: KVM: Detect and expose supported HGATP
 G-stage modes
Message-ID: <ftdnjnfvmybiskej3txd23mqn3jpjdewmgjxjbap3y4ekj4h4m@d74ihtpclyps>
References: <20260202140716.34323-1-fangyu.yu@linux.alibaba.com>
 <20260202140716.34323-3-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260202140716.34323-3-fangyu.yu@linux.alibaba.com>
X-Proofpoint-ORIG-GUID: QItdpmCuHul-d4j46vwle8kWm1n_iaxq
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=6980f0cf cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=XyLJYK2s2W5OP0ZauVAA:9
 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE0NyBTYWx0ZWRfX7eaoLG0GJwsE
 WUAD1s6K8LyIuW7zEcK3QJmGGo71efYMfsuxCJDi7zhKNc19ubHiRWv9u3MSylrZXxEac2lDXbs
 0waJQmI3dlEWgjAIQiTrtGIwQ9q4VpbUl19cc1+q29aTVEQfVskejAZfphbrfSkTZOKwfTnnGWd
 8FB/KVoKclZ9Onc1LkbcU8WWXfrAD4kl/bRKYLd4BXCvHR18hMrp0KYbfJUrJIGdSVv9M66aCds
 l13N+64evD2oqJgMOpuUxUi5IPfZ6oc6tAv0iE3wWpv9+sersPpRztxBMoAfdVogduv67ToKQ8B
 7arOxK+i9/YIlaNOpnBSW0Ic7kxAkAn99XMjHvNqQQZUmr1wxO/bAXsXOfMw4CbxvML/dIaY1sc
 JUW9RKBDeHh/Wv9vcx3yHUFVNagLNefxLE9CCxcJFiquzy+aoM5VhAvvYAZ63Oo9SII/OazQ+R7
 cH4o3vRDd+v7haqhbnw==
X-Proofpoint-GUID: QItdpmCuHul-d4j46vwle8kWm1n_iaxq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_104537_031251_44B80163 
X-CRM114-Status: GOOD (  30.19  )
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

On Mon, Feb 02, 2026 at 10:07:14PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> Extend kvm_riscv_gstage_mode_detect() to probe all HGATP.MODE values
> supported by the host and record them in a bitmask. Keep tracking the
> maximum supported G-stage page table level for existing internal users.
> 
> Also provide lightweight helpers to retrieve the supported-mode bitmask
> and validate a requested HGATP.MODE against it.
> 
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  arch/riscv/include/asm/kvm_gstage.h | 37 +++++++++++++++++++++++++++
>  arch/riscv/kvm/gstage.c             | 39 ++++++++++++++++-------------
>  2 files changed, 58 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
> index b12605fbca44..c0c5a8b99056 100644
> --- a/arch/riscv/include/asm/kvm_gstage.h
> +++ b/arch/riscv/include/asm/kvm_gstage.h
> @@ -30,6 +30,7 @@ struct kvm_gstage_mapping {
>  #endif
>  
>  extern unsigned long kvm_riscv_gstage_max_pgd_levels;
> +extern u32 kvm_riscv_gstage_mode_mask;
>  
>  #define kvm_riscv_gstage_pgd_xbits	2
>  #define kvm_riscv_gstage_pgd_size	(1UL << (HGATP_PAGE_SHIFT + kvm_riscv_gstage_pgd_xbits))
> @@ -75,4 +76,40 @@ void kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end
>  
>  void kvm_riscv_gstage_mode_detect(void);
>  
> +enum kvm_riscv_hgatp_mode_bit {
> +	HGATP_MODE_SV39X4_BIT = 0,
> +	HGATP_MODE_SV48X4_BIT = 1,
> +	HGATP_MODE_SV57X4_BIT = 2,
> +};

These should be defined in the UAPI, as I see the last patch of the series
does. No need to define them twice.

> +
> +static inline u32 kvm_riscv_get_hgatp_mode_mask(void)
> +{
> +	return kvm_riscv_gstage_mode_mask;
> +}
> +
> +static inline bool kvm_riscv_hgatp_mode_is_valid(unsigned long mode)
> +{
> +#ifdef CONFIG_64BIT
> +	u32 bit;
> +
> +	switch (mode) {
> +	case HGATP_MODE_SV39X4:
> +		bit = HGATP_MODE_SV39X4_BIT;
> +		break;
> +	case HGATP_MODE_SV48X4:
> +		bit = HGATP_MODE_SV48X4_BIT;
> +		break;
> +	case HGATP_MODE_SV57X4:
> +		bit = HGATP_MODE_SV57X4_BIT;
> +		break;
> +	default:
> +		return false;
> +	}
> +
> +	return kvm_riscv_gstage_mode_mask & BIT(bit);
> +#else
> +	return false;
> +#endif

It seems like we're going out of our way to only provide the capability
for rv64. While the cap isn't useful for rv32, having #ifdefs in KVM and
additional paths in kvm userspace is probably worse than just having a
useless HGATP_MODE_SV32X4_BIT that rv32 userspace can set.

> +}
> +
>  #endif
> diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
> index 2d0045f502d1..edbabdac57d8 100644
> --- a/arch/riscv/kvm/gstage.c
> +++ b/arch/riscv/kvm/gstage.c
> @@ -16,6 +16,8 @@ unsigned long kvm_riscv_gstage_max_pgd_levels __ro_after_init = 3;
>  #else
>  unsigned long kvm_riscv_gstage_max_pgd_levels __ro_after_init = 2;
>  #endif
> +/* Bitmask of supported HGATP.MODE (see HGATP_MODE_*_BIT). */
> +u32 kvm_riscv_gstage_mode_mask __ro_after_init;
>  
>  #define gstage_pte_leaf(__ptep)	\
>  	(pte_val(*(__ptep)) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC))
> @@ -315,42 +317,43 @@ void kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end
>  	}
>  }
>  
> +static bool __init kvm_riscv_hgatp_mode_supported(unsigned long mode)
> +{
> +	csr_write(CSR_HGATP, mode << HGATP_MODE_SHIFT);
> +	return ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == mode);
> +}
> +
>  void __init kvm_riscv_gstage_mode_detect(void)
>  {
> +	kvm_riscv_gstage_mode_mask = 0;
> +	kvm_riscv_gstage_max_pgd_levels = 0;
> +
>  #ifdef CONFIG_64BIT
> -	/* Try Sv57x4 G-stage mode */
> -	csr_write(CSR_HGATP, HGATP_MODE_SV57X4 << HGATP_MODE_SHIFT);
> -	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV57X4) {
> -		kvm_riscv_gstage_max_pgd_levels = 5;
> -		goto done;
> +	/* Try Sv39x4 G-stage mode */
> +	if (kvm_riscv_hgatp_mode_supported(HGATP_MODE_SV39X4)) {
> +		kvm_riscv_gstage_mode_mask |= BIT(HGATP_MODE_SV39X4_BIT);
> +		kvm_riscv_gstage_max_pgd_levels = 3;
>  	}
>  
>  	/* Try Sv48x4 G-stage mode */
> -	csr_write(CSR_HGATP, HGATP_MODE_SV48X4 << HGATP_MODE_SHIFT);
> -	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV48X4) {
> +	if (kvm_riscv_hgatp_mode_supported(HGATP_MODE_SV48X4)) {
> +		kvm_riscv_gstage_mode_mask |= BIT(HGATP_MODE_SV48X4_BIT);
>  		kvm_riscv_gstage_max_pgd_levels = 4;
> -		goto done;
>  	}
>  
> -	/* Try Sv39x4 G-stage mode */
> -	csr_write(CSR_HGATP, HGATP_MODE_SV39X4 << HGATP_MODE_SHIFT);
> -	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV39X4) {
> -		kvm_riscv_gstage_max_pgd_levels = 3;
> -		goto done;
> +	/* Try Sv57x4 G-stage mode */
> +	if (kvm_riscv_hgatp_mode_supported(HGATP_MODE_SV57X4)) {
> +		kvm_riscv_gstage_mode_mask |= BIT(HGATP_MODE_SV57X4_BIT);
> +		kvm_riscv_gstage_max_pgd_levels = 5;
>  	}
>  #else /* CONFIG_32BIT */
>  	/* Try Sv32x4 G-stage mode */
>  	csr_write(CSR_HGATP, HGATP_MODE_SV32X4 << HGATP_MODE_SHIFT);
>  	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV32X4) {

Can use kvm_riscv_hgatp_mode_supported() here too.

>  		kvm_riscv_gstage_max_pgd_levels = 2;
> -		goto done;
>  	}
>  #endif
>  
> -	/* KVM depends on !HGATP_MODE_OFF */
> -	kvm_riscv_gstage_max_pgd_levels = 0;
> -
> -done:
>  	csr_write(CSR_HGATP, 0);
>  	kvm_riscv_local_hfence_gvma_all();
>  }
> -- 
> 2.50.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
