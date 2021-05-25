Return-Path: <SRS0=WUGv=KU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB125C2B9F8
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 09:06:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B5A76101E
	for <linux-riscv@archiver.kernel.org>; Tue, 25 May 2021 09:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6B5A76101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cocmqCnuGfHlfxCoczsP/ukVkV9mH80i5byBAVTR/lg=; b=GLmozBlL7lvEIY
	6uKXiWIYBxrwrI43pVWfzKAcFa4bndMMTDRHOvUCOltdM+c5q9+c0279ogWJGi+9fODD6HOSlYgp1
	DwSJ8YbskpTdfbQuUsRVC5+8X1k5kL5sdYgCp0CrycHvxyd27rRWtSH4+6Ws6ntvudqVJSm+VTCzg
	J3UBl6uZepU7/L1NejKFmJfqL1A54FEUgtEz39N2UPo0aNd2E28uLlE0HjY2Wydl6s4PWO+Fc8p9Y
	44UaWGoJz6KKex87utOUJvOhVhIAcMapiiDWPsgpbC6AoAP6LgmEgdMNnI03ACYF+tRXDe9srEJUB
	j6zPFAGwlzSNorQxPZlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llT1A-004HKB-8F; Tue, 25 May 2021 09:06:28 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1llT16-004HIK-O0
 for linux-riscv@lists.infradead.org; Tue, 25 May 2021 09:06:26 +0000
Received: by mail-ua1-x92f.google.com with SMTP id n61so10274835uan.2
 for <linux-riscv@lists.infradead.org>; Tue, 25 May 2021 02:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=W24PiGNXNex8TSJmeSkCuTzb+uJdL2zsMiFv8BFcFvc=;
 b=HZDJYKmF2kWGMUczQAf7ma7GkNX/N8HRLLGvXuz1bsSNCRPtdZu3EXxCcOyOSf85rR
 2+5IzEiRw6mSBNaqUZQSZILbj5l8TepV7yh1yRteMeIOSXAzSTACleiyI1U2/x4IML4b
 V/QFV3bz2ohxOh+9AwcpCiBBsuUFkdep4LpOSoQO/8V/LfiePEue6hTluOoNohrc/o+K
 M0bv/FoGoua8irhKUYw9RKSiMdnfD+3vBZc0XR9puX90dGNHGKPvlHS0KAKqxirRMCag
 IwvIx7aYUGf3kzlwZkjCgQexSo6Dp1Zr/Ost8X8MKIDrse+AI3BK24S8nhz1dgQL9fRH
 9Bxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W24PiGNXNex8TSJmeSkCuTzb+uJdL2zsMiFv8BFcFvc=;
 b=khRxNxsW4KUYcfeXVjOHIAm5qxCsWObXwFyX33LZwL9j9LSuAiY1KK5zZyJ+syrem+
 0e1PEBnErLnrT+MgbPbansdpamf78P0UhQCdM0SEbDsT39WDT0nyo+WnXAyqx578Hpqe
 fiTaiFwY3xsJj/5K/7CgUjeUOIn1trs6V+anEGjdHzmPorNLn48JC5DvQiEqhMq4RCpD
 sNAooNQ5PMxtobihxLg1F9Dv9eGHmtIOPSaYjBnTbcUsfx+Ny9f9BAaysWfrkULD827l
 Oc0M5/C9OvzQr2fRZItZRnpmH51xzjQzblvUeFpowzfKAakZvwXCzrowommexIQrLSUU
 DYQQ==
X-Gm-Message-State: AOAM532edCrHw77NRsBXU+lncOIp0NAsaKXqFM7yC3w686CaRLvttcyL
 7x7olUFg2gym0bfGhfMilrUpu+Hopm1RdyfgmkGyHw==
X-Google-Smtp-Source: ABdhPJxND4NykTeUoiZAJAAT0/jKOMNPPZs/Q6+XppZjXFFy+td+8fD27dD6EmHK4M+SeG97qhaTRwwMIQ17La85RMo=
X-Received: by 2002:ab0:12a:: with SMTP id 39mr26031839uak.19.1621933582381;
 Tue, 25 May 2021 02:06:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210517130823.796963-1-anup.patel@wdc.com>
 <20210517130823.796963-6-anup.patel@wdc.com>
 <CAPDyKFpxx-jBbL4o_iJCcivFL2ei5a7PcWVfUaBmLu-q89Mkjg@mail.gmail.com>
 <CAAhSdy1quHePY_HM875LHQgXGKrjm24SzeD5yFJUnqunpcHd8g@mail.gmail.com>
In-Reply-To: <CAAhSdy1quHePY_HM875LHQgXGKrjm24SzeD5yFJUnqunpcHd8g@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 25 May 2021 11:05:45 +0200
Message-ID: <CAPDyKFo9ZjiMBKFwe+F9-s_sReCneO42z8ppsBdkf3=jnarJ5A@mail.gmail.com>
Subject: Re: [RFC PATCH v4 5/8] cpuidle: Factor-out power domain related code
 from PSCI domain driver
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>, 
 Sandeep Tripathy <milun.tripathy@gmail.com>, Atish Patra <atish.patra@wdc.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Liush <liush@allwinnertech.com>, 
 DTML <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210525_020624_828095_674EE50D 
X-CRM114-Status: GOOD (  28.42  )
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

On Tue, 25 May 2021 at 07:39, Anup Patel <anup@brainfault.org> wrote:
>
> On Mon, May 24, 2021 at 11:31 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >
> > On Mon, 17 May 2021 at 15:10, Anup Patel <anup.patel@wdc.com> wrote:
> > >
> > > The generic power domain related code in PSCI domain driver is largely
> > > independent of PSCI and can be shared with RISC-V SBI domain driver
> > > hence we factor-out this code into dt_idle_genpd.c and dt_idle_genpd.h.
> > >
> > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> >
> > This is clearly a big step in the right direction. Just a couple minor
> > things, see more below.
> >
> > Note that, I have a couple of patches in the pipe for the
> > cpuidle-psci-domain driver (not ready to be posted). I need a couple
> > of more days to confirm this restructuring still makes sense beyond
> > these potential new changes. I will let you know as soon as I can with
> > the outcome.
>
> Sure, I will wait for more comments from you. I was thinking of sending
> next revision of patches sometime next week with the renaming of
> function names which you suggested.

Sounds good, that allows me a few more days this week.

>
> >
> > [...]
> >
> > > diff --git a/drivers/cpuidle/dt_idle_genpd.c b/drivers/cpuidle/dt_idle_genpd.c
> >
> > I think it would be a good idea to add a new section for this to the
> > MAINTAINERS file. Perhaps a "DT IDLE DOMAIN" section? Or perhaps you
> > have another idea?
> >
> > In any case, I am happy to continue with maintenance of this code,
> > even in the new restructured form.
>
> Yes, a separate "DT IDLE DOMAIN" section in MAINTAINERS file
> sounds good to me.
>
> Anyway the dt_idle_genpd is factored-out code from cpuidle-psci-domain.c
> so I suggest you to maintain dt_idle_genpd as well.
>
> Do you want me to add a "DT IDLE DOMAIN" section in the
> MAINTAINERS file as part of this patch ??

Yeah, that works for me. Perhaps extend it to .. PM DOMAIN though.

[...]

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
