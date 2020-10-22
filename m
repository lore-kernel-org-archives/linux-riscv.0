Return-Path: <SRS0=FvZO=D5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76784C55178
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2020 00:58:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E60A2237B
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2020 00:58:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NsHTRlr5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=atishpatra.org header.i=@atishpatra.org header.b="G0PIvqJu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E60A2237B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uKHYC8PXKfmcuyB0KwMuRunldq++nkeWey9PCtQs1aY=; b=NsHTRlr5WJm1vDlvwkN80BilI
	pnF7M2QRk7X/cYbsn9YJrliMH4PTLy4j/ZtXI7XNk3380SwVeApNnkKCtXVC+KjjnPP0DHcSoGRlY
	GzAr73o1KAqRv7afoG7DaHCbfYYaLNgTVeWPRH7aBAtoA+KVMIoy4jEkckMKis6pRbxpUerE5lmen
	V9R/B2BzkmxlwJhHg0lb2iqyc6DhPZAFiwOEZGOlN3OEIblxBYOeCeVcnyqRvFVbTrj1mElmjkBUc
	ZFB+4k4ROpSSVDIiYp+/kAEEr0oAQ0M2RYyPexMvE1+BF6Mbrzq966ZkBkD3IA62bDCfUXLo4UFQy
	kgwS1OLow==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVOw8-0003qQ-LE; Thu, 22 Oct 2020 00:58:36 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVOw4-0003ps-G5
 for linux-riscv@lists.infradead.org; Thu, 22 Oct 2020 00:58:33 +0000
Received: by mail-io1-xd42.google.com with SMTP id q9so5169692iow.6
 for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2020 17:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zeZvoKbrgIVhevjxOiOYNvRjeI72W6AtF3ciDXxGwJQ=;
 b=G0PIvqJuZsR5epI8IijrEuUisk9liNNUla92pT/N31hyikKZ+t4bY1CC9QaLoVrNKV
 I2bkIa/YgOY4oSKbtLqIZ3I8wRWgxiztUdjj5Ae9k6VyP6m5T2EaX7PLlBmdvc1AcOWw
 NBcu552r8cjGCPUvGmgdc0AYNzP+r1R5vLQOk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zeZvoKbrgIVhevjxOiOYNvRjeI72W6AtF3ciDXxGwJQ=;
 b=g+PJOjnGJ69VIlgeYKbG5E6hzptNB7c59Mi9/EdQi+pxi0SfM59vSoTuv25o2y5ReN
 eG5CUetnwey1W4ognZLVlYoea9wxV0F5rYbig0XEP4eGwoJFjBmggJ1V/uBrTGtN56Aq
 Hvh9jXnEULli9GYARNpGCAhT2jB/+kgsibUscxMG16SM81EAoVWdRnwxpRreWPqAqNZp
 5CHk2AtrL/5fYgTOOxkI3i49NTi42KnOYdoIzyenBuVsRnCOZlC5KT+WeLWoIQ6njT+0
 jD5j+YiSXmbH3u0kiJtNaM+VSdGQV3HSY07fBKv5zSpzGsVKAYT11ixawqWOG1vLJZDL
 SU6g==
X-Gm-Message-State: AOAM531j2k/IUYjUTL9sQh1M2qwZyppJEbOGjaul/Pj1O1FRpnmdef8W
 uf1nFkJnV5hhz/8LgucBXdsknOqNEHPJ/5SnJdPy
X-Google-Smtp-Source: ABdhPJyXh89UkF3m+LRLbYtN+p6n3th/chRNGXK1eOu+gpcJZ9EHvtP/n3gMnEqZ+TXNbuVZfSbgH/FiwoE0s53D6ws=
X-Received: by 2002:a5d:84c6:: with SMTP id z6mr171793ior.0.1603328307250;
 Wed, 21 Oct 2020 17:58:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201021073839.43935-1-zong.li@sifive.com>
In-Reply-To: <20201021073839.43935-1-zong.li@sifive.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 21 Oct 2020 17:58:15 -0700
Message-ID: <CAOnJCU+Qr-Avs7HnOfsPC6yKDNzTCEbm_ZhZ3b2V809iHfFSpQ@mail.gmail.com>
Subject: Re: [PATCH] stop_machine: Mark functions as notrace
To: Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_205832_557353_4ACA396D 
X-CRM114-Status: GOOD (  20.13  )
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 vincent.whitchurch@axis.com, jiangshanlai@gmail.com, josh@joshtriplett.org,
 rostedt@goodmis.org, Colin Ian King <colin.king@canonical.com>,
 rcu@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>,
 mathieu.desnoyers@efficios.com, mhiramat@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, joel@joelfernandes.org,
 Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Greentime Hu <greentime.hu@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Oct 21, 2020 at 12:38 AM Zong Li <zong.li@sifive.com> wrote:
>
> Like the commit cb9d7fd51d9f ("watchdog: Mark watchdog touch functions
> as notrace"), some architectures assume that the stopped CPUs don't make
> function calls to traceable functions when they are in the stopped
> state. For example, it causes unexpected kernel crashed when switching
> tracer on RISC-V.
>
> The following patches added calls to these two functions, fix it by
> adding the notrace annotations.
>
> Fixes: 4ecf0a43e729 ("processor: get rid of cpu_relax_yield")
> Fixes: 366237e7b083 ("stop_machine: Provide RCU quiescent state in
> multi_cpu_stop()")
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  kernel/rcu/tree.c     | 2 +-
>  kernel/stop_machine.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> index 06895ef85d69..2a52f42f64b6 100644
> --- a/kernel/rcu/tree.c
> +++ b/kernel/rcu/tree.c
> @@ -409,7 +409,7 @@ bool rcu_eqs_special_set(int cpu)
>   *
>   * The caller must have disabled interrupts and must not be idle.
>   */
> -void rcu_momentary_dyntick_idle(void)
> +notrace void rcu_momentary_dyntick_idle(void)
>  {
>         int special;
>
> diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
> index 865bb0228ab6..890b79cf0e7c 100644
> --- a/kernel/stop_machine.c
> +++ b/kernel/stop_machine.c
> @@ -178,7 +178,7 @@ static void ack_state(struct multi_stop_data *msdata)
>                 set_state(msdata, msdata->state + 1);
>  }
>
> -void __weak stop_machine_yield(const struct cpumask *cpumask)
> +notrace void __weak stop_machine_yield(const struct cpumask *cpumask)
>  {
>         cpu_relax();
>  }
> --
> 2.28.0
>

Thanks for the fix. FWIW,

Tested-by: Atish Patra <atish.patra@wdc.com>

Can you update the bugzilla as well ?

https://bugzilla.kernel.org/show_bug.cgi?id=209317


--
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
