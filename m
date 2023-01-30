Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C49C54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 09:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U5FqPZTYRHUxghNDA0Cuzz4vCSQABFObaNJSeaC3wKE=; b=kKe/Dk6UK/LXZH
	78v6Q/bJ1FcSvi7ihl2uI4IHjbNMGW6bQAy0DgJ2fGUJo8wV15d43vmA+4VEN87ly/O8yvHpCBErO
	pc7W/0G1rwlxEf/clITKHqvabp/OZy0bbROqNEcQZB1LXzr/5QNYQTF5mYocgtcgVQFUJeIj39L/+
	U/AiHaX5i+NnAPH6m+PJ1hUpyZB5tnxcyAP7Ti5omWjAnEq/024KlWnrnipP4ZbbwwmErpFALFcWm
	fuwbDKPmFHjoueczJnCU+QJruSW+hsW/Te1Ki7L9Net8ERGj1HEpPoWLJPHmWYO6DBytwp0CZAI9z
	txR+La715IYZLE3r7YGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMQrK-002yru-MM; Mon, 30 Jan 2023 09:53:54 +0000
Received: from mail-qv1-f51.google.com ([209.85.219.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMQrH-002yrD-IX
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 09:53:52 +0000
Received: by mail-qv1-f51.google.com with SMTP id ll10so7375808qvb.6
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 01:53:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5W5rVZ1fIbyJmvcTi+8Jg6ecbdKjIlcZKlLQLo2bEEY=;
        b=AE7pMBEmwPWqK2ZWVhpwvs/M10TcmElib0fj4zR+iZ71Xgy9Z81c4LY9gvovX2YuIi
         F7NFDTK8yI7gGOIfJmmME3lN9EQ2JfivgD4P7scXIddCtCI6/tlKcQ4hMvwK54HhDGrA
         R+MdZ3vg3laF3spLKVPCYjhOah0Yy7/0WR+e+pm+WFTyWeJllNrEG98Q5+ygnaYwJK9Z
         SmQvowm0DpQCBYa+bJ4SexNGkY5qJ1w5Z3PQmP6bd6oL5GgZSoIH0FjLUbDab5620ceV
         +Zc9Hjl0lAOhipL2baT7EJNLzCCqQFli6x4cYUbCo6nhecC+BcpvT+14hKhkkwXwYs5u
         vy7g==
X-Gm-Message-State: AFqh2kqz+UnspxrI6I5D89qzuRAxzSlJTEJYxF8REbnei6rUlWUmgMgu
	b5sc5/74JTLMVtscDRPsVQUssjXVEzIKNQ==
X-Google-Smtp-Source: AK7set9C1VARn8kJNrgwfB2Mt/Mislw44nM48448mdMKEk+AX9+Jrn1s0yQdLspmLOXpqidGXdiH6A==
X-Received: by 2002:a05:6214:8f2:b0:537:6472:a39b with SMTP id dr18-20020a05621408f200b005376472a39bmr33079247qvb.1.1675072429873;
        Mon, 30 Jan 2023 01:53:49 -0800 (PST)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id l25-20020a37f519000000b006bb82221013sm7789657qkk.0.2023.01.30.01.53.48
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 01:53:49 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id e15so13273032ybn.10
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 01:53:48 -0800 (PST)
X-Received: by 2002:a25:9ac1:0:b0:7b4:6a33:d89f with SMTP id
 t1-20020a259ac1000000b007b46a33d89fmr3784853ybo.543.1675072428751; Mon, 30
 Jan 2023 01:53:48 -0800 (PST)
MIME-Version: 1.0
References: <20230130093229.27489-1-nylon.chen@sifive.com> <20230130093229.27489-3-nylon.chen@sifive.com>
In-Reply-To: <20230130093229.27489-3-nylon.chen@sifive.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Jan 2023 10:53:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXiKAyUeZvmAsNfjJ7_x9bK1zO3iUPdcQ7-60tLQOx_cg@mail.gmail.com>
Message-ID: <CAMuHMdXiKAyUeZvmAsNfjJ7_x9bK1zO3iUPdcQ7-60tLQOx_cg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pwm: sifive: change the PWM controlled LED algorithm
To: Nylon Chen <nylon.chen@sifive.com>
Cc: aou@eecs.berkeley.edu, conor@kernel.org, 
	emil.renner.berthing@canonical.com, heiko@sntech.de, 
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, robh+dt@kernel.org, thierry.reding@gmail.com, 
	u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, nylon7717@gmail.com, zong.li@sifive.com, 
	greentime.hu@sifive.com, vincent.chen@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_015351_628498_C66FBCA0 
X-CRM114-Status: GOOD (  20.11  )
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

Hi Nylon,

On Mon, Jan 30, 2023 at 10:32 AM Nylon Chen <nylon.chen@sifive.com> wrote:
> The `frac` variable represents the pulse inactive time, and the result of
> this algorithm is the pulse active time. Therefore, we must reverse the
> result.
>
> The reference is SiFive FU740-C000 Manual[0].
>
> [0]: https://sifive.cdn.prismic.io/sifive/1a82e600-1f93-4f41-b2d8-86ed8b16acba_fu740-c000-manual-v1p6.pdf
>
> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>

Thanks for your patch!

> --- a/drivers/pwm/pwm-sifive.c
> +++ b/drivers/pwm/pwm-sifive.c
> @@ -158,6 +158,7 @@ static int pwm_sifive_apply(struct pwm_chip *chip, struct pwm_device *pwm,
>         frac = DIV64_U64_ROUND_CLOSEST(num, state->period);
>         /* The hardware cannot generate a 100% duty cycle */
>         frac = min(frac, (1U << PWM_SIFIVE_CMPWIDTH) - 1);
> +       frac = (1U << PWM_SIFIVE_CMPWIDTH) - 1 - frac;

Shouldn't the inversion be done before the hardware limitation fixup?

>
>         mutex_lock(&ddata->lock);
>         if (state->period != ddata->approx_period) {

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
