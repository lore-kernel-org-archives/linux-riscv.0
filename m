Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABC4EE0210
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 22:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TFyw+b845dwFQ7TJz+9l7D6++MDSfxogestXh8MXC40=; b=fkL0439F9640TY
	XwtqxBU6hdQQxCtnySDgaHcH2VobtCKkQ4KaINn5WUVgLqjG1x5RZM5JE8CNmZQLJCuT+H0pHj1NN
	Xn/6nON/aopohOxot2BeBjQo7HsUzZpaIhzyh3pznQ2ZP8+LgPKwZAG2yvRGqEGJXazeJZDmxhhQl
	nPpCXsBzxB+qBuMX7c1yUg5N824oASzTWerleLDEj0WNn5J8ScZFTrZlmY+W1qyJpUB5eNU3nwKWh
	8y/0CvoDUTIWde4oiW38oc5zUXm38Nm15VcNgFQQxdYRAYskDnNkUayA0RNU63quSV6eqZshrTqp/
	9eYrmoKrYOLZMSBM1mhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgYNx-006oPb-1t;
	Wed, 13 Sep 2023 22:31:01 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgYNu-006oPF-1t
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 22:30:59 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-5922380064bso3548547b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 15:30:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694644256; x=1695249056; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LpRvRmdLKZN1fAsXTvuEC4vXsjz/GIuJNG6GTfaK4Ls=;
        b=FnlySOkyNPYI32I9XHqP08JgAphNPiz4h7FxiKg1nizQDB16MLookWp7LMm6rBR74L
         8MYFQ7KjZ98y/hNbm1NEqX5hkrOyWBOlIvM9O+H8C5TQTWkVqFHuhxh/tz6Q8kFBN2hm
         HuP0AenGbGG3lDqtNP97Jc4jlWupX+83uywENkDPmLRSimeEyouENEo1hnhepgCI8ToS
         BM90eXkDVwhrWWljbp+eXuoOV6Jfiqu/7wIbm+OMSTaSHGaJubQjlBXjVKXL06tHgj6J
         UVs259ItHPIqCPHJ9uu9v/P+5HVySGz+fbYJgENTeGmKFQj+/Vgx8WhkL6h/AsWt4pny
         idNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694644256; x=1695249056;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LpRvRmdLKZN1fAsXTvuEC4vXsjz/GIuJNG6GTfaK4Ls=;
        b=MaR4OECvewbJCNcCF7DwSaLI2pggiWDfyD1EmSMT6E8Neh5FusImJVQw8JMj65i/3J
         YjDOQYRdBMWvkFq57jsG7ANFeiU2p+HU3MceLPyD2drWVh6tCdsn2cZI4/Kh05p5DqVA
         Jt+MymOA6ql2IMJp4Kj0wX7HVz/JG321a3cbAE1MnNih8ApQdb8uRJp0/ut0WfKExmtG
         p/N/Qs1ufrrDGBOSoHE7aVyvIJMp99FumDtnuWv4E3WgZD15dQkawG+ZzJ4attx1rxg+
         10GrMajnxdnDcn69q3DRrEDsym0XD8x0ZvwIxAAC9+3lV4hWBfSxVdIJR9D08h7oa0jW
         ox1w==
X-Gm-Message-State: AOJu0YyhXRaZYilIV/L+GDCQOCixojR2LUeF1z4U4zNnaHowVU1SCit/
	G4ivSH7WsRdpGr+F47dvsHiUgP12r6BcP2Z+iFnlpQ==
X-Google-Smtp-Source: AGHT+IEg5emrh3Qk7P/wBxCbLwpiY1lTtDrRo47SLgbxFH5mT1OakFbaAVGWO+TMZ4ICQLGHbBFMooRRI5AfjrnsXWk=
X-Received: by 2002:a25:8389:0:b0:d7a:c527:38cd with SMTP id
 t9-20020a258389000000b00d7ac52738cdmr3460613ybk.63.1694644256645; Wed, 13 Sep
 2023 15:30:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230913-bloomers-scorebook-fb45e0a2aa19@spud>
In-Reply-To: <20230913-bloomers-scorebook-fb45e0a2aa19@spud>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 14 Sep 2023 00:30:20 +0200
Message-ID: <CAPDyKFoENVp7+VjKkPpJWDecowxYD=QM6TSa6HjyzOZ=z7r81w@mail.gmail.com>
Subject: Re: [GIT PULL 0/5] Missed starfive pmdomain changes for v6.6, now for v6.7
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, arnd@arndb.de, 
	changhuang.liang@starfivetech.com, jiajie.ho@starfivetech.com, 
	linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org, robh@kernel.org, 
	walker.chen@starfivetech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_153058_626107_FE9D7015 
X-CRM114-Status: GOOD (  16.41  )
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

On Wed, 13 Sept 2023 at 15:56, Conor Dooley <conor@kernel.org> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Hey Uffe,
>
> Here's those missed changes in patch form. I figured it might be a bit
> easier this way given the name of the subsystem is in flux, doubly so if
> you'd like to put the header change of Rob's on fixes.

Not sure we really need to queue up patch 1 for fixes - or is it
fixing a real problem for us?

>
> I had this out for LKP last night, seemed to get a clean bill of health,
> before I rebased it on top of the new name this afternoon, and ofc it was
> in linux-next on top of v6.5 for quite a while...
>
> Thanks,
> Conor.
>
> CC: arnd@arndb.de
> CC: changhuang.liang@starfivetech.com
> CC: jiajie.ho@starfivetech.com
> CC: linux-pm@vger.kernel.org
> CC: linux-riscv@lists.infradead.org
> CC: robh@kernel.org
> CC: ulf.hansson@linaro.org
> CC: walker.chen@starfivetech.com
>
> Changhuang Liang (4):
>   dt-bindings: power: Add power-domain header for JH7110
>   pmdomain: starfive: Replace SOC_STARFIVE with ARCH_STARFIVE
>   pmdomain: starfive: Extract JH7110 pmu private operations
>   pmdomain: starfive: Add JH7110 AON PMU support
>
> Rob Herring (1):
>   pmdomain: starfive: Explicitly include correct DT includes
>
>  MAINTAINERS                                   |   1 +
>  drivers/pmdomain/starfive/jh71xx-pmu.c        | 139 ++++++++++++++----
>  drivers/soc/starfive/Kconfig                  |   4 +-
>  .../dt-bindings/power/starfive,jh7110-pmu.h   |   5 +-
>  4 files changed, 117 insertions(+), 32 deletions(-)
>

The series applied for next, thanks!

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
