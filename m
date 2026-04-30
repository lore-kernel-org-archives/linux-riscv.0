Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BCBCCFA13
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Apr 2026 12:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uneCDpJmdJ9i4+3cky2m59oXGXpqVD2KymfIJWBr1S8=; b=HO4ET/Aj0omuB5
	y60bTvvMO8E/Yk/RJKRQsUKWLnAziHd5H4qcTJVnEDpFSn8wvHiSbQFYSTTfZEl0LDYubXZO6luX0
	TV3pf9fEHlsrNsCntIFhZqfDn2UDjr3v5ZpmMCMk4aW8+Ap3vt4+mIfSHMPF9WP6I9EJ/UyxOOawK
	7AEyQN0Z9HTlR1KNc7xRZyi0knVDBEws0mdVJWVNrIazJT+q8SFGyEmZGjJXL/UZCmPVC58eytTkk
	w2sJM6RijCMqjte6BiTPlxR8kD+PyzgKhHpWzRKYGfceKf8YSCb2HQmNVZ93hajLem0OQF7EplgEM
	/JFWZAb7HrlAsFnhCAZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQ9K-00000005QVA-2THm;
	Thu, 30 Apr 2026 12:05:46 +0000
Received: from mail-oi1-f174.google.com ([209.85.167.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIQ9F-00000005QTv-3Ubs
	for linux-riscv@lists.infradead.org;
	Thu, 30 Apr 2026 12:05:44 +0000
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-47bdee5bfc4so635697b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Apr 2026 05:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777550740; x=1778155540;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksIL4rip+tLI1Yx6QhQXSN6krUTnsd9SRkVzjQXrZjA=;
        b=QPR067KPLPH25wHLrBN11rNsTrAU7vIWbdrK7ay7bWsNKqjnj/MKUWNzdJjAgzA/p6
         sEHJO6TxgbXmO+xcpp19WI1gFtXJpdkRUC3e7dn7Jmvo9w+Bya+nrmpk/coaRz8qKy0Y
         7VFbsPQHaZowTH5mfcgQlYUPhXvh49IN1FmUyJ55dO0jLKYoifooZjhJwKNuSMgHeuwS
         pltcFPdyVG1etO5U1smRWGSM3m7SlASAlFYxwhHEPg4qBFObtf/NmP78c7bVPfS6vLxA
         Vt7Hhjnl0tIwWI5Zqw9zv4OLVH7sx7l1Jd8ViDW/jhI85Bn+w2SLbF5QLKAvFngqN6Za
         c/Rg==
X-Forwarded-Encrypted: i=1; AFNElJ+qEgcGQmSVy3PutFO3ZMbc4Ghwl7OAz0PQ5uuUbyQIkcRpumlCsYwBYMGrryH4Q0/xJDEH2FuhoQFDww==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKBrDhMTNGILLX+mBJ0aqdI2KrBky9PuLVAxYXUDFNDL4HJ+c5
	ncTevfGsXigfDf9nDkvQIFqPRcy5d4FdKBZu402FmrWaVpTOzl5iR5ClkxQV7BqINHk=
X-Gm-Gg: AeBDiesneOqxxeVgCh395iEvT1o5nFrj/pvMEILVoxN8XwCxqvpct90if1wl1UGjpxx
	Hp7c8fbZscmOpHWPzIyw33+m71aFV4OIQIBYdZQKduGb+JFESn3yzmSlNZW2eWTFXs8wB65g/3w
	8oWo/Tu2J+NG6X1DKxbu0D6PmJYSDjrH6UT4fZUVtduhxucy68c38rBz8Afjj3OTmPcmMPQYeQN
	k02vLn3DnrfpigwOkKdSGmUVmB8JNpvx9zVU8wHlSv+3c2Ha1WygNhzZp1sxRZMe9nabNzzJVjm
	pqHj4nj/KnZD8rdmJzAppWrXk8ClGdbW3DcMTdCGtM5Ta1bJsDsDqaNqSvOSDaPIWr8ywgYw2T4
	5G3RdnVr9rxvtjimjHa08tzuPTpVKHHZeL+RiliTl/wGD+0zvMsoP7dDh2WF7jJLmr5bFZMXp79
	oww9MXHR/42YIHlGLQCTz3StG2HAAGC/X/9FbvzqvDvRSxH/cwn8AzsuQMFe6onxETQB4i3SZ1q
	KEijefElqAzXA==
X-Received: by 2002:a05:6808:1b14:b0:479:d372:b7d0 with SMTP id 5614622812f47-47c61f6b745mr724367b6e.5.1777550740236;
        Thu, 30 Apr 2026 05:05:40 -0700 (PDT)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com. [209.85.167.176])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7deab80c7c3sm3318161a34.9.2026.04.30.05.05.39
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 05:05:39 -0700 (PDT)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-479d4df9035so1133850b6e.0
        for <linux-riscv@lists.infradead.org>; Thu, 30 Apr 2026 05:05:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+P6JMdekmaC5A5TZ1JTPesttMF9E2oCkNyusJcoo5KnAyJh4dpWq+dIP6gG/cYnGVyGqs/RSXQfUgHxw==@lists.infradead.org
X-Received: by 2002:a67:e708:0:b0:610:347f:9f3b with SMTP id
 ada2fe7eead31-62afc506100mr613209137.3.1777550404889; Thu, 30 Apr 2026
 05:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260430110652.558622-1-vladimir.oltean@nxp.com> <20260430110652.558622-18-vladimir.oltean@nxp.com>
In-Reply-To: <20260430110652.558622-18-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Apr 2026 13:59:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWbeeRmLf6Ae0Fr0un=-z7z5ONc_hDdjebP=KVkXHPbhw@mail.gmail.com>
X-Gm-Features: AVHnY4K0yYb6vTu9KdtDciwvAziqboYRX_ITZ386sa6ttixZ1EP_Mzy9gi4Pi0E
Message-ID: <CAMuHMdWbeeRmLf6Ae0Fr0un=-z7z5ONc_hDdjebP=KVkXHPbhw@mail.gmail.com>
Subject: Re: [PATCH v7 phy-next 17/27] phy: introduce phy_get_max_link_rate()
 helper for consumers
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-usb@vger.kernel.org, netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, Markus Schneider-Pargmann <msp@baylibre.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andy Yan <andy.yan@rock-chips.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_050541_876121_0E23AC34 
X-CRM114-Status: GOOD (  22.50  )
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

On Thu, 30 Apr 2026 at 13:07, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> Consumer drivers shouldn't dereference struct phy, not even to get to
> its attributes.
>
> We have phy_get_bus_width() as a precedent for getting the bus_width
> attribute, so let's add phy_get_max_link_rate() and use it in DRM and
> CAN drivers.
>
> In CAN drivers, the transceiver is acquired through devm_phy_optional_get()
> and NULL is given by the API as a non-error case, so the PHY API should
> also tolerate NULL coming back to it. This means we can further simplify
> the call sites that test for the NULL quality of the transceiver.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Acked-by: Markus Schneider-Pargmann <msp@baylibre.com> # m_can

Thanks for your patch!

>  drivers/net/can/rcar/rcar_canfd.c                   | 3 +--

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be> # rcar_canfd

> --- a/include/linux/phy/phy.h
> +++ b/include/linux/phy/phy.h
> @@ -57,6 +57,7 @@ int phy_notify_disconnect(struct phy *phy, int port);
>  int phy_notify_state(struct phy *phy, union phy_notify state);
>  int phy_get_bus_width(struct phy *phy);
>  void phy_set_bus_width(struct phy *phy, int bus_width);
> +u32 phy_get_max_link_rate(struct phy *phy);

This (and all the existing getters) should take a "const struct phy *".

>  #else
>  static inline struct phy *phy_get(struct device *dev, const char *string)
>  {

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
