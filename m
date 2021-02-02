Return-Path: <SRS0=Cdab=HE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A41C433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 18:45:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F5CD64E34
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 18:45:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F5CD64E34
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2iqakyYDvyjU3APb6MFsj5UIuh/AB8s5njI71d7M0s4=; b=Lra++NvK3dSjiQdO9dHFtvCgY
	1bvGaaH2zIJ8DCG4bA2TwQDjnYGzSuK8GEWzi6zO4cWlXDhcRVGQTVZRWC1TWgbi/dP1q8QDVW49d
	rnktZ0pAgXYElOxHR728WggvloIT76+OE52vibm+ICGb9gDAqmnetgO96LUzh9MXjtC/Hlfk/2+4k
	JTaHehZHOfXqRNSl4RAitVLwZleidomdn1FGp3zIs3pDjOx/CE13lt8SkHmr8wo4mqJ6vIU6niU5P
	jHVy8U6qOksE4xOMm+fHqAC/x6OphRy2nUomZmveieSdOMkSdOCc6ffU43bpY/VhcfslOs5pyBvGX
	NIDLTwO9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l70gA-0006jt-L8; Tue, 02 Feb 2021 18:45:34 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l70g7-0006jA-BE
 for linux-riscv@lists.infradead.org; Tue, 02 Feb 2021 18:45:33 +0000
Received: by mail-il1-x12d.google.com with SMTP id q9so20036054ilo.1
 for <linux-riscv@lists.infradead.org>; Tue, 02 Feb 2021 10:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4qbyVQvg6BEVMu7L6aYZLcVEyg6+TqSBB7/55fYv22M=;
 b=G9ESZw32gpGvXnbLtBSAr26tTIb9LPlPn+uw9Uyty9gss6Ae30QjzRnCgyu9e+rOgA
 iTRvmnRyPGMLTs089ldyJSmRIjYQB9Iz+1e4CXFvcftMoc1fAYKzfnVzkmng7/UhVu19
 Z7UVCujerknKLHcbrX8dF+MmmAQFeWMeqgmYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4qbyVQvg6BEVMu7L6aYZLcVEyg6+TqSBB7/55fYv22M=;
 b=Fm+PJjSsiy6pmr9j8btG5z3Kh/vAgnAieLBaO9/YW3E/fRC1sIst2ZTXxU+hwhW7z8
 ZJ7um9ip2UrHvT9tiEH4uCHrp0Obazrtt/e6dH1xtKaML323SL+sz1rcpu3EaQb66HMI
 +A26cB3P1PXOjtd2xs+EVh2lJp49pSOsn4VK0lwc6L20UQmE+gWO3ucRkhRk9j7RQl8/
 ulTMJwXTbZIJK7RUqKdy2mVVyRRB70imBN+Rd/7gO+6fV1hZqeRWzO8gC/AydDEkSo5F
 Cd1vokpRFAjaBuQfcWgIgZxOKUnJfHspqdyko2yiJSouyb+Rs68/OB7rQJRdkqxewMFD
 1Qhg==
X-Gm-Message-State: AOAM5324SaZFUYZ7L1cx17uLT8+3RuQpZ0SedWr+4LTPJiKKUqn3q2vd
 P3d3wjeynAXTmRSa7fLETSI5iPQm0SiymN5uSoEb
X-Google-Smtp-Source: ABdhPJwaf5cspb8cc2cHul2mwhML7JvGo5zkmfDaCk/AWDjoDqoUpxO+ilUJftwq2bPf95wcfP/Tssl+dmbwRC2fHU4=
X-Received: by 2002:a05:6e02:1a68:: with SMTP id
 w8mr19362847ilv.147.1612291529291; 
 Tue, 02 Feb 2021 10:45:29 -0800 (PST)
MIME-Version: 1.0
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
 <20210202103623.200809-8-damien.lemoal@wdc.com>
In-Reply-To: <20210202103623.200809-8-damien.lemoal@wdc.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 2 Feb 2021 10:45:18 -0800
Message-ID: <CAOnJCUKQ+yFJN9+biMMQW6Wvf=eckfcfMHVpDB74TmxWVNoEkQ@mail.gmail.com>
Subject: Re: [PATCH v14 07/16] dt-bindings: fix sifive gpio properties
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_134531_398611_D978D135 
X-CRM114-Status: GOOD (  18.54  )
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

On Tue, Feb 2, 2021 at 2:37 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> The sifive gpio IP block supports up to 32 GPIOs. Reflect that in the

The spec here says 16 GPIOs
https://static.dev.sifive.com/FU540-C000-v1.0.pdf

Is there a updated spec available ?

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



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
