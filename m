Return-Path: <SRS0=VVci=OL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C9A4C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 11:47:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43C9860F56
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 11:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 43C9860F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ioPcXUg/A6e40/SWWdUhdzk4SsYXtwIMVXszOkzo68E=; b=zSJjYMHJGld+rF
	NyB1c4sRxoDSvtB7wnXrf9jVrHyYXyONzV4VsyPnRbU6s/Wh57XWGbPI/9CvB+VVSw2fJu549WotP
	6Po3jCTW4nB1ALg2vrVzRGmt+YlYHdtS+eQEF5SUtw3GI4F23s+w9xnA5iSEtgqTTop8zS4ih9Y1j
	p3VvPiBhADRZ90QcF4RuVciAiAnV3tZejnUvs6S4O++rjbAFVVBqMS41b0y6JmN8ysmTOPPEMn7iP
	RHqb7k3rdc+nxYQ2nENLhwk4mKHt3WHz4leQfq35PZzib2JXJp4zY6kcwtSNbDsXoDcoaJ5ncZ769
	uv/0L4c1hQtkKEmJUYDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSeET-004OLt-Mn; Tue, 21 Sep 2021 11:46:41 +0000
Received: from mail-vs1-f53.google.com ([209.85.217.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSeER-004OJx-6z
 for linux-riscv@lists.infradead.org; Tue, 21 Sep 2021 11:46:40 +0000
Received: by mail-vs1-f53.google.com with SMTP id y141so8419410vsy.5
 for <linux-riscv@lists.infradead.org>; Tue, 21 Sep 2021 04:46:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=32w66s9nGR0myw/PUWAuk6HxhY9nPwbFGQyXVEOk8kc=;
 b=yL867SzBcyApkyxmThI7ZZaJqk5FatfppLWrvcbwCsK2PHnnOko3ZgBMKbr6rqC9ZS
 3zheXr35Gx7pZW42EXzyow2kbT8LQZo3aFHZtL1Nwjd/P0DuJnZykn+rQwNDeOqnFb4S
 RsTrirQpwGak35LkYmgm4yGh/OZUSlrwohTnKF0316V6AiqXtmsst4x1yifoDsw7WsYn
 teNxfTWRvn5ILbWj3GDMuZNrGPyELj0uyfDgvJd4BCQJ/d7sNbtra+RI0GRFDhg8dvu8
 Mk+3hyEPq1pCvAdWDLZUlDbxLnIfIf1ffsz7rcexxBSkeq3VS/XaHebsyaB3Sd+ENqHD
 6hxQ==
X-Gm-Message-State: AOAM53249Io7B7YBeSIkcE2CxISGewmgvF+6nc1DEb87RBAHtGuQCvnl
 Rrvww+BaqRlL2vbUZizA+OX7wrkVpUBtdj47Ur8=
X-Google-Smtp-Source: ABdhPJye1i8aFM/j00ORdKt9DIgrNHrCPlMSCXq8HNDzH1ddHulVLAIUqAuRnCTX57TKQLrpNhL5Jrdhn4r9BvG/rjA=
X-Received: by 2002:a67:2c58:: with SMTP id s85mr2943626vss.35.1632224793210; 
 Tue, 21 Sep 2021 04:46:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210920150807.164673-1-krzysztof.kozlowski@canonical.com>
 <20210920150807.164673-3-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210920150807.164673-3-krzysztof.kozlowski@canonical.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Sep 2021 13:46:22 +0200
Message-ID: <CAMuHMdWFhHgT0vqcZnZ4kaMs3jSYtVM4asEkMv3T-xdadiimAQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] riscv: dts: microchip: fix board compatible
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Linux MMC List <linux-mmc@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_044639_307904_58FAECAC 
X-CRM114-Status: GOOD (  21.25  )
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

Hi Krzysztof,

On Mon, Sep 20, 2021 at 5:09 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> According to bindings, the compatible must include microchip,mpfs.  This
> fixes dtbs_check warning:
>
>   arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: /: compatible: ['microchip,mpfs-icicle-kit'] is too short
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> @@ -10,7 +10,7 @@
>
>  / {
>         model = "Microchip PolarFire-SoC Icicle Kit";
> -       compatible = "microchip,mpfs-icicle-kit";
> +       compatible = "microchip,mpfs-icicle-kit", "microchip,mpfs";
>
>         aliases {
>                 ethernet0 = &emac1;
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> index 93730afe6c58..5084b93188f0 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -7,7 +7,7 @@ / {
>         #address-cells = <2>;
>         #size-cells = <2>;
>         model = "Microchip MPFS Icicle Kit";

Note that "model" should be "Microchip PolarFire SoC"
(with/without a hyphen? seems like the occurrence in
 microchip-mpfs-icicle-kit.dts is the only one with a hyphen)

> -       compatible = "microchip,mpfs-icicle-kit";
> +       compatible = "microchip,mpfs";
>
>         chosen {
>         };

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
