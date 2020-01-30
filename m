Return-Path: <SRS0=BSbV=3T=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55CD1C33C9E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 30 Jan 2020 03:35:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E8B3206D5
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 30 Jan 2020 03:35:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="d5pDzYg2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="VXknZ1hI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E8B3206D5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:Message-ID:In-Reply-To:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mC7RHRuIaocmS+z3l26uFBe8rGA7IEoD8aV2xgLqy5c=; b=d5pDzYg28Od3JCp6hEAP4ykf4
	0uUjkMw1lqGe9tDfPDhP+7A7bo/cFxUv3ki/oKQ5YBL50Cg2j6V5hxRAizkgWOAKWc2ba/akuLSlf
	EdPRtUTo61O/OJVl7KhqfQEJedSFq7FoWw9C3um7hMy/h9+Ms8oql6GKTI47hu26p+VhT17AawJNx
	Q+UZbxF04pbRG95RxzPwEGA0zYP25LhJXHxucZlFaH522+/a75ggxaWJH75QjjXmGsNVltqH/4R0L
	MaTtqyET0x1veLhJvIky9vtS8CskAtLQo5yqFs7s0pu6R/VresbTK66Lr+NzoAoijXWNntn6MW8hn
	Thv1OrHVg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ix0c9-0005Q8-61; Thu, 30 Jan 2020 03:35:33 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ix0c5-0005Pa-7k
 for linux-riscv@lists.infradead.org; Thu, 30 Jan 2020 03:35:31 +0000
Received: by mail-il1-x141.google.com with SMTP id o13so1839629ilg.10
 for <linux-riscv@lists.infradead.org>; Wed, 29 Jan 2020 19:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=mC7RHRuIaocmS+z3l26uFBe8rGA7IEoD8aV2xgLqy5c=;
 b=VXknZ1hIBUxEx/1dLxzQq86Vt/I5g5pz3Ea0JRLL8XjSPk8AMIwX6tTlsPGGaZmSsI
 dVwGNlBa0jXSzMR90M/W8zv3voYjvhC9ATi4xumiZSUP9+fZjZgffWpg/uiYCVkJ34Hx
 0vgPPsQtkbrnfPn8hSrDM3sdyH5kWULQEH5QukQjHZ9phM0M0eKjiUPoSCX8xJQiDt/Q
 6VCdRL2xuYqa0HOt2O7AlHEe+uYT9luGkM7t06gAdbk3sjWeJz9pf3XlzSVeObP9v30t
 ++ubr+zD6/vTxGryuwDmXCZ5iW1JWbquvAgD0TDnxfFdlRQGtJM+CiiOPeIvMEX5xG+X
 rkjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=mC7RHRuIaocmS+z3l26uFBe8rGA7IEoD8aV2xgLqy5c=;
 b=pHudUz865r0ezfAxrPWBxMGbMLV4OlsnPOGlQ1j/iibe60GffUNzSQ9EIjMiMgt6W5
 NBFrnV76nPFACmyp/obhQjPNHwUQb0PC3DX3DZ2xeZ5EldR5IyNsJPuMwkR/H4UwdeKu
 UszBtg7Bi/ih6NqnSWiBf4UOEm8jewp9l9clVYXkZNZlzGZulvN8lCSZub6JhNHMG0dT
 8lPMqyyzr7h8CAzu2IbTxbnRaaDAVYGoKcf+/iKXY+SpAxY3EsYyxFHYcaTQXIWLCrH5
 wu38vBf8kbq21SsmLAsexmL0zP8pRUEi9G+xmhrG2eI71dSQsvux1tnSyY/hjRHlG260
 KP3g==
X-Gm-Message-State: APjAAAUJnI08GQ9f/5h1y8UgXw4cQwMnz/ZqmMXKfOyapxREwhJytFAq
 Hma34mXoYayB7ifMelL4xNpusA==
X-Google-Smtp-Source: APXvYqy8dSxmhoNpOD7317q+NXC3zlo/U+JsNSzJlrEoYOjQ3EzKKlWi3waDbRail60K66MLEn+W3g==
X-Received: by 2002:a92:4891:: with SMTP id j17mr2398379ilg.33.1580355327714; 
 Wed, 29 Jan 2020 19:35:27 -0800 (PST)
Received: from localhost (67-0-69-232.albq.qwest.net. [67.0.69.232])
 by smtp.gmail.com with ESMTPSA id l3sm1389627ilq.56.2020.01.29.19.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jan 2020 19:35:27 -0800 (PST)
Date: Wed, 29 Jan 2020 19:35:20 -0800 (PST)
From: Paul Walmsley <paul.walmsley@sifive.com>
X-X-Sender: paulw@viisi.sifive.com
To: JaeJoon Jung <rgbi3307@gmail.com>
Subject: Re: [PATCH] riscv: Add gpio and pwmleds to
 DTS(/arch/riscv/boot/dts/sifive/)
In-Reply-To: <CAHOvCC5aEc=p_6Yxkyr8n9BXZug_-NA_CJswu8vtkM8aOBhWvg@mail.gmail.com>
Message-ID: <alpine.DEB.2.21.9999.2001291930040.1008396@viisi.sifive.com>
References: <CAHOvCC5aEc=p_6Yxkyr8n9BXZug_-NA_CJswu8vtkM8aOBhWvg@mail.gmail.com>
User-Agent: Alpine 2.21.9999 (DEB 301 2018-08-15)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200129_193529_290995_17BE721E 
X-CRM114-Status: GOOD (  11.69  )
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
Cc: linux-riscv@lists.infradead.org, Anup Patel <Anup.Patel@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 21 Jan 2020, JaeJoon Jung wrote:

> I added below DTS to act gpio and pwmleds for SiFive FU540 Unleashed board.
> 
> diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> index a2e3d54e830c..b03bf570020c 100644
> --- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> +++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> 
> +                gpio0: gpio@10060000 {
> +                        compatible = "sifive,fu540-c000-gpio", "sifive,gpio0";
> +                        reg = <0x0 0x10060000 0x0 0x1000>;
> +                        reg-names = "control";
> +                        gpio-controller;
> +                        #gpio-cells = <2>;
> +                        ngpios = <16>;
> +                        interrupt-controller;
> +                        #interrupt-cells = <2>;
> +                        interrupt-parent = <&plic0>;
> +                        interrupts = <15 16 17 18 19 20 21 22 23 24
> 25 26 27 28 29 30>;
> +                        status = "disabled";
> +                };

Yash posted this a while ago:

https://lore.kernel.org/linux-riscv/mhng-cb360722-bdb6-4cf7-9fa7-1d92f6b6bbfa@palmerdabbelt-glaptop1/T/#madb19f55bac11a9a675b1ca73ca3f0c2d88c57cf


> 
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> index 88cfcb96bf23..f3f55dbbf737 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> 
>         cpus {
> @@ -41,6 +41,39 @@
>                 clock-frequency = <RTCCLK_FREQ>;
>                 clock-output-names = "rtcclk";
>         };
> +
> +
> +        pwmleds {
> +                compatible = "pwm-leds";
> +                heartbeat {
> +                        label = "led1";
> +                        max-brightness = <255>;
> +                        active-low = <1>;
> +                        pwms = <&pwm0 0 7812500 0>;
> +                        linux,default-trigger = "heartbeat";
> +                };
> +                mtd {
> +                        label = "led2";
> +                        max-brightness = <255>;
> +                        active-low = <1>;
> +                        pwms = <&pwm0 1 7812500 0>;
> +                        linux,default-trigger = "mtd";
> +                };
> +                netdev {
> +                        label = "led3";
> +                        max-brightness = <255>;
> +                        active-low = <1>;
> +                        pwms = <&pwm0 2 7812500 0>;
> +                        linux,default-trigger = "netdev";
> +                };
> +                panic {
> +                        label = "led4";
> +                        max-brightness = <255>;
> +                        active-low = <1>;
> +                        pwms = <&pwm0 3 7812500 0>;
> +                        linux,default-trigger = "panic";
> +                };
> +        };
>  };

I don't think it's good to add these pwmleds to the default board DTS 
file.  I realize that many upstream ARM development boards have added this 
type of configuration, but it gets in the way of reusing this DT file when 
integrators wish to have the LEDs used for different purposes.  If the 
Unleashed silkscreen had text on it describing the LEDs as having these 
specific functions, or if Unleashed was sold in a case with similar 
markings on the outside, it'd be a different story, and then a change like 
the above could make sense.


- Paul

