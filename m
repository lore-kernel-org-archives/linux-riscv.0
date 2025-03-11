Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F67CC282EC
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 15:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JT/YMqoSjqUwSRhe7OulouHHr/LXJtPSVgPSEOOaTg4=; b=053mw4dCTohknu
	+wkjGRB959ih/sIG3SJ+LeMCPNOUlmtVobH+9pks73V/+ruPw+znAbBIw0SiOerqPxfUddYXrRgei
	bt4kQoExGXdXHIYqxB67SPEcmEpfUOUA27SNVA72m7j/zir1spPQOcSDsV/uHYaNhNiSpCJGnGbZw
	r7gERhxilFQh3StzKVyvE5piRlQu/wD44JsZzkKAVa9Tmvn05HW+U96yqtRbyjgSjtnEi4RJJyeNV
	AJn27bCtZiRD1XlMjx+Q6VbtfECZlm/b1FLRTNgxiP4DE/rGjuPG4XYtF6jE2vUuOVQlAmVCjjTeo
	7GxwLTvpvffxhA8Tf51w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1U2-000000068ja-1sWM;
	Tue, 11 Mar 2025 15:25:30 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts1RE-000000067ZW-0E30
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 15:22:37 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-6fd8be1e534so52935387b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 11 Mar 2025 08:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741706555; x=1742311355; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HdiaqU+kYXkNBNnpqC5PVQou0G4lEwUYRv6GT9pOGpI=;
        b=EgRLhvY30JlfIRfTgCXNlnJYFOv6e6Mbtof4MmDKP2XLmAKt4mKNZkyP79egNjaaNB
         28PIwCUVFEPSgWy+QHeeHXZmGu6fCFYHYnfg+F6ZQl//vbOW0WR66QYNbwYR4hWwiNB4
         QJULHxAMZc8tQx8SIpLErGFI/r4HBokfZ0R9la8P0KWInypg5+MvdeGv7eF17ewl4AGi
         97kFTxFD0DzERw5gxOp85uZ+FqXzdH20eA8qE+5KtUH9J58oJdEqCgPwVwbddPQX+nhz
         IrbUHTGpZcYyr+4TuruWDRB08Wl8ZRp9tuod/CFGZa9WiJ1qV85Dk+F9bdnQRj3X3pri
         ZOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741706555; x=1742311355;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HdiaqU+kYXkNBNnpqC5PVQou0G4lEwUYRv6GT9pOGpI=;
        b=nh9kuxxHCbfKmFvw3yIcsTwWxk2WLtJvu5iU+DeNNnnYhK8hHPC7lSyO5t1cWlPyBO
         yPTe53uGq8HAyOTzaGuxCEpZCIW980M5DR2s0Rcbdokm5GasPTltUl7uW8cd8q2El+Dl
         CUHj/1MBi+MHXzC8sz3+d2wgT2iqLCVAckYDuJAhAuB+XBKQeCj2KlZhIrs7mZBKVhgE
         ZuEAqBfd96z65VSPwVDm3bKr8+GStn8MnkMy1WHqe52KdLsWskXmdL7HiaiXF4xQTKPA
         jhcpXJyfdMbzmADGTvMjMC+8E4s1/qT/dpqIUOC5AlhYD46B5QmoCYff/vJwC7dduumt
         efFA==
X-Forwarded-Encrypted: i=1; AJvYcCXfL/YiW+tIt1/Z2KVfx1HEcVrhml6j7Q/E/F01CL2jhoR/o2jwN/ZnoS4bIPWgXs2U0lGeUT5RNhYIRw==@lists.infradead.org
X-Gm-Message-State: AOJu0YysTmGvF8AvpN6M68aSYxCz91wGNjOyHUgS/yUPVJsuwtQZm+Hu
	r/J43r3LWWyn9I/vVdr5xCkx5hwchZqpx/dmIex3VmPrRwxo6iQhcEEetqLLeqJ6U3UnPhRJEM9
	SDSilZsvz0A+QjeX4KcEgO1x4yUpgFVdhwKEaPA==
X-Gm-Gg: ASbGncvRQmt6/54RTDS2RsuwleHpo/DIb20fn/LesqmYz7BNQ7/VO8PLEV7nhyv5PAK
	7Wf1vjvPFHSbEkuV/rRo53S7jDCvd108ln989Y60cajP7x18YDFKpwEpwnzew0EM2txJbqJOs4I
	MMj0z4mnuqq1DVjYTlcv1/5Hb3C7k=
X-Google-Smtp-Source: AGHT+IGAy6+55/xUbWPLWAhWa/JJEH75eRRXo5nC8iwxe2xNn2XBzu/ByvzI/h9Bw5amhUiPp08ireVcbtB30aKD1pc=
X-Received: by 2002:a05:690c:688f:b0:6f9:88b7:b6b7 with SMTP id
 00721157ae682-6febf3e990dmr252844457b3.37.1741706554935; Tue, 11 Mar 2025
 08:22:34 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250310090220eucas1p1d5cf6a56935e21b5854f77fdc22236b1@eucas1p1.samsung.com>
 <20250310090211.286549-1-m.wilczynski@samsung.com> <20250310090211.286549-5-m.wilczynski@samsung.com>
In-Reply-To: <20250310090211.286549-5-m.wilczynski@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 11 Mar 2025 16:21:59 +0100
X-Gm-Features: AQ5f1JoXRXq5ucc-B5U0o3JR0rVlad9-RVtJACjXjl-xVuXRu_bgY0MVKH5Qe8E
Message-ID: <CAPDyKFpAxkVgscMQpe2MZFCmNyaFq9YqiPQknLDf3CJ9zMdZ6g@mail.gmail.com>
Subject: Re: [PATCH v7 4/5] pmdomain: thead: Add power-domain driver for TH1520
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, 
	guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang@kernel.org, 
	m.szyprowski@samsung.com, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_082236_091539_F2825D2C 
X-CRM114-Status: GOOD (  24.06  )
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

On Mon, 10 Mar 2025 at 10:02, Michal Wilczynski
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
> +       aon_chan = th1520_aon_init(dev);
> +       if (IS_ERR(aon_chan))
> +               return dev_err_probe(dev, PTR_ERR(aon_chan),
> +                                    "Failed to get AON channel\n");
> +
> +       platform_set_drvdata(pdev, aon_chan);
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
> +       return of_genpd_add_provider_onecell(dev->of_node, pd_data);

If this fails, we should clean-up properly, not just returning an error code.

> +}
> +
> +static void th1520_pd_remove(struct platform_device *pdev)
> +{
> +       struct th1520_aon_chan *aon_chan = platform_get_drvdata(pdev);
> +
> +       th1520_aon_deinit(aon_chan);

The genpd providers need to be cleaned-up here too.

Or, as I said before, if you think doing a proper clean-up is going to
be a problem (in most cases it is), we can also make this a
builtin_platform_driver() with "suppress_bind_attrs = true".

> +}
> +
> +static const struct of_device_id th1520_pd_match[] = {
> +       { .compatible = "thead,th1520-aon" },
> +       { /* Sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, th1520_pd_match);
> +
> +static struct platform_driver th1520_pd_driver = {
> +       .driver = {
> +               .name = "th1520-pd",
> +               .of_match_table = th1520_pd_match,
> +       },
> +       .probe = th1520_pd_probe,
> +       .remove = th1520_pd_remove,
> +};
> +module_platform_driver(th1520_pd_driver);
> +
> +MODULE_AUTHOR("Michal Wilczynski <m.wilczynski@samsung.com>");
> +MODULE_DESCRIPTION("T-HEAD TH1520 SoC power domain controller");
> +MODULE_LICENSE("GPL");
> --
> 2.34.1
>

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
