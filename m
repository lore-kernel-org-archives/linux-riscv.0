Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF3A4C369D9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 07:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZxnnnhRt4Nrh5XH5zJFx6mKQqlfPUhhHfHgFAg1jXAs=; b=2rjc4FPo+b5nxA
	yJU3XyZs/s4ejh30549hVQB2yNRtTmcbVd3PfFE/bugMfneG/1BwOLvyOBu7+wEy53v94L8aflofq
	eDZSw1/RCWB+2ywuFbmFYImJl67Pwmqb9I/67WzB7XztQASIW6b73is+2/RcyuFTtRboTXkgR0UeY
	HgN1e8KeKI4YZCw0SwkezafWI+Pt9/M3gVZ0WRI6Pqiak7RNoNeLbop/Q/1PAYQu04kkcNrGH3a4q
	/0ptnWcp1wmQb869LnPKgUh1E/f9EGswfWGTJum/JQ0AvbaensTzR5mYXpviibV3bgB/2tGF6iaqH
	OwlwNJCtq/JrmShv/zcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1sH-0000000BzTV-21wS;
	Wed, 30 Apr 2025 07:28:57 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1Z3-0000000Bwn3-1rYQ
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 07:09:06 +0000
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso30277765e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 30 Apr 2025 00:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745996943; x=1746601743; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LSK4QD+3I+qmqDLjdFn3wb2kTRYhgTQ7voE34inPLKI=;
        b=OR33Fwz1GrfbN+mIKDdedkcJgdpMFXD4Q+INgVhn4duJcIM2uZd8UlPWYuXhvSeA4r
         KUm8N6DG5gERfkA2KVpZDvWWIWcStyX0N3F/RvH18Qe96XFOGYW04kEIDIPgUjyqNNhi
         G0N85rXiEfJQisTUGKQlFkglhrkfZphR9XJs5F1Tpcz+X6AlICD7tC8Bf1P1yh/guZoO
         pjyS3ayXG7haZC+R0DtbgtaLmR1AuNRY+sjlAHStl9IW+k5UbDebwslD6Y1yzT7HmgdA
         /DlCOu7PeueWlS+3YoKnGxb+gPn+CSRVxkfsI6Jep2ZFB211Bnn1opMzutW0rP+7P4BQ
         Ueqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745996943; x=1746601743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSK4QD+3I+qmqDLjdFn3wb2kTRYhgTQ7voE34inPLKI=;
        b=ccPv60HesYRjpFNRM+BxmmIoiH4sItpSqyJZvq6xFG+NsNg99J6IP2PNx4RiZs6tcv
         FJrBjJeBfs+hm+ApBmt7aY35XMsHrZIkwcQzGI8oakku32Elqnq/qneUQMXQDvqYbq4J
         kfTcjuDTcQC7cSP/bKlgx4cBpc6JX+jkFCZ8emn0XN1gYs0fy46z7FBfs5VuXk3ZSuMn
         gxsziV6fPXsHluXsx0EmK+UnnaFJl1pQSXRcRn5d/ZvDw6qdj3Ua4qAnm7OsTxq3dKCL
         BIicgCZhnk4N0Y4OIHZNDFZWnIlzXHFhZD/9dHK7tZ7NUorKAMkdqAy661FzXmzmd0kN
         I2Rw==
X-Forwarded-Encrypted: i=1; AJvYcCWtN3Cqu4bGc8GfWtg/ImXIV1yH9BzD1dq1KyZRgeJuCPbyJx2sDMi4VUS0J9HeAhZoF2dxbezCJpFfsQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwvZDuxzDel74t94kaCV6gYqYcMK9NWnvrvBQ3soHf6eterAjHO
	mAEz79+v2J9gSs4lsy2dzq+p51MFFQJonP4LHxUkebf1nRbOsQJ+V4hgHhZhOBo=
X-Gm-Gg: ASbGncsZdgylson9OEGRAmsNCVfRyoEK30gP0c5RgZD9kxqEInyltjLIGCkFbZPON+r
	+sS23jmImJ60LCVHCtH0XBKff/nmcy6HJRNDLQIhXyK6ACjQDkazsg8i2a4EkslyyT8QUS6e9DD
	QIHB2G6QPzkjAbSVin/B4SVvcbHVytDwrVDVowbCu0831okAOIpvs8kiwODfCJs382KEjQao+G3
	zhyogcVpYajQWAkySSKGbWDf11aDWaugLp8akDUIOPOKc3Byb4tSkTRPGFJZ7506RoeIxAdptYq
	f35kQTOQUo4PvmvRR58LwIxpafAX
X-Google-Smtp-Source: AGHT+IHU6e+bAOcpIfCg/o6HSKaqmZqkWhnRBvwCbptPuIv7yzCHf3h+WWrp9vwHZZg1HMb2/urfEw==
X-Received: by 2002:a05:600c:35d6:b0:43c:fe90:1282 with SMTP id 5b1f17b1804b1-441b1f306c6mr13349235e9.7.1745996943368;
        Wed, 30 Apr 2025 00:09:03 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::f716])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b3ae0c19sm6357775e9.24.2025.04.30.00.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 00:09:02 -0700 (PDT)
Date: Wed, 30 Apr 2025 09:09:00 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Atish Patra <atishp@rivosinc.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] KVM: riscv: selftests: Decode stval to identify
 exact exception type
Message-ID: <20250430-b40cd14818cc9264506e61f2@orel>
References: <20250429-kvm_selftest_improve-v2-0-51713f91e04a@rivosinc.com>
 <20250429-kvm_selftest_improve-v2-2-51713f91e04a@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250429-kvm_selftest_improve-v2-2-51713f91e04a@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_000905_476360_18BB95B6 
X-CRM114-Status: GOOD (  20.59  )
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

On Tue, Apr 29, 2025 at 05:18:46PM -0700, Atish Patra wrote:
> Currently, the sbi_pmu_test continues if the exception type is illegal
> instruction because access to hpmcounter will generate that. However
> illegal instruction exception may occur due to the other reasons
> which should result in test assertion.
> 
> Use the stval to decode the exact type of instructions and which csrs are
> being accessed if it is csr access instructions. Assert in all cases
> except if it is a csr access instructions that access valid PMU related
> registers.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  .../testing/selftests/kvm/include/riscv/processor.h  | 13 +++++++++++++
>  tools/testing/selftests/kvm/riscv/sbi_pmu_test.c     | 20 ++++++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> index 1b5aef87de0f..162f303d9daa 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -11,6 +11,19 @@
>  #include <asm/csr.h>
>  #include "kvm_util.h"
>  
> +#define INSN_OPCODE_MASK	0x007c
> +#define INSN_OPCODE_SHIFT	2
> +#define INSN_OPCODE_SYSTEM	28
> +
> +#define INSN_MASK_FUNCT3	0x7000
> +#define INSN_SHIFT_FUNCT3	12
> +
> +#define INSN_CSR_MASK		0xfff00000
> +#define INSN_CSR_SHIFT		20
> +
> +#define GET_RM(insn)            (((insn) & INSN_MASK_FUNCT3) >> INSN_SHIFT_FUNCT3)
> +#define GET_CSR_NUM(insn)       (((insn) & INSN_CSR_MASK) >> INSN_CSR_SHIFT)
> +
>  static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t subtype,
>  				    uint64_t idx, uint64_t size)
>  {
> diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> index 6e66833e5941..3c47268df262 100644
> --- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
> @@ -130,9 +130,29 @@ static void stop_counter(unsigned long counter, unsigned long stop_flags)
>  
>  static void guest_illegal_exception_handler(struct pt_regs *regs)
>  {
> +	unsigned long insn;
> +	int opcode, csr_num, funct3;
> +
>  	__GUEST_ASSERT(regs->cause == EXC_INST_ILLEGAL,
>  		       "Unexpected exception handler %lx\n", regs->cause);
>  
> +	insn = regs->badaddr;
> +	opcode = (insn & INSN_OPCODE_MASK) >> INSN_OPCODE_SHIFT;
> +	__GUEST_ASSERT(opcode == INSN_OPCODE_SYSTEM,
> +		       "Unexpected instruction with opcode 0x%x insn 0x%lx\n", opcode, insn);
> +
> +	csr_num = GET_CSR_NUM(insn);
> +	funct3 = GET_RM(insn);
> +	/* Validate if it is a CSR read/write operation */
> +	__GUEST_ASSERT(funct3 <= 7 && (funct3 != 0 && funct3 != 4),
> +		       "Unexpected system opcode with funct3 0x%x csr_num 0x%x\n",
> +		       funct3, csr_num);
> +
> +	/* Validate if it is a HPMCOUNTER CSR operation */
> +	__GUEST_ASSERT((csr_num >= CSR_CYCLE && csr_num <= CSR_HPMCOUNTER31) ||
> +		       (csr_num >= CSR_CYCLEH && csr_num <= CSR_HPMCOUNTER31H),

We should never get csr accesses to the rv32 high registers since we only
support 64-bit.

> +		       "Unexpected csr_num 0x%x\n", csr_num);
> +
>  	illegal_handler_invoked = true;
>  	/* skip the trapping instruction */
>  	regs->epc += 4;
> 
> -- 
> 2.43.0
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
