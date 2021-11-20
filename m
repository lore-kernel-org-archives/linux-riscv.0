Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB03C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Nov 2021 03:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sdVqYLP44PRPeJr/6Lg1iETwoPtd9z3dtngw8fD5itY=; b=3Jzji/vQgOsS7E
	lzVjhfq9yIZIl2w5PqCAdDHhdhr6ue9a64zWYwz/yWFCWIFIRrnZ4MwI0eZ00vCEeas9HTCb2WjQF
	5dkDKeqXlnYcv/vNefePID2dA5TmC11ecGtY4mNj4d79u7xdmgXrLzgcQNieb2CMzBTsIegJzoKSj
	9rty5C7ZNh0uxioyLaakjjDszS+j80OORedUL3IVfGpCBNi6ZAiuXIKLTpeHbk1qBZ2Fv9nkNUP/3
	e3sn5JdULDMUcrDagEp9mYcH+Opkcqyijr6rKHzdnaios6OWA3JTKLkgIVGu8o6ioMHZbhcWdDDvl
	kTlmBxC5i7G9IQmYj0Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moHUi-00BzcZ-3e; Sat, 20 Nov 2021 03:56:52 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moHUf-00BzcD-Qx
 for linux-riscv@lists.infradead.org; Sat, 20 Nov 2021 03:56:51 +0000
Received: by mail-wr1-x429.google.com with SMTP id t30so21403551wra.10
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 19:56:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M02PfsqksLPda89nlrI5PxBf9KrvqVjaq7MtFU6lXW4=;
 b=1EKDk2SnM+bUg+Im8VsXxIZJwVRqeo9beponAjLTV/vhNdMWHU5+kOE7/zyB9K+q5g
 2dbfw5bRuZWRboaQyAhWIXtl/ERVgnEDW4OG/yZEqdatGag+tGWRUofT+asXPr02qjjf
 m7e3svTTvXsmNy1jflwuHBZqyahyqDyaMYNYpPYwuSS6CL1pL/i4eyHkcVjK+IZPmuV3
 NrT9vGReddULSLOC0mImoWdpD7+eyJAFesX35/szAWBunR5qRiDiX9LqYGmIsTN4DPbY
 JoRL37Ip7wahWy4BAX9H8tvLjd1x9srJo5lFrzBvzoBQVpE36VsC00etiH0nMqZURxvz
 73Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M02PfsqksLPda89nlrI5PxBf9KrvqVjaq7MtFU6lXW4=;
 b=jX6s62lxLEoSjJQ6PkHiJe+6LwrUwpuvnVNG/ihqywFi4oaEZyFqhUoaPhvfXLo8Im
 wR4zygUGnHiGijI3UzocOwoduwVvWLizjg7VdHODUKCEQFaSidDnsZekxlpyA5eDCk+E
 uRBQWalDlVFdNGc/iDCeRYMlpUAlpgWoGle88DKaG96ea3k+Uw8tLu/lM6ETyB/WwVTl
 RhibmVGkWVNkYxGTDUuhA1VvsNXVWJz2z41EagN22Ut7qhRlOy3dKL+6TcNtvBmOpRnm
 DocI00oBLCRlZ+68B/pTazWbJGg3kCzeQ34RL8KBbg6xgO8yHjT/aoQmx7MGmsP7hkSS
 /5Nw==
X-Gm-Message-State: AOAM530xfmUCxEOwdwQLYQ3fMfYrT6U679ITqr46NokozsiXNkU4Mjz1
 RQtrIJaYrCHT0+BlEQUwfutf5TpKnwZGctJeYH04BQ==
X-Google-Smtp-Source: ABdhPJzGZ2FRjxzdL13lLUsnFVAOo8OzdTpxDEYsb8XDAjJ7NFcBANTW6pXcFbMnXX/A9+MkpASidyBFA9nV0l5ri4w=
X-Received: by 2002:adf:8165:: with SMTP id 92mr14513881wrm.199.1637380607106; 
 Fri, 19 Nov 2021 19:56:47 -0800 (PST)
MIME-Version: 1.0
References: <20211119164413.29052-1-palmer@rivosinc.com>
 <20211119164413.29052-2-palmer@rivosinc.com>
In-Reply-To: <20211119164413.29052-2-palmer@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 20 Nov 2021 09:26:35 +0530
Message-ID: <CAAhSdy1wGprfMAKQg8CZOtg79Lu_fCuw_TjkAqpPHLYkn6ZZaw@mail.gmail.com>
Subject: Re: [PATCH 01/12] RISC-V: defconfigs: Set CONFIG_FB=y, for FB console
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Atish Patra <atish.patra@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>, 
 Damien Le Moal <damien.lemoal@wdc.com>, axboe@kernel.dk, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_195649_952136_83324D49 
X-CRM114-Status: GOOD (  14.61  )
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

On Fri, Nov 19, 2021 at 10:14 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> We have CONFIG_FRAMEBUFFER_CONSOLE=y in the defconfigs, but that depends
> on CONFIG_FB so it's not actually getting set.  I'm assuming most users
> on real systems want a framebuffer console, so this enables CONFIG_FB to
> allow that to take effect.
>
> Fixes: 33c57c0d3c67 ("RISC-V: Add a basic defconfig")
> Cc: stable@vger.kernel.org
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/configs/defconfig      | 1 +
>  arch/riscv/configs/rv32_defconfig | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index ef473e2f503b..11de2ab9ed6e 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -78,6 +78,7 @@ CONFIG_DRM=m
>  CONFIG_DRM_RADEON=m
>  CONFIG_DRM_NOUVEAU=m
>  CONFIG_DRM_VIRTIO_GPU=m
> +CONFIG_FB=y
>  CONFIG_FRAMEBUFFER_CONSOLE=y
>  CONFIG_USB=y
>  CONFIG_USB_XHCI_HCD=y
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index 6e9f12ff968a..05b6f17adbc1 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -73,6 +73,7 @@ CONFIG_POWER_RESET=y
>  CONFIG_DRM=y
>  CONFIG_DRM_RADEON=y
>  CONFIG_DRM_VIRTIO_GPU=y
> +CONFIG_FB=y
>  CONFIG_FRAMEBUFFER_CONSOLE=y
>  CONFIG_USB=y
>  CONFIG_USB_XHCI_HCD=y
> --
> 2.32.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
