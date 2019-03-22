Return-Path: <SRS0=cI7w=RZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82B0FC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 06:01:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51961213F2
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 06:01:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QIt2/bk6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="RdxyEV2q"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51961213F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DdhJOtzDbfrIHC1SXpTISOPdNI1aFnxBrZ9h58cJSNA=; b=QIt2/bk6gOQGu2
	x1h5LIrfqQhlKjw3gLKsJz4YcRWf07lOgLHVLJfzUj3Ar9WBhuNzWvCXdxzXhetiApNHxgrIxSL/E
	fck4q1g7Ip7E2S1/2ygtOH0dMcYYLrh9ca1TaOeNxIo5KGdFYGrGfd/waujqiEuJp6itJZ/HIHphm
	/1Cbd7xtzLMtSnPQsKii65ikzAOHcxEOb++WvdwRFOSvU7du3MPEzzI0stfcPap6FWZP38YWMPuAp
	CS8nJ/1hIx1odqU7bcrLdwilSrA6RSLv2KenbCa/xkDkb2HmH0HvRzGwa7um/4Le/noH7/t1WsJVM
	eJ0tx2zZBm8WwX3wfjyg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7DFR-0004LK-Tz; Fri, 22 Mar 2019 06:01:45 +0000
Received: from mail-lf1-x143.google.com ([2a00:1450:4864:20::143])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7DFO-0004KJ-UO
 for linux-riscv@lists.infradead.org; Fri, 22 Mar 2019 06:01:44 +0000
Received: by mail-lf1-x143.google.com with SMTP id 5so530929lft.12
 for <linux-riscv@lists.infradead.org>; Thu, 21 Mar 2019 23:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Pzuvn3kB50GPLaliBlOtU4DbSAi8LjYbJJOGPno2nJg=;
 b=RdxyEV2qm2CG1bVNJ5mQShnba0e0EWlTtM6ISw31DgKMbmnVpbXV6AIjUqJmhiXPRi
 2DmvCdsYXrT9y2eMX4+ppXlPuuWDhlk+ADmdZ7tgC1fM3FqqhpFk65J+EqCz8ZvCj7qE
 01t7VGx7s6qu1gLAIXZ3CeDmuHJ3OTbrVDdPiM3VaW3RhWGnvvMZuOYQxwn8NYJYFizh
 gQHt/XB5kBSZGz3kvcdk9HSiauaCbY9XXag9K2qtFqkv54+l5HMf0nfOO5wlgRr54Ez1
 lxOJQa0x0XSVzDxxxxz4o+BAWgGmOc1zzjlhIS14YXxHTlBNZaWsTnXnzg1UuNZ62D0u
 kUiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Pzuvn3kB50GPLaliBlOtU4DbSAi8LjYbJJOGPno2nJg=;
 b=HhbpiF9cCIR70XSg7Eq12esREGHadHl1n7O4zb3fo/gryeg6UuoJjDnMRI54pE0e9s
 F/krxh+/Bl2H0kuUrTcZE3JsNged2L/bNeuoq/yDDeBcysAfo1vgUNaD8/EiNcuA0c50
 G3a5Mnpx2n+rXLwpO2Qw9CEMORWaiLhU5zMTCqoYAC0+L4LAQ6QONz+7iGEJoXCm95zb
 Y/jCjC4EHMR/E/EUr3+WzcMSm11X3cGpvlj04zxmCDR5DiOgy/1YagqHrCCi2XwS+l5U
 cq6bbNG5UReKzIK4OzF43BtuIIDBjXoIWrxpOTzpoA0rTkTbQSqEJ+tvhWxpIatNIZHl
 4hHA==
X-Gm-Message-State: APjAAAVcldGIygnkcBcHBeKsQlJIwjH/q82waECJUifEsFljkLhKYeyR
 VgzyerGGf6p8w3nCc7+pQQW1nNC0bO7V6trxKs9HJA==
X-Google-Smtp-Source: APXvYqwgD/OVNs4C7yzuPn/z3e06Z9lmDVUv/8aRXYjqaK3aYJ4eOBJt+CxcoNAzmm6anFQelTb3SEDQbP6UvVECrhY=
X-Received: by 2002:ac2:48b7:: with SMTP id u23mr223754lfg.115.1553234496157; 
 Thu, 21 Mar 2019 23:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <1553082728-9232-1-git-send-email-yash.shah@sifive.com>
 <1553082728-9232-3-git-send-email-yash.shah@sifive.com>
 <20190321133340.GB7047@nazgul.tnic>
In-Reply-To: <20190321133340.GB7047@nazgul.tnic>
From: Yash Shah <yash.shah@sifive.com>
Date: Fri, 22 Mar 2019 11:30:59 +0530
Message-ID: <CAJ2_jOHBHXrVHyVdd7+pDYDyb2sT3iL4W=FhYVCvxG_rx+3ZyQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] edac: sifive: Add EDAC driver for SiFive FU540-C000
 chip
To: Borislav Petkov <bp@alien8.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190321_230142_984077_6022F606 
X-CRM114-Status: GOOD (  26.36  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, aou@eecs.berkeley.edu,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Sachin Ghadi <sachin.ghadi@sifive.com>, robh+dt@kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 mchehab@kernel.org, linux-edac@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Mar 21, 2019 at 7:03 PM Borislav Petkov <bp@alien8.de> wrote:
>
> On Wed, Mar 20, 2019 at 05:22:08PM +0530, Yash Shah wrote:
> > This EDAC driver supports:
> > - Initial configuration reporting on bootup via debug logs
> > - ECC event monitoring and reporting through the EDAC framework
> > - ECC event injection
> >
> > This driver is partially based on pnd2_edac.c and altera_edac.c
> >
> > Initially L2 Cache controller is added as a subcomponent to
> > this EDAC driver.
> >
> > Signed-off-by: Yash Shah <yash.shah@sifive.com>
>
> ...
>
> > diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
> > index e286b5b..112d9d1 100644
> > --- a/drivers/edac/Kconfig
> > +++ b/drivers/edac/Kconfig
> > @@ -440,6 +440,19 @@ config EDAC_ALTERA_SDMMC
> >         Support for error detection and correction on the
> >         Altera SDMMC FIFO Memory for Altera SoCs.
> >
> > +config EDAC_SIFIVE
> > +     tristate "Sifive ECC"
> > +     depends on RISCV
> > +     help
> > +       Support for error detection and correction on the SiFive SoCs.
> > +
> > +config EDAC_SIFIVE_L2
>
> That config item is unused. Drop it.

Sure, will drop it.

> > +static irqreturn_t sifive_edac_l2_int_handler(int irq, void *device)
> > +{
> > +     struct edac_device_ctl_info *dci =
> > +                                     (struct edac_device_ctl_info *)device;
>
> No ugly linebreaks like that - just let it stick out even if it is > 80
> cols long.

Ok. Will let it stick out.

> > +
> > +/*
> > + * sifive_edac_device_probe()
> > + *   This is a generic EDAC device driver that will support
> > + *   various SiFive memory devices as well as the memories
> > + *   for other peripherals. Module specific initialization is
> > + *   done by passing the function index in the device tree.
>
> This comment doesn't have anything to do with that function but rather
> belongs at the top of this file.

Will move it at the top.

>
> > + */
> > +static int sifive_edac_device_probe(struct platform_device *pdev)
> > +{
> > +     struct edac_device_ctl_info *dci;
> > +     struct sifive_edac_device_dev *drvdata;
> > +     int rc, i;
> > +     struct resource *res;
> > +     void __iomem *baseaddr;
> > +     struct device_node *np = pdev->dev.of_node;
> > +     char *ecc_name = (char *)np->name;
> > +     static int dev_instance;
>
> Please sort function local variables declaration in a reverse christmas
> tree order:
>
>         <type_a> longest_variable_name;
>         <type_b> shorter_var_name;
>         <type_c> even_shorter;
>         <type_d> i;
>

Sure, will be done.

> > +
> > +     rc = edac_device_add_device(dci);
> > +     if (rc) {
> > +             dev_err(&pdev->dev, "failed to register with EDAC core\n");
> > +             goto del_edac_device;
> > +     }
>
> Call setup_sifive_debug() in the success case here so that you don't
> have to teardown below.

Ok.

>
> > +
> > +     return rc;
> > +
> > +del_edac_device:
> > +     teardown_sifive_debug();
> > +     edac_device_del_device(&pdev->dev);
> > +     edac_device_free_ctl_info(dci);
>
> Those three can be replaced by a call to sifive_edac_device_remove() ?

Since now there won't be a need to teardown, I will stick with this
(bottom two function calls).

>
> Btw, you have prefixed your static functions with "sifive_edac_" which
> doesn't make much sense and you have long names for no good reason.

Will remove the prefix "sifive_edac_" on static functions wherever feasible.

> > +static struct platform_driver sifive_edac_device_driver = {
> > +     .driver = {
> > +              .name = "sifive_edac_device",
>
> "device"? I think it is clear that it is a device and thus kinda
> tautological. "sifive_edac" should be enough...

Sure. Will keep it just "sifive_edac"

>
> Last but not least, building this driver with the riscv64 cross compilers from
> here:
>
> http://cdn.kernel.org/pub/tools/crosstool/files/bin/
>
> fails like below. With the riscv32 compiler it fails the same.
>
> Provided I'm not doing anything wrong, you should not be sending me
> half-baked stuff which doesn't even build.

Sorry about that. It fails if configured as 'module'.
I intended this driver to be built-in only hence I never came across
these errors while testing.
I somehow missed it in Kconfig file.
I will make the correction in Kconfig (change 'tristate' to 'bool')
and make sure everything builds fine.

> --
> Regards/Gruss,
>     Boris.

Thanks for your comments.

- Yash

>
> ECO tip #101: Trim your mails when you reply.
> --

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
