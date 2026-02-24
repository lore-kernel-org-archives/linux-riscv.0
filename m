Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5289FF4BB93
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 22:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ajBcugvmnipC1gWOUiEyiNv5c691s3MFgQ89vT1jm/o=; b=AHAnKXjvElhiKC
	HXqtjLmYa4FZbTcJgLDApjDm3rCh1cpTMyAJwqMZPFzyAIXCKtfp38ScKx+ZYsZ8iNz5I3Fcl3jrq
	ilqpkoS9JaNIyqfEGHVwnBbR1sHz8odz73QvEJXlzHPKG/kC4KtSndxvWOoRmB2zh4gkaeuyAQZ+v
	EpqNe4dQRwQpZp548ax/jvvLaP7fQEWZ3CkMO1ezNR0uvKUgMGU59U7LwzIaTtWKO4zPQJfyDy9PG
	9qT11Lk9NvuDGN1g0qIuGDqEsSnX2S6HgEbsoPRB7QlsQQFqqmp+fKJugnKHEvOHpl9DmJ2W2KEis
	m6+RsJIRt+12SbGRUxow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv0ch-00000002qTO-3mka;
	Tue, 24 Feb 2026 22:11:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv0ce-00000002qSa-2zUL
	for linux-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 22:11:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OIG08d3333204
	for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 22:11:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MpuMHOd/Hug9XUMO7ooIdgJu
	G+bQRgf3rD7wfYuWTIk=; b=RNBG68nOWtnkct3pLRXTzFwfqNxyv6vii0G7syYk
	Gc23n86pTdRvIWxNUEXvkzXkaElzJNwoVgMVMtZxbx/E/NeGYlgOznoziDx4Sa5w
	zUpAVvy1V9/L9vWn9jzWTQt1Z5pFvztLL6/hc/IIFpqjXXBbKgy8WkfMO0Ng077J
	5vX35Q9PL64/QejwiMXAGeocTONi4cpet6wS+cGKiaZtO5IxeMhaipCXReiEFTJx
	P4VwUh1HghI7bHRP9SxSPgez2JoRwR9VjBi1gvTlNQN9ahpCvRx52lOTgIGwDqky
	fvdWqraP3OWQbGkde2q56uMrrp4NJNllkbJvo2LiZzeNnQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chh470rpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 22:11:15 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2bdc1b30ac8so1965056eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Feb 2026 14:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771971075; x=1772575875; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MpuMHOd/Hug9XUMO7ooIdgJuG+bQRgf3rD7wfYuWTIk=;
        b=fzVec7s1RM/06FRuDMJvrsMHBmekrBhzC88f8NZjSq7cDnuT/YsAbMiPaqV5oJACg2
         iku1ZnsA1q1R0P/knymMYKAgwhlKQ9qLaX0c2Ot0yxmfK6Ew1tgF9/rlo+2nDR2O2e/t
         sSCS2RIvr24AVdPmonCwMi0eSFJAECEFyI+kIHA3GTZgc2vVCR2W5r9MQ1YbDMB0ZlLs
         3fAS55aloycIu0VXWlS3q3pxY1jX7ysP428b44J12PBuZEPFVo/UBYFUYDNz5tQLDMPW
         t1m+eIS/3vpv0MYm4kjeN9b/gCj5o416E7pIpEsQPD35/TGR0tf8q+jgtATvVte+dNW6
         IshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771971075; x=1772575875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MpuMHOd/Hug9XUMO7ooIdgJuG+bQRgf3rD7wfYuWTIk=;
        b=NTAwr+z7vGD62dU+95eI++gQ1T6xl/KYCfi7AY/wioHTX7XY/kcdOqIHro3A8Ipbm3
         +xw0zdIcEuZTf0CKlykJ581l2ZpHlJ6+ooqWXcILyvnVVWH5Gz5p2VYZq+hWumtAr9LF
         1/9gJumIovgKAypigFdUPJRE0guJUY71MCKLuGUiGXpAFRoRHZCzjnRvfy35JA0xdmzU
         Ez8dlq0ON/+5dO64VPxNQqpfDhYRcngDXs0ATBxZrR7G5HjkiZHf9E4eHDYWHSommBtJ
         BViS8j3fBPzusoAn+JNgc+gAGmYLzh9A5bDS3WcksfsXnCjskfAh2zLPHeQLWrIgqngi
         F9AA==
X-Forwarded-Encrypted: i=1; AJvYcCVuRfEeFiEz5pRTiQ20Ll/56/Chf5fV0NhMV7MuqABKoEPsBCNtetFTSWpW7m24BvuiBelyj5UY5VecWg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyyMXVz+MO2x3sGoszT/dBBFbcB0iTUmIdkbl0II0l6kzWb9Evt
	j3LvQFQenq0jURIKh3PwmP5VLPIQfwgzrHVFudPfKVjJo3qVvlj8vV691OFysYeQxVpMjKJ63pS
	Npwc7qlKMLRIFfMoQWe9HbZJ1koxYrqPpPLOVwS1trEsemF+NR9qZtyCokygrk5HMozATxUY=
X-Gm-Gg: ATEYQzxgFAinigiBG0Z2/rziF9RUluxkyzt04XKlSWEpf5HfxFt8y49qH0FoQ8PhVAe
	JlSb8p21c0a4OHrtoBDf0bztiTugbdapYPMOGM7rF4/X7eCF5t6QcMsPENij61wYv0z0EThtzmH
	PL5tKC/fK/U9KMs7Js/d/FYDqeT1Y9W8DjtoCV6wMuAzmI9e+EdMGViWjVqtW8HsECmVS7OPOqK
	d6mYMQH5BNSHFjgLVF1ylXr07MqF2zR7KKKKiDJRNqZ3FD6KsYaal1NS1URY4GYGKK7Mr8yaK9z
	nRad93nbRNpbi3b3ozWB3PLSvovoRHtQQU1Wask8eFcMWhXEw3RdrzVhd3GTjKe/zzgLfkICpds
	GjaUXF+166kX5JarLSi9Ba48f7Uf+7kg=
X-Received: by 2002:a05:7301:9bc5:b0:2ba:a0c6:ef5d with SMTP id 5a478bee46e88-2bd7bd2a538mr5920099eec.21.1771971075053;
        Tue, 24 Feb 2026 14:11:15 -0800 (PST)
X-Received: by 2002:a05:7301:9bc5:b0:2ba:a0c6:ef5d with SMTP id 5a478bee46e88-2bd7bd2a538mr5920085eec.21.1771971074444;
        Tue, 24 Feb 2026 14:11:14 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7da47778sm7770942eec.6.2026.02.24.14.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 14:11:13 -0800 (PST)
Date: Tue, 24 Feb 2026 16:11:11 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kselftest@vger.kernel.org, Anup Patel <anup@brainfault.org>,
        Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Andrew Jones <ajones@ventanamicro.com>,
        Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH v7 2/3] KVM: selftests: Refactor UAPI tests into
 dedicated function
Message-ID: <bo356uh554twpg2jateqth7rqi7g6uoc26kao3yekcukitg6wc@eeyd2qdjpgff>
References: <20260213103557.3207335-1-xujiakai2025@iscas.ac.cn>
 <20260213103557.3207335-3-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260213103557.3207335-3-xujiakai2025@iscas.ac.cn>
X-Proofpoint-ORIG-GUID: oS6Fly_97AdTWhP2en15S3dtP3Y3jx0x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE5NCBTYWx0ZWRfXynEtMltP9EKT
 EiIFvs7VhmxKLVEBndOi4AYgPwLLh33FnCLOfhS3AYimvdYZhcjIsDr2Ip6/rR+TKV2adKwbnP1
 AUAKbeGYtuQoikL9Msqtft/+OV+wdAwPfT7TSwVExqMllo7P1QAFfLl2MLEnhCVydeLP6ZC9k8z
 S3247l7CnmfvxuFW4SEJVJz+WbycTk5voOJQgNXteeqqCG7FTL4TmW1jDRVGq+Zm47NaojC1RzM
 DWQ77jBGq04ftIYJxNIhSLR63P5oJPjD/wopBVfgBLf1kAhcD18kqn8eOhvPnHTGjeALdWwnrPG
 INzi4ocIQpb+aNXrNVUINtWiAYlrlyvvFotWUrYGDo187IIlzlNebx/IuMR+2mj1ubvAtMu/Pg/
 Y7N3oz2RJjxARvXwQdOemP2qTas61AtxJfGezraggaWePFlZdr4rsPyTSyinPsUUv++Ek5LVec8
 2cQPlxAv6/0QmH6FD/g==
X-Authority-Analysis: v=2.4 cv=fvDRpV4f c=1 sm=1 tr=0 ts=699e2203 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=HySIa_1SWE6k9wrxFvsA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: oS6Fly_97AdTWhP2en15S3dtP3Y3jx0x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602240194
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_141116_785931_22298DB6 
X-CRM114-Status: GOOD (  30.96  )
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

On Fri, Feb 13, 2026 at 10:35:56AM +0000, Jiakai Xu wrote:
> Move steal time UAPI tests from steal_time_init() into a separate
> check_steal_time_uapi() function for better code organization and
> maintainability.
> 
> Previously, x86 and ARM64 architectures performed UAPI validation
> tests within steal_time_init(), mixing initialization logic with
> uapi tests.
> 
> Changes by architecture:
> x86_64:
>   - Extract MSR reserved bits test from steal_time_init()
>   - Move to check_steal_time_uapi() which tests that setting
>     MSR_KVM_STEAL_TIME with KVM_STEAL_RESERVED_MASK fails
> ARM64:
>   - Extract three UAPI tests from steal_time_init():
>     	Device attribute support check
>     	Misaligned IPA rejection (EINVAL)
>     	Duplicate IPA setting rejection (EEXIST)
>   - Move all tests to check_steal_time_uapi()
> RISC-V:
>   - Add empty check_steal_time_uapi() stub for future use
>   - No changes to steal_time_init() (had no tests to extract)
> 
> The new check_steal_time_uapi() function:
>   - Is called once before the per-VCPU test loop
> 
> No functional change intended.
> 

Suggested-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
>  tools/testing/selftests/kvm/steal_time.c | 63 ++++++++++++++++++------
>  1 file changed, 47 insertions(+), 16 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
> index 8edc1fca345ba..a814f6f3f8b41 100644
> --- a/tools/testing/selftests/kvm/steal_time.c
> +++ b/tools/testing/selftests/kvm/steal_time.c
> @@ -69,16 +69,10 @@ static bool is_steal_time_supported(struct kvm_vcpu *vcpu)
>  
>  static void steal_time_init(struct kvm_vcpu *vcpu, uint32_t i)
>  {
> -	int ret;
> -
>  	/* ST_GPA_BASE is identity mapped */
>  	st_gva[i] = (void *)(ST_GPA_BASE + i * STEAL_TIME_SIZE);
>  	sync_global_to_guest(vcpu->vm, st_gva[i]);
>  
> -	ret = _vcpu_set_msr(vcpu, MSR_KVM_STEAL_TIME,
> -			    (ulong)st_gva[i] | KVM_STEAL_RESERVED_MASK);
> -	TEST_ASSERT(ret == 0, "Bad GPA didn't fail");
> -
>  	vcpu_set_msr(vcpu, MSR_KVM_STEAL_TIME, (ulong)st_gva[i] | KVM_MSR_ENABLED);
>  }
>  
> @@ -99,6 +93,18 @@ static void steal_time_dump(struct kvm_vm *vm, uint32_t vcpu_idx)
>  			st->pad[8], st->pad[9], st->pad[10]);
>  }
>  
> +static void check_steal_time_uapi(struct kvm_vcpu *vcpu)
> +{
> +	int ret;
> +
> +	st_gva[0] = (void *)(ST_GPA_BASE);
> +	sync_global_to_guest(vcpu->vm, st_gva[0]);

No need to use st_gva[] and sync_global_to_guest(). For this test we can
just use ST_GPA_BASE directly.

> +
> +	ret = _vcpu_set_msr(vcpu, MSR_KVM_STEAL_TIME,
> +			    (ulong)st_gva[0] | KVM_STEAL_RESERVED_MASK);
> +	TEST_ASSERT(ret == 0, "Bad GPA didn't fail");
> +}
> +
>  #elif defined(__aarch64__)
>  
>  /* PV_TIME_ST must have 64-byte alignment */
> @@ -170,7 +176,6 @@ static void steal_time_init(struct kvm_vcpu *vcpu, uint32_t i)
>  {
>  	struct kvm_vm *vm = vcpu->vm;
>  	uint64_t st_ipa;
> -	int ret;
>  
>  	struct kvm_device_attr dev = {
>  		.group = KVM_ARM_VCPU_PVTIME_CTRL,
> @@ -178,21 +183,12 @@ static void steal_time_init(struct kvm_vcpu *vcpu, uint32_t i)
>  		.addr = (uint64_t)&st_ipa,
>  	};
>  
> -	vcpu_ioctl(vcpu, KVM_HAS_DEVICE_ATTR, &dev);
> -
>  	/* ST_GPA_BASE is identity mapped */
>  	st_gva[i] = (void *)(ST_GPA_BASE + i * STEAL_TIME_SIZE);
>  	sync_global_to_guest(vm, st_gva[i]);
>  
> -	st_ipa = (ulong)st_gva[i] | 1;
> -	ret = __vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &dev);
> -	TEST_ASSERT(ret == -1 && errno == EINVAL, "Bad IPA didn't report EINVAL");
> -
>  	st_ipa = (ulong)st_gva[i];
>  	vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &dev);
> -
> -	ret = __vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &dev);
> -	TEST_ASSERT(ret == -1 && errno == EEXIST, "Set IPA twice without EEXIST");
>  }
>  
>  static void steal_time_dump(struct kvm_vm *vm, uint32_t vcpu_idx)
> @@ -205,6 +201,34 @@ static void steal_time_dump(struct kvm_vm *vm, uint32_t vcpu_idx)
>  	ksft_print_msg("    st_time: %ld\n", st->st_time);
>  }
>  
> +static void check_steal_time_uapi(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_vm *vm = vcpu->vm;
> +	uint64_t st_ipa;
> +	int ret;
> +
> +	struct kvm_device_attr dev = {
> +		.group = KVM_ARM_VCPU_PVTIME_CTRL,
> +		.attr = KVM_ARM_VCPU_PVTIME_IPA,
> +		.addr = (uint64_t)&st_ipa,
> +	};
> +
> +	vcpu_ioctl(vcpu, KVM_HAS_DEVICE_ATTR, &dev);
> +
> +	st_gva[0] = (void *)(ST_GPA_BASE);
> +	sync_global_to_guest(vm, st_gva[0]);

Same comment as above.

> +
> +	st_ipa = (ulong)st_gva[0] | 1;
> +	ret = __vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &dev);
> +	TEST_ASSERT(ret == -1 && errno == EINVAL, "Bad IPA didn't report EINVAL");
> +
> +	st_ipa = (ulong)st_gva[0];
> +	vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &dev);
> +
> +	ret = __vcpu_ioctl(vcpu, KVM_SET_DEVICE_ATTR, &dev);
> +	TEST_ASSERT(ret == -1 && errno == EEXIST, "Set IPA twice without EEXIST");
> +}

Hmm... don't we now fail with EEXIST in arm64's steal_time_init() for i=0 ?
I think the only way to avoid it is to create a temporary vcpu for the uapi
tests which gets thrown away before creating the vcpus for the steal time
tests.

> +
>  #elif defined(__riscv)
>  
>  /* SBI STA shmem must have 64-byte alignment */
> @@ -301,6 +325,11 @@ static void steal_time_dump(struct kvm_vm *vm, uint32_t vcpu_idx)
>  	pr_info("\n");
>  }
>  
> +static void check_steal_time_uapi(struct kvm_vcpu *vcpu)
> +{
> +	/* RISC-V UAPI tests will be added in a subsequent patch */

nit: no need for this comment.

> +}
> +
>  #endif
>  
>  static void *do_steal_time(void *arg)
> @@ -369,6 +398,8 @@ int main(int ac, char **av)
>  	TEST_REQUIRE(is_steal_time_supported(vcpus[0]));
>  	ksft_set_plan(NR_VCPUS);
>  
> +	check_steal_time_uapi(vcpus[0]);
> +
>  	/* Run test on each VCPU */
>  	for (i = 0; i < NR_VCPUS; ++i) {
>  		steal_time_init(vcpus[i], i);
> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
