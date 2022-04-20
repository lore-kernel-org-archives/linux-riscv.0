Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73807C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 17:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8li18SPoMLbGORH/8tpocBLc6zENU6E7YdCYsaTNuok=; b=l/V5sB4BW5LiZc
	1N0RyDw+QyyLR/4aQxzgUNU5MXgFYy5vqPxGIndjaZ6KEIiqZKIig56r2owXH2XIUfHX27S1BF5aB
	xHYysTjKk6LiM7g9adWYyQGzEzdrkiQqx6G0HLwonKSPnzVetREFdavtP3XsHGI529w0ey4/XMgFt
	ZPbbX9FJY7C/XhOY+Edlvrvex3AsFHDYXlZ0n9iDqHKTCxWvsSEjPO0GQCi9XQ9sePO8u65QGygHl
	6CZW4lP2Z0G2wCK+ZQ+8HzvTkl5x7ZOXjCdDN/qAyW+PR7V5k1d5lb26yFiMZJxbzU89EmUNUAdAa
	MyjVlWh++a7uoDZyOPkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhEFt-009xUt-7Z; Wed, 20 Apr 2022 17:36:41 +0000
Received: from mail-yw1-f176.google.com ([209.85.128.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhEFq-009xU7-2B
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 17:36:39 +0000
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-2eafabbc80aso26003667b3.11
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 10:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aSRYCi9Gu592mc1yy2JGCfSHyy3Om8/ZMl9fXbJ4VAk=;
 b=y8f6ML7wa1WBOK0ZUKPoQzm/r/AeRhyi0Mzd2O8aL6mv5WOuUaenRczKIiFYqb3GOT
 X2Pm1NxlosfZbh45CFnLiJLL8sx5uxsdqHwJI5a1gG/zfSPhYvG/fmjzMwPSI62QAXVh
 cKs2e+8NcINtnopFnWOb9SSYsfPhLKqwHEXjXgri/9gGva+s1jOj8ePzLY1RpjyasZxv
 iT4C1zE3PnF3CrNAfyEnpiO+UOzymmaj+qcP5e+YnqhxlvqEXiEZPUAIMjgJUqMtRFA3
 AnrddFkh8dfw7J3pS2lNss0pqUG1VKn7tYB/4CQw2UQWAb/FoTeSFHH3CZPnqSCOhsiT
 a/TA==
X-Gm-Message-State: AOAM531qhs4ulFcUlkHYY+xyxPo/0jDjXGTIfHcjicQiKzdefMjcoqQD
 a3HIVbJufkdv2kyJz++hKjVh9fH/aaW3+BWhycQ=
X-Google-Smtp-Source: ABdhPJzNeFf91aJ2AcO4HxwsyceUmkMGZe3BT/sKo5s3TT3nCPguaeHFtXhd48Duxnk7AG97fF2bO/GqS3ZkGsIQMYE=
X-Received: by 2002:a81:260a:0:b0:2f4:ca82:a42f with SMTP id
 m10-20020a81260a000000b002f4ca82a42fmr1985644ywm.149.1650476194968; Wed, 20
 Apr 2022 10:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220411233832.391817-1-dmitry.osipenko@collabora.com>
 <20220411233832.391817-4-dmitry.osipenko@collabora.com>
 <CAJZ5v0gf1J+yPW14TAdLGLGfO+-2s=r0DDP7d+Rgop3=dB0gaQ@mail.gmail.com>
 <af51d9d0-26ba-fc66-05f1-d92ef7172730@collabora.com>
 <CAJZ5v0jFQi1x1Fnfk04n+HTTirz19-_xW2NgJtpOYyPgVh3Afw@mail.gmail.com>
 <fa20ae2f-e265-c713-493d-5b2ebcdf7f0a@collabora.com>
In-Reply-To: <fa20ae2f-e265-c713-493d-5b2ebcdf7f0a@collabora.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 20 Apr 2022 19:36:23 +0200
Message-ID: <CAJZ5v0iA6St_J5C6+Efygu25g9g-_tLBPc0qQoHbFqfrdT6azQ@mail.gmail.com>
Subject: Re: [PATCH v7 03/20] reboot: Print error message if restart handler
 has duplicated priority
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer <gerg@linux-m68k.org>, 
 Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Sebastian Reichel <sre@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Greentime Hu <green.hu@gmail.com>, 
 Vincent Chen <deanbo422@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "the arch/x86 maintainers" <x86@kernel.org>, 
 "H. Peter Anvin" <hpa@zytor.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Len Brown <lenb@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, 
 Lee Jones <lee.jones@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Guenter Roeck <linux@roeck-us.net>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, 
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 linux-parisc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Linux-sh list <linux-sh@vger.kernel.org>, 
 xen-devel@lists.xenproject.org, 
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, 
 linux-tegra <linux-tegra@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_103638_123531_8AF8D0B8 
X-CRM114-Status: GOOD (  40.67  )
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

On Mon, Apr 18, 2022 at 3:29 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 4/14/22 14:19, Rafael J. Wysocki wrote:
> > On Thu, Apr 14, 2022 at 12:24 AM Dmitry Osipenko
> > <dmitry.osipenko@collabora.com> wrote:
> >>
> >> On 4/13/22 21:48, Rafael J. Wysocki wrote:
> >>> On Tue, Apr 12, 2022 at 1:39 AM Dmitry Osipenko
> >>> <dmitry.osipenko@collabora.com> wrote:
> >>>>
> >>>> Add sanity check which ensures that there are no two restart handlers
> >>>> registered using the same priority. This requirement will become mandatory
> >>>> once all drivers will be converted to the new API and such errors will be
> >>>> fixed.
> >>>>
> >>>> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >>>
> >>> The first two patches in the series are fine with me and there's only
> >>> one minor nit regarding this one (below).
> >>>
> >>>> ---
> >>>>  kernel/reboot.c | 15 +++++++++++++++
> >>>>  1 file changed, 15 insertions(+)
> >>>>
> >>>> diff --git a/kernel/reboot.c b/kernel/reboot.c
> >>>> index ed4e6dfb7d44..acdae4e95061 100644
> >>>> --- a/kernel/reboot.c
> >>>> +++ b/kernel/reboot.c
> >>>> @@ -182,6 +182,21 @@ static ATOMIC_NOTIFIER_HEAD(restart_handler_list);
> >>>>   */
> >>>>  int register_restart_handler(struct notifier_block *nb)
> >>>>  {
> >>>> +       int ret;
> >>>> +
> >>>> +       ret = atomic_notifier_chain_register_unique_prio(&restart_handler_list, nb);
> >>>> +       if (ret != -EBUSY)
> >>>> +               return ret;
> >>>> +
> >>>> +       /*
> >>>> +        * Handler must have unique priority. Otherwise call order is
> >>>> +        * determined by registration order, which is unreliable.
> >>>> +        *
> >>>> +        * This requirement will become mandatory once all drivers
> >>>> +        * will be converted to use new sys-off API.
> >>>> +        */
> >>>> +       pr_err("failed to register restart handler using unique priority\n");
> >>>
> >>> I would use pr_info() here, because this is not a substantial error AFAICS.
> >>
> >> It's indeed not a substantial error so far, but it will become
> >> substantial later on once only unique priorities will be allowed. The
> >> pr_warn() could be a good compromise here, pr_info() is too mild, IMO.
> >
> > Well, I'm still unconvinced about requiring all of the users of this
> > interface to use unique priorities.
> >
> > Arguably, there are some of them who don't really care about the
> > ordering, so could there be an option for them to specify the lack of
> > care by, say, passing 0 as the priority that would be regarded as a
> > special case?
> >
> > IOW, if you pass 0, you'll be run along the others who've also passed
> > 0, but if you pass anything different from 0, it must be unique.  What
> > do you think?
>
> There are indeed cases where ordering is unimportant. Like a case of
> PMIC and watchdog restart handlers for example, both handlers will
> produce equal effect from a user's perspective. Perhaps indeed it's more
> practical to have at least one shared level.
>
> In this patchset the level 0 is specified as an alias to the default
> level 128. If one user registers handler using unique level 128 and the
> other user uses non-unique level 0, then we have ambiguity.
>
> One potential option is to make the whole default level 128 non-unique.
> This will allow users to not care about the uniqueness by default like
> they always did it previously, but it will hide potential problems for
> users who actually need unique level and don't know about it yet due to
> a lucky registration ordering that they have today. Are you okay with
> this option?

Yes, I am.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
