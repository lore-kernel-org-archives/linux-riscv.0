Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CD5C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 12:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q2wKqhPsW599mAH8LR2Qz6jmvqirOEvTgDIN1o2+NpY=; b=aRtcS8+jH2HGZk
	VW6PS87i/xKxLvkn7mt2ITpXHjMTE/dPbAaN6nBtrZekHnQDX627Vub6bQAtehYEkjhZcVkRtkBUy
	AcaWvVlOI9MfAh2sE+4ptbuyMhtgROvQzssAsToyv3Lh0oFiWcvW5lVd6xS5B9G925kW3DbS2/w57
	Qcbt+CsABmjIjZvcTLiRwElekDmVdtFpPsl3eu4cR0a0SHNepca7uCsOydNvgrT0qzrmHSumGqAwb
	MtgFKp/fpfvXJqrdmNumRyNA1dr2aPWUP53ijDICJJUGkX0ZRz4MytpyWMK1qTz93zMBxKfLB0Lyf
	xq1NVXdS/tV7eZmgNDMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogQCL-002NsV-CL; Thu, 06 Oct 2022 12:41:57 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogQCH-002NnC-Nk
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 12:41:55 +0000
Received: by mail-ej1-x62c.google.com with SMTP id b2so4296196eja.6
        for <linux-riscv@lists.infradead.org>; Thu, 06 Oct 2022 05:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=AK+3/ho4RvmuiMuVJwr3Rpg3eo+stcqQKAj7PVtNyyk=;
        b=Cn5WuPb4Je4FcUwPxSwP26BPdp11/zoskFJi5zb67Br/FE3od2wcCzBU9vAZAc9iVX
         2jZ1jngYT90kB69JX4wfUxYtSl0HShjHlB0fTVejxdULPmLS5Iyb3xq+dob4S4X+2InN
         OGJ/V0F8ZnG646cAcqFEsdNTsGzSw4zijnBZJOj72ttfr8lCWPIPzL1K65z2v46/ahkd
         nsEwXeCtXu3Ad4EhE4KStgBO9/QsjDNYFzPKBczoRFikiKSf2DPyWq6SU9lUu29GhMVU
         SHiqJVWRjPXwGCBpVOfvVKY3Jbb64nzyYK0YLwcPjEvd1yAd03Oy/QhuEGhOYhtzr6kM
         6LWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=AK+3/ho4RvmuiMuVJwr3Rpg3eo+stcqQKAj7PVtNyyk=;
        b=vx8JLueUfMHvdbpu9SO5LJs5xNf2yH+j6XgvXhmBZyVXT+ul4Pxq0JT6Nh+13Z0lCz
         ovim8pxeTDGPgetebVoGhTKHJ/G/EjHpnFjgpTb5prpywRPtLLS+mJH1WglQz4dtQ24l
         6FE0ownVVwdg6BcPKG3LsJPxDK23t3eOJsyWnz/dE7gZ9l1emz93Es7ceTSJ8QXsjjLi
         gtn16JiF5c22dAc403hFpsTrxj8F3KcyjvIfo4G848ia/OE1VjKldjIUS2fdshSHhnJu
         YYEG3S2jw7nqeZfZxcUpiB9LaYhEgpS3lunh+TSmyS8fMdlmrg0dGRwU4/ijEravTKfM
         PWog==
X-Gm-Message-State: ACrzQf1W/YmfUkt5gQhVa39C49RDXhuPMTWdMAsBiOgbLfqxytkGr7Bz
	bpMGW/n3pM7uZR4jz/ZVTX4zCw==
X-Google-Smtp-Source: AMsMyM4scPQ+Y5tFL519YUkAx65QeYpdy6w2QhHwhZZiZP7g4wirk8VfwX+qvhk5Zefggdmvnh97sA==
X-Received: by 2002:a17:906:9b8e:b0:78c:65a4:af84 with SMTP id dd14-20020a1709069b8e00b0078c65a4af84mr3755800ejc.127.1665060110985;
        Thu, 06 Oct 2022 05:41:50 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id k7-20020a170906a38700b0078d2a2ca930sm2742860ejz.85.2022.10.06.05.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 05:41:50 -0700 (PDT)
Date: Thu, 6 Oct 2022 14:41:44 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>, Samuel Holland <samuel@sholland.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [PATCH] riscv: jump_label: mark arguments as const to satisfy
 asm constraints
Message-ID: <20221006124144.abaz74g7nxrb5hxj@kamzik>
References: <20221006064028.548-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221006064028.548-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_054153_802658_A4E6814D 
X-CRM114-Status: GOOD (  18.32  )
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

On Thu, Oct 06, 2022 at 02:40:28PM +0800, Jisheng Zhang wrote:
> Samuel reported that the static branch usage in cpu_relax() breaks
> building with CONFIG_CC_OPTIMIZE_FOR_SIZE[1]:
> 
> In file included from <command-line>:
> ./arch/riscv/include/asm/jump_label.h: In function 'cpu_relax':
> ././include/linux/compiler_types.h:285:33: warning: 'asm' operand 0
> probably does not match constraints
>   285 | #define asm_volatile_goto(x...) asm goto(x)
>       |                                 ^~~
> ./arch/riscv/include/asm/jump_label.h:41:9: note: in expansion of macro
> 'asm_volatile_goto'
>    41 |         asm_volatile_goto(
>       |         ^~~~~~~~~~~~~~~~~
> ././include/linux/compiler_types.h:285:33: error: impossible constraint
> in 'asm'
>   285 | #define asm_volatile_goto(x...) asm goto(x)
>       |                                 ^~~
> ./arch/riscv/include/asm/jump_label.h:41:9: note: in expansion of macro
> 'asm_volatile_goto'
>    41 |         asm_volatile_goto(
>       |         ^~~~~~~~~~~~~~~~~
> make[1]: *** [scripts/Makefile.build:249:
> arch/riscv/kernel/vdso/vgettimeofday.o] Error 1
> make: *** [arch/riscv/Makefile:128: vdso_prepare] Error 2
> 
> Maybe "-Os" prevents GCC from detecting that the key/branch arguments
> can be treated as constants and used as immediate operands. Inspired
> by x86's commit 864b435514b2("x86/jump_label: Mark arguments as const to
> satisfy asm constraints"), and as pointed out by Steven in [2] "The "i"
> constraint needs to be a constant.", let's do similar modifications to
> riscv.
> 
> Tested by CC_OPTIMIZE_FOR_SIZE + gcc and CC_OPTIMIZE_FOR_SIZE + clang.
> 
> [1]https://lore.kernel.org/linux-riscv/20220922060958.44203-1-samuel@sholland.org/
> [2]https://lore.kernel.org/all/20210212094059.5f8d05e8@gandalf.local.home/
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/jump_label.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/jump_label.h b/arch/riscv/include/asm/jump_label.h
> index 38af2ec7b9bf..6d58bbb5da46 100644
> --- a/arch/riscv/include/asm/jump_label.h
> +++ b/arch/riscv/include/asm/jump_label.h
> @@ -14,8 +14,8 @@
>  
>  #define JUMP_LABEL_NOP_SIZE 4
>  
> -static __always_inline bool arch_static_branch(struct static_key *key,
> -					       bool branch)
> +static __always_inline bool arch_static_branch(struct static_key * const key,
> +					       const bool branch)
>  {
>  	asm_volatile_goto(
>  		"	.option push				\n\t"
> @@ -35,8 +35,8 @@ static __always_inline bool arch_static_branch(struct static_key *key,
>  	return true;
>  }
>  
> -static __always_inline bool arch_static_branch_jump(struct static_key *key,
> -						    bool branch)
> +static __always_inline bool arch_static_branch_jump(struct static_key * const key,
> +						    const bool branch)
>  {
>  	asm_volatile_goto(
>  		"	.option push				\n\t"
> -- 
> 2.37.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
