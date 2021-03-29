Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B747C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 00:05:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED0D66198A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 00:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED0D66198A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t27EdLyV7jAR/o05PXjqvYZdd5Jt7faBOtirxQJQ8So=; b=VFSpnRwnG6rNdHD9ivsz0p1e8
	uzwCxOhJBAJXtMS9XHnYimCV3KKqoNu2nAJ2vbeA5HNL19l5+3KKSPDZnJBJy6VJkXcDnDQSsyPtW
	TkqW+uEnzfA+hdTyZvVY+1VoGp8pidopRq/WQhh0PqNTV6ILVTeDnhrHMjBbmuDG2TaAUfRKT+GSd
	nCqUxAvLlPWZ7qUxU3oBXTUG8Wo8DI48m3+n8ZL7A1WSSzCh/xaCSAp0pd3nZqfkk81zeEotqKek/
	ih4kDV9hfwJ7B5/sZWtBOBL5OtXezcvtokJOi2qCrc6o8iFC7/a+DjTWaBW0Oe9JOdTm1jZrZF0iP
	S8qxCEN6A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR1sw-0026g6-7f; Tue, 30 Mar 2021 00:05:30 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQwgb-0014G8-MX
 for linux-riscv@lists.infradead.org; Mon, 29 Mar 2021 18:32:44 +0000
Received: by mail-lf1-x12a.google.com with SMTP id n138so19937079lfa.3
 for <linux-riscv@lists.infradead.org>; Mon, 29 Mar 2021 11:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yeNB5sEY4cPt05lVN+HkG1LRzxIjnMB5Dy/N7XWvZCE=;
 b=VGhHMfmTPR07v1DfjHVVtzyLQnebdGInigQbMPBfwaYWt7mDv7tCcmrMKvooZ7qfPg
 8sBmbelC6srradbru+Tn3QaZTcn1TPK3Za/wdwVFmyE3spGat6Ch/6BZLGj+leAqTLQ2
 yFMaWb5ErXa78ZuA9OGsHv2AUuqQMT4aH/j+9wKm7pt3E3xJo7NkTSEB1tF4ITo9s1+7
 g/GUR82HiGb+F480CL/zjgxBdmw10RnaycBZLGKoewnCjx/dND6HC2IKDkLIDOeNdE09
 WeHsHDWAbIC/O8KeG8BI2alXNkfkn+31/Qh1a/tjD5BUPgC2OpWFA4x9dj2iz5Xo7J0B
 XlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yeNB5sEY4cPt05lVN+HkG1LRzxIjnMB5Dy/N7XWvZCE=;
 b=eDZIvERQUalG036pEWMAuswbxf+qJC6LSjVx+nlJJCIU0WyavB+2fyIjOe60SpuL6D
 ALpCoQKfq1NrNmEdTqCC4WnFxYlxqp4Q2FoPtvEbGRGIsGMI5i4pgxjNn263Ssbj7VKo
 4Pgg21fkxYwu9C4LhhOd38SQn4MtYYm9JyTa/rvKv0GaBK0Y0A7nKM13yVpsXSPIHDp5
 6r8iIYqn02+tJHl7V6JI3ciBJL86PELu2/OCv5YG6K9noX2MTan8YL33DkSIAZ02H08W
 29mg02FvT/iJI0KX7+FeOTEzhpJjYBpP1g9lHuO9d+4z8yq5pK71dTz9h1Gan85M6Jb+
 OrsA==
X-Gm-Message-State: AOAM531mxe9YffBPEAZBkaMKva3Wa7aN7kwzYwQf0HFkFgHwp4A/yzCl
 1T/BIpchl5efpeEJTX84/wQ7jzOl8S6PD2PdGC+u+g==
X-Google-Smtp-Source: ABdhPJwAGxmrKYI2hGyfRS7Wb9JTt63w/JwuZYJF+oFLfI527SQZRGmeLq01wCEqqMpCh9u2g3EQyWjaykxNNsCTiWY=
X-Received: by 2002:a19:5055:: with SMTP id z21mr17019928lfj.297.1617042743134; 
 Mon, 29 Mar 2021 11:32:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210325223807.2423265-1-nathan@kernel.org>
 <20210325223807.2423265-3-nathan@kernel.org>
In-Reply-To: <20210325223807.2423265-3-nathan@kernel.org>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 29 Mar 2021 11:32:12 -0700
Message-ID: <CAKwvOdn3y6DSu8i=3T9ro5KoXVNUuSrJQa-UOQB00z5ASY659Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] riscv: Workaround mcount name prior to clang-13
To: Nathan Chancellor <nathan@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
 LKML <linux-kernel@vger.kernel.org>, 
 clang-built-linux <clang-built-linux@googlegroups.com>,
 "# 3.4.x" <stable@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_193242_620885_1E8BEEB9 
X-CRM114-Status: GOOD (  27.88  )
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

On Thu, Mar 25, 2021 at 3:38 PM Nathan Chancellor <nathan@kernel.org> wrote:
>
> Prior to clang 13.0.0, the RISC-V name for the mcount symbol was
> "mcount", which differs from the GCC version of "_mcount", which results
> in the following errors:
>
> riscv64-linux-gnu-ld: init/main.o: in function `__traceiter_initcall_level':
> main.c:(.text+0xe): undefined reference to `mcount'
> riscv64-linux-gnu-ld: init/main.o: in function `__traceiter_initcall_start':
> main.c:(.text+0x4e): undefined reference to `mcount'
> riscv64-linux-gnu-ld: init/main.o: in function `__traceiter_initcall_finish':
> main.c:(.text+0x92): undefined reference to `mcount'
> riscv64-linux-gnu-ld: init/main.o: in function `.LBB32_28':
> main.c:(.text+0x30c): undefined reference to `mcount'
> riscv64-linux-gnu-ld: init/main.o: in function `free_initmem':
> main.c:(.text+0x54c): undefined reference to `mcount'
>
> This has been corrected in https://reviews.llvm.org/D98881 but the
> minimum supported clang version is 10.0.1. To avoid build errors and to
> gain a working function tracer, adjust the name of the mcount symbol for
> older versions of clang in mount.S and recordmcount.pl.
>
> Cc: stable@vger.kernel.org
> Link: https://github.com/ClangBuiltLinux/linux/issues/1331
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for keeping this alive on clang-10, and resolving it for future releases!
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

> ---
>  arch/riscv/include/asm/ftrace.h | 14 ++++++++++++--
>  arch/riscv/kernel/mcount.S      | 10 +++++-----
>  scripts/recordmcount.pl         |  2 +-
>  3 files changed, 18 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
> index 845002cc2e57..04dad3380041 100644
> --- a/arch/riscv/include/asm/ftrace.h
> +++ b/arch/riscv/include/asm/ftrace.h
> @@ -13,9 +13,19 @@
>  #endif
>  #define HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
>
> +/*
> + * Clang prior to 13 had "mcount" instead of "_mcount":
> + * https://reviews.llvm.org/D98881
> + */
> +#if defined(CONFIG_CC_IS_GCC) || CONFIG_CLANG_VERSION >= 130000
> +#define MCOUNT_NAME _mcount
> +#else
> +#define MCOUNT_NAME mcount
> +#endif
> +
>  #define ARCH_SUPPORTS_FTRACE_OPS 1
>  #ifndef __ASSEMBLY__
> -void _mcount(void);
> +void MCOUNT_NAME(void);
>  static inline unsigned long ftrace_call_adjust(unsigned long addr)
>  {
>         return addr;
> @@ -36,7 +46,7 @@ struct dyn_arch_ftrace {
>   * both auipc and jalr at the same time.
>   */
>
> -#define MCOUNT_ADDR            ((unsigned long)_mcount)
> +#define MCOUNT_ADDR            ((unsigned long)MCOUNT_NAME)
>  #define JALR_SIGN_MASK         (0x00000800)
>  #define JALR_OFFSET_MASK       (0x00000fff)
>  #define AUIPC_OFFSET_MASK      (0xfffff000)
> diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
> index 8a5593ff9ff3..6d462681c9c0 100644
> --- a/arch/riscv/kernel/mcount.S
> +++ b/arch/riscv/kernel/mcount.S
> @@ -47,8 +47,8 @@
>
>  ENTRY(ftrace_stub)
>  #ifdef CONFIG_DYNAMIC_FTRACE
> -       .global _mcount
> -       .set    _mcount, ftrace_stub
> +       .global MCOUNT_NAME
> +       .set    MCOUNT_NAME, ftrace_stub
>  #endif
>         ret
>  ENDPROC(ftrace_stub)
> @@ -78,7 +78,7 @@ ENDPROC(return_to_handler)
>  #endif
>
>  #ifndef CONFIG_DYNAMIC_FTRACE
> -ENTRY(_mcount)
> +ENTRY(MCOUNT_NAME)
>         la      t4, ftrace_stub
>  #ifdef CONFIG_FUNCTION_GRAPH_TRACER
>         la      t0, ftrace_graph_return
> @@ -124,6 +124,6 @@ do_trace:
>         jalr    t5
>         RESTORE_ABI_STATE
>         ret
> -ENDPROC(_mcount)
> +ENDPROC(MCOUNT_NAME)
>  #endif
> -EXPORT_SYMBOL(_mcount)
> +EXPORT_SYMBOL(MCOUNT_NAME)
> diff --git a/scripts/recordmcount.pl b/scripts/recordmcount.pl
> index a36df04cfa09..7b83a1aaec98 100755
> --- a/scripts/recordmcount.pl
> +++ b/scripts/recordmcount.pl
> @@ -392,7 +392,7 @@ if ($arch eq "x86_64") {
>      $mcount_regex = "^\\s*([0-9a-fA-F]+):.*\\s_mcount\$";
>  } elsif ($arch eq "riscv") {
>      $function_regex = "^([0-9a-fA-F]+)\\s+<([^.0-9][0-9a-zA-Z_\\.]+)>:";
> -    $mcount_regex = "^\\s*([0-9a-fA-F]+):\\sR_RISCV_CALL(_PLT)?\\s_mcount\$";
> +    $mcount_regex = "^\\s*([0-9a-fA-F]+):\\sR_RISCV_CALL(_PLT)?\\s_?mcount\$";
>      $type = ".quad";
>      $alignment = 2;
>  } elsif ($arch eq "nds32") {
> --
> 2.31.0
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20210325223807.2423265-3-nathan%40kernel.org.



-- 
Thanks,
~Nick Desaulniers

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
