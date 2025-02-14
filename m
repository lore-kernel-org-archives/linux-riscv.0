Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E373BC02198
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Feb 2025 11:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G6qo/AyfYRG3KbCO/HeClhJ5RCjLll6GfiHn+4qe/bc=; b=P8fv84QPkW9EHV
	SNkJvtk+slc7vqDHbKH3s5QP0tws4yzvGTc4DnBeRABqC1Ww/8eGbm5QjNTryh95Tmflc23GV0USj
	EFgjz5CQQIUCJ2kbr8oxW7st1JVqSuHzl0MlDFyW/1MDGduX9BAQrDsKW+pMQgfZKl9I0aSDWqJ6p
	Y0qzomAwTaU58gjonhv7VWmREdJuYp/EKROkKWwwMJ65ypXJMQTWWTeE1jYUde3txRh+7kknFlmQa
	xL/WBDpdMZ9AMQ81rCP7rx20lA8sMJjkxLRXl8FO167Obr9b+IxRcZCLSY29qYub82DA2rGOKgEV9
	s/5XXnqdmVKxwwheOOoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1titgj-0000000Edg4-43Ml;
	Fri, 14 Feb 2025 11:16:53 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1titgR-0000000EdbT-0FDE
	for linux-riscv@lists.infradead.org;
	Fri, 14 Feb 2025 11:16:36 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-e4930eca0d4so1451876276.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Feb 2025 03:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739531794; x=1740136594; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9jM48aKf/sbl9H/oOIzSS3d/8y4m7nkDsYlbYDKZEDc=;
        b=BgaQQMTO8OXsuLggJebswkN0qWeiffTqILYERCYLG2abhe/CF4RAEv1JoekkvbmcsV
         2owKG+LdC5jL2aniPD0WkKZdF1+Oseu6mKsJivKLRwUpjkzWlE7Swh+X51RMJ9+YD0I8
         F9InyH7CHzljze0khPHBp2wOc8wzVum3WIxUH4Pr+QyOCbAs7cGAAh+3YYNAZgZwlD32
         pVSwD7gi6ul8CjVxb3AuYD6rYDiu8u81mJa1mfAKD0I5ts9C85BBvRK1BErl3+zebRyT
         UJ7YXBAJS183GYza6/PzQOglmm1cmerVt1tje/TZoUQ/y9ur0pYw6s0sDwisjvUgA0Zn
         2c/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739531794; x=1740136594;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9jM48aKf/sbl9H/oOIzSS3d/8y4m7nkDsYlbYDKZEDc=;
        b=Dxe5VNYOrFXV0FV5OylPh98lQGpx2WE+FvyLE48LiIODS/7lVuZBlhVQGtWnlCt0mi
         zJzWxhsvlNZqWbi9ef1XPYhaNW77KOIXBuCpTH5Xhyo0JH1EAp2kZP6Q0XEvW1EyXTT+
         l5Qpu07YD+x8HIl+lgq75pdnHMTMZJStNYYmd0mPPod4z1jR9jJoYjSlbqqRZr8a40DB
         blUmohfx25beE1Q2fsoM1jbrf7/99vCyWXEEtXqXApTfLcMxSsf6WAEHU7N+5bUhmp9B
         Th75kvc5zGgKB8x15QlsCkIoRc67WRz84F4A0Hu3EsLRxXCXKyufnzmp8Cm/934k9pJo
         np9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUp9olzwTTDhZ7gA1W7SAKUEhvIv+Pe8AEfF/aC40PfANdXkDA05woypMhmlX5KpSTlBbtbTzcd6FjSxw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4I1K+MvA2NSMrrjt3yBxs2zF6YtaADvyfVGRn1V9vaDbrMnUx
	rdd4t225Z7GuvLuhh4qtU7Yb2dh/XxDq/ceHIxmhVzT+QHg0xHokFg5dFxIc19lYGOU5nTNzIl3
	/RalNgRtw5JVlVvKOSh4R4cWGC/X13qUx7My/ww==
X-Gm-Gg: ASbGncvbfp/2mZYSXmrjyeCaYJKs7iiAtd20hCzI8eHmPQhX0uWdHqvQWjBEoW0UsTR
	gUV9Dn7nVQRjSlLHSk5DGKRYd3v6dSlLm73uDgnSYgpSGyb4OJfV44nEkCHjjrZuhGSbonzWFtQ
	==
X-Google-Smtp-Source: AGHT+IE6woj8oPDle191tVLCdn9IrSTd52LbGDiCC/HBR/zbujT5GVfsySFK4K0WQQyEViMhqMK63WlGFClc8+pjkbk=
X-Received: by 2002:a05:6902:841:b0:e5b:323b:a1a4 with SMTP id
 3f1490d57ef6-e5d9f180dc6mr10461212276.41.1739531793901; Fri, 14 Feb 2025
 03:16:33 -0800 (PST)
MIME-Version: 1.0
References: <CGME20250128194832eucas1p15db9ed3575703812ecc0374ffc5b2861@eucas1p1.samsung.com>
 <20250128194816.2185326-1-m.wilczynski@samsung.com> <20250128194816.2185326-7-m.wilczynski@samsung.com>
In-Reply-To: <20250128194816.2185326-7-m.wilczynski@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 14 Feb 2025 12:15:58 +0100
X-Gm-Features: AWEUYZmWRXn0bzCrMyNA_HXGOtxuTTirzpyDWms-8p0mq8f1JPxvJIR_18CPMCg
Message-ID: <CAPDyKFrcs5Hc-X6qExEA992MoQcakCuKRjw7cek3KpYZihsLFw@mail.gmail.com>
Subject: Re: [PATCH v4 06/18] pmdomain: thead: Add power-domain driver for TH1520
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org, 
	wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com, 
	matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, jszhang@kernel.org, 
	p.zabel@pengutronix.de, m.szyprowski@samsung.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_031635_108760_F771AE0B 
X-CRM114-Status: GOOD (  24.58  )
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

On Tue, 28 Jan 2025 at 20:48, Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> The T-Head TH1520 SoC contains multiple power islands that can be
> programmatically turned on and off using the AON (Always-On) protocol
> and a hardware mailbox [1]. The relevant mailbox driver has already been
> merged into the mainline kernel in commit 5d4d263e1c6b ("mailbox:
> Introduce support for T-head TH1520 Mailbox driver");
>
> Introduce a power-domain driver for the TH1520 SoC, which is using AON
> firmware protocol to communicate with E902 core through the hardware
> mailbox. This way it can send power on/off commands to the E902 core.
>
> The interaction with AUDIO power island e.g trying to turn it OFF proved
> to crash the firmware running on the E902 core. Introduce the workaround
> to disable interacting with the power island.
>
> Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf [1]
>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---

[...]

> +
> +static int th1520_pd_probe(struct platform_device *pdev)
> +{
> +       struct generic_pm_domain **domains;
> +       struct genpd_onecell_data *pd_data;
> +       struct th1520_aon_chan *aon_chan;
> +       struct device *dev = &pdev->dev;
> +       int i;
> +
> +       aon_chan = dev_get_drvdata(dev->parent);
> +       if (!aon_chan) {
> +               dev_err(dev, "Failed to get AON channel from parent\n");
> +               return -EINVAL;
> +       }

As pointed out on patch4. Rather than receiving the aon_chang from the
parent device like this, it seems better to receive it from a call to
a library function provided by the FW library.

> +
> +       domains = devm_kcalloc(dev, ARRAY_SIZE(th1520_pd_ranges),
> +                              sizeof(*domains), GFP_KERNEL);
> +       if (!domains)
> +               return -ENOMEM;
> +
> +       pd_data = devm_kzalloc(dev, sizeof(*pd_data), GFP_KERNEL);
> +       if (!pd_data)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < ARRAY_SIZE(th1520_pd_ranges); i++) {
> +               struct th1520_power_domain *pd;
> +
> +               if (th1520_pd_ranges[i].disabled)
> +                       continue;
> +
> +               pd = th1520_add_pm_domain(dev, &th1520_pd_ranges[i]);
> +               if (IS_ERR(pd))
> +                       return PTR_ERR(pd);
> +
> +               pd->aon_chan = aon_chan;
> +               domains[i] = &pd->genpd;
> +               dev_dbg(dev, "added power domain %s\n", pd->genpd.name);
> +       }
> +
> +       pd_data->domains = domains;
> +       pd_data->num_domains = ARRAY_SIZE(th1520_pd_ranges);
> +       pd_data->xlate = th1520_pd_xlate;
> +
> +       /*
> +        * Initialize all power domains to off to ensure they start in a
> +        * low-power state. This allows device drivers to manage power
> +        * domains by turning them on or off as needed.
> +        */
> +       th1520_pd_init_all_off(domains, dev);
> +
> +       return of_genpd_add_provider_onecell(dev->parent->of_node, pd_data);
> +}
> +
> +static struct platform_driver th1520_pd_driver = {
> +       .driver = {
> +               .name = "th1520-pd",
> +       },
> +       .probe = th1520_pd_probe,
> +};
> +module_platform_driver(th1520_pd_driver);

There is no ->remove() callback.

Either add one or make this a builtin_platform_driver() with
"suppress_bind_attrs = true".

> +
> +MODULE_AUTHOR("Michal Wilczynski <m.wilczynski@samsung.com>");
> +MODULE_DESCRIPTION("T-HEAD TH1520 SoC power domain controller");
> +MODULE_LICENSE("GPL");
> --
> 2.34.1
>

Besides the minor thing above, this looks good to me!

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
