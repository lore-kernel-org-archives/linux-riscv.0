Return-Path: <SRS0=kFy7=CD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7AEFC433DF
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 08:44:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A12E2071E
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2020 08:44:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kyuBlT1m";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="eLYaxhFO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A12E2071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JysrzYIBLwjeHLtvevqkD9zEyKA3yVmo2tX9Cuehqdw=; b=kyuBlT1mo30h4cMViWZNaADHA
	ytUdI8bGwg28KjoF2jlseiGf3pdlZpSfr9VGf9HCorN9Lq2fK9OAm6GeYPTm5SsqR8ZFL68FA3Fcm
	IrxwofBNKgiVPLrR9cNKqKm9TuDyAUp2LE22sqEDEYlXhAv/38PI5byTANafHTlqPrpq8LcIzTNz7
	2n1jYaa7rhbJCekTsryNUfoPhpWCb6Qe58UMAA/h6BSZcp+rNh9SFO9llIzo0T0xWHMf0LoWW56cT
	wHbdBYotEXmw4DJ3ig4TQW4M6iifnPSIiFNU7BVlfiIk5NdvfhQXt5tmv6QzRJwjPCNpmjER14Y1G
	hSgHJoiOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAUYm-0008Q1-Dn; Tue, 25 Aug 2020 08:44:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAUYi-0008PF-Q8
 for linux-riscv@lists.infradead.org; Tue, 25 Aug 2020 08:44:01 +0000
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 171312075B
 for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2020 08:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598345039;
 bh=zVYxpupTg7OcTIAfNFy4C2nQKoSWTeAIIu1m/eOsJWk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eLYaxhFOWnYzJ7oz7LPU6ZA2arQ9R7fmDmZi9bz95vBwNpUEPD8GYkYM/siDFOf2g
 D/yDiLhBG7oVoXMDTGkN4zhT8uMkRNYHlVV8XSYyVa3uR88SLhgS9GQoldvH9s726b
 /j00l+dgY8LVkoSQYsBxu7HmEuy5kA4EC5h5VtYo=
Received: by mail-lj1-f170.google.com with SMTP id t23so12869439ljc.3
 for <linux-riscv@lists.infradead.org>; Tue, 25 Aug 2020 01:43:59 -0700 (PDT)
X-Gm-Message-State: AOAM531Rb8gXABefCHejcwSGtb/BuhBmuvm8k7+hTURthUNPVRHzoDDQ
 W3pqkmYzcLCKG20iXgXcsVpRQa5NjtC0TMMRMDY=
X-Google-Smtp-Source: ABdhPJyphZbFcL7xp2pAmW+InKhVlJsj0/M0E9TtXgOevQ72Fym5GZq64dlM8A2EXV0y2g8pv4lJs7GkUipd3CROQkY=
X-Received: by 2002:a05:651c:310:: with SMTP id
 a16mr4145578ljp.250.1598345037346; 
 Tue, 25 Aug 2020 01:43:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200825002121.1779187-1-palmerdabbelt@google.com>
In-Reply-To: <20200825002121.1779187-1-palmerdabbelt@google.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 25 Aug 2020 16:43:46 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTRSLio+7KM2SoUq3xxZWYxAkpuzCZzZugSke9eCpqc1g@mail.gmail.com>
Message-ID: <CAJF2gTTRSLio+7KM2SoUq3xxZWYxAkpuzCZzZugSke9eCpqc1g@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Take text_mutex in ftrace_init_nop()
To: Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_044400_977758_A26519FA 
X-CRM114-Status: GOOD (  27.85  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Thx Palmer,

The patch is what I need.

Acked-by: Guo Ren <guoren@kernel.org>

On Tue, Aug 25, 2020 at 8:29 AM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> Without this we get lockdep failures.  They're spurious failures as SMP isn't
> up when ftrace_init_nop() is called.  As far as I can tell the easiest fix is
> to just take the lock, which also seems like the safest fix.
>
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> ---
> I haven't actually tested this, as I don't have a workload that exercises
> ftrace in a meaningful fashion, but this seems pretty safe to me.  It smells to
> me like we should handle this in the generic code (make the generic
> ftrace_init_nop() call brand new
> ftrace_arch_code_modify_{prepare,post_process}_init(), which default to calling
> ftrace_arch_code_modify_{prepare,post_process}() or just juggling the lock
> (depending on what most architectures are doing)), but this at least fixes the
> issue on our end so it seems reasonable for now.
>
> Thinking about it: I guess if I just booted with ftrace and lockdep it'd catch
> this issue, so that seems like an obvious test case to add.  If someone has an
> easy way to exercise more ftrace stuff I'm happy to run that in addition.
> ---
>  arch/riscv/include/asm/ftrace.h |  7 +++++++
>  arch/riscv/kernel/ftrace.c      | 19 +++++++++++++++++++
>  2 files changed, 26 insertions(+)
>
> diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
> index ace8a6e2d11d..845002cc2e57 100644
> --- a/arch/riscv/include/asm/ftrace.h
> +++ b/arch/riscv/include/asm/ftrace.h
> @@ -66,6 +66,13 @@ do {                                                                 \
>   * Let auipc+jalr be the basic *mcount unit*, so we make it 8 bytes here.
>   */
>  #define MCOUNT_INSN_SIZE 8
> +
> +#ifndef __ASSEMBLY__
> +struct dyn_ftrace;
> +int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
> +#define ftrace_init_nop ftrace_init_nop
> +#endif
> +
>  #endif
>
>  #endif /* _ASM_RISCV_FTRACE_H */
> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> index 2ff63d0cbb50..99e12faa5498 100644
> --- a/arch/riscv/kernel/ftrace.c
> +++ b/arch/riscv/kernel/ftrace.c
> @@ -97,6 +97,25 @@ int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec,
>         return __ftrace_modify_call(rec->ip, addr, false);
>  }
>
> +
> +/*
> + * This is called early on, and isn't wrapped by
> + * ftrace_arch_code_modify_{prepare,post_process}() and therefor doesn't hold
> + * text_mutex, which triggers a lockdep failure.  SMP isn't running so we could
> + * just directly poke the text, but it's simpler to just take the lock
> + * ourselves.
> + */
> +int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
> +{
> +       int out;
> +
> +       ftrace_arch_code_modify_prepare();
> +       out = ftrace_make_nop(mod, rec, MCOUNT_ADDR);
> +       ftrace_arch_code_modify_post_process();
> +
> +       return out;
> +}
> +
>  int ftrace_update_ftrace_func(ftrace_func_t func)
>  {
>         int ret = __ftrace_modify_call((unsigned long)&ftrace_call,
> --
> 2.28.0.297.g1956fa8f8d-goog
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
