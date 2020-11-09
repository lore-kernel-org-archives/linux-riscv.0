Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131B1C388F7
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 14:40:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99BAF206D8
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 14:40:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E7Blt7Xv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ip3BVgMK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99BAF206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+w/fgjD1Aui3Wq1X7RlJGY9mfbPkVP2ZRauHh0To8ok=; b=E7Blt7XvjtnB0VeZ+h/lBEh4k
	eqBFcG5/nM9lGP0e2NTgiB2+nMwWvKYHzm+GcBfNzm5BhdwRZbXe4XDUGiDSDdNMn6i5/1Ns9NJlk
	no590YeQ8E1X2Syqafnm1cSIzxKawl7UNprzRo0kd45/752qF48Sqq2BuUWFPzftPDvyFf0PMaJKH
	mLow0X8HAL1kKD1cq+UEw4GPU9GvxjFCKIHPVoBrg5txzaLRk6ctO1bBoeD36XY6P8pcO2YgOp2rl
	O6kBLxUc19hPlPncg82Df+QPLjrbu2sA3hxfZmd1j0W1L62SRAEfk/5GuIZ4RRapYqXfJqeeU12ej
	FQ2mkg0fQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc8Lb-0006FS-Qe; Mon, 09 Nov 2020 14:40:43 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc8LZ-0006Ek-D7
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 14:40:42 +0000
Received: by mail-pg1-x541.google.com with SMTP id 62so7291487pgg.12
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 06:40:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D35EDlDK16EWIltc01Yrg7/CsfVYBQcvvB8Ix+TT1us=;
 b=ip3BVgMKiauzd4a5fsf1ODx3qhmqLy8nttnSg5raPkaWQx8GjNJL+QhxhnUhWds9us
 OZStQB/ulbYJ3bslooxV9GsmwOwtAa6iavQrUWVkWhsZEC5ZcnchA9U7avBEJia20ymF
 /q+3MKFL4RH4/SRzyLE2dFSPINGxmc59RlVXmaKM5XE/YSS8k9oEDn8+81AVro5zT3og
 KHO7qAQm0GlxcFcFCD+QGCRXBUuXLbbk/fUHuCWkUe8zwbjlY3XQXcam+yzU3AdHSdnJ
 dVENfBn4851dtJ3MzTRVjuHOcr2mLKNMKs2dwuLSVJ4/XpyQkgcb/PffPSJV/wqpabv2
 flGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D35EDlDK16EWIltc01Yrg7/CsfVYBQcvvB8Ix+TT1us=;
 b=oMBnmoVK2Jrm8nvSqpbtfNqw7EIEXyhhZEP0RqLzC5kS6Gx9gWpwJl7Uy8NM4zgvO5
 JjnQ9CA5c5vKmQzX5Jsdvi1pntZOBWv7xnIbEilzz08i6VaI4Ow/c/ekqtiZBmMAzYDj
 DpYoCcOkRqi81fWZy7y9c6li8mRE+ZDsy/EjB/wMwEf1eJwKuKiO7V9tXGTYRXtDlB3/
 FlcFj53b/+DC9Af1Rk9RYIea8/Hjricv2lQ3RupfzsxE73JtTU9EmmcQJ57lr5EpsXuP
 R9mx0H376dYoOBDnG3nhYVBEJ5MmX3WBVgfeNq8saVQujlpjuB+TB8AlFY+bmJFtfJBd
 9R4g==
X-Gm-Message-State: AOAM532vs2ZnxkHmZKugxyohdeTqOeusuzXi5+bwm1CcBq1hfLy+d9fb
 gvgVTbecQAPY3jsPDmC+QPgOkgxHTZCTclhCFyo=
X-Google-Smtp-Source: ABdhPJxYLSKMi85uilQdG9UgvG5aiuKo/w+WnpjA83tGtKFNeV1eTUaT5WzTkYcsgycY2IhuNNcZK/y5O7B7qM4p5C8=
X-Received: by 2002:aa7:8c4f:0:b029:18b:f361:4aa3 with SMTP id
 e15-20020aa78c4f0000b029018bf3614aa3mr7824997pfd.73.1604932839518; Mon, 09
 Nov 2020 06:40:39 -0800 (PST)
MIME-Version: 1.0
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-3-damien.lemoal@wdc.com>
 <20201109142529.tt5ojjyn36vd3ohe@mobilestation>
 <6dc6d52e-a39d-c351-5280-71b9e8eafe37@gmail.com>
 <CAHp75VejtoTRAM1JmGib3OaJwzuw9Bb-qb08+XhdZUOuzTGUKw@mail.gmail.com>
In-Reply-To: <CAHp75VejtoTRAM1JmGib3OaJwzuw9Bb-qb08+XhdZUOuzTGUKw@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 9 Nov 2020 16:41:28 +0200
Message-ID: <CAHp75Vc+h5PCqBUnyFshw8RE4zWusE+zdvKKSxBxfFw1_5k0vQ@mail.gmail.com>
Subject: Re: [PATCH 02/32] spi: dw: Add support for 32-bits ctrlr0 layout
To: Sean Anderson <seanga2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_094041_510200_45EEA3DA 
X-CRM114-Status: GOOD (  20.80  )
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, Stephen Boyd <sboyd@kernel.org>,
 Mark Brown <broonie@kernel.org>, Serge Semin <fancer.lancer@gmail.com>,
 linux-spi <linux-spi@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org,
 Frank Rowand <frowand.list@gmail.com>, linux-clk <linux-clk@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 9, 2020 at 4:40 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Nov 9, 2020 at 4:34 PM Sean Anderson <seanga2@gmail.com> wrote:
> > On 11/9/20 9:25 AM, Serge Semin wrote:
> > > On Sat, Nov 07, 2020 at 05:13:50PM +0900, Damien Le Moal wrote:
>
> ...
>
> > > Are you sure they have been moved from [0, 3] to [16, 20]? I don't have the
> > > manual for the 4.0x version of the core, but according to this patch:
> > > https://patchwork.kernel.org/project/spi-devel-general/patch/1575907443-26377-7-git-send-email-wan.ahmad.zainie.wan.mohamad@intel.com/
> > > it has been ok to use the lowest four bits for DFS setting. Is the commit
> > > message misleading there?
> >
> > This commit message is a truncated version of [1].
>
> I don't see how they are related.

For DW_ssi v1.x DFS is always for transfers up to 32-bit.

> > Importantly, DFS is
> > valid when SSI_MAX_XFER_SIZE=16. When it =32, then DFS_32 must be used
> > (since DFS is constant 0xF). Since SSI_MAX_XFER_SIZE is a synthesis
> > parameter, there exist devices where DFS must be used, and also where
> > DFS_32 must be used.
> >
> > [1] https://patchwork.ozlabs.org/project/uboot/patch/20201016225755.302659-10-seanga2@gmail.com/



-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
