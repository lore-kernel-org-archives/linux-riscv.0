Return-Path: <SRS0=o9Ga=MP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D0EC4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 03:22:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C9CF60E74
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 03:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C9CF60E74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MlmoR5WZk3De8BaN9EImz6bekc/7Co5IoE7YS4AGJdE=; b=Eh9yIj1zEQee9T
	Kw/1iy+Ll8FIHwE7VAQ+ESHFmDhKQfSfRa8S2HS6zobKE7Td1VvUXYU//Mg6igbk0k407f/cUflxZ
	npzvOyqAhC8fq4FbekOcoK51cvDSfCVbc6SNsoJsFrR8lyk/BU+pbCkxWV/jl9717q2cVeEuyBt7g
	n+F+wZHzgLLp7zX9r1ymGehFCpwfuIplC0Smlcz4O3fGZOeWqbee6wMgjgTQj/8Gj7pcIsW+JPVm7
	jPFdPLPNdxwSnvMW3AMLrPxhdkFsSLALgroy3KfnLXRPhinSz77lwRDo75h5s5WjTSu70OlBUKrUj
	Y7F0wN9tXy123tQOK1iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6ll7-003BUG-0n; Fri, 23 Jul 2021 03:21:57 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6ll3-003BTH-IZ
 for linux-riscv@lists.infradead.org; Fri, 23 Jul 2021 03:21:55 +0000
Received: by mail-pj1-x1034.google.com with SMTP id l19so439195pjz.0
 for <linux-riscv@lists.infradead.org>; Thu, 22 Jul 2021 20:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AtH2aq8wvwftoCTnGV+K1KK/vzNnp0bnp646fBmoSDE=;
 b=cyHMsNIbm98U1YvH7gNplxcXYh8gcA1cCZMOJQ0JgXJaeg57IuoorBWZDbG/YUVY28
 TwXxTWCfjRAdjE6PZeYy2YI77QFEZizpuhMoAj1zx14uBIuHfTy8/hPR72MWf+ticmDw
 cFrcpmeeId49lZxyepNFmSh8krNnCwhCFDohr0nC0ay8mFJv5yxq6h8Dsf5yXAIYjpdh
 G3O0glsufosyTjI4fl0PEcyyjZO81lh32Ne6UrZR3fCm0GfcqoCbsMSpzB5eJ6dq0OSk
 Bc9CEQbwqEeODu6Xxy8oSyjEHRJiG05yyDt7MLk1++REYjIHY3cjVKHHvTa9p3iJ//Gy
 1Gkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AtH2aq8wvwftoCTnGV+K1KK/vzNnp0bnp646fBmoSDE=;
 b=HyqAg1axBQxenMtMd2VLwFhRnTV519tHBDVgJ/c9lJIVkRTrNbm+bBw5oQ4xb3Cyyn
 N1p8JrjBXPe62Gez7a0N/nrtNz12bjZi5ouCaCsTleM6dqiRcz/CzLqaFQyrE88nA0gD
 o+UbxptLMQ8slUt87ik/wnTQF29VWyhcGsocCFhnW1mDbMPacIDjTUC2Acn7zzHGJ0FY
 k3BmndtIkp2O4nGiq5UFM0BHwhToqD3/9BHHjm71mxqaRc9uW1nmGoLNdwNsK4iN79as
 XDu+cZk18XGK1P7OBxiFDp9ZR4q8amcaBQWTLPe4xRjvZgKFBmwLCu0rjl1HxezUefRP
 S24g==
X-Gm-Message-State: AOAM533iddgJ7Jnt48LhPl9JJTKwxEFke73fTT22AlLETyLWlN1c7ltU
 aJ05gwiWtF+OwJVMlf+hc6I=
X-Google-Smtp-Source: ABdhPJxycto0F4wvzEcYcFCyA4VIa9bbl0iMZafxaiZjoXT6mKGfiy8o1CG9QP5e+fdz6pV0Sr2yiQ==
X-Received: by 2002:a62:e50c:0:b029:2f9:b9b1:d44f with SMTP id
 n12-20020a62e50c0000b02902f9b9b1d44fmr2773132pff.42.1627010511409; 
 Thu, 22 Jul 2021 20:21:51 -0700 (PDT)
Received: from localhost.lan (p1284205-ipngn14601marunouchi.tokyo.ocn.ne.jp.
 [153.205.193.205])
 by smtp.gmail.com with ESMTPSA id b17sm28526637pfm.54.2021.07.22.20.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 20:21:50 -0700 (PDT)
Received: from localhost (localhost [IPv6:::1])
 by localhost.lan (Postfix) with ESMTPSA id B0D199011CB;
 Fri, 23 Jul 2021 03:21:48 +0000 (GMT)
Date: Fri, 23 Jul 2021 03:21:48 +0000
From: Vincent Pelletier <plr.vincent@gmail.com>
To: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <Atish.Patra@wdc.com>
Cc: David Abdurachmanov <david.abdurachmanov@sifive.com>
Subject: Re: PLIC and interrupts received while no hart enabled
Message-ID: <20210723032148.70ad0b32@gmail.com>
In-Reply-To: <20210704064058.79237058@vincent>
References: <20210704064058.79237058@vincent>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_202153_695603_82C8CDBC 
X-CRM114-Status: GOOD (  43.56  )
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

On Sun, 4 Jul 2021 06:41:14 +0000, Vincent Pelletier <plr.vincent@gmail.com> wrote:
> Hello,
> 
> I've recently purchased a sifive unmatched board, and have tried to
> complete its devicetree using the schematics.
> 
> Doing so, I enabled some sub-functions of its PMIC chip (DA9063). Those
> which matter for this email are:
> - power button, notified by interrupt
> - hwmon, based on an ADC which signals conversion completion with an
>   interrupt
> 
> The PMIC has an interrupt line, active low, connected to line 1 of the
> GPIO controller embedded in the board's SoC (fu740).
> Internally to the SoC, the GPIO has one interrupt line per GPIO line,
> connected to the PLIC.
> 
> The issue I originally had was, which I noticed with the ADC but could
> equally reproduce with the power button, I could only ever get a single
> IRQ to be processed.
> 
> Reading the corresponding registers (with the script attached),
> enabling IRQ and regmap tracing, I saw the output at the end of this email.
> 
> Here is how I read the register states:
> - initial state:
>   The PMIC interrupt line is in its idle state (high).
>   The GPIO controller noticed the high state, and armed the
>   corresponding interrupt-pending bit - this an important first piece of
>   information.
>   As the corresponding interrupt-enable is cleared, no interrupt is
>   signalled and the PLIC does not see an interrupt pending. This is all
>   good.
> - after one button press:
>   The PMIC interrupt line is again in its idle state, so the interrupt
>   source was cleared. I know it triggered as the power button input
>   event does fire as intended.
>   This time, the GPIO controller noticed 3 interrupt conditions on this
>   line: low, rising edge, and high. This means it was cleared *before*
>   the PMIC line went high:
>   - if it was cleared after, only "high" should be visible
>   - if is was never cleared, all low/rise/high/fall interrupt
>     conditions would be present
>   As the "low" interrupt is enabled, I believe (but cannot check) that
>   it notified the PLIC of the interrupt.
>   But like before, the PLIC does not see this interrupt being signalled.
> 
> As a result, the hart assigned to this interrupt (here, hart4) does not
> get interrupted even after it gets re-assigned to the corresponding
> PLIC line, so the GPIO interrupt pending bits are never cleared, and it
> cannot signal any further interrupt to the PLIC.
> Pressing the key a second time, the only difference is that the GPIO
> controller noticed the falling edge interrupt condition, which is
> masked so nothing happens.
> 
> The kernel/debug/tracing/trace buffer tells a similar story:
> - the GPIO regmap clear writes happen first
> - later, the PMIC interrupt source register is cleared (the write to
>   register 6)
> 
> Checking gpio-sifive.c and irq-sifive-plic.c, I see:
> - the GPIO propagates irq_mask and irq_unmask to the PLIC
> - the PLIC implements irq masking by making the interrupt line handled
>   by no hart
> 
> Reading the PLIC documentation, I cannot tell if this behaviour of the
> PLIC ("losing" an interrupt if there is no hart servicing it) is
> intended or not.
> 
> If it is intended, then what is the proper way of masking an
> interrupt ?
> Is it to lower that interrupt priority ? (which I did not try)
> Is it to mask it outside the PLIC (so on the GPIO controller here) ?
> 
> I did try the latter as a quick hack, and it allows repeated
> interrupts, fixing both the power button and the hwmon subsystems.
> But I am not sure it is possible to do this while being certain to never
> lose an interrupt - but I am very new to interrupt handling in Linux.
> 
> Traces:
> 
>   # ./unmatched_gpio_irq_debug.py 1
>   gpio_pin=1 gpio_mask=0b10 plic_irq=24 plic_mask=0b1000000000000000000000000
>   GPIO 1: dir=in  in=1 out=0 irq_en=low irq_pending=high
>   PLIC 24: priority=1 irq_en=hart4 irq_pending=False
>   hart min prio: 1=0, 2=0, 3=0, 4=0
>   # echo 1 > /sys/kernel/debug/tracing/events/regmap/enable; echo 1 > /sys/kernel/debug/tracing/events/irq/enable
> 
>   button pressed once here
> 
>   # echo 0 > /sys/kernel/debug/tracing/events/regmap/enable; echo 0 > /sys/kernel/debug/tracing/events/irq/enable
>   # ./unmatched_gpio_irq_debug.py 1
>   gpio_pin=1 gpio_mask=0b10 plic_irq=24 plic_mask=0b1000000000000000000000000
>   GPIO 1: dir=in  in=1 out=0 irq_en=low irq_pending=rise,high,low
>   PLIC 24: priority=1 irq_en=hart4 irq_pending=False
>   hart min prio: 1=0, 2=0, 3=0, 4=0
> 
> Trace output with i2c interrupts trimmed for brevity:
>           <idle>-0       [000] d.h2   102.707972: irq_handler_entry: irq=53 name=da9063-irq
>           <idle>-0       [000] d.h2   102.707976: irq_handler_exit: irq=53 ret=handled
>           <idle>-0       [000] d.h4   102.708019: regmap_reg_write: 10060000.gpio reg=1c val=2
>           <idle>-0       [000] d.h4   102.708022: regmap_reg_write: 10060000.gpio reg=24 val=2
>           <idle>-0       [000] d.h4   102.708024: regmap_reg_write: 10060000.gpio reg=2c val=2
>           <idle>-0       [000] d.h4   102.708026: regmap_reg_write: 10060000.gpio reg=34 val=2
>  irq/53-da9063-i-140     [002] ...1   102.708072: regmap_hw_read_start: 0-0058 reg=0 count=1
>  irq/53-da9063-i-140     [002] d.h2   102.708121: irq_handler_entry: irq=5 name=riscv-timer
>  irq/53-da9063-i-140     [002] dnh2   102.708159: irq_handler_exit: irq=5 ret=handled
> (snip)
>  irq/53-da9063-i-140     [002] ...1   102.709089: regmap_hw_read_done: 0-0058 reg=0 count=1
>  irq/53-da9063-i-140     [002] ...1   102.709095: regmap_reg_read: 0-0058 reg=0 val=0
>  irq/53-da9063-i-140     [002] ...1   102.709099: regmap_hw_read_start: 0-0058 reg=6 count=4
> (snip)
>  irq/53-da9063-i-140     [002] ...1   102.709879: regmap_hw_read_done: 0-0058 reg=6 count=4
>  irq/53-da9063-i-140     [002] ...1   102.709893: regmap_hw_read_start: 0-0058 reg=0 count=1
> (snip)
>  irq/53-da9063-i-140     [002] ...1   102.710371: regmap_hw_read_done: 0-0058 reg=0 count=1
>  irq/53-da9063-i-140     [002] ...1   102.710374: regmap_reg_read: 0-0058 reg=0 val=0
>  irq/53-da9063-i-140     [002] ...1   102.710378: regmap_hw_write_start: 0-0058 reg=6 count=1
> (snip)
>  irq/53-da9063-i-140     [002] ...1   102.710763: regmap_hw_write_done: 0-0058 reg=6 count=1
>  irq/53-da9063-i-140     [002] ...1   102.710767: regmap_reg_write: 0-0058 reg=6 val=1
>  irq/53-da9063-i-140     [002] ...1   102.710783: regmap_hw_read_start: 0-0058 reg=0 count=1
> (snip)
>  irq/53-da9063-i-140     [002] ...1   102.711268: regmap_hw_read_done: 0-0058 reg=0 count=1
>  irq/53-da9063-i-140     [002] ...1   102.711271: regmap_reg_read: 0-0058 reg=0 val=0
>  irq/53-da9063-i-140     [002] ...1   102.711274: regmap_hw_read_start: 0-0058 reg=1 count=1
> (snip)
>  irq/53-da9063-i-140     [002] ...1   102.711770: regmap_hw_read_done: 0-0058 reg=1 count=1
>  irq/53-da9063-i-140     [002] ...1   102.711773: regmap_reg_read: 0-0058 reg=1 val=0
>  irq/53-da9063-i-140     [002] d..3   102.712183: softirq_raise: vec=6 [action=TASKLET]
>      ksoftirqd/2-23      [002] ..s1   102.714162: softirq_entry: vec=6 [action=TASKLET]
>      ksoftirqd/2-23      [002] ..s1   102.714173: softirq_exit: vec=6 [action=TASKLET]
> 
> Regards,

I have just been told that someone has the same issue on the previous
sifive board (hifive unleashed) which uses the same GPIO and PLIC
modules, although they were using the 5.10.42 kernel.

So I would like to go forward with my RFC gpio patch,
  https://patchwork.kernel.org/project/linux-riscv/patch/8c36c1a28ce63b5120765fd3c636944bfec8bee9.1625882423.git.plr.vincent@gmail.com/
but before this if possible I would prefer to get feedback about the
PLIC:
Is the behaviour I describe above expected ?

I do not find anything in the PLIC documentations (neither riscv.org
nor sifive) which mention whether the PLIC gateways should be edge- or
level-sensitive.

I suspect in the sifive SoC it would be edge-sensitive whereas the
embedded GPIO chip would produce a level IRQ output, something like
  (pending && enabled)
so both GPIO-level sensitivity types would produce an edge output when
"pending" gets set, but level interrupts would not re-trigger. If this
is the case, then I believe my patch works around the issue: by
changing "enabled" at GPIO level it forces the generation of a new edge
even on level inputs.

But maybe I am missing something more fundamental about how the PLIC
should work.

Regards,
-- 
Vincent Pelletier
GPG fingerprint 983A E8B7 3B91 1598 7A92 3845 CAC9 3691 4257 B0C1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
