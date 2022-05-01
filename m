Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B42BC433EF
	for <linux-riscv@archiver.kernel.org>; Sun,  1 May 2022 14:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d/JdesCzRlSlRQVbh/2tVWLan/hTOKnjt6y/lg8+xAE=; b=SuW7ttdecCM5gc
	eg1Ci/foCkZ0cDVTHQuf/milWZS0U3kU3uwwtxdIwow6BSc6x9Y6ecr04klWScJ7KveQmVDh8+DJK
	7iDL8tHHN2Syef0dUNbFcR725ANe+C5jJulofbpAvNDpw5A4bBqU5fZCUQDjBIsSgMO3KfEiqkp+P
	FQICY+2T3hZq0a/MPyWsjCsxUVIsqsoxv4VbnaSaQljdFnR4ng4OxTVCl3qY6wctMhnz/18xDcZb/
	zPrkTOh/r1E91j6iVFANNsz4tzTsTGr8PskKnFWSBu2ihw5kZpbLh5Tw5Ss2BdLs+pFutNMNfu4qY
	amsCLyHvB0z8yP/834cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlAH9-00GR25-VM; Sun, 01 May 2022 14:10:15 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlAH3-00GR1F-O5
 for linux-riscv@lists.infradead.org; Sun, 01 May 2022 14:10:11 +0000
Received: by mail-qt1-x836.google.com with SMTP id y3so9574625qtn.8
 for <linux-riscv@lists.infradead.org>; Sun, 01 May 2022 07:10:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BRwGtOiAYfwSN6Oles1YkgeEY1NKrbkCB/10eptXYYY=;
 b=ClFxWUjH8XMA/vgyIe0hQoH/MzjY7rMmcS4ORgWAsYLQMdB11XCi+8aDZo5xJHxoia
 rGUM3u8GjHZzPvRLqInRjExs8EXMTpVvq3UyPI35dr20I+Pgss217fMN4CB1QPDUF2P7
 jqbGaf/CSr0/vxi50FnsoKOypQITAUMKcbsliEZW2GnvNnakXXqlRquIskrv9hG6ZnKB
 Wra+6tDrbA3taShQH7U8Pvjiav2Xbvo+W6GxaxcjON+1kWo8hzCzrj/TeYY/B25/WxSm
 kCUm7A1y54+VXBprfqyef9JLQz4Yei7i4EqNgf75MlR3duwRaj4R7QR2SNOTADEqLkvK
 onDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BRwGtOiAYfwSN6Oles1YkgeEY1NKrbkCB/10eptXYYY=;
 b=3Sm9UXu9dl/CUBJSuaBhyUQljsx3yOZ06jYECR4NTRAmGX4+hX8QCfxjM2Cb4r2DWg
 K78dy44+19NLdENjDNK/mIsaqp3EhzjWl+IxcR5+l9Mnp2H8wQtffbPy2gVHsrIv6wzT
 KJXaNBmlJBPkJzZQl5HOCsb63+7e7jg7/S1FZ2z1nKmzZncgpZa/blNv8a173qZnx40p
 tTdI+/CA/lfaEZ1OCD9cynqxW1tEN1ei+WM2P4yybyjZXItblDpqOGvDlIMGnWq78Vye
 Qh3YARRu6r40StLRswkD/Yp44Sz2Db9if9MhIhZGfaoeb30AXN88gOt61eyJEXzI3anZ
 QUvg==
X-Gm-Message-State: AOAM531nou/GL90kB9bj1h0bcG8McoeyMsBReXjKHmnqBNxDvc5d5VOn
 wHBXPzsSpnOupYE1ql3mCgA=
X-Google-Smtp-Source: ABdhPJxPM2isTbHISz0t0AcLxXTLolOd3oSBp6e9+AzqjOY7OiPXahL7T0OmhvO4YXUviKQdBzYLSQ==
X-Received: by 2002:a05:622a:5d0:b0:2e1:d430:a5c9 with SMTP id
 d16-20020a05622a05d000b002e1d430a5c9mr6931254qtb.639.1651414204081; 
 Sun, 01 May 2022 07:10:04 -0700 (PDT)
Received: from mail.google.com ([207.246.89.135])
 by smtp.gmail.com with ESMTPSA id
 g20-20020ac84694000000b002f39b99f6b6sm2688086qto.80.2022.05.01.07.09.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 07:10:03 -0700 (PDT)
Date: Sun, 1 May 2022 22:09:53 +0800
From: Changbin Du <changbin.du@gmail.com>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, changbin.du@gmail.com,
 rostedt@goodmis.org, mingo@redhat.com,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmerdabbelt@google.com>
Subject: Re: [PATCH] RISC-V: Don't check text_mutex during stop_machine
Message-ID: <20220501140953.3dkqa6jhkcxzammq@mail.google.com>
References: <20220322022331.32136-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220322022331.32136-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220501_071009_845929_476ACF70 
X-CRM114-Status: GOOD (  30.44  )
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

On Mon, Mar 21, 2022 at 07:23:31PM -0700, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmerdabbelt@google.com>
> 
> We're currently using stop_machine() to update ftrace, which means that
> the thread that takes text_mutex during ftrace_prepare() may not be the
> same as the thread that eventually patches the code.  This isn't
> actually a race because the lock is still held (preventing any other
> concurrent accesses) and there is only one thread running during
> stop_machine(), but it does trigger a lockdep failure.
> 
> This patch just elides the lockdep check during stop_machine.
> 
> Fixes: c15ac4fd60d5 ("riscv/ftrace: Add dynamic function tracer support")
> Suggested-by: Steven Rostedt <rostedt@goodmis.org>
> Reported-by: Changbin Du <changbin.du@gmail.com>
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> 
> --
> 
> Changes since v1 [<20210506071041.417854-1-palmer@dabbelt.com>]:
> * Use ftrace_arch_ocde_modify_{prepare,post_process}() to set the flag.
>   I remember having a reason I wanted the function when I wrote the v1,
>   but it's been almost a year and I forget what that was -- maybe I was
>   just crazy, the patch was sent at midnight.
> * Fix DYNAMIC_FTRACE=n builds.
> ---
>  arch/riscv/include/asm/ftrace.h |  7 +++++++
>  arch/riscv/kernel/ftrace.c      | 12 ++++++++++++
>  arch/riscv/kernel/patch.c       | 10 +++++++++-
>  3 files changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
> index 04dad3380041..3ac7609f4ee9 100644
> --- a/arch/riscv/include/asm/ftrace.h
> +++ b/arch/riscv/include/asm/ftrace.h
> @@ -81,8 +81,15 @@ do {									\
>  struct dyn_ftrace;
>  int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
>  #define ftrace_init_nop ftrace_init_nop
> +extern int riscv_ftrace_in_stop_machine;
>  #endif
>  
> +#else /* CONFIG_DYNAMIC_FTRACE */
> +
> +#ifndef __ASSEMBLY__
> +#define riscv_ftrace_in_stop_machine 0
>  #endif
>  
> +#endif /* CONFIG_DYNAMIC_FTRACE */
> +
>  #endif /* _ASM_RISCV_FTRACE_H */
> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> index 4716f4cdc038..c5f77922d7ea 100644
> --- a/arch/riscv/kernel/ftrace.c
> +++ b/arch/riscv/kernel/ftrace.c
> @@ -11,15 +11,27 @@
>  #include <asm/cacheflush.h>
>  #include <asm/patch.h>
>  
> +int riscv_ftrace_in_stop_machine;
> +
>  #ifdef CONFIG_DYNAMIC_FTRACE
>  int ftrace_arch_code_modify_prepare(void) __acquires(&text_mutex)
>  {
>  	mutex_lock(&text_mutex);
> +
> +	/*
> +	 * The code sequences we use for ftrace can't be patched while the
> +	 * kernel is running, so we need to use stop_machine() to modify them
> +	 * for now.  This doesn't play nice with text_mutex, we use this flag
> +	 * to elide the check.
> +	 */
> +	riscv_ftrace_in_stop_machine = true;
> +
>  	return 0;
>  }
>  
>  int ftrace_arch_code_modify_post_process(void) __releases(&text_mutex)
>  {
> +	riscv_ftrace_in_stop_machine = false;
>  	mutex_unlock(&text_mutex);
>  	return 0;
>  }

The function ftrace_init_nop() should be updated. That's not in stop-machine
context.

@@ -136,9 +124,9 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
 {
        int out;

-       ftrace_arch_code_modify_prepare();
+       mutex_lock(&text_mutex);
        out = ftrace_make_nop(mod, rec, MCOUNT_ADDR);
-       ftrace_arch_code_modify_post_process();
+       mutex_unlock(&text_mutex);


-- 
Cheers,
Changbin Du

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
