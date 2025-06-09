Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D3C9C61CE8
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 14:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ta7TZkVhZsDeTvCWIAzro5JFfMvDSnvi5PhTFP7mz6g=; b=dLz/6aqcJtn2ll
	nWl5WIKD8zMgK2gKekodHfjy6aO29LtWJQvwkPlKwz5sOV0q3xlRVdiV4Ue9UWz29wtR+4HEZqXXS
	o8U6vu7xFoXdFWeM/n9XPi7LE9EBVX1sfHdKyUnKVos8hGg6KemdpZ2CM2QPngKUFmyqpHdFZTHog
	/VgkFSE7mc+iufNni6J4XTZuqfm2VqcenMGfH5/FUgpeZYyOK6JUa4Ff+KB0U6Usrom7u9ez5xhPt
	wT1jZRIy14bvCBxtAqgEQmk+D6QiGutU3VEAO1TYedaLWbbF21P9jvF22/3KK+dzuMQtEqGsfiRUY
	drnp1XF5wNedVQ7s5E9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdXm-00000004ODV-2srV;
	Mon, 09 Jun 2025 14:32:10 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOdRS-00000004NWa-32bK
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 14:25:40 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-e819aa98e7aso3402472276.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jun 2025 07:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749479138; x=1750083938; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=08IPBfBcl0I5u93yG1iOBKn0aIO2SlE43zAjUb4+G4A=;
        b=MXdeDcmv+uTmLn7hnKhjNfsDfXY6nwPULHzeXfEJNDDoY82Hf0oOBc4TLmMsHFAlZc
         OglQO7t+WeOlrSDE5Gtc8fJcmM924yzwkOBy7sYmY/XJTbj59tTSVt+flqSyp/D/h/iR
         fbCeYWufvVJh7bHAO3W8x9ku2kX9deHInZvNNZwoIM1BT80zFHvq+yitM0h/EI824z9V
         XzF8YB8tweRkREimAXmLdFCl2m3E+il6LCN90PO32gbef5RURF6//8V3Fd6moI45kEje
         ZXy51OEjQ37tTJvcA2SkdP/w3ipaR5LLzGtw2qC7LiJ3+88lY9eA5pAHZdvKDX+E/sE0
         nYcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749479138; x=1750083938;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=08IPBfBcl0I5u93yG1iOBKn0aIO2SlE43zAjUb4+G4A=;
        b=FsSFFeMcARryl1vwrcimo6bQKuifGi9p8yxuN4TLaRsPqH6PEy8+WFDSj0tvar0Sbm
         ZjoB3Xv6ofEBimRb1k/z9cf59gD1LyYVeaVkym5ZCtjxsvZFsVTh3woWGsgeYp2Q/YUn
         B8oJhRx8EXZz3/tEY93iyi2BtELffn7k64218OfiULbr+k7VqEgPH4VxeexDbBBz1LN4
         zCgktBwwa2co7rv3ypMIvewWpx6Kk4ZEoR1caeHK7IWFcP92FjUPFinoXm2z2QTL6tWt
         2wGKPh1ty2amy0SCAJIpwpwVrLHiocxBtmPmrgd/aSzSKR7ShzMVonhlMy8K0d0TloJn
         caPw==
X-Forwarded-Encrypted: i=1; AJvYcCWQG3FDxsbD6B0cxsac4GjBs77gbUl+axMtVQgX3DwmzCdWLMFMT3absvRc1q6WyPTPRpyYQPAhiQNZkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2HoCOJzon/YZpSZIBRNF1u/3rRZtu2QVWpyHed2aQngTqLBUI
	YZHiNFIU2Kl4R43iPEjrO7yqBLIbA+YzZiJLGku4rOxMiLzxasJ35MkCxfbz30Qfv2U+Q9JQOGh
	PcEwMNOWz+QoLdlC3Wxsd1cUwSEpNVYmKLeIIuXaPAg==
X-Gm-Gg: ASbGncspAqa1eC3vE3YqrjRoXI32pyhSZ3QX/vCS+n9NZ7jTtZeq6lvCPrPScTyhF1a
	9QMUsHAfTTSbbJyqTXY8wzcOtGL/NnVK7tlb9HmSaxpqTy2PfJ0iRU+f/e7l2dRDDdSlyx0d8ak
	uypjlnIkj95rlV2T6QUW1X60pfTldUwxggZ7Sjf6Mm8I44
X-Google-Smtp-Source: AGHT+IFJR4aUEYQFFbDZaS8lUqINbO+uSj5liG0a2YzJSs3reQoye8CT00DeZ0MCmOmCgc5uVI1W+JPgVoRQgVJQkXI=
X-Received: by 2002:a05:6902:2d82:b0:e81:9581:4b8d with SMTP id
 3f1490d57ef6-e81a22e28damr12881553276.27.1749479137932; Mon, 09 Jun 2025
 07:25:37 -0700 (PDT)
MIME-Version: 1.0
References: <20250523-21-k1-sdhci-v1-0-9f293116a7e7@gentoo.org>
In-Reply-To: <20250523-21-k1-sdhci-v1-0-9f293116a7e7@gentoo.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 9 Jun 2025 16:25:02 +0200
X-Gm-Features: AX0GCFurOqp9D4c4_5rdTPaeyNA34lDzrdQDOcopYfWdJ2pwCdIenMEDwksvwR0
Message-ID: <CAPDyKFqUkjG8=f35CmGmTjN60_HzGnF7XihK7t8X1KA=kNSGig@mail.gmail.com>
Subject: Re: [PATCH 0/2] sdhci: spacemit: improvement of register defintion
 and HW busy detection
To: Yixun Lan <dlan@gentoo.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_072538_765229_2E94E934 
X-CRM114-Status: GOOD (  11.32  )
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

On Fri, 23 May 2025 at 16:47, Yixun Lan <dlan@gentoo.org> wrote:
>
> These series address two comments from Ulf during the review cycle
> of version 2 [1].
>
> - improve register/BITs definition to make them less generic
> - drop MMC_CAP_WAIT_WHILE_BUSY flag to disable HW busy detection,
>   this is tested on Bananapi-F3 board.
>
> Link: https://lore.kernel.org/all/CAPDyKFoDWS6DWdKOaxTDEYeKv3hjVDoR7XGi19nESVssc-RG8g@mail.gmail.com/ [1]
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> Yixun Lan (2):
>       mmc: sdhci-of-k1: make register definition vendor specific
>       mmc: sdhci-of-k1: disable HW busy detection
>
>  drivers/mmc/host/sdhci-of-k1.c | 140 +++++++++++++++++++++--------------------
>  1 file changed, 72 insertions(+), 68 deletions(-)
> ---
> base-commit: f7f05c5ea4af0f28cccfa49fe1af65e85dba5ef6
> change-id: 20250522-21-k1-sdhci-c987fd67c82f
>
> Best regards,
> --
> Yixun Lan

Applied for next, thanks!

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
