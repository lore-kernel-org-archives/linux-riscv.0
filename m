Return-Path: <SRS0=jfOo=MI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 396B8C07E95
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 12:50:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D35C6613F2
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jul 2021 12:50:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D35C6613F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HGiy9iAJMNYkVfZzib7CLnE67sU2IrupnTatY1MRu54=; b=Ul8RdKScPv5Q/c
	izFN26CDmqEj+aFS/3xoj7O9S8iBpvxaZkZ5B3P0d8XxLueBGYQ104CZGxxkYB7heXo0Q1eKnq48u
	+sFd6jhFUBU6HxOvVnswBT9pyvpCfgD2olAYw2j1HgeImexuRXM4AakJ6Yu2NESkS5AMmqJJmRn5a
	nwEx/wR4GgYUMZ1CWVBEIVxUIdxfS7WJjE/TvFpYqvR6I4dYN8y2dgxbJKOwits1fmt5W24GYMAY2
	wPl/w0De3UZRvV7grXCcx5X1JyuHD1Zp2G9xI0vV4VIhDySp+szA9OexnNBUbqOiQNJrv4CDinMjL
	6t2gvpcT6aGk9ssnRC+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4NHt-004OE1-W2; Fri, 16 Jul 2021 12:49:54 +0000
Received: from mail-vs1-f52.google.com ([209.85.217.52])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4NHr-004OCy-Su
 for linux-riscv@lists.infradead.org; Fri, 16 Jul 2021 12:49:53 +0000
Received: by mail-vs1-f52.google.com with SMTP id f4so4901009vsh.11
 for <linux-riscv@lists.infradead.org>; Fri, 16 Jul 2021 05:49:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QPzYoNGuofUoO3zXko6ZHL58ZO0oCjn9vuEYCFE9//o=;
 b=XqDNHfsQQUQyEdsPyeMbMx4izvXWbJ4b2rPSUeiEYJ9lyfNErrp/hCei8ZHBCJppPA
 8KTSyBNHZqJFHWLDSXfK6tN+S92aIT8fOgSgi02R8JxL4a/1Bhc2VrsAsBDQdqE2RGkm
 v8/Pxy1krNQ9HBXmBgWtToTmySb28Be0wNBoFXRPDVY34ds1exMx4Jr/nAIY04KXABt+
 zHaPDwTnyBuimcT5Mk3BQW6M2/hmB1bZc6ZIyR5OA3LQ1WPDbcw9LyAlh0HCSVCer0D2
 oJZVNwEBh2zkxRctgFj0vQt1xiybQ0tmenI87SkU8u1cI7vkQnIjSJ/d64uDcDSwDHJR
 KV1w==
X-Gm-Message-State: AOAM532jbCpXJn+D7A0d1RhlhLOxp+FzfiQkls6lwV9CfJfRBoVaNBzX
 t5P/pbbtGUzAUD3kz6C1H2MiXaNkjmVjyU7q8WA=
X-Google-Smtp-Source: ABdhPJwIse8RhEmkKEyZTYSOZAvcDB1SPGaj0VAhHhLN3bATCm1G9lUEhBmRL33PiglvWeQ1iiyT6GwNThVzmxmb9Ow=
X-Received: by 2002:a05:6102:321c:: with SMTP id
 r28mr12049640vsf.40.1626439790812; 
 Fri, 16 Jul 2021 05:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
 <1607403341-57214-8-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1607403341-57214-8-git-send-email-yash.shah@sifive.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Jul 2021 14:49:39 +0200
Message-ID: <CAMuHMdW74DsiqyLCYyWSosZmwVEqPiAWNV2i6m4LWzz0868fbg@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] riscv: dts: add initial support for the SiFive
 FU740-C000 SoC
To: Yash Shah <yash.shah@sifive.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_054951_987320_83BA7393 
X-CRM114-Status: GOOD (  23.80  )
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

Hi Yash,

On Tue, Dec 8, 2020 at 5:57 AM Yash Shah <yash.shah@sifive.com> wrote:
> Add initial support for the SiFive FU540-C000 SoC. FU740-C000 is built
> around the SiFIve U7 Core Complex and a TileLink interconnect.
>
> This file is expected to grow as more device drivers are added to the
> kernel.
>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>

Thanks for your patch, which became commit 57985788158a5a6b ("riscv:
dts: add initial support for the SiFive FU740-C000 SoC").

> --- /dev/null
> +++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> @@ -0,0 +1,293 @@

> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               cpu0: cpu@0 {
> +                       compatible = "sifive,bullet0", "riscv";

I'm wondering why you're using

    compatible = "sifive,bullet0", "riscv";

According to your own commit 75e6d7248efccc2b ("dt-bindings: riscv:
Update DT binding docs to support SiFive FU740 SoC"), it should be

    compatible = "sifive,u74-mc", "riscv";

instead.

Likewise, the older arch/riscv/boot/dts/sifive/fu540-c000.dtsi is using

    compatible = "sifive,e51", "sifive,rocket0", "riscv";

and

    compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";

but according to the DT bindings the rocket part should not be present.

Is there any specific reason for that?
Should the DT bindings and/or the DTS files be fixed?

Thanks!

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
