Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DCF7C2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 20:52:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A42562068D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 20:52:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hxgjvM6O";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="zZSrg3tv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A42562068D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QgC0B7D1S+bUM+m5K/4sYbVHr6iczD72YgPJAfRQmJc=; b=hxgjvM6O+qQfFKTJ6bf8nYDGM
	6NZEux1UfRSbn9XUF5YW9hhxHgZIM7ArNUzhIL5U/eWfY5EAUtM/9c1LrhdGfXV3yvG8TtfH86ytg
	9z+DQUYxccnHziJf3Z+5kD90D8m6dtMlXtHmqKmGqcp7DO53/WTN89wYIdhB8InKchUVQkcwiz8Em
	iYS5P1YyEHGmCsb/yZCG8CS8OnTpm/+Lu2KqVsyno2LsDi72ZXUB1O5iBBqzqNnRoCevCX+5SMj1X
	x5O4d/hLPXvglRRXxCz0BrrPQn22GfQRxm6+iPpQ7RC+yZvWD3xYRVPVQL2nj4Xu/OLHC9SHw9B8K
	2VwfgZgzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcE9d-0005UF-GB; Mon, 09 Nov 2020 20:52:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcE9a-0005TH-LO
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 20:52:43 +0000
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8D50B221FF
 for <linux-riscv@lists.infradead.org>; Mon,  9 Nov 2020 20:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604955161;
 bh=D2C0dwhvGc/byaIhEDmOPOOvSRn49LYfvX5fua57lQU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=zZSrg3tvNee2ietU2BpJkGBKg/kzb2mddFoYf98vEp4qdGqMDk//tKMvlLoVGSLOC
 jyajCyn85Hvzt+jWYbMNDEm7FsGVuDKSf4enMv4N166pyV7R554+HlcgaiYUbVbDdb
 wRPyA6Kdam7lkVaDQsa/y8BFBXXw0QAmETjyz+6k=
Received: by mail-ot1-f45.google.com with SMTP id y22so10333973oti.10
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 12:52:41 -0800 (PST)
X-Gm-Message-State: AOAM531wC92/iVLvhFcsSXqm9TK05nf0ZP1+6/mdEtzifwG92L8nshy/
 s5dFQK24CIVkHpJjKDIELH8QNP/h6B9ZV+TZNA==
X-Google-Smtp-Source: ABdhPJxOhi7q2TyR1cU1bUXAG1nazgiWne5zeC8nU0nRaw0X6g9uRWTSp5SOeyBKdMyk9NnV3n4OJCWoPencr/BRt0Q=
X-Received: by 2002:a9d:5e14:: with SMTP id d20mr10925302oti.107.1604955160785; 
 Mon, 09 Nov 2020 12:52:40 -0800 (PST)
MIME-Version: 1.0
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-2-damien.lemoal@wdc.com>
 <CAHp75VfvUZ6h+JGCUQ65i7qFsugvbd3n=aCprgvp=geRSpQEhQ@mail.gmail.com>
 <20201109174450.myombn5skpj5wcxh@mobilestation>
In-Reply-To: <20201109174450.myombn5skpj5wcxh@mobilestation>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 9 Nov 2020 14:52:29 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+sz09YWxpyM_tBbvJzidbARUVF2fvxMe-SS666WvNRBQ@mail.gmail.com>
Message-ID: <CAL_Jsq+sz09YWxpyM_tBbvJzidbARUVF2fvxMe-SS666WvNRBQ@mail.gmail.com>
Subject: Re: [PATCH 01/32] of: Fix property supplier parsing
To: Serge Semin <fancer.lancer@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_155242_919696_EA6DB267 
X-CRM114-Status: GOOD (  25.63  )
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
 Linus Walleij <linus.walleij@linaro.org>,
 linux-spi <linux-spi@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Sean Anderson <seanga2@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Nov 9, 2020 at 11:45 AM Serge Semin <fancer.lancer@gmail.com> wrote:
>
> Hello Andy,
>
> On Mon, Nov 09, 2020 at 05:14:21PM +0200, Andy Shevchenko wrote:
> > On Sat, Nov 7, 2020 at 10:14 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
> >
> > > @@ -1308,7 +1308,6 @@ DEFINE_SIMPLE_PROP(pinctrl7, "pinctrl-7", NULL)
> > >  DEFINE_SIMPLE_PROP(pinctrl8, "pinctrl-8", NULL)
> > >  DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
> > >  DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
> > > -DEFINE_SUFFIX_PROP(gpios, "-gpios", "#gpio-cells")
> >
> > Sorry, but the above doesn't sound right to me.
> > It's a generic code and you may imagine how many systems you broke by
> > this change.
>
> Damien replaced the macro above with the code below (your removed it from your
> message):
>
> +static struct device_node *parse_gpios(struct device_node *np,
> +                                      const char *prop_name, int index)
> +{
> +       /*
> +        * Quirck for the DesignWare gpio-dwapb GPIO driver which defines
> +        * the "snps,nr-gpios" property to indicate the total number of GPIOs
> +        * available. As this conflict with "xx-gpios" reference properties,
> +        * ignore it.
> +        */
> +       if (strcmp(prop_name, "snps,nr-gpios") == 0)
> +               return NULL;
> +
> +       return parse_suffix_prop_cells(np, prop_name, index,
> +                                      "-gpios", "#gpio-cells");
> +}
>
> So AFAICS removing the macro shouldn't cause any problem.
>
> My concern was whether the quirk has been really needed. As I said the
> "snps,nr-gpios" property has been marked as deprecated in favor of the standard
> "ngpios" one. Due to the problem noted by Damien any deprecated property
> utilization will cause the DW APB SSI DT-nodes probe malfunction. That
> though implicitly but is supposed to encourage people to provide fixes for
> the dts-files with the deprecated property replaced with "ngpios".

May be deprecated, but we've still got 53 cases in upstream dts files.
Plus changing doesn't work well for new DT with old kernels unless we
backport 'ngpios' support.

> On the other hand an encouragement based on breaking the kernel doesn't seem a
> good solution. So as I see it either we should accept the solution provided by
> Damien, or replace it with a series of fixes for all dts-es with DW APB SSI
> DT-node defined. I suggest to hear the OF-subsystem maintainers out what
> solution would they prefer.

I'd suggest making failing to parse a warning rather than an error.
The devlink stuff is off by default anyways and is still changing.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
