Return-Path: <SRS0=G1RR=OE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6899C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 10:07:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2DD1610CE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Sep 2021 10:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A2DD1610CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09fmxaWFSXh0AIgwJNj/NyKgVs1kCioxgAz2C8ge2GQ=; b=jKKkN5R6YhJH8k
	bwUCMv/c7YXRCgZ8lYbeQy0ThZzIakDbPHdsmLNpy1aHCNrQ4zWVnT5q4al93wCGs1TxqOrl0fa7r
	n0Isfc2W9sCI/V3oCCHhtXH5rCoYFyb9n6HHEcIRPKJeuQgu4tt7WOBQRfxfe+cYwLI8bzsxm+o5i
	IqoI2BND+B1h5i+TkEi4JqlWDllYQu6LO6X1vFfNApd481xDAkd9oSLlsD1g+OBPucMmDZVNIfPJT
	HD/XrsjP48ov2DmeOmo2HjjaJCoyoT7IU1UfQ6oKwuUusKez8q85ZWt4eusgTAkyOODQTM0mg7Fiq
	M/gK5tT9z0++99PqHH3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ5LY-00595c-Pe; Tue, 14 Sep 2021 10:07:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ5LV-00593Q-Qt
 for linux-riscv@lists.infradead.org; Tue, 14 Sep 2021 10:07:23 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E17DD610E6
 for <linux-riscv@lists.infradead.org>; Tue, 14 Sep 2021 10:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631614040;
 bh=Ik/HLIOub9MljzeBlj9WzGBM1qaqzGDYRzAzALcEBf8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cdo3UrE/48CyVDfN7cgif7IKMEj3MYiPw2mwrU2uTw3QsvSiPX4JUy3KI4ro6VMI6
 FP0f43h4IeLqq+oG+42HfIWr8MGaN2OT2L/xPXzzGBEP6skihbkk7rK56MWnViWa34
 ZuZU6lR278kPffPRYP2fTX1rXHHvWn+fNecwPLpE5fiy1KAmngCtv0gYnyLqdobwP6
 ag1O12ERTuo7RE0Ip6xT/tTtWgLdV5eP6V8BDerbL85cIVAueiAsEj1KqOz/Vc12KE
 4X6dAOq2Y4YsabapkePyOaeRsu9bhZUN1t9u1FJ356I9xD1dPkofwpdmtEUeb1XQCM
 KYGcq8T0+ropQ==
Received: by mail-pf1-f177.google.com with SMTP id n30so8996656pfq.5
 for <linux-riscv@lists.infradead.org>; Tue, 14 Sep 2021 03:07:20 -0700 (PDT)
X-Gm-Message-State: AOAM530Ex7zgmtUJdTIU2nXqksIt2cVLDCmzP1s8Tw5T4n3JE7bxMKJd
 nrAIbNYiZMjwHD3JBpdC3uK/pB4g1gRLdegNlnA=
X-Google-Smtp-Source: ABdhPJx8wLgrCETgV5FCCkV03G8EWefJb0qDhmI+vFfJR48Z0saK2K+Y6DLCjdrZx7DsPvGh1O/UCwj/Efyf01dSQBM=
X-Received: by 2002:a62:ce0d:0:b0:438:71f1:4442 with SMTP id
 y13-20020a62ce0d000000b0043871f14442mr3980539pfg.21.1631614040608; Tue, 14
 Sep 2021 03:07:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210911092139.79607-1-guoren@kernel.org>
 <20210911092139.79607-7-guoren@kernel.org>
 <20210913084520.kkbsupogkzv226x3@gilmour>
 <CAJF2gTT_8VLTt0B=LxXAPWVpHaBaVxy+V0rGCjr7JZyRiO7LfQ@mail.gmail.com>
 <d2ac3da8-f4d5-52c1-da7f-f8260a0bb604@infradead.org>
 <CAJF2gTTVj2J6_rCXAG81PB3vJZO2TTwpD03vAE2q+K=9zh_TzQ@mail.gmail.com>
 <CAK8P3a1TY+XT1vF=wAh0XA5BXU5Z6Ab1d4DekXbVsN9aj3aL5w@mail.gmail.com>
In-Reply-To: <CAK8P3a1TY+XT1vF=wAh0XA5BXU5Z6Ab1d4DekXbVsN9aj3aL5w@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Tue, 14 Sep 2021 12:07:08 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdH0C0CJe_oxZ2rG1UeE5G9w2mh2Thh8LynpNHQk2g1qA@mail.gmail.com>
Message-ID: <CAJKOXPdH0C0CJe_oxZ2rG1UeE5G9w2mh2Thh8LynpNHQk2g1qA@mail.gmail.com>
Subject: Re: [RFC PATCH V4 6/6] riscv: soc: Add Allwinner SoC kconfig option
To: Arnd Bergmann <arnd@arndb.de>
Cc: Guo Ren <guoren@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
 Maxime Ripard <maxime@cerno.tech>, Anup Patel <anup.patel@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>, 
 =?UTF-8?Q?Christoph_M=C3=BCllner?= <christoph.muellner@vrull.eu>, 
 philipp.tomsich@vrull.eu, Christoph Hellwig <hch@lst.de>,
 liush <liush@allwinnertech.com>, 
 wefu@redhat.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 taiten.peng@canonical.com, 
 aniket.ponkshe@canonical.com, heinrich.schuchardt@canonical.com, 
 gordan.markus@canonical.com, Guo Ren <guoren@linux.alibaba.com>, 
 Chen-Yu Tsai <wens@csie.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_030721_946773_FD748E91 
X-CRM114-Status: GOOD (  13.89  )
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

On Tue, 14 Sept 2021 at 11:31, Arnd Bergmann <arnd@arndb.de> wrote:
> Some subsystem maintainers want drivers to be selected by the SoC
> option, this is why you need the 'select SIFIVE_PLIC', but usually
> the drivers are selectable with a 'depends on ARCH_SUNXI ||
> COMPILE_TEST' and enabled in the defconfig.

I would say selecting drivers is even more useful for distros and
other downstream users. Especially in the ARM world where we have so
many different SoCs - how could a distro person know which driver is
necessary, important or useful? Having all main SoC drivers enabled
when ARCH_SUNXI=y, helps distro a lot.

> If you want to get fancy, you can use something like:
>
> config RESET_SUNXI
>         bool "Allwinner SoCs Reset Driver" if COMPILE_TEST && !ARCH_SUNXI
>         default ARCH_SUNXI
>
> This will make an option that
>  - always enabled when the platform is built-in
>  - user selectable when compile-testing for any other platform
>  - always disabled otherwise

+1 for this pattern.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
