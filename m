Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ED35C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 09:37:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E995960551
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 09:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E995960551
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=omykQR71AIqD1GTan5suudDTKPa2twco2cvKVNI44T8=; b=xVCHBDewp5Bqly
	cu6v6XIASfbLC+Wxtmi5CFLUAobWpfeF9AUdyMo1LEQ+PhWywlvxDGsGlKmy4YOPrRfgn6iUJN31m
	3+LbPqxH4VzxQF5Al2S9rBA0mSKvUx6MXtewejvr6TH/zESwnN7cf6sTyAzTC701xcZi2D2PKh5fC
	S9egS87Jj9O7d2ULzxX9TSqUtD8rFpunxiE19ZCeiDszKWY0ZQu3SI1fPg+3kBYTpruIoa2SsQ92N
	V6FocfRz/HrmY5C/pd3QY6cOjTXaQWdh+yQiQNd44SKht9ItpffiPfWodQJCnQGECW/uZg17knmEA
	kK3Yubpqwm7l+zvb8Ltg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfItI-001JXp-6e; Tue, 26 Oct 2021 09:37:08 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfIrZ-001If4-QU
 for linux-riscv@lists.infradead.org; Tue, 26 Oct 2021 09:35:23 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id CD07021957;
 Tue, 26 Oct 2021 09:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635240917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0B4KOzLh0SzQ324Nbkzza+/yS3xupOET/Cg+lBufZUI=;
 b=rw+fG9VAu+8kRC9wTlBf3rcyz3Kf3ZCAjBJINdd8QZW/j3p+2ahcfvCnSj8OuOuJqkx02V
 GTi8IJ3HcUBXayzm3HUW+kf8zSfRse0QcnIbB2v1NyPMTBdz9wPJ0PnGR36r6X7vSW0okN
 kRpnoYVmTXHa91qm+5pJr77RUdNgugk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635240917;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0B4KOzLh0SzQ324Nbkzza+/yS3xupOET/Cg+lBufZUI=;
 b=qgOIyawzyHE9pTOjD50nMXsKDtve0Cel3ya97cAgrn/VbL62UicJFGeCHbZLrb2CyTyimO
 0vfvl2IWd2suabBg==
Received: from pobox.suse.cz (pobox.suse.cz [10.100.2.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 06EF6A3B83;
 Tue, 26 Oct 2021 09:35:16 +0000 (UTC)
Date: Tue, 26 Oct 2021 11:35:16 +0200 (CEST)
From: Miroslav Benes <mbenes@suse.cz>
To: =?ISO-2022-JP?Q?=1B$B2&lV=1B=28J?= <yun.wang@linux.alibaba.com>
cc: Guo Ren <guoren@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Ingo Molnar <mingo@redhat.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>, 
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
 Nicholas Piggin <npiggin@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, live-patching@vger.kernel.org
Subject: Re: [PATCH v5 1/2] ftrace: disable preemption when recursion
 locked
In-Reply-To: <333cecfe-3045-8e0a-0c08-64ff590845ab@linux.alibaba.com>
Message-ID: <alpine.LSU.2.21.2110261128120.28494@pobox.suse.cz>
References: <3ca92dc9-ea04-ddc2-71cd-524bfa5a5721@linux.alibaba.com>
 <333cecfe-3045-8e0a-0c08-64ff590845ab@linux.alibaba.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_023522_222220_DDF65B71 
X-CRM114-Status: GOOD (  15.68  )
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

Hi,

> diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
> index abe1a50..2bc1522 100644
> --- a/include/linux/trace_recursion.h
> +++ b/include/linux/trace_recursion.h
> @@ -135,6 +135,9 @@ static __always_inline int trace_get_context_bit(void)
>  # define do_ftrace_record_recursion(ip, pip)	do { } while (0)
>  #endif
> 
> +/*
> + * Preemption is promised to be disabled when return bit > 0.
> + */
>  static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsigned long pip,
>  							int start)
>  {
> @@ -162,11 +165,17 @@ static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsign
>  	current->trace_recursion = val;
>  	barrier();
> 
> +	preempt_disable_notrace();
> +
>  	return bit;
>  }
> 
> +/*
> + * Preemption will be enabled (if it was previously enabled).
> + */
>  static __always_inline void trace_clear_recursion(int bit)
>  {
> +	preempt_enable_notrace();
>  	barrier();
>  	trace_recursion_clear(bit);
>  }

The two comments should be updated too since Steven removed the "bit == 0" 
trick.

> @@ -178,7 +187,7 @@ static __always_inline void trace_clear_recursion(int bit)
>   * tracing recursed in the same context (normal vs interrupt),
>   *
>   * Returns: -1 if a recursion happened.
> - *           >= 0 if no recursion
> + *           > 0 if no recursion.
>   */
>  static __always_inline int ftrace_test_recursion_trylock(unsigned long ip,
>  							 unsigned long parent_ip)

And this change would not be correct now.

Regards
Miroslav

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
