Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E8ED73E80
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 17:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wfFjsaBvx6oef8drgsEgIgifzmFGEXzpIKoSWQ/x/aw=; b=1l2DuP0zueDTWd
	Z7Kz6PF59BX+zquVedrJQM8/soY16eJhOVIV5xLTxrb7Wh/Y/Gd2qKv4FUHp24aeyZWVA79rhy8Mz
	FKL0/U9eRCYeNZLA9keotuWV3G+iooa6YTnGJS9vPs2RwkjGqhG/RrxDERCwCttr8oApMb3fIZmOR
	dESxigTqFahAVvKnmlEL+MqLfEw+AZjhX22mTJawNsMA7x46c3Y3roegSMGXb66DOp9IyqKNVIdTk
	R56ooa1BbFjut62XYUPN0NmZbKnTvHsi+AyGWsBiXpFm3siOb1Os7qPwJmO2WjDwocu4lD/Vw0gnu
	w2HCLa+gVbVMlbdVmUSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlW0H-00000000SOZ-1gzq;
	Thu, 29 Jan 2026 17:40:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlW0F-00000000SNe-2IMb
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 17:40:24 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60THdov23712060
	for <linux-riscv@lists.infradead.org>; Thu, 29 Jan 2026 17:40:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X7MOImJj+nJlLfYhfSrfFXuD7mz/bcT1kMUBG+e2q/g=; b=f7V7Hx79jkuVVvVr
	I3cL1XQ68fPAOX24673vkTDdAOoC1EHZZgyJDUv495w0gl5j8bxtYrHw/jT1JpwH
	RRflRq295ifnjRKV1bKN7aMA+1rBb98hcmGsZFXJ+ymi8Ph7RXYB7J/KuNimU4AV
	ndEEeSl5h6ZWF+brJjlshuUN8pnRsl30aL19U1UNoSQf5jqQtw5LhpPi0Urj1+H9
	AFrFTZ4O1+3CiO7hOANxU/BuaxF03hJiXgSYSJRgzIypXdszXMMaWBS6K4Ef1Sv3
	Raie5SYbYv1mN6xTlOj9UPE8z760GiThwxWm0xIHuvgahfHQfOUsSgJbf9QDNFmw
	SHTLbA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byxcuawtj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 29 Jan 2026 17:40:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6deddd7f7so317368085a.3
        for <linux-riscv@lists.infradead.org>; Thu, 29 Jan 2026 09:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769708422; x=1770313222; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7MOImJj+nJlLfYhfSrfFXuD7mz/bcT1kMUBG+e2q/g=;
        b=SvMUhmbG/IKEHmK6O6Th+vOPx1AIXRgy4GqV19sMgY55XfO84tAc8w+lSSet40TIFM
         YeEIrvIMb/Kd4sLcW+LGlm84UL/XW+Oo5bvITmsm3ujx7bStIOtyX7gUQP2X1+GwZvM/
         PVX7rXQ0yQqTUFv9FHEYullwdYtmgvFQnmpRd/USf2rnkdVI8Hwp1vrpaF19KwLc+xBo
         tBLqVTniCeoFdxw9mtKarHkHnEioCkaPlE6Hq0AINKNfGLOJC5SgNqc6Hhk6KrGn4X0b
         Gf7TJQNQtTTVlwoFG7Lxs3jSSssnYoBz9JgZJRrpalOsK3wUu76jb6zoyzvXHN5tfBBB
         Cwzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769708422; x=1770313222;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X7MOImJj+nJlLfYhfSrfFXuD7mz/bcT1kMUBG+e2q/g=;
        b=VuxoNNf7+965dI+EXyP9svk4MPUfvmFMKVad/PzPp3EQycgCsF/HVjASHZbrTJb1Z/
         FjGOZPifH/tFZZK51L29bFg70emuktT965PaXl4q2POu7bd07pH3LJGi2iHQscdbCHWJ
         CrrM1HntWifI3UeOOfEe/HwNurDIUU2pWhQ/NtpV7yxCZxhOup0rwwocEYTJOYmv54/V
         1ZhwNXz64ZDFjx8vRuj3Nihwe9NU99ohAYJH+NTghfvoHbHCgEDCA7Tvnahhk8yJRmVU
         aNqLB5R39PBgBMW4BQbgliBK8qiQlmJeqms8TtKrNCB4b6V7O/WYBnnxFYWaaFFJnd8z
         Uy1A==
X-Forwarded-Encrypted: i=1; AJvYcCUJGRJD8hNxxuvO+0ctLlpqs58xP5xuK3hw/mZylvJR3LEJvDlIthcmu5yjWokUcrHmyeJlGBvg6fcOjQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzv2AsfRIc6xvnWsOlGPMyjRrB59AqxrI2QCrUGcjNsJxxGNPTa
	9SZI6zHbJS1GqRIX0r8/1uDHPnXEYXCLdilEdaQ66egWb8QsQsuMfKokoFmtE7U8J86OlEcwzTN
	pQRHdhNGmTa6O7x1ZBtNfoAaQDyDsOPrg18xd5SoB+iEASiLUYXUwJHo22qYGHEfmyJcxrVU=
X-Gm-Gg: AZuq6aK7qyqrkrqFptRRdo3D/dpND6FjhOYdESC5S+1oRa16tEHLEt5Vfrc8MR2jOQS
	hPZwH6cElChQ8CEDN81Nf/4mJ5M6GCaoPrWGKioYLZffa6n34oOruXRanvybfCDK8JvG713yHmZ
	HzfuB1bVB1jZocJ1p/hx1WyDhLhaub73RrOpLGiY3Bthe1KdaokUCYt9qsu2vH+i0SJVVg3BQ83
	XqGIUdl/2ftC25K/QTCgMRucFdurI4vyKAD2gIQnSvCO8wvH0bT7SIyH9hdvcEhlhTMNZnVRb9A
	FPiIpl/c3v2uVT0xPZoIbnvAnxAkpWhc0HBY2kHFhnl9Q7d4ifvBaK9p4G97eosFWuILzolJIXz
	ALJHl/pzwtxCjwFDVMIubSdG2YGGlPM4wlsCRswvFzBnYz8Hw
X-Received: by 2002:a05:620a:7103:b0:8c5:378f:4def with SMTP id af79cd13be357-8c9eb320122mr57575185a.77.1769708420634;
        Thu, 29 Jan 2026 09:40:20 -0800 (PST)
X-Received: by 2002:a05:620a:7103:b0:8c5:378f:4def with SMTP id af79cd13be357-8c9eb320122mr57568485a.77.1769708419892;
        Thu, 29 Jan 2026 09:40:19 -0800 (PST)
Received: from localhost (ip-86-49-253-11.bb.vodafone.cz. [86.49.253.11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-480705956f1sm111648965e9.11.2026.01.29.09.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 09:40:19 -0800 (PST)
Mime-Version: 1.0
Date: Thu, 29 Jan 2026 17:40:17 +0000
Message-Id: <DG199ZOUMRND.1RTVHMI6L9U5L@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/2] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
Cc: <guoren@kernel.org>, <ajones@ventanamicro.com>,
        <kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
To: <fangyu.yu@linux.alibaba.com>, <pbonzini@redhat.com>, <corbet@lwn.net>,
        <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <andrew.jones@oss.qualcomm.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20260125150450.27068-1-fangyu.yu@linux.alibaba.com>
 <20260125150450.27068-3-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260125150450.27068-3-fangyu.yu@linux.alibaba.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDEyNSBTYWx0ZWRfX6OJTV3EJjzWL
 5fdmsJoW5VnVITinIA3QlT6BxkXloPvbS2hLVc1BV++YhRFeK45S0gTo2LUA1KbJCIQMxLwDhkP
 kx03VwjGDJswNHboIYyCPSBHhJZ3iQFD5FMNR4jXS5BOx0pl20bB6r3BDfOd6dMpQfCqBLLLZ+Z
 yZmuy4vbs2DFAKTd3Rf+EvYlVSMiAkK3O+3izcGn1giLWvCrsLRnrNoqcvvd0rcYlXf6hrKZVBd
 bIdH7PqzQBkCcDDPAst7teoTZin2EnkC2S6ncksrXT4j27CINGt1Jz8/32rb0n1hw7A3QUpfA8T
 JUCjatIh3ptO4z0InzYSY1+a8IUtHvsJnDvFWB4nP31aTnwv5bPThsF0qJt7takhDsgqfhSD5FH
 qyDJtxoX1lDT7wRIQ60zp2HGBDyC/lmhC40ri1wKaCgNEl4Tfmvrmygp1qrRtZIPhvhOAwBp6ll
 +MsDU3/8ry2y+/Q7TzA==
X-Authority-Analysis: v=2.4 cv=QpRTHFyd c=1 sm=1 tr=0 ts=697b9b86 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=HFCiZzTCIv7qJCpyeE1rag==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=Cpfndy8aBPzOrYTrbFgA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: l1uxKc-wmK2JoOHY1KI-z6G2x7jTqm-O
X-Proofpoint-ORIG-GUID: l1uxKc-wmK2JoOHY1KI-z6G2x7jTqm-O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_094023_584743_FE07275B 
X-CRM114-Status: GOOD (  25.83  )
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

2026-01-25T23:04:50+08:00, <fangyu.yu@linux.alibaba.com>:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>
> This capability allows userspace to explicitly select the HGATP mode
> for the VM. The selected mode must be less than or equal to the max
> HGATP mode supported by the hardware. This capability must be enabled
> before creating any vCPUs, and can only be set once per VM.
>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  Documentation/virt/kvm/api.rst | 18 ++++++++++++++++++
>  arch/riscv/kvm/vm.c            | 26 ++++++++++++++++++++++++--
>  include/uapi/linux/kvm.h       |  1 +
>  3 files changed, 43 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> @@ -8765,6 +8765,24 @@ helpful if user space wants to emulate instructions which are not
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
> +    non-empty memslots, or if the capability has already been set for the VM.
> +
> +This capability allows userspace to explicitly select the HGATP mode for
> +the VM. The selected mode must be less than or equal to the maximum HGATP
> +mode supported by the hardware.

"The selected mode must be supported by both KVM and hardware."

(The comparison is a technical detail, and incorrect too since the value
 is bouded from the bottom as well.)

>                                  This capability must be enabled before
> +creating any vCPUs, and can only be set once per VM.

                     ^ "or memslots"

> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> @@ -202,6 +202,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  	case KVM_CAP_VM_GPA_BITS:
>  		r = kvm_riscv_gstage_gpa_bits(&kvm->arch);
>  		break;
> +	case KVM_CAP_RISCV_SET_HGATP_MODE:
> +		r = IS_ENABLED(CONFIG_64BIT) ? 1 : 0;

Maybe we can return the currently selected mode for a bit of extra info?
Another nice option would be to return a bitmask of all supported modes.

I think userspace has otherwise no reason to call it, since it's fine to
just try enable and handle the -EINVAL as "don't care".
1 syscall instead of 2.

> @@ -212,12 +215,31 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  
>  int kvm_vm_ioctl_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
>  {
> +	case KVM_CAP_RISCV_SET_HGATP_MODE:
> +#ifdef CONFIG_64BIT
> +		if (cap->args[0] < HGATP_MODE_SV39X4 ||
> +		    cap->args[0] > kvm_riscv_gstage_mode(kvm_riscv_gstage_max_pgd_levels))
> +			return -EINVAL;
> +
> +		if (kvm->arch.gstage_mode_user_initialized || kvm->created_vcpus ||
> +		    !kvm_are_all_memslots_empty(kvm))
> +			return -EBUSY;
> +
> +		kvm->arch.gstage_mode_user_initialized = true;

No need to have gstage_mode_user_initialized, since if the user could
have changed it once, there shouldn't be an issue in changing it again.
It's the other protections that must work.

> +		kvm->arch.kvm_riscv_gstage_pgd_levels =
> +				3 + cap->args[0] - HGATP_MODE_SV39X4;
> +		kvm_debug("VM (vmid:%lu) using SV%lluX4 G-stage page table format\n",
> +			  kvm->arch.vmid.vmid,
> +			  39 + (cap->args[0] - HGATP_MODE_SV39X4) * 9);

(I don't think this debug message is going to be useful after a short
 debugging period, and it would clog the log on each VM launch, so I'd
 rather get rid of it.)

Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
