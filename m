Return-Path: <SRS0=maVz=EB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F0F4C388F7
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 02:56:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE3242222C
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 02:56:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kOqN1J7+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="EnW0FNHH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE3242222C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=V9Sr1j4D21OmaznVpMw22aHMG5K+WtfosejFD9le72A=; b=kOqN1J7+U/ztBtdEc1ZrDt11D
	ep1+C8I12R6dwRfBI4KwlesX5EzbxvgPk0hsywLGQfLoR1BaNgdIfRWPQvGQgBSPFlNnmuNXaTSff
	AP9IqtnQQDQ6wPnQoZhOvdM55MrhCDhMdgrJy37dc4O0PWSbcB9qhyz6cf3OjYnsIzwmfHC7RfWnt
	9aJhQ1iumuIhKYeBpffrS/y9Fd/Z/ahDBtZXgsv+iIVS/hvau8ao4a1X3VUq6fzqX3EF3ffBBita/
	+VQyzxoqwg2J4yf10W4l/m0MtU25NF+/E1d9yIto223qKJloVZ7i/KozqdtGfi2mItqivUPHEoK/Y
	NHYbtP+EQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kWsgS-0000lN-20; Mon, 26 Oct 2020 02:56:32 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kWsgO-0000kX-I4
 for linux-riscv@lists.infradead.org; Mon, 26 Oct 2020 02:56:29 +0000
Received: by mail-ot1-x341.google.com with SMTP id n15so6748197otl.8
 for <linux-riscv@lists.infradead.org>; Sun, 25 Oct 2020 19:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1A7KKpu8iHyelnMvFNOPHpastJBG2S7fqWEYdd55aZM=;
 b=EnW0FNHH+r03d90oq8rGBpzPagH7cu9Dhhb2NyS7D5ueAdaKA+G/a+BfYWtrs5YUKI
 dufXhw0/7KTydE5JUmyGswgoTGmB8XaG4O30hp4jc/2rQwTvrm5XWNQmsrasi0HpoKpa
 BH3ru72/cbiMlxVPYb3B5OKyrNPmHYw6CVwADY2ni6uL7fvqNBm/iFbYciJxCa2EJzSK
 h1rJ+Ap4SXrnFsrRCcXM2WdezQYC/+ZO1emUQB14SkcvvHa74n8Zy1Qy/tjEopEN0ZZ4
 s3ioyy6Av14dWNGcUxYHTBvkkehVa01VTo2qD0Bxb4ZiHXokGxnzxdGn706NTcxuww/M
 6fxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1A7KKpu8iHyelnMvFNOPHpastJBG2S7fqWEYdd55aZM=;
 b=Xj3F/cK4EVuMEhCNsyH88Dhuc3VAinznhN2fx1XbxS+5tpQwROBdGBE/p+nZjBSehC
 AVqDRVYOuPuiqjG4P9gvdna6q1efJ+O+kw7WBaVO1Q4KcDKaN+bsKvIOzQ7w5rgSWIwV
 Xjb+A7gvR+bMU2ZY1cYeXwsfB0V64N7wcTLfr68pn0OsjT7IEJusRbDtTtNSclO6Egy2
 bfSxDeIBh+s5iyaaUe3Lm/bRwlgm7dm9TC+aLaZh6poO5KkaRp7dSnfi6aanYfmbLzoO
 7rOitAMHJfcwiucwegYz4VF4WRv+q86edR1nXBInpdYYNc8io7myslTLcw6Zl48qLaGW
 X8IQ==
X-Gm-Message-State: AOAM533GIK61euP8gYewPyZJt1KWg4nVWhWNzOBmRO+TfXZs1INV525j
 TitaCmchKU3tM3LFxx8CAWixeYWKWNpDSjRp+qnZLw==
X-Google-Smtp-Source: ABdhPJyLOUdems4JWzS/MRZn8GpPxi1lg+1JMAhEnm9vnRVUPvvsCtolJPvi2h6QcMszn37KmBclhtRFhGzGacKicbs=
X-Received: by 2002:a9d:bb2:: with SMTP id 47mr5794824oth.160.1603680985321;
 Sun, 25 Oct 2020 19:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201021073839.43935-1-zong.li@sifive.com>
 <50bdca78-0cbb-5c62-f241-ed50737131b2@canonical.com>
In-Reply-To: <50bdca78-0cbb-5c62-f241-ed50737131b2@canonical.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 26 Oct 2020 10:56:16 +0800
Message-ID: <CANXhq0p5G0PwL+bnsjdEbPMtU1qveLXyshQWuab2pe3Pn9UXfg@mail.gmail.com>
Subject: Re: [PATCH] stop_machine: Mark functions as notrace
To: Colin Ian King <colin.king@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201025_225628_620887_46B9A400 
X-CRM114-Status: GOOD (  22.21  )
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
Cc: rcu@vger.kernel.org, Palmer Dabbelt <palmerdabbelt@google.com>,
 paulmck@kernel.org, vincent.whitchurch@axis.com, jiangshanlai@gmail.com,
 josh@joshtriplett.org, Steven Rostedt <rostedt@goodmis.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@atishpatra.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, mathieu.desnoyers@efficios.com,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, joel@joelfernandes.org,
 Guo Ren <guoren@kernel.org>, tglx@linutronix.de,
 Greentime Hu <greentime.hu@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Oct 24, 2020 at 3:29 AM Colin Ian King <colin.king@canonical.com> wrote:
>
> On 21/10/2020 08:38, Zong Li wrote:
> > Like the commit cb9d7fd51d9f ("watchdog: Mark watchdog touch functions
> > as notrace"), some architectures assume that the stopped CPUs don't make
> > function calls to traceable functions when they are in the stopped
> > state. For example, it causes unexpected kernel crashed when switching
> > tracer on RISC-V.
> >
> > The following patches added calls to these two functions, fix it by
> > adding the notrace annotations.
> >
> > Fixes: 4ecf0a43e729 ("processor: get rid of cpu_relax_yield")
> > Fixes: 366237e7b083 ("stop_machine: Provide RCU quiescent state in
> > multi_cpu_stop()")
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
> >  kernel/rcu/tree.c     | 2 +-
> >  kernel/stop_machine.c | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> > index 06895ef85d69..2a52f42f64b6 100644
> > --- a/kernel/rcu/tree.c
> > +++ b/kernel/rcu/tree.c
> > @@ -409,7 +409,7 @@ bool rcu_eqs_special_set(int cpu)
> >   *
> >   * The caller must have disabled interrupts and must not be idle.
> >   */
> > -void rcu_momentary_dyntick_idle(void)
> > +notrace void rcu_momentary_dyntick_idle(void)
> >  {
> >       int special;
> >
> > diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
> > index 865bb0228ab6..890b79cf0e7c 100644
> > --- a/kernel/stop_machine.c
> > +++ b/kernel/stop_machine.c
> > @@ -178,7 +178,7 @@ static void ack_state(struct multi_stop_data *msdata)
> >               set_state(msdata, msdata->state + 1);
> >  }
> >
> > -void __weak stop_machine_yield(const struct cpumask *cpumask)
> > +notrace void __weak stop_machine_yield(const struct cpumask *cpumask)
> >  {
> >       cpu_relax();
> >  }
> >
>
> Apologies for taking so long to reply, I needed to test this on several
> devices.
>
> This not only fixes the ftrace issue I see on RISC-V but also a ftrace
> hang issue on ARM64 in 5.8 too.
>
> Tested-by: Colin Ian King <colin.king@canonical.com>
>
> Many thanks!

Many thanks all for reviewing and testing.

Hi Palmer,
As Steven suggested, could you help to pick up this patch in RISC-V tree?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
