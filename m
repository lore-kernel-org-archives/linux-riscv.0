Return-Path: <SRS0=VVci=OL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D415CC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 11:41:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 79FC861166
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 11:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 79FC861166
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GiB9IEbaIT9HMM2RXyEwHIaxovHcmeT/Nq661JYQm3M=; b=WvTmRtYIRQt356
	C8d/ghqW+VVipzNtURpRQkIXS0bBf4B0kE9FYop2uYIbDWTaAtxkfLs5H617dzWJkcswWTFAMQihO
	oajijFlZY7vQFDQMSPAUeAL3E7UexD6TEj8kVDQh8pA5NRPx9tvKVP0Wfd3qTC6TkDcB33k9IMlM9
	rNEe0Oz8b5Q/sJv7oslF2VslaQqLDo6ZOTQC+hPK65mWrvYHRx6t5uN5qY2fikfy/eV3oitgm+Au2
	p+RYnAZm4ti12qz3Si8PlffRm2a2Kl6IEtH+k3AoZpWOQ0YMr/LJoNJLpt7CrQ+yAQ7UIOka1BRM5
	UolGn8R2qFSLBc9EI8iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSe8n-004NdL-3A; Tue, 21 Sep 2021 11:40:49 +0000
Received: from mail-vs1-f48.google.com ([209.85.217.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSe8k-004Nd1-CZ
 for linux-riscv@lists.infradead.org; Tue, 21 Sep 2021 11:40:47 +0000
Received: by mail-vs1-f48.google.com with SMTP id u8so19879454vsp.1
 for <linux-riscv@lists.infradead.org>; Tue, 21 Sep 2021 04:40:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bOlfZTrSii7Nb14rl9dZd76xYIBrclWvgXtZcJh0XvM=;
 b=NTRfimP/YVUizgFMlWN9m26CNEJGVg04GICFpomE50P7CfxFejoBAScZP9yYiyZ2LZ
 SLnmSwAwA9OIcMFY1dTHPBVeN87E7wd8fjL7NFyORM2frmWL5SsblJXAkfav+uSJH/mm
 XwYN+e/YBmshS46ducBrDzs8tk/5Smpp4rpwQWPyFib59QfkV8pYYD1QwZBEiGgLB9WG
 ds0/6AQ9tBVg2j+iucEK7yPn6s5uQ5sW7WW3fAlKMxT1CjrUUl7becMJAnJmyidMoJO2
 z9Ou9jGq/moUyBR5dD27gT31LKaCHRShO51PifmRn9T8FjkKukAMpQnXBN8Rje7BPJXX
 tk2A==
X-Gm-Message-State: AOAM532+iNULpqYgce1QEKQ8cgPDvNCK/g4X/kcBpl1C1W75zHaQa89Z
 FKP4FAt0LO7SQAEhYzdHGQxozEs4+EUqCV+4KL8=
X-Google-Smtp-Source: ABdhPJwiN7fv8zkCxGRdSiJIiixTxoRHMRXiLr8T19X9+fGqcKipwyfkQQaXHbvVsTR6Cg4anMFHRjlYU50G8LO/Lys=
X-Received: by 2002:a67:f147:: with SMTP id t7mr13834174vsm.41.1632224444687; 
 Tue, 21 Sep 2021 04:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210920150807.164673-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210920150807.164673-1-krzysztof.kozlowski@canonical.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Sep 2021 13:40:33 +0200
Message-ID: <CAMuHMdU7HHEHAcn=vPqAPYPkgeywKqb-rL6YmDRH0+4XNw8CuA@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: mmc: cdns: document Microchip MPFS
 MMC/SDHCI controller
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Piotr Sroka <piotrs@cadence.com>, 
 Linux MMC List <linux-mmc@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_044046_469953_6F540282 
X-CRM114-Status: GOOD (  17.24  )
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

Thanks for your patch!

On Mon, Sep 20, 2021 at 5:09 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> The Microchip MPFS Icicle Kit uses Cadence SD/SDIO/eMMC Host Controller

Actually it's the SoC .dtsi

> without any additional vendor compatible:
>
>   arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: mmc@20008000: compatible:0: 'cdns,sd4hc' is not one of ['socionext,uniphier-sd4hc']
>   arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: mmc@20008000: compatible: ['cdns,sd4hc'] is too short
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

With the above fixed:
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

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
