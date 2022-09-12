Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B275CECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Sep 2022 06:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VIgsEwJCDFBeZ0Rt2Lq6wqXnBrEXSIYWGuQSbYRL3hU=; b=XoR9yHbTQdKyZd
	WhX5xG9qK4LaDk2fprl7dwLeQbZEBnxkXtaHN3KTAfSYqvqBmelY+LmPMiln6P9JvU/jHmI8MByO1
	Xwbh1UKka8LekTk7XlWSwfZuR4UUU4rjL7/rqKNWRISOOp3u/0NiGWvtm7bCl+7HViWn/vlonp6FV
	vISqAXvp6n6v9WX4Q3CLmub2zVnFBZHRg6A7O9RpKb/RCT/1rFF1GILX0WHhkiaiEfCOySvlrIuyK
	Lvb9gntTpJV+nFhQKAwxf7PFFtYI3K9emkPmOAAsGkIU5MxG3RGIb6xeZmjPOvTYMMrldkibfckoA
	QHYQe1mrGq5i9HkwkJwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXd84-007HLy-23; Mon, 12 Sep 2022 06:41:12 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXd81-007HKH-2B
	for linux-riscv@lists.infradead.org; Mon, 12 Sep 2022 06:41:11 +0000
Received: by mail-lj1-x22b.google.com with SMTP id by6so9347208ljb.11
        for <linux-riscv@lists.infradead.org>; Sun, 11 Sep 2022 23:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=IUm/MN9hYg83su7ZYahLGm5MEwsIsG/QUzjstSeG6Mo=;
        b=kI34oFaT/0WS4Cfj03tST6nGUpXjNT380JwZ8FEdZt75QHxAkIIf6k0og+uTwf9eTq
         NucX3cDSq5+0xiCS0rQXRopsfEykwrDtmoLfDq5k1ccgq58Ym+3kbNX/k38bz/lnJhfd
         a5yFamW9SM3CFIxVNuRbQoPP7Su31yvXtOON777PIstuoMTTkLMqG/H/F6ObCibwPlCQ
         NEH3rmwq85391FHz4YrWGLtUoGLzBJgCcB04MAVXh/Kel3ysSkw/tN011zrV6s6epDp5
         IE+auP7GxK133EIlSC8Ez0IiUkBvtfxpVv8in9PJQMvU6spqLCbJIYuXosuQfHsL3edu
         xQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=IUm/MN9hYg83su7ZYahLGm5MEwsIsG/QUzjstSeG6Mo=;
        b=2Mz1js4pc5EB0nE1sr7kAMndiGpqFQnBkWVjZlBZg4J+sLhjg/pE8+zb8mY3zu6vYu
         EFhNORpExJyp7MMERZLAwRB3nOuxd7h+gY0BUEbV1HfExyahCOC+TtY54MFYLKSBLA8s
         MJqFqgT2r4Bbx1UgG7HztJyVNRh7TdHsrkmzcn/CHbYNiKtu2aYLTyoIxvbIXk9UuGWo
         fJpjbjP4A6PMM6BA7I8nxIMslbLiYbCs2fOqgemzULdcmecYpiClZ3fN/56ON4ELuPDp
         cXMCM3QQIwC60IUTZfkN5zG+MIH5m6YbmRHWQF/PniIqb4e4NaWXezjasxR+gitOdBYK
         dgxQ==
X-Gm-Message-State: ACgBeo1vqi6HwN87qk4Uorce0lbTJM2NzeNToHRsQe7Cd7Bh5p9XKlvP
	bSzgceIYNZaQvwVyXNezqHqJV5SNdljV8WWstMx0Ag==
X-Google-Smtp-Source: AA6agR5s2whA7uWOJa+KmUu83OmHts4XhTJeLfLamvGr/SSqHLqGGJ3PE6/vnSEQ3bawMQV3MgXyResxjLGZLowFb1s=
X-Received: by 2002:a2e:7314:0:b0:26a:ca18:60eb with SMTP id
 o20-20020a2e7314000000b0026aca1860ebmr6790851ljc.69.1662964866499; Sun, 11
 Sep 2022 23:41:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220908144424.4232-1-zong.li@sifive.com> <20220908144424.4232-6-zong.li@sifive.com>
 <36fe0073-7fa2-9733-7041-d9f70da1a5ea@microchip.com>
In-Reply-To: <36fe0073-7fa2-9733-7041-d9f70da1a5ea@microchip.com>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 12 Sep 2022 14:40:55 +0800
Message-ID: <CANXhq0rRZhPtrpRQOnwbJj-GRVSCHErLxvGnPAxqfJBk8rNRPQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] soc: sifive: ccache: use pr_fmt() to remove
 CCACHE: prefixes
To: Conor Dooley <Conor.Dooley@microchip.com>
Cc: Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski+dt@linaro.org, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Greentime Hu <greentime.hu@sifive.com>, 
	Ben Dooks <ben.dooks@sifive.com>, bp@alien8.de, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	linux-edac@vger.kernel.org, 
	"linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220911_234109_229597_E0C1637C 
X-CRM114-Status: GOOD (  24.41  )
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

On Fri, Sep 9, 2022 at 2:40 AM <Conor.Dooley@microchip.com> wrote:
>
> On 08/09/2022 15:44, Zong Li wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > From: Ben Dooks <ben.dooks@sifive.com>
> >
> > Use the pr_fmt() macro to prefix all the output with "CCACHE:"
> > to avoid having to write it out each time, or make a large diff
> > when the next change comes along.
> >
> > Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> btw, I think Ben missed a print - a pr_err() in init().
>

I got that one, I will fix it in v4

> > ---
> >  drivers/soc/sifive/sifive_ccache.c | 15 +++++++++------
> >  1 file changed, 9 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
> > index 58d14f11a63a..b3929c4d6d5b 100644
> > --- a/drivers/soc/sifive/sifive_ccache.c
> > +++ b/drivers/soc/sifive/sifive_ccache.c
> > @@ -5,6 +5,9 @@
> >   * Copyright (C) 2018-2022 SiFive, Inc.
> >   *
> >   */
> > +
> > +#define pr_fmt(fmt) "CCACHE: " fmt
> > +
> >  #include <linux/debugfs.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/of_irq.h>
> > @@ -85,13 +88,13 @@ static void ccache_config_read(void)
> >
> >         cfg = readl(ccache_base + SIFIVE_CCACHE_CONFIG);
> >
> > -       pr_info("CCACHE: %u banks, %u ways, sets/bank=%llu, bytes/block=%llu\n",
> > +       pr_info("%u banks, %u ways, sets/bank=%llu, bytes/block=%llu\n",
> >                 (cfg & 0xff), (cfg >> 8) & 0xff,
> >                 BIT_ULL((cfg >> 16) & 0xff),
> >                 BIT_ULL((cfg >> 24) & 0xff));
> >
> >         cfg = readl(ccache_base + SIFIVE_CCACHE_WAYENABLE);
> > -       pr_info("CCACHE: Index of the largest way enabled: %u\n", cfg);
> > +       pr_info("Index of the largest way enabled: %u\n", cfg);
> >  }
> >
> >  static const struct of_device_id sifive_ccache_ids[] = {
> > @@ -155,7 +158,7 @@ static irqreturn_t ccache_int_handler(int irq, void *device)
> >         if (irq == g_irq[DIR_CORR]) {
> >                 add_h = readl(ccache_base + SIFIVE_CCACHE_DIRECCFIX_HIGH);
> >                 add_l = readl(ccache_base + SIFIVE_CCACHE_DIRECCFIX_LOW);
> > -               pr_err("CCACHE: DirError @ 0x%08X.%08X\n", add_h, add_l);
> > +               pr_err("DirError @ 0x%08X.%08X\n", add_h, add_l);
> >                 /* Reading this register clears the DirError interrupt sig */
> >                 readl(ccache_base + SIFIVE_CCACHE_DIRECCFIX_COUNT);
> >                 atomic_notifier_call_chain(&ccache_err_chain,
> > @@ -175,7 +178,7 @@ static irqreturn_t ccache_int_handler(int irq, void *device)
> >         if (irq == g_irq[DATA_CORR]) {
> >                 add_h = readl(ccache_base + SIFIVE_CCACHE_DATECCFIX_HIGH);
> >                 add_l = readl(ccache_base + SIFIVE_CCACHE_DATECCFIX_LOW);
> > -               pr_err("CCACHE: DataError @ 0x%08X.%08X\n", add_h, add_l);
> > +               pr_err("DataError @ 0x%08X.%08X\n", add_h, add_l);
> >                 /* Reading this register clears the DataError interrupt sig */
> >                 readl(ccache_base + SIFIVE_CCACHE_DATECCFIX_COUNT);
> >                 atomic_notifier_call_chain(&ccache_err_chain,
> > @@ -185,7 +188,7 @@ static irqreturn_t ccache_int_handler(int irq, void *device)
> >         if (irq == g_irq[DATA_UNCORR]) {
> >                 add_h = readl(ccache_base + SIFIVE_CCACHE_DATECCFAIL_HIGH);
> >                 add_l = readl(ccache_base + SIFIVE_CCACHE_DATECCFAIL_LOW);
> > -               pr_err("CCACHE: DataFail @ 0x%08X.%08X\n", add_h, add_l);
> > +               pr_err("DataFail @ 0x%08X.%08X\n", add_h, add_l);
> >                 /* Reading this register clears the DataFail interrupt sig */
> >                 readl(ccache_base + SIFIVE_CCACHE_DATECCFAIL_COUNT);
> >                 atomic_notifier_call_chain(&ccache_err_chain,
> > @@ -227,7 +230,7 @@ static int __init sifive_ccache_init(void)
> >                 rc = request_irq(g_irq[i], ccache_int_handler, 0, "ccache_ecc",
> >                                  NULL);
> >                 if (rc) {
> > -                       pr_err("CCACHE: Could not request IRQ %d\n", g_irq[i]);
> > +                       pr_err("Could not request IRQ %d\n", g_irq[i]);
> >                         return rc;
> >                 }
> >         }
> > --
> > 2.17.1
> >
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
