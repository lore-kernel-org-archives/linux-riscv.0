Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF0C606A321
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Oct 2026 15:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=f78zJ/pQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=lcH6Iba+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BsRLMs5e;
	dkim=neutral header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SMgEeIyV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Subject:Cc:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zr0F6yXogDOvA42QjiJSBdzvdWn0gsl3ca5FrmSmvAk=; b=f78zJ/pQB2RtgVkB82BjWVdCXt
	CMcu2wKHwEZsc7oarCViTPlqBktN+8PQ27afcP6GPqkTlKOU/K1eBNUy/0YNQaR9H9DnhlgvsNNzx
	pMhP7IYxDMtgyANDgYCWq5AjY/bndbZ9jqoJ2LWC7HAI6KbW/A90zwRQgivYtg7L3CpTsffu4OnUn
	/Qtb6897FyOC+AR8TAdXTE0UIdZNW7YeLTNGll+t5txK8DTLeD9bufb8CR9/gynRVp+SQKZhu1gjx
	hoZuNK8aMJH7ranBIe9i9yrFnpbELOSzYvyhz394gXf37q9SwjVE72EhnxvtBc82sBEh9gBgoYDnE
	ZpvaPk+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKHFA-0000000Gbhv-23vG;
	Fri, 23 Oct 2026 15:31:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKHF7-0000000Gbgs-15KF
	for linux-riscv@bombadil.infradead.org;
	Fri, 23 Oct 2026 15:31:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:From:Subject:Cc
	:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZNaGi96jpsEJgcBdqwPHynn/y7akqS1ZiA7apOF+4CQ=; b=lcH6Iba+cWPL0j/UpY7Lsldg06
	7FgDv1CoC4/A91GvJI4zOVNBNjSHpr1cMKplU5g/oBPjfelTjTDBeu1+xsEjID6Q4YkX+Jp9E6fSU
	W/rrL8Crlh9tirLYHK1qjW/5PzNs9mulJcOjP2EGW+kRsIishuKx610Vaw3Ix8yjXe/+QJ7JE6sKC
	lJpbkA9smeCWjQLPV6teewQFwBLD/rcQKbj2QjX6D/IQsbHAhPI6d28ZuoKG2e/N2HbGdlhDihkEs
	QX5Nstyj65Vlm28dmTk1z20v/L5Dl/gs8/QqR9uuQsaHwEam/DpAF+6XeoxKs3CoQ47lhL8/rQUSI
	KSZIXstA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKHF4-00000009xIu-1WeQ
	for linux-riscv@lists.infradead.org;
	Fri, 23 Oct 2026 15:31:40 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6LxP3479713
	for <linux-riscv@lists.infradead.org>; Fri, 23 Oct 2026 15:31:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZNaGi96jpsEJgcBdqwPHynn/y7akqS1ZiA7apOF+4CQ=; b=BsRLMs5ejriH/lIL
	YB0wgFGzAoAsuPOErC2LXvwXzaNy2zgUGBCqEztreE1rQoR8uG2Vda4z6BphVbJP
	s9A8tMgbYc4ssyexAEE80YfipkYOrkmXHRl+zWq95Z2Uy6tgyMvJkeRt0Mr8IZUC
	uDLfTYwXmqKb5dcStOt3upPfcEoBrdWhhxCBNBCdoVOMLhRX4pA0OvNUBCkTDvTl
	TsN3Aj/0yrdsuLtisWNATXENvMRPVp3T382aezpYGYTX+5oHEl9I+C2zU3tE3KvG
	TY/M5ZGaNcYoRfDSDpEdvBl3PyId13ra4ZXhZNDWurndI0Kvp3kJk9b0izTG1OPW
	FBzUFw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfnq0mu6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Fri, 23 Oct 2026 15:31:34 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ea785a4decso10510465ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 23 Oct 2026 08:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769494; x=1793374294; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZNaGi96jpsEJgcBdqwPHynn/y7akqS1ZiA7apOF+4CQ=;
        b=SMgEeIyV/HDAmAuC1VCAssy7lIJqUTbL+p5e8AkNThzrRLCDsNVCbcqsWL7xCzpo+H
         2QgZUVJ7mjex2TDNijYliadu4OegmTC+mcxi55MfKy7OPYIZOOp7cfls1zVj2nZYBbmn
         2SJGsW377qyhDzyX8PYqiSgBiyY8XMFCRiqHtRpgSxicpPo08IRZKkLQV4VxpcQi+yio
         M7jSR4EsCP4jc2qfntzBRtTYuBYXizR0VdQNEV4ZXDQkVsUsGKCgAaEjNieTapTWEarA
         mpf5aYynlrdSpYGyNY6YYG4ko0wNpuOm2cRv376sohGeDxWC+KGoIlbeRvphpfruQWvY
         AYvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769494; x=1793374294;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZNaGi96jpsEJgcBdqwPHynn/y7akqS1ZiA7apOF+4CQ=;
        b=sy6Oq05rA+m1Z2YfSxVvqyH+vMyjOZa8VHhHHyaVnfjvr3jgSR86tdO2HxvwVJuIgT
         maYJQQS4p5qY1LDcZOg1n86Ew+JijdsQM1QBxDXiDlbImEzuLxTz5tclqGNCBWPpnF/u
         c0yLmLfGLZ273czWlE4SlxXLdsLeqhefRipxKAX/5zKw/U9QA3rj2/82+xpQBQlQpPD8
         Ja7uI8QCCtINT0qVvXNQmOb4Shi91MboDhCqxiTvihzGaZNUTA58dC+QxBeJcnNX3npx
         gfd2/SZ0+B/Owq3WmMjJQvRGV9mU4gLGDPfkt925jct6i36jyrF0CHwhE7H51atrfTIP
         OxJQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYIeGQONBzDbm+wfSXw0FRTPOYaZtxuFKXV+RJXPBPAF2TX5Jv4oWQ2Bfs/axkMB3FwnjeeTEhPNRcRA==@lists.infradead.org
X-Gm-Message-State: AFq9FYKo0oJYMxorgQ/tBRdLYjMy2StJhG7MctI14D/lR4+VczaGbIy9
	YO1R17covvw+IydnfCGamWlgSLHjcvLCzaVvN4skOxaOFUP9k116i3YU1gm9eglADyDHaO7OdM0
	LbvDLfhi2lMQEz2rBIxY6qletR87hUEGBDfpHG6mfi7S1t+v2hGzFwz7drirDzZig+vUuDWY=
X-Gm-Gg: AYBFou2iRMlseF7+tdYTBsZGJTWSnVjTk9T0opbzVqqj4kJFY/Lw/no4Vbvqrqbgeyj
	bpwqB24rTrrVkHGlTsJQRbcBCRvKU2UWNH9oAZf9t9H+QTIoWmlXvBfxeLANVIUNqaLC58rsSPK
	Zd3oVf+aXWW3DfexXabCOXmeTsQUacsXEs8BxSA5pAoLhGiXpnQHoH5QuQX6kaWGmRtJikpjhRr
	fAIiF9UZ7ez55YTOrJV73PtwxdEmOTRqbkgAS4jubwUIzv3iw1oxVb7WBE1dnBz5UVHp5X3Xb2B
	oe2vMoySrDO9JzqRzTTmGpTrWt49yj+zV290ECmT75WTCMaEbbT4PXfoBx6sndGZEomgj8cXb9p
	Rs7OIB2rEweWhAW8UN6WbABbM1PfrspUx
X-Received: by 2002:a17:902:e848:b0:2e9:743a:7a9d with SMTP id d9443c01a7336-2ea7c28b349mr20823095ad.13.1792769493505;
        Fri, 23 Oct 2026 08:31:33 -0700 (PDT)
X-Received: by 2002:a17:902:e848:b0:2e9:743a:7a9d with SMTP id d9443c01a7336-2ea7c28b349mr20822755ad.13.1792769492870;
        Fri, 23 Oct 2026 08:31:32 -0700 (PDT)
Received: from localhost ([155.117.96.35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea947ac357sm1667205ad.76.2026.10.23.08.31.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 08:31:32 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Fri, 23 Oct 2026 23:31:26 +0800
Message-Id: <DMCBQSJ0B22A.2TDXAXPJNPZL2@oss.qualcomm.com>
To: "slack up" <yxcnew@outlook.com>, "Anup Patel" <anup@brainfault.org>,
        "Atish Patra" <atish.patra@linux.dev>,
        "Paul Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt" <palmer@dabbelt.com>,
        "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
        "Andy Chiu" <tchiu@tenstorrent.com>,
        "Yong-Xuan Wang" <yongxuan.wang@sifive.com>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>,
        "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH] RISC-V: KVM: Fix builds without CONFIG_RISCV_ISA_V
From: "Ze Huang" <ze.huang@oss.qualcomm.com>
X-Mailer: aerc 0.22.0.r35.g0a434803
References: <OSQPR01MB6326DDE9C2F390EA3F0F444EC2662@OSQPR01MB6326.apcprd01.prod.exchangelabs.com>
In-Reply-To: <OSQPR01MB6326DDE9C2F390EA3F0F444EC2662@OSQPR01MB6326.apcprd01.prod.exchangelabs.com>
X-Proofpoint-ORIG-GUID: 3jjGIOTg2T2V8vj_nZ0tKf13i6Z_uxRo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX815B1+Ijkr1j
 nFkbRGaHg/f1rl3xsJbaqE2JP9aFtz3xMneG5rXywsWTGxVliXxFlx2qa8e0pN9ck2E/4GGljgi
 mFBJptlnFa2RLT1AtSLX0xgKXhnjIW/+H9yQP99z3gSC9jWRM8ZRviltN68C3vCzDn8EJuMxImj
 xfGjNKjtcTk0M+HVq4yc3C02ilSXx8QAi8qigCMORjUjZQAE6+1NJ5TH31jvIdblVtAn7mTfo8G
 EpHQakC5CNCBJzYryif3A/zYzWuGrb94SfHxTgpVg6paXgcX/AjU3NuVuK7trsY9uaWOxDnU8TF
 ycX3KRyvkrX26G2ygu/wpNoqckGUxTlTxWS02sJdYgUuH81X4Pl7AgiC4b2Dc1fWh/dPfRqm1zt
 k3bLWMlg1TVTUgGmhwzCprImGuKmZwc8eUiBxXXGSkVs7ZBXIx80kbfQfgBiFroqvz9iXslaLvl
 SWMx6MVRC5Q59pKhYxA==
X-Proofpoint-GUID: 3jjGIOTg2T2V8vj_nZ0tKf13i6Z_uxRo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MCBTYWx0ZWRfX2XrpR5Zxj81y
 RGoRfS3Yns3x2y6Ms5AJ5hgO8mQIhnHCYhzBRNmniSAPpYuWNvbfrMwCrX2ABZ94U4s+3oE0j52
 UcLK9ajvG3bDerSV5FNXwnJywP872Rw=
X-Authority-Analysis: v=2.4 cv=UaHE26SN c=1 sm=1 tr=0 ts=6adb7dd6 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ilsi1XWDFcrB9FjxRIUvHg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=UqCG9HQmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=B-Qh9SJ9cMKcPyFv0BMA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_163138_670662_F13BED43 
X-CRM114-Status: GOOD (  22.63  )
X-Spam-Score: -0.9 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu Oct 22, 2026 at 1:31 AM CST, slack up wrote:
> From: Xiaochun Yu <yxcnew@outlook.com>
>
> Commit b5060a4aa33d ("RISC-V: KVM: fix vcpu vector context
> handling for kernel-mode vector") made the KVM vCPU load and put paths
> call get_cpu_vector_context() and put_cpu_vector_context()
> unconditionally.  It also added an unconditional call to
> __kvm_riscv_vector_restore() on the guest entry path.
>
> The no-op definitions of the first two helpers live in <asm/vector.h>,
> but <asm/kvm_vcpu_vector.h> includes that header only when
> CONFIG_RISCV_ISA_V is enabled.  The KVM header also does not provide a
> no-op __kvm_riscv_vector_restore() in its disabled branch.  As a result,
> a KVM build without CONFIG_RISCV_ISA_V fails with missing helper
> declarations.
>
> Include <asm/vector.h> unconditionally to reuse its existing no-op
> helpers, and provide the missing KVM restore stub when Vector support is
> disabled.  This does not change the Vector-enabled path.
>
> Fixes: b5060a4aa33d ("RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xiaochun Yu <yxcnew@outlook.com>
> ---
> This single patch fixes a build regression when KVM is enabled without the
> RISC-V Vector extension.
>
> Tested on base a804c5742bff (Torvalds master):
>
> - CONFIG_RISCV_ISA_V=n, CONFIG_KVM=m: full Image modules build passed.
> - CONFIG_RISCV_ISA_V=y, CONFIG_KVM=m: vcpu.o and vcpu_vector.o rebuilt.

Tested-by: Ze Huang <ze.huang@oss.qualcomm.com>

Tested on commit a804c5742bff with gcc 16.2.1 and clang 23.1.3:

CONFIG_RISCV_ISA_V=n, CONFIG_KVM=m: full Image + modules build passes
(before the patch: 3 implicit-declaration errors with gcc, 5 with clang)

> ---
>  arch/riscv/include/asm/kvm_vcpu_vector.h | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/include/asm/kvm_vcpu_vector.h
> index 6371d5ea5392..ebc619ed67dd 100644
> --- a/arch/riscv/include/asm/kvm_vcpu_vector.h
> +++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
> @@ -11,9 +11,9 @@
>  #define __KVM_VCPU_RISCV_VECTOR_H
>  
>  #include <linux/types.h>
> +#include <asm/vector.h>
>  
>  #ifdef CONFIG_RISCV_ISA_V
> -#include <asm/vector.h>
>  #include <asm/kvm_host.h>
>  
>  static __always_inline void __kvm_riscv_vector_save(struct kvm_cpu_context *context)
> @@ -55,6 +55,10 @@ static inline void kvm_riscv_v_exit(void)
>  
>  struct kvm_cpu_context;
>  
> +static inline void __kvm_riscv_vector_restore(struct kvm_cpu_context *context)
> +{
> +}
> +
>  static inline void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
>  {
>  }
>
> ---
> base-commit: a804c5742bff224d4cb4d25dd383554d598be32b
> change-id: 20261021-ospp-c1-b4-submit-e22dc09faf5a
>
> Best regards,



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
