Return-Path: <SRS0=er6D=OO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D8CC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Sep 2021 20:21:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81FF260238
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Sep 2021 20:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81FF260238
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YLyRYLi6R8+Gs4+Vb3Nd7gn6ZiAvlu3/e9Hvk56LWhc=; b=NLiOqFRluZWDG+
	OX0vqvrC9mLImrAh10xlwe5bmqg9loy3vDOxjJsBrMRjJN66eiPEuvjx4C2gM1bmp1e53LKsD0GOE
	kYzevvCruF8x6/HVz35/LgBVk9iWtzr7vmvSqCoeI2otk96E/Huo9eBUFeaAkf8/v7welxPPmj1iR
	56XLBUT4HFZmzkUb9zCWmn/QMvosQU+rDLcr2Tvju5EuVO+WdX8KXfyLTsWyZOqMOIc0PRzY64zkP
	aur/wjYhNPCXIe+3IGTK580SvOKL6s/Hkw+Uqfz2V1iUCXg3BnAt+QtwMK5dfVtVp/4wHjb1Hy/6P
	zzkczkRRKcHfimoJhOgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTrgp-00FSPG-0h; Fri, 24 Sep 2021 20:20:59 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTrgc-00FSNs-M2
 for linux-riscv@lists.infradead.org; Fri, 24 Sep 2021 20:20:48 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id y13so8275858ybi.6
 for <linux-riscv@lists.infradead.org>; Fri, 24 Sep 2021 13:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XyhQ38a/4uH67bAl5YGynvJ7Eg72vGZjm0Neu7EJ7Uc=;
 b=sugKOapzTbYiBxmeNfdWAfSXSs+U3/EV89R7DA5U1a32VM+oxYjy40oSJmo2l8hJIz
 WAjB+3JeAn7Ku+NF4E9dhQw4TyNqJzJ12tqzkreHVHfo9jxbpWeb4ARq4LIllJVeF2KA
 Vmer6jlQHrx/x2qy3jI3Z8FY1UEEh2/d2NSGQEizmxs9BImL1aBacyyfDnwEdLy1kB6I
 z26/ARJMI+VOt+MZdFXu1ZkaqZ+hIDz18MI6wbKPT5POdu0Bh6rR9X6jAXShrLVvuYBK
 x3mDJFHfGpJEQzOD0vh4/2ZPYL1wUcuuvkvhEcStBAvz8EzR/pU6HV001X0k9qoNbvgz
 QZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XyhQ38a/4uH67bAl5YGynvJ7Eg72vGZjm0Neu7EJ7Uc=;
 b=x49akjnZn5FrxUbwONz8MT49cCXm3SgjZZJ9ACFjEanw5gpfFka4pO+2SSwpgUtsh3
 a90l6mZ+D7K70X7ANvlEtnylnQbu0tltuPiPWw3L2bEZjE/UXTvrMVb852ZzOg4XOAmK
 0gmsjDjDf9CpGXj7Kz4ui9nk72uQqs/lhuDtDNqaONZOiivEbggYR7e7cvsuDTHfJg9i
 lbOdAame62ZNWjL2WC16AyyuDRlHhxpMKzICq/1kHZUmQfteebDSl3+3nROlz2fGMkcg
 o+FwcRIzla5ljiVzh0SoiBdRk1j8/sLwOJqSVq1TH9V6rTnbCo/NK4MD/MCJE4NJYODw
 unkw==
X-Gm-Message-State: AOAM532V2KenptOlvSL+tEQRkLOuDCIQ/cchqk/Qpk8UjxfXcC7/I4Ni
 xEbmOLW9L/I92PUDOCc1boH5IcElvQbRNyDNHYgaww==
X-Google-Smtp-Source: ABdhPJw3UmguJUAbaav5AKykn8QK+KcLgLzhmVnIKdKzvHlgFfAoVRS7LT68ls/fxAaH3sgCg9ehHFiw2VCPF+JJqhE=
X-Received: by 2002:a25:2b07:: with SMTP id r7mr13368843ybr.296.1632514838758; 
 Fri, 24 Sep 2021 13:20:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210904000543.2019010-1-saravanak@google.com>
 <20210904000543.2019010-2-saravanak@google.com>
 <CAPDyKFqkvN=ZrfAnj4CqfjBu_Pj0YH9txnkP-1d=FhaEhbPrPA@mail.gmail.com>
 <CAPDyKFqRR-GD=xZo27a9MgwzKT9mar4m0Bdki1VBxnsZaQy1_g@mail.gmail.com>
In-Reply-To: <CAPDyKFqRR-GD=xZo27a9MgwzKT9mar4m0Bdki1VBxnsZaQy1_g@mail.gmail.com>
From: Saravana Kannan <saravanak@google.com>
Date: Fri, 24 Sep 2021 13:20:02 -0700
Message-ID: <CAGETcx-ArdxuWkZcidGrRRPqrkLRzC-oVGmeGd5Mebps5k1fpA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] drivers: bus: simple-pm-bus: Add support for
 probing simple bus only devices
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Neil Armstrong <narmstrong@baylibre.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Tony Lindgren <tony@atomide.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Damien Le Moal <damien.lemoal@wdc.com>,
 Android Kernel Team <kernel-team@android.com>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-oxnas@groups.io,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 linux-omap <linux-omap@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_132046_750389_6CEBC9A5 
X-CRM114-Status: GOOD (  21.61  )
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

On Fri, Sep 24, 2021 at 4:50 AM Ulf Hansson <ulf.hansson@linaro.org> wrote:
>
> On Thu, 9 Sept 2021 at 13:01, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> >
> > On Sat, 4 Sept 2021 at 02:05, Saravana Kannan <saravanak@google.com> wrote:
> > >
> > > fw_devlink could end up creating device links for bus only devices.
> > > However, bus only devices don't get probed and can block probe() or
> > > sync_state() [1] call backs of other devices. To avoid this, probe these
> > > devices using the simple-pm-bus driver.
> > >
> > > However, there are instances of devices that are not simple buses (they
> > > get probed by their specific drivers) that also list the "simple-bus"
> > > (or other bus only compatible strings) in their compatible property to
> > > automatically populate their child devices. We still want these devices
> > > to get probed by their specific drivers. So, we make sure this driver
> > > only probes devices that are only buses.
> > >
> > > [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > Tested-by: Saravana Kannan <saravanak@google.com>
> >
> > Tested-by: Ulf Hansson <ulf.hansson@linaro.org>
>
> Saravana, Rob,
>
> I have been following your latest discussion in this thread - and it
> looks like you guys are moving towards a consensus.
>
> Although, if there is anything I can do to help to complete this, just
> tell me and I will jump in immediately.

Looks like we settled on the allow list approach during the BoF in
LPC. I'll send out a v4 with some tweaks.

-Saravana

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
