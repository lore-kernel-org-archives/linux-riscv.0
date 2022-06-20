Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332C2C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jun 2022 08:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CAk/QSDakSf8TtbQ7Qiv+JOYTafIubxMnys6GWXrku0=; b=2MyEVcgZXfcJGF
	QfTMYT/Da4R2BFI9/h7Dn5YcYOuXIgAJICGJGJrojZrVYoecrRdugqfzJKWbVNQACb8PoCErEYfOT
	bGqeznykGoU3F785aET5QlSt3mAQvvfDHMfsF5hv4xsOozuLbcEkXvCK2s/Tbzaj6qXndNn49pxHT
	O/oF34HFlIx/HkCpBYPjlhsMB9mcHIxyBilpveS5je0OK08C1M3GqI0+o7ja7lESLqQSqJO1NZ0+y
	Iuk0Y2hSDwSsLPvQCyxs5IoNNM2kxO+zJXEVrdz29bapqKEF4/CVWfBTrgRgqw80RjeJJS73kCOwN
	EsfDi/X3n+AkiIqWhzow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3CMk-00GpCw-5U; Mon, 20 Jun 2022 08:02:34 +0000
Received: from mail-qv1-f51.google.com ([209.85.219.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3CMh-00GpAe-53
	for linux-riscv@lists.infradead.org; Mon, 20 Jun 2022 08:02:32 +0000
Received: by mail-qv1-f51.google.com with SMTP id q4so2796853qvq.8
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jun 2022 01:02:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U6iOgcYMqJ9zOwx1P0bKGX4G545U6AIxu9kHxZeyUd0=;
        b=JMTPdyntaM5GndccwRyEeHSEdrSQdd4tJpYN0xT7KH/Q0YhYnGkvUryZzqgieqLCVA
         ClkqDdPyUMdAHgfHwhr2lju1rmFlibkMIhvVNc9RiezgpkKICNGRTxH4RhpCG6dSqWw3
         3tLxEbIkv607wcvuOJTpfMbqPAft0iF7kDlK5eKOOwepEvX+PlvGB4DDUm0Gy5TOkLCr
         eYSIcKa/T2tZxqQYHJBuM3KWI9tSkFqOUfKsvhOIctx09cd5Kaj4IL3u1rF7DgwWQVwl
         grWAlqVbMlcaZeP9Ki2BGM8KuaI34LC8hgImCk17iTZXXGzQm8C2ULvEDHFOpe3/maFi
         a0sg==
X-Gm-Message-State: AJIora+KPpR7qNTlHdO8ykjqzBM5ipLqyssQ7uD9WusYuuhzImzxnmRK
	d1ImxKiyUGnS98UNiCcOHzvC9eZQUsfbKQ==
X-Google-Smtp-Source: AGRyM1veAdwoU7tXU4coFBrvGM1e8feYEt+Iz1+dC+Kp+CckeCNvD9aJ0R9EWRuRdSH14fywDf1DxA==
X-Received: by 2002:ac8:5885:0:b0:304:f2ed:7e9f with SMTP id t5-20020ac85885000000b00304f2ed7e9fmr18349051qta.26.1655712148451;
        Mon, 20 Jun 2022 01:02:28 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id b7-20020ac86787000000b002f93be3ccfdsm10069290qtp.18.2022.06.20.01.02.28
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 01:02:28 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id w6so17585011ybl.4
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jun 2022 01:02:28 -0700 (PDT)
X-Received: by 2002:a25:bd41:0:b0:668:c259:f6c2 with SMTP id
 p1-20020a25bd41000000b00668c259f6c2mr15091616ybm.365.1655712136748; Mon, 20
 Jun 2022 01:02:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220618123035.563070-1-mail@conchuod.ie> <20220618123035.563070-7-mail@conchuod.ie>
In-Reply-To: <20220618123035.563070-7-mail@conchuod.ie>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 20 Jun 2022 10:02:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtjZVvy-gGTksVRYa+dS7-1ngQf9_kfp6k29nkfizKbA@mail.gmail.com>
Message-ID: <CAMuHMdXtjZVvy-gGTksVRYa+dS7-1ngQf9_kfp6k29nkfizKbA@mail.gmail.com>
Subject: Re: [PATCH 06/14] spi: dt-bindings: dw-apb-ssi: update
 spi-{r,t}x-bus-width for dwc-ssi
To: Conor Dooley <mail@conchuod.ie>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Vinod Koul <vkoul@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Serge Semin <fancer.lancer@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
	Niklas Cassel <niklas.cassel@wdc.com>, Dillon Min <dillon.minfei@gmail.com>, 
	Heng Sia <jee.heng.sia@intel.com>, Jose Abreu <joabreu@synopsys.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org, 
	alsa-devel@alsa-project.org, linux-spi@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220620_010231_234693_9AB7A888 
X-CRM114-Status: GOOD (  22.51  )
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

Hi Conor,

On Sat, Jun 18, 2022 at 2:32 PM Conor Dooley <mail@conchuod.ie> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> snps,dwc-ssi-1.01a has a single user - the Canaan k210, which uses a
> width of 4 for spi-{r,t}x-bus-width. Update the binding to reflect
> this.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> +++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
> @@ -135,19 +135,41 @@ properties:
>        of the designware controller, and the upper limit is also subject to
>        controller configuration.
>
> -patternProperties:
> -  "^.*@[0-9a-f]+$":
> -    type: object
> -    properties:
> -      reg:
> -        minimum: 0
> -        maximum: 3
> -
> -      spi-rx-bus-width:
> -        const: 1
> -
> -      spi-tx-bus-width:
> -        const: 1
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        const: snps,dwc-ssi-1.01a
> +
> +then:
> +  patternProperties:
> +    "^.*@[0-9a-f]+$":
> +      type: object
> +      properties:
> +        reg:
> +          minimum: 0
> +          maximum: 3
> +
> +        spi-rx-bus-width:
> +          const: 4
> +
> +        spi-tx-bus-width:
> +          const: 4

These two also depend on the board (SPI device + wiring).
So all of [1, 2, 4] are valid values.

> +
> +else:
> +  patternProperties:
> +    "^.*@[0-9a-f]+$":
> +      type: object
> +      properties:
> +        reg:
> +          minimum: 0
> +          maximum: 3
> +
> +        spi-rx-bus-width:
> +          const: 1
> +
> +        spi-tx-bus-width:
> +          const: 1
>
>  unevaluatedProperties: false

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
