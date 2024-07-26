Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A49CC3DA49
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 12:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LeTKibZkx18oO/n/HG/Zzu2VwpMrAqlZ5CHU6Bv5Sdc=; b=PxW7fpNj4IaqvoT/W0B2qJjo8S
	mJUdOFZHIZsCsMh1X8qYpYP08tL9w1fieMsVKaYjfgrosPDDUpxW1m/RKXpgXm/M36TWrVA1GTYoL
	tYjaLWYN9V46yko4Bek50vvsBSakD+G+yKK5GkmqVlpmgkc0QP1DVPXodU4aDn4oYGZRNsJ1oGX7t
	Qx4n/KHnL4EOAUBOVMIH1pUYe6TWVQM858PvtKJjiYe7hR7SwgNtFPx6LkXolGUr1FuwQFsti4dLI
	8EfQep+yykeueIKoYHPx3xeQF2s2K9Nqdigsf3C0xF/1LMmI8dDHcMbx/Y24+/qFV1VBAJt5r6XSn
	I4AkgQWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXK4y-00000003qpa-2nf5;
	Fri, 26 Jul 2024 12:29:48 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXK4u-00000003qog-2jDp
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 12:29:46 +0000
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5D38E3F4B8
	for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 12:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1721996981;
	bh=9LmZmw6NCs8eTK1rP6m6Jdcuf3clCtsx7hFAo9ghIiY=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=b8jpo+AntFyVkPdK3i0bWPGc6Cc99tnRets83/As9EQO2hY07wNiJCiXhcu+4Lp9f
	 M0vZaVeUJnLfIdsjSnUb0coKcgjZBIbeEMebFaDUFjtoiVULzt82dpdYJrsRlTI7HI
	 pY/5k5h5bc6Y3YV59dTwsD5h1vnf+FXjVSfobTNctkJGBYXD7lY1cFo6vzoMjVWav7
	 FrAnCDHuaAkfL+Ctr1feQRr+7xmsZH3nqej1m+N3kDxhMKB+csfG9fPNkjwwOWFJ4z
	 6af2FhXZrOHDcbQM6RDYznZk52xGKZammWc07gZ1tOON1EUrqqubTM472Hpv9tXnKc
	 ym+M13WK+BRLw==
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7a1d690cef9so113372085a.0
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 05:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721996980; x=1722601780;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9LmZmw6NCs8eTK1rP6m6Jdcuf3clCtsx7hFAo9ghIiY=;
        b=KwlKuH+Ssms9fdoAvO6Wq0PFbgoR7iUSgmjfgXXJLkWd9MWMVys0LjVsAoIv8OSfKX
         4Aw7MPqBQ6hAYNhTh1qrtGe3Fse5tcowNUbKXu6zQWqcyHSQLVb3TUHWX7FFBncGYjV+
         SgWwGM+e20Ov6U0mKY1DV2Lq+jnRhguSbhEoDHvq+Hvo90BqQ76g3txZ6y+BFtrc7t/u
         5n0qYqY4f7E32S1hGqzTa+ii906gZnmVYDS+6MnCfQigup5lPEso6bHSrjn73e4QBlyG
         kOsaryiJ3JP6+aJGcek1VYgIEPDWpCa7AuLt50yzHOGDLKdZl9Dg3O80F8W3BMZX5uZ0
         or+w==
X-Forwarded-Encrypted: i=1; AJvYcCVBwfTZ5u8g5ptf5oY1wfi3MSbYyuYtOxrZ3ID1dxNAotYqsTVvRjfJvutnaUTMkR8FgrStEDmQrqcCqhHMj1fEWMtz6qF0EdNMJpRAA5vx
X-Gm-Message-State: AOJu0YwqFZNq+RQNTWnhFOQDNTo/KsrWDbIdR6iROjpkojbgvQAxwwD5
	ZxvABR+1Xo8H7td5OXyaTuSa1HHgOcQEpC8kt7NMePuFGJskMRx0eSku5VG5G7U77TwjwC0/Ji6
	UeADqfRqZWtfTq6SYXZdJM7LrkPpoeheS5QB42o5R9MUfO9lJ5xIMqlUpNkkdglYnTqpCtimoXC
	LIam8txTVZq4zMXY5qgaqexFDRz7ccryLn+STeDcY9bt1Wwwrn1g3qowB8
X-Received: by 2002:a05:620a:4484:b0:7a1:df6f:3632 with SMTP id af79cd13be357-7a1df6f4c34mr312156985a.32.1721996980418;
        Fri, 26 Jul 2024 05:29:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGV1mtLr9ByO8GYPcPzKfiGrDWu4OQDQV5IWb3V25ZQO93w1m0w8xqeuro6Hm7vzdR2YevzoHOr3qHn42Z+DA0=
X-Received: by 2002:a05:620a:4484:b0:7a1:df6f:3632 with SMTP id
 af79cd13be357-7a1df6f4c34mr312153485a.32.1721996980036; Fri, 26 Jul 2024
 05:29:40 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 26 Jul 2024 08:29:39 -0400
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240716-majesty-antler-d9bedc7fd0af@wendy>
References: <20240716-majesty-antler-d9bedc7fd0af@wendy>
Mime-Version: 1.0
Date: Fri, 26 Jul 2024 08:29:39 -0400
Message-ID: <CAJM55Z9FAH-uiNmXDELM0gkYjHue+g8JQgOryxOCv4OXJ9f5EA@mail.gmail.com>
Subject: Re: [PATCH v1] riscv: dts: starfive: remove non-existant spi device
 from jh7110-common.dtsi
To: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org
Cc: conor@kernel.org, Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_052945_100211_FECD8CB4 
X-CRM114-Status: GOOD (  19.33  )
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

Conor Dooley wrote:
> There is no rohm,dh2228fv on any of supported JH7110 boards - in fact
> the dh2228fv almost certainly does not exist as it is not a valid Rohm
> part number. Likely a typo by Maxime when adding the device originally,
> and should have been bh2228fv, but these boards do not have a bh2228fv
> either! Remove it from jh7110-common.dtsi - pretending to have a device
> so that the spidev driver will be bound by Linux is not acceptable.

Hi Conor,

This patch is correct, but as you mention the fake device was most likely added
in order to use spidev from userspace with random devices added on the exposed
pins. In case someone actually makes use of this wouldn't this be a regression?
What is the right way to support this?

/Emil

>
> Fixes: 74fb20c8f05d ("riscv: dts: starfive: Add spi node and pins configuration")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Emil Renner Berthing <kernel@esmil.dk>
> CC: Conor Dooley <conor@kernel.org>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: Albert Ou <aou@eecs.berkeley.edu>
> CC: William Qiu <william.qiu@starfivetech.com>
> CC: linux-riscv@lists.infradead.org
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index 8ff6ea64f048..395436ec0f97 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -346,12 +346,6 @@ &spi0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&spi0_pins>;
>  	status = "okay";
> -
> -	spi_dev0: spi@0 {
> -		compatible = "rohm,dh2228fv";
> -		reg = <0>;
> -		spi-max-frequency = <10000000>;
> -	};
>  };
>
>  &sysgpio {
> --
> 2.43.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
