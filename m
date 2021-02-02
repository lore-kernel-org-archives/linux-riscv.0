Return-Path: <SRS0=Cdab=HE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17509C433E0
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 19:02:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C488964F5D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Feb 2021 19:02:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C488964F5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3l6JhDiHTXXGR0u4o+CaOmoh7cMKlXXDBWv6S0SxDWY=; b=eUoQ060QUmMNJh3JLPJGvaN2x
	KLvNYVShTZsU2H1u5i+Jbf5cO9nLneGVSJ/vPiT1byvIPFoiQORBzhbv+O84FbgQ7KbnoaX4qO10j
	QQHTvAxF4BmbhoSEmm585QOcXISfwiUMA1UkkSE+AiQmu4iXOAtSBqGlhAEO8YvDlbja6j0bE8G63
	lAKgbHUmj6ROdxMdqo2bcSrcn/jx00NAP7Jpbm+TlPwurhAQDNJbirI+1d5jvqAQurC/dJMmLCKlm
	g391ByHAcOg4C+8EUwVGiM0sMKRIYP29j6IpV60h+50hZ8y9fafHLl5XJwXJeUMBiFmDb9w2SNi8e
	HDOQsMK2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l70wO-00010d-Vq; Tue, 02 Feb 2021 19:02:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l70wM-0000zN-1u
 for linux-riscv@lists.infradead.org; Tue, 02 Feb 2021 19:02:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 87F7664F6B
 for <linux-riscv@lists.infradead.org>; Tue,  2 Feb 2021 19:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612292536;
 bh=MepYmNtF+Sg+PcYHScI6jhnJJOlaLCCfnstjzdDivSg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=CLWfGj196tuP/Ch+PDWye90Z2bLahM4em9dGdcasVz7oftG/CziNwlBlFl/Sh6lro
 CBorco5ekgGQLnx8+DO8h8DeedT4wSaYY0+weOywukOPMG9nG4jTo6Q4Ocqm9FULCM
 MY8lGm6baEOKR5siH6h/se8V0jMmQ44frW7mIJ5l6D0gBtzCS+97D+EsaRWqBnfsDH
 5gUgNYAd0UucloSF6zvrPUkleL+2neV7ApMHKLCTwGmW/K/iUQ0HccuFAhEmkn3Naj
 xMN3EyTZ2N74tP+fscfRqsMvk7J0I4XgzRvPCe4kFQA3uAYmL3TnRLyI5ADVWwBi6x
 rPIctc+XoOkOw==
Received: by mail-ed1-f53.google.com with SMTP id df22so8194452edb.1
 for <linux-riscv@lists.infradead.org>; Tue, 02 Feb 2021 11:02:16 -0800 (PST)
X-Gm-Message-State: AOAM5319kzxjsX/8YlNbDsVJm6STRfm9R5W4qVe4V90GpyeEmDonKAyl
 UVBMNyeNNXqyv+TokgwWVEXJDYU7YOuqW6galg==
X-Google-Smtp-Source: ABdhPJyQcCYmKIexJRNZNhGtIDHJKRqSVglzpu9MfXZv5bY6FedvmEhCHkPwHhJRm81e5FLKsAFTDVjzFvqldbS0ZgQ=
X-Received: by 2002:a05:6402:2029:: with SMTP id
 ay9mr322902edb.373.1612292535073; 
 Tue, 02 Feb 2021 11:02:15 -0800 (PST)
MIME-Version: 1.0
References: <20210202103623.200809-1-damien.lemoal@wdc.com>
 <20210202103623.200809-8-damien.lemoal@wdc.com>
In-Reply-To: <20210202103623.200809-8-damien.lemoal@wdc.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 2 Feb 2021 13:02:02 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJNqKrsB3LJvBpNmY6H3V1c5x4duqB_0p8YKit4+ZYRBw@mail.gmail.com>
Message-ID: <CAL_JsqJNqKrsB3LJvBpNmY6H3V1c5x4duqB_0p8YKit4+ZYRBw@mail.gmail.com>
Subject: Re: [PATCH v14 07/16] dt-bindings: fix sifive gpio properties
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_140218_245547_871F102F 
X-CRM114-Status: GOOD (  18.51  )
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
Cc: devicetree@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 Sean Anderson <seanga2@gmail.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 2, 2021 at 4:36 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
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

What's the default as obviously drivers already assume something.

Does a driver actually need to know this? For example, does the
register stride change or something?

Please don't add it if the only purpose is error check your DT (IOW,
if it just checks the max cell value in gpios phandles).

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
