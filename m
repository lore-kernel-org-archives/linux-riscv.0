Return-Path: <SRS0=clKS=QC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F350BC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Nov 2021 20:18:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC1FC61C12
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Nov 2021 20:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AC1FC61C12
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RIw7UCXvZ2cXVu8I3GsYsKbJYo8efOj+VCGinJMShMI=; b=2X9DI0Jwwwc+1C
	7ejTKZknpWs4mk4ef1MP3dX/j9mzVUa9linX8fFn/Aqb8iPib0i296eOAnNzTydh/NwulRHi67xS1
	Aw2XlShaJP/K/j0o0SFK0C5ZEQW5prgl+DwSNnu/FGjfEdwoCkSMhpP3KC5Es87NoJqcgVRSMCZRf
	6GmMEhxUJGSG6tavf6Od9ltnuILSFMwuBqTw+IJbk3KJCxJj5RhMeVibKh6ICUjhaapwcdBivFFgX
	bpV5VusofnF+ON9cHvMEM+PTBnA/UfoWy6+Cibmg/mnm/366HCmGbehQIKBrCAujQ4DcbKEIqgDuM
	hWQrgKrjxXBkDzpOb/dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmiQx-00H1py-NK; Mon, 15 Nov 2021 20:18:31 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmiQt-00H1kx-MC
 for linux-riscv@lists.infradead.org; Mon, 15 Nov 2021 20:18:29 +0000
Received: by mail-yb1-xb32.google.com with SMTP id v7so50648315ybq.0
 for <linux-riscv@lists.infradead.org>; Mon, 15 Nov 2021 12:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ti2qS38N54C0keJ4viYpkfZvuilsGcLNEF7JfCXeTTQ=;
 b=dh/Oa9Ne/UX3lXjDB4COE5fcmk8sukuVS9CcQeo4HvaaL9inYkLrRgESiTiiJjH8Ha
 VD+voEPVlu4lT/PFKwINwdG4d11smF+KO/ppWh9QkjAYWf9nI2V51AWJZTZVp4mOvqr/
 OqeBQGqGBLjLgEja7DyQ3k/np69fx0UsIFBY0muAvUQRNUVa5/KFzlzavNtVE2HhmDsK
 bmh6KbqsAKlU3IKOQjpgPqjw0dOCkZxcS8P+7EtoLtYNqQhqa9IbpkxB9gRHMNpqSxBi
 l/xRTx3ssiex9d5VCAExW9LSc6GJtcglSAdxi43WZcr1AEmZAEonPwY3qqbOY1Qs3OD3
 dPHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ti2qS38N54C0keJ4viYpkfZvuilsGcLNEF7JfCXeTTQ=;
 b=uAktW2HOfoudtRYGOm7IjqeZFc0aTv7W1yo0UCJaxjjRcG9MgQ19AgauZgyTiXKCha
 mLYFy4x/Cmnv635/QX8j8ggHVjPk5WxrkA0neSuIXYV2j8xQZ5a9tD04JlYPEGK1KDFT
 cFlF6nGRDEM/Cuj31RO/Ppzz1WvP88ZvDI97owgCAmylJ24treEtwFpNYZtHZ0kuufzJ
 xWCHPVxWBhm8XpQQMgaonU5XpWGW/oqDSDjuhLBfRjEoHkYH0BPlBVQUlXiv1Xq+JbPv
 DXuyr1BKvGdoLke0n+hnn5hVBBSSO29347L0c89waEWrfaPKZsbRUnvNmx6Iw89bL2Rt
 lqiA==
X-Gm-Message-State: AOAM531nAIZQhVQqISO8nrInvWyIWiYmw5OLL5XtN5ZTwv/aCJ9GqI8x
 +rZbzWaH0rHqgPsNWq4d6R9qolCTMCxEkCTLOCahCg==
X-Google-Smtp-Source: ABdhPJxKkmPEnUXj0aVbJDTQXnWiiYrBJDqwAo+CYLHhYd6MMCN9FGeHm5tb4KkW7mZ9cUyGQQ0uXz7x+4W8OBjmlCo=
X-Received: by 2002:a5b:783:: with SMTP id b3mr1822562ybq.328.1637007502971;
 Mon, 15 Nov 2021 12:18:22 -0800 (PST)
MIME-Version: 1.0
References: <20210929000735.585237-1-saravanak@google.com>
 <20210929000735.585237-2-saravanak@google.com>
 <YYu4EglV7SBZU2Iy@ryzen>
 <CAGETcx_m3f5JgrKQXZ5DUxDkpGhAau9G8uYm8a0iQ8JbcD0Rtg@mail.gmail.com>
In-Reply-To: <CAGETcx_m3f5JgrKQXZ5DUxDkpGhAau9G8uYm8a0iQ8JbcD0Rtg@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Mon, 15 Nov 2021 12:17:46 -0800
Message-ID: <CAGETcx_a-d7qQNi3sUce3AzbPcvGJK5JSuiiHm4h4e_q-MT7Dg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] drivers: bus: simple-pm-bus: Add support for
 probing simple bus only devices
To: Abel Vesa <abelvesa@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org, 
 linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211115_121827_752052_64F63BCC 
X-CRM114-Status: GOOD (  48.25  )
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

On Wed, Nov 10, 2021 at 12:24 PM Saravana Kannan <saravanak@google.com> wrote:
>
> On Wed, Nov 10, 2021 at 4:16 AM Abel Vesa <abelvesa@kernel.org> wrote:
> >
> > On 21-09-28 17:07:33, Saravana Kannan wrote:
> > > fw_devlink could end up creating device links for bus only devices.
> > > However, bus only devices don't get probed and can block probe() or
> > > sync_state() [1] call backs of other devices. To avoid this, probe these
> > > devices using the simple-pm-bus driver.
> > >
> > > However, there are instances of devices that are not simple buses (they get
> > > probed by their specific drivers) that also list the "simple-bus" (or other
> > > bus only compatible strings) in their compatible property to automatically
> > > populate their child devices. We still want these devices to get probed by
> > > their specific drivers. So, we make sure this driver only probes devices
> > > that are only buses.
> > >
> > > [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> > > Fixes: c442a0d18744 ("driver core: Set fw_devlink to "permissive" behavior by default")
> > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > Tested-by: Saravana Kannan <saravanak@google.com>
> > > Tested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > ---
> > >  drivers/bus/simple-pm-bus.c | 42 ++++++++++++++++++++++++++++++++++---
> > >  1 file changed, 39 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
> > > index 01a3d0cd08ed..6b8d6257ed8a 100644
> > > --- a/drivers/bus/simple-pm-bus.c
> > > +++ b/drivers/bus/simple-pm-bus.c
> > > @@ -13,11 +13,36 @@
> > >  #include <linux/platform_device.h>
> > >  #include <linux/pm_runtime.h>
> > >
> > > -
> > >  static int simple_pm_bus_probe(struct platform_device *pdev)
> > >  {
> > > -     const struct of_dev_auxdata *lookup = dev_get_platdata(&pdev->dev);
> > > -     struct device_node *np = pdev->dev.of_node;
> > > +     const struct device *dev = &pdev->dev;
> > > +     const struct of_dev_auxdata *lookup = dev_get_platdata(dev);
> > > +     struct device_node *np = dev->of_node;
> > > +     const struct of_device_id *match;
> > > +
> > > +     /*
> > > +      * Allow user to use driver_override to bind this driver to a
> > > +      * transparent bus device which has a different compatible string
> > > +      * that's not listed in simple_pm_bus_of_match. We don't want to do any
> > > +      * of the simple-pm-bus tasks for these devices, so return early.
> > > +      */
> > > +     if (pdev->driver_override)
> > > +             return 0;
> > > +
> > > +     match = of_match_device(dev->driver->of_match_table, dev);
> > > +     /*
> > > +      * These are transparent bus devices (not simple-pm-bus matches) that
> > > +      * have their child nodes populated automatically.  So, don't need to
> > > +      * do anything more. We only match with the device if this driver is
> > > +      * the most specific match because we don't want to incorrectly bind to
> > > +      * a device that has a more specific driver.
> > > +      */
> > > +     if (match && match->data) {
> > > +             if (of_property_match_string(np, "compatible", match->compatible) == 0)
> > > +                     return 0;
> > > +             else
> > > +                     return -ENODEV;
> > > +     }
> >
> > This change is breaking the expected behavior for the already existent
> > simple-bus nodes. All the simple-bus compatibles should be replaced now
> > to simple-pm-bus. In my case, on some i.MX8 platforms, without the
> > devlink, the devices suspend sequence changes (and even breaks).
> >
> > To avoid breaking the already existent simple-bus nodes, maybe the logic
> > should've been reversed: keep the simple-bus as is and add another
> > compatible, IDK, something like simple-trasnparent-bus, or something.
>
> The intent of this change IS to affect existing simple-bus nodes (but
> not in the way it's affecting you). But if it's breaking stuff, we
> obviously need to fix it.
>
> I have a hunch on what's going on in your case, but can you point me
> to the specific simple-bus node that's getting affected? I'm expecting
> it to be a simple-bus node that gets added AFTER this driver is
> registered at device_initcall (module_init gets converted to
> device_initcall).
>
> Also, can you try this hack patch to see if it helps your case?
> https://lore.kernel.org/lkml/CAGETcx9U130Oq-umrvXME4JhEpO0Wadoki3kNxx=0-YvTR6PtQ@mail.gmail.com/
>
> I have some thoughts on how I could fix this, but I need to think
> about a few cases.

Hi Abel,

Friendly reminder.

-Saravana

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
