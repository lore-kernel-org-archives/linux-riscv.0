Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B482BFD9E0C
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 19:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wzc/k5NAQU9hDFq4iDBaVzyzikm2l0jt7o2wIAB22L0=; b=q1NiXVj0kYNlhw
	QKC1BFKBKRDJfR8fLgBC1an6deWiXALB5EOjfXPS1pcnrwZF9bLTNCiITGienoklSy08+a0ohqQnJ
	oCNPM8irlWStka4Ck9+6Bjr+QlMF1OziEEKZcy/vZiW3sawUxzX0WU3gi8JiwAhRBhwGs0vnPoO+N
	3ND+Ih8Tui4Tb3zSW62XgJBZxe4tgMJ1WziQVOGVkxvQeXjfE4sDdBP80rY8/hnUvYUYvT+syiC4p
	RYR1Lohs75sfFQIRaVcqwtgiksPQ5pcKX+BAiIs0VLKNem8UHHPc5Xa9s88Yo+mZOKLFpaFCBpnzT
	p19+IiHpv8AnpENgcEuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvhTv-000000077Dr-1ypO;
	Thu, 26 Feb 2026 19:57:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvhTs-000000077D8-3tRM
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 19:57:05 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QHEpbT2608934
	for <linux-riscv@lists.infradead.org>; Thu, 26 Feb 2026 19:57:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=e9T0r9qPbJXEHEbE1DDUwuy1
	sFl7CYMlXpPV3+ZDZi4=; b=T1D30GlWpBTy7Fw5YVU5jHPnPcoQFM1DW5bOlomS
	G7W2fA8KNbLusn4Qm442rSpHBAYDx9aibSMdsziJ2WvVDYfAFzBPzTUsWmVe6V9l
	GJIQMqvHKa3Jo052jZirdYeWDM1RqDSMEvejXg3D8uvyMSePW51AYIKrShf+bLqB
	J+Wah9TMbrRt/JKsxaHj/K2mseAquS6wmKUlP57UUI2QH1ctwHvaR4tQoU6TLcYE
	qvoVVQz5nFb28OId1e2Rd9LLXVZk1kTBuG5aClPpZFNRPg6XTy7sarFi9ObtfdLd
	PodhJWY20rkoq+08ayYZUN70ITDaGQjGrcD/9R5C9Rk4rQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt7y8saj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 26 Feb 2026 19:57:03 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1273665df8fso2063000c88.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Feb 2026 11:57:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772135823; x=1772740623; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e9T0r9qPbJXEHEbE1DDUwuy1sFl7CYMlXpPV3+ZDZi4=;
        b=GyA3viNWJPuA1kMcQiiCMwifsWwTTFPczwnrwSPqp7LlFuhTAMOuQtAwLEV6dOhgaG
         7zoypybf+8PVgl7nKOIpkn7SccRVr9Boc0+32CbICjHW7/gdanMEcgb0kYEgQbVNcT55
         pHWCNl6kai+1JZtbyyh4YYc/K/8faA+ohwc/7yoEs0vKNaXMASI2MSOkQzzVhVLbDnCH
         vRJi4uFwxDzMT0wKjEIvOiC6QDguS/BvZyF/1TYNZRwOg+72IFTVR8hOu1iKHGdc4yZk
         JNxbn1Y/zK0d0b7zWJnapjrw7k/cQhAZWguYqjl6Uag7vXkc05RkVCMAIxaf2j8cASKS
         tvlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772135823; x=1772740623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e9T0r9qPbJXEHEbE1DDUwuy1sFl7CYMlXpPV3+ZDZi4=;
        b=M0NCAGgETtH6D2fYnCBFq9CKQUVBJGjKTT/sHrUWFeHZCbJ8OJZ6KW2brxXyApRHo6
         AXnzH0rokk6+uuDwWse1HO5UZ4YyX1m0g5hIcbXH6RkGZecXmiMEOZKZg1dxNttwzQhb
         d4xPrilVyBAqfXovC3jENPxB/e8fp2gm12+zCouci2Eyi3GBgaciU7ggIfBljLNdeGdr
         OxQROBJJz6kV8Ic0A15HbFa2a1rbM/11z6NqUgSVFirJUWhxYcyVhHISADMjerhybCl9
         bBOAh9vmMmlJmfuFENWR1rAV6LNVQBwN3UIivs80FzEpcfIVAtE6T3bLJT85OreSS1rI
         xUZA==
X-Gm-Message-State: AOJu0YxV1iu0S/sl+I/fZ7Qp4xn/ajyTaSbLOOba4iPHUbUdFbvXgCn5
	ssEaGGiXlZ7M5fYy0eKqnkvA73P7tMpnMFiAeFzZKM/UNmcPIpem4kjikBYlBARUfrPKmKc6aJh
	HRVuqHJ+wLpWV9PmZW463S1SxC5dpO6U0M21dt6VkJOTy7rTScNEjVYYeF4KK3QhgSzgnowk=
X-Gm-Gg: ATEYQzx9d+z9V5bpvXzVd9VpuQyTZS+Py2cDn15r/PSdIfmJ6aEyXfbrgjaz9N6yTrj
	Uv9B52rXQdiI4HDDm9+BR/urcLF3RDXzgcWdhlbudXU8BrVb0lIQMIzZOJUtKhLHzx7r3XI57dp
	c63J+o3pIdYBnosMfHPj4p8wCUWJCT9t79YuHntrOttUhBkn87UKJOzdOuPSaLKYY1BIdJpSj7J
	H1kzaMCPjKcrJDEoB/0nt0s3msorYzbf5qYtF8sXi2PNCyzflFI/Flod2Lsr5LMsij9m0IbicDo
	gKhXtGXNxQYQgZhTg10szl6GIe5nNOhJSR9shaNXVkdq/IcKvdM7Xtj1/1aWwRdRlG40jcmCoiy
	j6GBE866LqjfakcgKDgxW8Xdn1uohJMM=
X-Received: by 2002:a05:7022:512:b0:119:e55a:9c03 with SMTP id a92af1059eb24-1278fc3bf63mr58101c88.31.1772135823037;
        Thu, 26 Feb 2026 11:57:03 -0800 (PST)
X-Received: by 2002:a05:7022:512:b0:119:e55a:9c03 with SMTP id a92af1059eb24-1278fc3bf63mr58096c88.31.1772135822464;
        Thu, 26 Feb 2026 11:57:02 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1e04361sm2885359eec.14.2026.02.26.11.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 11:57:01 -0800 (PST)
Date: Thu, 26 Feb 2026 13:57:00 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org,
        kvm@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>,
        Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Albert Ou <aou@eecs.berkeley.edu>, Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH v8 3/3] RISC-V: KVM: selftests: Add RISC-V SBI STA shmem
 alignment tests
Message-ID: <ywgpwvhzvtkmhw26exwwam5hfo5euhiewbrzyzh2uzkls2rkbe@g7p5kxnhtgso>
References: <20260226083234.634716-1-xujiakai2025@iscas.ac.cn>
 <20260226083234.634716-4-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260226083234.634716-4-xujiakai2025@iscas.ac.cn>
X-Proofpoint-ORIG-GUID: pieiaDrTqrp3kOKmxbAWYh6HV6t_XbnK
X-Authority-Analysis: v=2.4 cv=N7Mk1m9B c=1 sm=1 tr=0 ts=69a0a58f cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=xMjqbsr0sL_NellN6QoA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: pieiaDrTqrp3kOKmxbAWYh6HV6t_XbnK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDE4MiBTYWx0ZWRfX8FfP5nOE2g7H
 13xXf9zGITxuCHByVXYMs1hbmYzduyWvNAhjqWMwQTwmEa/RFXohrvJxwdtXHTtDOyr2MUUxuH7
 zF+I6VoZuTfvTGRGoBetFQOUjzAAFiBDX7rIblZD505Zfj83nqdV+sLyDM4sDQhLxIFO09G+pPf
 u0EouuM8pOArU/R86s29AE0QCTe40zbk9F1WVwfFBNNObKCq6TRapObLM7cyg3xYkpAjx7AbApy
 wDRPZeTACsP8Y+sHDw88Psx1yokEwnd5zaq90yoVs4JKkEAfnmqoX4zDGADPU9XxTbjaZ3uMl8A
 OtDPKxxUhSJ4aKod/6js1vaTWpd0jnFNEOuBrpyVe67XI8dJYMG62DSuVK9wtHJRJIvO66khenC
 PW22ZxfEjxtYwIS/TbjslcqF6kQ2/7/Eyd0r9U//biAQyPXgwHKRU+9OjQPXFHeBqAGGxakCMfd
 p10zMIf5JePwz5srlhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_02,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260182
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_115704_993497_74821CAE 
X-CRM114-Status: GOOD (  26.19  )
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

On Thu, Feb 26, 2026 at 08:32:34AM +0000, Jiakai Xu wrote:
> Add RISC-V KVM selftests to verify the SBI Steal-Time Accounting (STA)
> shared memory alignment requirements.
> 
> The SBI specification requires the STA shared memory GPA to be 64-byte
> aligned, or set to all-ones to explicitly disable steal-time accounting.
> This test verifies that KVM enforces the expected behavior when
> configuring the SBI STA shared memory via KVM_SET_ONE_REG.
> 
> Specifically, the test checks that:
> - misaligned GPAs are rejected with -EINVAL
> - 64-byte aligned GPAs are accepted
> - all-ones GPA is accepted
> 
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
> V7 -> V8: Moved INVALID_GPA definition to kvm_util_types.h.
>           Removed comments in RISC-V check_steal_time_uapi().
>           Corrected reg.id assignment for SBI STA.
> V6 -> V7: Removed RISCV_SBI_STA_REG() macro addition and used existing
>            KVM_REG_RISCV_SBI_STA_REG(shmem_lo) instead.
>           Refined assertion messages per review feedback.
>           Split into two patches per Andrew Jones' suggestion:
>            Refactored UAPI tests from steal_time_init() into dedicated
>             check_steal_time_uapi() function and added empty stub for
>             RISC-V.
>            Filled in RISC-V stub with STA alignment tests. (this patch)
> ---
>  .../selftests/kvm/include/kvm_util_types.h    |  4 +++
>  tools/testing/selftests/kvm/steal_time.c      | 25 +++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/include/kvm_util_types.h b/tools/testing/selftests/kvm/include/kvm_util_types.h
> index ec787b97cf184..90567f8243fe9 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util_types.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util_types.h
> @@ -17,4 +17,8 @@
>  typedef uint64_t vm_paddr_t; /* Virtual Machine (Guest) physical address */
>  typedef uint64_t vm_vaddr_t; /* Virtual Machine (Guest) virtual address */
>  
> +#if defined(__riscv)

Why this #if ? INVALID_GPA is common to all architectures (see
include/linux/kvm_types.h). That's why I suggested putting it in this
shared header.

> +#define INVALID_GPA (~(uint64_t)0)
> +#endif
> +
>  #endif /* SELFTEST_KVM_UTIL_TYPES_H */
> diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
> index 6f77df4deaad3..e90aad9561ff7 100644
> --- a/tools/testing/selftests/kvm/steal_time.c
> +++ b/tools/testing/selftests/kvm/steal_time.c
> @@ -324,6 +324,31 @@ static void steal_time_dump(struct kvm_vm *vm, uint32_t vcpu_idx)
>  
>  static void check_steal_time_uapi(struct kvm_vcpu *vcpu)
>  {
> +	struct kvm_one_reg reg;
> +	uint64_t shmem;
> +	int ret;
> +
> +	reg.id = KVM_REG_RISCV |
> +			 KVM_REG_SIZE_ULONG |
> +			 KVM_REG_RISCV_SBI_STATE |
> +			 KVM_REG_RISCV_SBI_STA |
> +			 KVM_REG_RISCV_SBI_STA_REG(shmem_lo);
> +	reg.addr = (uint64_t)&shmem;
> +
> +	shmem = ST_GPA_BASE + 1;
> +	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> +	TEST_ASSERT(ret == -1 && errno == EINVAL,
> +		    "misaligned STA shmem returns -EINVAL");
> +
> +	shmem = ST_GPA_BASE;
> +	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> +	TEST_ASSERT(ret == 0,
> +		    "aligned STA shmem succeeds");
> +
> +	shmem = INVALID_GPA;
> +	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> +	TEST_ASSERT(ret == 0,
> +		    "all-ones for STA shmem succeeds");
>  }
>  
>  #endif
> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
