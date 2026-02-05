Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4929AECD983
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 15:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6ah3+TIAjQHnaR0r5nYF9S1+3nXFCIgzxd1JtDCNWew=; b=YHHPVDdpCLRLCC
	QAPhdkki3C5wlarBFFaN+VTT0X5mzxDHf6x9IdyiGwoHwqvwSOQ4vPAEgvKi4hZ+Pe0KgeASvqVJq
	5opO1aOHyIDsVfUt7hzT0bJR8hhoLgaiZVs4JHNishjRtdD5fwoIZaAUHY+tDAJBghzmwHEUhUVIY
	I8a1YvyW1fzuOZaMiKykXgN6M7wwP8z1ooTUnmy18YtsvQr+bXJ949IMems+bo8czwgSKGZqrhzvB
	1eDvUbEe7Ex6QrehwnmxgO7z44OSaE39R+AdYsDHy1HKb26zB6o7jE+mUfTmOqK+Tcx6E2D9E6x8N
	+25rgimjAoLEw8BNRVoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo1kN-0000000ABmv-22x2;
	Thu, 05 Feb 2026 15:58:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo1kK-0000000ABlZ-0hNW
	for linux-riscv@lists.infradead.org;
	Thu, 05 Feb 2026 15:58:22 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615Bjjo34125698
	for <linux-riscv@lists.infradead.org>; Thu, 5 Feb 2026 15:58:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=reJd7/At3u/sqytH15vAL/oA
	6cLufQfOxqNK9KuV5k4=; b=HSuWCLqgch53TzV1zbT0mlcPKlCQp7Qr4bLHE7+Y
	cNWEZhnnKeTTIXTtOG0K1tnYZB5zwCPZJdFy3wxXmTNOIqBapUAI+E1kSNggsZ+S
	M+qgKYok/LypjwqRxRmeb7a4JlLbO6X+LVc0ZWi8ZSKqzFa4GbD4ldowA4QnKEwM
	5R2Im+xhHxd2nBx2ti+HNGv7gBq3G0AAL7SnqCkirBRopRZL2MQOrsp/NTI73sfc
	L0Cgus6rjordj1lLzWhVBoiL7nLMcmdFxplw+SrMIYSiEp6cEny74WFuGYhaP9jB
	Wz7EIEBLiG6A/J8hBEyBBesMvViHFFXW+ljtr9i9sQkNRw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4tm8rs8m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 15:58:19 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b7155ca88cso934085eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 05 Feb 2026 07:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770307099; x=1770911899; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=reJd7/At3u/sqytH15vAL/oA6cLufQfOxqNK9KuV5k4=;
        b=gyPtynRvG39rwnT6/NScPElwA43jUru0xkWA2GcweCfc+EIr+F48BQckqD87bMA4PM
         cazQ2nL52HxQ+R7+ThixNfxoOzg4bKc+qgjBA1uhEmLMbAFwETYphkIviB97tEQRQE0D
         TwnmlxPGEnDeLTuA/9WrnW6VR0fd8VlpyF4pLa4saRvQaVSffy79dXWSgZEZlbg/5aGJ
         6E+mDLE0Od+6vqm7PjdGBRL7El6PKgY0EtpZ2vE89rjPqUVnznDDXeykR0RlqTKNt+5C
         UdCu/Qfs+B4DcWkG5Q5Oy3ZLAJpXjxC+40bjlWCXAiUkBpKyd0yTGJsw0fpwLAiScDZK
         dD6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770307099; x=1770911899;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=reJd7/At3u/sqytH15vAL/oA6cLufQfOxqNK9KuV5k4=;
        b=dpkVdwWvHIKSkzVzGD/ZggfChhp9CjadZQrprMbh5+rYT5e2P2dYTvX2J9FXcVILaL
         7BIGAWbDv2KMAodBgSVx0aG4Qh2u+gk48K5JFu34rqPN3WrQ6ag+yxOEOLbI6+n8DyxB
         XrW45PHlo7pKdgHdQ1/sAE9R8G/Zt7s6U6aCudAbweO0bmIVsC6cxb9VC7KCpE49wut6
         ryhkUmPDbogrIdKFHqR0oHVSKuofX2fiTRgndknK6RV8TgKXPLQ5p1dnEfQ/syUcC3c3
         69LlL/DIlbXG2qzkfDnf4U69ythFY9QhT7xu2Xv6wzxFVlBMOUmXgRWuG74m08o8piEU
         CdTg==
X-Forwarded-Encrypted: i=1; AJvYcCU2l+83KLqF/xvqmQHSgrR0iuTjmLliu8TCr5vRLfzyMfMGsj2o56gFl66/1s9sUP83PscNgAQ2He2AQg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPjCeIqjLa83BfLVi8zuXkafDQTmPTeBDWT9Ud0lhc1Wu2U2Zx
	lhmv4s4Rohg03gwzImBgVW6oEtN13SXQuE0IVDhuWcpf2PhsMzW+pAXLx6zq7fxxJqH9U+OJdYk
	jSKPdAouS0ZIcnLPAkbtrU+7y+O8UaoCQZc7oo5CiU7UofXyx0+oJKZ1PDS3/rGnrl94qeqh+z+
	Ft/lU=
X-Gm-Gg: AZuq6aIlGt3ZwnXLmQgWC7A+c26uASn7snu2aLqoIl/xuNtl9BqW9ANyg3EwoApDAFi
	mfcoJ3dG+Q6fPrtTTOiM8RZAIgIzp6xqvWgHzkcDr3T71cx72W6PLXSxjhDfhEBU24FeJ+JSuIF
	WYWK4FF+H7Urui/aA91SGV9K7tovRy7a3/EGMQf18i2TzQz7O7pVdI0q2uI8bMJO5Y9YXNHKtbj
	8MUw0ga5x32XsOSPyTaqfuEf4h1enF7eKhXoDl8VK68zEsieuh6FD0mBivxhLakrP53qCocDg1k
	nkrXavfH4nhyvT7pnC3gFSIsYXQzkhus0AXvezvbJLJ/UyHriQlmjQKU6bi8M9WCcnI69h60sg1
	IOhFEOMMeo3cV+LhbOXs=
X-Received: by 2002:a05:7300:cd8d:b0:2b6:fa0c:6c44 with SMTP id 5a478bee46e88-2b83291cd6dmr2805954eec.12.1770307098406;
        Thu, 05 Feb 2026 07:58:18 -0800 (PST)
X-Received: by 2002:a05:7300:cd8d:b0:2b6:fa0c:6c44 with SMTP id 5a478bee46e88-2b83291cd6dmr2805941eec.12.1770307097841;
        Thu, 05 Feb 2026 07:58:17 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b832fe59fasm3427697eec.34.2026.02.05.07.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 07:58:17 -0800 (PST)
Date: Thu, 5 Feb 2026 09:58:15 -0600
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
Subject: Re: [PATCH v6 2/2] RISC-V: KVM: selftests: Add RISC-V SBI STA shmem
 alignment tests
Message-ID: <gcspbbvqkr7y53c4ytkqqycygkcqkiakle4aelq2z7nsnlyegl@addv4v655cbg>
References: <20260205010502.2554381-1-xujiakai2025@iscas.ac.cn>
 <20260205010502.2554381-3-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260205010502.2554381-3-xujiakai2025@iscas.ac.cn>
X-Authority-Analysis: v=2.4 cv=Vd76/Vp9 c=1 sm=1 tr=0 ts=6984be1b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=reGFDpqf7T0RaJXXVMIA:9
 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEyMCBTYWx0ZWRfXyvoV+sTHi0Cz
 vQJx+w3uBviyFpzAKZK8B5ykds09qOtUeES4o5QITDeQPLXIzinnXnxKpabxzjzLX1U6XBehjyR
 4lP1HBP1On8qNu3zt+dJ16tORc1gOEKxEz17j08xoR1c0nDaV7BCde81eL2IcUg1WH9gcpC7vm9
 NpiUM4vHxpKtwSH1MK9CVQry6ZHmhePtCbV3L6WBrQPSgyTdhgWAoxSUwbaQ5Jhp1G/ewFzc4Jb
 U+egG7vMy++Wvq1WhUIeMaA/mg+XgXTCSajKRclMIPTENnh5zWgbEHShy5Ufh5P0KCUgBuPyOH9
 KqK36vcIknbwyvWxvXi4g/kcoiG2LkqNYuyZmefVDfzPAhZNorjNdEN4iQ44+UQhz4rZkHdTZBL
 7yWG8de0IkbMM40td+7jrLxPL9ffum7Qe3DYcEOJ9812hQlzf1B1r6eDss1GPCguUycjU02KRXk
 tbmd2NGgdhMoVzTe6yA==
X-Proofpoint-ORIG-GUID: D6c9cmEsZAgD2mVX_mP-q5fpb8GOuhA4
X-Proofpoint-GUID: D6c9cmEsZAgD2mVX_mP-q5fpb8GOuhA4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_03,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_075820_604155_77057B72 
X-CRM114-Status: GOOD (  30.09  )
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

On Thu, Feb 05, 2026 at 01:05:02AM +0000, Jiakai Xu wrote:
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
> - INVALID_GPA correctly disables steal-time accounting
> 
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
>  .../selftests/kvm/include/riscv/processor.h   |  4 +++
>  tools/testing/selftests/kvm/steal_time.c      | 33 +++++++++++++++++++
>  2 files changed, 37 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> index e58282488beb3..c3551d129d2f6 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -62,6 +62,10 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t subtype,
>  						     KVM_REG_RISCV_SBI_SINGLE,		\
>  						     idx, KVM_REG_SIZE_ULONG)
>  
> +#define RISCV_SBI_STA_REG(idx)	__kvm_reg_id(KVM_REG_RISCV_SBI_STATE,	\
> +						     KVM_REG_RISCV_SBI_STA,			\
> +						     idx, KVM_REG_SIZE_ULONG)

We don't need this because...

> +
>  bool __vcpu_has_ext(struct kvm_vcpu *vcpu, uint64_t ext);
>  
>  static inline bool __vcpu_has_isa_ext(struct kvm_vcpu *vcpu, uint64_t isa_ext)
> diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
> index 8edc1fca345ba..30b98d1b601c3 100644
> --- a/tools/testing/selftests/kvm/steal_time.c
> +++ b/tools/testing/selftests/kvm/steal_time.c
> @@ -209,6 +209,7 @@ static void steal_time_dump(struct kvm_vm *vm, uint32_t vcpu_idx)
>  
>  /* SBI STA shmem must have 64-byte alignment */
>  #define STEAL_TIME_SIZE		((sizeof(struct sta_struct) + 63) & ~63)
> +#define INVALID_GPA (~(u64)0)
>  
>  static vm_paddr_t st_gpa[NR_VCPUS];
>  
> @@ -301,6 +302,34 @@ static void steal_time_dump(struct kvm_vm *vm, uint32_t vcpu_idx)
>  	pr_info("\n");
>  }
>  
> +static void test_riscv_sta_shmem_alignment(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm_one_reg reg;
> +	uint64_t shmem;
> +	int ret;
> +
> +	reg.id = RISCV_SBI_STA_REG(0);

...here we should use KVM_REG_RISCV_SBI_STA_REG(shmem_lo)

> +	reg.addr = (uint64_t)&shmem;
> +
> +	/* Case 1: misaligned GPA */
> +	shmem = ST_GPA_BASE + 1;
> +	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> +	TEST_ASSERT(ret == -1 && errno == EINVAL,
> +		    "misaligned STA shmem should return -EINVAL");

remove the word 'should'

"misaligned STA shmem returns -EINVAL"

> +
> +	/* Case 2: 64-byte aligned GPA */
> +	shmem = ST_GPA_BASE;
> +	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> +	TEST_ASSERT(ret == 0,
> +		    "aligned STA shmem should succeed");

same comment about 'should'

> +
> +	/* Case 3: INVALID_GPA disables STA */
> +	shmem = INVALID_GPA;
> +	ret = __vcpu_ioctl(vcpu, KVM_SET_ONE_REG, &reg);
> +	TEST_ASSERT(ret == 0,
> +		    "INVALID_GPA should disable STA successfully");

We're not testing that STA was successfully disabled, only that all-ones
input doesn't generate an error. So the message should be along the lines
of "all-ones for STA shmem succeeds"

> +}
> +
>  #endif
>  
>  static void *do_steal_time(void *arg)
> @@ -369,6 +398,10 @@ int main(int ac, char **av)
>  	TEST_REQUIRE(is_steal_time_supported(vcpus[0]));
>  	ksft_set_plan(NR_VCPUS);
>  
> +#ifdef __riscv
> +	test_riscv_sta_shmem_alignment(vcpus[0]);
> +#endif

We like to try to avoid #ifdefs in common functions by providing stubs for
architectures that don't need them [yet]. So we should rename this to
something more generic, like

 check_steal_time_uapi()

and then call it for all architectures. Actually the other architectures
can already make use of it since both x86 and arm64 do uapi tests in
their steal_time_init() functions and that's not really the right
place to do that. I suggest creating another patch that first moves those
tests into new functions (check_steal_time_uapi()) which only needs to
be called once for vcpu[0] outside the vcpu loop, as you do here. In
that patch check_steal_time_uapi() will be a stub for riscv. Then in 
a second patch fill in that stub with the tests above.

Thanks,
drew

> +
>  	/* Run test on each VCPU */
>  	for (i = 0; i < NR_VCPUS; ++i) {
>  		steal_time_init(vcpus[i], i);
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
