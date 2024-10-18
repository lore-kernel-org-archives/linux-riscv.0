Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F29F0D3F283
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Oct 2024 19:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=bboetIFo2V2+odXwE8zsFeWB5YPi7Bn46z2XTV37Ykk=; b=VpVlOAqubumYdqCn6U69qHx2er
	O5ZxYmSpCLEr5N/vxJvsehyc4354kuSuahJM/wnsggz1ts0VKnorwglspkAFRmIA7AoTg7Mog8jFu
	R3rHAHWQz+pma0h2/ejLrnAaBkYiFodP3kAJm1HKnASSgj425+I7Smmo/0YqvLSirNXUG3dM2e2tL
	0iuz5582hjPsRy5rq6nVprIoabQMWPc6bFTOE/I2HrbXCnb3RED3MQP2gqCA9aBoWse6xwH148uJo
	1bPVF+nyedmsPDhtBiFB0TPbtSYcL/ObAzEFQ0PJ7/fdhAYX/1cZtFK9m8Ezy5nLR5A4IEzOPIpBn
	5+2x3cfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1t8P-00000001sjM-0Wyy;
	Fri, 18 Oct 2024 19:59:41 +0000
Received: from mail-oa1-x2a.google.com ([2001:4860:4864:20::2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1t4J-00000001sE7-12Zo
	for linux-riscv@lists.infradead.org;
	Fri, 18 Oct 2024 19:55:28 +0000
Received: by mail-oa1-x2a.google.com with SMTP id 586e51a60fabf-28847f4207dso1231956fac.0
        for <linux-riscv@lists.infradead.org>; Fri, 18 Oct 2024 12:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1729281326; x=1729886126; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g7oEArfVPSnqpsijZaXynZDVD27FkpdWWYcqDGTZCjw=;
        b=i+3mMwLO99I8zLYLxHuv794H/A1cvtHpvjQvA9ikSwmT0dkgsITYRkKuesOzQETZCt
         2L6KpvKvr3ASWz43Z9MVI7W4c1EaLEmMYffw04C7pUB2D8hvXIO+pIzaIYUrM9YLVjC/
         1C5EAKPNOAkIQAP41Ko10g3F8mH5fzrlelroAjeh/bYh1neiauQB4D/5vG+QTAwcWVDe
         y8EInj58mKbZAdusYo3l6RzOT33o26xAFcNr3zZZgC7DqeTT8z2h0QAjE2v69OOTz88t
         JB0qcvUlRRMBGJsL1RwHPLOsKHf16wmS5mTyiqilA+bkXzZ3cBmBphFxWiqnHzBm0ES/
         PRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729281326; x=1729886126;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7oEArfVPSnqpsijZaXynZDVD27FkpdWWYcqDGTZCjw=;
        b=JCRBtLbUSQ2+Zg1YZY5Rns9QDefw9ItmfIbU8GJlV9s3+vjggCkzz7YuUCvfPh2+MJ
         bPS8rCUqb+9g9CQM6eE+r6AkrOoJbYfnioDT7PnV9KTb6z6FN9BUwH4e6J3/KbtD4J2c
         bHJGy96okUAJANLlcM78f2a9t4b6RQW5/vDoppUhO3HiWUeNYJwtdOaHbY7IAQXQ3juz
         91MDWY4iAHtwSQQkIJbxSJ8RL+iBFj2YcWiyeCxDG4/DeMzneUa0RcCRh78AptaCgQEd
         ZoSK4xap23WvWVenCQc0AlPE2I2uIb7Voqit41e9tNL78D8K1ZYLXOWxZtIj1t71Z3SZ
         GH2g==
X-Forwarded-Encrypted: i=1; AJvYcCWpVyClI4Or9TODzhuwVNGgvdGPA44w+fVl+OJPExd+Jr4wieWNaY3aipi4n2vS9w8xo8HJwYgSu2Ak8w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3CQsoQx9FqrZuwRPjZlROZ1gO5Sfn4Ffb3OOyAweG8w4kME5g
	gLeIlGh5MDkdsIPqjxV/EENOJwsxt6ORC9eGixmIOLnNVgzNb5Pc4Y79B0NkGn8=
X-Google-Smtp-Source: AGHT+IGY1tzB8tvAIhD1Nhz0GdPFPRb4Y+29JKXvh/Pt6G+JZiqk0pPm8ialvF1A0Tuv6DdzKtllhw==
X-Received: by 2002:a05:6870:82a0:b0:277:d360:8971 with SMTP id 586e51a60fabf-2892c549c2amr3875076fac.43.1729281325632;
        Fri, 18 Oct 2024 12:55:25 -0700 (PDT)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eacc226816sm1742765a12.24.2024.10.18.12.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 12:55:25 -0700 (PDT)
Date: Fri, 18 Oct 2024 12:55:25 -0700 (PDT)
X-Google-Original-Date: Fri, 18 Oct 2024 12:55:21 PDT (-0700)
Subject: Re: [PATCH v5 1/2] riscv: perf: add guest vs host distinction
In-Reply-To: <a67d527dc1b11493fe11f7f53584772fdd983744.1728980031.git.zhouquan@iscas.ac.cn>
CC: anup@brainfault.org, ajones@ventanamicro.com, atishp@atishpatra.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Mark Rutland <mark.rutland@arm.com>,
  alexander.shishkin@linux.intel.com, jolsa@kernel.org, linux-kernel@vger.kernel.org,
  linux-riscv@lists.infradead.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
  linux-perf-users@vger.kernel.org, zhouquan@iscas.ac.cn
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zhouquan@iscas.ac.cn, Marc Zyngier <maz@kernel.org>
Message-ID: <mhng-c9ba919e-b4a4-4bb9-bdba-f4d3295a930b@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_125527_393731_ED7D8DC1 
X-CRM114-Status: GOOD (  21.85  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 15 Oct 2024 01:42:50 PDT (-0700), zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
>
> Introduce basic guest support in perf, enabling it to distinguish
> between PMU interrupts in the host or guest, and collect
> fundamental information.
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/include/asm/perf_event.h |  6 +++++
>  arch/riscv/kernel/perf_callchain.c  | 38 +++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
>
> diff --git a/arch/riscv/include/asm/perf_event.h b/arch/riscv/include/asm/perf_event.h
> index 665bbc9b2f84..38926b4a902d 100644
> --- a/arch/riscv/include/asm/perf_event.h
> +++ b/arch/riscv/include/asm/perf_event.h
> @@ -8,7 +8,11 @@
>  #ifndef _ASM_RISCV_PERF_EVENT_H
>  #define _ASM_RISCV_PERF_EVENT_H
>
> +#ifdef CONFIG_PERF_EVENTS
>  #include <linux/perf_event.h>
> +extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
> +extern unsigned long perf_misc_flags(struct pt_regs *regs);
> +#define perf_misc_flags(regs) perf_misc_flags(regs)
>  #define perf_arch_bpf_user_pt_regs(regs) (struct user_regs_struct *)regs
>
>  #define perf_arch_fetch_caller_regs(regs, __ip) { \
> @@ -17,4 +21,6 @@
>  	(regs)->sp = current_stack_pointer; \
>  	(regs)->status = SR_PP; \
>  }
> +#endif
> +
>  #endif /* _ASM_RISCV_PERF_EVENT_H */
> diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
> index c7468af77c66..c2c81a80f816 100644
> --- a/arch/riscv/kernel/perf_callchain.c
> +++ b/arch/riscv/kernel/perf_callchain.c
> @@ -28,11 +28,49 @@ static bool fill_callchain(void *entry, unsigned long pc)
>  void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
>  			 struct pt_regs *regs)
>  {
> +	if (perf_guest_state()) {
> +		/* TODO: We don't support guest os callchain now */
> +		return;

That seems kind of weird, but it looks like almost exactly the same 
thing Marc did in 75e424620a4f ("arm64: perf: add guest vs host 
discrimination").  I think it's safe, as we'll basically just silently 
display no backtrace and we can always just fail to backtrace.

That said: I don't understand why we can't backtrace inside a guest?  If 
we can get the registers and memory it seems like we should be able to.  
Maybe I'm missing something?

> +	}
> +
>  	arch_stack_walk_user(fill_callchain, entry, regs);
>  }
>
>  void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
>  			   struct pt_regs *regs)
>  {
> +	if (perf_guest_state()) {
> +		/* TODO: We don't support guest os callchain now */
> +		return;
> +	}
> +
>  	walk_stackframe(NULL, regs, fill_callchain, entry);
>  }
> +
> +unsigned long perf_instruction_pointer(struct pt_regs *regs)
> +{
> +	if (perf_guest_state())
> +		return perf_guest_get_ip();
> +
> +	return instruction_pointer(regs);
> +}
> +
> +unsigned long perf_misc_flags(struct pt_regs *regs)
> +{
> +	unsigned int guest_state = perf_guest_state();
> +	unsigned long misc = 0;
> +
> +	if (guest_state) {
> +		if (guest_state & PERF_GUEST_USER)
> +			misc |= PERF_RECORD_MISC_GUEST_USER;
> +		else
> +			misc |= PERF_RECORD_MISC_GUEST_KERNEL;
> +	} else {
> +		if (user_mode(regs))
> +			misc |= PERF_RECORD_MISC_USER;
> +		else
> +			misc |= PERF_RECORD_MISC_KERNEL;
> +	}
> +
> +	return misc;
> +}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
