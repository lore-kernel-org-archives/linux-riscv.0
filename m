Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EFCBC71131
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 14:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SP5HkyEGRcAWP/60czbFBfx/PzP66/QfMEGK1wSXsIU=; b=Q7hBZ/NwLOW0ww
	l2YYkMwvUlronXUsb34M3/vA9dIdTGcjfNuVbHh6fGv60+ujDLbAsvIIllmwKwKmwhfwH7rWNC9JT
	cSuyV4PPca3N2Msq0462L1MpNgVp0f6OHTFzCFcFAtLGARW72wyCEfV3fQtW1IFe1yJL9JdWNrnm4
	Naq4HfAvucoO1cSDPAS4zCj7ac0s/vG0+ErEwRlhp+seHOgTkJgxNUBbhZudS8ctOTEAWKeYxi8gk
	Kp3iH9dVWyyNV/Bqmsc/7MwP2apjHI122GWWystXkAOg7V7TSZSw6T1rDRsiBUl72mIGxFSYUaVgG
	2rSWFU1CfIGr03wPQDKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdXn-00000004ODa-194U;
	Mon, 09 Jun 2025 14:32:11 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdRe-00000004NZT-3mAH
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 14:25:51 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e7d9d480e6cso3083344276.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jun 2025 07:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749479150; x=1750083950; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/DHcPIW+FNlaQudxh/1xCvJS+KJ4L+7fwYUL5LAEe78=;
        b=u2ouLiG7ecKiQSu9bq+RSOxlHQ9Vw2ocmF8zu6j9dktxInU4z7t90UkyCbUdTi4nnd
         G2iTFKaXkK8+zzEJYlcw3+sPt+UWwZCG/r0B9LyNeuQn00EowKM54XaDZlh5HO7z8TWN
         DPQblEWjHzqjftBh9Im0eQ70sPBPaEawH9ZAP+I82oEZM2G6imM/th64Ot5QsY0VyetB
         didBrjqakdEuQepDaLnPkFPNcqTBSQpTIFKiL2k76FC+AzBZlY+zSdqrW9M5PNPmBUiM
         NxmeKDz5bFcS//EnMw2NA6fBf2BgQpntSiKykJKpVPRVGj28JBozByCAuHq+XxhrPlHB
         kIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749479150; x=1750083950;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/DHcPIW+FNlaQudxh/1xCvJS+KJ4L+7fwYUL5LAEe78=;
        b=aFUJb1n6+lpk5N3vypwsisupjnsstWwv4l3q4eTuJQwxzedPH6UVoaGX/KQ4O9jVCY
         qVmnsR9JK1GeOHi0OvTWwToZwLeCpr7LZ0aQ7VpoBHGXXJB6asw+z9Au3q79Pkv8ZGt1
         BmPD7HxmuMbIZQcI6rW77rIB+OZ72p65XQ/k1kNN42iTlmdT4Td8kge7S+Je8BTqVJ29
         1uqznS/Og6iQLEH0rUwpd4P5c6PZeXL5pJcTnG7dwMHmDFl3J2MftCaHBh3cS1/RRcry
         l41eZCdR1Df9OaBXllN7bDvFbzhZghRgG71lEmp9fFeLLJABZma6ti62XwmHZAUwD1FG
         zURg==
X-Forwarded-Encrypted: i=1; AJvYcCXF+v9UozcY63WLCPv9+QhWPEpkcFkEb1OuDOU3MKypOfrn5W5U94nlk39jgbPL6f2ugSMT3FbIegdRPA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwObO39J1GvALCVsUyg1MjX6A2QfGgreu7Xg2FxSGfIFptJdJWp
	JfFIPvBbMYOepObFWrwOoULc7EvzwzlLx2BzQ1nvqt40ZfqwA7NtDJqxyxPksPfkioeRb2TA6S0
	qgi57UpCCu/pIwkNeFBHh9gFXBB204QIJWDlOAy8i+w==
X-Gm-Gg: ASbGncsXf/QsFVaxQZaPa6u3mNZaO6bKbmFaMpKmzpRuL4bXTRXxxxJNp31moOb1bIt
	nNWJz9BAmIjCRUtjkPRAN+zn5+uBEtpSkGdpboC2KAx9XuEUM1TOo7elQXy0FWzn07wB/UOIMqB
	UzrtAFDuIlHj0Pb7tYHYdtZ5x06sd9BdIr1w==
X-Google-Smtp-Source: AGHT+IH/Pnd5J+NF0FnDZghYVyvpxu7EjsURZfHbZf+7AxkvSsyWy0aeXxECpBSIWdWQ+pB3LafvHHvF9PpdbwIrqGk=
X-Received: by 2002:a05:6902:2686:b0:e81:cfde:3d46 with SMTP id
 3f1490d57ef6-e81cfde4149mr9130040276.16.1749479149876; Mon, 09 Jun 2025
 07:25:49 -0700 (PDT)
MIME-Version: 1.0
References: <aDVTtQdXVtRhxOrb@stanley.mountain>
In-Reply-To: <aDVTtQdXVtRhxOrb@stanley.mountain>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 9 Jun 2025 16:25:12 +0200
X-Gm-Features: AX0GCFvaiXF4lOm-GilksSFMvid8SMz438Y_wsOtUwqxJmS3jsDnPCnS_PeSI8Q
Message-ID: <CAPDyKFqMmOUsEWjE7X2oj0Nuc+FU6g_0p=+JCQ8xgGXJXNN-0g@mail.gmail.com>
Subject: Re: [PATCH next] mmc: sdhci-of-k1: Fix error code in probe()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Yixun Lan <dlan@gentoo.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, kernel-janitors@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_072550_935677_396F0E2F 
X-CRM114-Status: GOOD (  15.34  )
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

On Tue, 27 May 2025 at 07:55, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> If spacemit_sdhci_get_clocks() fails, then propagate the error code.
> Don't return success.
>
> Fixes: e5502d15b0f3 ("mmc: sdhci-of-k1: add support for SpacemiT K1 SoC")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Applied for fixes, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-of-k1.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
> index 6880d3e9ab62..2e5da7c5834c 100644
> --- a/drivers/mmc/host/sdhci-of-k1.c
> +++ b/drivers/mmc/host/sdhci-of-k1.c
> @@ -276,7 +276,8 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
>
>         host->mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
>
> -       if (spacemit_sdhci_get_clocks(dev, pltfm_host))
> +       ret = spacemit_sdhci_get_clocks(dev, pltfm_host);
> +       if (ret)
>                 goto err_pltfm;
>
>         ret = sdhci_add_host(host);
> --
> 2.47.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
