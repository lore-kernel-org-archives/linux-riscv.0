Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37316C25B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 21 May 2024 22:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QoTzXHdN0/Xp3Fct5n4qXMBoY3CdNR+VyrXKXT6wWYQ=; b=pt6X9+FxKJFbRp
	4s12s2/O7nKOSktMzfX811nWBO+sba6XQlxKTOnjFtUiHARaNhB+zMTYmahrwzhxaZyLXSQt25I1h
	1jWhuGuYauikVyaAjIGUYjav40X3RsSbI1iXbcQL8Uakfs3La9Ht0u3HuJdS3maTGIGFXT3NJRSVg
	jdB990MrNYTsTcPz3jczLUBI3zLzJnU4yg7wMTQergDxAKq0rxSAJk+U3THQGJpjLTnLEMPi5Ite6
	cS6+PR5jQOGaGTCE23IusipfIv3h0lcZi07IcWzqhnTtMTlu2HmjqyarxPqmGIc1c6yarDC21cMRE
	aaAq3hv6526tUDQIy9qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9XsF-00000001Esf-2Dvr;
	Tue, 21 May 2024 22:22:23 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9XsB-00000001Enh-3a01
	for linux-riscv@lists.infradead.org;
	Tue, 21 May 2024 22:22:21 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-36dd37767dfso8658645ab.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 15:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1716330132; x=1716934932; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nsf8SrCeR4KSgkFV5c3G1dvBTUXk7qKqUjOXNsEW4qo=;
        b=YLe3eUlWmMizwxhfcF6aHtIFHZioU+B0SGP/VGXNPtWvoS1jqlyV1sgTNGrHZmxG7D
         zKXjMQAy+5Utf1itnk0ocUXxSgNYGc8tTuAu3Ngg2k0fr551UHaA/WxmEfXw2USve//+
         t4oA7GxIdAO8KFGSQsesBDDEIqx8fJtD23l4qKBro5HS/NO4ISv9S/S8yWYiMp7OKBxV
         LlGQO6GhrT10FNx72e9bgpQPq8zQmgg4KiBBZbqfYWW2lQWc2hOCvb+RbnWPlXOxh4L1
         laB3NKzCuNKDl+sM4eqc+iFHXokCZgChUrUx/51E56XMdpveciiYOGYDalBGtTspsHW3
         8JYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716330132; x=1716934932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Nsf8SrCeR4KSgkFV5c3G1dvBTUXk7qKqUjOXNsEW4qo=;
        b=n2SVjElHFiGodNJEqjnp/TQLlGNZfwMM2Ag+fy34yrOtOtGIGGS5IDHc8pd3k/bro0
         EEjOMG0dfcX5DBuGCCWLn47MKOFhz2J7/mxGnxaEM/XjFMRuCzYKSUmzBCqGOBfWu4RZ
         FJLnnaxeD5uvI7kTOIa2MYk17p9cS8wgeLxiVEs+mWQM88Fo/wHYZvhx2J2m5DNseLDC
         d5vBKgnlS6z5hRkRRxNHLNurh2/EQditdUyBkQk8TbZgi0gDThL0tGJHpdseFLTNqG+C
         /FMSl28h2rwyY50Qsrw2QjossgmRZd7P0y3HEN9+dpip/SeZ7OE0tzA66LFlqdDNit1E
         L79A==
X-Gm-Message-State: AOJu0YyGWrgB0slTStwjTE9AQ7QM9ZSbjBn45tTpMPrwFCooJ352IzOL
	FMAMITglwn8pk/cDM9kurDISovkiB2iR4m3d2qoPvlYzpwhqdqQZijX3cFfqPGI=
X-Google-Smtp-Source: AGHT+IEpjfL72/gE9z+Nthm8neHTNF0kcd5zwmS6OUPXKsFgEGGcbjhXNons6AqWaDOUZobOBTda+w==
X-Received: by 2002:a05:6e02:1a2a:b0:36b:1e1:552f with SMTP id e9e14a558f8ab-371faf56c05mr3538565ab.23.1716330131517;
        Tue, 21 May 2024 15:22:11 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.197])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-371d3955b58sm1438205ab.77.2024.05.21.15.22.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 May 2024 15:22:11 -0700 (PDT)
Message-ID: <e7632a45-46ea-429a-8af5-48a17650a092@sifive.com>
Date: Tue, 21 May 2024 17:22:09 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] riscv: stacktrace: fixed walk_stackframe()
To: Matthew Bystrin <dev.mbstr@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org
References: <20240521191727.62012-1-dev.mbstr@gmail.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240521191727.62012-1-dev.mbstr@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_152220_195728_D14596A3 
X-CRM114-Status: GOOD (  28.57  )
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

On 2024-05-21 2:13 PM, Matthew Bystrin wrote:
> If the load access fault occures in a leaf function (with
> CONFIG_FRAME_POINTER=y), when wrong stack trace will be displayed:
> 
> [<ffffffff804853c2>] regmap_mmio_read32le+0xe/0x1c
> ---[ end trace 0000000000000000 ]---
> 
> Registers dump:
>     ra     0xffffffff80485758 <regmap_mmio_read+36>
>     sp     0xffffffc80200b9a0
>     fp     0xffffffc80200b9b0
>     pc     0xffffffff804853ba <regmap_mmio_read32le+6>
> 
> Stack dump:
>     0xffffffc80200b9a0:  0xffffffc80200b9e0  0xffffffc80200b9e0
>     0xffffffc80200b9b0:  0xffffffff8116d7e8  0x0000000000000100
>     0xffffffc80200b9c0:  0xffffffd8055b9400  0xffffffd8055b9400
>     0xffffffc80200b9d0:  0xffffffc80200b9f0  0xffffffff8047c526
>     0xffffffc80200b9e0:  0xffffffc80200ba30  0xffffffff8047fe9a
> 
> The assembler dump of the function preambula:
>     add     sp,sp,-16
>     sd      s0,8(sp)
>     add     s0,sp,16
> 
> In the fist stack frame, where ra is not stored on the stack we can
> observe:
> 
>         0(sp)                  8(sp)
>         .---------------------------------------------.
>     sp->|       frame->fp      | frame->ra (saved fp) |
>         |---------------------------------------------|
>     fp->|         ....         |         ....         |
>         |---------------------------------------------|
>         |                      |                      |
> 
> and in the code check is performed:
> 	if (regs && (regs->epc == pc) && (frame->fp & 0x7))
> 
> I see no reason to check frame->fp value at all, because it is can be
> uninitialized value on the stack. A better way is to check frame->ra to
> be an address on the stack. After the stacktrace shows as expect:
> 
> [<ffffffff804853c2>] regmap_mmio_read32le+0xe/0x1c
> [<ffffffff80485758>] regmap_mmio_read+0x24/0x52
> [<ffffffff8047c526>] _regmap_bus_reg_read+0x1a/0x22
> [<ffffffff8047fe9a>] _regmap_read+0x5c/0xea
> [<ffffffff80480376>] _regmap_update_bits+0x76/0xc0
> ...
> ---[ end trace 0000000000000000 ]---
> As pointed by Samuel Holland it is incorrect to remove check of the stackframe
> entirely.
> 
> Changes since v2 [2]:
>  - Add accidentally forgotten curly brace
> 
> Changes since v1 [1]:
>  - Instead of just dropping frame->fp check, replace it with validation of
>    frame->ra, which should be a stack address.
>  - Move frame pointer validation into the separate function.
> 
> [1] https://lore.kernel.org/linux-riscv/20240426072701.6463-1-dev.mbstr@gmail.com/
> [2] https://lore.kernel.org/linux-riscv/20240521131314.48895-1-dev.mbstr@gmail.com/
> 
> Fixes: f766f77a74f5 ("riscv/stacktrace: Fix stack output without ra on the stack top")
> Signed-off-by: Matthew Bystrin <dev.mbstr@gmail.com>
> ---
>  arch/riscv/kernel/stacktrace.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
> index 64a9c093aef9..528ec7cc9a62 100644
> --- a/arch/riscv/kernel/stacktrace.c
> +++ b/arch/riscv/kernel/stacktrace.c
> @@ -18,6 +18,16 @@
>  
>  extern asmlinkage void ret_from_exception(void);
>  
> +static inline int fp_is_valid(unsigned long fp, unsigned long sp)

It would make sense for this function to return bool, but the generated code
would be the same, so:

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>

> +{
> +	unsigned long low, high;
> +
> +	low = sp + sizeof(struct stackframe);
> +	high = ALIGN(sp, THREAD_SIZE);
> +
> +	return !(fp < low || fp > high || fp & 0x07);
> +}
> +
>  void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
>  			     bool (*fn)(void *, unsigned long), void *arg)
>  {
> @@ -41,21 +51,19 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
>  	}
>  
>  	for (;;) {
> -		unsigned long low, high;
>  		struct stackframe *frame;
>  
>  		if (unlikely(!__kernel_text_address(pc) || (level++ >= 0 && !fn(arg, pc))))
>  			break;
>  
> -		/* Validate frame pointer */
> -		low = sp + sizeof(struct stackframe);
> -		high = ALIGN(sp, THREAD_SIZE);
> -		if (unlikely(fp < low || fp > high || fp & 0x7))
> +		if (unlikely(!fp_is_valid(fp, sp)))
>  			break;
> +
>  		/* Unwind stack frame */
>  		frame = (struct stackframe *)fp - 1;
>  		sp = fp;
> -		if (regs && (regs->epc == pc) && (frame->fp & 0x7)) {
> +		if (regs && (regs->epc == pc) && fp_is_valid(frame->ra, sp)) {
> +			/* We hit function where ra is not saved on the stack */
>  			fp = frame->ra;
>  			pc = regs->ra;
>  		} else {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
