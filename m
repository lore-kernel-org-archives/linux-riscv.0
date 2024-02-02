Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B325EC48291
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 16:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nZ83cqlUFllcgsJDmGSS9/rOs+OJEZD1IhRmBGfXJAg=; b=JfwWjhB2xJEBUP
	rcDEfnCxc36vDxVDpXP7jy+ojWKAmuoBP752ahEt7LWtIqFHSru3Rh913PeXX2XooK2tL1tFgqCK8
	E9E1LJk+6GiXgOgc+2QLnQ29FCK2FVHUbPPPLTOni4+VfhEHnqPEk7pGTZDaqh/Uqu0duAKsE8XDW
	YtmS5IrrqWMnfvSpXmSCbEaW2tADBvdhe9ul4ukUtsnaTwlqmb5ajzkI2Rp56QpbX/P6sWUptHJkj
	zxuB1OnOUohLZJZiER3kpClEsMwjJEHUzbNcwJAPlkm9dQjfNORYig7TKiLGCWlLDRPZwWP8Uao0g
	BWav9b1DYOhzHj2Ag2+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVwXy-0000000CMIR-23xz;
	Fri, 02 Feb 2024 16:37:46 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVwXv-0000000CMGg-0wKQ
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 16:37:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 58042CE2C2D
	for <linux-riscv@lists.infradead.org>; Fri,  2 Feb 2024 16:37:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B487C433C7
	for <linux-riscv@lists.infradead.org>; Fri,  2 Feb 2024 16:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706891860;
	bh=Uwkd7nTQQrSccD545d3Y+lH6FQYzJbXBcM9/NkSdyEU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fXHS0fuyj/S03+wmk5ISzAXdQ8cMdABMx6ExToz8J4VtDmQbJ8hPFgjtzru1e8/Aw
	 DLegNr7XswiSzak9whAzIsW+48P5LDZSbLuGEB31DJe6aKrSIkbhf1Di0GuD0R5KWR
	 9K/xj19XqXZLro3BoaW+43MvNTrvWnRPxmtN/+gYvTxpka5TxFtxKJaMDux/IszswB
	 JRKDFSIVE+zmeEjhlkCDUxJf0J1LHTMFPsTcJr1AOJ0mM0MQiLFw666l9tZ29VLPu0
	 LizKmg8YJIsUwwlbbNL8WPUowEqVutqGy87WF3IdnnRKYx7fB8NRX/lflzu+MzYVFq
	 cFuGogFLj8yEQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d07b400bb8so21074971fa.2
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 08:37:40 -0800 (PST)
X-Gm-Message-State: AOJu0Ywd+6q6c1wzq+g10XkqyJ0Te4PyuOkYTD6jFKAcAkDEEZtnnQHw
	kGTWer7KhkimHDRvcn/P0dEHvTrAa/Xs8XyHatRWmBczxLdKybFpSk8PoVqDu0w0qaT4Z09AgtI
	NGDBuVrKx92pWbwlfPSw3qmcCjcA=
X-Google-Smtp-Source: AGHT+IH+2hrSf5CH7QZoCnp7kbDbwEWAwfZngecusVvcc+8VLLiXgX2u9WvaRUy0ZbgjPawIpFHcGXT0CgZtix88FXM=
X-Received: by 2002:a2e:bc1b:0:b0:2d0:870e:b29d with SMTP id
 b27-20020a2ebc1b000000b002d0870eb29dmr1857693ljf.50.1706891858752; Fri, 02
 Feb 2024 08:37:38 -0800 (PST)
MIME-Version: 1.0
References: <20240202163433.786581-1-abrestic@rivosinc.com> <20240202163433.786581-2-abrestic@rivosinc.com>
In-Reply-To: <20240202163433.786581-2-abrestic@rivosinc.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 2 Feb 2024 17:37:24 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGR0thbcDt32pC=KS=tsmSWqQuyhJ2Ftq0vX3u=dLX22g@mail.gmail.com>
Message-ID: <CAMj1kXGR0thbcDt32pC=KS=tsmSWqQuyhJ2Ftq0vX3u=dLX22g@mail.gmail.com>
Subject: Re: [PATCH 1/2] efi: runtime: Fix potential overflow of soft-reserved
 region size
To: Andrew Bresticker <abrestic@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_083744_065638_E8EF35C2 
X-CRM114-Status: GOOD (  15.59  )
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

Hi Andrew,

On Fri, 2 Feb 2024 at 17:34, Andrew Bresticker <abrestic@rivosinc.com> wrote:
>
> md_size will have been narrowed if we have >= 4GB worth of pages in a
> soft-reserved region.
>
> Signed-off-by: Andrew Bresticker <abrestic@rivosinc.com>
> ---
>  drivers/firmware/efi/arm-runtime.c   | 2 +-
>  drivers/firmware/efi/riscv-runtime.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/firmware/efi/arm-runtime.c b/drivers/firmware/efi/arm-runtime.c
> index 83f5bb57fa4c..f369256c7003 100644
> --- a/drivers/firmware/efi/arm-runtime.c
> +++ b/drivers/firmware/efi/arm-runtime.c
> @@ -107,7 +107,7 @@ static int __init arm_enable_runtime_services(void)
>                 efi_memory_desc_t *md;
>
>                 for_each_efi_memory_desc(md) {
> -                       int md_size = md->num_pages << EFI_PAGE_SHIFT;
> +                       unsigned long md_size = md->num_pages << EFI_PAGE_SHIFT;

Better use u64 here, and below as well.


>                         struct resource *res;
>
>                         if (!(md->attribute & EFI_MEMORY_SP))
> diff --git a/drivers/firmware/efi/riscv-runtime.c b/drivers/firmware/efi/riscv-runtime.c
> index 09525fb5c240..9da79b8169d2 100644
> --- a/drivers/firmware/efi/riscv-runtime.c
> +++ b/drivers/firmware/efi/riscv-runtime.c
> @@ -85,7 +85,7 @@ static int __init riscv_enable_runtime_services(void)
>                 efi_memory_desc_t *md;
>
>                 for_each_efi_memory_desc(md) {
> -                       int md_size = md->num_pages << EFI_PAGE_SHIFT;
> +                       unsigned long md_size = md->num_pages << EFI_PAGE_SHIFT;
>                         struct resource *res;
>
>                         if (!(md->attribute & EFI_MEMORY_SP))
> --
> 2.34.1
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
