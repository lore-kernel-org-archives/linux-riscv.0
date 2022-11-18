Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4360C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 18:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iEImwUsH7NkBDOA10WXN2Bu02VT2RD9r1pmNWDGvjbM=; b=HxZbNEo07U5kyx
	YHqQUu4Ufz+MXHNXW58TlLYArDhezpj1sfu1vyvzG7pbnlU5TuVHlDWtmy/SmFMN9YzH6wvx4KaC2
	6vfV0vBbG0Fnc0h35KgGtzK5r0XkKNfNWV0CibIK3QQ20TLGBDZhzkV6+FuUsqxxEss0jJQFbznfE
	kG6PDfOFShU2lRZDXU1JvUhWOwCjVwPhEhj3K9wSPljxuVxDWUwDENOmju782DdQgBebDlLhD2Ebj
	SMKLIK6snY0IrJUl66v6kI/zQXbvfRZaSz4o7k5d3c4EDKat2QcQgfEti7UUEKs8yRDgrJ7fp3Zn+
	mG2rG2WD6wQFlq8OnONg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow6E8-0077s8-VE; Fri, 18 Nov 2022 18:36:36 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow6E6-0077Hw-EH
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 18:36:36 +0000
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A358A3F1C3
	for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 18:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1668796590;
	bh=6VxHStuRLDpPBr5lVOouI+tg17w8c3EutmridvLwKhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=W3Sud56OF5hQO/uDBWwqNR7cfyhhN6W66+WgT/8w9pHvuolRZ271yRm1DRhWw1fzI
	 hYiYMK/GX5lEOFMXDyAWzI/Wy+tp1R1c7bp1yrbIy3l15nCg7HgshMPWihqYMgb+ul
	 yBV7I6BSld8GfGmQjZNjOiNOABPnfs86lLRyQkDymY80KPH7RLQwpxqDvFFicSc9Um
	 IWy388BPB6dMGS12+TFUHeWAn2w0rzwIo07IP8joxPSFw09FgWnlq7QsF56xgAq6ws
	 0cIbqwv+eauRqKGDsBDGUNSPF0Sl4W4v90IETHEal1rul5hVEXXLJcieP2LyMAyRLj
	 Kc0xQ54wjsWMQ==
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-39967085ae9so2854527b3.11
        for <linux-riscv@lists.infradead.org>; Fri, 18 Nov 2022 10:36:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6VxHStuRLDpPBr5lVOouI+tg17w8c3EutmridvLwKhQ=;
        b=amUCeAVHLg+LK1AaHdXzvJvasUEcgXhwLM9IVgKymUGyHIahu44yCLKuZCZXOCSxpu
         txUcCYNuxhSOlpwLy0ssvK0044WbbuV7TrmKDn9npjrehVlAMwg8RItR6sUJkkusApfC
         0yrsVsrY1+zR4ac/OcY7Ey0D5rvz83HrkIN1d12G0c5YVaCNbwk2NDnqTXN4IZ6POrbW
         eBzKmNgkzuAo+n8P8SUcZaxaFYhi3wZBZR7vPypTMfadii6bcfR15BQlKHBBaPBl9qec
         UfXsMPUd5lmlD+MSQ0opdbYRyZVvF4dpdyA/Sf09j2vM4pF955L4D6frw7C3XxaXu5Zs
         pshg==
X-Gm-Message-State: ANoB5pnuEnxabepq8fmQyQEdGPfr3KuHyBYkUUwcdOmVzfZuy/kfcClj
	1Kgnp3g7OP3j/kjxH5U8c8h/GSJ65ZpHKYMMVUD85kitRgom7wWhhzL/9DA2W0TbNR9W27IePsd
	f+SA1k7H3GiF1JOGr6/PpGHFFfVXlvpO9gRkdDR8l9vRj++sbPZcSOs5tEVwyBw==
X-Received: by 2002:a25:84cc:0:b0:6e6:b5f0:3ae0 with SMTP id x12-20020a2584cc000000b006e6b5f03ae0mr7925729ybm.439.1668796587881;
        Fri, 18 Nov 2022 10:36:27 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5AiJeG5bIDPDjlRtwy/G+Yx3JIXOe1PHL7qEJarm5y87m06pZNBGulWELgbXrdeg6aHO/0uOTWrX9x1+Xs82o=
X-Received: by 2002:a25:84cc:0:b0:6e6:b5f0:3ae0 with SMTP id
 x12-20020a2584cc000000b006e6b5f03ae0mr7925710ybm.439.1668796587659; Fri, 18
 Nov 2022 10:36:27 -0800 (PST)
MIME-Version: 1.0
References: <20221118133216.17037-1-walker.chen@starfivetech.com> <20221118133216.17037-5-walker.chen@starfivetech.com>
In-Reply-To: <20221118133216.17037-5-walker.chen@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Fri, 18 Nov 2022 19:36:11 +0100
Message-ID: <CAJM55Z9bJqpEGbbx1=EBXhmhigxuHw=ObBdTJ7xy+QY=pTJyoQ@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] riscv: dts: starfive: add power controller node
To: Walker Chen <walker.chen@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_103634_641364_A478D2A3 
X-CRM114-Status: GOOD (  17.68  )
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

On Fri, 18 Nov 2022 at 14:35, Walker Chen <walker.chen@starfivetech.com> wrote:
>
> This adds the power controller node for the Starfive JH7110 SoC.
> The pmu needs to be used by other modules such as ISP, VPU, etc.
>
> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>

Hi Walker,

You called the driver jh71xx which suggests it also applies to the
jh7100. Are you missing a node in the jh7100 device tree?

> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index c22e8f1d2640..fa7b60b82d71 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -356,6 +356,13 @@
>                         #gpio-cells = <2>;
>                 };
>
> +               pwrc: power-controller@17030000 {
> +                       compatible = "starfive,jh7110-pmu";
> +                       reg = <0x0 0x17030000 0x0 0x10000>;
> +                       interrupts = <111>;
> +                       #power-domain-cells = <1>;
> +               };
> +
>                 uart0: serial@10000000 {
>                         compatible = "snps,dw-apb-uart";
>                         reg = <0x0 0x10000000 0x0 0x10000>;
> --
> 2.17.1
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
