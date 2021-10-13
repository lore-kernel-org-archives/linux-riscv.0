Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 458FFC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 08:28:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E8DF610C9
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 08:28:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E8DF610C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jl3LaLYsAlRjTd15XDOk+M/6UkMFazqX8iYXHM2mS5M=; b=3MUiPffF+n9xSD
	MNkbJrr8uSoNoMfpEqIrvn45YjCqgSx3TdKh3ub2UDP0o8+fh2llFKRhw+mU/0ch8/rxA6KiqY0kL
	GcMQx0VOl4+XWYvOJZmHu4yG9Etb1CZreXBU1j/qNv5etR0QYnzmQO4PPLj67J8hFdmyOJdNsFjpd
	8apD6su6PDW8ecLA3eOWS0gjnTru8zo2VFM/QpKmtOaXYUFmM1caVLDZWn49tfBvCI4uqx1wg4Lie
	Co22m6tcruc5yPqMFTJymPQeLEmV3ZEjiWuKVm+6cSopiQXUxO+7vTgbAjsIa2RJ/l1hVVAeRIv2/
	4a8lsSZIiNrc71Fc48rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maZcM-00FZMt-1g; Wed, 13 Oct 2021 08:28:06 +0000
Received: from mail-vk1-f170.google.com ([209.85.221.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maYKu-00FGgM-Bj
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 07:06:01 +0000
Received: by mail-vk1-f170.google.com with SMTP id o42so1360005vkf.9
 for <linux-riscv@lists.infradead.org>; Wed, 13 Oct 2021 00:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Le9QZPuNWHanoI4mM43dOJuIkLPwVhdbuEPDJXqaV0=;
 b=QGsnadXcA8XqZ7P6INYJ5lVKEvazyWqKkB2tfA2bAEHnHsA+BdWNYDyoiqIGRNm+oj
 bvQupzAR++ObbQHhdZXD2wLYTupft+xc+3Oe+o2MZZdeQbbgWXtAz2CQ81Oo3SlmCIfn
 3++grrMwOGC0Wj+q4zj2D7asrw/h6mTTIdLOUCXfsWastfdEgKrXGNdRat9qpEyefaF6
 pBgUCtuGYtLKZ3QE9vwpPQQA/ke6DCcvL5/mY66Axiu8ZFjJq1VvSIPcXZsulhpaR6kw
 Ng+vcZyfc76EUauPZrlr0d1ifanFeoKaAxQsPhaFUih3xeUcxWjmSc8kKHTwoFVN3oiP
 movQ==
X-Gm-Message-State: AOAM530SZxl+qPy4q/0789t8KSM/CUBeyzHZcrd/h05XOrg8gFUS39ZK
 ZHVqqbgbP34XgeglSFdLNgAkbpJzjXr4SF3MW68=
X-Google-Smtp-Source: ABdhPJwEa5NDkP57MCTKn5kzUR3aq+JEVBowsC/GEnWHnA8M9YW2ZrsM+SdOBCcoc14Elp0mTni+XsamiZ/lrTJkGX0=
X-Received: by 2002:a1f:3a4b:: with SMTP id h72mr31719119vka.19.1634108759159; 
 Wed, 13 Oct 2021 00:05:59 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk>
 <20211012134027.684712-4-kernel@esmil.dk>
In-Reply-To: <20211012134027.684712-4-kernel@esmil.dk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 Oct 2021 09:05:48 +0200
Message-ID: <CAMuHMdVA5h_Z27uo=czbQLatCe6-zOoBQGEeuooW2ExMHzGbmw@mail.gmail.com>
Subject: Re: [PATCH v1 03/16] dt-bindings: interrupt-controller: Add StarFive
 JH7100 plic
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Maximilian Luz <luzmaximilian@gmail.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Drew Fustini <drew@beagleboard.org>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_000600_436555_93426BF4 
X-CRM114-Status: GOOD (  15.34  )
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

On Tue, Oct 12, 2021 at 3:41 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> Add compatible string for StarFive JH7100 plic.
>
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>

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
