Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D2FEEF31D
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 08:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/LLtsIoZaewwvfZHVu14dd66eaL1sn4yZZ50gdLyAzM=; b=C2xqs0iObJ8Oci
	U4Y+Lgh5+gCcFgXasogNnm5Yd0VL8lVf0dBfPsWSfNLV5KwXB/mnd7tqev4Ou21JW/AwaNJcM74K8
	yGFsKjU/rVK9BJZXskR+PMoU+atKAHr+DpCNW8Ac4zLvN61XtMgZuy08sXz/2YM+BocZUczs3LHcA
	dd+7KBOJgBrtEyZgQVTlMl11/eeVe7xJ/M4gUZRSOoWP7E/Pv9FFR5cyVhT2gx1BFyAzXJ/CHGJKb
	jNIvY86HV8P3R3tMxVOQ8EodEcMcxtpQh0f9icQ36Uzrifl8XdOGn4oxjDGWz5eq/ahFV8W0WxKQ0
	GfovhmH9NKiNk+wuHzUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4Bm-00000001D92-1CPB;
	Thu, 05 Mar 2026 08:36:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4Bk-00000001D8R-23dI
	for linux-riscv@bombadil.infradead.org;
	Thu, 05 Mar 2026 08:36:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8Ymdw+XC/6Jy9fN+NX35+E/o8bLZmtxZBZ4e3pQeTxE=; b=rWOtYMkb7ogG+2w4KfOIpokW10
	EI5uHwKXMKR2fJrvzqD5zcPWw8O47jmVzYVv+SgLWTQ4MT/eRf3vB40GI7i2r0IbeQ2enmsk8A3rj
	+PI4m4nIoeq1tSo0Enn7SDRKHAAzYmEYFHP3TeGjL24PUnS0ARkX/fge7wQB5qLmTlo83bt/vVV9I
	frxvdTY15Vob+45TI/I1CZwEGZsekJG2CC4WCFi8s8HMOITdqINCpmUimg0EXfRr72fbo7bSum7In
	7niX5tWMCJWYluzSigIvQPpqYJZkxxgPkrkWR6waYTlwfXHZjTjHBkgcUCv/K5G9I23x/KyibgFTS
	s8ZDYOCQ==;
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4Bh-00000006DgJ-21li
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 08:36:07 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-408778a8ec4so1699555fac.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 00:36:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699763; x=1773304563;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Ymdw+XC/6Jy9fN+NX35+E/o8bLZmtxZBZ4e3pQeTxE=;
        b=AzYqvZHpmR6AI2oPgjEnq+6otmAp6I5Tje//X+7js6lEbjUqcy6szYb0JMMna2cL1e
         pbGlqE4aTT/FIY9OjUg8gdvvp5wq929irt09xcm4PLza9DQPunEQdarST0yBh4hZ6WN8
         XgmKYnbBNcGcPOGpnQzwJ9kvdjEnHirPJAQ+vrwBFT4nfVW6UQQG+MSw8+R382ysQMCC
         xmQzur30k/CBSXvypZtGgu4iY/JGa5xXeDj+cv7w0SKoZbevPNt7g6j6HzO5dmxt3rAU
         BAiiu26ub7GSDoGqtbK8+kL0IlRNdsDuheI7xgG7VmMIY6x4Aopc03fGi2VONB4uSAul
         pR8g==
X-Forwarded-Encrypted: i=1; AJvYcCWFsK/Jf9tPRp56TiHx4EJ+qpbnY75ReAsNlK4FLTicm85gE3L8t4GCGo4BncauAe+hgSz0/2aLsYZMTg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8Vy2VFXmTNXAjaYTZGnY37L+RMXra+n/SDsud60xCsQZHAvQ9
	dkmX5GGvSbPllsdUvUy8MpKER3HMJfe2zNs6BQebdAASQ8N8jggepoG5RhF0ng==
X-Gm-Gg: ATEYQzydHDQyHOf6gAFZ2K8yI9/lXnTagJ9Ti8Em0dJhLgNDN5ELCBJGd7EYUwbMgXT
	/fPUO5i+AwnaiS+Qc+AFZIRQ6ltF77NuIhtOGGp20NR72B6Dubyqw7WpK/hGR21/dC2rIp4lQN6
	oWmXXBVQiQIXYfXVwhIML5aZU1ADQC5qRNyWnbX6LXU+jqYffE86vX5Q5kNcA8aBCic0ERnj0/r
	meZ8tlta55GtZlYSoB/H0nf9x1gxfkGFgiInKEvpae5Se1k8gJX3y5HJcYWQ66z+o0U6IVzbRIn
	ogpV14qHUibK8YQIIC6yiNXGvlOOSlNBphWrKEur7MlqrI27UeBXcxGfmSV3zqyI7PFbP9I6hL/
	U6pV4YL5lJ/6Hq5BuJ0hYxAOgOkVhwBHWgFjkY1ERFm0HBcRijtgZh5p5CzTwsBbqMF8T0Al38+
	EhUrPVnW2BXRE2lcKk4BShgxcvSU9l2wZD822wIVvRjkeZLogE8IfiUqlO+nTE
X-Received: by 2002:a05:6870:80c7:b0:3d4:94ef:d05c with SMTP id 586e51a60fabf-416ab5ff55amr3117860fac.21.1772699762872;
        Thu, 05 Mar 2026 00:36:02 -0800 (PST)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com. [209.85.161.51])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4160d26d9absm21094444fac.16.2026.03.05.00.36.02
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:36:02 -0800 (PST)
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-6798f3b7163so6040046eaf.3
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 00:36:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW3IswVChEY8k2kZQ+PGjS+ygjddYYtezROrK54VRIlIpqX+rqSfzvooN7D18kg5sGsCL7zGIcM/nQJkg==@lists.infradead.org
X-Received: by 2002:a05:6102:2ac9:b0:5f7:24dc:3ac3 with SMTP id
 ada2fe7eead31-5ffaaa86250mr1899404137.7.1772699399463; Thu, 05 Mar 2026
 00:29:59 -0800 (PST)
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-18-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-18-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 09:29:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXUBhpnFEnnTfyPdECWqNmKLweupX=FY2SedYA3bapG2g@mail.gmail.com>
X-Gm-Features: AaiRm53mHozL13yvxji6rv0MKzaGvWxuhr7SWHD2SjBJ0VWNhqppZZeXezGpDhg
Message-ID: <CAMuHMdXUBhpnFEnnTfyPdECWqNmKLweupX=FY2SedYA3bapG2g@mail.gmail.com>
Subject: Re: [PATCH phy-next 17/22] net: renesas: rswitch: include PHY
 provider header
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
	UNGLinuxDriver@microchip.com, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Michael Dege <michael.dege@renesas.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_083605_619674_AEF9EBEC 
X-CRM114-Status: GOOD (  32.10  )
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

On Wed, 4 Mar 2026 at 19:00, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> As a PHY consumer driver, the Renesas rswitch dereferences internal
> fields of struct phy, something which shouldn't be done, as that is
> going to be made an opaque pointer.
>
> It is quite clearly visible that the driver is tightly coupled with the
> drivers/phy/renesas/r8a779f0-ether-serdes.c, which puts heavy pressure
> on the Generic PHY subsystem.
>
> This was discussed before here:
> https://lore.kernel.org/linux-phy/20260211194541.cdmibrpfn6ej6e74@skbuf/
>
> but to summarize, it is generally expected that when a Generic PHY
> function is called, it takes effect immediately. When this doesn't
> happen, the PHY provider driver must change its implementation rather
> than the consumer be made to work around it. PHY providers which rely on
> a hardcoded call sequence in the consumer are just lazy and wrong.
>
> The most obvious example is commit 5cb630925b49 ("net: renesas: rswitch:
> Add phy_power_{on,off}() calling"). Problem description:
> - Ethernet PHYs may change phydev->interface. When this happens, the
>   SerDes must learn of the new phydev->interface using phy_set_mode_ext().
> - drivers/phy/renesas/r8a779f0-ether-serdes.c implements phy_set_mode_ext(),
>   but this only caches the mode and submode into channel->phy_interface
>   and applies this to hardware during phy_power_on().
>
> The commit author decided to work around this at the consumer site, by
> power cycling the PHY for the configuration to take effect.
>
> This had a worse implication from an API perspective in subsequent
> commit 053f13f67be6 ("rswitch: Fix imbalance phy_power_off() calling").
> It was observed that phy_power_on() and phy_power_off() calls need to be
> balanced, and so, the consumer decided to start looking at the struct
> phy :: power_count (the technical reason why I'm making this change).
>
> This is also wrong from an API perspective because
> - a consumer should only care about its own vote on the PHY power state.
>   If this is a multi-port submode like QSGMII, a single phy_power_off()
>   call will not actually turn the PHY off (nor should it).
> - the power_count is written under the &phy->mutex, but read unlocked
>   here.
>
> The rswitch and r8a779f0-ether-serdes drivers both need to be completely
> rethought in terms of Generic PHY API call sequence. There is no quick
> fix to apply. Just include the PHY provider API along with the consumer
> one, to keep working as before when struct phy will be made an opaque
> pointer to normal PHY consumers. But this is a bad offender (and it's
> not even a provider) so add a FIXME.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
