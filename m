Return-Path: <SRS0=Id5u=PK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C1B5C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 14:51:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33DA260F02
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Oct 2021 14:51:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33DA260F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G5N/r9wNo7jRuGXrMmijm5uhXED93jzZ6Pgck/5X/jQ=; b=ZPAu7rut3dZho4
	QyGmfSx/qMyN7KYOxKKugr2h+JiqUTWsy4Bh0KmrYcAUFuHbFmluFMpOZdECsl0lvpRJNlapX6PCr
	7L+oSSUvmGQ010/kTjnpE80ro05rspIgudA72WSdfRLgtn98lTLBVjh+kv7pPyxOo65CRk30ur4UY
	nXMFnCqNCum3Vz8Y6FEjDXYuWxOt3oOUoKMcvp7MQyIistLL6jHVerKxDj2DdNjp7GZp9lPO0zOsV
	YxN+z/Vmzs/HTidWBmhxVsFzU7U+uN2LzAIc4ozvugT+rMV9vlJCMP8Wvm9x1RA9oVRcYvM9qsgMS
	29cCORaJwwlAahFTjoqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdvtR-00BJuZ-Du; Fri, 22 Oct 2021 14:51:37 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdvtP-00BJtt-45
 for linux-riscv@lists.infradead.org; Fri, 22 Oct 2021 14:51:36 +0000
Received: by mail-ed1-x536.google.com with SMTP id u13so14947edy.10
 for <linux-riscv@lists.infradead.org>; Fri, 22 Oct 2021 07:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U2zlxllI/wA4AeNFHkhcnXvhZJof18yvz4lRtA/A0Ck=;
 b=O4t+iAMSPLWSK3+8w7xF6PGGAwtgvxGdQmcmffBt8Spyk6Y9G+W4+EOcW7y51Ca0kK
 wt6rbnP8vcLn/MdTKOwRy1QRAEzWTHDOIcASOln3ZzYkt+RtjEaTNZSX+K+waaMFOaCR
 EP9FnRrb4A1y/L/LVMoSTpGfj6uMp+E9O1khixqfDXLglxUShkYXh2HIZNQLYGacsbqO
 59XRg+blwjSxXkN/Ol5qstsGst4lnIgU3fT9S2nrWah4ggPyDkpGmyArri6Px2HdLNAs
 w2LIFhzYxGOQx1NJMvezYrw6Ls/E/G7HiG+dOfmr0YkXjdAJI3N0vblHW0o9bTptmElp
 BC6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U2zlxllI/wA4AeNFHkhcnXvhZJof18yvz4lRtA/A0Ck=;
 b=hXVZ9b+rgwUl6/e5rTL1V16RIbNd2KvuaH9xlAJF3cBBT4elEKqGpxE2Iq0mAKl/p3
 KspZ1QJFGpUJQspvPfUMpiFnM1gv7nWFf48maRuOnJtJ0W0t0LR4xMAqti+K1F27bZU3
 qHrvMD/XPXIAIwUC88dnwu1Gc4gIxWxLcyvjQnPs28pxx8EwRoVxqsTi/Lbyx4DgQygz
 AmM1vWxlL9cI0MyDVC6x5nHaIfHXcujh2f8m/CVrkk10ZeGf8Fd8hp2fgwvE3wj5c2YN
 5eTQZaked4L8ps6hGDLXMkh9c5ahDvDDMvTMsd8l6vmKfttxJG+Y9p0fY4AunoL/ePzJ
 INiA==
X-Gm-Message-State: AOAM531CnuwNwvFaVmBn4rAC+EKiNLdwDwBD11A7kaTjpb9r9kPRRFxg
 iPV5/f1bxBfR4ldzYFvDgLRhS7ZOEE06n7rUzc0=
X-Google-Smtp-Source: ABdhPJzui1ybEtPFbAKFluoha+ME1JAVGAZslCUhtsKJWtrMojGSkFrSchg6cjyG+w3foBFnnPouMdQjjvq6ufKJHTo=
X-Received: by 2002:a05:6402:2031:: with SMTP id
 ay17mr607386edb.240.1634914293101; 
 Fri, 22 Oct 2021 07:51:33 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-10-kernel@esmil.dk>
 <CAHp75VcUv6WH0--FANpRExCdEOJNVo8KCtJ2Go090=FZq-Y0UQ@mail.gmail.com>
 <CANBLGcysKdqo+FioSkhd1PZRLzPF=fRJrCTsUGR7vXcn2WpYHg@mail.gmail.com>
 <CAHp75VditKnEcPKgqxz7NfG3ZWLZCu=pW=8qw7HS_iWePTj5Qw@mail.gmail.com>
 <CANBLGcyaSgbOgA4u_QivUQicyZ0MuUmrSsPq56OAANsav8R=VQ@mail.gmail.com>
 <CAHp75Vf=fGn33JFa-8UwCzv7A6AgHdnvfoabKnCcuKZxOyWX2Q@mail.gmail.com>
In-Reply-To: <CAHp75Vf=fGn33JFa-8UwCzv7A6AgHdnvfoabKnCcuKZxOyWX2Q@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 22 Oct 2021 17:50:37 +0300
Message-ID: <CAHp75Vfbc6Fj31cHsj5YoeO6Yeuz1hE+DNCu7ggVX32pCk=PqA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211022_075135_186157_69CBEE7F 
X-CRM114-Status: UNSURE (   9.84  )
X-CRM114-Notice: Please train this message.
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

On Fri, Oct 22, 2021 at 5:49 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Oct 22, 2021 at 5:25 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> See gpio-xilinx and gpio-pca953x on how to use bitmaps in the GPIO drivers.

It might be confusing, what I meant is take that as an example on how
the bitmaps are used in the GPIO drivers.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
