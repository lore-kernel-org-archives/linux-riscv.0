Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF41C64ED8
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 14:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yBALkxY4bBuY2wRVgM2ONPiOOzOJCpHS2ciKaW8o7d4=; b=Gsc+UfGiYFSwJN
	R4Ar8PV1uOuy96wCFjtUGyYp3SZdvAyPU87CdvQx1G5ddC+VSzD7xFpoZgQY8tdqJnmx36w8DmslG
	iaN8t0xojd5Qjt5FCJQa5tOSx2y5tnpWrfTqk48Ctre/5HP5ZuX2+vnHKPHvsK8QCV7QsMVUo5IRa
	tUg9grnV3Ss4ijyPAINE7Ww2yIU+JnZlZhJXiOoAnzumMbOzCu5pGq6y1vjVYneSqbF3cv0mFBHp0
	LEDkF9+3MGUEwYsOyrfQ4YxgpPGd15pCemAsI+PRiba2zScQxUYOwqO5LzJApR4+H7CPFMQqybigT
	mphDKJ3j8/Y7c4N8LlUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWesx-00A5Ds-O7; Mon, 27 Feb 2023 14:53:51 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWesu-00A5BN-T0
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 14:53:50 +0000
Received: by mail-pj1-x1036.google.com with SMTP id cp7-20020a17090afb8700b0023756229427so10383416pjb.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Feb 2023 06:53:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l5VT3ghgOZyVF+1GKbNcLlSESdSRebrFv96yTN2Vgpo=;
        b=Gq9LOqIDm1nkIlqoP1xyZ+r1d2RvDdRtUzQhuQgfroW5tY/m3hOqXxShZVsKKZLPsU
         /LABK70GXsyzF7YIUCNsgsAgnhpjHLdlwGTQFRoBFUQa4+cPKoqfMQmOnbkakyyc7NVP
         SdchPzpYyukrQeT5euY8wqJZf4aTHsh4ud4UscR0jPqQtT/oGlQVsLBbSityTaeZiZRP
         gaOjUL8Ih6fKPTfCQ7t6Zoka8/OMmXy5e1qQoxM8v2EpddQoiVrzWKyqZUo582dapBE4
         EeUifUFmTWFu7+S+FBFt1EOnCo6INjP35xPjDxDQCR84mKzvdtqthNzXZW/C1hn1zZ03
         sB9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l5VT3ghgOZyVF+1GKbNcLlSESdSRebrFv96yTN2Vgpo=;
        b=nx9u2e85asz9y79y1Eke4Jvc7ShV1AmRPklSjOZz1esK7nhterbx6DTejkhaDL0uZ8
         3ycKl8R5FZ9MZFLek9z63jQLnSseld06z6LKxHHGYHH4LFcmlvj3pzSnPON/UZx6VKSM
         WhDjA9E1Sd8MijdkbGookKnGP9K+8qnKpiO6sSnI9HRJhqSChOwjgvyTR83GEm33NPa5
         L0CCIPw/20OTv4iitYuA62YVuZE5nX/1D60c6AB2W5OD+8v8DUjMHRKCeIFJhbS0Vptw
         5ZqVDjmvmUHcVpgjM0w6ogmhaCNzR011dw/y8QQAzOnu74IKCF2ROY31xaL+qCEd+jtm
         hKZw==
X-Gm-Message-State: AO0yUKW1k8prTG9boUfEDRm+FbSCUNhYPs0FM+ZL/d5bmjEbob0gkGpS
	X1Yz2kdw/EXxqccpsMYZwpnjbKwXX5C1E4wmOfLb4Lf5Zq3MbA==
X-Google-Smtp-Source: AK7set+HTQu+x6c+i9QU4xI8526XGkvjGx9J6AmsgWbznB6SWWwRXE1fCT+1oSICb0P/XsJ0ryjzSBBrZzu1uNj4Yhc=
X-Received: by 2002:a17:903:40c2:b0:19a:b502:4280 with SMTP id
 t2-20020a17090340c200b0019ab5024280mr4788629pld.3.1677509624962; Mon, 27 Feb
 2023 06:53:44 -0800 (PST)
MIME-Version: 1.0
References: <20230215113249.47727-1-william.qiu@starfivetech.com>
 <CAPDyKFqJxrLh+pgQ-u_Lwxv4_TsH--rga049GBTqKAa_M14_yw@mail.gmail.com> <ca9bed19-9809-9443-7ca1-1d11984ded55@starfivetech.com>
In-Reply-To: <ca9bed19-9809-9443-7ca1-1d11984ded55@starfivetech.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 27 Feb 2023 15:53:08 +0100
Message-ID: <CAPDyKFpwFq26Tqa-5k7SbQ7Zgk3-AQSrjo7ZSJt6uo6QJR3+5Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] StarFive's SDIO/eMMC driver support
To: William Qiu <william.qiu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-mmc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jaehoon Chung <jh80.chung@samsung.com>, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_065348_961037_10A2409D 
X-CRM114-Status: GOOD (  31.54  )
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

On Mon, 27 Feb 2023 at 08:47, William Qiu <william.qiu@starfivetech.com> wrote:
>
>
>
> On 2023/2/15 20:37, Ulf Hansson wrote:
> > On Wed, 15 Feb 2023 at 12:32, William Qiu <william.qiu@starfivetech.com> wrote:
> >>
> >> Hi,
> >>
> >> This patchset adds initial rudimentary support for the StarFive
> >> designware mobile storage host controller driver. And this driver will
> >> be used in StarFive's VisionFive 2 board. The main purpose of adding
> >> this driver is to accommodate the ultra-high speed mode of eMMC.
> >>
> >> The last patch should be applied after the patchset [1]:
> >> [1] https://lore.kernel.org/all/20221220011247.35560-1-hal.feng@starfivetech.com/
> >>
> >> Changes v3->v4:
> >> - Added documentation to describe StarFive System Controller Registers.
> >> - Added aon_syscon and stg_syscon node.
> >> - Fixed some checkpatch errors/warnings.
> >>
> >> Changes v2->v3:
> >> - Wraped commit message according to Linux coding style.
> >> - Rephrased the description of the patches.
> >> - Changed the description of syscon regsiter.
> >> - Dropped redundant properties.
> >>
> >> Changes v1->v2:
> >> - Renamed the dt-binding 'starfive,jh7110-sdio.yaml' to 'starfive,jh7110-mmc.yaml'.
> >> - Changed the type of 'starfive,syscon' and modify its description.
> >> - Deleted unused head files like '#include <linux/gpio.h>'.
> >> - Added comment for the 'rise_point' and 'fall_point'.
> >> - Changed the API 'num_caps' to 'common_caps'.
> >> - Changed the node name 'sys_syscon' to 'syscon'.
> >> - Changed the node name 'sdio' to 'mmc'.
> >>
> >> The patch series is based on v6.1.
> >>
> >> William Qiu (4):
> >>   dt-bindings: mmc: Add StarFive MMC module
> >>   mmc: starfive: Add sdio/emmc driver support
> >>   riscv: dts: starfive: Add mmc node
> >>   dt-bindings: syscon: Add StarFive syscon doc
> >>
> >>  .../bindings/mmc/starfive,jh7110-mmc.yaml     |  77 ++++++++
> >>  .../bindings/soc/starfive/jh7110-syscon.yaml  |  51 +++++
> >>  MAINTAINERS                                   |  11 ++
> >>  .../jh7110-starfive-visionfive-2.dtsi         |  23 +++
> >>  arch/riscv/boot/dts/starfive/jh7110.dtsi      |  47 +++++
> >>  drivers/mmc/host/Kconfig                      |  10 +
> >>  drivers/mmc/host/Makefile                     |   1 +
> >>  drivers/mmc/host/dw_mmc-starfive.c            | 186 ++++++++++++++++++
> >>  8 files changed, 406 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/mmc/starfive,jh7110-mmc.yaml
> >>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/jh7110-syscon.yaml
> >>  create mode 100644 drivers/mmc/host/dw_mmc-starfive.c
> >>
> >
> > I have dropped the v3 patches and applied patch1 and patch2 from the
> > v4 series instead, for my next branch, thanks!
> >
> > Kind regards
> > Uffe
>
> Hi Uffe,
>
> Sorry to bother you.But I found a bug that in drivers/mmc/host/dw_mmc-starfive.c:
>
>     47 static int dw_mci_starfive_execute_tuning(struct dw_mci_slot *slot,
>     48                                              u32 opcode)
>     49 {
>     50         static const int grade  = MAX_DELAY_CHAIN;
>     51         struct dw_mci *host = slot->host;
>     52         struct starfive_priv *priv = host->priv;
>     53         int rise_point = -1, fall_point = -1;
>     54         int err, prev_err;
>     55         int i;
>     56         bool found = 0;
>     57         u32 regval;
>     58
>     59         /*
>     60          * Use grade as the max delay chain, and use the rise_point and
>     61          * fall_point to ensure the best sampling point of a data input
>     62          * signals.
>     63          */
>     64         for (i = 0; i < grade; i++) {
>     65                 regval = i << priv->syscon_shift;
>     66                 err = regmap_update_bits(priv->reg_syscon, priv->syscon_offset,
>     67                                                 priv->syscon_mask, regval);
>     68                 if (err)
>     69                         return err;
>     70                 mci_writel(host, RINTSTS, ALL_INT_CLR);
>     71
>     72                 err = mmc_send_tuning(slot->mmc, opcode, NULL);
>     73                 if (!err)
>     74                         found = 1;
>     75
>     76                 if (i > 0) {
> --> 77                         if (err && !prev_err)
>
> prev_err was never initialized to zero.
>
> So I'm here to ask for your suggestion, should I send a new version
> to fix it or send you a patch with a fixes tag?

Please send a new incremental patch on top. I will queue it up as a
fix for v6.3-rc[n].

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
