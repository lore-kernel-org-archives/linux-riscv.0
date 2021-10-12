Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 455E6C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 04:59:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0ACC260F21
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 04:59:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0ACC260F21
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L4FZwCaa1RdE1syZTRxz0lpmAbe+6OJqz4CczKdChsk=; b=dg/LdUO+oZ2shO
	loaTM3egXAJzb8gTyqNg4r5IqINA/z3iK9Irt6A5ujeLf8Pyrj3bEBgF3/fIzFAuqKwv20mKzIPkV
	RUt2rG4Oqdok1LOY9fDaJen0ECjzPsMCa7soQ0kyq8L3XDLaUW8lbE7nBc9nBFyq/a215ImuvZ+Za
	zjqfKHJYJMPRiopJhyJzZEsShuQYI27dPJT/O4BAbFpFfWQeWxu6rJPXIOVwUSZgR6XEMY8L00+ZH
	NIplrc6ftQPcSPkqUF7wPFS5WR3UopMfrplvQ4sUrnV8gnUGBF5cV2jxgk8vZSimSlbciM5Qz4tJs
	frF/+pORLjKIcV9mKG4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma9s8-00BZ95-HI; Tue, 12 Oct 2021 04:58:40 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma9qQ-00BY8B-7S
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 04:56:56 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AD0403FFE3
 for <linux-riscv@lists.infradead.org>; Tue, 12 Oct 2021 04:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634014611;
 bh=BCyxVEf5Gp0uM4KfbTjyQDlhtbT74n2HOTEb9vV8RKU=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=kJzFlPBr9mJMYAVwHtyZqTcK5biSO9T2/leTNQxyCcgVzcV0np6RH0hWYuzTCXoqJ
 rs0kFDJ2aXrtxwimQZOAGLcV5g2mQ1yIbKYZFgO9oDTh9h17S06YN5CsgU7AacVcVz
 J+ODNeFbBvcGHOvgzOVxbsqXBRZx+spAcQxVdQvjEXVyrUqXYs4W7IH/gSULdt5AS5
 0K6a8o8o11m76Hl7uxsB2Mu0nJYIKtwMoTtOxlbr4hCIMdf3dptJSig4S0NnGTwcVc
 Cu/6CfPnDc3T6k3gvcGXnGk3mi0HwZaZxlTjiykRWTmaDmNUhSKeI048ZNZ9Iqogzf
 DJlY9305aYjyg==
Received: by mail-ed1-f69.google.com with SMTP id
 z23-20020aa7cf97000000b003db7be405e1so6901738edx.13
 for <linux-riscv@lists.infradead.org>; Mon, 11 Oct 2021 21:56:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BCyxVEf5Gp0uM4KfbTjyQDlhtbT74n2HOTEb9vV8RKU=;
 b=IpTL32zTLMtgHwPg5LGw3YVv7R4ewk0Tk1UwdB3/Ntj34a2pgd+TvoKyoIoduRW8x3
 w9i43lC7DW3I3uJFPH7nJ+HOWREwqSW1G8fgSgMtZelYwKOXNPyMEocBj0Bw44pa50wh
 0TJOpN7Ym7EzJuA9tdUCr38wFDR9cVFdoR1pEVGBj5+UzglsNUJnU3QDiyLSp5zav/PF
 JJNAHEobG6JH3kkgzzwRLJJDJFK7cpkNb0dIoxG3tPEp85QqxzehlMyWFm6iacYnX2uZ
 6Dfo46s96FlM3wuNX/q/+00lc0ld46zaZXTH6SvE7irIv262ain24kUVDsGrOcboA7+K
 MMYg==
X-Gm-Message-State: AOAM531WzyeK93lk69kuC+OCP/AjCOKcxEXHPS41Z+Bt1LQPe2XvCqF5
 nFyKe1SYsHPcFuqRSFZtv0gk1kdeBTPZ/tByhiwyAWBbM5wM7IUXnNzE0//a3XLyr9Fs0VK4D2b
 jE7kq1XauX1aWS3ZXqBhL5OKbovWrRaZMQhj+6tgrXOxry4ktJdukQu8tOMEJdg==
X-Received: by 2002:a17:906:9414:: with SMTP id
 q20mr31344878ejx.241.1634014609951; 
 Mon, 11 Oct 2021 21:56:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfX0PyiKdpuHUayAwncldug3i/rdZwjBSq4PyX9ATI6GhXFboX9vjkwh4+o6rNFZcu+ZPtQZmAMuoSunAduXw=
X-Received: by 2002:a17:906:9414:: with SMTP id
 q20mr31344867ejx.241.1634014609793; 
 Mon, 11 Oct 2021 21:56:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210920130248.145058-1-krzysztof.kozlowski@canonical.com>
 <20210920130248.145058-3-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210920130248.145058-3-krzysztof.kozlowski@canonical.com>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Tue, 12 Oct 2021 06:56:38 +0200
Message-ID: <CA+zEjCvhBYW5-QSRtanQjUsbB2Oqx79WaVpmRWnb+qOLU9pZqg@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 3/5] riscv: dts: sifive: drop duplicated nodes
 and properties in sifive
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 devicetree@vger.kernel.org, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_215654_455178_F2EE5204 
X-CRM114-Status: GOOD (  16.68  )
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

On Mon, Sep 20, 2021 at 3:05 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> The DTSI file defines soc node and address/size cells, so there is no
> point in duplicating it in DTS file.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>
> ---
>
> Changes since v1:
> 1. None
> ---
>  arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 5 -----
>  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 5 -----
>  2 files changed, 10 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> index 2b4af7b4cc2f..ba304d4c455c 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> @@ -8,8 +8,6 @@
>  #define RTCCLK_FREQ            1000000
>
>  / {
> -       #address-cells = <2>;
> -       #size-cells = <2>;
>         model = "SiFive HiFive Unleashed A00";
>         compatible = "sifive,hifive-unleashed-a00", "sifive,fu540-c000",
>                      "sifive,fu540";
> @@ -27,9 +25,6 @@ memory@80000000 {
>                 reg = <0x0 0x80000000 0x2 0x00000000>;
>         };
>
> -       soc {
> -       };
> -
>         hfclk: hfclk {
>                 #clock-cells = <0>;
>                 compatible = "fixed-clock";
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> index 9b0b9b85040e..4f66919215f6 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> @@ -8,8 +8,6 @@
>  #define RTCCLK_FREQ            1000000
>
>  / {
> -       #address-cells = <2>;
> -       #size-cells = <2>;
>         model = "SiFive HiFive Unmatched A00";
>         compatible = "sifive,hifive-unmatched-a00", "sifive,fu740-c000",
>                      "sifive,fu740";
> @@ -27,9 +25,6 @@ memory@80000000 {
>                 reg = <0x0 0x80000000 0x4 0x00000000>;
>         };
>
> -       soc {
> -       };
> -
>         hfclk: hfclk {
>                 #clock-cells = <0>;
>                 compatible = "fixed-clock";
> --
> 2.30.2
>
>

This looks good to me, you can add:

Reviewed-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Tested-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>

Thanks,

Alex

> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
