Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB723C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 16:25:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B063361B62
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 16:25:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B063361B62
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TRxzrqERHybxk/S8LqRT39SGBHkt3JXx3SRJA2jOLhU=; b=n9ttSCOm//Dg6s
	53aaNXRM5XsxSMM+/88O28SS2UOD58DBm3lsZm0c3SlDUBB3RzL6c3YVLXqPwSoL4BRWe4OxoeaRT
	tF2Lm4Ifk2MJVxNMQUXjhNg6KttQtCNHvkMJBXlFfQa0h2Y55iTHAr1+59HvoHUCt7KBJp4/YFDEx
	v+uWz0Qj3BiZ8LHkOAM/e0W28w+Fl/9fTNl78j7aDX8u9XXFGCSzqE4WWCs05Aw5TGppiFz0oHf28
	mb+9WjONYu+W/kOefjdpctxQBVgxPm6lMffTR9KtoL/rBaJFPd0gTlqson88fivPEqmYLd3Ra4ob3
	E7gsgeNMesTeHnzpWpzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mn1Gy-002KBY-3z; Tue, 16 Nov 2021 16:25:28 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mn1Gv-002KAR-Jq
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 16:25:26 +0000
Received: by mail-ed1-x534.google.com with SMTP id z10so63908751edc.11
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 08:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q88psRCm5CJ7gKksPQ7q1UXlzh7VhWtfPRNOkpoGNsw=;
 b=kfiUOtAuB5auAwn6AVDVpys4wB6g0I2bSAC0FIHN3DpPvqcIlOSTeoC1oGWMueVfym
 RmnYtoARlWHc+I4MY3t5a9LQztqWjJwtu6lEpY5zkkPMdRpO7cHOSeg8iFoqKM1m7tL9
 /sMZVW+2uoSK/wvjjEFrcJDv230PSSB9Y8nAd/iihG+dRUmbjm+Dz6MqaWqMADWUxvPz
 EXhI5fOuNlLnOftgovf0Mhz1o6peHH1ZzFNE8ApE9z84vdYBCSqO2O7inmeyowTQOOJ1
 NjutVAiljTVNpv0UqG7zOKG/GqNg9FYzUS972bTDhPxONhK4539hCCLVe09RWrrqLAOJ
 5dOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q88psRCm5CJ7gKksPQ7q1UXlzh7VhWtfPRNOkpoGNsw=;
 b=f+wwErq7VZrvI670VasU4KWM2zlLRQ4mlK0yq1HliSr6nllBHgTqWMhdbq9YkxbCuo
 9kTBFarAp5g4vvpdQ7y7rqmL4lzNxwytY6T6jNpOf7Ud86XAF2YH5+rrkxnFh0DxDKoF
 r1KYh4URfTj5qj/nZipWya5f0mwLfleFAzdNYoUUb3OhpUuXTg61n6FAH9r0wigMvEPt
 9fgCN0g1ooHplOlCS4FqjikTONP5NGiiuzHA72auS5F70r9BsiU8tK7mM+cybOwGb/zH
 USd5fFnA/HpCZJgz+Qy3KIroh7trb4pmSRCEkaPc5DjsiFvHRadjh7Wz3TNhbGRcn65Y
 shzQ==
X-Gm-Message-State: AOAM532YOVoPnv0XYde8jX5WK/1DAgMBz/8RukYFivMEMiOzxrGcAv+0
 wYkyOhPMxpDyLfkqWdv/ffUZg5x7osDEB6ONxFg=
X-Google-Smtp-Source: ABdhPJw6thu0W4I08er21OMHvXTqHCmRke36jRJTw4oXoQF/f+U0K4R8gl9a4RxuiOpRyHKj2w6qLkAgCbzfL6d5hyk=
X-Received: by 2002:a50:9ec9:: with SMTP id a67mr11550144edf.238.1637079923561; 
 Tue, 16 Nov 2021 08:25:23 -0800 (PST)
MIME-Version: 1.0
References: <20211116150119.2171-1-kernel@esmil.dk>
 <20211116150119.2171-10-kernel@esmil.dk>
 <CAHp75VcUziRv4_U9aDfKu2SKnqj1dab7y+N90tw0JaEKxWW_wQ@mail.gmail.com>
 <CANBLGcz-sRBVGDc2sLtuTdwUesi4QDgB9yCZqhZpMfF6f5dReg@mail.gmail.com>
 <CAHp75VdJ1xZ8ZGSwjKdvcQzkyfTKcEDzVBLkhdh-Vp3Cx=HdBA@mail.gmail.com>
In-Reply-To: <CAHp75VdJ1xZ8ZGSwjKdvcQzkyfTKcEDzVBLkhdh-Vp3Cx=HdBA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 16 Nov 2021 18:24:42 +0200
Message-ID: <CAHp75VcX-RRjEwK_4GjoXwsgM_Uz5foXTXA7E8rUZm_px1ZTOg@mail.gmail.com>
Subject: Re: [PATCH v4 09/16] reset: starfive-jh7100: Add StarFive JH7100
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
 Anup Patel <anup.patel@wdc.com>, Matteo Croce <mcroce@microsoft.com>,
 Arnd Bergmann <arnd@arndb.de>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_082525_691461_66E6CEBE 
X-CRM114-Status: GOOD (  10.28  )
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

On Tue, Nov 16, 2021 at 6:21 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Nov 16, 2021 at 6:06 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Tue, 16 Nov 2021 at 17:01, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Tue, Nov 16, 2021 at 5:06 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

> Maybe at the end of the day simple use of u64 will be better than bitmap.
> Up to you, you have got the idea. Either way you may put my tag.

At least I see pros of the current solution that it won't read more
registers than needed.

P.S. And do not add that guy to the Cc list, I think people are
already annoyed by bounces.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
