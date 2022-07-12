Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB319C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jul 2022 10:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3xv9pCh4fla41JI9phEx54RE0UFk5VpvBPGhjk0eICw=; b=OswqE1U8oedmQT
	FQB3WoRg3yr4UZdi1OxQFW/AZhIyuMFj7/8E4NCAb8c5kLlkH6v16Fk143ExRNW/AUvd/6HLyJ1qt
	5c238hyXJjLcJgZXBUoCgKcnHZI6WSF6lIoZvHwtcC2gC7Bs3qC3ee3SxDpv9DoDsbZpoZh9KxMT+
	9qTabQaTTMIIdshwF4v9Bm3B2eOq+72wDEnCOU97+gjzSTxHc3EsuoVAheGKCYLdrFl1IlQmxrKKL
	iferTWCsta+3gyKePjIlXujVUnnnsgdpP7+4ilqxkmJXyN5Tae6HI4PmjcWWfj2KrPp1Oh+LN9rsI
	iWEweNn3WaIUXuXX2CNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBCmo-009bEW-Bh; Tue, 12 Jul 2022 10:06:34 +0000
Received: from mail-pj1-f42.google.com ([209.85.216.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBCml-009bCt-0k
	for linux-riscv@lists.infradead.org; Tue, 12 Jul 2022 10:06:33 +0000
Received: by mail-pj1-f42.google.com with SMTP id y14-20020a17090a644e00b001ef775f7118so10904460pjm.2
        for <linux-riscv@lists.infradead.org>; Tue, 12 Jul 2022 03:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I/GNme+MtVJkgqzMSsHjFjb6byOWszb8bonzRL3iNS0=;
        b=6RlJOJJLy0mrdDRkpQC96wUixFqiA0rA0Yfe245nfdKP/sr0Z7OhJyegk1WIaKhzBa
         kFtLI/j762YHc6EvyLqvi96CbEzZDM/3BSrKEE682KRStJbCBx8+XGq4ev4kAJ7GT7Zy
         LG73kj7dCc9ShdMBuZnV5glD4/ECq1rqC36/C8H4VWR9VjSoVGcM6aCFcKFZIx4SG+Nm
         fLLbedCE2Q+KISpBRo/nmQ7KGg3QU6O/ouRtbq+MkglH6zh/zAxOO8SzvKDGvzPlhavO
         apa32L0a4jphvVAFV+LiSntljf7fOcVMalmAlUPSAY7RO+dDjocrfJb0bACBqYjL+fk/
         fkww==
X-Gm-Message-State: AJIora9N2TrDu4zEkak/yDW7WwunDNEdEaneQnDe/4KUE4NIq25ZmP8W
	NBAIPQN0ZWf+W/ffnYOdWM/UjtZqCogPW6BXVzY=
X-Google-Smtp-Source: AGRyM1sXl72aEPLr4xAqWhAchej63N/4nkbWw1wGQRhxvxjivf3WMEdGdZSd/0v4llF2oWc11raqubKhdHiP03Rr7XY=
X-Received: by 2002:a17:903:1c8:b0:16c:4e2f:926f with SMTP id
 e8-20020a17090301c800b0016c4e2f926fmr8713764plh.76.1657620388698; Tue, 12 Jul
 2022 03:06:28 -0700 (PDT)
MIME-Version: 1.0
References: <20220711184325.1367393-1-mail@conchuod.ie> <20220711184325.1367393-3-mail@conchuod.ie>
In-Reply-To: <20220711184325.1367393-3-mail@conchuod.ie>
From: Emil Renner Berthing <kernel@esmil.dk>
Date: Tue, 12 Jul 2022 12:06:17 +0200
Message-ID: <CANBLGcw6=EKZhS3t9+1G3_eczoid_jcTRV3=XD6wSwVkFQr_Gw@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] riscv: dts: starfive: add the missing monitor core
To: Conor Dooley <mail@conchuod.ie>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>, 
	Conor Dooley <conor.dooley@microchip.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_030631_084198_1D17925B 
X-CRM114-Status: GOOD (  16.24  )
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

On Mon, 11 Jul 2022 at 20:44, Conor Dooley <mail@conchuod.ie> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The JH7100 has a 32 bit monitor core that is missing from the device
> tree. Add it (and its cpu-map entry) to more accurately reflect the
> actual topology of the SoC.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Thanks!
/Emil
> ---
>  arch/riscv/boot/dts/starfive/jh7100.dtsi | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> index c617a61e26e2..92fce5b66d3d 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> @@ -67,6 +67,23 @@ cpu1_intc: interrupt-controller {
>                         };
>                 };
>
> +               E24: cpu@2 {
> +                       compatible = "sifive,e24", "riscv";
> +                       reg = <2>;
> +                       device_type = "cpu";
> +                       i-cache-block-size = <32>;
> +                       i-cache-sets = <256>;
> +                       i-cache-size = <16384>;
> +                       riscv,isa = "rv32imafc";
> +                       status = "disabled";
> +
> +                       cpu2_intc: interrupt-controller {
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                               #interrupt-cells = <1>;
> +                       };
> +               };
> +
>                 cpu-map {
>                         cluster0 {
>                                 core0 {
> @@ -76,6 +93,10 @@ core0 {
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
