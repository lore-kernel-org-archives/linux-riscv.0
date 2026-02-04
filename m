Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06281E9D3FB
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 15:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gltp6rQP7oeQZxvG6CB31FeQk20N+Mszi5ljBMV+lFU=; b=JVB7x2NSTOPW0M
	aJ3s46zC8yd20JY5s/pXjmwXOJPGTZX3ks2PnfxkfesMm1epNRazOXv7N2CadXFe9GSHrPHS9tG/d
	izXJvcpv7UTo3K+AmrHah1emCCrI+BnMmekO+zjJ3pNDI9bMfq/joaXPEuStJ7JEO6toYk2LLLiFI
	91R7vdy2+/ZIDRAeHbhZYmXJgMx0gkBbMA93w7uRrY3sWzRVTebBIc8W/J6n2HQV9x7HJdQ3Mptrx
	K7xfXxTxRBC09PgNbemp+B8eDclt5c1sNFYpLTIyyXSv+tC7IOGbDDtIsRe+05kW+vBOQhmmFesqP
	fZv1O3mSKqKgBjYmlzDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnerZ-00000008fiT-0wvh;
	Wed, 04 Feb 2026 15:32:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnerX-00000008fhj-0NGO
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 15:32:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIO3T2159347
	for <linux-riscv@lists.infradead.org>; Wed, 4 Feb 2026 15:32:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Bi4g99czQrt2gJHSucwRU9Ng
	jJmZN0TE+9w+nsNMdA4=; b=U94BpjJSBKk18ZTtVDUHRaUn1pI65boZWx5o8lUP
	bI0SpeiXzNAsbpv6LuAeNh58LThBHrP2KPOz/tnpTAQhWUb5MYTO0HHlNnaI/zKY
	+bCuPdaSLYQjt8UBYbT5SLWv6bxVcWd0oU8Z4DQ+IHx4ATCbLDfdKUzua7IJlIBq
	oPCYyq77dVQaCeQCcoVH8LMPDWJk3VcdnWiGDvvlYJUJ3SGl+CWI5VaB4wetx67d
	DyWWl3qDwrlSKm6IX5GAR/ZCZJj8ptxkIDPMKXj9u4KZGVRCZ9IfwnwuqCS8Xie7
	QBPleBDsSTTuiu11R68/glAKNlPFH0/wW99w5IR2wZuPhA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c45nvgms1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Wed, 04 Feb 2026 15:32:14 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-124743cf760so25384600c88.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Feb 2026 07:32:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770219134; x=1770823934; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bi4g99czQrt2gJHSucwRU9NgjJmZN0TE+9w+nsNMdA4=;
        b=QcVuaOjqtrJ0dlV1Onbd7U+EaKnk81aD08YhHOKLtzMmhprChAXOJZbPvSVcqRwRNz
         NiobWrqnJn+TxHbLo3TpxHBAv8VdSufq6X4rLgQbFlKGQgbYX9vnoSUdBP3e3h4k8eTw
         7l7KYFPEPrLqfXq40SV+/6dlO3k6O3g/S80cpBlX8IIbtGsb01vd5qT5bfrRRctkuovC
         dnFcVPExO1dJUI5A8wJ48A3jmP2jbG+mNVfDhf1oGccidt0a2LQ6U2YV1Z1I2VC8epIp
         uFMRyT3w0FfAerebyP4GLd3Q5yXi+QGY+ZeLQyE6HnNxQDPtiRfLD4GGSeGE4CVV71lj
         g+rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770219134; x=1770823934;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bi4g99czQrt2gJHSucwRU9NgjJmZN0TE+9w+nsNMdA4=;
        b=PJI0eaUgQxmqnc4EusAyGPQ9G3bYyc1GKMJfggbl9j8cXyo9NXFHKWWYlF3Wh1+Uj0
         o5tdXd4MAw8q+iB7VQhr987RLCa6wEMoalLuWVBpIX8WbqFp9qbr13IEaur2zKPt/N3y
         3kspmppxKEiOrTUI/N5akEEaJQn8ajbRRYNtyfbdcA/v2i7I6A/xFiAFmtL+WQEDZrsc
         X4oCrXJ1NyT1b6Sf4qDatr3qTbGoa3ITQk27glPC4cu7lV1iAPzllInyw8I6O5ssc3Oo
         zcokm/sZMV5Vv3wrg+1F14/dzoXsnRCh6vC0c/5kB2dZ7JIEKtsz0NyLz4hYyU971SeL
         pXUQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/qLRq2ArQrun1Hv3+0dKw68FMJxoKPicmPz0SgGp4EFbc+K5zVyuAtT0eHPYRQdhouQ4OxVpitsZ5Vw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw1hOcFj06IxyQSeJFSNnzUm3U6r1nvBZaAhvGQYiYolBHOClA
	m1rzCwDyQbwQNM5uQESyFLQBzQbH76jmXagzNOSqhyacGVkkoBPEESlBif01f17sx/CHzuGPw/9
	gc1HiaCjJwY3M4GBHCBHYhZtP8W7X2WSoM8r0AmG6FiBT7gXPav2CEuh78UHo1ZkIU8W/Zo8=
X-Gm-Gg: AZuq6aIfpsEJx6s/F+y8UC40bgRnAj3dps0CdJLHTEUVg8d/rPI11I20dbJ+6JG8afd
	zrGlRZB2AWbFaj2wghYuA6lb2LfD2LT75fytfm1y78/7eiEbcqMKkZLjhfcYQVEb7a3jlvTN2ka
	R8oLtRqFS3LhLoG/1Hx0u1qrSUUTl1JK4tMuN6p8yoi4kagcADOkadU/+iOOhsCWrkjH7cnbXBF
	Ki2Rc6+BYtlOA5kkmX5JQDzNh+QSsYvfUgI92E5GRnmlEyF6CD7h7GJ9UdgcfNWbyZLX5GyR0xO
	eCUlQCzAGFLqxo9007zvSVukchbihc0pFjH3j7eY/v3mZkUU/3u/FQQDNE7SyIjKTX7/IWds+2t
	zKmddw9uamMpQjEq51h4=
X-Received: by 2002:a05:7022:41a5:b0:119:e56b:c74d with SMTP id a92af1059eb24-126f477ec7dmr1578524c88.18.1770219133730;
        Wed, 04 Feb 2026 07:32:13 -0800 (PST)
X-Received: by 2002:a05:7022:41a5:b0:119:e56b:c74d with SMTP id a92af1059eb24-126f477ec7dmr1578502c88.18.1770219133062;
        Wed, 04 Feb 2026 07:32:13 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832faea55sm1748208eec.23.2026.02.04.07.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 07:32:12 -0800 (PST)
Date: Wed, 4 Feb 2026 09:32:10 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: pbonzini@redhat.com, corbet@lwn.net, anup@brainfault.org,
        atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, guoren@kernel.org,
        radim.krcmar@oss.qualcomm.com, linux-doc@vger.kernel.org,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
Message-ID: <ocfqo4zpsg6yyaz6kd65jrvudtb35uerdsueazqdk6w7c5lvdf@wvwzhc57gxez>
References: <20260204134507.33912-1-fangyu.yu@linux.alibaba.com>
 <20260204134507.33912-4-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260204134507.33912-4-fangyu.yu@linux.alibaba.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDExOCBTYWx0ZWRfXyYe7ByY2IGnf
 9tGW2P7nGprTiA0vHt+IldqHcpBxCPiqQgmQEZVa0BDmwNhsapwh2g2M82VJwcc/Mqn7THWROj9
 q5fraobNDYGrnCUo0zDLhtUppr1PCRf8aI9cBZWwc9uY0PFGiIDkCqPebdVYH4vtWZRpstIEEI8
 zzFLIG0HtnGG49AKjFB6YGsAAUuOQhtbTJYzDGI5zEh8Md/GzJK5TLSEkiSYjZjEGJmdj7enkiY
 JlpUxe3PqgcOBPwprHynYseFsBXjXr8tVCsqYideX/g8HwtA0prJO+UlpqLH+ZqbNnFhaD+G5yx
 radlr1gwv6tWspklDKEeAZliQilfQZaEwtVdgktfa6glqQk3woTIlNtMZ76ruqQeXWzxZpaGfAI
 GPWB1F01dwaxZfj/Hhg8xDrmDahjGoFgXvGwiEGbdrc6E4EXeaVHA8X8FUUb+DVAV2cedRsf08R
 JXyrBtbezJ695csCqDg==
X-Authority-Analysis: v=2.4 cv=DLmCIiNb c=1 sm=1 tr=0 ts=6983667e cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=JHdZcz8r7pWqP9VHEEMA:9
 a=CjuIK1q_8ugA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: P0g-cAATorvA9v2so00dTIUHMJmgM_k-
X-Proofpoint-ORIG-GUID: P0g-cAATorvA9v2so00dTIUHMJmgM_k-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_04,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_073215_128755_D0BA698F 
X-CRM114-Status: GOOD (  34.11  )
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

On Wed, Feb 04, 2026 at 09:45:07PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> Add a VM capability that allows userspace to select the G-stage page table
> format by setting HGATP.MODE on a per-VM basis.
> 
> Userspace enables the capability via KVM_ENABLE_CAP, passing the requested
> HGATP.MODE in args[0]. The request is rejected with -EINVAL if the mode is
> not supported by the host, and with -EBUSY if the VM has already been
> committed (e.g. vCPUs have been created or any memslot is populated).
> 
> KVM_CHECK_EXTENSION(KVM_CAP_RISCV_SET_HGATP_MODE) returns a bitmask of the
> HGATP.MODE formats supported by the host.
> 
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  Documentation/virt/kvm/api.rst | 27 +++++++++++++++++++++++++++
>  arch/riscv/kvm/vm.c            | 19 +++++++++++++++++--
>  include/uapi/linux/kvm.h       |  1 +
>  3 files changed, 45 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 01a3abef8abb..62dc120857c1 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -8765,6 +8765,33 @@ helpful if user space wants to emulate instructions which are not
>  This capability can be enabled dynamically even if VCPUs were already
>  created and are running.
>  
> +7.47 KVM_CAP_RISCV_SET_HGATP_MODE
> +---------------------------------
> +
> +:Architectures: riscv
> +:Type: VM
> +:Parameters: args[0] contains the requested HGATP mode
> +:Returns:
> +  - 0 on success.
> +  - -EINVAL if args[0] is outside the range of HGATP modes supported by the
> +    hardware.
> +  - -EBUSY if vCPUs have already been created for the VM, if the VM has any
> +    non-empty memslots.
> +

Currently the documentation for KVM_SET_ONE_REG has this for EBUSY

  EBUSY    (riscv) changing register value not allowed after the vcpu
           has run at least once

I suggest we update the KVM_SET_ONE_REG EBUSY description to say

(riscv) changing register value not allowed. This may occur after the vcpu
has run at least once or when other setup has completed which depends on
the value of the register.

> +This capability allows userspace to explicitly select the HGATP mode for
> +the VM. The selected mode must be supported by both KVM and hardware. This
> +capability must be enabled before creating any vCPUs or memslots.
> +
> +If this capability is not enabled, KVM will select the default HGATP mode
> +automatically. The default is the highest HGATP.MODE value supported by
> +hardware.
> +
> +``KVM_CHECK_EXTENSION(KVM_CAP_RISCV_SET_HGATP_MODE)`` returns a bitmask of
> +HGATP.MODE values supported by the host. A return value of 0 indicates that
> +the capability is not supported. Supported-mode bitmask use HGATP.MODE
> +encodings as defined by the RISC-V privileged specification, such as Sv39x4
> +corresponds to HGATP.MODE=8, so userspace should test bitmask & BIT(8).
> +
>  8. Other capabilities.
>  ======================
>  
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> index 4b2156df40fc..7d1e1d257df5 100644
> --- a/arch/riscv/kvm/vm.c
> +++ b/arch/riscv/kvm/vm.c
> @@ -202,6 +202,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  	case KVM_CAP_VM_GPA_BITS:
>  		r = kvm_riscv_gstage_gpa_bits(&kvm->arch);
>  		break;
> +	case KVM_CAP_RISCV_SET_HGATP_MODE:
> +		r = kvm_riscv_get_hgatp_mode_mask();
> +		break;
>  	default:
>  		r = 0;
>  		break;
> @@ -212,12 +215,24 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  
>  int kvm_vm_ioctl_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
>  {
> +	if (cap->flags)
> +		return -EINVAL;
> +
>  	switch (cap->cap) {
>  	case KVM_CAP_RISCV_MP_STATE_RESET:
> -		if (cap->flags)
> -			return -EINVAL;
>  		kvm->arch.mp_state_reset = true;
>  		return 0;
> +	case KVM_CAP_RISCV_SET_HGATP_MODE:
> +		if (!kvm_riscv_hgatp_mode_is_valid(cap->args[0]))
> +			return -EINVAL;
> +
> +		if (kvm->created_vcpus || !kvm_are_all_memslots_empty(kvm))
> +			return -EBUSY;
> +#ifdef CONFIG_64BIT
> +		kvm->arch.kvm_riscv_gstage_pgd_levels =
> +				3 + cap->args[0] - HGATP_MODE_SV39X4;
> +#endif

 'if (IS_ENABLED(CONFIG_64BIT))' is preferred to the #ifdef.

> +		return 0;
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index dddb781b0507..00c02a880518 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -974,6 +974,7 @@ struct kvm_enable_cap {
>  #define KVM_CAP_GUEST_MEMFD_FLAGS 244
>  #define KVM_CAP_ARM_SEA_TO_USER 245
>  #define KVM_CAP_S390_USER_OPEREXEC 246
> +#define KVM_CAP_RISCV_SET_HGATP_MODE 247
>  
>  struct kvm_irq_routing_irqchip {
>  	__u32 irqchip;
> -- 
> 2.50.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
