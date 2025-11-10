Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A6BECCF9E3
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 09:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ITNXIX22UyNSrXmlZiZalXebAkErsmwzv47WqZJpio=; b=Z4TWb/qe4tmAiR
	8bIGCgNjlvzy3ofVOuKCrpIFn/A1P8+RF0GiDZslXU52Nwamojny4Cc+roqaQPpvRzT5cCczQG51I
	+RnvSXTVgrL5kSehNV3fNEzGvPpAqrz5qdd7GZgjGMHX19LurgVnd1idGXE2hmwGeaZAAtOjdRvTP
	pHNJkILRbUcO/Z10FtOpofLpk4iKJMD7l2LGGEvBTjSwI5o/HTfXgNnega/vJJCGsV97vOl946bOJ
	V4UrRCcGFhMoiDWodXRiDWFeFXwdf15JRODane3uH75kxnjjgPOSSgqjd8PxuEDEfTcczgYtHwVzo
	baW0BrdkTvqsaBy3hGLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINvL-000000053k9-1F4Q;
	Mon, 10 Nov 2025 09:10:56 +0000
Received: from mail-ot1-f43.google.com ([209.85.210.43])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vINvI-000000053jX-2D96
	for linux-riscv@lists.infradead.org;
	Mon, 10 Nov 2025 09:10:54 +0000
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-7c70e53db41so384108a34.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Nov 2025 01:10:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762765851; x=1763370651;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZFprYnk3afJ7bXwWWifURut5yD9UujyFxRDAYwHR2A=;
        b=D8hhqkufYEqFXcTq/typ78CZSU213zO/By8RGCx9TLaJuOJRUxgKX/vTpbpzXsvq1P
         xGhn4BRMbNs3MotQW935LWF7NJ4ckNro6+iWYUmBqboQu1uZNWpv2VQX5kXCZZRNS++F
         qEdU5zyjb2kkTdUL2ixSNra2s6SM7wAL4FrZEz92HpYyxmxSnowHzPAVkiQ00HHE60xV
         o0FXvRMI16XzPdRmFzClhaR7DQBU6jAwwSwz8/PIPIe9loKhIPJ0wS1nhMd9Jjp/bOJX
         K/49qgPN7rqa9nF0fIkLU8bNnkpuRaCMPQyqrffwe1ac6HO5/DVx8nQEdNuqfSTicXXW
         6F4g==
X-Forwarded-Encrypted: i=1; AJvYcCX0KMIKWRl8XCi3NFya2nlUl1KNV6n0WdY5+2TGSWYamIbLwVQ6+zB9Cg1jcIkE8ettWYFuHF46mPkX5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCK86eU7mhTOCjqLzO1oK1i2HmXZhdcwve0pghKfz8b2SXIw19
	gZxAVpQj6ngb35zVRxRoGJ9HwFn3EPsAiMNRvyy7pNhM+8izA+HmN3qs+/479G6s
X-Gm-Gg: ASbGncstofriuK0llVZ0acmbHte4Bb+tj33b0aFpoU7pki933ihn87weCA7FvA9XexP
	Oyb/a//EDdQ3ZKUmOMcyEhpIUbNVnXHAxew1raUuomkjY4TyFUf+38+QcTm6QjuvOZv7vCVXqTF
	O5svuaP7ORnQpv8kyS7/kxvODjxWvoQ1GkNe3McNMo87o6vQioUfmL+QqlUdLWgTXAiIl4Rd5Jo
	zNKzko4rNal9boND1EzGBzE7azkspYwqaw5mE2KlL+jKKNYAZkYhlRYt37gyffnuC/9sLdsq9Zc
	2A46NfwIAlHH0xEeEaxHeta9hC4feYAyMWDZbYEGfbwSeiwFGVCRcbSw2dtsvJZVFsrZZJ5uyms
	Xq+Nk6WCdelxNB+/g2vYFtFtBszBve9soHxPYZtEA8HQs/S1/AGJpRqwpYbmjRGuMuT1pHoxBtk
	n5Vrpid5+Fg1dK58v6jV/jV0A3wvlsSjhbExVnI5fVaDq1o9Ni8FPm
X-Google-Smtp-Source: AGHT+IHz0Yb5DPI/jP/7vNy/OzJRJjHla27pGidsFp2vTEEP73rWFI/HtnOU6Ul+TMrCfxZ48ARZiQ==
X-Received: by 2002:a05:6830:83a8:b0:79c:f9ff:43e with SMTP id 46e09a7af769-7c6fd7d48d7mr4827279a34.28.1762765851132;
        Mon, 10 Nov 2025 01:10:51 -0800 (PST)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com. [209.85.160.42])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c6f11323a0sm5374263a34.27.2025.11.10.01.10.50
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 01:10:50 -0800 (PST)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-3e1175ef97bso2138978fac.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Nov 2025 01:10:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWKS1B+of+syMrwNqZYn0lmijb/cXbFDzZqmGpVnYitgIvmVHSfRJbaJvP+9XJMQKiszJdBEX4DUDkYhA==@lists.infradead.org
X-Received: by 2002:a05:6102:c54:b0:5db:c9cd:673d with SMTP id
 ada2fe7eead31-5ddc4751f8bmr2299299137.26.1762765446858; Mon, 10 Nov 2025
 01:04:06 -0800 (PST)
MIME-Version: 1.0
References: <cover.1762588494.git.gaohan@iscas.ac.cn> <bc141425b71f0cfc8f3ef0a3c6d08104fde1281f.1762588494.git.gaohan@iscas.ac.cn>
In-Reply-To: <bc141425b71f0cfc8f3ef0a3c6d08104fde1281f.1762588494.git.gaohan@iscas.ac.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Nov 2025 10:03:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVtAmM6MySzaUZZMZLY2z_99Pb-zcvyQd+q5-NS3A=c_Q@mail.gmail.com>
X-Gm-Features: AWmQ_blbgQuyL2K-QWPxMEybBZ_lWHdEHYJOPJXLh-zobJqSsJnJFWv08QlcdnY
Message-ID: <CAMuHMdVtAmM6MySzaUZZMZLY2z_99Pb-zcvyQd+q5-NS3A=c_Q@mail.gmail.com>
Subject: Re: [PATCH 3/3] riscv: defconfig: enable SUNXI_XUANTIE and SUNXI_ANDES
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Yixun Lan <dlan@gentoo.org>, Drew Fustini <fustini@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Guodong Xu <guodong@riscstar.com>, 
	Haylen Chu <heylenay@4d2.org>, Joel Stanley <joel@jms.id.au>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Han Gao <rabenda.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_011053_114316_88DB22C5 
X-CRM114-Status: GOOD (  17.54  )
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

Hi Gaohan,

On Sat, 8 Nov 2025 at 09:21, <gaohan@iscas.ac.cn> wrote:
> From: Han Gao <gaohan@iscas.ac.cn>
>
> These options need to be enabled to prepare for v821/v861/v881.
>
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Thanks for your patch!

> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -29,6 +29,8 @@ CONFIG_ARCH_SOPHGO=y
>  CONFIG_ARCH_SPACEMIT=y
>  CONFIG_SOC_STARFIVE=y
>  CONFIG_ARCH_SUNXI=y
> +CONFIG_ARCH_SUNXI_XUANTIE=y
> +CONFIG_ARCH_SUNXI_ANDES=y
>  CONFIG_ARCH_THEAD=y
>  CONFIG_ARCH_VIRT=y
>  CONFIG_ARCH_CANAAN=y

Other subarchs handle this with "default y" in drivers/soc/*/Kconfig.

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
