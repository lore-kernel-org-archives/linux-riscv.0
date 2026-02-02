Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839C2E7DEFD
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 16:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EUGZAdJo6zrOe9Euj/s4ojZejgWkthxT7mJrH1tLlBU=; b=IGNJYvFkFZhh8V
	eIhPDtkQET9x+9xP2QOvHLu2sJBDtyCrpR4Cjike83OTiOycQLLsxoKKtBSyaUhPX6ruWDaj75tKj
	MLhwxfBt/St1af16eDVxZhAvN9bmzy3/MCU8+HZyT06d61DokhOf7K4alJPo1iT2xNXNzQwBRHEXH
	nIhhXkxbk5LRcuEHGUhfyQkyLa6BBoztrKy53kvdoLsL/pSonOl0D7d15pMWK1ZwwUCHyMxaKZSao
	qb92D9/7N2sv6FRLTjCWbSz6nMFSYnUIsPRph2GqjYzHzJBfZOxldKKVHYMzqCU9o0l2jsYUBitCJ
	ASJ5t8a76MHuxDQm6cpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwjs-00000005I7J-0Lp1;
	Mon, 02 Feb 2026 16:25:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwjq-00000005I6g-3PgM
	for linux-riscv@bombadil.infradead.org;
	Mon, 02 Feb 2026 16:25:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=i6qnaLJvdDvAW5szsitSpepDXeYDqBjigmWEpuJg4Xc=; b=RxVZJIBbyavYWT3kzaIL3LN0ko
	JGdM7R0RZxrX8xbbXH0M5rLDDLkuVRgvAbtstt6L1GuGmjx+AEPWeVA9MJPICodxAmxtIxEeuJuTP
	sdTLUK7VC20Ss8ktF9xDVDsRZvDnaJ/x2ZcOoSTNhj6uOO0/3dXbLNmbcsj2TeD3MW8LQv7pCkDdn
	JffhfNcKe/o0idmWj+Fm0xAKKsWxyP4KGx3M+NRUhzg8KSCJZ0k81tsmPHJ2wm+agZRJCdd1JWzWV
	V9BUYRmWJV/gJXqUbdJkaDNdbE6FjlHLmhBY3szIPLIjBhkg/Rl9F3DJ5tL32VhVZ96XrevHo2uDc
	8ewq3oxQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmwjn-0000000Eq03-1xcf
	for linux-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 16:25:21 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612B0U362900010
	for <linux-riscv@lists.infradead.org>; Mon, 2 Feb 2026 16:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=i6qnaLJvdDvAW5szsitSpepD
	XeYDqBjigmWEpuJg4Xc=; b=WavQT2vQA0szCh9N45x2/IeMil3eDG+lSJvxEp3Y
	JqK9TTGLwVvgXN/eej2ex1sZPn40sVuI1WpdOKrVoELbmE8coJo3lxDLVbsdEPHu
	etVF6bZBRqAPwcOF/HNzH9QsEENanmYbcQWVfr7btTf4Yor4meBVZGbrJvelDQZs
	w2pHbhN6e/6Jz/J9Mg8SgNkb5kTkEO+yNCFagbHM8VDt5MiQJQeEs0ZZb5QeBmoD
	TV0UIjXlC6tu/GiBvlm22FO3gZKhHsfD+Sj0byLTlaR+6kREIWafLfjaQ7axrCE/
	9oy/FfGTie0IObaGDGJyRl/B23SkLjSyG/rvDfYotSrhNQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tp0rxwr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-riscv@lists.infradead.org>; Mon, 02 Feb 2026 16:25:14 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b799f7a603so26247598eec.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Feb 2026 08:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770049514; x=1770654314; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i6qnaLJvdDvAW5szsitSpepDXeYDqBjigmWEpuJg4Xc=;
        b=AA4VlGjH5U5xO9YcterMSP+h93uY97zgKl0rwyQyUYQf5ZRe+lqEf9b+w9uZ7dhb40
         PDufObJIjQcMpGVkLp9cXw0PSKz04ecvLxQuX1gKscyWXS2532scafOAMPavFsCi6Akm
         brQxXi9m/zTSHtQv80tmCM9rKPkRLKu5iCKmJYjVqBCuA4hasPxoj43LHT7g7xIrE0F5
         +x8JabeJcwSPZTWi58GzOh7jwTgTdP5ANH7/VIC/LWi3c00AHS73zpytm5tEx+kW0EBM
         0agcl+edCjDb4ekGHAjbW2K5zHoBzRGbYxVww3RR/I5NSy69lE1CBkEXRQmz001KnJ8a
         DjEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770049514; x=1770654314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i6qnaLJvdDvAW5szsitSpepDXeYDqBjigmWEpuJg4Xc=;
        b=abFZYHLyNQfCkovdDe7YUlciVJ8j0LnmZpbpnj3UdeXXBnawv6n1m2uWcPvCYRkCnb
         lj6gi0JVkyqp8VEeHgX+sd/m1be/Hh3gfSRe0028XGMcvtJmepvZvCbVTtEClDlio+3s
         sxYOWSGUrqw8q7dwx6QCnzZY+ID+WVIlzpsKqI0yQ6lM4MKwkEv8K60TzAbxkUKq9tWN
         4f1TUfftumE9kkFwYy7RMWKq+93TBgotiyABY1QAV2G6d1eBA5mzg2wfV9lM/QQeP8JA
         wwVqLdwUmPEATnPJOapY6hFqdXS+03KIr830XNXMwSGUKFq9QkZwEtQsnOAQy5Wk6XWi
         MR1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGhtOjBwtjdkOwDASGrNX3+CT0iwRBL8Km4tRUBWeAZ2SSooRxRc9hLpMA5l1QVZ8jrjwIJv5V+jl86g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5SCwG/Gj5JYgJCuRhtZ8f05Zm5BczqBxUXdWoyjbEb1F7bajj
	rJmWjzpaHdAPCaCDkUbw3GTpR0X0K4zXwz2mAJPip8z+D63opkwGBawbMW62cnxYJS7aWSRyXpk
	HuGcQ+TCFyVwkunk7AfoiDbf3V39CG5sbFDzXvjkTVeM2yu1XRaS8qb4Gguwpn/el0SFys80=
X-Gm-Gg: AZuq6aJ+lizijVYI4TaTySLthqjZNbQClq0bCrLeUZW//gHc4Mp5C7aOdwFoxgP1UxC
	JFxrOL40W+w9xIO6bZuq9gvMh5UysXsypisQfOJDe1cO93LSbHmf3V88Z3dgEPGBMImixW1u8TM
	p6UtTMx+sZq6TKci50ZDkgU+xWMSxLNwz83eds8sfnr6aUhCcJmzfZi9iQENaWjzZiMTi78C01K
	6FkKgIS02B5xABgyris7OzJnKc9Wc5BUJpgPAYDUa14exGaTkyyfTWTfKEOWJNW0fWviIVMCRWo
	vcj2XNU0oXrZfYE8J0OLoX5IS9DUBRQALqzkzBWYiIOjD+r+k39OBO4cHERBnfUyYF9M1fl4WQ9
	GI5keDqcOIVBtizlsRDA=
X-Received: by 2002:a05:7300:dc8c:b0:2b7:1cbe:fd1f with SMTP id 5a478bee46e88-2b7c8940615mr6058263eec.36.1770049512424;
        Mon, 02 Feb 2026 08:25:12 -0800 (PST)
X-Received: by 2002:a05:7300:dc8c:b0:2b7:1cbe:fd1f with SMTP id 5a478bee46e88-2b7c8940615mr6058185eec.36.1770049510377;
        Mon, 02 Feb 2026 08:25:10 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16cfaa8sm19714357eec.4.2026.02.02.08.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 08:25:09 -0800 (PST)
Date: Mon, 2 Feb 2026 10:25:08 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        Andrew Jones <ajones@ventanamicro.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>,
        Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH v5] RISC-V: KVM: Validate SBI STA shmem alignment in
 kvm_sbi_ext_sta_set_reg()
Message-ID: <mknpdlex2x4dfqunv77xe7xyn5v35pdxnwp66honlivbma3ykv@zcm37hqow445>
References: <20260202003857.1694378-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260202003857.1694378-1-xujiakai2025@iscas.ac.cn>
X-Proofpoint-ORIG-GUID: ILn1hRq0J-Lovop2yBgt_RniNVPflqqC
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=6980cfea cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8
 a=t_rjcDEbpHFVAzgC7Z0A:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEyOSBTYWx0ZWRfXxN8E8T+w/zsK
 Di8nw/9dNVpN2C50HoCnD0oSK01htOu1CdvH7qrYDJd+LYrjihGVDyrTu98stZVhP//Dl40mcT9
 W9ZjgtORu7MoQ/T6KtsvpniyaOu7WHizNtGqDenNrIT3zWeV3oXeirkjG8YTSXRw1b2ZiVhmbzk
 oF6SgKeBOedSiJ4DuECEzr30dUZS7tvc8S51xgDMkLZVU2ojx7iR+4jZMHYIDTjbSoSYwaXfq8x
 RIjFN6ByzHLrSBjSweFnPZpalLjHoJotfU1Hc9RDn8V5lgkgmG+23C+tgXG1dPkcz9YW2Ic5kZy
 GSGoXBzIDFEYTdKomnNMdFAkaYurmjOyUCWLqze1hGTZ7mVnjhSjeJG/DG1h+SKWxdDKHwDCRJI
 9TRULebrwXFzDRtjhpASH3JtBKh9mhH/g2Wsw7oRvOlQc7h0gPdcm4tQ+7fpRxth0KUmFrmqKSK
 /S01ikI2igVYW+1nkRQ==
X-Proofpoint-GUID: ILn1hRq0J-Lovop2yBgt_RniNVPflqqC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_162519_845812_37189CDC 
X-CRM114-Status: GOOD (  35.60  )
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

On Mon, Feb 02, 2026 at 12:38:57AM +0000, Jiakai Xu wrote:
> The RISC-V SBI Steal-Time Accounting (STA) extension requires the shared
> memory physical address to be 64-byte aligned, and the shared memory size
> to be at least 64 bytes.
> 
> KVM exposes the SBI STA shared memory configuration to userspace via
> KVM_SET_ONE_REG. However, the current implementation of
> kvm_sbi_ext_sta_set_reg() does not validate the alignment of the configured
> shared memory address. As a result, userspace can install a misaligned
> shared memory address that violates the SBI specification.
> 
> Such an invalid configuration may later reach runtime code paths that
> assume a valid and properly aligned shared memory region. In particular,
> KVM_RUN can trigger the following WARN_ON in
> kvm_riscv_vcpu_record_steal_time():
> 
>   WARNING: arch/riscv/kvm/vcpu_sbi_sta.c:49 at
>   kvm_riscv_vcpu_record_steal_time
> 
> WARN_ON paths are not expected to be reachable during normal runtime
> execution, and may result in a kernel panic when panic_on_warn is enabled.
> 
> Fix this by validating the shared memory alignment at the
> KVM_SET_ONE_REG boundary and rejecting misaligned configurations with
> -EINVAL. The validation is performed on a temporary computed address and
> only committed to vcpu->arch.sta.shmem once it is known to be valid, 
> similar to the existing logic in kvm_sbi_sta_steal_time_set_shmem() and
> kvm_sbi_ext_sta_handler().
> 
> With this change, invalid userspace state is rejected early and cannot
> reach runtime code paths that rely on the SBI specification invariants.
> 
> A reproducer triggering the WARN_ON and the complete kernel log are
> available at: https://github.com/j1akai/temp/tree/main/20260124

Any reason not to add these tests to
tools/testing/selftests/kvm/steal_time.c in the linux repo?

> 
> Fixes: f61ce890b1f074 ("RISC-V: KVM: Add support for SBI STA registers")
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
> V4 -> V5: Added parentheses to function name in subject.
> V3 -> V4: Declared new_shmem at the top of kvm_sbi_ext_sta_set_reg().
>           Initialized new_shmem to 0 instead of vcpu->arch.sta.shmem.
>           Added blank lines per review feedback.
> V2 -> V3: Added parentheses to function name in subject.
> V1 -> V2: Added Fixes tag.
> 
> ---
>  arch/riscv/kvm/vcpu_sbi_sta.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
> index afa0545c3bcfc..bb13aa8eab7ee 100644
> --- a/arch/riscv/kvm/vcpu_sbi_sta.c
> +++ b/arch/riscv/kvm/vcpu_sbi_sta.c
> @@ -181,6 +181,7 @@ static int kvm_sbi_ext_sta_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
>  				   unsigned long reg_size, const void *reg_val)
>  {
>  	unsigned long value;
> +	gpa_t new_shmem = 0;

Sorry I missed this on my first review, but new_shmem should be
initialized to INVALID_GPA, since zero is a valid gpa.

>  
>  	if (reg_size != sizeof(unsigned long))
>  		return -EINVAL;
> @@ -191,18 +192,18 @@ static int kvm_sbi_ext_sta_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
>  		if (IS_ENABLED(CONFIG_32BIT)) {
>  			gpa_t hi = upper_32_bits(vcpu->arch.sta.shmem);
>  
> -			vcpu->arch.sta.shmem = value;
> -			vcpu->arch.sta.shmem |= hi << 32;
> +			new_shmem = value;
> +			new_shmem |= hi << 32;
>  		} else {
> -			vcpu->arch.sta.shmem = value;
> +			new_shmem = value;
>  		}
>  		break;
>  	case KVM_REG_RISCV_SBI_STA_REG(shmem_hi):
>  		if (IS_ENABLED(CONFIG_32BIT)) {
>  			gpa_t lo = lower_32_bits(vcpu->arch.sta.shmem);
>  
> -			vcpu->arch.sta.shmem = ((gpa_t)value << 32);
> -			vcpu->arch.sta.shmem |= lo;
> +			new_shmem = ((gpa_t)value << 32);
> +			new_shmem |= lo;
>  		} else if (value != 0) {
>  			return -EINVAL;
>  		}
> @@ -211,6 +212,11 @@ static int kvm_sbi_ext_sta_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
>  		return -ENOENT;
>  	}
>  
> +	if (new_shmem && !IS_ALIGNED(new_shmem, 64))

And then here check 'new_shmem != INVALID_GPA' since we want to allow the
user to set the "disabled shared memory" value (all-ones). Indeed our
testing should confirm that the value is either all-ones (disabled) or a
64-byte aligned address.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
