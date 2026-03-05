Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99EEEEF316
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 08:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NWqWXUyp24dWl6sO4g2hNoAtEs5vd59ZRVnMRSivBO4=; b=BWJMWR4PGYJlJn
	vptM+8HWrALHh+WSKaG1tsq1s0yus2LdCT6XdpBeYth7WhjA0/mxwHdr3hOYl5QIl6+e080/usEBZ
	qFS9iCxKE8KAvtlqM7MRMhcgucZiulfP0FhjjLdQPN/WgxB5MslXLgMmVLSubNkFMcY31R88TvTJz
	1xh6I33cyF/En8PZnVCnI07FAUf8oO7pht22gwkZtXqvoRpMFh9qt9EOL4bp1WPgNdiFkOWkjtrnJ
	KN3QTaNbP78kOgUkPA2wU2Agkscnnqc00sC9/T0CTqCBZpDBWd//gHg7pv9A3YkKahBD9Lm2xdAtG
	hN1q/H0lRt6lk8KoiqSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy44w-00000001CEI-0f54;
	Thu, 05 Mar 2026 08:29:06 +0000
Received: from mail-vk1-f177.google.com ([209.85.221.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy44t-00000001CDG-1Qfa
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 08:29:04 +0000
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56a981f44c9so3435363e0c.2
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 00:29:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699342; x=1773304142;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlLnToI6SbxsSn7ypnmaqq1RX+miw2VMTyDHKi+gwbk=;
        b=mFaA1mdjvWLZlXFvnzIsB3nN0KkK/e3+ZvMvjTmDqbpxlaLiUvVSMhDar6Dkbr0Me8
         7cRdX9l0Afs6v5Ept3o9mmM2G3ml37LVdI9nE7pDP7QXZ/G5uRIV5KdmRTBLCpFOk5/X
         1M0cAasC5ZfjsyVEtlb8JTY6OMD36k433LGIrOhLvuV9yN03XpmCJN6x3xRT/Nvm0pHr
         dvArvpeDVjwhqyMbLKMkm4QvhN4zaRZGM9gIU68qBDlj4Q5xLYS0yPr0RYD7bIu4HApP
         BBeFAPYo4OOF6jMpr9sI4ZLyCGZLIV15RDm8LRh30/a+ZV5ZKu9idoyfpmMKIQzl0D4C
         XXlA==
X-Forwarded-Encrypted: i=1; AJvYcCXKo+PEoOE1OkiJXmeNP8kRVdeDelJzpbONAiHD7kWRYIpqV7UXnouF0x6Gvag+JfRzkWb70DGQu4d4QA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6elL28Mzjs5g0Od0TMzw5GoyCM82JHV3sJ2bSb+sqwsl1o6sp
	UY5kjmFSGvlSt7yKphBal9mzzb/IAVEGPjwr3oy4djFNa7oE986nV1aU614Map5O
X-Gm-Gg: ATEYQzwcFxH2rzXWRe1Ze1Y+IFq7GoPjw/OLJm+Mi8fs97QOzyIxLEUs+qXCgE7DIlp
	jJLUgM7vDW2ndnYg0qNHC0cYPrirhGA6PR1iRr9+y4CHRXzG5nFwJhdVoNBIE62uRRbZCWQzcnh
	GVyBPYOFASpS5hpUswWWkoFe/MJvUPx6Lh7iP6u8tL9BmsngC09Und6A5V9AOQRgJ5IRcYkBwi8
	JS0m3ASK0VbJypbTVFJ4M+0XusoEVrwG32skaNvu7E9+uDZXoWR5UNu1CGfzMPNo3QjuxSIVT5A
	nwcsICZ2pAVKYBVVKFnis19TN9l2nBh2jjDQG5ZEL9Vd4CzfrSF/NukBDb0WXAOaGnG3Iovj1Cw
	/QLrFZKNL7FE+2tWE4mq8Qp3ggHsChAITZKjrAZyXtJG/a9jaNnCyXMb0asGF8TfQR6UwBEcFBb
	8fU/d2xiUDSwXOP3rKptjzD9IQycN4D1ZudCyft64K0ygnbrh0cFafdV8XB0yqY144ZQt1xl4=
X-Received: by 2002:a05:6122:800f:b0:56a:f3f9:7e4f with SMTP id 71dfb90a1353d-56af3f98193mr545781e0c.18.1772699341926;
        Thu, 05 Mar 2026 00:29:01 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a91b8c96fsm26558628e0c.2.2026.03.05.00.29.01
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:29:01 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-94ace5d0e39so2297209241.2
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 00:29:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVOQjmL4S1En1Q5IZvtTxtBws+YV5syacrNATl8d4R1YIObH7ibLxJQGInfJ6pdAFOzul/ygjCUl9MzmQ==@lists.infradead.org
X-Received: by 2002:a05:6102:1607:b0:5ff:c64d:228c with SMTP id
 ada2fe7eead31-5ffc64d2600mr724913137.22.1772699340961; Thu, 05 Mar 2026
 00:29:00 -0800 (PST)
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-13-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-13-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 09:28:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV+7n==crPmitH-JCwtJiH+7LaPKZQYU4ZqX_duo3_7Eg@mail.gmail.com>
X-Gm-Features: AaiRm50Kgxrt1IEt_9GEmeNyCIrylErpUd7qkh7D4FIoK_FYituUB8DTITetq4c
Message-ID: <CAMuHMdV+7n==crPmitH-JCwtJiH+7LaPKZQYU4ZqX_duo3_7Eg@mail.gmail.com>
Subject: Re: [PATCH phy-next 12/22] phy: move provider API out of public <linux/phy/phy.h>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_002903_383553_BDCFBF7D 
X-CRM114-Status: GOOD (  28.57  )
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

Hi Vladimir,

On Wed, 4 Mar 2026 at 19:03, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> The major goal is to hide the contents of struct phy from consumer
> drivers.
>
> The idea with "phy-props.h" is that both consumers and providers make
> use of some data types. So both headers include "phy-props.h".
>
> Two slight points of contention.
>
> 1. phy_set_bus_width(): Vinod explains that despite the current caller
>    situation (9 providers, 1 consumer), it is a consumer API function.
>
>    The use case is that the controller (for example UFS) may have
>    limitations and should set the expected lanes to be used and width on
>    those lanes. A number of Generic PHYs can support multiple lanes and
>    multiple width so this is way for controller telling I am using this
>    configuration.
>
> 2. phy-provider.h should go to include/linux/phy/ or to drivers/phy/?
>    We do have 3 PHY providers outside of drivers/phy/:
>
>    drivers/media/platform/sunxi/sun8i-a83t-mipi-csi2/sun8i_a83t_dphy.c
>    drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>    drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
>
>    but the practice is not encouraged, and with time, these should be
>    moved to the subsystem. This is not something that I can do now.
>
> For temporary compatibility, keep including the provider header. This
> will be removed when abuses are all gotten rid of.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/phy/phy-provider.h

> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -1,246 +1,38 @@
>  /* SPDX-License-Identifier: GPL-2.0-or-later */
>  /*
> - * phy.h -- generic phy header file
> + * phy.h -- Generic PHY consumer API
>   *
>   * Copyright (C) 2013 Texas Instruments Incorporated - http://www.ti.com
>   *
>   * Author: Kishon Vijay Abraham I <kishon@ti.com>
>   */
>
> -#ifndef __DRIVERS_PHY_H
> -#define __DRIVERS_PHY_H
> +#ifndef __PHY_CONSUMER_H
> +#define __PHY_CONSUMER_H
>
> -#include <linux/err.h>
> -#include <linux/of.h>
> -#include <linux/device.h>
> -#include <linux/pm_runtime.h>
> -#include <linux/regulator/consumer.h>
> +#include <linux/phy/phy-props.h>
>
> -#include <linux/phy/phy-dp.h>
> -#include <linux/phy/phy-hdmi.h>
> -#include <linux/phy/phy-lvds.h>
> -#include <linux/phy/phy-mipi-dphy.h>
> +#include "../../drivers/phy/phy-provider.h"

Shouldn't there be one more "../"?
Interestingly, it compiles with/without.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
