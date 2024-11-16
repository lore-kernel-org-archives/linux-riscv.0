Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C95D68BF1
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Nov 2024 21:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:Mime-Version
	:References:In-Reply-To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QqwvJrPWFU4q+VoKz93odOHCjenQPtEMKq7to2ykgZs=; b=mDnkIhVDHcQYwa
	Jf0Rwahkhxmpjc5O6ZV+G8960Tb1BTNKEsTe0qb+itPtBiJNxqk12+Z9zcszQTlpA5oQKiG7wj60W
	lpUY6vYqR1FZeo7NJE8Lt2yngvQ3mpAL39+Q/TNaFw6k1auH/go+m+2IolYPDPwR2G6b75OEWC6NF
	kD0gdB06rrwg9vlnnbB4OMFDL5eP074bo5MmydnPS7abEqT3w6V0VZixIoFMwvn+Fnv+38rmoWomh
	w9nXkMrVoSe1pYAM9nE0mRmENHQ273du8BWsQ2VgG53s4loAusRsX30AW7yHwci1JdBDN3BW89WDt
	3yG+GHhE8ziaBl111HwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tCQPd-00000006FXf-0Irt;
	Sat, 16 Nov 2024 21:33:01 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tCQPZ-00000006FX9-07JM
	for linux-riscv@lists.infradead.org;
	Sat, 16 Nov 2024 21:32:59 +0000
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D51D03F29B
	for <linux-riscv@lists.infradead.org>; Sat, 16 Nov 2024 21:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1731792772;
	bh=fmAemAqFyetLPXFFHnZ9TzZGuiy7HXnbjCZZxtYlmL8=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Content-Type;
	b=P9vuK5oy2+n3g/nHUrIadMeLC6YiJboFQrTn7HWr6LXcT/uA44RG16CE9p5pqKq/M
	 Ftm8hfDaJHY6/kyCX7ZJqpUyz8x1sZBJqyK8luAOH7gdv/+C/QZmlifdLtMfOfbm0d
	 RqG4Z76SiZv/e+yIJbIgSkI35q6Nno/a0c1MEiZUJ1ucTAHGyR53YF7O81aaIW0mqG
	 jOxjrCbj9y1fp+cNnCHH+PiXD8jnb7vp+QO4HjIH2svF/rP3vlVt1gRy2jFHF+Vtq+
	 AVbH9oEyhlHjlKKkpOE/05Q6CniZfCwPEuZsTANkrf8vaBPO6cEMQ4vxPKhGiYNSqt
	 CNjhGydaxZ/hw==
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-286efde9783so514268fac.0
        for <linux-riscv@lists.infradead.org>; Sat, 16 Nov 2024 13:32:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731792771; x=1732397571;
        h=to:subject:message-id:date:mime-version:references:in-reply-to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fmAemAqFyetLPXFFHnZ9TzZGuiy7HXnbjCZZxtYlmL8=;
        b=EzelYb6ZX6+zdeTOzEan8PYNQ+fLJ7pD+Zi8v7eL4SEdsHHN5RN22CpafqFA7RlIAd
         b7eqVocll/D1V4k/a7/r5rUGlqHWk10eEZ2aPHg8s06QD4lzfqj1v2SopeCC7wmIN8cA
         xoEul6J4fP45GajpffEw/RUe/WxTH8ViE8GQnc3zZljZGfk4pHznW+Kd+/6X1xu7MpqB
         MGlxMwcZ425CoPgPmzEVvOV4N/TnIru1v5ecJND0QiquPyxuq1r4BpUG+JWYCOrUPVwP
         LGOuUiOoOGVQDlZUuySamZB0D3vtnIeS+TbOI9j4tpau71HRqznsZhbEKAg8b5eThasa
         75AA==
X-Forwarded-Encrypted: i=1; AJvYcCXwtUiyIXqYKqd/Y657hhhE0CqUK1Ky+YHbEP86oRCbO5/+YBZeHS4+hIjo86reFCHAVoaW6n54xt+3PA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7EeH9dbR17Bt+qUKT26Szho07FnRAgHkZSaJiO0AkU7VAefBP
	pf3KT3zxl2xShrcOt/VJfKsd/EjI/si9/DqgG1oi9gN20JpAtoA8SE+OM1Zktagd/EvQAYd6TIR
	bATn4qqeqphwhC076Uoni1DuUiYsBKvVg5evzqncPUfP85qg4WDgu2A/ijDP6k4W45x/X2zr04B
	JvcI928fPznk/GRwz+yzNM6qqDGU3JLQWxa1KYvfaSXb9JMYIr4VLxGYbd
X-Received: by 2002:a05:6870:75c8:b0:254:affe:5a05 with SMTP id 586e51a60fabf-2962dedb297mr6559787fac.21.1731792771131;
        Sat, 16 Nov 2024 13:32:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELtO4V2RHfs6Yj+eIbaX82LviojGiiluYE09Wmg5o0ei8JG6pU9J+XS5YGYrQ2jHlSSLFj13Doph221IgSbgk=
X-Received: by 2002:a05:6870:75c8:b0:254:affe:5a05 with SMTP id
 586e51a60fabf-2962dedb297mr6559770fac.21.1731792770837; Sat, 16 Nov 2024
 13:32:50 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 16 Nov 2024 16:32:50 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20241113184333.829716-1-drew@pdp7.com>
References: <20241113184333.829716-1-drew@pdp7.com>
Mime-Version: 1.0
Date: Sat, 16 Nov 2024 16:32:50 -0500
Message-ID: <CAJM55Z_RchO-Ke1aXXAaB5f-OJEYcHU6n+MVtBTCUSXrHOQp1Q@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: defconfig: enable pinctrl and dwmac support for TH1520
To: Drew Fustini <drew@pdp7.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Conor Dooley <conor.dooley@microchip.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Guo Ren <guoren@kernel.org>, Yangyu Chen <cyy@cyyself.name>, 
	Sunil V L <sunilvl@ventanamicro.com>, Hal Feng <hal.feng@starfivetech.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241116_133257_624117_CA1C9086 
X-CRM114-Status: GOOD (  12.57  )
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

Drew Fustini wrote:
> Enable pinctrl and ethernet dwmac driver for the TH1520 SoC boards like
> the BeagleV Ahead and the Sipeed LicheePi 4A.
>
> Signed-off-by: Drew Fustini <drew@pdp7.com>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
> Changes in v2:
>  - Switch CONFIG_DWMAC_THEAD from built-in to module
>
>
>  arch/riscv/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index b4a37345703e..d26e670404b6 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -167,6 +167,7 @@ CONFIG_PINCTRL_SOPHGO_CV1800B=y
>  CONFIG_PINCTRL_SOPHGO_CV1812H=y
>  CONFIG_PINCTRL_SOPHGO_SG2000=y
>  CONFIG_PINCTRL_SOPHGO_SG2002=y
> +CONFIG_PINCTRL_TH1520=y
>  CONFIG_GPIO_DWAPB=y
>  CONFIG_GPIO_SIFIVE=y
>  CONFIG_POWER_RESET_GPIO_RESTART=y
> @@ -242,6 +243,7 @@ CONFIG_RTC_DRV_SUN6I=y
>  CONFIG_DMADEVICES=y
>  CONFIG_DMA_SUN6I=m
>  CONFIG_DW_AXI_DMAC=y
> +CONFIG_DWMAC_THEAD=m
>  CONFIG_VIRTIO_PCI=y
>  CONFIG_VIRTIO_BALLOON=y
>  CONFIG_VIRTIO_INPUT=y
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
