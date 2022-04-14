Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C925BC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Apr 2022 11:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NJ3XoF1pKzEfK7mByzMFV13iIP0iqE/LiXQ2H33efss=; b=ypmQ6yysK40Mwo
	DdYvCKZd36KZdt95Y/7PqV3gsKTLLzoWTp7fsT78GBYJG/g9d6BNoEEkkW+fXv++9fx0jt/5YVFH7
	kvxpKy2u0gpzeZ/34hLp3XVjlxs1pk9asrJUq4engwIj1Ue35S7t5C5+Nqq00OqLWtMAo8ZEWSZJ9
	HAa79viis1MyMzlqgjHiKoJZBpAZcWqaYfhdp4wE5ONMjfpognNLlxVgl0dz22nz/2rBMGu2SaQyA
	cUQPWas+8zO1zF3nPLjd8bMxUHe0aR4kG0FpZZZOZcEsoOx382RO267vo9WxQcUdkwmCh2UoyFN/N
	tXkbG/ahCLZial49CyMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nexVt-005Ga7-B6; Thu, 14 Apr 2022 11:19:49 +0000
Received: from mail-yb1-f175.google.com ([209.85.219.175])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nexVq-005GZM-T1
 for linux-riscv@lists.infradead.org; Thu, 14 Apr 2022 11:19:48 +0000
Received: by mail-yb1-f175.google.com with SMTP id g34so8845379ybj.1
 for <linux-riscv@lists.infradead.org>; Thu, 14 Apr 2022 04:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dY83H0aPEfDTdUo23MndvBRZZwuNuwRYnVKAWx3MFcc=;
 b=h2nZvBz21pFa3r6l49Wr4oUyT64kPQQ/jn/n3CMTu8QWJqWwbn6x+jSlYBk9wM4PhG
 1BxbafFs+RGhAqdnEDfHpFulazobNQqQPNBGg9ltlkN+HPYh8RHm0PFf6ZqpXTGFyJRK
 DryHmAlYDBp+0KnjubfXAf1ySYtUmOhAytMRERHxqeg/jWbyEKHrYKVgjlqGs9UwiXGZ
 jK279hzHMF6OMhh13/wgf7lMuZNi7T4a4/a8cgsHmDszOLqJKtMipShvohOqZmLWxDQt
 Pnfo3dg+wTB5K+mwgQ4NBSFItVWnCcb8TLYB88G1WJCXQdBIx4ULjo9sWcZW2PEXAxw1
 jhpg==
X-Gm-Message-State: AOAM533VgpP4147qGdbgPNtFUjj9jOdNNRKI8lh1KLo+kh4AxOp92eHh
 dvPyGTCGbF6hFiZYnZf0qQP1Zk3qyxbKhk5O39g=
X-Google-Smtp-Source: ABdhPJyXV07maZap62IutTg/mwVDj/CfiQiLME5IwIFkAJnTY85PIrUap0WcF7eity1wAkpRDD0UVobPG71n48VtbjA=
X-Received: by 2002:a05:6902:187:b0:63d:9c95:edca with SMTP id
 t7-20020a056902018700b0063d9c95edcamr1246534ybh.81.1649935183962; Thu, 14 Apr
 2022 04:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220411233832.391817-1-dmitry.osipenko@collabora.com>
 <20220411233832.391817-4-dmitry.osipenko@collabora.com>
 <CAJZ5v0gf1J+yPW14TAdLGLGfO+-2s=r0DDP7d+Rgop3=dB0gaQ@mail.gmail.com>
 <af51d9d0-26ba-fc66-05f1-d92ef7172730@collabora.com>
In-Reply-To: <af51d9d0-26ba-fc66-05f1-d92ef7172730@collabora.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 14 Apr 2022 13:19:32 +0200
Message-ID: <CAJZ5v0jFQi1x1Fnfk04n+HTTirz19-_xW2NgJtpOYyPgVh3Afw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220414_041946_973702_6FF45B3E 
X-CRM114-Status: GOOD (  31.87  )
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

On Thu, Apr 14, 2022 at 12:24 AM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 4/13/22 21:48, Rafael J. Wysocki wrote:
> > On Tue, Apr 12, 2022 at 1:39 AM Dmitry Osipenko
> > <dmitry.osipenko@collabora.com> wrote:
> >>
> >> Add sanity check which ensures that there are no two restart handlers
> >> registered using the same priority. This requirement will become mandatory
> >> once all drivers will be converted to the new API and such errors will be
> >> fixed.
> >>
> >> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> >
> > The first two patches in the series are fine with me and there's only
> > one minor nit regarding this one (below).
> >
> >> ---
> >>  kernel/reboot.c | 15 +++++++++++++++
> >>  1 file changed, 15 insertions(+)
> >>
> >> diff --git a/kernel/reboot.c b/kernel/reboot.c
> >> index ed4e6dfb7d44..acdae4e95061 100644
> >> --- a/kernel/reboot.c
> >> +++ b/kernel/reboot.c
> >> @@ -182,6 +182,21 @@ static ATOMIC_NOTIFIER_HEAD(restart_handler_list);
> >>   */
> >>  int register_restart_handler(struct notifier_block *nb)
> >>  {
> >> +       int ret;
> >> +
> >> +       ret = atomic_notifier_chain_register_unique_prio(&restart_handler_list, nb);
> >> +       if (ret != -EBUSY)
> >> +               return ret;
> >> +
> >> +       /*
> >> +        * Handler must have unique priority. Otherwise call order is
> >> +        * determined by registration order, which is unreliable.
> >> +        *
> >> +        * This requirement will become mandatory once all drivers
> >> +        * will be converted to use new sys-off API.
> >> +        */
> >> +       pr_err("failed to register restart handler using unique priority\n");
> >
> > I would use pr_info() here, because this is not a substantial error AFAICS.
>
> It's indeed not a substantial error so far, but it will become
> substantial later on once only unique priorities will be allowed. The
> pr_warn() could be a good compromise here, pr_info() is too mild, IMO.

Well, I'm still unconvinced about requiring all of the users of this
interface to use unique priorities.

Arguably, there are some of them who don't really care about the
ordering, so could there be an option for them to specify the lack of
care by, say, passing 0 as the priority that would be regarded as a
special case?

IOW, if you pass 0, you'll be run along the others who've also passed
0, but if you pass anything different from 0, it must be unique.  What
do you think?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
