Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD25DC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 04:30:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82F6060E8B
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 04:30:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 82F6060E8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vMvol4hJ9LLCHqCPt5z7VqvFn92peCIP+us4w7OeFig=; b=ewwnkY0776/Ia3
	5zo7G6vtTyv7Nys7R1/A2BrKDqG8phYBeypXnzXZZjknQYPb5RlSi3enu7Oh8qTVGVmFCu0YP74u/
	JFlOP0Z+XNMJbmhpMNYTngLVp7BGseXZuTW2V11kkQmehcB9JhLgpvBNpaJ5geVVIqis7hDjnngVx
	owKt4cV4NiUbxInj32OdRUxyhp3sKTRz9nCbxx/ipvZ5H1AyfNvSt6dtHBL+kHX9ZLflBgP/DxLY9
	CPw2bS1YWIoumatdTsKcGWDyhjTWu7C+SAFg41MsdYprwDwDMniLUyFOrYWR29O8KusdrRPF4qIJS
	mk0wOnFTTbDlzmG7Zu1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma9Q4-00BPpy-6K; Tue, 12 Oct 2021 04:29:40 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma9Q1-00BPoO-94
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 04:29:39 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A88184000F
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 04:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634012962;
 bh=j5GNvlDgAlpbmrfI4AhEJkka1LKpKihb4cfJWgaespQ=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=o2d/EIT9pjX/s8yapFXXI2flCqLaI3JaWWEzA4Xt1+VjSgNq8pjCEaN5O9vEzK6QI
 412ZdWBViwJ/1CBnV5BSA2WmjshqlmvwKHkGy1ls1DgfvtUddsNLo6/r0qoV0ou77i
 wlypT6mQTNlpCYPMQa8SATFoTS7tjK1z2dL3X7kOtOG2T0M/GDX+Djfi/KayuPh14U
 ZVrNRzDTXtNQCRRI2YrqYXCZ8HLBmsTfdds3oJ13XyQM7BeeDbKjKxuV/WAO+f/fxD
 5zUcs2fhj9cy/z1+FNYHocsxOv+YlYA70iVPh9iGQZn5sFnJkMyqS8TvFkXpAI2Qlf
 qDdjJkmylPl8g==
Received: by mail-ed1-f71.google.com with SMTP id
 u23-20020a50a417000000b003db23c7e5e2so17775914edb.8
 for <linux-riscv@lists.infradead.org>; Mon, 11 Oct 2021 21:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j5GNvlDgAlpbmrfI4AhEJkka1LKpKihb4cfJWgaespQ=;
 b=bBf0wGda45I41wbd4yyxWzrMsWQKKMa58DkoFxMxRfulewGmEzB3mEMAu1aCx+Yrk6
 J47ljVhcnLDPPH/h2AkSVe+n0j89pmBpV+aTOiNESKLEYbRqsLmK7oB4/eHmOy7x6HG3
 jsKrY84fKvL6Ffd3Bb3XjFbEaSLbcb/pKt/eH31+x3wpqmwVuYa2kNrwH+7qkuxvfxOL
 yVV1uFtUYS4yTjZH1r7xinSmiwW4rMYB/M5O1ibesSOha1MIEANgmLfqpeiCH2dO7+gu
 MvHV58YHYZP4nxf/j17etJr+6H/CN7D2bQrT9+X9KfWbPuln7/8kHnm02vczFzuZBu4x
 RcWg==
X-Gm-Message-State: AOAM532+BFw4GAJfXY5HupRKbOjepQDNFyWQy7z50INcrJvLKqFRP3e0
 zRABDTuvLC/bj8VF26qi1/begIYLfhlwpe44SbW+UodXSnFAii9hPcJvdEIyBpHR/iqm5O7ao58
 jVxpni0LSCVxkWidiFkPj+JPjALxZN6yUNo/bJT2PzHcKHu8VhHLVO22pEzv2Ww==
X-Received: by 2002:a17:906:ed1:: with SMTP id
 u17mr30550101eji.304.1634012962264; 
 Mon, 11 Oct 2021 21:29:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1ksJYjK/aiihSiZEfvwLRPik2LJg90bitpHrZfMyTVNB23tXG2VJI1i1iMS2CddkouS6IqXMkzMJJbVhtgTw=
X-Received: by 2002:a17:906:ed1:: with SMTP id
 u17mr30550085eji.304.1634012962057; 
 Mon, 11 Oct 2021 21:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210920130248.145058-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210920130248.145058-1-krzysztof.kozlowski@canonical.com>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Tue, 12 Oct 2021 06:29:10 +0200
Message-ID: <CA+zEjCtTbJnvmrM1g-CR8ZUtT375Wd-4dt0YR1zLG5nOvtDyGg@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 1/5] riscv: dts: sifive: use only generic JEDEC
 SPI NOR flash compatible
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_212937_497259_13BD5335 
X-CRM114-Status: GOOD (  18.40  )
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

hi Krzysztof,

On Mon, Sep 20, 2021 at 3:05 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> The compatible "issi,is25wp256" is undocumented and instead only a
> generic jedec,spi-nor should be used (if appropriate).

Why not do it the other way around? I mean adding this compatible to
the expected list: don't we lose information using the generic
compatible?

Thanks,

Alex

>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>
> ---
>
> Changes since v1:
> 1. New patch
> ---
>  arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 2 +-
>  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> index 60846e88ae4b..633b31b6e25c 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> @@ -63,7 +63,7 @@ &i2c0 {
>  &qspi0 {
>         status = "okay";
>         flash@0 {
> -               compatible = "issi,is25wp256", "jedec,spi-nor";
> +               compatible = "jedec,spi-nor";
>                 reg = <0>;
>                 spi-max-frequency = <50000000>;
>                 m25p,fast-read;
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> index 2e4ea84f27e7..9b0b9b85040e 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> @@ -211,7 +211,7 @@ vdd_ldo11: ldo11 {
>  &qspi0 {
>         status = "okay";
>         flash@0 {
> -               compatible = "issi,is25wp256", "jedec,spi-nor";
> +               compatible = "jedec,spi-nor";
>                 reg = <0>;
>                 spi-max-frequency = <50000000>;
>                 m25p,fast-read;
> --
> 2.30.2
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
