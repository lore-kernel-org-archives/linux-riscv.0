Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 269DEC369C2
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 08:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tP8//LNepw7T+C8QUXe6Ynx1+6xa9kpoLKAuOQ2UqD0=; b=eScZzbojclpIzc
	sgDdjcY8WFh25HaCwZ/K3R8DWMks7Rj9yR6MdgoLWI7X70NM9xsUea5CCHYA5lWaWtQw0aZqN5gJZ
	b4vsS1IxgXLLAQcr3SyX82yH9YEQu3ccdkDDwRVOMIsQznBg4EI5+AWPrBumC4qhhffFIwnPnwzbO
	jo5k850nLEJT7ptJ+FZxcE5MvshNN8+JLVxYF3m3SirUsy/rufx16z+lhD1HxHy5yrvl4xS4m4ytg
	k9bcgHZqYwufM6OOupTRnYEmoBB0IJp4EnBekGoeu6juPkUzVeFo7tY8lyygHwYJUNqlEkhM8VVMz
	b15HQdRAav2IsIt9ia1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8EmD-0000000GPia-002E;
	Fri, 25 Apr 2025 08:51:17 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Em9-0000000GPgG-1Smd
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 08:51:15 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e6deb3eb7dbso1667620276.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Apr 2025 01:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745571072; x=1746175872; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9GQfk+3zeIIKzUeHjqMJCPYPGJndG19Wjdr7pJZStAA=;
        b=qQ2Je9/OQj/EDy7Sy1NNsSaIfzxDv1E8TaCUaYV6ffdalGtGuwbXJc8U880/7xRPvs
         10PNtP6McOgbytIcG9/UUWVofetUp77TPV9Xf9eoU4XnZx3X7WnzNWXxkeQ6jGCjzEda
         8zUpEH+Pb1wqMWHa8uHnfOV8m3lpz68ywvuazsLklEPKR6zDgb8GgL/mqIMwSDI9huiG
         bfbRnfeNTjkIN/2K91G3+9LZbrF4esXNuqXPnPWzut3wr5JHEhW1c/Ec2ra6WPwltWLe
         HFqj2FdE8DSfSF8Gb1amv/hQQie8wQmRhPP6co7hmNTMw+rNrL9E1XNxrLkQdxSPnhW2
         48WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571072; x=1746175872;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9GQfk+3zeIIKzUeHjqMJCPYPGJndG19Wjdr7pJZStAA=;
        b=AW+vDVoAf7sybIO9gg4EkrXcGSP0cGfLpXNIZwNL39wKov5VneSlB/H6eyGwOzVVR2
         Xo5R/erlL06weWUo82Q+KhyoGcJzm8stEorN638DR7/lmO+FmA4Y9KFOESPPTjIh2pBr
         ZPCk28y9Y5MBGPWDJHgaoqqob6lvHLpUC15F6v2vs43dJ4qByK3J5ZQz/RI2E2pmkVo2
         KJJOhatZqwKlLLehS9ch+eAzN05DKTG6YvXbS+BEcjiYdHeubG7RIE5coa7PJVdicPYP
         tQ+cKoHNOi9wRmy0aj+RjU5f6j29CFoqSB8oXHCRz7idqdSnuhXMetyVgmTD3E0kmteq
         oe7A==
X-Forwarded-Encrypted: i=1; AJvYcCW5SnZaXFN6kKctqX6TQPSQwCd9Ti9bVnFjm1jQPX3NGWB7ACrSJh/+kRqmJVA2Bb+thCIN6mX37e5/RA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa7hykO727LTHO1oFuK6pt7PPYteWrf5Dyp8D2+9becsnpj+mL
	NyV/9Mri3vBf5JtI/7OCJIsBlHVEY7J4URQaIYOFe2P2z252qPppdG58LwK4UBOJTrgNx+xaQGK
	JTUM6sCcPtZSxdnWeMixZX3kGsBeBRCV+Mv4g4A==
X-Gm-Gg: ASbGncu1LbJok8D4wR4PNqdILp1bXC2pPGcGyxRopy9koeYYBOFtCreyITVR01Zs+sU
	YyNjx9rZWJ+XQEL1v2oRBlQ8hE3SOuzCG2L+T2onDHwSGRjXMVbSbTNZBhU7AFWlCH2sNci0e4R
	Da4H6udu72ADT9KlP6g8sOjcU=
X-Google-Smtp-Source: AGHT+IE4B65BDpklwFJDxIOPbJ0Hzq8wAs89aXC+F3ZxVBmeN5cyfnzySlvgMFu/NcYkSePA20evRaUlepPFtsP+koI=
X-Received: by 2002:a05:6902:2807:b0:e72:8658:5839 with SMTP id
 3f1490d57ef6-e7316881e05mr2063821276.32.1745571072238; Fri, 25 Apr 2025
 01:51:12 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250414185316eucas1p2c2dbd33788d9141773546f7a479ac288@eucas1p2.samsung.com>
 <20250414-apr_14_for_sending-v2-0-70c5af2af96c@samsung.com> <20250414-apr_14_for_sending-v2-3-70c5af2af96c@samsung.com>
In-Reply-To: <20250414-apr_14_for_sending-v2-3-70c5af2af96c@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 25 Apr 2025 10:50:35 +0200
X-Gm-Features: ATxdqUExFbuTIHs9dJyH7CbSVLWAZOfs6hMxjA5h2peJwwEgi8V0avo5M5kQ388
Message-ID: <CAPDyKFqX5cjQe3-MX3W9wMoQW3gzwSvb0QMf-_sTJuq_TeGsCg@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] pmdomain: thead: Add GPU-specific clock and reset
 handling for TH1520
To: Michal Wilczynski <m.wilczynski@samsung.com>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
	Matt Coster <matt.coster@imgtec.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	m.szyprowski@samsung.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_015113_514633_30B8E185 
X-CRM114-Status: GOOD (  38.08  )
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

+ Bartosz

On Mon, 14 Apr 2025 at 20:53, Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> Extend the TH1520 power domain driver to manage GPU related clocks and
> resets via generic PM domain start/stop callbacks.
>
> The TH1520 GPU requires a special sequence to correctly initialize:
> - Enable the GPU clocks
> - Deassert the GPU clkgen reset
> - Delay for a few cycles to satisfy hardware requirements
> - Deassert the GPU core reset
>
> This sequence is SoC-specific and must be abstracted away from the
> Imagination GPU driver, which expects only a standard single reset
> interface. Following discussions with kernel maintainers [1], this
> logic is placed inside a PM domain, rather than polluting the clock or
> reset frameworks, or the GPU driver itself.

Speaking about special sequences for power-on/off devices like this
one, that's a known common problem. We actually have a generic
subsystem for this now, drivers/power/sequencing/*.

Perhaps it's worth having a look at that, it should allow us to
abstract things, so the GPU driver can stay more portable.

Kind regards
Uffe

>
> To support this, the TH1520 PM domain implements `attach_dev` and
> `detach_dev` callbacks, allowing it to dynamically acquire clock and
> reset resources from the GPU device tree node at runtime. This allows to
> maintain the separation between generic drivers and SoC-specific
> integration logic.
>
> As a result, the PM domain not only handles power sequencing but also
> effectively acts as the SoC specific "glue driver" for the GPU device,
> encapsulating all TH1520-specific clock and reset management.
>
> This approach improves maintainability and aligns with the broader
> direction of treating PM domains as lightweight SoC-specific power
> management drivers [2].
>
> [1] - https://lore.kernel.org/all/CAPDyKFqsJaTrF0tBSY-TjpqdVt5=6aPQHYfnDebtphfRZSU=-Q@mail.gmail.com/
> [2] - https://osseu2024.sched.com/event/1ej38/the-case-for-an-soc-power-management-driver-stephen-boyd-google
>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/pmdomain/thead/th1520-pm-domains.c | 199 +++++++++++++++++++++++++++++
>  1 file changed, 199 insertions(+)
>
> diff --git a/drivers/pmdomain/thead/th1520-pm-domains.c b/drivers/pmdomain/thead/th1520-pm-domains.c
> index f702e20306f469aeb0ed15e54bd4f8309f28018c..75412efb195eb534c2e8ff10ced65ed4c4d2452c 100644
> --- a/drivers/pmdomain/thead/th1520-pm-domains.c
> +++ b/drivers/pmdomain/thead/th1520-pm-domains.c
> @@ -5,10 +5,13 @@
>   * Author: Michal Wilczynski <m.wilczynski@samsung.com>
>   */
>
> +#include <linux/clk.h>
> +#include <linux/delay.h>
>  #include <linux/firmware/thead/thead,th1520-aon.h>
>  #include <linux/slab.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> +#include <linux/reset.h>
>
>  #include <dt-bindings/power/thead,th1520-power.h>
>
> @@ -16,6 +19,15 @@ struct th1520_power_domain {
>         struct th1520_aon_chan *aon_chan;
>         struct generic_pm_domain genpd;
>         u32 rsrc;
> +
> +       /* PM-owned reset */
> +       struct reset_control *clkgen_reset;
> +
> +       /* Device-specific resources */
> +       struct device *attached_dev;
> +       struct clk_bulk_data *clks;
> +       int num_clks;
> +       struct reset_control *gpu_reset;
>  };
>
>  struct th1520_power_info {
> @@ -61,6 +73,177 @@ static int th1520_pd_power_off(struct generic_pm_domain *domain)
>         return th1520_aon_power_update(pd->aon_chan, pd->rsrc, false);
>  }
>
> +static int th1520_gpu_init_consumer_clocks(struct device *dev,
> +                                          struct th1520_power_domain *pd)
> +{
> +       static const char *const clk_names[] = { "core", "sys" };
> +       int i, ret;
> +
> +       pd->num_clks = ARRAY_SIZE(clk_names);
> +       pd->clks = devm_kcalloc(dev, pd->num_clks, sizeof(*pd->clks), GFP_KERNEL);
> +       if (!pd->clks)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < pd->num_clks; i++)
> +               pd->clks[i].id = clk_names[i];
> +
> +       ret = devm_clk_bulk_get(dev, pd->num_clks, pd->clks);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to get GPU clocks\n");
> +
> +       return 0;
> +}
> +
> +static int th1520_gpu_init_consumer_reset(struct device *dev,
> +                                         struct th1520_power_domain *pd)
> +{
> +       int ret;
> +
> +       pd->gpu_reset = reset_control_get_exclusive(dev, NULL);
> +       if (IS_ERR(pd->gpu_reset)) {
> +               ret = PTR_ERR(pd->gpu_reset);
> +               pd->gpu_reset = NULL;
> +               return dev_err_probe(dev, ret, "Failed to get GPU reset\n");
> +       }
> +
> +       return 0;
> +}
> +
> +static int th1520_gpu_init_pm_reset(struct device *dev,
> +                                   struct th1520_power_domain *pd)
> +{
> +       pd->clkgen_reset = devm_reset_control_get_exclusive(dev, "gpu-clkgen");
> +       if (IS_ERR(pd->clkgen_reset))
> +               return dev_err_probe(dev, PTR_ERR(pd->clkgen_reset),
> +                                    "Failed to get GPU clkgen reset\n");
> +
> +       return 0;
> +}
> +
> +static int th1520_gpu_domain_attach_dev(struct generic_pm_domain *genpd,
> +                                       struct device *dev)
> +{
> +       struct th1520_power_domain *pd = to_th1520_power_domain(genpd);
> +       int ret;
> +
> +       /* Enforce 1:1 mapping - only one device can be attached. */
> +       if (pd->attached_dev)
> +               return -EBUSY;
> +
> +       /* Initialize clocks using the consumer device */
> +       ret = th1520_gpu_init_consumer_clocks(dev, pd);
> +       if (ret)
> +               return ret;
> +
> +       /* Initialize consumer reset using the consumer device */
> +       ret = th1520_gpu_init_consumer_reset(dev, pd);
> +       if (ret) {
> +               if (pd->clks) {
> +                       clk_bulk_put(pd->num_clks, pd->clks);
> +                       kfree(pd->clks);
> +                       pd->clks = NULL;
> +                       pd->num_clks = 0;
> +               }
> +               return ret;
> +       }
> +
> +       /* Mark device as platform PM driver managed */
> +       device_platform_resources_set_pm_managed(dev, true);
> +       pd->attached_dev = dev;
> +
> +       return 0;
> +}
> +
> +static void th1520_gpu_domain_detach_dev(struct generic_pm_domain *genpd,
> +                                        struct device *dev)
> +{
> +       struct th1520_power_domain *pd = to_th1520_power_domain(genpd);
> +
> +       /* Ensure this is the device we have attached */
> +       if (pd->attached_dev != dev) {
> +               dev_warn(dev,
> +                        "tried to detach from GPU domain but not attached\n");
> +               return;
> +       }
> +
> +       /* Remove PM managed flag when detaching */
> +       device_platform_resources_set_pm_managed(dev, false);
> +
> +       /* Clean up the consumer-owned resources */
> +       if (pd->gpu_reset) {
> +               reset_control_put(pd->gpu_reset);
> +               pd->gpu_reset = NULL;
> +       }
> +
> +       if (pd->clks) {
> +               clk_bulk_put(pd->num_clks, pd->clks);
> +               kfree(pd->clks);
> +               pd->clks = NULL;
> +               pd->num_clks = 0;
> +       }
> +
> +       pd->attached_dev = NULL;
> +}
> +
> +static int th1520_gpu_domain_start(struct device *dev)
> +{
> +       struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
> +       struct th1520_power_domain *pd = to_th1520_power_domain(genpd);
> +       int ret;
> +
> +       /* Check if we have all required resources */
> +       if (pd->attached_dev != dev || !pd->clks || !pd->gpu_reset ||
> +           !pd->clkgen_reset)
> +               return -ENODEV;
> +
> +       ret = clk_bulk_prepare_enable(pd->num_clks, pd->clks);
> +       if (ret)
> +               return ret;
> +
> +       ret = reset_control_deassert(pd->clkgen_reset);
> +       if (ret)
> +               goto err_disable_clks;
> +
> +       /*
> +        * According to the hardware manual, a delay of at least 32 clock
> +        * cycles is required between de-asserting the clkgen reset and
> +        * de-asserting the GPU reset. Assuming a worst-case scenario with
> +        * a very high GPU clock frequency, a delay of 1 microsecond is
> +        * sufficient to ensure this requirement is met across all
> +        * feasible GPU clock speeds.
> +        */
> +       udelay(1);
> +
> +       ret = reset_control_deassert(pd->gpu_reset);
> +       if (ret)
> +               goto err_assert_clkgen;
> +
> +       return 0;
> +
> +err_assert_clkgen:
> +       reset_control_assert(pd->clkgen_reset);
> +err_disable_clks:
> +       clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
> +       return ret;
> +}
> +
> +static int th1520_gpu_domain_stop(struct device *dev)
> +{
> +       struct generic_pm_domain *genpd = pd_to_genpd(dev->pm_domain);
> +       struct th1520_power_domain *pd = to_th1520_power_domain(genpd);
> +
> +       /* Check if we have all required resources and if this is the attached device */
> +       if (pd->attached_dev != dev || !pd->clks || !pd->gpu_reset ||
> +           !pd->clkgen_reset)
> +               return -ENODEV;
> +
> +       reset_control_assert(pd->gpu_reset);
> +       reset_control_assert(pd->clkgen_reset);
> +       clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
> +
> +       return 0;
> +}
> +
>  static struct generic_pm_domain *th1520_pd_xlate(const struct of_phandle_args *spec,
>                                                  void *data)
>  {
> @@ -99,6 +282,22 @@ th1520_add_pm_domain(struct device *dev, const struct th1520_power_info *pi)
>         pd->genpd.power_off = th1520_pd_power_off;
>         pd->genpd.name = pi->name;
>
> +       /* there are special callbacks for the GPU */
> +       if (pi == &th1520_pd_ranges[TH1520_GPU_PD]) {
> +               /* Initialize the PM-owned reset */
> +               ret = th1520_gpu_init_pm_reset(dev, pd);
> +               if (ret)
> +                       return ERR_PTR(ret);
> +
> +               /* No device attached yet */
> +               pd->attached_dev = NULL;
> +
> +               pd->genpd.dev_ops.start = th1520_gpu_domain_start;
> +               pd->genpd.dev_ops.stop = th1520_gpu_domain_stop;
> +               pd->genpd.attach_dev = th1520_gpu_domain_attach_dev;
> +               pd->genpd.detach_dev = th1520_gpu_domain_detach_dev;
> +       }
> +
>         ret = pm_genpd_init(&pd->genpd, NULL, true);
>         if (ret)
>                 return ERR_PTR(ret);
>
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
