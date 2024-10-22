Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69631D2C546
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Oct 2024 12:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mspvdmeiMbYA710V7prlA2Jx/T+rk2GHGGbt2jK8WN8=; b=13fSckA+1nN1S2
	jlDN7wyUCIAC9bmLC/+rK13+A4aOHBVkXdxIHjgfUYmyTjTjdOBRnycsYOkZzzSdm3nLBUIzhUNnT
	z7jKIYW89RF//kwgMXL6uM0Wz28tEDYP3rCAhogdy9ir2O5dF6c2bDhDcxwbr1/Nx3VpxAYD27QM7
	ucr0aH44vZ+0P0PICDThEoWOttsfaebVViJP4P43gSpSgeZu8CKcqJWwMPNBFz0Ptfv8b4GsZ7vXW
	bZrPI7DgJ8QbIczb9izDv/g/4bfJMTq8Fp6nVkDFGiOb1Klc36RHlcVKdh8mmn/vIblda5mKQO773
	EEvQvr3hDFyffJGU6PjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3EEK-0000000AqtN-1jf0;
	Tue, 22 Oct 2024 12:43:20 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3EEH-0000000AqrQ-1Q65
	for linux-riscv@lists.infradead.org;
	Tue, 22 Oct 2024 12:43:19 +0000
Received: by mail-yb1-xb29.google.com with SMTP id 3f1490d57ef6-e2972abc807so5087369276.3
        for <linux-riscv@lists.infradead.org>; Tue, 22 Oct 2024 05:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729600996; x=1730205796; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SaOXu7NaxTVENXCsAQaNxc71DXxVkPqm5aNi9pXqVVY=;
        b=Pa/eGQOm1glXJBVxkdl+bZXsIpSvQ5izkpd3CEYZshrcgm/P1Cskf4xvdMu71nDIxu
         Lj+vbxtwipuwRen7W8Ksio0Yq0DjJqNR1rz/YBJzRtCFQETSVzTEOBlzV0/5oWVKn6GI
         7JRmPFzyAhZxlWoKzlCiepU7BR1Np7xiyBfW41WSbtMTmnpVOnsFsblgJFHw6KYQBS7p
         wNyl0pNL8JtWX4KujOqNkdtE6/Dy2JFBJPYq8wOswHgd7Na8uDdUtGw/wyXsBOM22djY
         rg6xv5h5PGau9qiKV7FhnNef3QphUh5YFCltYPWPCXbHplo3i4Hi4buTip76ltvTXyCG
         66zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729600996; x=1730205796;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SaOXu7NaxTVENXCsAQaNxc71DXxVkPqm5aNi9pXqVVY=;
        b=RopdzKzZbHww/c4wRJl2rTHFht0w/S5ZaR+2he5B53JUxE/e+ulu1HXffHtr6Do0a0
         1xipnvOMjSwft+Yj6gipdxtGmUQSUJHPj8dpgPdrszGhDJAtn40lF37GvzsQekvVGXis
         csUi3b8XFHukaa3Ehghffu6nqeiAs/gqrkInsG2BtdktAd6NkxD2i1eKDHPYiR1E1Zxc
         b4wU4fY0y1i6hRAYJGAhnpvPLBFBQwfIgv9S99o91Tu6I8wGE28oQOr+gzLEw2q4PX60
         RKUJ77f3t6MskvxcNvzOlS+bN28lxJG4lggZi56eZVXgzZOCLMTMuLN9UkS+TnQTrqli
         HqrA==
X-Forwarded-Encrypted: i=1; AJvYcCXnSCgJtHwFFPIUO1nr3I9xWSEkjD+mXrSlqOIvH8BNYsJOFutJQaOSYlA3J7gLSxq0IcEH7pGtZANtNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTxo1tFK3SOudNevHNi6X0WfLt6Aq4ile+gZUScOdSS7PECTvC
	VF+ldktWxNe3EjKo8+4XXKyTo/RplYasT+jfEC4smJBJuahpGCWiMtK2LKqwptsId4+LTK8VW4C
	09R3wWbGKSj7gJFSxCZnF/Wz6Syo9i9zL+RTQiw==
X-Google-Smtp-Source: AGHT+IEjUOeNvCGfPmX5CA7E6xqtR1WdLOVX8tlGLznwKB3j619LMDAn9ejkibYgLTVRmf3S4wJdL9yK3QWSPiysYzw=
X-Received: by 2002:a25:8545:0:b0:e2b:d0b8:576b with SMTP id
 3f1490d57ef6-e2bd0b858f9mr7059774276.17.1729600996120; Tue, 22 Oct 2024
 05:43:16 -0700 (PDT)
MIME-Version: 1.0
References: <20241020142931.138277-1-aurelien@aurel32.net>
In-Reply-To: <20241020142931.138277-1-aurelien@aurel32.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 22 Oct 2024 14:42:39 +0200
Message-ID: <CAPDyKFoQsf89NeX28ms7FtM0QWNqYQ5xtt2=+G1JNCVi2z9=dg@mail.gmail.com>
Subject: Re: [PATCH] mmc: dw_mmc: take SWIOTLB memory size limitation into account
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: William Qiu <william.qiu@starfivetech.com>, 
	"open list:RISC-V MISC SOC SUPPORT" <linux-riscv@lists.infradead.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Sam Protsenko <semen.protsenko@linaro.org>, 
	"open list:SYNOPSYS DESIGNWARE MMC/SD/SDIO DRIVER" <linux-mmc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Ron Economos <re@w6rz.net>, Jing Luo <jing@jing.rocks>, stable@vger.kernel.org, 
	Adam Green <greena88@gmail.com>, Shawn Lin <shawn.lin@rock-chips.com>, sydarn@proton.me, 
	Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_054317_400359_F1DFD9FE 
X-CRM114-Status: GOOD (  23.81  )
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

+ Adam, Arnd, Shawn-Lin, sydarn


On Sun, 20 Oct 2024 at 16:30, Aurelien Jarno <aurelien@aurel32.net> wrote:
>
> The Synopsys DesignWare mmc controller on the JH7110 SoC
> (dw_mmc-starfive.c driver) is using a 32-bit IDMAC address bus width,
> and thus requires the use of SWIOTLB.
>
> The commit 8396c793ffdf ("mmc: dw_mmc: Fix IDMAC operation with pages
> bigger than 4K") increased the max_seq_size, even for 4K pages, causing
> "swiotlb buffer is full" to happen because swiotlb can only handle a
> memory size up to 256kB only.
>
> Fix the issue, by making sure the dw_mmc driver doesn't use segments
> bigger than what SWIOTLB can handle.
>
> Reported-by: Ron Economos <re@w6rz.net>
> Reported-by: Jing Luo <jing@jing.rocks>
> Fixes: 8396c793ffdf ("mmc: dw_mmc: Fix IDMAC operation with pages bigger than 4K")
> Cc: stable@vger.kernel.org
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

Thanks for working on this! Looks like we have managed to mess things
up. Besides the issue that you have been working on to fix, apparently
there seems to be another one too [1].

Unfortunately, $subject patch doesn't seem to fix the problem in [1],
as has been reported by Adam.

I have looped in some more people to this thread, hopefully we agree
on how this should be fixed properly. Otherwise, I tend to say that we
should simply revert the offending commit and start over.

Kind regards
Uffe

[1]
https://lore.kernel.org/all/CAC8uq=Ppnmv98mpa1CrWLawWoPnu5abtU69v-=G-P7ysATQ2Pw@mail.gmail.com/

> ---
>  drivers/mmc/host/dw_mmc.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
> index 41e451235f637..dc0d6201f7b73 100644
> --- a/drivers/mmc/host/dw_mmc.c
> +++ b/drivers/mmc/host/dw_mmc.c
> @@ -2958,7 +2958,8 @@ static int dw_mci_init_slot(struct dw_mci *host)
>                 mmc->max_segs = host->ring_size;
>                 mmc->max_blk_size = 65535;
>                 mmc->max_req_size = DW_MCI_DESC_DATA_LENGTH * host->ring_size;
> -               mmc->max_seg_size = mmc->max_req_size;
> +               mmc->max_seg_size =
> +                   min_t(size_t, mmc->max_req_size, dma_max_mapping_size(host->dev));
>                 mmc->max_blk_count = mmc->max_req_size / 512;
>         } else if (host->use_dma == TRANS_MODE_EDMAC) {
>                 mmc->max_segs = 64;
> --
> 2.45.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
