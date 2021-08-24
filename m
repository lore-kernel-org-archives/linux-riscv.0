Return-Path: <SRS0=qQBT=NP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ECBCC4338F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Aug 2021 15:35:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E03496135F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Aug 2021 15:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E03496135F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kCE9xR2AB1C6dDuT8CcV7RQzlu/djf/RTDPewj38Its=; b=WaMeaQe0IhcbqK
	owJhLtSCbXR0wXjmGnShlh+N3j+OrC7INDZ6+w/QFRJDmLhwH/bbsdSpF8Y7yO/Wpi0gWAwjfnE4b
	uX2qZTH/pMUb0jUdzl9Mh29Bf/gcGbIh56dCxd/E4nTjB640qTAvfcz1r4sWWMDKZiCCf9pY60c8v
	uOLHlechkOXzb34NUOl7PUAYzSZEpGhHBK91rRdcowTyBmujad/8Opa6FQAMFGJJ6Vx9U0P6ayD3M
	OYk8Mr21dzSqKsnv7m3OQdxhDKMfeIUvQm53IWAKRbTdZsU+u5h/oVYmfnEpS5lbuoMYXX+mOPyFH
	l2otZDWUfLjPOHh0LhQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIYS9-003kP1-5m; Tue, 24 Aug 2021 15:35:05 +0000
Received: from mail-ua1-f53.google.com ([209.85.222.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIYS6-003kNM-FK
 for linux-riscv@lists.infradead.org; Tue, 24 Aug 2021 15:35:03 +0000
Received: by mail-ua1-f53.google.com with SMTP id g2so5538787uad.4
 for <linux-riscv@lists.infradead.org>; Tue, 24 Aug 2021 08:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SO1JeZD+prSQ7WyrjqxTZfIfxtg1ME/49fxSx/MfbeU=;
 b=bEAjXgjLnLaA0MwMn6rlYKFMTo9Sa8FDG3she0AMmJFDmEnEDrQa5WE8IszGzXWQDw
 3eXWl/fRTRTgrsAS1GH1mDAdS4lEIzbCyRJHcU/Vdl0hTDv5Zuj57sYLrmbXLirRFkt8
 JVm10TW3CNpiCO3JKCq19/WWFe0LO8SRXcqC3Oj3J9oQnVjgFiaA2sv2yIigKLWQ+Ymb
 NbMp2/KCwSstP3Wt312g9twtVMIj9INKcNUdGbGENFiIkwIF0rjLyLH9yEG2Q0eNZNBD
 8iSOEBv3yUClipUuv90vuRnAMZvyNs9DZrBlU3JiizbKxuZp1r7FDc3SVWUTwQOMQ8nb
 2Zww==
X-Gm-Message-State: AOAM533VHDma8knuFEXoq279KjQQiZMTbY3NLfUVrKHI9JEf5sAPSRnp
 gA5JAe/pAsdG5Ov+mL8Xhy1Ntnskxh29fHwldNY=
X-Google-Smtp-Source: ABdhPJzmHT/n0lISZoeJtMpWln/4dUiLqfkUG3WtJfXA8i8iEMfKEc8sIVswpKnwlWgWdf8L4I/GsedoiP6Yl26y2EQ=
X-Received: by 2002:a67:ce90:: with SMTP id c16mr6942743vse.7.1629819301044;
 Tue, 24 Aug 2021 08:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210819154436.117798-1-krzysztof.kozlowski@canonical.com>
 <20210819154436.117798-6-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210819154436.117798-6-krzysztof.kozlowski@canonical.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Aug 2021 17:34:49 +0200
Message-ID: <CAMuHMdUkxRQks9B+QgExeogJQtLgVcMtXfsh50Xtsag-GfcjCA@mail.gmail.com>
Subject: Re: [PATCH 6/6] riscv: microchip: mpfs: drop unused pinctrl-names
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@wdc.com>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Linux MMC List <linux-mmc@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_083502_563433_DCB0420C 
X-CRM114-Status: GOOD (  16.89  )
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

On Thu, Aug 19, 2021 at 5:45 PM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> pinctrl-names without pinctrl-0 does not have any sense:
>
>   arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: sdhc@20008000: 'pinctrl-0' is a dependency of 'pinctrl-names'

Indeed, and pin control properties should be in the board .dts, not in the
SoC .dtsi.

> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

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
