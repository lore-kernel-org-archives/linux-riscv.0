Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A069BC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 10:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qvQU4hyhGEXjIXkCZaTOc48D2nXAT0e8T3YBYB/aNxY=; b=sS9UQ8c1Lb1TWj
	grJzbsl2UiDX4h8UNQCp+R3czLxA90kSHqCgWMSUkuIDjwweFvhfHpTvyfBpNo1F91oLS+gC6WIRm
	9Ac+KLKCB6vIqdIyJQ2hp6fajyUuZaX5iVT4lZl+yPKuS0F1ygoJy51/OUrKzrCJaCqnXJ6KCsOVz
	0QZlppVus5wZ71Z/62b7kxNXKPhHuyhxL0Xt76gugon0aUM4GVG/2GdyuTUMMS+Ohk5BgRj0Wfvnx
	9eSmEob2bsSPQuSOnxUHl8GT5fftK2QTLism5EP9yww+d71nQuiVCJZKlG9PpPqSmYDRMboyKJ7lH
	mR64y32bI45WJuKQbDHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKcGq-007dNO-0a;
	Tue, 02 Jan 2024 10:45:16 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKcGn-007dMU-21
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 10:45:14 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-55642663ac4so1304844a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jan 2024 02:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704192310; x=1704797110; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A9aUIH6joDAn7FCueUrn26yQ88JnL3adYdiN3aOGRS0=;
        b=WC7fY1mt+w3bnaHtfI5U+qOrXpmIIINFX5xtR4QB90PiUohyLVpmWwPqbMmDzDv5of
         rjHY2Td6N7OUK6InZxmckmg60/MUwm9P3UfBmCifQhUmcq1izOCR0YsMihPgyToZIoGp
         rJN2lJ4lS1cbLKITT5gwfv7qVF3jyht2YGFngDBD/oR6gQz6yiD2r/ZAq+CijK+Pa4vL
         Ztq5Rfp8M3nBm6lNXtYmvI6wDurMkXM7Q6sGe3QpdCMvj/JPDUqAtdgumpm+hXheZ8Dx
         i9xUrNVx1aAWjvK586IMUQ14lHWtHN4BQsa1cfzYbIBhtXONeVYno5hI6dpv+5LWCWi/
         Wtrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704192310; x=1704797110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A9aUIH6joDAn7FCueUrn26yQ88JnL3adYdiN3aOGRS0=;
        b=UB5AhUpjNQprbYvyvRmBzVIRMEo86MUJZINmr3rwm2SLBx1L0H0GJHoj1TNEhbgIp1
         OxqgxKdo+VbTgtgpjm3iIg8vro9Vkp7ArQ99W16LFRMacGX002IVRB4RG1WzkOQS2BSi
         jWdhHzlthKmUpxvyvxFRYNU99m3P95Lw7CwcU/vt9pEN46fC8RfxM61xmQzoujM0TjtF
         ZKfHOZtNAodw9Y6RazAkNsY75BBby80LPnnUACsxFqQYtlQ1i6XTfQK3SBPOLow27UZq
         6g7AjnmdTW/LUbmSlxfh9ceISzxHr0xDSo9bzaGJaSKGiOZyn/zFq82pqd+GQUx6hmPw
         3LMw==
X-Gm-Message-State: AOJu0YwWHVW6rojcccG8glyfVqW93JkZS+nWW4HsDN23IhDheliffJ5c
	wXKR7eQyMvW7wcrsO4Uum+opmyg9WMJAGQ==
X-Google-Smtp-Source: AGHT+IHY9T5LH9nupqPCh6LPcY8T090GtaEOvzBuU/t6qszMQfPHzhWt7PIWk2kTHJi3C8h7IolBGg==
X-Received: by 2002:a50:871a:0:b0:553:738a:655f with SMTP id i26-20020a50871a000000b00553738a655fmr11239178edb.9.1704192310006;
        Tue, 02 Jan 2024 02:45:10 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id eg14-20020a056402288e00b00556aa0b342csm110085edb.55.2024.01.02.02.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 02:45:09 -0800 (PST)
Date: Tue, 2 Jan 2024 11:45:08 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: guoren@kernel.org
Subject: Re: [PATCH V2 2/3] riscv: Add ARCH_HAS_PRETCHW support with Zibop
Message-ID: <20240102-7e62facbd8322db4dee4b0dd@orel>
References: <20231231082955.16516-1-guoren@kernel.org>
 <20231231082955.16516-3-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231231082955.16516-3-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_024513_665787_D3B8D270 
X-CRM114-Status: GOOD (  18.16  )
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
Cc: wefu@redhat.com, keescook@chromium.org, peterz@infradead.org, unicorn_wang@outlook.com, atishp@atishpatra.org, chao.wei@sophgo.com, bjorn@rivosinc.com, linux-kernel@vger.kernel.org, xiaoguang.xing@sophgo.com, conor.dooley@microchip.com, leobras@redhat.com, palmer@dabbelt.com, jszhang@kernel.org, paul.walmsley@sifive.com, Guo Ren <guoren@linux.alibaba.com>, panqinglin2020@iscas.ac.cn, linux-riscv@lists.infradead.org, wuwei2016@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


s/Zibop/Zicbop/ <<<$SUBJECT

On Sun, Dec 31, 2023 at 03:29:52AM -0500, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Enable Linux prefetchw primitive with Zibop cpufeature, which preloads

Also s/Zibop/Zicbop/ here

> cache line into L1 cache for the next write operation.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/include/asm/processor.h | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index f19f861cda54..8d3a2ab37678 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -13,6 +13,9 @@
>  #include <vdso/processor.h>
>  
>  #include <asm/ptrace.h>
> +#include <asm/insn-def.h>
> +#include <asm/alternative-macros.h>
> +#include <asm/hwcap.h>
>  
>  #ifdef CONFIG_64BIT
>  #define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
> @@ -106,6 +109,19 @@ static inline void arch_thread_struct_whitelist(unsigned long *offset,
>  #define KSTK_EIP(tsk)		(task_pt_regs(tsk)->epc)
>  #define KSTK_ESP(tsk)		(task_pt_regs(tsk)->sp)
>  
> +#ifdef CONFIG_RISCV_ISA_ZICBOP
> +#define ARCH_HAS_PREFETCHW
> +
> +#define PREFETCHW_ASM(x)						\
> +	ALTERNATIVE(__nops(1), CBO_PREFETCH_W(x, 0), 0,			\
> +		    RISCV_ISA_EXT_ZICBOP, CONFIG_RISCV_ISA_ZICBOP)
> +
> +
> +static inline void prefetchw(const void *x)
> +{
> +	__asm__ __volatile__(PREFETCHW_ASM(%0) : : "r" (x) : "memory");
> +}

Shouldn't we create an interface which exposes the offset input of
the instruction, allowing a sequence of calls to be unrolled? But
I guess that could be put off until there's a need for it.

> +#endif /* CONFIG_RISCV_ISA_ZICBOP */
>  
>  /* Do necessary setup to start up a newly executed thread. */
>  extern void start_thread(struct pt_regs *regs,
> -- 
> 2.40.1
> 

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
