Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF2BC35FFC
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 15:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kjY1c7SPzpgYK1pt1wZECQii0AJpJ0mBDuKFnCwufF8=; b=yzrhqE9wvl4UD9
	RYl5j58F+fpVYSfag69TOcLIGlu6NHJRyQvatfv/KerfMnVKn47M+GTawhlCLtliZSnAPaNeVRwts
	QnH/tfOkTUtNv/rEb+wDXoJG2MtT4nSjx6CFBw3IXbbvL2c5kCA96qENa5DN2/1Cb+aR2D+qIaIem
	YpCO+s5aKYalubal8eZ2faFxiDKnS9bOxieDJm3WCtkh7QF+h/2bfQWc88TRYgyDu0HzDlRpjWm7Y
	/AXNM6t33fDu4XddlqHFLmld+A2+4oCuKcHOrqPifKBa1bcMegr2AekAr8ZFQap44YCluA7weziym
	R0WXMs6mrFW/imL+paow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuvMi-00000009NlM-3OR1;
	Wed, 19 Mar 2025 15:29:56 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuvKZ-00000009NQL-1Ax5
	for linux-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 15:27:44 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso46444845e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Mar 2025 08:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1742398061; x=1743002861; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TgxY2KZtIrmQRpExe3D1+RTeBDiOjEYNGghBrLG3UzU=;
        b=g7WY/lMpscGHYI0y/kDcCFQW5jf2LaVwv7UehagtweLQmuuaFF7pGVysypd29Y0Nfc
         KlqTvNWpiGNLHV+VKSY2vXIgYld07xynvOaAV0SEgat0PK0iL2tNclqqxFS99ynOxCBN
         WttUBa70+uK6WuRHdD6O86e4ZuQEtE2zmkV3ZQDAhqvwyfiDHHGvTUyHC8rd21nMMNdo
         7Co7QuksKnGZDw3sbfki4D5QNwLSZPkHThIKIEFIBRjndK2als47szOSnudi5E4brgMu
         cMNW0z766m9TdkLtaQ+L6pSJ61QPLIn9ghzFgPkcZra3qc6p1Z8eON0TOH2yggCmyakS
         J6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742398061; x=1743002861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgxY2KZtIrmQRpExe3D1+RTeBDiOjEYNGghBrLG3UzU=;
        b=Aoy4oii6nerye+nzRlk1vRzfl6RjjB5oyDf7eqbPTh/3mUsA+sW3YRg15AP70Qmdjt
         43bdQo2JxB4IUbGfS6nY35SHVQk26O043cv7oRtxYv44zMuMv4QVgvcnltHoXISq84tu
         t0P7HvZSZk7GdSQgIbMZIjZXmPy3yqJr8aaWB1HgKg4WYyKVFZA8YIE0qGmMrP1rNsP1
         NTN77aC5LFATdGoSiMLGKTgnen4Gna8HR0tigoJ5NooHV+pCsyfGWbhRrfWJGLe7ZH8a
         CLTZF/4J8eR+RTnEpKkl892rYAttS5Q2A7MVzHuN5dykzgQ66XdXy3Y4Fvnan+PMUcU0
         YCuA==
X-Forwarded-Encrypted: i=1; AJvYcCXNfwI6V4FZGSBpWYkq65jXF6cLBewM85XOosjnqyK9TPirV534eIl/Rm+Lp/r7JNKFMUmngr1obcpadQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyrWgCpeZvxqAWNjc4i+uvYlczcgZY/kUv6sgLeDZGhIeLXx1tg
	WkmC54kX738G5kgEJVD+UsHjV+APl20QXY4Em8g6PeV/JNFjVS0VDb74cmbI5jw=
X-Gm-Gg: ASbGnctpfz7d0YLuu7cHRfEFK3X9iWI5keHXqDKYizSpv+xkvbBZ5iE9e8+arf+2iCk
	5RLpFahD4xGGn3nsYyeJrSR7GX/47DUcwXxhZRXr6DsKixmdJ1SKm4DC/wP2gn8Gbr1+l49b7fn
	RJbnDNyTpM+8lnSpaZ6g7kEidAZYLx/PG8HGNORT6SFtv74uSj08UjMkuqUCvumN5OncBB7CWyX
	qTngUDK0IlszwvpBoqF6Vs4LcMR2/ckK6ba/pFsbq1fE1WH2jqwzyGnxHU3KH1NPFRYDukDMzEB
	SmGWLRMmIyy8JygwINiaGiRnCqspXAif
X-Google-Smtp-Source: AGHT+IFeAXnl0WTivUPXfKcPs3cJUq9v6gC9hg13Hq54tpqSOLgPB+ibA2L8ZApJrBJf1YYPrQEiJw==
X-Received: by 2002:a05:600c:5250:b0:43c:fc0c:7f33 with SMTP id 5b1f17b1804b1-43d43781e4emr30994685e9.2.1742398061429;
        Wed, 19 Mar 2025 08:27:41 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::59a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f855efsm21731865e9.34.2025.03.19.08.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 08:27:40 -0700 (PDT)
Date: Wed, 19 Mar 2025 16:27:39 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ben Dooks <ben.dooks@codethink.co.uk>, Pasha Bouzarjomehri <pasha@rivosinc.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v9 1/2] riscv: Move nop definition to insn-def.h
Message-ID: <20250319-3bf29b05bf02bfdaa32b261c@orel>
References: <20250318-runtime_const_riscv-v9-0-ddd3534d3e8e@rivosinc.com>
 <20250318-runtime_const_riscv-v9-1-ddd3534d3e8e@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250318-runtime_const_riscv-v9-1-ddd3534d3e8e@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_082743_318750_3D9F75CF 
X-CRM114-Status: GOOD (  25.53  )
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

On Tue, Mar 18, 2025 at 05:38:45PM -0700, Charlie Jenkins wrote:
> We have duplicated the definition of the nop instruction in ftrace.h and
> in jump_label.c. Move this definition into the generic file insn-def.h
> so that they can share the definition with each other and with future
> files.
> 
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/include/asm/ftrace.h   | 1 -
>  arch/riscv/include/asm/insn-def.h | 2 ++
>  arch/riscv/kernel/ftrace.c        | 6 +++---
>  arch/riscv/kernel/jump_label.c    | 4 ++--
>  4 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
> index c4721ce44ca474654b37b3d51bc0a63d46bc1eff..b7f361a50f6445d02a0d88eef5547ee27c1fb52e 100644
> --- a/arch/riscv/include/asm/ftrace.h
> +++ b/arch/riscv/include/asm/ftrace.h
> @@ -79,7 +79,6 @@ struct dyn_arch_ftrace {
>  #define AUIPC_RA		(0x00000097)
>  #define JALR_T0			(0x000282e7)
>  #define AUIPC_T0		(0x00000297)
> -#define NOP4			(0x00000013)
>  
>  #define to_jalr_t0(offset)						\
>  	(((offset & JALR_OFFSET_MASK) << JALR_SHIFT) | JALR_T0)
> diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
> index 9a913010cdd93cdfdd93f467e7880e20cce0dd2b..0a1fc5134f29da190554c59f8cee3b5374c9aa2d 100644
> --- a/arch/riscv/include/asm/insn-def.h
> +++ b/arch/riscv/include/asm/insn-def.h
> @@ -200,4 +200,6 @@
>  #define ZAWRS_WRS_NTO	".4byte 0x00d00073"
>  #define ZAWRS_WRS_STO	".4byte 0x01d00073"
>  
> +#define RISCV_INSN_NOP4	0x00000013U

This should be _AC(0x00000013, U), but since this is the first of its kind
(all other defines are of the form ".4byte ..." -- either explicitly, like
the ones above, or through the INSN_* macros), then it feels like it
either doesn't belong here at all or that we should provide it and a
".4byte ..." version.

Thanks,
drew

> +
>  #endif /* __ASM_INSN_DEF_H */
> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> index 3524db5e4fa014a4594465f849d898a030bfb7b8..674dcdfae7a149c339f1e791adb450535f22991b 100644
> --- a/arch/riscv/kernel/ftrace.c
> +++ b/arch/riscv/kernel/ftrace.c
> @@ -36,7 +36,7 @@ static int ftrace_check_current_call(unsigned long hook_pos,
>  				     unsigned int *expected)
>  {
>  	unsigned int replaced[2];
> -	unsigned int nops[2] = {NOP4, NOP4};
> +	unsigned int nops[2] = {RISCV_INSN_NOP4, RISCV_INSN_NOP4};
>  
>  	/* we expect nops at the hook position */
>  	if (!expected)
> @@ -68,7 +68,7 @@ static int __ftrace_modify_call(unsigned long hook_pos, unsigned long target,
>  				bool enable, bool ra)
>  {
>  	unsigned int call[2];
> -	unsigned int nops[2] = {NOP4, NOP4};
> +	unsigned int nops[2] = {RISCV_INSN_NOP4, RISCV_INSN_NOP4};
>  
>  	if (ra)
>  		make_call_ra(hook_pos, target, call);
> @@ -97,7 +97,7 @@ int ftrace_make_call(struct dyn_ftrace *rec, unsigned long addr)
>  int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec,
>  		    unsigned long addr)
>  {
> -	unsigned int nops[2] = {NOP4, NOP4};
> +	unsigned int nops[2] = {RISCV_INSN_NOP4, RISCV_INSN_NOP4};
>  
>  	if (patch_insn_write((void *)rec->ip, nops, MCOUNT_INSN_SIZE))
>  		return -EPERM;
> diff --git a/arch/riscv/kernel/jump_label.c b/arch/riscv/kernel/jump_label.c
> index 654ed159c830b3d5e34ac58bf367107066eb73a1..b4c1a6a3fbd28533552036194f27ed206bea305d 100644
> --- a/arch/riscv/kernel/jump_label.c
> +++ b/arch/riscv/kernel/jump_label.c
> @@ -11,8 +11,8 @@
>  #include <asm/bug.h>
>  #include <asm/cacheflush.h>
>  #include <asm/text-patching.h>
> +#include <asm/insn-def.h>
>  
> -#define RISCV_INSN_NOP 0x00000013U
>  #define RISCV_INSN_JAL 0x0000006fU
>  
>  bool arch_jump_label_transform_queue(struct jump_entry *entry,
> @@ -33,7 +33,7 @@ bool arch_jump_label_transform_queue(struct jump_entry *entry,
>  			(((u32)offset & GENMASK(10,  1)) << (21 -  1)) |
>  			(((u32)offset & GENMASK(20, 20)) << (31 - 20));
>  	} else {
> -		insn = RISCV_INSN_NOP;
> +		insn = RISCV_INSN_NOP4;
>  	}
>  
>  	if (early_boot_irqs_disabled) {
> 
> -- 
> 2.43.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
