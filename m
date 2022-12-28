Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B75C3DA7A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Dec 2022 03:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7DhQZBLqCzBIXjYz1MzTR2jFju57mgGTVguQ9Ab8ydY=; b=UelFdasc4P1+4L
	c8bJC3ECxF4aXKtmPXx+iefV46lP6O9AM28wj5gHPYEci9oWWIc8lL2z6tvKtZ1OpPB8zFWV5P4aU
	F6D0utHYLXApKugOUiiQb9rY3wJleR/TxVPtSZFP+PLfv0H9ILazOWknEPAutSWFiLn08z/yuMF7x
	+O70PfS6GovJ03EiMCOTfH3iWN4Vw/xvDlhqAJcDNk8qqW9m4DC7I0H3M3d5iTFimBPo6VyPyb1+t
	yYjKprCc7r5bINeJAFu9KPP8zQycOkH9uyMU12pJYFt1IkPAz0thZ18uYndGSJ3Mv1nnknxIUA4pu
	r8Bd22CaIQxdhP6F4LMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pANaz-001OMf-TM; Wed, 28 Dec 2022 03:59:13 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pANax-001OK3-3g
	for linux-riscv@lists.infradead.org; Wed, 28 Dec 2022 03:59:12 +0000
Received: by mail-ej1-x636.google.com with SMTP id x22so35850038ejs.11
        for <linux-riscv@lists.infradead.org>; Tue, 27 Dec 2022 19:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uajz3/rFZIhwuvQqTExbgiK8YMKxE8V5aNoMCt5C2v8=;
        b=lHXBOBizmfaIzvp++AQ6RJ92WuaqW6pG9YZRpq5bLYzS8MOlLALqcAC+075kTGL5SS
         GSM0SmuU05twt0HJj7q5cdRSvfNkKVR51J+05O+s2yzgxgjwhLdzcBkGfT/kVPo2hwzR
         KlxfTUJFig94MrwK7j9n3VhxOPeFJB66B0ObpUEeNAUaDJ/COPnjLrcjDc1vtxO1LQBs
         5pm9pckLt+D+wo/mlVvChGG26zmTu8Z0Bmb4dgx/2aajaHcv0j2CDkv1/5Q3SQLQEx3A
         uB3Zk5kC12vi0S+mx6n2wbVIynymM+xQu5nwrRZaHkGcl9a4P1w5Gzbbuo6jmjV/BQkx
         UdzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uajz3/rFZIhwuvQqTExbgiK8YMKxE8V5aNoMCt5C2v8=;
        b=P18XtOkTF8Ap/mQM+37HkhJULCsPgmN+bxrNiyDO4j2l3e9ywHOF35Vfl8JkqOGU4u
         LFA3aGncAKRfmSKp4GRVWJNH0h9Ha0BTd65yQRYyyd4485geiYJT7cNR+kZzW8fGN0WV
         7Q74GfaxeHsggY0+MsuoVcm4UqG8RcMKC8It0QK/axATPbeHarJ/RXAudd9n1hW5fniG
         7fPm8c98e6/FL5IRDC5uCBN/pf3X/ndM4BhbSi2Bfye7l3G8SrkLwtVsPSlGA4NVFpU/
         sunH6bGKToFBw1l4SdHDGCAG1BX3YVDi0VBVAlmfu7uhcdxf+O6xZr9CUhsinfyDEmWR
         Yi7Q==
X-Gm-Message-State: AFqh2kp8RKuMuaK7gErYIxmCeKkjI9WcjX4eskTRsk5Z07HmcFFWOr1f
	KWh2Z5whm4Fpt7TZ20Ik7Y8+ZGYRB4fPZiY9NPlkJw==
X-Google-Smtp-Source: AMrXdXtwEtyDk+WDtQkPybw4BXyKeFjO2U4aWXjYbVkZHi7uXkJp/qZbgHSEK2c1NAljUwtDsAxeamTn5bcGiQwUjzI=
X-Received: by 2002:a17:906:3385:b0:7b2:7af0:c231 with SMTP id
 v5-20020a170906338500b007b27af0c231mr1586588eja.240.1672199948219; Tue, 27
 Dec 2022 19:59:08 -0800 (PST)
MIME-Version: 1.0
References: <20221228004444.61568-1-samuel@sholland.org>
In-Reply-To: <20221228004444.61568-1-samuel@sholland.org>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 28 Dec 2022 09:28:56 +0530
Message-ID: <CAAhSdy2WhPouNAYHLaJL8_W4Y4uBRCta=0TcPxpSrsGOmPpboA@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/riscv: Increase the clock source rating
To: Samuel Holland <samuel@sholland.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Prabhakar Lad <prabhakar.csengg@gmail.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_195911_383875_69682FE2 
X-CRM114-Status: GOOD (  17.19  )
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

On Wed, Dec 28, 2022 at 6:14 AM Samuel Holland <samuel@sholland.org> wrote:
>
> RISC-V provides an architectural clock source via the time CSR. This
> clock source exposes a 64-bit counter synchronized across all CPUs.
> Because it is accessed using a CSR, it is much more efficient to read
> than MMIO clock sources. For example, on the Allwinner D1, reading the
> sun4i timer in a loop takes 131 cycles/iteration, while reading the
> RISC-V time CSR takes only 5 cycles/iteration.
>
> Adjust the RISC-V clock source rating so it is preferred over the
> various platform-specific MMIO clock sources.
>
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
> index a0d66fabf073..55dad7965f43 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -73,7 +73,7 @@ static u64 notrace riscv_sched_clock(void)
>
>  static struct clocksource riscv_clocksource = {
>         .name           = "riscv_clocksource",
> -       .rating         = 300,
> +       .rating         = 400,
>         .mask           = CLOCKSOURCE_MASK(64),
>         .flags          = CLOCK_SOURCE_IS_CONTINUOUS,
>         .read           = riscv_clocksource_rdtime,
> --
> 2.37.4
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
