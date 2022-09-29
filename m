Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B24C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Sep 2022 14:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cONZHBsO/Mlw7yDx+5weF69jZJHDebzx/zpaUqJT7fE=; b=zAFM3bvKitbRjm
	2e02VyrotNHpauVobbQLiWSI1374gW3P/04KxVxptK5SOKD44xWQwaAH84tpowRPOaIjThrkxljat
	G+DmbihlCg3FFsY/Leb7xiRvELrWgiCxo7PDuKpZ+RGNp00nX6GmifH9X3iPNSLGv4Fiel1xxyS7h
	CgoqVlSDweN3Y70nhae8DoWi8omE/9wnp0NizgZPdw/NB72oWCj7K8UMOhrVjEEmEqWYazm/kmNxq
	y6bo96oP3YxWmoxHXk3m/UCipU5giTMUGQveBQV6VDWZQ61NT6bXBoL7zkvkY5JOj7GVfYO9vX4fD
	64aK+45idhE8aAtqb01w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odun9-003enI-Q1; Thu, 29 Sep 2022 14:45:35 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odun6-003ejc-Nv
	for linux-riscv@lists.infradead.org; Thu, 29 Sep 2022 14:45:34 +0000
Received: by mail-lf1-x135.google.com with SMTP id bu25so2603201lfb.3
        for <linux-riscv@lists.infradead.org>; Thu, 29 Sep 2022 07:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=qzBDhl7t1REqzvir5ZdPbV96Uq1Uf8HIWsulX9tDLco=;
        b=UE2OLueI9yxUnBykbJzpgEuis+WsG9HBCzYKdl7C4VHvvupku4ndsX3EytfCrNbNRo
         WquUzKkuz2U/dFsQUlAodrirE42L7NPf6qa92U+V8TO9o4PverBizzi8iX1+3POTxt1R
         ANI+tlbFXLD1gG9sNrARaoRZm4+m04SxRiDAey7sLbBG4tg/rleq/PJl3kQo6uOkOFrv
         eaR+MJQQLYesrFvmelBq9OuWYn38PfkuArN98goynhBlWaOxblhDXyeY0Aamv2voLvUb
         A2lmgNWpLxIino1vSaQT8P/v6u/UhfZXDnjrBLKjML2kbwY1TBTm2J/nouhZshh6jmFM
         jEBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=qzBDhl7t1REqzvir5ZdPbV96Uq1Uf8HIWsulX9tDLco=;
        b=1jMrODhjq56M90aqjRZrnHD2Ui3JKfYFIMkbP7tUytMTnqR3HglOvHGtaWp3PAg/dx
         0W9++/vkc7ePbuI7z8ogGU8FGxUIXVA8bcmQ/6pS3dnvBlv2fpZdSsx83QIrwtfTJzfw
         H0ri+8cMM1DzbfbWFsd/IhLU9aWsia4TrbsvzfSxCD/2NdBM/zacWpyN/3r/KvbN1Leq
         HXB/efaAhiuu6jd7n7Mi3PytDq5tm1zHIQkp6Pcgd9XTkky3FrQzZoWCtxx7yor6Rsx4
         qF/jcHZKEgkw3uxPxeujNovKTv32yIjF14oA8QzWcPcSoqw5oYTlT0IvyTFV9LsKbUzf
         g/ww==
X-Gm-Message-State: ACrzQf3dI/XNkSiotbXQrvvF/ggpJqS/L6VYxBSDn9gTJaRXY4/t7QC0
	dNj6Dw7YwLiyU50lPRlzYwErmA==
X-Google-Smtp-Source: AMsMyM4KXJ2MlU8uJdcg/31skmTZciBaJAm9dGDzpXsimxBLfYQrpN6veJNIvTuoeeINPpRin+aQ/w==
X-Received: by 2002:a05:6512:31d5:b0:498:f3dc:dd2 with SMTP id j21-20020a05651231d500b00498f3dc0dd2mr1451559lfe.101.1664462728238;
        Thu, 29 Sep 2022 07:45:28 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id u11-20020ac243cb000000b00497ad8e6d07sm801754lfl.222.2022.09.29.07.45.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 07:45:27 -0700 (PDT)
Message-ID: <4ddabe3a-9f55-2a6a-c1c1-ccc3fc74e98a@linaro.org>
Date: Thu, 29 Sep 2022 16:45:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v1 00/30] Basic StarFive JH7110 RISC-V SoC support
Content-Language: en-US
To: Hal Feng <hal.feng@linux.starfivetech.com>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_074532_838709_F37CD241 
X-CRM114-Status: GOOD (  10.31  )
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

On 29/09/2022 16:31, Hal Feng wrote:

> This series is also available at 
> https://github.com/hal-feng/linux/commits/visionfive2-minimal
> 
> [1] https://www.cnx-software.com/2022/08/23/starfive-visionfive-2-quad-core-risc-v-sbc-linux/
> [2] https://wiki.rvspace.org/
> 
> Emil Renner Berthing (17):
>   dt-bindings: riscv: Add StarFive JH7110 bindings
>   dt-bindings: timer: Add StarFive JH7110 clint
>   dt-bindings: interrupt-controller: Add StarFive JH7110 plic
>   dt-bindings: sifive-l2-cache: Support StarFive JH71x0 SoCs
>   soc: sifive: l2 cache: Convert to platform driver
>   soc: sifive: l2 cache: Add StarFive JH71x0 support
>   reset: starfive: jh7100: Use 32bit I/O on 32bit registers
>   dt-bindings: reset: Add StarFive JH7110 reset definitions
>   clk: starfive: Factor out common clock driver code
>   dt-bindings: clock: Add StarFive JH7110 system clock definitions
>   dt-bindings: clock: Add starfive,jh7110-clkgen-sys bindings
>   clk: starfive: Add StarFive JH7110 system clock driver
>   dt-bindings: clock: Add StarFive JH7110 always-on definitions
>   dt-bindings: clock: Add starfive,jh7110-clkgen-aon bindings
>   clk: starfive: Add StarFive JH7110 always-on clock driver
>   RISC-V: Add initial StarFive JH7110 device tree
>   RISC-V: Add StarFive JH7110 VisionFive2 board device tree

Where is the rest of patches? Lists got only 5 of them. Anyway this is a
bit too big patchset. Split per subsystem.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
