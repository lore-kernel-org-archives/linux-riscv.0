Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BABCCC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Nov 2021 04:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A52voZMWp4kMgh9ehvDUY8ggl0MhhV/aaN0vjRj7SrM=; b=gapYDqnhwDHNo4
	anKzTTsmwpJHCeK9W67u2jVM92xY+WNgkCWhdAzGuFFZGVcuFfjuyDoa770ImgtRrgMFSXlWUfE5B
	WdNjvlEVwj3ZQmwYJx7kWxWxSKO4upLhROHiNlf13DAGiN/wnWwuD0rQ6EQbA4JrZEoDXEYmxLb9H
	CL4PUZQATbcBkHgOyJQ3NdY9LWN0xTJTgJOaXTlnQIqYNab5o8Lni4jiFINcPEHOkpaQeYtMjKS3U
	2WyYirDa982Fy5OKIUSjqYaFvaMSD7SF3o3iQ2iF+47tHp1R3JZ8wkGzaiAuc0KFfS9ep6kLC+pFS
	fe4/DWTx0vGDp4Jo8AwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1moHZM-00C0Xc-Mk; Sat, 20 Nov 2021 04:01:40 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moHZK-00C0Wp-0H
 for linux-riscv@lists.infradead.org; Sat, 20 Nov 2021 04:01:39 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 f7-20020a1c1f07000000b0032ee11917ceso9001426wmf.0
 for <linux-riscv@lists.infradead.org>; Fri, 19 Nov 2021 20:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=91hgkvMagzzdtA7j3uCrPomJgAj+GmZeXcVvVsWMKYI=;
 b=UrYGIdflxT+VIeXGHHEvV5dcH2b7ykOSLSK3Od9XTzDRYvIC+MT3C9WodHbjuKREye
 aQfMrgdowWnK8PIBaDFQ+PtUpTJzk5s1+TCJA3vJzPSbUd1JsUWPUwqgsc8cPeXZXd6N
 OfUnl0IVqMKN9D4adh34HLnxwH2lVUy/7uvg7d2CN/u4RoVEI/e9l6IYRqtmKLiKR9HL
 QVP2QJwNi8/7rK+7mtnW5JwvrtL8eA7tAMHzG77kZT+POhSDHfqZYYlbSUvJjw3zEybb
 3zxjpyovNJvMHC5sDeGc5rccNQ2IqKKjUF+GvmoCnWlT8Nr6WLvp/rXLUFpjO+a+kgTK
 mcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=91hgkvMagzzdtA7j3uCrPomJgAj+GmZeXcVvVsWMKYI=;
 b=UqO65P4JhiEWfwU1HZ1Hnis+wfRM6xqghfZBGO0L9RlrBwxlGDRhIZ2t655GkUeTJI
 tmD2l5xM1rSIAnG/BBl175zRH7WIxfh9aPju9mFua28X/y5FRFyu9eBuzBuHn/YjtJ/T
 bzrV0bLMxViwXQlX/+UN0WXTk2CDQO12aJhYE/yRHRJIz2hXn5kRxWGQSVRKG+c+kinc
 RwupRGGjUPWPqZ5ztSMqqSavTGrntLZIUEnexavHrz9ZVm8rSbmegxT1bAtyI7Sh1G+z
 454C2qo/uqfFHLONEdpy26y+YXoe9eSccXCJfpXDi1on7VFk63/dpThTPN8l2kMCGoxF
 cYUA==
X-Gm-Message-State: AOAM530VQoBsXuQBCobDe0NUuu7gnA24WZEMMcvp2cjW8yb7TQHfFaDx
 b79cuDygswIj8I0LsDTbRik1hvtQv70ctlK3Vm+C1w==
X-Google-Smtp-Source: ABdhPJxlzboCwwqWNYtVsqf6BEyLRFhN4pocPFJOJwuVXg+j1922/JCIElPydy7svQZ7ez2yT2fkr0ZTEqWdzKdtFCE=
X-Received: by 2002:a1c:7201:: with SMTP id n1mr6415226wmc.176.1637380896488; 
 Fri, 19 Nov 2021 20:01:36 -0800 (PST)
MIME-Version: 1.0
References: <20211119164413.29052-1-palmer@rivosinc.com>
 <20211119164413.29052-8-palmer@rivosinc.com>
In-Reply-To: <20211119164413.29052-8-palmer@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 20 Nov 2021 09:31:24 +0530
Message-ID: <CAAhSdy2QR+BEWqWOsg56SYODcuq68qknh7wZ1qLAFrK8zvRmRA@mail.gmail.com>
Subject: Re: [PATCH 07/12] RISC-V: defconfigs: Sort CONFIG_MMC
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
X-CRM114-CacheID: sfid-20211119_200138_071954_52405BD6 
X-CRM114-Status: GOOD (  13.68  )
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
> This should have no functional change, it just sorts CONFIG_MMC the same
> way savedefconfig does.  This only touches the rv64 defconfig because
> rv32_defconfig was already sorted correctly.
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
> index fa9017c60b3d..ec9540392df7 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -90,10 +90,10 @@ CONFIG_USB_OHCI_HCD=y
>  CONFIG_USB_OHCI_HCD_PLATFORM=y
>  CONFIG_USB_STORAGE=y
>  CONFIG_USB_UAS=y
> +CONFIG_MMC=y
>  CONFIG_MMC_SDHCI=y
>  CONFIG_MMC_SDHCI_PLTFM=y
>  CONFIG_MMC_SDHCI_CADENCE=y
> -CONFIG_MMC=y
>  CONFIG_MMC_SPI=y
>  CONFIG_RTC_CLASS=y
>  CONFIG_VIRTIO_PCI=y
> --
> 2.32.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
