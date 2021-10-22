Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56DD0C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 13:39:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 165386112F
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 13:39:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 165386112F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y6WtXjMJUt8phe8vENIaFl8LJKX1JLWEZZlAycaL/IU=; b=HU7xfDbwW5PdQU
	rL80t+3LqRBhW6J65BgZ4Iq8BHxST9edTqVbiCgMx5LpFogLschYHmcra6F/Dd4aOUHRxSNGuU7+r
	zyhGZwMkFbgvL6h1Q6xl6eyq8dETVrQHAG6RhesAjUqDNFyHVC0rLOCXwbPsmc1+1LwdQ/DWIxO5e
	eKG0DwMN1FZZbbQK3GIEDn2NXr2NmqqsJ8gmdFd8sx2p0TxhlZfp8KykenOLDjmRylJAjFngkVg5m
	mo40m7lw4t8Y9TYge4YSowgDDkagSwYpCAQouvbM7HYIjGijmfVT0V4Zg6Vd0BNWklwB8daC8Vti+
	HYUoZKad9eXKqSnEzKNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdulS-00B8Gr-3M; Fri, 22 Oct 2021 13:39:18 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdulO-00B8G8-86
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 13:39:15 +0000
Received: by mail-ed1-x533.google.com with SMTP id u13so2340642edy.10
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 06:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jjH1AZkHzisZEzNDajZXWL4sIkWjjuq3q0O7XBT8vcY=;
 b=dSvMQAZry0z5cEHt2WuRSPjcgGK+3Gp+e1imsJ9W9jh0QUfeKNpp3oE3jthG+9ITG/
 IZDd/O+iU4Kl+/BYsKzWOMkm6FZo3vLXOWjJzI13PE6sEQGI/1t3oyR55iGB1y1s5T/i
 kJsgfkb7+5Eet/XIbMefWNtmKC82xC4P7F5X6WSK7KE1g6tZf/sA65Yl6+q2eZsNv2G2
 71Hz+8sba+4c+fe1pxBHHMbQIC7HaDv7vuipzeuisgPvxuqXA+wXuv48D0eFsV21SQ9N
 FX1jeSEu/wt28mVP8alksjDR/FIRiQu+eAJJhLgCeW1XSHBU3830aC8eeatj1pKrIgaQ
 KrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jjH1AZkHzisZEzNDajZXWL4sIkWjjuq3q0O7XBT8vcY=;
 b=WjJ4kfnkdhb504wTn30kkr91kwf21jWqhd6jGxf3kRPX9ov0Gtno3/bUKJA7hJK/78
 ic6AkROXz87WZD5hO2tr2jnXOkearTdbH4cNk0T+xef5c734evUXdJHVUPQ5JyyWw3ec
 IKThZ4M5Nujt1hfx8c3Zv9KExZuTitNH0w3VPQ+N48L7DNqP6qTI02/clwM9xB4cCM+z
 ZlMpWQL7Q7P/pl1ryruJj/t1P6UVHptrZGja86LQkeg4LwWU7rBj+QPbKQ/3B5do/4Pt
 YH9/0O3ZpZMfkdBZSf18FFNJ33BlzgDR23zA3bu6lQF4xjWT+HxcmcvhOydV1dWUurM5
 Nnwg==
X-Gm-Message-State: AOAM533Xo9/zTscpXMVgU9kMP7H1oYdGaqYmH4f+yyDIBmjb0TCX4Qrm
 X8jEviaJixw8Jnm9W1LZ10JRuRZXUr6EIUT3FqL1GRFDDAQtPfNS
X-Google-Smtp-Source: ABdhPJxH5Qrtm/RWOE5LyJWihUvlgo6g/2IV76oa7WETtiadA6OP/8uW7eZKfFIregk0grROWeVw/hpM6ldeQgVrdNs=
X-Received: by 2002:a17:906:eb86:: with SMTP id
 mh6mr15592741ejb.141.1634909949961; 
 Fri, 22 Oct 2021 06:39:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-10-kernel@esmil.dk>
 <CAHp75VcUv6WH0--FANpRExCdEOJNVo8KCtJ2Go090=FZq-Y0UQ@mail.gmail.com>
 <CANBLGcysKdqo+FioSkhd1PZRLzPF=fRJrCTsUGR7vXcn2WpYHg@mail.gmail.com>
In-Reply-To: <CANBLGcysKdqo+FioSkhd1PZRLzPF=fRJrCTsUGR7vXcn2WpYHg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 22 Oct 2021 16:38:14 +0300
Message-ID: <CAHp75VditKnEcPKgqxz7NfG3ZWLZCu=pW=8qw7HS_iWePTj5Qw@mail.gmail.com>
Subject: Re: [PATCH v2 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
To: Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 devicetree <devicetree@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
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
 Drew Fustini <drew@beagleboard.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michael Zhu <michael.zhu@starfivetech.com>, Fu Wei <tekkamanninja@gmail.com>, 
 Anup Patel <anup.patel@wdc.com>, Atish Patra <atish.patra@wdc.com>, 
 Matteo Croce <mcroce@microsoft.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_063914_328254_9EE4B911 
X-CRM114-Status: GOOD (  15.07  )
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

On Fri, Oct 22, 2021 at 4:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Fri, 22 Oct 2021 at 14:56, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Thu, Oct 21, 2021 at 8:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > Why all these ugly % 32 against constants?
>
> Because the JH7100_RST_ values goes higher than 31. There is a
> BIT_MASK macro, but that does % BITS_PER_LONG and this is a 64bit
> machine.

And? It's exactly what you have to use!

...

> > Can you convert this to simple
> >
> >   if (assert)
> >     ret = readl_...
> >   else
> >     ret = readl_...
> >
> > below?
>
> I don't see how that would work. We're using the done value in in the
> readl_poll_timeout. Maybe you can be a bit more explicit.

Supply done either == mask or == ^mask. Try it.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
