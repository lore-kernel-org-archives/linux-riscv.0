Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF32C3DA63
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jul 2024 16:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ORoNrlH8gIksyICFp8bpy3wdQwvh9zJ/Q0VN6ZIWxYU=; b=Wif4LmncL2mXo9
	jHbi75qtpTbxoC0csUA2P5nCTeS26lMGhfoHUcmHrqyZ99SEJmOWc7LVkjlKoVJb+KzQRRnC5lY1j
	WDoxEhKK2vOEtHpyodDcIT1fi8rv0JEE6nwxOdTtDKeWgxbo0B2omaP7+Szd4utk6stmL97zzxJuH
	WitHpS6QW/t74m+0vywI/xt44cLC0dfwHE0PB0L6HOUfe8Q5qC7y2fYNf9O27j79x+K1uLLjdVLfw
	g5foVe+M0HMejug3HbrLkJpZRDR3eQ1A78yGNo20SjI8nvkQDyHyl9lyms62i4Kq3y2GVtB7jz5c1
	yWcVjP9Lexlvv+9zQaxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUUOC-000000001mC-0UBb;
	Thu, 18 Jul 2024 16:53:56 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUUO8-000000001lC-3JYr
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jul 2024 16:53:54 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-8036ce66164so32656939f.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jul 2024 09:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721321631; x=1721926431; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9zJZZ9bWEPMAlkC/QkLHGli62aQv2OdpuoT4H3F0l2Y=;
        b=LSa1n7QJsW7GmYuqvY1gbN+8frBShfBIrSrkbBNNXhWD7/r3tVuXsdUX5Fo4FB2cfo
         bj3S/cqDM38a0M1U7oIYouNn8qnsnTJx8jNgQYEqj5XNnmpV7H8ERyJ+eUP9LKYdSjKa
         QnZqID3fkZaEFVxw+GtjNWiJp+sIzQPAdlCxcgUZLgna+1rMyYlNk4fQNeQpBDcGoNc3
         /nEKC8EeVYzL9GTxIXJrdCTQlUiMSKaQmmRXFz4WPXH3jYnmJ5aM2OtSsNez1PDQwe0c
         avzA33TkBao+2ovlaK1DHm3bkrk8KHcwXL3MGdaYxf77kyiNRUBUcNYhEoKweKOZt0Kc
         5Zjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721321631; x=1721926431;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zJZZ9bWEPMAlkC/QkLHGli62aQv2OdpuoT4H3F0l2Y=;
        b=SDjGdK5sPWI1/6XQI7zg/CvT0luWQw1nUd3RTVuhOMNg+iHu9634jwnWhLJwob7+cZ
         F0wkQTabxEeqYLUF4Py2u/pLtUi8DzeEbhNXa3o1Hc2odVKT0YOYTBFWIfQ6UO7HlHWr
         Ez/9Lu0xHdlzBvNndV8bG8M07t9b40ToHggXfLRP0mkYdTtUxxDsHR9ZPSqXY099Xe/p
         vHl/tMzUDvvLzfUhhWJ7dV94k3d6yNaNFc9HOd+IuginW2J9OGPA1lg80UM3wurvqLTT
         DV47Qv0+w+Mi2wdvWF/xxJ1SyZAzoLWoev0y4yBuZMMbYWpbcTTSFX7i1MV8Eof1+2zk
         52kA==
X-Forwarded-Encrypted: i=1; AJvYcCXRcVgjtVIxGp2yPrJHPnyRfUZvioDQcbfVHHo1YFmGTQqp0v31P0c+YeGIpq2Kknkj5QitICkgcXr84Bccku3IflY8dJ1r8UZsx7YITBqb
X-Gm-Message-State: AOJu0YzeUnEHeSthgv0hB2laEPmnzxU6Gc7paVyOYkfWMJfsgZ/zO9Sz
	r27XvJ6OmyL8fjYfebtjRIi5hh4U20F/tLrKHTPRJWEaAcG+0KRhAqiYCGNH9LM=
X-Google-Smtp-Source: AGHT+IFngzTW8EHtTFvx7omE0v/qG3WhmjLl/7uA05MsoNd2N82RVXCmEyfoWoRu19pmQ31JPxhJiA==
X-Received: by 2002:a05:6602:1605:b0:7f9:beb8:7952 with SMTP id ca18e2360f4ac-81711e19b10mr820491439f.13.1721321630783;
        Thu, 18 Jul 2024 09:53:50 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c210f24b6fsm1606088173.94.2024.07.18.09.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 09:53:50 -0700 (PDT)
Date: Thu, 18 Jul 2024 11:53:49 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-perf-users@vger.kernel.org, 
	anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org
Subject: Re: [PATCH 1/2] riscv: perf: add guest vs host distinction
Message-ID: <20240718-e689be134be5b958b1eec65a@orel>
References: <cover.1721271251.git.zhouquan@iscas.ac.cn>
 <8e2d2f60fc30d64b6c69b38184a1b640c7b30003.1721271251.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8e2d2f60fc30d64b6c69b38184a1b640c7b30003.1721271251.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240718_095352_840277_C56D5AB2 
X-CRM114-Status: GOOD (  21.66  )
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

On Thu, Jul 18, 2024 at 07:23:41PM GMT, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> Introduce basic guest support in perf, enabling it to distinguish
> between PMU interrupts in the host or guest, and collect
> fundamental information.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/include/asm/perf_event.h |  7 ++++++
>  arch/riscv/kernel/perf_callchain.c  | 38 +++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/perf_event.h b/arch/riscv/include/asm/perf_event.h
> index 665bbc9b2f84..5866d028aee5 100644
> --- a/arch/riscv/include/asm/perf_event.h
> +++ b/arch/riscv/include/asm/perf_event.h
> @@ -8,13 +8,20 @@
>  #ifndef _ASM_RISCV_PERF_EVENT_H
>  #define _ASM_RISCV_PERF_EVENT_H
>  
> +#ifdef CONFIG_PERF_EVENTS
>  #include <linux/perf_event.h>
>  #define perf_arch_bpf_user_pt_regs(regs) (struct user_regs_struct *)regs
>  
> +extern unsigned long perf_instruction_pointer(struct pt_regs *regs);
> +extern unsigned long perf_misc_flags(struct pt_regs *regs);
> +#define perf_misc_flags(regs) perf_misc_flags(regs)
> +
>  #define perf_arch_fetch_caller_regs(regs, __ip) { \

Arm has this outside the #ifdef CONFIG_PERF_EVENTS, but it doesn't
look like it should be.

>  	(regs)->epc = (__ip); \
>  	(regs)->s0 = (unsigned long) __builtin_frame_address(0); \
>  	(regs)->sp = current_stack_pointer; \
>  	(regs)->status = SR_PP; \
>  }
> +#endif
> +
>  #endif /* _ASM_RISCV_PERF_EVENT_H */
> diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
> index 3348a61de7d9..c673dc6d9bd2 100644
> --- a/arch/riscv/kernel/perf_callchain.c
> +++ b/arch/riscv/kernel/perf_callchain.c
> @@ -58,6 +58,11 @@ void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
>  {
>  	unsigned long fp = 0;
>  
> +	if (perf_guest_state()) {
> +		/* TODO: We don't support guest os callchain now */
> +		return;
> +	}
> +
>  	fp = regs->s0;
>  	perf_callchain_store(entry, regs->epc);
>  
> @@ -74,5 +79,38 @@ static bool fill_callchain(void *entry, unsigned long pc)
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
> +	int misc = 0;

Should use unsigned long for misc.

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
> -- 
> 2.34.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
