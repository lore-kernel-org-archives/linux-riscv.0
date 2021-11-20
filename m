Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E969C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Nov 2021 04:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k/apHuCOWlyOIPdZh5p+ChltLPJTbg3toM/vrYFpS7o=; b=Hixdmhdc0h9yId
	tCmDBXFYFrVIgP2kANEv1GeseA2KTq8gk7A0bPZ3aZDFWGE4u/KlMDkOQrJbRD7TqMmIzNK7PZLEO
	ElPURRN+jsSd3rhHjNoGZnow4meVGkZbnACyGwq71RnwRlSnVNT4+Xl6N5UhyBrKheaG/tSQfklly
	zNK/RWASs/9w4E0Yqg9C+DBf6HQQiKfyhkgAImdjW859fFW7SJj/HTEaovpp1TKxtRnVuWbajmcFS
	VLY84tqslYZh5x+KcW7i7ulTJ5G1mobta7XGqB9thAVxcOYfzULKZrW9GTuABRTRqRQYnInA6naqT
	dp2fDiDW0Iu+vSWi1G9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moHcZ-00C126-IS; Sat, 20 Nov 2021 04:04:59 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moHcX-00C11N-57
 for linux-riscv@lists.infradead.org; Sat, 20 Nov 2021 04:04:58 +0000
Received: by mail-wm1-x333.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so12008732wme.0
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 20:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EuLCYTqwajLrL4KlZnNwPOKJYICjtKr/KDo2ktZ6q40=;
 b=OsIhxRxumlp+NaVqDOIF9oC+OKhccUX4Ow5VhvH+yFWjfe0BC5505vQ6zFVBjVX3uV
 6wPiam8TiCva4H5vHLfk6oedMPQkWIM7o5z1K31v8cak5QMiQSmCm5tcmtd5OOg+XlVl
 KVWnZnWvvnDlUoFsSfM065j8Ngts7cyIQ4qcsVtD/qc5f46Zx8/dK9LPPXbsYrEpEoF7
 H01KhtIsYyxcsG1fRCb6l45QvrlTe3vYtFz/kq8BWTAwo5ZbUAHSVJrOuGQsR6HaNcRg
 mz+uYI5AQBzxThW8KXMwbMXmidCTmzwI4YiZJvezyi2RcMyO/+KiBwrgDWgv+6jUk/KY
 tGoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EuLCYTqwajLrL4KlZnNwPOKJYICjtKr/KDo2ktZ6q40=;
 b=cL49vZAIklm8qWCCEk0OHDoyaYYwgUDdnCME/ttlf//aLimhB6WctdzdUvzOwm80AO
 9M+fjywq7wRmJko3GUU3Z0lZPcAxqK0I+stDJ+wq+NbHuawQodNLkAYYp1SVioHyAiNn
 tgIX3YnQbzfX6+5xDOUE9nJlu54rIaGIySNknPAagOZ+G1zsXS5xrfxT7FfCH8YL7hId
 7uDB25U+HLT+evR5K9yh3yJdvvWNidR1lZD2lxEmH7UEAyA5mIVC0TkKCY/r5YpG+ODq
 81X72DXwxtpTrwPfcd3guI4jYitAqBEc50Cn8fWtLNOo7JYoXqP6HXsOU+YKWPFKiDFH
 owBg==
X-Gm-Message-State: AOAM531U9itvTWWoQcdSVsIqzUV2otxwAgVtIdEoMddoavw+czAJQT73
 bWH4303jXlcdnfm5AmamIM2R9Qmjsfbby9l1wGRcIQ==
X-Google-Smtp-Source: ABdhPJzWEO/BNh+sp0FdgL+gqqVhPArx3E0d8BJ8oMoc0LDfCZ8NXZyGHmyF6q9WXMR+6oYvk72ZJCB2MEgIl8Jdt7w=
X-Received: by 2002:a7b:c194:: with SMTP id y20mr6732345wmi.61.1637381095533; 
 Fri, 19 Nov 2021 20:04:55 -0800 (PST)
MIME-Version: 1.0
References: <20211119164413.29052-1-palmer@rivosinc.com>
 <20211119164413.29052-11-palmer@rivosinc.com>
In-Reply-To: <20211119164413.29052-11-palmer@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 20 Nov 2021 09:34:43 +0530
Message-ID: <CAAhSdy0a5+yctd4jnSDr94+Ghi-brLXdQgeCbL6PUNm4=2AW8Q@mail.gmail.com>
Subject: Re: [PATCH 10/12] RISC-V: defconfigs: Remove redundant
 CONFIG_POWER_RESET
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Bin Meng <bin.meng@windriver.com>, 
 Sagar Shrikant Kadam <sagar.kadam@sifive.com>,
 Damien Le Moal <damien.lemoal@wdc.com>, axboe@kernel.dk, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@atishpatra.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211119_200457_220737_F6D29CC4 
X-CRM114-Status: GOOD (  14.87  )
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

On Fri, Nov 19, 2021 at 10:15 PM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>
> From: Palmer Dabbelt <palmer@rivosinc.com>
>
> As of ab7fbad0c7d7 ("riscv: Fix unmet direct dependencies built based on
> SOC_VIRT") we select CONFIG_POWER_RESET=y along with CONFIG_SOC_VIRT,
> which is already in defconfig.  This make setting CONFIG_POWER_RESET in
> the defconfigs redundant, so remove it to remain consistent with
> savedefconfig.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/configs/defconfig      | 1 -
>  arch/riscv/configs/rv32_defconfig | 1 -
>  2 files changed, 2 deletions(-)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index ec9540392df7..a72dbd74b93d 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -74,7 +74,6 @@ CONFIG_SPI_SIFIVE=y
>  # CONFIG_PTP_1588_CLOCK is not set
>  CONFIG_GPIOLIB=y
>  CONFIG_GPIO_SIFIVE=y
> -CONFIG_POWER_RESET=y
>  CONFIG_DRM=m
>  CONFIG_DRM_RADEON=m
>  CONFIG_DRM_NOUVEAU=m
> diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
> index 1f6808aa1261..8b56a7f1eb06 100644
> --- a/arch/riscv/configs/rv32_defconfig
> +++ b/arch/riscv/configs/rv32_defconfig
> @@ -70,7 +70,6 @@ CONFIG_HW_RANDOM_VIRTIO=y
>  CONFIG_SPI=y
>  CONFIG_SPI_SIFIVE=y
>  # CONFIG_PTP_1588_CLOCK is not set
> -CONFIG_POWER_RESET=y
>  CONFIG_DRM=y
>  CONFIG_DRM_RADEON=y
>  CONFIG_DRM_VIRTIO_GPU=y
> --
> 2.32.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
