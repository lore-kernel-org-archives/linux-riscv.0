Return-Path: <SRS0=Lzn7=D4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEACCC388F9
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2020 14:12:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38AAE22248
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2020 14:12:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fZW/g/+I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38AAE22248
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PGSW9WWphSMg9Z6wRyTeAMSKvpIB4qkeS2c1LsBKwHE=; b=fZW/g/+I3HLMuJn8hlz8aA/Ls
	0iucvNKkFrVJr2wq0v/HIC8UklLjJrTJRiZO93/cC7K+1b3AKeXR/oQVPpV4dbPzcgulPUjk9/fgL
	quodBaezgm/vuN38cw2wPjZ9f/gD4C04UbONT9/ETi4UuCRccW0ChevbRkKQrzx6zJ08SAnvsBa9n
	b4IBtQVejha3ZU43HAFQV5b4ZRp0/CvpyO57pynP3HJR6edVIrumOtb/SG0rWF1yHClUq84zYcT06
	crWiSuBoNCEcUC41EiPskbAjrjPS8mGONSNLBbGYNfobWICMhii0mK3nK8ABCBaSzVtUKCYVA3xXb
	vnHoo9qLw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVEqm-0002u9-A8; Wed, 21 Oct 2020 14:12:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVEqj-0002ta-5M
 for linux-riscv@lists.infradead.org; Wed, 21 Oct 2020 14:12:22 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2D2EC22249;
 Wed, 21 Oct 2020 14:12:18 +0000 (UTC)
Date: Wed, 21 Oct 2020 10:12:16 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Zong Li <zong.li@sifive.com>
Subject: Re: [PATCH] stop_machine: Mark functions as notrace
Message-ID: <20201021101216.4d840e15@gandalf.local.home>
In-Reply-To: <20201021073839.43935-1-zong.li@sifive.com>
References: <20201021073839.43935-1-zong.li@sifive.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_101221_299325_9419EFC2 
X-CRM114-Status: GOOD (  22.99  )
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
Cc: rcu@vger.kernel.org, palmerdabbelt@google.com, paulmck@kernel.org,
 linux-kernel@vger.kernel.org, vincent.whitchurch@axis.com,
 jiangshanlai@gmail.com, josh@joshtriplett.org, linux-riscv@lists.infradead.org,
 colin.king@canonical.com, atishp@atishpatra.org,
 mathieu.desnoyers@efficios.com, mhiramat@kernel.org, paul.walmsley@sifive.com,
 joel@joelfernandes.org, guoren@kernel.org, tglx@linutronix.de,
 greentime.hu@sifive.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 21 Oct 2020 15:38:39 +0800
Zong Li <zong.li@sifive.com> wrote:

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

I really do not like to add "notrace" to core functions because a single
architecture has issues with it. Why does RISCV have problems with these
functions but no other architecture does?

NACK from me until it is shown that these are issues for a broader set of
architectures.

It sounds to me like you are treating a symptom and not the disease.

-- Steve


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
>  	int special;
>  
> diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
> index 865bb0228ab6..890b79cf0e7c 100644
> --- a/kernel/stop_machine.c
> +++ b/kernel/stop_machine.c
> @@ -178,7 +178,7 @@ static void ack_state(struct multi_stop_data *msdata)
>  		set_state(msdata, msdata->state + 1);
>  }
>  
> -void __weak stop_machine_yield(const struct cpumask *cpumask)
> +notrace void __weak stop_machine_yield(const struct cpumask *cpumask)
>  {
>  	cpu_relax();
>  }


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
