Return-Path: <SRS0=EtLq=FE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A345CC5519F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 07:06:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D43F3206CA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 07:06:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d3qgKqid";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s+h/HEPm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D43F3206CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mZlLMJOUd5IVNe0Lh7FlnVIfLxLWfK30bhcFUJcRarI=; b=d3qgKqidd8k1x2lYyMCasQhRA
	NCWeLKV5qo8Ns4+HC9FbaRAGYwL9w0oTJnQ/n2dzmwacOlA+Job18YwCy+IIw/ahLqbquuwtcjAbp
	bgEsRc2sdfv4TYyJL2x8gr73SkG7KzSB2/JIu7HQfe+QY2OthggMBV5xv6TRzEn4X5pxJQEssogB9
	MJvL6qkhZ9ERreQ9AJ2Jei4/xZzhJSfM4rMiq3tZ3ST30cUYeN5RG9MXfa44hnnF2vk1AUNS2x9Kh
	XF/nF215ME8x7cqufQYFI2v6gQaygYZwS/Ijw6CUjyyg3HN2lb6aj4FEXShdKKlxNXWNmTZWWXSlz
	3ET+6w1DQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjdG8-0002Fd-O9; Mon, 30 Nov 2020 07:06:04 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjdG6-0002FH-Hf
 for linux-riscv@lists.infradead.org; Mon, 30 Nov 2020 07:06:03 +0000
Received: by mail-lj1-x244.google.com with SMTP id y10so16087664ljc.7
 for <linux-riscv@lists.infradead.org>; Sun, 29 Nov 2020 23:06:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hX8EE+fwO5ncx9Wyn/IKPP6lbbN9olmyACQVP9w9+R0=;
 b=s+h/HEPmytv0YUAEP3/Cy13IYOaF1KIZtNH6Ki8/tE8sP+e25LlfzODnHGUFL16StG
 F//Gszt3/iDe9XF9J47yITjkblQ0UzqnpSlsoXFBcTYXswrx0UztesAcsKdQkyCP1Ury
 hy1gvmwg0fXt6WnyFo56ohVePIa0f5Yig+j/PBHoboFoTDMEFaXpInoDjaYQgJX7fsb5
 IdrSu5nAl9ktXv/XmoTa1a/G0EnE8ZB5klJG2wUtQnrUfs7aWcM34Nya85CQVBr2699s
 xjvu7zIOhzPWOixvX1T0WfWAT3IZf/nULSsH1XXoXuJ/2YBJ2Oo+WZJ2+CVgHk977Ooy
 wGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hX8EE+fwO5ncx9Wyn/IKPP6lbbN9olmyACQVP9w9+R0=;
 b=iNk74h50KJNbipbMONtTC+87dbM5aDtEwqgAO0njH1vNACTqFEppcZmLHN04zfRpf9
 rNj6/Gn0ct/l4pcbJ2UPoY9pOPGkyTFYE8xdXHQB0t7kHVc2r7y9L9Aw577RvaTClGFa
 39XXiO4iptOP54sZRdGUGl+MURs03oLbbwNO+MnT83aLOT4n4U+xwzJqCPJzU+WeEdqL
 EBCFRLUvD9B1c7t+AIPuCRLa4VirHleKuRMGYa/hgP95pShCKTBs/1pZNEX/BHFd88iB
 tO1Kn9ust49sY/ygSkwdffAoZdq/i/tUP18CSSKjyW7tqJVjxoLTR/N0Bamwbq7/ZY87
 qcBQ==
X-Gm-Message-State: AOAM532xr/mVYEMB6gM7ucmZaMg7sqvbNzw72c7DMRozthbz0o/F6Fy3
 U9/0ibuqaFbZIvXkXTXNp+M=
X-Google-Smtp-Source: ABdhPJwpmXB7o6Z4Ym5ypk3Mi8OCrf36Yx1xJuvgQg5txlW8MdH0WNEcyzBKd6e+8bYzGZt/BsfrlA==
X-Received: by 2002:a2e:9dcd:: with SMTP id x13mr9104253ljj.147.1606719959798; 
 Sun, 29 Nov 2020 23:05:59 -0800 (PST)
Received: from mobilestation ([95.79.141.114])
 by smtp.gmail.com with ESMTPSA id t6sm2232606lfc.231.2020.11.29.23.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Nov 2020 23:05:58 -0800 (PST)
Date: Mon, 30 Nov 2020 10:05:56 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Damien Le Moal <Damien.LeMoal@wdc.com>
Subject: Re: [PATCH 20/32] riscv: Add Kendryte K210 FPIOA pinctrl driver
Message-ID: <20201130070556.pyxv4opwtimojmyw@mobilestation>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-21-damien.lemoal@wdc.com>
 <CACRpkdZhOxz5NhrkFxZ5G4aOrmBoAcQodOvqzNROQtXpHVQGDQ@mail.gmail.com>
 <CH2PR04MB65228DE061918A4D2A08A0CFE7FB0@CH2PR04MB6522.namprd04.prod.outlook.com>
 <CACRpkdbA_JMiyraKC_3WT26mMUxfuLD=Q_HREmbEB=yNPpuHjw@mail.gmail.com>
 <b92c455b1db0f1b4a82d8cea0fbdebb47609bf42.camel@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b92c455b1db0f1b4a82d8cea0fbdebb47609bf42.camel@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_020602_620717_BE5763AD 
X-CRM114-Status: GOOD (  17.00  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "sboyd@kernel.org" <sboyd@kernel.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "seanga2@gmail.com" <seanga2@gmail.com>,
 "frowand.list@gmail.com" <frowand.list@gmail.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Damien,
Just a tiny nitpick below.

On Mon, Nov 30, 2020 at 03:13:45AM +0000, Damien Le Moal wrote:
> [...]
> 
> diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
> index 2a9046c0fb16..4a801e83919b 100644
> --- a/drivers/gpio/gpio-dwapb.c
> +++ b/drivers/gpio/gpio-dwapb.c
> @@ -617,8 +617,10 @@ static int dwapb_get_reset(struct dwapb_gpio *gpio)
>  
>         gpio->rst = devm_reset_control_get_optional_shared(gpio->dev, NULL);

>         if (IS_ERR(gpio->rst)) {
> -               dev_err(gpio->dev, "Cannot get reset descriptor\n");
> -               return PTR_ERR(gpio->rst);
> +               err = PTR_ERR(gpio->rst);
> +               if (err != -EPROBE_DEFER)
> +                       dev_err(gpio->dev, "Cannot get reset descriptor\n");
> +               return err;
>         }

There is a dedicated method to generically handle the PROBE_DEFER
error returned by functions like get(resource): dev_err_probe().
So here you'd just need to do:

-	if (IS_ERR(gpio->rst)) {
-		dev_err(gpio->dev, "Cannot get reset descriptor\n");
-		return PTR_ERR(gpio->rst);
-	}
+	if (IS_ERR(gpio->rst))
+		return dev_err_probe(gpio->dev, PTR_ERR(gpio->rst),
+				     "Cannot get reset descriptor\n");

-Sergey

> 
> and all drivers can now use builtin_platform_driver() declaration with a clean
> boot log. If you are OK with the above patch, I will send it.
> 
> Thanks !
> 
> > 
> > Yours,
> > Linus Walleij
> 
> -- 
> Damien Le Moal
> Western Digital

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
