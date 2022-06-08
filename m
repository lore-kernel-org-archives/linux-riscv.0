Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5345C43334
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 22:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Y9KA1paRrT8203NOenfWX37ABVHqvOSOM8mLIYuNQs=; b=lWX3/vRN0lZF1T
	kyXEtsfdjBGfg75xgXwQT3mhpFfz9JIGP9Ca/hdgOf5GVA5aviYM7AF23pqiEt/Pvi2uZ9QztjSlt
	pZmwiE4ytDV1QzhoLA5j6nDDooAtKNIr6IBffJ++Vh5ZPoV8E8j72vv6yS/BXazBiNpWNyKIo0Q64
	Xtdy9fmCO56U6nMZSlu2tz7Q2Gxh2iRobHP9wV43o3hzaGwl8+dnsXYj7g1fN2lUwFIzfAMoM/BGG
	81JuleG9+ln4nbDe3etqtgiCxnKymwvilR+5htl55h4YaTqmMO22/zUowdoG3llZ0rMIM5mArELhP
	BzEUe5oFzyaJhjeiYXhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz492-00F9Hb-SY; Wed, 08 Jun 2022 22:27:20 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nz48z-00F9HG-K4
	for linux-riscv@lists.infradead.org; Wed, 08 Jun 2022 22:27:18 +0000
Received: by mail-qk1-x729.google.com with SMTP id d23so1721182qke.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jun 2022 15:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jH4c12+CVRrTyhBbIEeVtZFXG81rflTZGiVkHkiLLNo=;
        b=79GOQq0/+RRLbqGewSFK851+7PhvVY6uIRw83i4C4/WmB5SQlsbXr91fSZ4M1Aq4zo
         jYEfd9tQql48uWWjKyGf4SSHjZ2kgu3BiGZkLvs50XK+WBCYiR6x2aSw3qcKvV/JjYux
         lNTMO8K+kxoTr+sxFdXVylNC73MD/mvw/XXFjNzdx2z2QpjyA7fvL70Dguby53f0zKXf
         6se2d5PW2hVwFTo4wFVBLKkZf+NeW+iCZTxggUfBrlXWPst6eAk6UiP+9jzYb7f/+cY7
         0jEGy99UQm+Y0vFZQLG2lvPk+3BXvIUufzJzMTeSmgp18wBsqe9dRjxkSNUp6VSQNB5+
         3raQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jH4c12+CVRrTyhBbIEeVtZFXG81rflTZGiVkHkiLLNo=;
        b=MbrRZ3FlE+t41E5j23lM8redQKLAQ0b8rPlU9Vel+5sj3fpVsfjLQAihdY4baRpPSq
         Sd0Bw4qgtWPSpAXIxo/QcPUbXoxHLm4t+U5r7CQ5uub3mEwFvpzP5MjrU73pTlGQSNXm
         zIc4Sfy2VZ0pnvEI2PNapW+EYWy9AaepOqmG3cLOcBlx5EB+5Qix0P40hy0O3rQFkT1s
         +rekSgCAstdivumb/JIjv89WM3ab9PKkgzcpfOoXzDTtp0tM4eJp8NNwxl1DFplGrSyx
         Y/yYJBsnyUq7Czc0DBbGl0u7BN/xXTNGI9/JOfSkOvgsqx2hjiWRkxLAEkml0ret94jH
         4DrA==
X-Gm-Message-State: AOAM530wRM34diBn7+oNyR5UsnZq8l15T8jW4X/2gRMMnSc5l0v5D8ec
	33fA3SOz5AhfBwWrdF/FEukw73gsrQfHNMZuG6pJxg==
X-Google-Smtp-Source: ABdhPJwnmP1wXXzF9NYXnVqUZJwhOa7wXTGFQNqRavcPOps9dctULuEYturAac2aYv7sw0Yyw1hdiyadaWlF3TTaF0o=
X-Received: by 2002:a05:620a:1911:b0:6a6:e8e9:70cd with SMTP id
 bj17-20020a05620a191100b006a6e8e970cdmr6644053qkb.627.1654727234308; Wed, 08
 Jun 2022 15:27:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220605133300.376161-1-mail@conchuod.ie>
In-Reply-To: <20220605133300.376161-1-mail@conchuod.ie>
From: Atul Khare <atulkhare@rivosinc.com>
Date: Wed, 8 Jun 2022 15:27:03 -0700
Message-ID: <CABMhjYq0GSEfg4T+cTqBwRdykC-rbQNEqnAZ1qM5fYbjUah5Mg@mail.gmail.com>
Subject: Re: [PATCH v1 0/6] clear riscv dtbs_check errors
To: mail@conchuod.ie
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Andrew Lunn <andrew@lunn.ch>, 
	Support Opensource <support.opensource@diasemi.com>, Lee Jones <lee.jones@linaro.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Steve Twiss <stwiss.opensource@diasemi.com>, Conor Dooley <conor.dooley@microchip.com>, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_152717_701951_5E2FDBA0 
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

Conor,

Thanks for the feedback. I will rebase and send out a v2 series
shortly (it appears that the 1024 hart context patch is redundant as
well).

On Sun, Jun 5, 2022 at 6:33 AM <mail@conchuod.ie> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Hey,
> Couple conversions from txt to yaml here with the intent of fixing the
> the dtbs_check warnings for riscv. Atul Khare already sent patches for
> the gpio-line-names & cache-sets (which went awol) and will clear the
> remaining two errors.
>
> Rob/Krzysztof:
> Have I correctly expressed the mutually exclusive properties?
> I had a look around, but wasn't able to find an obvious binding to ape.
>
> Wasn't sure if a txt -> yaml conversion's MAINTAINERS update was meant
> to be in the same patch or not, so feel free to squash.
> Thanks,
> Conor.
>
> Conor Dooley (6):
>   dt-bindings: mmc: convert mmc-spi-slot to yaml
>   dt-bindings: i2c: convert ocores binding to yaml
>   MAINTAINERS: convert ocores i2c dt-binding to yaml
>   dt-bindings: mfd: convert da9063 to yaml
>   MAINTAINERS: convert da9063 to yaml
>   riscv: dts: sifive: "fix" pmic watchdog node name
>
>  .../devicetree/bindings/i2c/i2c-ocores.txt    |  78 -----------
>  .../devicetree/bindings/i2c/i2c-ocores.yaml   | 132 ++++++++++++++++++
>  .../devicetree/bindings/mfd/da9063.txt        | 111 ---------------
>  .../devicetree/bindings/mfd/da9063.yaml       | 123 ++++++++++++++++
>  .../devicetree/bindings/mmc/mmc-spi-slot.txt  |  29 ----
>  .../devicetree/bindings/mmc/mmc-spi-slot.yaml |  76 ++++++++++
>  .../devicetree/bindings/trivial-devices.yaml  |   2 -
>  MAINTAINERS                                   |   3 +-
>  .../boot/dts/sifive/hifive-unmatched-a00.dts  |   2 +-
>  9 files changed, 334 insertions(+), 222 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-ocores.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-ocores.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/da9063.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/da9063.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mmc/mmc-spi-slot.txt
>  create mode 100644 Documentation/devicetree/bindings/mmc/mmc-spi-slot.yaml
>
> --
> 2.36.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
