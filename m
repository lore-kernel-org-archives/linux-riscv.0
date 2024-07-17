Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EBEC3DA42
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jul 2024 13:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rlG4yP4YwD+tho06X7wsXvxnZuweEOkpML2HVA7Ezmw=; b=Fgy9MNryjoqm13
	o2/yQjDfcYXB4FHQS2U2xEHXw0yUnw9Y7hlA+ASYcS7KO8E+OOhUEVFQx6Ysa6LLN9rD+PGV0X7kD
	gTiIoD5aEPylumG+oJjDAU7nuxQbrQMzxM+BC5iLvZQmoFwPJ+82VJpP9k06XPN8/6tnG+reDWi2S
	hlp2YGmfT74t4Mt/1lKLwa0DlvwwAl2xsEixF9r2/OKaOy0auLF8Cgc9IoH6Kw8hAv0nHns9y8kOh
	U9laH9CwvobPDsMXoqGhVCQ6ODKx/ipRC7n37FYS+wBD4s1r12TmEamZ/OyhQm/e6yz36mdY2hsVh
	cA5ddy3Rl/GtqhDDv7Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU4VV-0000000DrfF-3xEx;
	Wed, 17 Jul 2024 13:15:45 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sU4VS-0000000DreG-2M4N
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jul 2024 13:15:44 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-8036ce6631bso39526239f.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jul 2024 06:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721222141; x=1721826941; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nfyN59SqKKWvXLU3CmJIUvS3Qc0ugEMt32zK3kDXEnU=;
        b=CbHIVHqKQFeV9IKxuB8rkoR1ILS9Orz2foh13YRBkUXTEsbjMfkLH/Q5ty41+E5dMK
         pBtNH9yPxVAZH2zplXqdVYulIhV5o7yZps7RVk+fIg7xsnOTqH7si/6F/A1779kqX0Nu
         KOU4gkkY7KPetRsK/vuSGRLdkA2EqxswV1pgJ9boMwi6t1BmEk3ZDsHu8q/TPIHWKXAi
         0fiayV7inX3B3Q9uATLvYEGdwj7yF5FHoRVz4/C8f00dEC5U/mTVvuc1v5X2Ribc9s0V
         wlGueW9xPBy2XEmaoU9ZH4ilDXWV3KDKMyGS+wIIhTqUt4OVOhwbqovn6uBmZDmpIPf0
         vxiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721222141; x=1721826941;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nfyN59SqKKWvXLU3CmJIUvS3Qc0ugEMt32zK3kDXEnU=;
        b=Zptiw6CRZ+LX3qQG9GQmOYKQWTYaRf7lfwLm9whPw+ToeTcUeVOSwQu4D/tHgAmSix
         MUgCn3Zhvz2LAlb/iT26HFrHMd4992/xApG8hJR3G/uF4cOYb3LsEKmsRPGWHmPPa9Ox
         zxqJ4o6tTlT764cHRt+Z+mV+QfaJnGZpWQpjyLuZCjU5b2UK6FNCWJW38Ahr4+O3hwbJ
         jtDF4yrdhY5W/5D7bbHzqTgspRwM4JsI0aYutMonTk9mKUThhLsycnrUdJHW40LJsyRr
         Rhic6Z0+Zf7qBlnXEHAXQGj853x+k/2Jpf5IP/inUqt4Q9UoM1qC+iUVYK2C0jS9V/2N
         XozA==
X-Forwarded-Encrypted: i=1; AJvYcCUEVPVYPnfA8Q4vQWa0CV1u9MYnwr5ESZsTRpeOPEDkJWWRJWyE8cYuFoLGQgIMA93YG1DO4Bv9tw+C60Qfgz0LPL1CR95SDtdtm3cjZVNw
X-Gm-Message-State: AOJu0YyRedZ8tM0VsImqVkgu6HWbE43k+S9I9jiEv1kRBojpj2wAGxUv
	/9q0/zaxQVRSImb5zsRo8+tj7kWxPXNu+0VZihpXV28LpJ6JAlfzGP8bL2zzCEc=
X-Google-Smtp-Source: AGHT+IGqABt+N2by4fsdmIqsdoYWgZufcwOnrxKz5lnVlQ+PsNG/iBjeIJbo82SPl4wG/8emOYWz6A==
X-Received: by 2002:a05:6602:1406:b0:7f9:1b3b:8465 with SMTP id ca18e2360f4ac-817109e76cbmr216963839f.11.1721222141068;
        Wed, 17 Jul 2024 06:15:41 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c210f21be4sm658490173.91.2024.07.17.06.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 06:15:40 -0700 (PDT)
Date: Wed, 17 Jul 2024 08:15:40 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel.holland@sifive.com>, Peter Zijlstra <peterz@infradead.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Jason Baron <jbaron@akamai.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, 
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Pu Lehui <pulehui@huawei.com>, 
	Puranjay Mohan <puranjay@kernel.org>, Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] riscv: patch: Remove redundant functions
Message-ID: <20240717-515ffec38da9b1f5df03e42c@orel>
References: <20240717084102.150914-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240717084102.150914-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_061542_622840_2655CABC 
X-CRM114-Status: GOOD (  10.91  )
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

On Wed, Jul 17, 2024 at 10:41:02AM GMT, Alexandre Ghiti wrote:
> Commit edf2d546bfd6f5c4 ("riscv: patch: Flush the icache right after
> patching to avoid illegal insns") removed the last differences between
> patch_text_set_nosync() and patch_insn_set(), and between
> patch_text_nosync() and patch_insn_write().
> 
> So remove the redundant *_nosync() functions.
> 
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes: https://lore.kernel.org/linux-riscv/CAMuHMdUwx=rU2MWhFTE6KhYHm64phxx2Y6u05-aBLGfeG5696A@mail.gmail.com/
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/errata/sifive/errata.c |  4 ++--
>  arch/riscv/errata/thead/errata.c  |  2 +-
>  arch/riscv/include/asm/patch.h    |  3 +--
>  arch/riscv/kernel/alternative.c   |  4 ++--
>  arch/riscv/kernel/cpufeature.c    |  2 +-
>  arch/riscv/kernel/jump_label.c    |  2 +-
>  arch/riscv/kernel/patch.c         | 24 +-----------------------
>  arch/riscv/net/bpf_jit_core.c     |  4 ++--
>  8 files changed, 11 insertions(+), 34 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
