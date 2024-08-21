Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582F0C52D6F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2024 12:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jxDCRJ4ju264wR5p2fCEf0UxQXsM9cKMvsJEMkI6rYI=; b=txuBY6WqzkD2EE
	j5Vh7PZf40WgBk5oEocKrmaO/1uhRjKfPV4U+jzxbOYWMyF9+BUu1HIqcgYuGagFLw2M/x3YZkUHy
	9rhbLkkg2vrtK16VPQGbC+fDTbwY6rg6tNGqKfFrEhEweXX410c5xxpZom8gAWvDPetfpmrT1qZOE
	rcseTVw0NaMYzvFZLaYlqBeo7xZ6RssJvnQnWIiniNGaHZrkdLChCU3GXcmfn5BU7ZqYjOK6hbjpO
	x+RAmge+W+j1KV4AghsdB72y6MuWnNjUXTrDw7MgjA7FtSaTwpWE7byYsmuVDXHJhL711Ihn4849I
	oqOGWHuy/U97x+rcXKlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgkl6-00000008yjQ-2tB8;
	Wed, 21 Aug 2024 12:48:16 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgkl3-00000008yiT-2t0Y
	for linux-riscv@lists.infradead.org;
	Wed, 21 Aug 2024 12:48:15 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5bef4d9e7f8so4569554a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Aug 2024 05:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1724244492; x=1724849292; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=owctU5UF/MrOqJiKH/wjLFTDxdDZZM8Or/kAuo7tn/8=;
        b=Fbp2I9ymLcs89tds9eb4L4ogGHBVURW1PDrkdAIXMlaJgQQCV/lwn0imZ6MUMOIemv
         wdr+IvmfLrK6mbJcmi0Tjn4SssTrHcHCc7VLcB7I+z2JqhrsL81sJ0Xhauv4S99iCy22
         Wp9PqanVsGu5HNhmMjtS/9C12YyzP1cNfoZ+f/3jII8yTU+I/4YVmnq+fr0oL+QLh3uJ
         xNMca+EJbcs7Ist9ledwovSshTzCqeEBjhHEiu7wgOj0NBzXk+WCxZ+rYJVNaSehuPNS
         ZyyQh87n1eKWuTPWeP9pB8ohMuXgJZ0X7CwBmpGHdoUlBOtBHPk6ZFfC/DC7YrUjZPLj
         vX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724244492; x=1724849292;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owctU5UF/MrOqJiKH/wjLFTDxdDZZM8Or/kAuo7tn/8=;
        b=wp+KRgReCqE0W7uWSS5XtnvjF72BU8A5QRCTSC7SSIiy0YNEs1RlfOKnIxaS0NGbc9
         lKzRxWU5OkluyFgfXgCiyXyEIG/KBUe1OTeQj7wnqi+PyE50sYCvx4Q8f9IdosTATXVn
         iH8wl4vLWVgOjLVKMQFUv9CrAWZOhliia3nUICUvtE7OK3+MQxHlpJDwBMgQtPGkZm1B
         mowzGn+ASRqcpaScZUr7E58oTCs67Wr8oIeEyeb8UXT1lMmqAfk0TFk/jbIykwjg3ysk
         K7Gl0rbnOVn6BL8bzQruY09e7c+iTqIj4WTmILZvtPpA8T+hUbi+1lAZ5w+Fvb6OXGC/
         Mmqw==
X-Forwarded-Encrypted: i=1; AJvYcCUx2aXPLPoBuBydF8Dk8bhPDii0Xoz6dFSiC9S7/+nMKz0j600thH8umtb4a3S0fjr8oHCo9D/91iCCkA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzBZnfuY/YBFUDNWoGIgfGtCyTKqXzEvKTUoyvvJi98sJMZC3PQ
	qNxVf54x0QjeJhP/kNzirVjDh4+ZEqrX5AjL34F3mbpsp7m86ivN1LeKY2gr9Ms=
X-Google-Smtp-Source: AGHT+IEBHJpECbZj9IKLd7v7eqsKAcU06neT/8vBwwygqFiwFCmvnkErVfPeY9IwiKfaKQItm4XXxw==
X-Received: by 2002:a17:907:a41:b0:a7d:3de1:4ab2 with SMTP id a640c23a62f3a-a866f3616a2mr165794866b.27.1724244491373;
        Wed, 21 Aug 2024 05:48:11 -0700 (PDT)
Received: from localhost (cst2-173-13.cust.vodafone.cz. [31.30.173.13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838c69easm901792366b.40.2024.08.21.05.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 05:48:10 -0700 (PDT)
Date: Wed, 21 Aug 2024 14:48:10 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v2 1/2] riscv: perf: add guest vs host distinction
Message-ID: <20240821-f5e1d6afb0d2230c1256a75b@orel>
References: <cover.1723518282.git.zhouquan@iscas.ac.cn>
 <3729354b59658535c4370d3c1c7e2f162433807b.1723518282.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3729354b59658535c4370d3c1c7e2f162433807b.1723518282.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_054813_753506_EF1B4E0B 
X-CRM114-Status: GOOD (  24.01  )
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

On Tue, Aug 13, 2024 at 09:23:54PM GMT, zhouquan@iscas.ac.cn wrote:
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
> index 665bbc9b2f84..c2b73c3aefe4 100644
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
> +extern unsigned short perf_misc_flags(struct pt_regs *regs);
> +#define perf_misc_flags(regs) perf_misc_flags(regs)
> +
>  #define perf_arch_fetch_caller_regs(regs, __ip) { \
>  	(regs)->epc = (__ip); \
>  	(regs)->s0 = (unsigned long) __builtin_frame_address(0); \
>  	(regs)->sp = current_stack_pointer; \
>  	(regs)->status = SR_PP; \
>  }
> +#endif
> +
>  #endif /* _ASM_RISCV_PERF_EVENT_H */
> diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
> index 3348a61de7d9..7af90a3bb373 100644
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
> +unsigned short perf_misc_flags(struct pt_regs *regs)

I see that the consumer of perf_misc_flags is only a u16, but all other
architectures define this function as returning an unsigned long, and
your last version did as well. My comment in the last version was that
we should use an unsigned long for the 'misc' variable to match the
return type of the function. I still think we should do that instead
since the function should be consistent with the other architectures.

> +{
> +	unsigned int guest_state = perf_guest_state();
> +	unsigned short misc = 0;
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
