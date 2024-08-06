Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90DAC52D6F
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 09:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=JS01uBPKCc4q2H/A1KkKAHPdZqUPS//XoKnok9kZVNs=; b=DYeczYDidAoYD1zzdF1pU6gtoc
	sODfn30OrllJ87qKg0w6iDNh+Y0ISJ/6xtmBCnB9Oc/P610ftOmMMStBsHRzVfxEW3yvAZPW4remh
	2nYtxvn8BgsvG1mjim1rHKfQQPooZwOIOahGqtoZZo5kKlCEgtg6sQFbuQtgoDsP6y8bbd5V4COYh
	i7ovKkuEFH5SaObpRbFGImLnHvqQpcmsKO37NM9d7s1nzC6zbbF/pC7f5K3lHeOdz836P/t+f70hU
	4N3mneUODpjShx29AoNK0vOcfDY7H+cZhDdYJfBc3BhBxA1Khn9bNfIrqen535h/AFQdLGRiLsfB3
	3i+2untQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbGWw-000000016yY-2xCl;
	Tue, 06 Aug 2024 09:30:58 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbGWt-000000016wy-1QEp
	for linux-riscv@lists.infradead.org;
	Tue, 06 Aug 2024 09:30:57 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 81A363FA52
	for <linux-riscv@lists.infradead.org>; Tue,  6 Aug 2024 09:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1722936650;
	bh=xwD+Ys2LZNp5yQhdRMErgecrdX9WjVd2du/1YLfTqdY=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=aihYQ5QJz/setCWN2Gf0wipG7GFZ4243XjEzkLasb00kQ2xwzpBnbD5PStxVLstRo
	 I06LzJbuqDYtWcTQ7c3jFopWXovmuj4a6GpZiLrlqD/DYqn6Esmdlakf49HeZ0N9y2
	 /QTYBG5QVUXEwGTSYwJUjJb/PL6lnHRLVYWa7dOxT9/gUTeetuj1jteXd1DR5PEknq
	 T+kQlW5G756ukoHIjEVM12hCuWcaReKSt4f72iIEVQ0dTzeZVfmLsIzrOz07TVnrB/
	 rvhs0QeJVu1Y+IIgbadrO0VPGw8YXK190HyFdEOC+DHmyUWJH6/YgkaLklu9Xyjk49
	 JKutQZHQyWMEQ==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-44fe49fa389so5223461cf.1
        for <linux-riscv@lists.infradead.org>; Tue, 06 Aug 2024 02:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722936649; x=1723541449;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xwD+Ys2LZNp5yQhdRMErgecrdX9WjVd2du/1YLfTqdY=;
        b=hWu2ux0wwrj5x07sNWg9jTISebZJAkVvseucVPng965lQi7n1EdeGLhPYJOIcqs4i1
         RWWzwxEMnwkaV4zIGYQ2FmtDYUpG6yA5XnllUWgohSsXdlJiPRmH3g2keEW7ZOExyN4e
         JHt/wK2tdwP8TrSbSkuEaClsRwTwN/KD6v3gSi6iSBHK46Xm5K1MAzUp56IAkeO2K8Nt
         SlAVCCl0Zy58GBXAQEbxy1hEZnLe4RtFQBD3S3M63OOEaWv9lK4g6Pu7TNCLWE3xApcs
         puC9pOHQBENGslQJL0S38nyzoZMMF3tED8w8Och519SX+FDQuY6g0l585LIGK0dPJRKl
         F3Ag==
X-Forwarded-Encrypted: i=1; AJvYcCXITTElr4B0yEl10SpmX9Ntj1lixohWPR/THXIbJPav9QqYB5j/2B8QrZb2tNQ+968TPUJOlKySaG74RNjQmlCsnf9wnIGFqv5GnPhYGUv6
X-Gm-Message-State: AOJu0YzGpM+P6N8P4rJ3Wy0LW42/fhDIm4nKZsMR7ct0Hh6NCJN/+eLw
	SOMwdi5OM//dpz+PmuWL2UI5nJ58irwcM7FCIE8HAoa5h5GN2TpemgIl4g71nJoqDG+knM5+Rui
	O6QvKVUWZDMtk+BS+aOtBjvH1Khdo4T1+3cnjtiyQKIkp427m0xZ6keodIktqX0V4youm8JKFm3
	l93DjD9skFI0HwtG+BmWz2TrfuMUGAuR3fWEbsyrcw/tFaHUZKHX2kkbch
X-Received: by 2002:a05:622a:1914:b0:450:4788:ac94 with SMTP id d75a77b69052e-45189288104mr192145041cf.16.1722936649457;
        Tue, 06 Aug 2024 02:30:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHCqUjdnFHutaVI39WTNoHNqS3Lby2GXNCQz+gEOH6cNBzePyFMzSaeUFOKPFqist830dSYJL1tqS7fnzHPFI=
X-Received: by 2002:a05:622a:1914:b0:450:4788:ac94 with SMTP id
 d75a77b69052e-45189288104mr192144701cf.16.1722936648976; Tue, 06 Aug 2024
 02:30:48 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 6 Aug 2024 05:30:48 -0400
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240805023320.1287061-1-unicornxw@gmail.com>
References: <20240805023320.1287061-1-unicornxw@gmail.com>
Mime-Version: 1.0
Date: Tue, 6 Aug 2024 05:30:48 -0400
Message-ID: <CAJM55Z9_sDT2wUy-GMT=mi4FcWth-O_LUbmVtbdZRipQrUzh4A@mail.gmail.com>
Subject: Re: [PATCH] riscv: defconfig: sophgo: enable clks for sg2042
To: Chen Wang <unicornxw@gmail.com>, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, inochiama@outlook.com, conor.dooley@microchip.com, 
	guoren@kernel.org, emil.renner.berthing@canonical.com, 
	apatel@ventanamicro.com, hal.feng@starfivetech.com, dfustini@baylibre.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, haijiao.liu@sophgo.com, 
	xiaoguang.xing@sophgo.com
Cc: Chen Wang <unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_023055_724966_32154053 
X-CRM114-Status: GOOD (  11.43  )
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

Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
>
> Enable clk generators for sg2042 due to many peripherals rely on
> these clocks.
>
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  arch/riscv/configs/defconfig | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 0d678325444f..d43a028909e5 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -249,6 +249,9 @@ CONFIG_VIRTIO_BALLOON=y
>  CONFIG_VIRTIO_INPUT=y
>  CONFIG_VIRTIO_MMIO=y
>  CONFIG_CLK_SOPHGO_CV1800=y
> +CONFIG_CLK_SOPHGO_SG2042_PLL=y
> +CONFIG_CLK_SOPHGO_SG2042_CLKGEN=y
> +CONFIG_CLK_SOPHGO_SG2042_RPGATE=y
>  CONFIG_SUN8I_DE2_CCU=m
>  CONFIG_RENESAS_OSTM=y
>  CONFIG_SUN50I_IOMMU=y

Are these all critical to boot or could they be modules?

/Emil

>
> base-commit: de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed
> --
> 2.34.1
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
