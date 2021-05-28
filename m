Return-Path: <SRS0=2wW0=KX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5A7C4708C
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 09:27:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB6636127A
	for <linux-riscv@archiver.kernel.org>; Fri, 28 May 2021 09:27:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB6636127A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2p3ADjADBC91TmLr7U6CVY1qQseL6CVjbhCZXG8oyO8=; b=utbhe01PhWwnYE
	qI5Mw8PBXOfd6L4dYj41k+H2p5z6zlOfaxqH75YVkOJF1c88tRRUM6QqnEtzLP9hdHr57yMdevCoi
	NPBn2+5kOC1Gmw0k8LU4Rq3DVEoaW1M+TUl4SYVn4ZYgOjceGPwpUyxAlqJvLl/srjpRVH+eCgQcg
	FCHjiq+ZDdxHsWqCGvYU19JNLQ/9PsUBq4QVqDyT8JGjQ5SE3HlXm5JGSpoz4czHrs1CSKUep7zqy
	n66XZzL9oUPuXYofQGQn2aIUbsnh7898zmPNTjcps9UFEEzrroe9VGaMsF0Qmj6T9YJUbElV19F1O
	6EtwedgVWekXTxOY+glw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmYlg-00DsVl-Fn; Fri, 28 May 2021 09:27:00 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmYlc-00DsRk-VG
 for linux-riscv@lists.infradead.org; Fri, 28 May 2021 09:26:58 +0000
Received: by mail-vs1-xe34.google.com with SMTP id x2so1837064vss.3
 for <linux-riscv@lists.infradead.org>; Fri, 28 May 2021 02:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lSrNJA8L2mfz3nzO0xWuQ7uzakK2R6vwdeEdePCtnq0=;
 b=vbGvnUB2ee8gN6kCb1QtHqgW5zdRB/De+4KKFZ3odYzssoqcORAziKqW3t/dl5074O
 MU02ZAwhTEUhcC5GUqskXZmCEId1/j/GxI7mGj/gxuVqU58+5iq4Y2yDNbcYUTl26J3N
 tbXjR0gcPStSOp+5QLfk9jCopcLRrqm5guRDC9vvuQFHJtwfckd9Ppz9E1l1wm616a2T
 ZcZLfN6Qm0Rv2NNVDqP1+Hatk0Lg2TWStZE5z3nPwyCjU0KcgkQIHgBPgHBpFdIUtOgr
 S30CVnx1+6dBR9MmULejbnwv+VnAT0/VQj2bym9pbKn1rthEPbbuloD9QHkEY4WO8vNo
 uUZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lSrNJA8L2mfz3nzO0xWuQ7uzakK2R6vwdeEdePCtnq0=;
 b=UmeHOmFONhBhVFE9Wjkqc7snT4LXldjl6ktyLpgZ2vYOVjwoCBCXyfntmmTlDV3An5
 r8gJYUMHJCVzJFaBGA+duqn4VVXS/9c3KORFol8YWlkeiiceF2KH04jcdGjcWsHh3PE3
 LCBP1kH2qTryl7e4njZbNG74YuoOEacbBu4/uCHcnXLTZEZOFfxw9woPPfY3muZ5qwtB
 ifTrhu42p/0kLKhNDoxzo0N+16Bw4PvUIXuolCNvA2fwXNo6Enb64UmXRZidcR9Nase2
 FjV0PB7pOYrqPm3hrgcY5T9Rh/5T8HlKRR3nruopBxELb3pxLQ0prTth1LlgNeB4omwH
 1sVg==
X-Gm-Message-State: AOAM531CL3+lEcCMKKHT9O9dILg9eR0wO3gFXv6PtkAUgvXesfDsSmO5
 +wSdhck53rnsHEhSw6h+dtd4TwD1bMBt8fmS+Ya0MA==
X-Google-Smtp-Source: ABdhPJxnrT+9YO8VN0qWp0ACEUIbWnM1BEz+8iWMoAfJeIBYb9C3q1nJUf5ntroetINW8lgpgRY3na9se5SJiT9rv6Q=
X-Received: by 2002:a05:6102:7b4:: with SMTP id
 x20mr6125121vsg.48.1622194014560; 
 Fri, 28 May 2021 02:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210517130823.796963-1-anup.patel@wdc.com>
 <20210517130823.796963-6-anup.patel@wdc.com>
 <CAPDyKFpxx-jBbL4o_iJCcivFL2ei5a7PcWVfUaBmLu-q89Mkjg@mail.gmail.com>
 <CAAhSdy1quHePY_HM875LHQgXGKrjm24SzeD5yFJUnqunpcHd8g@mail.gmail.com>
 <CAPDyKFo9ZjiMBKFwe+F9-s_sReCneO42z8ppsBdkf3=jnarJ5A@mail.gmail.com>
In-Reply-To: <CAPDyKFo9ZjiMBKFwe+F9-s_sReCneO42z8ppsBdkf3=jnarJ5A@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 28 May 2021 11:26:18 +0200
Message-ID: <CAPDyKFr9zM1eeXw+ekDsm3ZUZZRnhv_ibBvj2S-Mk9VcVJ3TTA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210528_022657_053044_E32D7389 
X-CRM114-Status: GOOD (  21.32  )
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

On Tue, 25 May 2021 at 11:05, Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Tue, 25 May 2021 at 07:39, Anup Patel <anup@brainfault.org> wrote:
> >
> > On Mon, May 24, 2021 at 11:31 PM Ulf Hansson <ulf.hansson@linaro.org> wrote:
> > >
> > > On Mon, 17 May 2021 at 15:10, Anup Patel <anup.patel@wdc.com> wrote:
> > > >
> > > > The generic power domain related code in PSCI domain driver is largely
> > > > independent of PSCI and can be shared with RISC-V SBI domain driver
> > > > hence we factor-out this code into dt_idle_genpd.c and dt_idle_genpd.h.
> > > >
> > > > Signed-off-by: Anup Patel <anup.patel@wdc.com>
> > >
> > > This is clearly a big step in the right direction. Just a couple minor
> > > things, see more below.
> > >
> > > Note that, I have a couple of patches in the pipe for the
> > > cpuidle-psci-domain driver (not ready to be posted). I need a couple
> > > of more days to confirm this restructuring still makes sense beyond
> > > these potential new changes. I will let you know as soon as I can with
> > > the outcome.
> >
> > Sure, I will wait for more comments from you. I was thinking of sending
> > next revision of patches sometime next week with the renaming of
> > function names which you suggested.
>
> Sounds good, that allows me a few more days this week.

I don't have any further comments at this point. It looks good to me,
but let me have a quick review on the next version before I provide my
ack.

[...]

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
