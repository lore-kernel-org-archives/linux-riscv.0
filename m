Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D2AC61D85
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Nov 2023 22:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q31Zifqwh01VZBlEFN0K+o834wcmV2zpZk3hEizM0J4=; b=SyftsLaPY+QlMY
	oaWD44M02wh8Ob21+3JK3z5EeCVVjqzUgW6Xtp2BCvkXq9dua0KMp7zboJkIN48i0kLtIDSeba6Fh
	LYZHh04NHpQBhKecVvpew9fZNIstO4FEW5gPjNak9/SjiNgsTtx6EF6F319cuuofNijC/+YdL9/Pt
	7zxAWAFTXK6cW0TdWOXk9aaQGjM8efKSzWKD6zupx85KqeATGk0PYhK1zbIGTVtwKsx/chvDUzFtt
	mIfTMQG6OAcl1hEMnE1W7YU3bMF5UB31ZWMkPRSIE8hLwrS1MDoFUGtqxRyyJcorw++DgDDQGTGZ7
	RD0ctnkSuXcJB/Ab6Kag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5ZXU-000Css-0f;
	Tue, 21 Nov 2023 22:48:16 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5ZXQ-000Crw-2w
	for linux-riscv@lists.infradead.org;
	Tue, 21 Nov 2023 22:48:14 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-7a683bd610dso210899039f.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Nov 2023 14:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1700606890; x=1701211690; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ha2zL2RliN6J5b2kLDdhsZ6GbGCv9fZnJqsfyqkrjz4=;
        b=DrBivaVkkKcieSf3pgLWAiZU7zFTZNTcKhGOag8eBJCeabKRd6Q+u/VKPEP68fjCfe
         cUGEZ3DV/XBEwthlzfxuN092dDgC+QZuKO4QZ00eCIIt/3rCY81WKxSQ0ip0ySqZ+srq
         O+8Ex6gJHjFlbMeqm2EmK8AF7MHqs1A0igRPAlFQ5NPjeadjlykP2Gv78XBdDM51BEn7
         xCm1upaCH7MO8tIEN1tonopBDthehx6Mio9BUVcUh0FvgRh5vFxctu6R5K3WjxndiIB2
         i806oG/O5AhdzEZVSENwOW26NT/FZtPJ0tbtYCoHsc/SMHIMr2Ohm0SshkvZucou8Sar
         nF4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700606890; x=1701211690;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ha2zL2RliN6J5b2kLDdhsZ6GbGCv9fZnJqsfyqkrjz4=;
        b=imNZgFLxMpak5CRVBHCsSn1aHblJThoqt4x4llCwJqhkxj6LgWkOvDKld3oigxuiNS
         MlccvRiD/7TW2HiIi8fOJAfqEWpiUw+0+0riYh+aR4pQzwwCO3k2tqRBlRM4uuPpo4Y6
         hUv6lJQys1JZux6AHLgKw1E9F839hE83TSRDwTeiCp4JNLnWisUVXEB6jkbZHhx3ZYKC
         OpWBcBGmvFsuPcsbgQlBGOjbifDkG4WtQGGlqxU3LUatVLtAN5uQpEz3VCNAzqcNlOxN
         rilfjBwVItN7E9RdiJ4ifwKvUWqyqaLDY1kxQgShvDQ57JOpRgSDajk43kkKVL5DsFzr
         5fGQ==
X-Gm-Message-State: AOJu0Yx06QDDUeCfqAQ3HClwx0jDnZ+d3X2/w986skdpw2OoMUi+quUb
	uGk7jqmjj/4GAB5IR0t2m0mOQQ==
X-Google-Smtp-Source: AGHT+IEqopk3WpneTwAJdQEga6tdFjb3hMHKJSSM4AtmRyuOtlB2pSKEyHj6RtL8C3xrT6bMg/cE5g==
X-Received: by 2002:a05:6602:c08:b0:7aa:125a:b0c4 with SMTP id fn8-20020a0566020c0800b007aa125ab0c4mr437169iob.5.1700606889842;
        Tue, 21 Nov 2023 14:48:09 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:3d43:c8e2:1496:e620? ([2605:a601:adae:4500:3d43:c8e2:1496:e620])
        by smtp.gmail.com with ESMTPSA id fj34-20020a056638636200b004290fd3a68dsm2835154jab.1.2023.11.21.14.48.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Nov 2023 14:48:09 -0800 (PST)
Message-ID: <fb72e212-711e-4be9-9b92-89b2dc121476@sifive.com>
Date: Tue, 21 Nov 2023 16:48:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] RISC-V: Enable SBI based earlycon support
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>
Cc: Conor Dooley <conor@kernel.org>, Andrew Jones <ajones@ventanamicro.com>,
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
References: <20231118033859.726692-1-apatel@ventanamicro.com>
 <20231118033859.726692-6-apatel@ventanamicro.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20231118033859.726692-6-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_144812_951142_7300E716 
X-CRM114-Status: GOOD (  13.63  )
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

Hi Anup,

On 2023-11-17 9:38 PM, Anup Patel wrote:
> Let us enable SBI based earlycon support in defconfigs for both RV32
> and RV64 so that "earlycon=sbi" can be used again.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  arch/riscv/configs/defconfig      | 1 +
>  arch/riscv/configs/rv32_defconfig | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 905881282a7c..eaf34e871e30 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -149,6 +149,7 @@ CONFIG_SERIAL_8250_CONSOLE=y
>  CONFIG_SERIAL_8250_DW=y
>  CONFIG_SERIAL_OF_PLATFORM=y
>  CONFIG_SERIAL_SH_SCI=y
> +CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
>  CONFIG_VIRTIO_CONSOLE=y
>  CONFIG_HW_RANDOM=y
>  CONFIG_HW_RANDOM_VIRTIO=y
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index 89b601e253a6..5721af39afd1 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig

This file isn't used anymore since 72f045d19f25 ("riscv: Fixup difference with
defconfig"), so there's no need to update it. I'll send a patch deleting it.

Regards,
Samuel

> @@ -66,6 +66,7 @@ CONFIG_INPUT_MOUSEDEV=y
>  CONFIG_SERIAL_8250=y
>  CONFIG_SERIAL_8250_CONSOLE=y
>  CONFIG_SERIAL_OF_PLATFORM=y
> +CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
>  CONFIG_VIRTIO_CONSOLE=y
>  CONFIG_HW_RANDOM=y
>  CONFIG_HW_RANDOM_VIRTIO=y


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
