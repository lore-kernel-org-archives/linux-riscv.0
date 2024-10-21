Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA803D3C53F
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 06:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WgUFyjYdkn35XTX7Vd9eLo+9USm4BYYn+k/QDkdmUl8=; b=D873glscnG9zV2
	h/nVR1qc/RpxGZH7tXCOZAOtYBRcJ066HQo+4tK4XwvV8O07TB2e/eBpIJuGxflzdI93Ei8MzENqt
	q9i7d1eU3rkniyVo6rFW2zZBt7dnUIDQP4uRMKD81XasSSjLpgNWSh/XjH77H6T8GQvJMKyvAQSvq
	CmLulQEuxmlgWKU3oYv9PJ6kueaHNGPehcBzUfvNrnSl41f6u0wABm/S4V0OEWoeFYYSY5689JzZf
	KHUgqP8c28WDcexmTIUCiFeMH+9bb51hlUIHAkokoc9SK+11ZZLemPdOJKJ9XxK2KDRpr+76hKwUA
	CGvipWXJm12JKiDgUMEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2law-00000006Aj8-34BN;
	Mon, 21 Oct 2024 06:08:46 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2la8-00000006Abi-0SVK
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 06:07:57 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-288d4da7221so1927899fac.1
        for <linux-riscv@lists.infradead.org>; Sun, 20 Oct 2024 23:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729490875; x=1730095675; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FsHV1DeqWJoj2ZcYbTpaphYAWXw5LJS8G2+p8MKU1jM=;
        b=bMPgBwNtae3ByNb1hs1iHJS5swQ+cSNgCzLDShHAKFiO6ner0Ff7ppquvv005Ibtxn
         2R+ba7dr5BX5kCSdnF1npwbUqzKNLluD7i664UGY2Mww7YiCE3RZr96GjyuJvuYOts0F
         Ggq3G/brm0vrx2JVZ0Qu2udv93S5z2+zh99Ct+W5fPZhOj2926JPsmFfQtc+Yqr7o8VP
         2TAzV5VrYeghlDCqACefujJZv7usMyrwXc/A3poiMnClXe8fUPcAc589t95yf6lHoPUU
         GUbSPU3VP1KK1XFMmwqE7XSJFSp4uk61mig77dKUBhK0M3CR6Y688E6EOMY5oANdXUF0
         GHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729490875; x=1730095675;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FsHV1DeqWJoj2ZcYbTpaphYAWXw5LJS8G2+p8MKU1jM=;
        b=c5lWwyV/iZqLVCXwPkYj55VTjgWApioX4k52ptJnFiXJ2iBLJbeXCXIHf+OnpbNMP9
         cuWZiuNIOafde3OilwhHUFU6w7kLUAlmd/4REpjhuIdYGgM8iiQEeb4uecrhaQae2Oth
         wcv3qLX75R7bHgbXiRllSCzutz7Q3IAU5mVN9HjCDqqQ4Mj9b0oB7FcMGQjzkwD20VpO
         d1MUDfaQRy7giTx43arjbMViPgwP2/jg8nMaUN1EF1usOOaS+xbfHYlu69MSgphzbGmK
         6gD+3Ii8BroU8mkT53kIDa7Lq1I4OTnUw/SS3x2xf+w7ihB1YDN2mbL8w1+8igdN72WJ
         903Q==
X-Forwarded-Encrypted: i=1; AJvYcCU81tzw3S8l9RKbgI36lInfJSUdcj+Orqbr189xiqhGYjEYHSVWozlyZXLUFspNWo+U0Kpc2WzjKZC7yw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/pPyu+7pm6p+B1bYq4gbqbJs6KEG/9fXbE0oqdTrbUCvjeT90
	QZeVpsUE8grmbAHmCUEhkaSx4ddJyTF4uH+zJWz6hOk7tCWh7hckCVgx6Noz3xD2N3PqYxrTjiM
	uM/U1eVdUtw3OkPaySHuMO5P0k8k=
X-Google-Smtp-Source: AGHT+IHpPFqsJuCvsJFqshBiSlkp52VkseK6tb4r+rc6MrPKp4rcWkL3ThHr5jpGe6dSRrP2Uk6AQnrmJjxXvN8NsHg=
X-Received: by 2002:a05:6870:6394:b0:270:1b79:ccbc with SMTP id
 586e51a60fabf-2892c24db1bmr7442706fac.5.1729490872798; Sun, 20 Oct 2024
 23:07:52 -0700 (PDT)
MIME-Version: 1.0
References: <20241020142931.138277-1-aurelien@aurel32.net>
In-Reply-To: <20241020142931.138277-1-aurelien@aurel32.net>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 21 Oct 2024 11:37:37 +0530
Message-ID: <CANAwSgR1ks_L94QPSCOsL4ATX=3HA59LHK1GdJTctUsM_f_DuQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: dw_mmc: take SWIOTLB memory size limitation into account
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: William Qiu <william.qiu@starfivetech.com>, 
	"open list:RISC-V MISC SOC SUPPORT" <linux-riscv@lists.infradead.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	"open list:SYNOPSYS DESIGNWARE MMC/SD/SDIO DRIVER" <linux-mmc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	Ron Economos <re@w6rz.net>, Jing Luo <jing@jing.rocks>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_230756_173654_F1318EAB 
X-CRM114-Status: GOOD (  22.64  )
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

Hi Aurelien,

On Sun, 20 Oct 2024 at 20:01, Aurelien Jarno <aurelien@aurel32.net> wrote:
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
> ---
Please add my

Tested-by: Anand Moon <linux.amoon@gmail.com>

Thanks for fixing the warning below.

[  511.837216][  T148] dwmmc_starfive 16020000.mmc: swiotlb buffer is
full (sz: 290816 bytes), total 65536 (slots), used 246 (slots)
[  511.837423][    C0] dwmmc_starfive 16020000.mmc: swiotlb buffer is
full (sz: 278528 bytes), total 65536 (slots), used 222 (slots)
[  511.916951][    C0] dwmmc_starfive 16020000.mmc: swiotlb buffer is
full (sz: 290816 bytes), total 65536 (slots), used 24 (slots)
[  516.803916][  T575] dwmmc_starfive 16020000.mmc: swiotlb buffer is
full (sz: 507904 bytes), total 65536 (slots), used 122 (slots)
[  516.805450][    C0] dwmmc_starfive 16020000.mmc: swiotlb buffer is
full (sz: 507904 bytes), total 65536 (slots), used 364 (slots)

Thanks
-Anand

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
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
