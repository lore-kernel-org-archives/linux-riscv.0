Return-Path: <SRS0=OV2N=HF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 311FCC433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 18:02:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0CD264F51
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Feb 2021 18:02:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0CD264F51
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E1xrdX9nKIbWaQby+GJGH91DWJ0FyZ7wgZb5V2zWTDQ=; b=I6K2FGkBhWQrFANgFeCagibqa
	oiTybIh+P/PdI5SvS8mvUFXtw5VYBQLehgcxxfh+cc1Os//ByZymxf1Z11Hd/5boXsnCJY/9Q8PgC
	LPdfqT/u44xOCiZB+c2RR0SjnIbnDG0VY0dLAcUCJCHKLE39WMU2ENikgx63ruWw7MeyJtH1V6tOT
	+jFgkR1+3CqBqyV8cnxeH4SEUBVU9l+chy0Uyf7diemle93o8lmlCtbpeWGQDxH3aq/M8NP/cgEbi
	BrfiIusvrDghm7VUIphVBuF7sG5r45Qohgx8EaShnLy/f9YjS8cEApwYgHSGhjxtAxNs61kFJ8Fly
	prmzCN+3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7MU2-0003M7-TD; Wed, 03 Feb 2021 18:02:30 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7MU0-0003Ll-8a
 for linux-riscv@lists.infradead.org; Wed, 03 Feb 2021 18:02:29 +0000
Received: by mail-il1-x134.google.com with SMTP id y15so56028ilj.11
 for <linux-riscv@lists.infradead.org>; Wed, 03 Feb 2021 10:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O4JlNu8/UKJ4TcIvZSZaq+J3GkWnkAas9iNj9NlLHeM=;
 b=mvSmPEuV3qNgYCAQTcYKupvgpZsxP4EFNF2/jb6z8/9y7GJAwEn3IjJ1hXbCtVOdrP
 9dikj2yUHTEA1BKCKxl5TrYx0K1c04aaz65KWDgzGaZOHdKlupPv1c1vDQt97kYtX7zZ
 TKBa845jd6WCteZDZsPddfCs8z/YHxBCJLYJk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O4JlNu8/UKJ4TcIvZSZaq+J3GkWnkAas9iNj9NlLHeM=;
 b=Scqd+I0ZIFLhyvR5ZNUsm0GiycqVXw+b9zcslfQoNxukK5X15iUlEk6uSZno/fMDqA
 kstsLiYRmXYgimmyovSU6orZ/SptxyVKyC9UBO7q41hHGBcC3p2JZzGQRLtlsjiIl68d
 rRPbvQHorKS6BIRgjm0B+UUocxHJ2o17zk+ZNc5Pj4a0RLI4LcpJbLc5ibD7iJmjeVkf
 Z7pK1W+fQZ1t79Mjud6GdornPEi7qrFFi4pX6KLNBAC1g/BYLPFy7pTRrEBQDyZzgsxc
 KKqrGjKdjBxS3ZzGPVSx6snNFPjPajHjBRcRDcMYRCf2kOuDjrKRxHhXX4AzhbTtMQyC
 WH8w==
X-Gm-Message-State: AOAM530VLmt90lthSd9dghiwD9yXhpNrzDcGMiAtBhyWmDETYfOSe41m
 xNN7kBayxigPF+JNzi8qL/SVXKHxYUEdo0i9ZRCP
X-Google-Smtp-Source: ABdhPJwIcQ3qi/WS218RvzSvV7N2bb+NFL58ELQ2CH2SiyWJNr3JUXVM6U/iAu/YvppBMVqmGLN/EoSurNZeUSmq54g=
X-Received: by 2002:a92:ce50:: with SMTP id a16mr3574520ilr.219.1612375344325; 
 Wed, 03 Feb 2021 10:02:24 -0800 (PST)
MIME-Version: 1.0
References: <20210203125913.390949-1-damien.lemoal@wdc.com>
 <20210203125913.390949-8-damien.lemoal@wdc.com>
In-Reply-To: <20210203125913.390949-8-damien.lemoal@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 3 Feb 2021 10:02:13 -0800
Message-ID: <CAOnJCUJAbkWj4OUWBjPQiLKuYD4Pr=u+Cvm46ZFR47VxpwQA3g@mail.gmail.com>
Subject: Re: [PATCH v15 07/16] dt-bindings: fix sifive gpio properties
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210203_130228_453016_A59F448E 
X-CRM114-Status: GOOD (  17.52  )
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
Cc: devicetree <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
 Anup Patel <anup.patel@wdc.com>, Sean Anderson <seanga2@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Feb 3, 2021 at 5:00 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> The sifive gpio IP block supports up to 32 GPIOs. Reflect that in the
> interrupts property description and maxItems. Also add the standard
> ngpios property to describe the number of GPIOs available on the
> implementation.
>
> Also add the "canaan,k210-gpiohs" compatible string to indicate the use
> of this gpio controller in the Canaan Kendryte K210 SoC. If this
> compatible string is used, do not define the clocks property as
> required as the K210 SoC does not have a software controllable clock
> for the Sifive gpio IP block.
>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../devicetree/bindings/gpio/sifive,gpio.yaml | 21 ++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> index ab22056f8b44..2cef18ca737c 100644
> --- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
> @@ -16,6 +16,7 @@ properties:
>        - enum:
>            - sifive,fu540-c000-gpio
>            - sifive,fu740-c000-gpio
> +          - canaan,k210-gpiohs
>        - const: sifive,gpio0
>
>    reg:
> @@ -23,9 +24,9 @@ properties:
>
>    interrupts:
>      description:
> -      interrupt mapping one per GPIO. Maximum 16 GPIOs.
> +      interrupt mapping one per GPIO. Maximum 32 GPIOs.
>      minItems: 1
> -    maxItems: 16
> +    maxItems: 32
>
>    interrupt-controller: true
>
> @@ -38,6 +39,10 @@ properties:
>    "#gpio-cells":
>      const: 2
>
> +  ngpios:
> +    minimum: 1
> +    maximum: 32
> +
>    gpio-controller: true
>
>  required:
> @@ -46,10 +51,20 @@ required:
>    - interrupts
>    - interrupt-controller
>    - "#interrupt-cells"
> -  - clocks
>    - "#gpio-cells"
>    - gpio-controller
>
> +if:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - sifive,fu540-c000-gpio
> +          - sifive,fu740-c000-gpio
> +then:
> +  required:
> +    - clocks
> +
>  additionalProperties: false
>
>  examples:
> --
> 2.29.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


Reviewed-by: Atish Patra <atish.patra@wdc.com>

-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
