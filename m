Return-Path: <SRS0=guVx=FF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF5FC64E7A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 09:40:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E49E42064C
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Dec 2020 09:40:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QuRlEZIO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E49E42064C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=b+A9zTgenFj380X1jxrjsBUQfKBwIpGKoR+Ti5RPRo0=; b=QuRlEZIOmrV2bAGEmPPd8Udzv
	4Xi3Hz7F+8+4pLqGyDlp+3cUGzR+/IHfZORDV0pveylQBjzV0u67vM4eiTsM0gHab9VSr2eqYyjoU
	mEKhW4wYt84KeWvd8ICz6Om6LwbVE5cbEx87deAb94fI/1M1H+0a8HrZTCBJHohqCzpzyanewnKpb
	XXyIO0U3vp+y5N3JWWbLouPheVZVG7OrMmbW+KBcmyi2Hqw9ZYOn3z2iup6imtq75x+qNmbm5t/P+
	jHmsi0SVX8EC+t34SxUqb23s+nW9sP6efBXD56Fr0n7/Vf7lAVHs4yeMF5KpVQyKMNmieGRYi2wC8
	YQ9zAiL3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kk29O-0008SL-FD; Tue, 01 Dec 2020 09:40:46 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kk29M-0008Qx-1e
 for linux-riscv@lists.infradead.org; Tue, 01 Dec 2020 09:40:44 +0000
Received: by mail-ot1-f68.google.com with SMTP id e105so1052406ote.5
 for <linux-riscv@lists.infradead.org>; Tue, 01 Dec 2020 01:40:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vmburLdzMZVoTI9RJt73JfvngZccAhArSX6w0ehlMGU=;
 b=kHEXi9u3I+u0hDd4RyFF5IiPVUYAuuEw0VIkKYye86P432s66LJq08RDgUtV18l/cU
 RwyDbGs9ET+8KYYEQoU75RGR5OvzXhornWLhtSgKEUFPxD6LqxZeP+hFt28mxIHdp0qQ
 2Pt1LN7Y10+I6a7ESyfL2lNHoLsXwCIa8C64eyumZ2AR3lg1Z+p40S5/Za6aMO8EihSt
 7KpRlElHf1jct9cchZTbT75IPR1M94EBA7n4mOSRHXWjqExYP2BxkKzmY4iASCu5VoBm
 a2Yujym1sxN1VOBvZI1QUDemzoc79spxzmNVUKT6iOpMYOM32bKvdXKfJh0/bcCmp5z0
 1tbg==
X-Gm-Message-State: AOAM530OLkz0UYiHsxVq6CBuodmCJyf4MJranyXPBWKH0whi0eD3KnUu
 cdOCBmqdpaxOfY3E9xPWViYi/DbsbjY70pMMy6Y=
X-Google-Smtp-Source: ABdhPJyBSiaXmquOHT4sYGOidnZ1HN/Bou0gocyPltQemKL9W1PU2qA9upmXueyNHBCDM3S7Ff4bIfAjW92KbKtla90=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id
 u26mr1274660oth.250.1606815641429; 
 Tue, 01 Dec 2020 01:40:41 -0800 (PST)
MIME-Version: 1.0
References: <20201130234829.118298-1-damien.lemoal@wdc.com>
 <20201130234829.118298-13-damien.lemoal@wdc.com>
In-Reply-To: <20201130234829.118298-13-damien.lemoal@wdc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Dec 2020 10:40:30 +0100
Message-ID: <CAMuHMdX_HOQFm-9PXgsuOEK7BYu0B76CESkLmK4CH+qF_0T0yw@mail.gmail.com>
Subject: Re: [PATCH v3 12/21] riscv: Add Canaan Kendryte K210 FPIOA driver
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201201_044044_131467_ACDED730 
X-CRM114-Status: GOOD (  14.74  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Anderson <seanga2@gmail.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Damien,

On Tue, Dec 1, 2020 at 12:50 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
> Add the pinctrl-k210.c pinctrl driver for the Canaan Kendryte K210
> field programmable IO array (FPIOA) to allow configuring the SoC pin
> functions. The K210 has 48 programmable pins which can take any of 256
> possible functions.
>
> This patch is inspired from the k210 pinctrl driver for the u-boot
> project and contains many direct contributions from Sean Anderson.
>
> The MAINTAINERS file is updated to list myself as maintainer of this new
> driver.
>
> Signed-off-by: Sean Anderson <seanga2@gmail.com>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>

Thanks for your patch!

> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3826,10 +3826,13 @@ CANAAN/KENDRYTE K210 RISC-V SOC SUPPORT
>  M:     Damien Le Moal <damien.lemoal@wdc.com>
>  L:     linux-riscv@lists.infradead.org
>  L:     linux-clk@vger.kernel.org (clock driver)
> +L:     linux-gpio@vger.kernel.org (pinctrl driver)
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/clock/canaan,k210-clk.yaml
>  F:     Documentation/devicetree/bindings/mfd/canaan,k210-sysctl.yaml
> +F:     Documentation/devicetree/bindings/pinctrl/canaan,k210-fpioa.yaml
>  F:     drivers/clk/clk-k210.c
> +F:     drivers/pinctrl/pinctrl-k210.c
>  F:     drivers/soc/canaan/
>  F:     include/soc/canaan/

Please create separate sections for the clock and pinctrl drivers,
to avoid all 3 mailing lists being suggested by get_maintainers for
all changes to any of the file patterns.  People will blindly use the
get_maintainers scripts' output.

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
