Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DCF8EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 18:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qh+13GZNYyqOhfGwVht3n59Yqxr0S63WGs7KqKEzPlU=; b=XtHasqXeSxiH1A
	6q3QF9D5yzODhJK79shkpMBOIKclKWhr3CI+wGsuH0PN7KtVVwY1dOTo5pKK06KU6q1sZ1E3bUMVL
	y2OpGHdZXd5tRnDEbgDLHHiS/VIQXiqg0syTIt5t7qP0bNHe84ybLoMpOdbjnDdmVXCJDUJftwTPm
	wo922SUKTAoPkhceyTFwqnndPDJPE3KGEolPLyDmFxbptoTnNqPxsjxv53d1Aj4QxRfhZrFbtBtyh
	s0GewPRuWNCmggADL9fhsDgHTrP7YgMZg00mTxz1Jc76zSbO7BygWYjd+XKpuqow+Av42hvTagnSe
	wU87dQib3N+PygSvGDZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJeHr-000rDt-1t;
	Wed, 12 Jul 2023 18:10:03 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJeHn-000rCa-3A
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 18:10:01 +0000
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6B7BE3F18B
	for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 18:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1689185397;
	bh=Bizuu4z3VnDLRN7R+//unqDeYbH2DtjnSLBh5A5U/w4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=BW2NfbNrSUd9tLFXlCaRtDPISAY8dwrlT2S8xiL3pN0cyomJHhAvcpNibbCLJlzwU
	 wI8dfvISITrHiUFmJDhi4hWKH+Y7lie7jITPwA0kOtZGs2R2IjkIbDINWPw+VHRBYh
	 HxLZYfx1c0WUk8WstVtpSfEFYGtOZ28kxN1UhBiR2V3C6hS6KaAq1Nmy2M09rvwnWv
	 En2RTqy+zY0Xf7mzQbzlP3kFNB9z8cwmS/MPrwKU40XuRWnd0mSTQFOsx8MFS4YJGC
	 TuCiYlWzn52vTLON1PfdYXdy6Zuv13YOpO06hWOjEWTr5Akic8EGDhCW/kmwIUxiqB
	 1EdcD7LGCV+8g==
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-763c36d4748so714048085a.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 11:09:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689185396; x=1691777396;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bizuu4z3VnDLRN7R+//unqDeYbH2DtjnSLBh5A5U/w4=;
        b=Xvl1z/ftw46UAGgaoP0+6N7+3VxhC2+4Q2KHEMGmsA8dBM6HLA6+vN6/0KL/xjOfKw
         wBbkEURl+Anbhr6AQaJvpirxiLDy3uufq9cNTEw0LJhqYP0MQyzgbfFSiP42dcr0wJzK
         jth/oT9ba8EskHWjCdnexG5f7sgDjTFE6yXF/j2dIJ6WjEN30r5pIvPzpMiRIGgMQxfu
         jYGK3ScJdXlTi0qkr90yYPPYY9Yh3PU55UxIFSrw9XB9TnpB3/J1jTxq0KMsHsSURKyT
         iCs0XQLYvDq5kZFESBUxI6cz8BQpN0si2UYCn9rStIAJo2d0Qusys2vjtBC69X5RcRhr
         FyAg==
X-Gm-Message-State: ABy/qLbsHlcbwkmn/gjBxc3botaWxfPsEU4aLsfJnPma/NeSspjy8QzJ
	fg5NoKo6WOUGp72mOJ23wK2QreMB+yWJPIoPgWa05Wr2l+8UESF2vq7J8jVXXvRcPgW7ohszLA1
	Z19k+PPLe0uaDotadXZcYGat+UREfZ3oMH3BfeHbxkuRAKKtRegCKFq5pw5TC/g==
X-Received: by 2002:a05:620a:8e86:b0:765:84e3:aa1f with SMTP id rf6-20020a05620a8e8600b0076584e3aa1fmr14249049qkn.14.1689185396337;
        Wed, 12 Jul 2023 11:09:56 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEHAIZXhPQbdZBMRJZmbmK7N8VreWT4Jt2xgENYnPV/7T6gHV3unJyeuLSUIcif7+F3P5osS5GQtrh30bhdIPw=
X-Received: by 2002:a05:620a:8e86:b0:765:84e3:aa1f with SMTP id
 rf6-20020a05620a8e8600b0076584e3aa1fmr14249030qkn.14.1689185396118; Wed, 12
 Jul 2023 11:09:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230712092007.31013-1-xingyu.wu@starfivetech.com> <20230712092007.31013-8-xingyu.wu@starfivetech.com>
In-Reply-To: <20230712092007.31013-8-xingyu.wu@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 12 Jul 2023 20:09:39 +0200
Message-ID: <CAJM55Z8O8eu9y51B0sDs4+6-0MAdJS19QhjNzNJiX5i2v4Jh=A@mail.gmail.com>
Subject: Re: [PATCH v7 7/9] reset: starfive: jh7110: Add StarFive STG/ISP/VOUT
 resets support
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_111000_154212_DA78E9A5 
X-CRM114-Status: GOOD (  18.89  )
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

On Wed, 12 Jul 2023 at 11:22, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>
> Add new struct members and auxiliary_device_id of resets to support
> System-Top-Group, Image-Signal-Process and Video-Output on the StarFive
> JH7110 SoC.
>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../reset/starfive/reset-starfive-jh7110.c    | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>
> diff --git a/drivers/reset/starfive/reset-starfive-jh7110.c b/drivers/reset/starfive/reset-starfive-jh7110.c
> index 2d26ae95c8cc..29a43f0f2ad6 100644
> --- a/drivers/reset/starfive/reset-starfive-jh7110.c
> +++ b/drivers/reset/starfive/reset-starfive-jh7110.c
> @@ -31,6 +31,24 @@ static const struct jh7110_reset_info jh7110_aon_info = {
>         .status_offset = 0x3C,
>  };
>
> +static const struct jh7110_reset_info jh7110_stg_info = {
> +       .nr_resets = JH7110_STGRST_END,
> +       .assert_offset = 0x74,
> +       .status_offset = 0x78,
> +};
> +
> +static const struct jh7110_reset_info jh7110_isp_info = {
> +       .nr_resets = JH7110_ISPRST_END,
> +       .assert_offset = 0x38,
> +       .status_offset = 0x3C,
> +};
> +
> +static const struct jh7110_reset_info jh7110_vout_info = {
> +       .nr_resets = JH7110_VOUTRST_END,
> +       .assert_offset = 0x48,
> +       .status_offset = 0x4C,
> +};
> +
>  static int jh7110_reset_probe(struct auxiliary_device *adev,
>                               const struct auxiliary_device_id *id)
>  {
> @@ -58,6 +76,18 @@ static const struct auxiliary_device_id jh7110_reset_ids[] = {
>                 .name = "clk_starfive_jh7110_sys.rst-aon",
>                 .driver_data = (kernel_ulong_t)&jh7110_aon_info,
>         },
> +       {
> +               .name = "clk_starfive_jh7110_sys.rst-stg",
> +               .driver_data = (kernel_ulong_t)&jh7110_stg_info,
> +       },
> +       {
> +               .name = "clk_starfive_jh7110_sys.rst-isp",
> +               .driver_data = (kernel_ulong_t)&jh7110_isp_info,
> +       },
> +       {
> +               .name = "clk_starfive_jh7110_sys.rst-vo",
> +               .driver_data = (kernel_ulong_t)&jh7110_vout_info,
> +       },
>         { /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(auxiliary, jh7110_reset_ids);
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
