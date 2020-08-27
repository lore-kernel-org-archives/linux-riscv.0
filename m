Return-Path: <SRS0=FYRI=CF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF20DC433DF
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2020 02:02:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABCD62075B
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Aug 2020 02:02:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cIg8cw0D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0iHo369"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABCD62075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LjMmPnDbEA+Y32BSXg7O4vX75ZECTAJyAD3Ty7Cu2ts=; b=cIg8cw0DZueXAHOS9yDCMOIJ7
	P/+t1zeJFDWun96ZTF+64l13BzgnhTskwE23KPCgST6U+93IWyD4hQd1HuSNRuhPyIvyCRrZZ0d03
	JMqfrwsYWXKUGsNQq1gDrXOM7RgxTLeGVnuRHCM6sKTMlXXNQsw7XvREx6Xxsa0z6tDLcgbucyGN7
	frMGeMBWBE2nCyhRhc/x7wB1LOcAjlymWZZ3nqEgpiUQfXbj+a6uENwL15BNluIQ87RM7JHiXNcjE
	Z/YBqdiq65hdo96vMYpo2RK/G72mtd36/NwkuHswQkc9tG5x08Or+JaYmtQAfhUzjWip/OPvBTA4y
	EuLej2otQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kB7FE-0006kn-CZ; Thu, 27 Aug 2020 02:02:28 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kB7F8-0006iZ-QP; Thu, 27 Aug 2020 02:02:23 +0000
Received: by mail-wr1-x443.google.com with SMTP id a5so3788858wrm.6;
 Wed, 26 Aug 2020 19:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ltbgfeR4CcIa3n8+PRW2ashWBVJ/hYJD2qsUPYMSYSk=;
 b=l0iHo369LJRLdiMbIxzuCKs1kXfmBcdJYM08mnt9PKDUhNrg93qRTlFyvqgKxdsSFZ
 jtv7UqacpWXA8FhxsmBLeyvtaSzuYS+lhYOHTdD6w94afEMVbyt29ZOeS4yX0LRo9xvQ
 QW0OI1O59s4HoLkr0sPlSzORcdZeiyavfW6DyJac0JObqhKb6vzFzdUTlG76911hUKgn
 yqx6xCImCNppAmtSFdNc2h+EnxOzsArUICAlO5nOLWX5Z5hjVXFHUvCHi+BWFvrGAWRl
 vjtwCqc0tQdBDevst+xzeiRYoE4+nRzEXaMaOdUhtoNL3FtAO2nbcpaHcfPtXUkgSp0K
 8uVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ltbgfeR4CcIa3n8+PRW2ashWBVJ/hYJD2qsUPYMSYSk=;
 b=EMM7rRm9og2vqjHGAb2bcaKl+Crqu0L2bBeKMuTIuDT//VD0Ya+w59ccC7Wg0+5y0V
 2sqItt75rTmDOmlBAGXNdxjJ3nJ9w0Z/i43ccvOTqhvrNHaE7zhZ3oAe5F+Qw0HU0HBH
 pYTm9Mp4WzKyTlWzs3t6JilV/kXUhQ2B1Nqcs3seonsQMoK3+xkJxIIw2aMXjhX5sbE/
 8BPxvv5Skru9o9EUSJx1J+8hMaaBpqFU4chZtzamCplB5rC0hGJeYzUYi7xdauvejBRS
 NO4DGFfKGVgrRlx8asF4NTvFlKd5QSAQd1bAAsvyQuVxoTF7iVhI/v3tP5rng7cBWOFr
 vP2w==
X-Gm-Message-State: AOAM530ljkXtFYSkjGPo7l4+k0Bjs6puk4M2BjCY/yRr850HThYo5iFr
 d5rx7ifK/1nGXh3V3z5sdxivFWnBEqv1aKLpyY0=
X-Google-Smtp-Source: ABdhPJwEutQykNcVSnhy4lnuPbD9pz6OtKZyUZ1BHPD1zRFH1EZS/HbQoP6uTZaeBG/gB5POYEfTfQjfsOkv0EoRtuU=
X-Received: by 2002:adf:e68f:: with SMTP id r15mr17575849wrm.196.1598493740036; 
 Wed, 26 Aug 2020 19:02:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200826144747.9436-1-krzk@kernel.org>
 <20200826144747.9436-5-krzk@kernel.org>
In-Reply-To: <20200826144747.9436-5-krzk@kernel.org>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Thu, 27 Aug 2020 10:01:43 +0800
Message-ID: <CAAfSe-vaCg7KVQfuNshs8g-dyXxVGEChvGdaxNOyK6qay65qYA@mail.gmail.com>
Subject: Re: [PATCH 5/6] pwm: sprd: Simplify with dev_err_probe()
To: Krzysztof Kozlowski <krzk@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_220222_902356_4A5B88C1 
X-CRM114-Status: GOOD (  18.03  )
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
Cc: Heiko Stuebner <heiko@sntech.de>, Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>, linux-riscv@lists.infradead.org,
 Lee Jones <lee.jones@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>,
 linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
 bcm-kernel-feedback-list@broadcom.com,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Orson Zhai <orsonzhai@gmail.com>, linux-pwm@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Maxime Ripard <mripard@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Baolin Wang <baolin.wang7@gmail.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 26 Aug 2020 at 22:48, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Chunyan Zhang <zhang.lyra@gmail.com>

Thanks!

> ---
>  drivers/pwm/pwm-sprd.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pwm/pwm-sprd.c b/drivers/pwm/pwm-sprd.c
> index be2394227423..5123d948efd6 100644
> --- a/drivers/pwm/pwm-sprd.c
> +++ b/drivers/pwm/pwm-sprd.c
> @@ -228,11 +228,8 @@ static int sprd_pwm_clk_init(struct sprd_pwm_chip *spc)
>                         if (ret == -ENOENT)
>                                 break;
>
> -                       if (ret != -EPROBE_DEFER)
> -                               dev_err(spc->dev,
> -                                       "failed to get channel clocks\n");
> -
> -                       return ret;
> +                       return dev_err_probe(spc->dev, ret,
> +                                            "failed to get channel clocks\n");
>                 }
>
>                 clk_pwm = chn->clks[SPRD_PWM_CHN_OUTPUT_CLK].clk;
> --
> 2.17.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
