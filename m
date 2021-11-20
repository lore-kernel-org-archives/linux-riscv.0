Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDB57C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Nov 2021 04:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g3b0oCGiWTTVa1BDhz6WhM045Q3OhCJpEXUMXa3P4NI=; b=K120GK2FdudwTy
	GAYVUTvPPDp104ZNvyAPURWGgryQfNPYA1LzXLmTObz5vYHKx0miZa15+85tuGA/z9OXAlFC7CKHg
	QWgAzx2L09QOnyzuzoo/R5IGuAGFowodLU4CSotAa9OKA75TVKcku6UsYZjYr0+aUbWxy91GoBEVB
	AHQKNWH0p+0j7S91TQPLEjcyfB/IKciVk8/8MLb/EyZJf+Pq9AjsMohx4rULdJF4RuHcyvkq6KNlG
	DFTT761MvsE6rld85GYvnplQXJYfutDLJrkhiDo4eJ5qVE8Vjv4B6cFLMP41w+F6aaIxeCnxaR02L
	RJqoQ1i+Z+9h//VnQvwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moHYP-00C0KA-BN; Sat, 20 Nov 2021 04:00:41 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moHYN-00C0JB-3y
 for linux-riscv@lists.infradead.org; Sat, 20 Nov 2021 04:00:40 +0000
Received: by mail-wm1-x32f.google.com with SMTP id
 o19-20020a1c7513000000b0033a93202467so57859wmc.2
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 20:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zl6Pig05elwyO5r1ax9J/GdJ0w+BvbTSAW2OuBArtBQ=;
 b=2aPdlcfFN+wF7dwAdKi8GVrae1mCaS5eqDbMwpsFS5WCYmbY+OilREe4TvvxFrICW1
 0YxbMIvP0/DH5rsPlJP1cl7ZGUzrLOSRDqpZLf7f44Njlr3mdNSBajj6w8B91VSwKGpM
 +m3XRWtCd6BVxSTqTBpejvqOgz+qh+7XdeivN+YNp5k4TYiXsNRxM/gohVfyehH9bs1H
 mLl/ml9XTXWPeHzlAUY0nLi3YKYwSDNIfyAfX6hIZyjLgsO4FC0aiWiB0PgZr7XcW8qJ
 Qcbnqx9g8X6YokUrohHsOX+iihPKCW4E8FfCCrX2ACkCjuK+aumzcw3oIaFZGj1xcMVS
 f7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zl6Pig05elwyO5r1ax9J/GdJ0w+BvbTSAW2OuBArtBQ=;
 b=A9iwjqvBWTYzn7NYRpGmgd20Ww3w95skdWV5mvDSF/U6zQBkUHlmUiO+K57w9QY8W+
 bORaQX9C5Z4VtKHpRrQUtz+p8/ascS6/5tYKRVPk2dOu6XXVSSlwA+AFV0rNl5SuTall
 XdMAdrj5yHuW3Ltjl/TdQDYujicRlNZOvgEh8ya9eOVDTbUFBPIMmjez17BPJbPvQ2Cp
 4x4MPt/Zbt+W18JHX/bhoXUpmTvfF/nTRGzNFule8y+lfG08bJB6Vp7aYC4Al/EGIPcZ
 iO4CB17PV3/Ugpx+oJIpmcyg1t4Q3zUzxRpmASvoeY1qULy7ymszkMad/ui804lnZ3Md
 o+OQ==
X-Gm-Message-State: AOAM531a+4AQI6Bktk3FgUJwAxPE7+Zf1ipKzwTS86mI8ZbfM3w3duRE
 6lNKrZMDM7qHEVTZ+vCukmJqIudIwM/pxkVv1cARZw==
X-Google-Smtp-Source: ABdhPJySltLtO3M/kXj+giqHrhsUASVyBaIBSjpZTyiXMPz1K7pwMYq1zlVFyCbSmg1D+3FKXp8US90j+MfG10W5U20=
X-Received: by 2002:a05:600c:354f:: with SMTP id
 i15mr6297591wmq.59.1637380837533; 
 Fri, 19 Nov 2021 20:00:37 -0800 (PST)
MIME-Version: 1.0
References: <20211119164413.29052-1-palmer@rivosinc.com>
 <20211119164413.29052-7-palmer@rivosinc.com>
In-Reply-To: <20211119164413.29052-7-palmer@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 20 Nov 2021 09:30:26 +0530
Message-ID: <CAAhSdy3tez4x8L_bqQXr_76T=o+Ve_RmENTjv1ZTr3AWY2VwHA@mail.gmail.com>
Subject: Re: [PATCH 06/12] RISC-V: defconfigs: Sort CONFIG_PTP_1588_CLOCK
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
X-CRM114-CacheID: sfid-20211119_200039_183301_2CBC8163 
X-CRM114-Status: GOOD (  14.55  )
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
> This should have no functional change, it just sorts
> CONFIG_PTP_1588_CLOCK the same way savedefconfig does.  This only
> touches the rv64 defconfig because rv32_defconfig was already sorted
> correctly.
>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/configs/defconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 0f4fe5790fb5..fa9017c60b3d 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -71,9 +71,9 @@ CONFIG_HW_RANDOM=y
>  CONFIG_HW_RANDOM_VIRTIO=y
>  CONFIG_SPI=y
>  CONFIG_SPI_SIFIVE=y
> +# CONFIG_PTP_1588_CLOCK is not set
>  CONFIG_GPIOLIB=y
>  CONFIG_GPIO_SIFIVE=y
> -# CONFIG_PTP_1588_CLOCK is not set
>  CONFIG_POWER_RESET=y
>  CONFIG_DRM=m
>  CONFIG_DRM_RADEON=m
> --
> 2.32.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
