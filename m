Return-Path: <SRS0=zykF=CE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97EECC433E1
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2020 01:37:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FD602072D
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2020 01:37:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P8xHXWbT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FD602072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OvIId80q01JjEro6//D7sExZQSNrmwUnVqzUSzrZXRU=; b=P8xHXWbTDxnPVhE1pZ/j5s9kN
	PFkJ0zdQSmPbhBQTPXfgb0ZsnYlOZtpyBMgPxFxKaodrWIA8vXVjvhGPKXC94ADC4h4m+YY1qhY4m
	r565znIIEYMs/LM7+XiDZEL+TVIZXE2m64fOJJRwqgdoFe4GVs4uhqNdXEP+cjlOSzBT2g7ETlQqg
	Gru3TguULPX3MwZY2VyXuZ/usDfKPTAWg4/qKjByjFYLx3CeQsXvOiSWtks6xQCr5RYgy1eBjCDM9
	hQ8oAm+TOKKdOgpVLB/APXkLeXY7baWGPUyxfPhzdeVnJD1KdsIzDccR4QvCn+bXGpTjOg+SA5H2Q
	1OodGqo1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAkMs-0000fn-Fl; Wed, 26 Aug 2020 01:36:50 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAkMp-0000fT-It
 for linux-riscv@lists.infradead.org; Wed, 26 Aug 2020 01:36:48 +0000
Received: from oasis.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A48EC2072D;
 Wed, 26 Aug 2020 01:36:45 +0000 (UTC)
Date: Tue, 25 Aug 2020 21:36:44 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Palmer Dabbelt <palmerdabbelt@google.com>
Subject: Re: [PATCH] RISC-V: Take text_mutex in ftrace_init_nop()
Message-ID: <20200825213644.5f543f94@oasis.local.home>
In-Reply-To: <20200825002121.1779187-1-palmerdabbelt@google.com>
References: <20200825002121.1779187-1-palmerdabbelt@google.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200825_213647_748881_D1D9F475 
X-CRM114-Status: GOOD (  28.52  )
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
Cc: linux-riscv@lists.infradead.org, guoren@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 24 Aug 2020 17:21:22 -0700
Palmer Dabbelt <palmerdabbelt@google.com> wrote:

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

I'm not able to test this either, but it looks reasonable to me.

Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- Steve

> ---
>  arch/riscv/include/asm/ftrace.h |  7 +++++++
>  arch/riscv/kernel/ftrace.c      | 19 +++++++++++++++++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
> index ace8a6e2d11d..845002cc2e57 100644
> --- a/arch/riscv/include/asm/ftrace.h
> +++ b/arch/riscv/include/asm/ftrace.h
> @@ -66,6 +66,13 @@ do {									\
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
>  	return __ftrace_modify_call(rec->ip, addr, false);
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
> +	int out;
> +
> +	ftrace_arch_code_modify_prepare();
> +	out = ftrace_make_nop(mod, rec, MCOUNT_ADDR);
> +	ftrace_arch_code_modify_post_process();
> +
> +	return out;
> +}
> +
>  int ftrace_update_ftrace_func(ftrace_func_t func)
>  {
>  	int ret = __ftrace_modify_call((unsigned long)&ftrace_call,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
