Return-Path: <SRS0=64xR=EM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ED9DC388F2
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 09:25:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D233F20936
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Nov 2020 09:25:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2vpNj5MK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QuNKss5T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D233F20936
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ne4o5Fw73KBLXxhU9FxGHCSNEzTFJyMvQMDTYLWiJFA=; b=2vpNj5MKDUb5EUOgaIRAo1vMG
	oBbXFYAQymc3VSd7siBd6VIB1B8N2rvLmHkg3L0mG9R8RyjMEoYcwJ68Pcy+XT1pt2X6aYQR7+66d
	ZvM2sL+nb496fYVWoHqhdhetuCTwossKn81ig6+w7DQI7ejOfgb1PesU1lwETbihChpXYyZiWz45m
	s54WivmUcsqP4OfF16wrECH8+NW+A2Lxa7a4nzBrME8sZ3+1jG9olBhJqYUx0e1r6oYSqJuVE8NIO
	HVB7e5MoKmJyWTCNcQWNvBqqw0TCNjSY7t+0b/rfl7DByE/z/YC1M35RDDkaUL4rETSqfCucwj1H5
	nQBiOAhDQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaxzZ-0008Lb-1G; Fri, 06 Nov 2020 09:25:09 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaxzV-0008Js-Pv
 for linux-riscv@lists.infradead.org; Fri, 06 Nov 2020 09:25:06 +0000
Received: by mail-pg1-x544.google.com with SMTP id h6so495391pgk.4
 for <linux-riscv@lists.infradead.org>; Fri, 06 Nov 2020 01:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n6HjZO68eJwzCsb2ucSZ6B0XskEpVkwnHnaVuGbEBd8=;
 b=QuNKss5T6V8FATdlBUmjBheEfwGufC9Y1UXzYxDMTiEZvLAF7bCfcmGRDg8qSEQQel
 k3Nr9/fy6sJq5zzk3JFXFtN8YKFdHddgd5g5XTmbg820WhVQzZ/NHmxYen7Bj1sqQ8g5
 ssFqfy7JYnuSngNiv0wzXDRRDSTxa+nSRr5xt0hYxk6DA/B3MBj71YH8Bbd+aJg/0euL
 SV1IPLw3rjRdUBk49mYnCTKifNjQiTxnW+0FUgdLNwwviK5kpawTb4n1Bnvbu5Dh3oAY
 pbRRwgtwO1N16x1599ipby+zECVNEvDKnYUU4Nkp9YZyy2i8cO95DboiTrH4NWyW1+Z7
 homQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n6HjZO68eJwzCsb2ucSZ6B0XskEpVkwnHnaVuGbEBd8=;
 b=Qa2M6lhbmLHtDwrpuInDkEFt17fwN+nGWSCqn2POuwWs3kRIHlqmX2WI4C0dzwqNM4
 RTuVzvOeAcXjjeHoWJjN0gqk2Hsyu3ys/A5xe1j3z+3+8OAK2vlu8ajv4mtYoQz4o1/q
 WFr3O3QGq0qaPWh9fg+4nWaRLwGTCPZGytqI1i+ksQozuSCx3tyuW4vtFuivk34KqJOx
 lHbOb2HnTdhe5IwpXIm3tMd+K/PmVIn9jOCQuAbStHV0ugLlkLynmJjM4bdEuZsVLGOQ
 sP0FzHcmZ9MICuvGLZsFNq8KWwZGE/qlQf1X6sQQCAGpeH/N3/f1Tg8X8t/wkbcwjX5A
 TTZw==
X-Gm-Message-State: AOAM53370GEWGN/rLtTkcDDkq5h8f6Rl2ccjjPlO6LEAzEWFXDgdtbsy
 jT2kM1btRG8qynOaPYjMiU2KU5CttPxw590itQc=
X-Google-Smtp-Source: ABdhPJwFBbWhc/ajqSlGOcas2h9EZH9QHYpwErKY1RO0qZxDIbkxawo5JL2nnS7meQZOjB9qgm3lQKPxILJL90d9kUw=
X-Received: by 2002:a62:343:0:b029:15c:e33c:faff with SMTP id
 64-20020a6203430000b029015ce33cfaffmr1037118pfd.7.1604654703797; Fri, 06 Nov
 2020 01:25:03 -0800 (PST)
MIME-Version: 1.0
References: <802c8865b70c3bdf70e44d37f14e7767b6495e88.1604631371.git.greentime.hu@sifive.com>
In-Reply-To: <802c8865b70c3bdf70e44d37f14e7767b6495e88.1604631371.git.greentime.hu@sifive.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 6 Nov 2020 11:24:47 +0200
Message-ID: <CAHp75VdHuZc43Oe8vp-Xtb2+vsEoV2FY-W_dAifuh4Un0BveSA@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] gpio: sifive: To get gpio irq offset from device
 tree data
To: Greentime Hu <greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_042505_999266_AFD1B355 
X-CRM114-Status: GOOD (  12.96  )
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
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Yash Shah <yash.shah@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Nov 6, 2020 at 4:59 AM Greentime Hu <greentime.hu@sifive.com> wrote:
>
> We can get hwirq number of the gpio by its irq_data->hwirq so that we don't
> need to add more macros for different platforms. This patch is tested in
> SiFive Unleashed board and SiFive Unmatched board.

...

> +       struct sifive_gpio *chip = gpiochip_get_data(gc);
> +       struct irq_data *d = irq_get_irq_data(chip->irq_number[child]);

> +       *parent = d->hwirq;

There is an API to get hwirq.

...

> +       for (i = 0; i < ngpio; i++)
> +               chip->irq_number[i] = irq_of_parse_and_map(node, i);

Can't you use platform_get_irq_optional()?



-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
