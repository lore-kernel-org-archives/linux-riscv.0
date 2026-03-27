Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7971010F2865
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 20:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yB3hlrbatZYJIAvvOxvHDGk0ATGZo8CZh3Bc3kdtm5A=; b=URT3CYLHeyZG1u
	7m9h6mRuiwMHjE4u/cZ5Pbq3nacNM0v0ScDIlvfwf+ZxVVtm1ur6nxwoR4B3rg6bf2LoOdZjNqw/d
	W6BBB8iWtFX7UOa/pNtMtdtd2ReRbyLfzV7ME7dTPL/rxF2I+PduzQzDC2IiV9XqVPufLWDQWBbxW
	MaJm0wuWT/gOrlSO+oTFklBloVKUrb45MSbmI3Ux/r438aavgnxw5dQRrxNChrG/nJKcgArowpi+Z
	Ni3MBwqANEvMdNlfkMKIb2uJVCakpkkAlvtqWanQ0IyP/I1QJf8EvPLOvnOKeg2lkIF1XoV5GoTcc
	o90zW8XYzBtIq83q6ocA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Dj2-000000089oC-1AtU;
	Fri, 27 Mar 2026 20:24:12 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Dj0-000000089n6-2Cf6
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 20:24:11 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-66b51bfe5f3so1545363a12.2
        for <linux-riscv@lists.infradead.org>; Fri, 27 Mar 2026 13:24:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774643047; cv=none;
        d=google.com; s=arc-20240605;
        b=LAHr0lFxqe5dG78u0cyyKOA6eRfqP9jiAxbOwrXLCOFG05DHUrWYhgHv1miPWoAOW1
         zJb+VlFPuHvmdOjeVbTpG71RIy4nDV0W7SqzFSQ7E1dQza1CQ638Ks+LOg9Y7X6NnzwF
         OR/XJ8mzoKklg4OG6W5PIymEkwywr1XySV/Iks5lbI0UFbIm5/N7x7xAu89ay+ZqqCWs
         7h6TcrH2y8QcOKuTi7ZO56bxVlFtMKTjbtMtXJlRqb1/NWjojQ/1+LhZ1AkchXwFuXKy
         Oc6VjJT6MBoQd78tMR/dpF1lvfgpcsxxHB4rneqOS2k2XCvOkjh7kgDsKtGn1m8Xe2Bp
         N35g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9WeOtA6rLKd2feImk1nWk/a5NsEeM0kN8oqqyEId0bQ=;
        fh=OYtbZM4h77haIjMHCq+Iaqljc6gv2teEwgMx44H7kZg=;
        b=LWdIsNLkUvCo70EpdebRAyRNm8vTfP96BLdlNjVU5uLbFZ/YyyckOTHQN7p98/CLiN
         q+dAdZJTtyERad0yZNVW6SmvOW4DPQFV27KFN6UPfJ92bJQRtCFay+GDplYmenzYh6ai
         hM2NjgAgrwDWKiVZUUz2Qv73V79aPGbVwQdqk3kaogN1+o/IEZGCMLnooSgyhj/JNGn3
         az6n+ub5apE5Ly/pitJfQV0e+/183H75QNXOFjeN+nrn/Bwiag/mFyjRfIwMxfGO/fVh
         hC6Sdx107epUFoJM1t9lFxYE/ca3kkznQ+uMMlq9qzbYR5Y1zQEB4d6rJ35WrbF04IVa
         jV6Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774643047; x=1775247847; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9WeOtA6rLKd2feImk1nWk/a5NsEeM0kN8oqqyEId0bQ=;
        b=tPiVudZrKWH5LTTvmhnYDqFOJyyk5sAfhGUhLn+yB/mCpgOz9auKLaegCrXEQ59Vvi
         YJDDhg2iIOYQ19A+L+8/WF3KyXJj8F4uOuHKUPuZZYPeZNbHlHqOTnLZQEfXax1vFbWt
         8627Ed1dpmJJ+QuGFA24cl/IaVeGKBYc9ZcAqdWQLqri6lLclJsHw/3P5g+v5oi1wC1v
         w55pPNoq8e4RX89LaC69Q6KfXNPCI1PXv2GpaTpNZe5rELaEMIyrB9Gs81v/UW4H8aYI
         lhbAHfpUi7/I60wRNvP8bU7UCtCW72gV0ch4y9G7PCRVTyyjlYLrZIA6KsPNmEyyoDoL
         zoXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774643047; x=1775247847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9WeOtA6rLKd2feImk1nWk/a5NsEeM0kN8oqqyEId0bQ=;
        b=P2tqgv9DRdANT6cp8IAMmucdWmM7V+MluegK1CTWWQKioLIHhH592huM5ilJ6uMXju
         zC/hGPahPdjT6TnhtR6NrfLOdHfdteaKCKitcNQMmSH4tnhK6Wh9PG3qTS5sgWyml5pD
         oydIg+mlTMEmUJDVUR2YtUfsskcC3scJ3r9A3YY3hqwA3RY3sZv6v/RFXr+BTRpl7Nvt
         ST4tRdjp0jBzZPpmUWhlspU4pxvs3HkEHChJ+/ih7MkMxm33vm/bJdc66JzRM42ydz4M
         UylYEFMOV9q5BKuSerQ9LBstqH9D1tJ9JwGxPciE9ZzWH0wuDV3eBykL61ILMtXxgZ/G
         5NeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZ5Ohhe8l++sKIcK2yeUeg+cjcv9VHCwdkTKIK43HxLdCFCXjB9YS4fAhlGR6bAnCI5CpvufzDRxriLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTC94BSCH9uiCzmTz3ZJrG8u6uDpBHEXFiaP8pxIsiIvU9lXx8
	8m+LxMxy+XDuISFdp06hiW+ib1PpaO10JF4yOE/xEmqcaPSQU+dH7o2UHYuyU2bPWUaFV16I1pY
	QNJhoQSSfgKWPt6yh1IAhXBEsX5eh6aZC6sLU+WxBQw==
X-Gm-Gg: ATEYQzyX7fawvDFgror6uION1ODOC7yUzkMAQcAhpSEMs0SGbe0nFfHQtZwaRKq+5UM
	GJ+tFaOVBzkV0uEQ1wQjqc9Q0pqx1OgbuHOexRTGMyFwoWA5P0/PpPpGQNmO2Zt2VotB9sFpK/8
	XjbnClzjxi10IOEe1ppsErSe7hS0aipdL4LXeGCM2kxaWKQYgAclOeIfx4gf4n+dtn0rtwru4Ar
	iElpF3RpDpNb4Qa21mcTGxp2jZ0NvSP+ZSRyutoBhOpNo9tV7IerUPNS1w9RJniNCgds+0MiqiL
	QvhllQkXX0LrrpmMNGbvjM/mI2FR5NLDomhFPq84
X-Received: by 2002:a05:6402:46db:b0:66a:199d:138 with SMTP id
 4fb4d7f45d1cf-66b28c66cbemr2039826a12.20.1774643046839; Fri, 27 Mar 2026
 13:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260327184706.1600329-1-vladimir.oltean@nxp.com> <20260327184706.1600329-10-vladimir.oltean@nxp.com>
In-Reply-To: <20260327184706.1600329-10-vladimir.oltean@nxp.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 27 Mar 2026 20:23:54 +0000
X-Gm-Features: AQROBzCjrloDfUGTlNvOpQXdM4anVOjHCl2P0WQRB2XbIrpLYVg7AhYSjcExBJI
Message-ID: <CADrjBPqMwtrae7LB9A8xipg6R0rHGewe69awQ_jJnsf=2c=eTw@mail.gmail.com>
Subject: Re: [PATCH v6 phy-next 09/28] scsi: ufs: exynos: stop poking into
 struct phy guts
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
	UNGLinuxDriver@microchip.com, Bart Van Assche <bvanassche@acm.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Chanho Park <chanho61.park@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_132410_609224_89FFBA65 
X-CRM114-Status: GOOD (  28.29  )
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

On Fri, 27 Mar 2026 at 18:48, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
>
> The Exynos host controller driver is clearly a PHY consumer (gets the
> ufs->phy using devm_phy_get()), but pokes into the guts of struct phy
> to get the generic_phy->power_count.
>
> The UFS core (specifically ufshcd_link_startup()) may call the variant
> operation exynos_ufs_pre_link() -> exynos_ufs_phy_init() multiple times
> if the link startup fails and needs to be retried.
>
> However ufs-exynos shouldn't be doing what it's doing, i.e. looking at
> the generic_phy->power_count, because in the general sense of the API, a
> single Generic PHY may have multiple consumers. If ufs-exynos looks at
> generic_phy->power_count, there's no guarantee that this ufs-exynos
> instance is the one who previously bumped that power count. So it may be
> powering down the PHY on behalf of another consumer.
>
> The correct way in which this should be handled is ufs-exynos should
> *remember* whether it has initialized and powered up the PHY before, and
> power it down during link retries. Not rely on the power_count (which,
> btw, on the writer side is modified under &phy->mutex, but on the reader
> side is accessed unlocked). This is a discouraged pattern even if here
> it doesn't cause functional problems.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
> Reviewed-by: Bart Van Assche <bvanassche@acm.org>
> Acked-by: Alim Akhtar <alim.akhtar@samsung.com>
> Tested-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: Peter Griffin <peter.griffin@linaro.org>
> Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
> Cc: "Martin K. Petersen" <martin.petersen@oracle.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Chanho Park <chanho61.park@samsung.com>
>
> v5->v6: collect tags from Alim Akhtar
> v4->v5: collect tag, add "scsi: " prefix to commit title
> v3->v4: none
> v2->v3:
> - add Cc Chanho Park, author of commit 3d73b200f989 ("scsi: ufs:
>   ufs-exynos: Change ufs phy control sequence")
> v1->v2:
> - add better ufs->phy_powered_on handling in exynos_ufs_exit(),
>   exynos_ufs_suspend() and exynos_ufs_resume() which ensures we won't
>   enter a phy->power_count underrun condition
> ---
>  drivers/ufs/host/ufs-exynos.c | 24 ++++++++++++++++++++----
>  drivers/ufs/host/ufs-exynos.h |  1 +
>  2 files changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/ufs/host/ufs-exynos.c b/drivers/ufs/host/ufs-exynos.c
> index 76fee3a79c77..274e53833571 100644
> --- a/drivers/ufs/host/ufs-exynos.c
> +++ b/drivers/ufs/host/ufs-exynos.c
> @@ -963,9 +963,10 @@ static int exynos_ufs_phy_init(struct exynos_ufs *ufs)
>
>         phy_set_bus_width(generic_phy, ufs->avail_ln_rx);
>
> -       if (generic_phy->power_count) {
> +       if (ufs->phy_powered_on) {
>                 phy_power_off(generic_phy);
>                 phy_exit(generic_phy);
> +               ufs->phy_powered_on = false;
>         }
>
>         ret = phy_init(generic_phy);
> @@ -979,6 +980,8 @@ static int exynos_ufs_phy_init(struct exynos_ufs *ufs)
>         if (ret)
>                 goto out_exit_phy;
>
> +       ufs->phy_powered_on = true;
> +
>         return 0;
>
>  out_exit_phy:
> @@ -1527,6 +1530,9 @@ static void exynos_ufs_exit(struct ufs_hba *hba)
>  {
>         struct exynos_ufs *ufs = ufshcd_get_variant(hba);
>
> +       if (!ufs->phy_powered_on)
> +               return;
> +
>         phy_power_off(ufs->phy);
>         phy_exit(ufs->phy);
>  }
> @@ -1728,8 +1734,10 @@ static int exynos_ufs_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
>         if (ufs->drv_data->suspend)
>                 ufs->drv_data->suspend(ufs);
>
> -       if (!ufshcd_is_link_active(hba))
> +       if (!ufshcd_is_link_active(hba) && ufs->phy_powered_on) {
>                 phy_power_off(ufs->phy);
> +               ufs->phy_powered_on = false;
> +       }
>
>         return 0;
>  }
> @@ -1737,9 +1745,17 @@ static int exynos_ufs_suspend(struct ufs_hba *hba, enum ufs_pm_op pm_op,
>  static int exynos_ufs_resume(struct ufs_hba *hba, enum ufs_pm_op pm_op)
>  {
>         struct exynos_ufs *ufs = ufshcd_get_variant(hba);
> +       int err;
>
> -       if (!ufshcd_is_link_active(hba))
> -               phy_power_on(ufs->phy);
> +       if (!ufshcd_is_link_active(hba) && !ufs->phy_powered_on) {
> +               err = phy_power_on(ufs->phy);
> +               if (err) {
> +                       dev_err(hba->dev, "Failed to power on PHY: %pe\n",
> +                               ERR_PTR(err));
> +               } else {
> +                       ufs->phy_powered_on = true;
> +               }
> +       }
>
>         exynos_ufs_config_smu(ufs);
>         exynos_ufs_fmp_resume(hba);
> diff --git a/drivers/ufs/host/ufs-exynos.h b/drivers/ufs/host/ufs-exynos.h
> index abe7e472759e..683b9150e2ba 100644
> --- a/drivers/ufs/host/ufs-exynos.h
> +++ b/drivers/ufs/host/ufs-exynos.h
> @@ -227,6 +227,7 @@ struct exynos_ufs {
>         int avail_ln_rx;
>         int avail_ln_tx;
>         int rx_sel_idx;
> +       bool phy_powered_on;
>         struct ufs_pa_layer_attr dev_req_params;
>         struct ufs_phy_time_cfg t_cfg;
>         ktime_t entry_hibern8_t;
> --
> 2.43.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
