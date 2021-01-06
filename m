Return-Path: <SRS0=kC5X=GJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E0AC433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jan 2021 19:26:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BD2C2311B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jan 2021 19:26:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BD2C2311B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atishpatra.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9km6yPtKWQZXvZZpgprqESaCINGEsVFkQalNrZ3W+jU=; b=l8dIvs8RQhFsUrCalKtq8rn4z
	3HnZumgZ9kSVp1mJdSg1ruTF+SX+iS8FCwU2NnGWc5tQuGtkLXXmPLMQdTd5JX4eKi+z6aQ2Edq2c
	rO0hHsw2s9/Pah/ghgE1rxRVR0DP9/VNDLz3yBffJqql2/Yf8jfuODBwhfFD8nHCIGzeLDxdmrfxX
	GqX6u8tBQzz4ZKz1xZHYuJS7CN8lJYLKuHBGtcja10EtHGFfaQ+aSPuXHZzAa5lQF7Lz1YQJaRqWy
	S5y8VF8W5T5Arp5lT4x+awI6AF2QjeeEqGYtG5IyyjpJ3+wpcMsqQ/F3sI6+ZIzXZ0G7fPGYCPIHV
	MA3ECf+7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxERX-0007dr-Eb; Wed, 06 Jan 2021 19:26:03 +0000
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxERT-0007cX-W1
 for linux-riscv@lists.infradead.org; Wed, 06 Jan 2021 19:26:01 +0000
Received: by mail-il1-x12a.google.com with SMTP id x15so4332128ilq.1
 for <linux-riscv@lists.infradead.org>; Wed, 06 Jan 2021 11:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xaFKfRohtaPoE3enOI+u2FSK7SL+8x1EsgceIYGP8uY=;
 b=CTKvplSxhfDDVOfavQZaAMG4qBbj2/8mhcrz4FSmQxCA735HPG7QpgAqjyG1eoJyZW
 tmEP3wSLXCuQHe2GXLuRJR7/Pd6onZfoqIAJlydBBv3DBMjwiEeD05Wd93HZl7FSqtfQ
 Lcj0fzWdehg1I07F9jaHheCSADzToVQgCo96A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xaFKfRohtaPoE3enOI+u2FSK7SL+8x1EsgceIYGP8uY=;
 b=iEIA+gktZHls2kY9BYr/AERdXco0u30NlwhW+Uxm7mVdfxHQcN2tvp+jJOmFqSXWyN
 Pr43fGPMCG4HOcOpCQgZMS0RafmjXBE77FOjwhP+swxDSFlxwbzudovPJBSUdw7pFOPq
 DuSNRp8/9yEhtRM3UgvGy/9nbcudvlQQxwKQh3fDAu0dChG/HxJZupQwcc9fzpQdTJdz
 4fv4s02xXB3Vyy6DZwRloucl0XaHcvFGzO6kBXZEcJ6aBIlXxd6h6Logid676quJleQ0
 MUAx4ThSWvVK2aHYYMuz0lcBcI2OApCycIDL6kU0NtUk3SUMJgZl+3Xk1U07bXzzMzvC
 b1dA==
X-Gm-Message-State: AOAM53114cvAf4idCGy47IzjkpiWFz775y2vImk2l8BcEXqqoYmqBTU1
 RLK0I1Eqh3coJUcaxC4sn7QTwGi7yBLmE/xGMbPIV57++3FL
X-Google-Smtp-Source: ABdhPJy51fbUUwakj9NV8ZScGrO56Pbqi49pgPApun+/P9bZPiya9P3FPQipMyC56ASSnauXW2I93TA7Q3Yw/ZURi5E=
X-Received: by 2002:a92:c5a7:: with SMTP id r7mr5454936ilt.219.1609961156880; 
 Wed, 06 Jan 2021 11:25:56 -0800 (PST)
MIME-Version: 1.0
References: <20201223163247.28923-1-conor.dooley@microchip.com>
In-Reply-To: <20201223163247.28923-1-conor.dooley@microchip.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Wed, 6 Jan 2021 11:25:46 -0800
Message-ID: <CAOnJCUKw=UBt27XQoVxU=BXtEU0Nf6D2AnmsuyNVJGvJpVUMGw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] Add support for the PolarFire SoC system controller
To: conor.dooley@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_142600_446225_E6BA4AAD 
X-CRM114-Status: GOOD (  21.31  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree <devicetree@vger.kernel.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 cyril.jean@microchip.com, David Abdurachmanov <david.abdurachmanov@gmail.com>,
 Daire McNamara <daire.mcnamara@microchip.com>, jassisinghbrar@gmail.com,
 j.neuschaefer@gmx.net, Atish Patra <atish.patra@wdc.com>,
 Anup Patel <anup.patel@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 lewis.hanly@microchip.com, linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Dec 23, 2020 at 8:33 AM <conor.dooley@microchip.com> wrote:
>
> From: Conor Dooley <conor.dooley@microchip.com>
>
> This patch series adds support for the system controller on
> the PolarFire SoC, using the mailbox framework. A Microchip directory
> in the SoC subsystem has been created to hold the mailbox client
> driver and will be used for future service drivers.
>
> This directory is included by the kconfig option:
> CONFIG_SOC_MICROCHIP_POLARFIRE, so this patch series depends on Atish
> Patra's PolarFire SoC support patches which introduce that option.
>

What version of clock driver are you using? I am waiting for an
updated clock patch to post the next
version of the basic soc support series.

> It further depends on the MAINTAINERS entry created in the same series.
>
> Changes from v2:
> * Further reworked dt bindings to satisfy errors and feedback
>   (hopefully phandle array is the correct type for the mboxes)
> * Full maintainers entry moved to Atish's PFSoC support series, this series now only adds mailbox driver
> * Converted config options from MPFS to POLARFIRE_SOC so they are more recognisable
> * Further simplified driver code from feedback
>
> Changes from v1:
> * Squashed header into first patch
> * Fixed DT binding warnings & small fixes
> * Cleaned up drivers from feedback
>
> Conor Dooley (5):
>   mbox: add polarfire soc system controller mailbox
>   dt-bindings: add bindings for polarfire soc mailbox
>   soc: add polarfire soc system controller
>   dt-bindings: add bindings for polarfire soc system controller
>   MAINTAINERS: add maintainers for polarfire soc mailbox driver
>
>  .../mailbox/microchip,mailbox-mpfs.yaml       |  47 +++
>  .../microchip,mpfs_sys_controller.yaml        |  34 +++
>  MAINTAINERS                                   |   1 +
>  drivers/mailbox/Kconfig                       |  12 +
>  drivers/mailbox/Makefile                      |   2 +
>  drivers/mailbox/mailbox-mpfs.c                | 285 ++++++++++++++++++
>  drivers/soc/Kconfig                           |   1 +
>  drivers/soc/Makefile                          |   1 +
>  drivers/soc/microchip/Kconfig                 |  10 +
>  drivers/soc/microchip/Makefile                |   1 +
>  drivers/soc/microchip/mpfs-sys-controller.c   | 127 ++++++++
>  include/soc/microchip/mpfs.h                  |  51 ++++
>  12 files changed, 572 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,mailbox-mpfs.yaml
>  create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs_sys_controller.yaml
>  create mode 100644 drivers/mailbox/mailbox-mpfs.c
>  create mode 100644 drivers/soc/microchip/Kconfig
>  create mode 100644 drivers/soc/microchip/Makefile
>  create mode 100644 drivers/soc/microchip/mpfs-sys-controller.c
>  create mode 100644 include/soc/microchip/mpfs.h
>
> --
> 2.17.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
