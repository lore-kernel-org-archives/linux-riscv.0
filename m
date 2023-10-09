Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4213CD6115
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 17:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UdUfMPmb3opkGYCFri4IcE9pwnBDZ9fpaOxy4y7+/2s=; b=uzzihimYkImOjf
	SKKnQVZvT6S2v6KXCTzmyqqYVioT5S1T+1KC0E6d4bbwMBuafxAjhMK9tcE4kz7gwfDeNWETlUIm0
	4cRRmfOdCm8rLoqg0hsjwWFPpdyRDXyqeen9PaFv/R5ZRk1xk0MHhC8tlF1vsad3Ak3KBu2r0iRhx
	fRWQhZazKqVZp++BCDJNbViweoBtnhpxPLqf5OGqchiLr+mvFaGTLQatwdJjna/bBpdAbhezAX43l
	5QMo3FXFF8TBV1x2UqRslMEoKA8aq9H8M1et3sycE61SWA53cqShoSQ7ajktocwFyqL+UMCgrkffR
	vY5tPDCnyAVcJfzPbqWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpuHo-00BKtc-2I;
	Mon, 09 Oct 2023 17:43:20 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpuHl-00BKsi-0h
	for linux-riscv@lists.infradead.org;
	Mon, 09 Oct 2023 17:43:19 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3af5b5d7f16so3212604b6e.0
        for <linux-riscv@lists.infradead.org>; Mon, 09 Oct 2023 10:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696873394; x=1697478194; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NnMTttrcelYaYIrt+NLGLTTRb9JsbmWtmliQHucd1xA=;
        b=yrDNuUeuVhihKMW7Q7zKhA4aNlXIAs+Yi4YHhSTn/otPqv1NFDB+V8Zjcb+Fk+tRQA
         MQMQi5f92VpAhr9zMZVx3VbwQaG4DplEyamSExe5p0abMFrouVPHHPmpFu8eGe1IOH/j
         uU7rsGx12NhzPo6e7Y+4Trkh9/c1YHAM8Q8Rynvzu3XAkgKo2WZXwZ8oYVeTVGU0fKl1
         KkVvnG1YHxrcHIslOfCMVUNyE8es2aZVQNu3PctLqd0a2A4Anqr4GtpW5VmCxoniMSMJ
         P4s/85iuJXK9ZZ3FPIzG+6+8VFgFSGeaVzm5wYKNCEG7BttPD1rT4dYjQt5lVqD4nZEc
         OpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696873394; x=1697478194;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NnMTttrcelYaYIrt+NLGLTTRb9JsbmWtmliQHucd1xA=;
        b=RmLWF8J77nSNTKI1PsgIQAf2zcZwf0mAlsYxLroYfzX+7ly+5pXsRCeu2FRTl0/kE6
         PjD2EpKYc3Qm2nmvQUPQk9LnTf7Ze4Yp3o9aLtEAyxQGy1R8BNLcraF2ndEzEZDVrt18
         R9/w0SeXkH3/emuRXvjnil2A5VLoIsItZI4fpixDrOjXyBAOz2aLBBa02iZGS1ySOGoZ
         1lQSDVj+RToa7nJ2OokfehDrrIQKbfK3b2zIitIW/9cz4yliuWVPKrzBXqZYdofwOorz
         oqXDlcfBRdI93SGNTDZAaG0aLqXKlKa5Z34dwbQ9m7HT6bHFfL7da/0MQ/La/uBKNX4p
         sNmw==
X-Gm-Message-State: AOJu0YzUxSVnk1OpQeJin86ES0uc+2wC1RTw19U3EJPTh8yXqRlZhRoo
	Xy+5dOqTIgAppPTpR/VU+IrN698dVncDbC07J3k=
X-Google-Smtp-Source: AGHT+IHZOPERIxv0UhvXDWOFJscOkAdsaQuB2oqGGE5poJEQl40iPqlD+Ja7r74zSfxA4QhVkNZiEA==
X-Received: by 2002:a05:6808:18a1:b0:3ae:156f:d325 with SMTP id bi33-20020a05680818a100b003ae156fd325mr19459911oib.58.1696873394538;
        Mon, 09 Oct 2023 10:43:14 -0700 (PDT)
Received: from ghost (cpe-70-95-50-247.san.res.rr.com. [70.95.50.247])
        by smtp.gmail.com with ESMTPSA id c20-20020a056808105400b003a40b3fce01sm1676687oih.10.2023.10.09.10.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Oct 2023 10:43:14 -0700 (PDT)
Date: Mon, 9 Oct 2023 10:43:10 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: blacklist assembly symbols for kprobe
Message-ID: <ZSQ7rp98jX4KiZCJ@ghost>
References: <20231004131009.409193-1-cleger@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231004131009.409193-1-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_104317_279085_5B53B215 
X-CRM114-Status: GOOD (  17.56  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Oct 04, 2023 at 03:10:09PM +0200, Cl=E9ment L=E9ger wrote:
> Adding kprobes on some assembly functions (mainly exception handling)
> will result in crashes (either recursive trap or panic). To avoid such
> errors, add ASM_NOKPROBE() macro which allow adding specific symbols
> into the __kprobe_blacklist section and use to blacklist the following
> symbols that showed to be problematic:
> - handle_exception()
> - ret_from_exception()
> - handle_kernel_stack_overflow()
> =

> Signed-off-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> ---
>  arch/riscv/include/asm/asm.h | 10 ++++++++++
>  arch/riscv/kernel/entry.S    |  3 +++
>  2 files changed, 13 insertions(+)
> =

> diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
> index 114bbadaef41..9194e334de15 100644
> --- a/arch/riscv/include/asm/asm.h
> +++ b/arch/riscv/include/asm/asm.h
> @@ -142,6 +142,16 @@
>  	REG_L x31, PT_T6(sp)
>  	.endm
>  =

> +/* Annotate a function as being unsuitable for kprobes. */
> +#ifdef CONFIG_KPROBES
> +#define ASM_NOKPROBE(name)				\
> +	.pushsection "_kprobe_blacklist", "aw";		\
> +	RISCV_PTR name;					\
> +	.popsection
> +#else
> +#define ASM_NOKPROBE(name)
> +#endif
> +
>  #endif /* __ASSEMBLY__ */
>  =

>  #endif /* _ASM_RISCV_ASM_H */
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 143a2bb3e697..f24bc4eeedde 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -101,6 +101,7 @@ _save_context:
>  1:
>  	tail do_trap_unknown
>  SYM_CODE_END(handle_exception)
> +ASM_NOKPROBE(handle_exception)
>  =

>  /*
>   * The ret_from_exception must be called with interrupt disabled. Here i=
s the
> @@ -167,6 +168,7 @@ SYM_CODE_START_NOALIGN(ret_from_exception)
>  	sret
>  #endif
>  SYM_CODE_END(ret_from_exception)
> +ASM_NOKPROBE(ret_from_exception)
>  =

>  #ifdef CONFIG_VMAP_STACK
>  SYM_CODE_START_LOCAL(handle_kernel_stack_overflow)
> @@ -254,6 +256,7 @@ restore_caller_reg:
>  	move a0, sp
>  	tail handle_bad_stack
>  SYM_CODE_END(handle_kernel_stack_overflow)
> +ASM_NOKPROBE(handle_kernel_stack_overflow)
>  #endif
>  =

>  SYM_CODE_START(ret_from_fork)
> -- =

> 2.42.0
> =

> =

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
