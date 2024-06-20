Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF9BC27C79
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jun 2024 12:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F/TUp+TihnNczGlg1awyxDCg3etMvc+hJNWvhw7T+JE=; b=NClW2hCmJsdMqG
	4P09W/hfqfL51pnlnVxhVRis3KX2JhDTEa6Z86GKqZGflrFl002llW480AbYlJN3x+bcfavO2JpIY
	+086ZoSCnEMGtGQQ0l1T2bgGTyUJk+XF3WmE/Bwv9pvOv1p+/il/kkcruLZ8fCrQgoBc8Dcm56sOj
	mRx04G+iCfSO+eo/3YeroJ6WhpfPkHH1RSbwd38ioI1pJRTS9xj5OYAdx3BOM0ezdIeEjV4DSX058
	qWdC3VqQxnwNXyqUOeRNFiuzEFlNml3vIEAFH2/cOmcXNjpsgRvfzJoKwrfi5aOL5AwPbbZraRFUw
	G4G8SHvFYMGZB1lWaetQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKHFh-000000050Ts-3xca;
	Thu, 20 Jun 2024 12:50:57 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKHFe-000000050SH-2GBd
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jun 2024 12:50:56 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-dfab5f7e749so772047276.0
        for <linux-riscv@lists.infradead.org>; Thu, 20 Jun 2024 05:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718887852; x=1719492652; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V7Ui2B3eiuQfY6kcWseFEWEENplZ5Qoq4XUDUnDKk3A=;
        b=F/cqEfQ/bhbu459L1MIGR+JuF88cAnLd7dzSBm1AFxvSidR0pDHs23y8LrAgaH7KD4
         mTvv1JQFqFHZ4/MzcbR9QZg25qaqq2n+QGb4GknROg6UuwnOqOstVy0FjrIeebeBk0he
         IRiIUCfzS/eINKqmOQhQk+S3DCOVwRFPNJzW7/dsUp8SQXPpg2rl7NSbcMYnqaG3o3Vs
         EP6CStQa4Hkkd1Q66rNxcPVQ9Ei2Ogw3eNuX+5/AmbgNsHcvEVZyNkGhXmBu5MFPNaV+
         c5fUnVZxBSxkQZ3SOKBkEwg58OL4owLQTZCoC9wobTk25R5wpNGstbDzmdX6tSe64txh
         6pDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718887852; x=1719492652;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V7Ui2B3eiuQfY6kcWseFEWEENplZ5Qoq4XUDUnDKk3A=;
        b=Ih3ixuF7++brjbBncFYWMR8BObwFfQ2NLVStqKNuZ79BwpCzK4qYF6gC94l4GIsBmH
         O+mmYNyS2MLcmpr9YKlNlSWBupA62a1ePmQ1+bu3H/EfSqhLzdbAZdZ7hzoqviQCt8UI
         MA/lAABGRPD3eEPLVf5triVNW9Dotdx/dMlV3Ch4khwlnCdb+yDlV7u6vK4CEQ9OaFRg
         +Vpwg3whaP2h3NoAJ7FMHKV9i3EkNfQy6j5KKW6DpEVmHY5KrbNNEP/unjesYp3vspNO
         SabvTjA+qwkdYRQrZxnPE3NqxSj5yZORU+pFmsBnqn7xw+UI/vIF4+iY9DP5aJ+3JV8g
         XfwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVseA65AZOU4q2hhqBWX9QtlnBOp0ZlmXe2QGH1xSDBhA2c9Ias8McArU8vwP9Gqeq7enDtmwR9FUU2cOTJ08XSaO8M/NnY4QzPKB+WnTcn
X-Gm-Message-State: AOJu0YyxXN7kP+nzDbCA8eMKVM8vgPfVaoOBDWe5uMol0Iy0KX+hLcu4
	Q++q7nNpwhzrplVYgqSiQihWnmY9J/UsfJFhnSJvUvWipg9l7plHuxuSWZXdsDcx38IKgbftmHF
	NhAA8Tof21EOqxT5dxLpmXeXq01WcQFAhQHecEA==
X-Google-Smtp-Source: AGHT+IFzwmTlSm83S3zIQ/NDj8ijWnvuzYb+Ls9TCG0adu2HJouriCBzHm65cuenwHGzeYmKw4gbmsjLNgVHCs5ygNw=
X-Received: by 2002:a25:81c6:0:b0:e02:b580:d0b with SMTP id
 3f1490d57ef6-e02be203e4dmr5411315276.40.1718887852518; Thu, 20 Jun 2024
 05:50:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240612-brigade-shell-1f626e7e592f@spud> <20240612-dense-resample-563f07c30185@spud>
In-Reply-To: <20240612-dense-resample-563f07c30185@spud>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 20 Jun 2024 14:50:15 +0200
Message-ID: <CAPDyKFozcUPuMooDHVSBZomHTGKzseVf9F=YBY_uQejh9o3x7g@mail.gmail.com>
Subject: Re: [RFC v1 1/3] mmc: mmc_spi: allow for spi controllers incapable of
 getting as low as 400k
To: Conor Dooley <conor@kernel.org>
Cc: linux-mmc@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	cyril.jean@microchip.com, Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_055054_602118_FB156F3B 
X-CRM114-Status: GOOD (  18.39  )
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

On Wed, 12 Jun 2024 at 17:48, Conor Dooley <conor@kernel.org> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Some controllers may not be able to reach a bus clock as low as 400 KHz
> due to a lack of sufficient divisors. In these cases, the SD card slot
> becomes non-functional as Linux continuously attempts to set the bus
> clock to 400 KHz. If the controller is incapable of getting that low,
> set its minimum frequency instead. While this may eliminate some SD
> cards, it allows those capable of operating at the controller's minimum
> frequency to be used.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Looks reasonable to me. I assume you intend to send a non-RFC for
this, that I can pick up?

Kind regards
Uffe

> ---
>  drivers/mmc/host/mmc_spi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mmc_spi.c b/drivers/mmc/host/mmc_spi.c
> index 09d7a6a0dc1a..c9caa1ece7ef 100644
> --- a/drivers/mmc/host/mmc_spi.c
> +++ b/drivers/mmc/host/mmc_spi.c
> @@ -1208,7 +1208,10 @@ static int mmc_spi_probe(struct spi_device *spi)
>          * that's the only reason not to use a few MHz for f_min (until
>          * the upper layer reads the target frequency from the CSD).
>          */
> -       mmc->f_min = 400000;
> +       if (spi->controller->min_speed_hz > 400000)
> +               dev_warn(&spi->dev,"Controller unable to reduce bus clock to 400 KHz\n");
> +
> +       mmc->f_min = max(spi->controller->min_speed_hz, 400000);
>         mmc->f_max = spi->max_speed_hz;
>
>         host = mmc_priv(mmc);
> --
> 2.43.0
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
