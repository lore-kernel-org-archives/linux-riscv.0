Return-Path: <SRS0=VVci=OL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F5F0C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 11:20:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0BDF60EC0
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Sep 2021 11:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0BDF60EC0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6DLSGBF028vB1miPhF9rOV5yVMEIAbQNCMYEgCkvZrg=; b=U+sqxk1hLsvNb6
	Q/10YKNsT+RzeQorOC+rUGvNTUJXuWFBUgIe/XjW6eHpCc3+P5mh8Jb3BrepVD0vzVW8svjy1HllJ
	bB8eGv1r70ABBSuN9MT28lK7dYa31u8tGXrhgvkYxBuR1t7E+Yu7jtR5HH+/+uRlKVkEAB/epm6v5
	s8C67Xv2/StTx3gaY0Tt0N1hl1BCrsobzmws1qbZoA0VxZugsyGt/bR6xU/gerT1nNEi9YEBgCGZN
	gqGpze+JjT4OjVG61U7TF3v5ylUuTcLMLuK4yqAS/95Ds+230UFuPjIPlIuZQXPr6pL3cksir2qg0
	XJU3oZG7h5Wbb/mMXayg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSdot-004M6k-NF; Tue, 21 Sep 2021 11:20:15 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSdor-004M6E-17
 for linux-riscv@lists.infradead.org; Tue, 21 Sep 2021 11:20:14 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CE64A3F32A
 for <linux-riscv@lists.infradead.org>; Tue, 21 Sep 2021 11:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632223211;
 bh=MjesVevkYIqX1GQ7DanAgbDwI571QgAHXDgwfVLZUzk=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=OyUhrziLcDFlH7MmAr5uOEFZZUXtAIS77FEtEKNx+Vkm11az0J54tFv0LRJ9wT9DN
 HJOL+H8xohwKPPqqTVr/P7lOwUt8ZHxsQdwRxNjey+IvVlo0JfTEpy3j/Z8oib3rq9
 r6FMcZG/VDN+iSqFsyHng/DDAonB7BSnE79jHRaChgckDWXsEC0m6Yy7E2v6mR1WFm
 KTs4DqMvwtser2kMDRI4C4NBRsNz/rscu7IMytNaMdrKWU3zxeaEUlbdnr5Y5blH+T
 BrtAtNs85LD4L1kHBKSdBu3v8gfwKeG8CKWt9OpqwRzysuF+qa5cnnqVrqD5AFwleK
 H6qUJcFsJkvdA==
Received: by mail-ed1-f71.google.com with SMTP id
 s12-20020a05640217cc00b003cde58450f1so18795651edy.9
 for <linux-riscv@lists.infradead.org>; Tue, 21 Sep 2021 04:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MjesVevkYIqX1GQ7DanAgbDwI571QgAHXDgwfVLZUzk=;
 b=FxE0taGfvEksVq6bkeUrBouI1A9s/OLfjnBzrSwo5aI+ItRTst48m279dtUE6Agqib
 4kDcToUl+BkrSI8Gn8DuLHec28sWd5/6Slofc9aR+aMwUtQVpN4Nb1Xmqxz01mt/ZrmU
 chApBNNbT7osri3fMyI+nNA2eIslaM/sWbqGYy6isiGbvm8zhagvGPkKst81Z0VhngXe
 5AhC3+22/DOMYwCO3vNTnhmnULH0qU26dF3psffCLZw0p7H+eOwjv2smyBGWH62D3AgJ
 TByt9tV7HgCmd2lOo6QTXnAA4EsqELJgeMOZSLsym7pCRe/574dXZELreDeEDO9Sg9Bw
 g2kQ==
X-Gm-Message-State: AOAM530NszvQmcsE1gupKy/DU5IpHPwwOQ7Jhf57pmz9OlNhBm+/wjVr
 6K16wefl3jU/SgIUXzbbjJLviAhfoqqdQsCg1B6WJ0DFrNpkP2QkV0TqBj7roozORRVOMKu8NyB
 RGUum9aihnT3qozZ1TzZ2y5fTtF/4IG5KmUEouEgcQ6nHG2bUEX5+2dZZuw8lzQ==
X-Received: by 2002:a17:906:8981:: with SMTP id
 gg1mr34363650ejc.95.1632223211460; 
 Tue, 21 Sep 2021 04:20:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzy1Zml1lG/L7siYipoWZFKyg+Vw32nqM/rZd7PNcGFYuxpgdmkEWCLjGp8N6QGPtYWTGqstZeGuhBNqGpURJw=
X-Received: by 2002:a17:906:8981:: with SMTP id
 gg1mr34363627ejc.95.1632223211220; 
 Tue, 21 Sep 2021 04:20:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210921053356.1705833-1-alexandre.ghiti@canonical.com>
 <CAAhSdy07KzQnTH+ad4esxtfhogzpXQagY8KeDkq1Kc81-Z33Yw@mail.gmail.com>
In-Reply-To: <CAAhSdy07KzQnTH+ad4esxtfhogzpXQagY8KeDkq1Kc81-Z33Yw@mail.gmail.com>
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Date: Tue, 21 Sep 2021 13:20:00 +0200
Message-ID: <CA+zEjCsFG31kcM89B6LfP32Kh7WTHxzU6zvxigmKrDheKkU2fQ@mail.gmail.com>
Subject: Re: [PATCH] drivers: mfd: da9063: Add restart notifier implementation
To: Anup Patel <anup@brainfault.org>
Cc: Support Opensource <support.opensource@diasemi.com>,
 Lee Jones <lee.jones@linaro.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_042013_254587_1AFBA046 
X-CRM114-Status: GOOD (  24.39  )
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

I chose a priority lower than the one you proposed in your SRST series
(https://lkml.org/lkml/2021/6/9/620).

Alex

On Tue, Sep 21, 2021 at 12:17 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Tue, Sep 21, 2021 at 11:04 AM Alexandre Ghiti
> <alexandre.ghiti@canonical.com> wrote:
> >
> > The SiFive Unmatched board uses the da9063 PMIC for reset: add a restart
> > notifier that will execute a small i2c sequence allowing to reset the
> > board.
> >
> > The original implementation comes from Marcus Comstedt and Anders Montonen
> > (https://forums.sifive.com/t/reboot-command/4721/28).
> >
> > Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> > ---
> >  drivers/mfd/da9063-core.c       | 25 +++++++++++++++++++++++++
> >  include/linux/mfd/da9063/core.h |  3 +++
> >  2 files changed, 28 insertions(+)
> >
> > diff --git a/drivers/mfd/da9063-core.c b/drivers/mfd/da9063-core.c
> > index df407c3afce3..c87b8d611f20 100644
> > --- a/drivers/mfd/da9063-core.c
> > +++ b/drivers/mfd/da9063-core.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/mutex.h>
> >  #include <linux/mfd/core.h>
> >  #include <linux/regmap.h>
> > +#include <linux/reboot.h>
> >
> >  #include <linux/mfd/da9063/core.h>
> >  #include <linux/mfd/da9063/registers.h>
> > @@ -158,6 +159,18 @@ static int da9063_clear_fault_log(struct da9063 *da9063)
> >         return ret;
> >  }
> >
> > +static int da9063_restart_notify(struct notifier_block *this,
> > +                                unsigned long mode, void *cmd)
> > +{
> > +       struct da9063 *da9063 = container_of(this, struct da9063, restart_handler);
> > +
> > +       regmap_write(da9063->regmap, DA9063_REG_PAGE_CON, 0x00);
> > +       regmap_write(da9063->regmap, DA9063_REG_CONTROL_F, 0x04);
> > +       regmap_write(da9063->regmap, DA9063_REG_CONTROL_A, 0x68);
> > +
> > +       return NOTIFY_DONE;
> > +}
> > +
> >  int da9063_device_init(struct da9063 *da9063, unsigned int irq)
> >  {
> >         int ret;
> > @@ -197,6 +210,18 @@ int da9063_device_init(struct da9063 *da9063, unsigned int irq)
> >                 }
> >         }
> >
> > +       da9063->restart_handler.notifier_call = da9063_restart_notify;
> > +       da9063->restart_handler.priority = 128;
>
> How was this priority value chosen ?
>
> I mean, we will be having SBI SRST as well so we should choose
> a priority value lower than what we choose for SBI SRST handler.
>
> Regards,
> Anup
>
> > +       ret = register_restart_handler(&da9063->restart_handler);
> > +       if (ret) {
> > +               dev_err(da9063->dev, "Failed to register restart handler\n");
> > +               return ret;
> > +       }
> > +
> > +       devm_add_action(da9063->dev,
> > +                       (void (*)(void *))unregister_restart_handler,
> > +                       &da9063->restart_handler);
> > +
> >         return ret;
> >  }
> >
> > diff --git a/include/linux/mfd/da9063/core.h b/include/linux/mfd/da9063/core.h
> > index fa7a43f02f27..1b20c498e340 100644
> > --- a/include/linux/mfd/da9063/core.h
> > +++ b/include/linux/mfd/da9063/core.h
> > @@ -85,6 +85,9 @@ struct da9063 {
> >         int             chip_irq;
> >         unsigned int    irq_base;
> >         struct regmap_irq_chip_data *regmap_irq;
> > +
> > +       /* Restart */
> > +       struct notifier_block restart_handler;
> >  };
> >
> >  int da9063_device_init(struct da9063 *da9063, unsigned int irq);
> > --
> > 2.30.2
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
