Return-Path: <SRS0=zykF=CE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A0DC433DF
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2020 16:22:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F9F72074A
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Aug 2020 16:22:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wH6q2GoW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="0XBaJLdp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F9F72074A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=XMKKLWIMl7GWtF9wFz5nkZty1q9U8FJZAP5VPscVwXA=; b=wH6q2GoWNdY+H55cFhp1DEqID
	M0bMHgIA1O3PJzkd8PTGUUrRcJKCALpb8djQAPuKAvbhKKfEFzyt6mB710hSwCuo8OElMFptF4Ry0
	l5KxpqHIfoYQpnQ3gut1H/tXlRelkO7sRAzGikc8EZh/w3hI70dqtuklO+7n+JLkqSVdfk+1QFv9o
	vh443b9jMc58ZhdmjC8deZU8I+TkztQxQMNyBYfx4/AaW0Z6RIjnYGkR6uAvz0mdXe9V/j1RIczlu
	Eio90gBmBNmcWKmSJl1TTI39c6UJlpuv+OVYNCzPWYlLfI75ZZ614eZbktqP3KE7n9eZOMxUNarWs
	hwFYgyqXA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kAyC2-0005Mh-LJ; Wed, 26 Aug 2020 16:22:34 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kAyBy-0005KR-VZ
 for linux-riscv@lists.infradead.org; Wed, 26 Aug 2020 16:22:32 +0000
Received: by mail-pg1-x541.google.com with SMTP id l191so1284789pgd.5
 for <linux-riscv@lists.infradead.org>; Wed, 26 Aug 2020 09:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=M2pM6oqlNN6MFOKK7t3LmYxIe8hLNoDE+c6Oy6sDbps=;
 b=0XBaJLdphBcrsfjbCsPV/DnDtCuoTybU7kmvMapFYxXvE3qZVFr9blFuHjPXHdTCei
 +jJzOZv28p3I5AapTR4ZbPqikFLUJjy4pvnArkspXnEkiY7GYz3ETVp7OVydR5uMTZM2
 kNbkLJK4XIMHrkChkpj+RwFk29h+27rr1PHt8H2kBjI/enJtfY/WnH80fl+UpX3RP0NU
 TjeoCU06rYZPWboZIgjOEMBygqnFDHBdvdAXceru+Hk8HcCZNQ/RQ1mTpWbBaGnCmI2z
 llHFdLKaXFPfd+lmlicsjJx0Gpg8eX+6uxm66QadJ0HlK1kjZ+gq6LrJ+vvmkLGvJN0a
 UMvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=M2pM6oqlNN6MFOKK7t3LmYxIe8hLNoDE+c6Oy6sDbps=;
 b=uI8uHFoih3MTfBKYYPBbNKc+/1/oNmJDbvzCKyjIs4JUO0TL6/1j7HjCxevPgZNlCp
 oIr8a6PunF8HAtwp9yVlDZskn4Vti4LlPkAo1vo73LtL4eXn3f3zcBEvcZkQBzVcrsZY
 TZpjYYnA26bKv4oq3D1PtgcTGFvnEWw+crsBYQebfbQGR5FM4fuqkOV3e3HWDC2x9eY7
 AI/IZmjyMxSVf29YDQEHUiW8ziHTgaX0Hdso1XrB1jUZTAOfbUCXG9q+W54U6JBjNuZf
 mNjWILYtIf9AyzjkUjLHLG1V5YXmWand6csjWGuBthN/zlCacatwbH/76Wc+ysQHlsNp
 CHDw==
X-Gm-Message-State: AOAM532I6HRK+G85/DuthgyBAKiRBBMZdK7+x5NVW9w/3Rr/+ry3O97a
 91+old0v1cuUqiPlYA3RWC1XGg==
X-Google-Smtp-Source: ABdhPJxhvy1Fr0y470BQcg3U7zUExK/HTGZMY1TA2Yh1PBJT1AC0z2GSyGYGUWggFbvX+ZwTbRjMWA==
X-Received: by 2002:a63:4543:: with SMTP id u3mr10396963pgk.398.1598458946525; 
 Wed, 26 Aug 2020 09:22:26 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id j12sm2803760pjd.44.2020.08.26.09.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2020 09:22:24 -0700 (PDT)
Date: Wed, 26 Aug 2020 09:22:24 -0700 (PDT)
X-Google-Original-Date: Wed, 26 Aug 2020 09:22:22 PDT (-0700)
Subject: Re: [PATCH 4/6] pwm: sifive: Simplify with dev_err_probe()
In-Reply-To: <20200826144747.9436-4-krzk@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: krzk@kernel.org
Message-ID: <mhng-452a4fec-be33-4b49-a904-edb4b4c81e0c@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200826_122231_296585_D063CAF7 
X-CRM114-Status: GOOD (  19.94  )
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
Cc: heiko@sntech.de, paul@crapouillou.net, thierry.reding@gmail.com,
 linux-riscv@lists.infradead.org, lee.jones@linaro.org, f.fainelli@gmail.com,
 zhang.lyra@gmail.com, krzk@kernel.org, linux-rockchip@lists.infradead.org,
 wens@csie.org, bcm-kernel-feedback-list@broadcom.com,
 u.kleine-koenig@pengutronix.de, orsonzhai@gmail.com, linux-pwm@vger.kernel.org,
 rjui@broadcom.com, mripard@kernel.org, linux-rpi-kernel@lists.infradead.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org,
 sbranden@broadcom.com, linux-kernel@vger.kernel.org, baolin.wang7@gmail.com,
 nsaenzjulienne@suse.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 26 Aug 2020 07:47:45 PDT (-0700), krzk@kernel.org wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  drivers/pwm/pwm-sifive.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
> index 62de0bb85921..2485fbaaead2 100644
> --- a/drivers/pwm/pwm-sifive.c
> +++ b/drivers/pwm/pwm-sifive.c
> @@ -254,11 +254,9 @@ static int pwm_sifive_probe(struct platform_device *pdev)
>  		return PTR_ERR(ddata->regs);
>
>  	ddata->clk = devm_clk_get(dev, NULL);
> -	if (IS_ERR(ddata->clk)) {
> -		if (PTR_ERR(ddata->clk) != -EPROBE_DEFER)
> -			dev_err(dev, "Unable to find controller clock\n");
> -		return PTR_ERR(ddata->clk);
> -	}
> +	if (IS_ERR(ddata->clk))
> +		return dev_err_probe(dev, PTR_ERR(ddata->clk),
> +				     "Unable to find controller clock\n");
>
>  	ret = clk_prepare_enable(ddata->clk);
>  	if (ret) {

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
