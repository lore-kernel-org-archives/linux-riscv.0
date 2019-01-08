Return-Path: <SRS0=dvb3=PQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 937D3C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 11:57:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63365206B7
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 11:57:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qqfQe3DF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="m5G4xg/0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63365206B7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sccngwMMwaidInnOBy3TC+bcxzvHAb9tUlSiOjE2Wvg=; b=qqfQe3DFCgPi5u
	V87m32dhZclt/rg0d64+eDUZr8ixm8djveE8kLAXbK78nsKArqwpu61D9RyD8c19woAMQA1/47aUR
	F2+yxM9clv1pOcB1W3CMpY6U4j/wvCz+LdnEM0eydQ8EEfdadrHyL1+QlVd/K+KkpxPZ+9o8zkkCF
	iCwazEbAAULqnQpeheBx8R+oZJdAcQCZ9GPXqBRr0S0CPDmd4eqI3Sq0ibzQSQns9bO7IPifGYEpk
	hiXNkP6+VWcnO2YBbmQVQ+gnwQFbSPrWUG0BZGkUkYDvOkfqRi/AGIDCcMMp6zv9Sz6WjHOu98uQ5
	zjd7iJv35awOKvS1Fqvg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggq0E-0003Cz-9S; Tue, 08 Jan 2019 11:57:02 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggq0B-0003C8-Rq
 for linux-riscv@lists.infradead.org; Tue, 08 Jan 2019 11:57:01 +0000
Received: by mail-wm1-x344.google.com with SMTP id p6so4091843wmc.1
 for <linux-riscv@lists.infradead.org>; Tue, 08 Jan 2019 03:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZhAZJuqPU7RKOJhMeSxOJONoJ67G3o8MCo8xEvxcW8E=;
 b=m5G4xg/0cyJYmjd1Ky/f2AU9v7fJ4SPYRWFV4xsXlZiGBtigpCDw36KTwMss2VbTy7
 Km/7fwHldwVB1HgDX4egn2hQbvyBgwP3n+XtQ+OyEvQwk0Jw3zjhQTBQ++NNdt4rM01v
 1HIyPhfX63YlT8XKhfj1U6kmW8HNw39jJugwcZ0Nl5UfjlWfGsggCmMo3/JdMK+ggCPn
 wsrGq0fRmna7/YE4azAbuwLyWtv0yLNIaLwKsrDV+6i8IHtojdFcS5o7N778Cbve6pZD
 2vg+tlh4zrbm8rkJwaDsYLwY3rHlifawK5sbUdqbyPyL8YT2htkvXcMGKJNAtz34fHj+
 5wkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZhAZJuqPU7RKOJhMeSxOJONoJ67G3o8MCo8xEvxcW8E=;
 b=sfLMosrVC+FNqHxj/7mXzyqBIcgxi8X52Dn1fll8tKMk+3syymdwDWcVlbSYBTDmlV
 36aMU8K4w33AwCX4y3rO4iksNC2cPT+J3+8yVKOvLCqjWjEHGCVAtSsn10mnPOV2ZADD
 JKKcWL0aew0tmJcagQXzfa5BFt+qB+6FwRvFDmNp6p84z6joVn5DjblHcN4IoRgFS9KZ
 xAwrzABoPjKbDwiVwab/Bm+C89NPYu+ZR0dox6DW01RYVtccGujTqCbO/+CL8s6m75NM
 uUCHV7b8m7sxI4qqXs4M52VRrl/fEmwQ4ToJT30m7ISu2Q/rRFWY2OYaustooBkxj1Xt
 xpCg==
X-Gm-Message-State: AJcUukeI/5YZn1M59VMENay6dQfWve00O73ZlP74/EOhTdQmm0xAIJVg
 NipO2dXG6P1FvlyIII9+ni3HC9zIvokzsr1Jxs+gDQ==
X-Google-Smtp-Source: ALg8bN6Wfyhx4ZB6t+BJ7QeFc2BIH1aA1jxKAfnPSCTjW+ax7ahyCb0KU+/9lHBirwjCHa8GCI6vRkPGCtNpeJWqAFM=
X-Received: by 2002:a1c:f509:: with SMTP id t9mr1662305wmh.76.1546948616128;
 Tue, 08 Jan 2019 03:56:56 -0800 (PST)
MIME-Version: 1.0
References: <1546940318-9752-1-git-send-email-atish.patra@wdc.com>
 <1546940318-9752-7-git-send-email-atish.patra@wdc.com>
In-Reply-To: <1546940318-9752-7-git-send-email-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 8 Jan 2019 17:26:45 +0530
Message-ID: <CAAhSdy0VsOjiSRhBY7fdXVOccWV+4j_UJwKdNX4cNWHBJKyGeA@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] RISC-V: Add required checks during clock source
 init
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_035659_903838_B089C4F9 
X-CRM114-Status: GOOD (  15.43  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?Q?Patrick_St=C3=A4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Alan Kao <alankao@andestech.com>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Andreas Schwab <schwab@suse.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Michael Clark <michaeljclark@mac.com>, Marc Zyngier <marc.zyngier@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>, Zong Li <zongbox@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Few nit changes..

Prefer, "clocksource/drivers/riscv:" prefix instead of "RISC-V:" for
this patch.

On Tue, Jan 8, 2019 at 3:08 PM Atish Patra <atish.patra@wdc.com> wrote:
>
> Currently, clocksource registration happens for an invalid cpu
> for non-smp kernels. This lead to kernel panic as cpu hotplug
> registration will fail for those cpus. Moreover,
> riscv_hartid_to_cpuid can return errors now.
>
> Do not proceed if hartid or cpuid is invalid. Take this opprtunity
> to print appropriate error strings for different failure cases.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  drivers/clocksource/timer-riscv.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index 43189220..d9b914e9 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -95,14 +95,31 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>         struct clocksource *cs;
>
>         hartid = riscv_of_processor_hartid(n);
> +       if (hartid < 0) {
> +               pr_warn("Not valid hartid for node [%pOF] error = [%d]\n",
> +                       n, hartid);
> +               return hartid;
> +       }

Add empty line here.

>         cpuid = riscv_hartid_to_cpuid(hartid);
>

Remove empty line here

> +       if (cpuid < 0) {
> +               pr_warn("Invalid cpuid for hartid [%d]\n", hartid);
> +               return cpuid;
> +       }
> +
>         if (cpuid != smp_processor_id())
>                 return 0;
>
> +       pr_err("%s: Registering clocksource cpuid [%d] hartid [%d]\n",
> +              __func__, cpuid, hartid);
>         cs = per_cpu_ptr(&riscv_clocksource, cpuid);
> -       clocksource_register_hz(cs, riscv_timebase);
> +       error = clocksource_register_hz(cs, riscv_timebase);
>

Remove empty line here.

> +       if (error) {
> +               pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
> +                      error, cpuid);
> +               return error;
> +       }

Add empty line here.

>         sched_clock_register(riscv_sched_clock,
>                         BITS_PER_LONG, riscv_timebase);
>
> @@ -110,8 +127,8 @@ static int __init riscv_timer_init_dt(struct device_node *n)
>                          "clockevents/riscv/timer:starting",
>                          riscv_timer_starting_cpu, riscv_timer_dying_cpu);
>         if (error)
> -               pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
> -                      error, cpuid);
> +               pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
> +                      error);
>         return error;
>  }
>
> --
> 2.7.4
>

Apart from above, looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
