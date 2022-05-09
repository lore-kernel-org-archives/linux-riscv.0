Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6738C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 03:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=10bWCLyjj2C2MDLY93EcizG8T+Qt9p/QQ4tcMeDT4d4=; b=NrfZTbjc8bY+De
	skN5xLLWWUF4rUKVXKyKuPl9U5Ayb2UepYey/sFcNw4vx58PpNK6DwGjtyEzFliUqT9sps+oJLnPD
	TMc9Trl0WttJX75EwrMMp3EB+Wlk64Lv54gcn9fEjxmlxexNtFxLZFDi6dIqU2SjELDO4Rc4tGFLk
	oDXX9g1ngwM8uA8OALwZDlbvk52MD2NU34htqLJcNzyJIag7tnvCzc5cLjBoxXIJJrlQ5rs6DfHZC
	CWqik0fINh4ZK/lAnhyNKfgPPHEpwjRL9aBefZEg7b20YUAl/2bjktwB9lvXvj8UwFoMaLsiBdjHv
	+gFHVlIs+y2JYW4TLGMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnuQg-00CH04-Vq; Mon, 09 May 2022 03:51:27 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnuQd-00CGyN-M8
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 03:51:25 +0000
Received: by mail-wr1-x42f.google.com with SMTP id b19so17611740wrh.11
 for <linux-riscv@lists.infradead.org>; Sun, 08 May 2022 20:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=kY8j3urZiYftEoIWj6itnjrLji/bjKW8y+9+36z3Zcs=;
 b=x1Timy6cr18MwlxY9CF20GOJ+EnM2i6uvBz1w/xy/gkEKH0DgUot6cF7QhnrQn6KL8
 9Ry9NGv/m6fXIAOBPNitKX7+Oup8CPJBsSoYtximCtydKFwTLK5grzqVsIph+N7vJIEC
 eyzDRFYZxht7POr0XFGsw7Qu/aBfAre1m7VjYbJOCOfMXCV5WKmcHQtGg6dCGuD4Ye5w
 PMSwN6Q2BpYNmhg+hSklRbTVHJJKcN5+aQCvAopHMDtQXrKjkd1UdaXrNZ1QOY2TtcAb
 1jH0OOjse1qPAJijLMVZJr58Z27OUbdb91gOA+mMQcYgrGFNEIPpMXgGXqsnFeV1gOTS
 Dqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kY8j3urZiYftEoIWj6itnjrLji/bjKW8y+9+36z3Zcs=;
 b=39sJNCDx1vvs0SpSc3G+6mYDG5ocg0NhOZm9w+LcGJSgasvpa/+G4mXGtyZVLZvuTo
 +h9LzcMloK2zNLtJY1n1mY89OScAHimUNAp8acj2BfGH6o+9xGEr3OZFYbt7p2Ux6RLd
 upykJWHnnNrw5WPVVhZtZym0Qirtyx+rmwEf4gAuB9DdrhA+AmNwQUqt3+gzIzF8xJ9H
 O+c9emL27HuhpkTUqVYNEZGX8/L0bH03Abw/I1G3P1/4ALmV24dr5c8nQl5KfeLQPvjU
 EYGED7q9fTSZscKrESctErfKHM4OgUyk70BkVwLJVfyNKmiPS2lf+b4WMrE5ij/urC4B
 Mrzg==
X-Gm-Message-State: AOAM532EXxvaT8rkaVegZDO2L8Ff7T/h88OZRm4nhF+EwYYl520Kqp6/
 mDV4GfoBYyddKJ7hNWEHkwd8ChStmP5JA+FFothEHQ==
X-Google-Smtp-Source: ABdhPJzGALp9+kp1rOS/bBcWeW4rsd2dKqwnGmnsPp3YJ+N0Itw9CLsIZkoFqr5YwhcZF3R01ErVkbi/Wfw0+uHyIOo=
X-Received: by 2002:a5d:6483:0:b0:20c:5c21:5c8c with SMTP id
 o3-20020a5d6483000000b0020c5c215c8cmr12089506wri.86.1652068280641; Sun, 08
 May 2022 20:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220509012121.40031-1-samuel@sholland.org>
In-Reply-To: <20220509012121.40031-1-samuel@sholland.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 9 May 2022 09:21:09 +0530
Message-ID: <CAAhSdy0U23M1wL9xxh20w23xEY-MjxoxxdXVy50G7p8=eXxWKw@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/riscv: Events are stopped during CPU
 suspend
To: Samuel Holland <samuel@sholland.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>, 
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_205123_978906_C7C4FAC5 
X-CRM114-Status: GOOD (  19.65  )
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

On Mon, May 9, 2022 at 6:51 AM Samuel Holland <samuel@sholland.org> wrote:
>
> Some implementations of the SBI time extension depend on hart-local
> state (for example, CSRs) that are lost or hardware that is powered
> down when a CPU is suspended. To be safe, the clockevents driver
> cannot assume that timer IRQs will be received during CPU suspend.
>
> Fixes: 62b019436814 ("clocksource: new RISC-V SBI timer driver")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>
>  drivers/clocksource/timer-riscv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index 1767f8bf2013..593d5a957b69 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -34,7 +34,7 @@ static int riscv_clock_next_event(unsigned long delta,
>  static unsigned int riscv_clock_event_irq;
>  static DEFINE_PER_CPU(struct clock_event_device, riscv_clock_event) = {
>         .name                   = "riscv_timer_clockevent",
> -       .features               = CLOCK_EVT_FEAT_ONESHOT,
> +       .features               = CLOCK_EVT_FEAT_ONESHOT | CLOCK_EVT_FEAT_C3STOP,
>         .rating                 = 100,
>         .set_next_event         = riscv_clock_next_event,
>  };
> --
> 2.35.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
