Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDB6C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jul 2022 08:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V7fzeh8kERuKiKbR6dZVOSImT+AXcshTEpIAcHzPQJE=; b=ZJmXWeONco4FG7
	krkY7YFBP6PvC82EW6hYQfzvzyDd1nrV7aliOK+gxEi2mhl8UIYld/S+orGR0O+OxG7+yv9sgt/E2
	xB8QryeHvOLbJ19f9ESLKqrs0d+l9sDmqTSt4PhbofcfMoGU7w7HekQ5sadQKcF8dOEfGx3P+LlgZ
	oZG+JuWqvnfMXs6ab7UAVyfjwsKatczZUWSPVN7BHBPv4ARBitC5+CoPDkpKIbZUlPH+CPOwc/Y/U
	cauKp4VIy5G5ffrkljqH9YRbZfTV8NTRAvDauPPuXtShU/821pnsyBU1zIkaMc02oti/LxYZ2484f
	LpKaIyajNfcDTs2LRKNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAp8y-00HMD0-Bf; Mon, 11 Jul 2022 08:51:52 +0000
Received: from mail-pj1-f50.google.com ([209.85.216.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAp8u-00HM8l-B2
	for linux-riscv@lists.infradead.org; Mon, 11 Jul 2022 08:51:50 +0000
Received: by mail-pj1-f50.google.com with SMTP id j1-20020a17090aeb0100b001ef777a7befso5477112pjz.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 Jul 2022 01:51:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=don8IeOf6QO13LaCWv6B2IeNG0FfWWLh7899VgiQ65E=;
        b=PGSW3YQaxqaBLoB777TedGyvJKn5CwdUaPcBzmilQb3UoaGpDGGmfUr9GhtLDBLdtI
         rYNchGsQKHM/nL9LJtiPSd5r1XQDZJdq/1UEmhvcnCLj7B+D5YADX9Aljqzx2dMO3AvU
         qro7HNBrkPebqkmcWf6DoOdHQxmts7zkqE79O3ZZ0dyZtzJhEfW3dKl8LYgOoygYrjwZ
         P7c0ZsFjQzbRO4T1smwUe5RGC+vQM7t2K9AGlBdqCfiqYMfWkntW28cI8fCx2waivQ03
         zWBjRpQp87kGBm6GInr/n/0amKsHztPtwIo9LNT+cu6S18cRWGweH4oZJDQFJAw2pjnI
         IeiQ==
X-Gm-Message-State: AJIora8pKMwVOijiZ1yd7CNmKMIqDhDp9089M4zN4QAMq7BHD1uUeMxX
	ysPVWo2h/tP36j7c1DHYqLJLwgvkA3yZM5LQy9I=
X-Google-Smtp-Source: AGRyM1vq6+3cqEg8uWKFwqKmik0/nu/rNP37p3/sFW4TUB51ChRK5wFxvWxe+KyvMvy3ve/TDKjJLNLXgpZZ+earcDs=
X-Received: by 2002:a17:903:1c8:b0:16c:4e2f:926f with SMTP id
 e8-20020a17090301c800b0016c4e2f926fmr3190213plh.76.1657529504882; Mon, 11 Jul
 2022 01:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220710111330.3920699-1-mail@conchuod.ie> <20220710111330.3920699-3-mail@conchuod.ie>
In-Reply-To: <20220710111330.3920699-3-mail@conchuod.ie>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Mon, 11 Jul 2022 10:51:33 +0200
Message-ID: <CANBLGcyK9wjdgVm-pXzUDU5JNzatAjjf1Y28+dG_C7WPwqrwGQ@mail.gmail.com>
Subject: Re: [RFC 2/2] riscv: dts: starfive: add the missing monitor core
To: Conor Dooley <mail@conchuod.ie>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_015148_426589_AE8EF3F5 
X-CRM114-Status: GOOD (  15.05  )
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

On Sun, 10 Jul 2022 at 13:13, Conor Dooley <mail@conchuod.ie> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The JH7100 has a 32 bit monitor core that is missing from the device
> tree. Add it (and its cpu-map entry) to more accurately reflect the
> actual topology of the SoC.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7100.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> index c617a61e26e2..840875fcb633 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> @@ -67,6 +67,22 @@ cpu1_intc: interrupt-controller {
>                         };
>                 };
>
> +               E24: cpu@2 {
> +                       compatible = "sifive,e24", "riscv";
> +                       device_type = "cpu";
> +                       i-cache-block-size = <32>;
> +                       i-cache-sets = <256>;
> +                       i-cache-size = <16384>;
> +                       reg = <0x2>;
> +                       riscv,isa = "rv32imafc";
> +                       status = "disabled";
> +                       cpu2_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };

Maybe you could make this look a bit more like the nodes above, so

compatible
reg
<the rest sorted>
<blank line>
cpu2_intc: interrupt-controller {
    <entries sorted like the other interrupt controllers>
}

/Emil

>                 cpu-map {
>                         cluster0 {
>                                 core0 {
> @@ -76,6 +92,10 @@ core0 {
>                                 core1 {
>                                         cpu = <&U74_1>;
>                                 };
> +
> +                               core2 {
> +                                       cpu = <&E24>;
> +                               };
>                         };
>                 };
>         };
> --
> 2.37.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
