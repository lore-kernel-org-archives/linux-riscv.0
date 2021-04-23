Return-Path: <SRS0=nRIc=JU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A12BC433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 19:57:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E31FD61452
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Apr 2021 19:57:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E31FD61452
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=EItcdRd1ya7qIA9h77hStgim2lQw0cpjhdiFdoLHw24=; b=eOmNQ7puwuQepnnlveQ8TKQZy
	VOYRPY6TF6iUb/GmyjVw5Qdh4FnZZK6Hiv7b5xpLYLZ/CEVK6EMUWmyaJjMtQzNQVeqk4mYk9aR0G
	gtYgPqFw3eWZRswKbIZunIL4/l5tXRWGj8hO1KxwT2j8yoe8I40CHHn2v3CYSNSnLMASYpg359Ffx
	9KwVuDVALimFdPeUK0arK9rzxcMGr1y9i6U+EhJmjc4wIBDBZD0ba9Yb4yWgC6qxH1bmUvYCjRZw/
	2/gVCzzOjfBVOPs1LtJc+dQs+Qw+6TBKwv/IhZZZUTWoy8AREatvpRxCX7lt46X/z0tKQmmZdwPzq
	sPNe1uZdw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1la1vE-002Fhn-OO; Fri, 23 Apr 2021 19:57:04 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la1vB-002FhS-Aa
 for linux-riscv@desiato.infradead.org; Fri, 23 Apr 2021 19:57:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=8GuX4Z8MuruzrMbLkQS7cSCk79x3cd4uTb8g9nIPerA=; b=Y5ORRbOgnu9ix8+FnDqQFsmvNT
 1Iv54b7vQnowhxbxcrRBtK8Am5Yp+E5PmeRe6Ik2+fY5itJLI4OFyDuiNMAWZ368OdsojGZdiVWi+
 B9rzMvXSM3n03pEwGIB0r3qElMXuebjYItEvAgIDWdvPdBetiZu52vou0m8C7CGV42+4ft4XUNLzO
 eIuSZbTA1nJY9OxE19RUFFhqT28QOsPDsSxfL0ADLeVmcCnioA0zfaOY/m3qNvl8gQUq96EBac3vA
 QemKgJBsmWVDofV1YzLxrHp/NzT2oD9A1h5mj9gnVqxbNwHo9nOct9uPBvJa0X5ntBigfi8UShV1z
 JpUg0KpQ==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1la1v7-00Effn-EX
 for linux-riscv@lists.infradead.org; Fri, 23 Apr 2021 19:57:00 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 j14-20020a17090a694eb0290152d92c205dso1797375pjm.0
 for <linux-riscv@lists.infradead.org>; Fri, 23 Apr 2021 12:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=8GuX4Z8MuruzrMbLkQS7cSCk79x3cd4uTb8g9nIPerA=;
 b=UiO7OJ1czPbBTAt5TyRCbjKQxq+hZWnKkpXQBgfRnVAi8ezgCOESWbeizdW+o4+nVD
 52YCBowJTUq4+paEVRsGjt0vVadKxLQaoMDAhhgBeYzMGVrE9bNgXDc9FrDY8tGMbqxZ
 rzBnpBKfiQYPtJ6WxyAAt3JjWyPoXJeFrweZbdyY0cJEkgDT/xxL42c+KnPnDAg4QSiL
 oNznvqQZnfk5gNqdxkHYkB9EEQ2rrhMVtyRHcdvvkT44f4y5kWzBeY2vLiu3Sbc175iz
 z37Hx1OdNAFxenDrHTdeDkzTxdO/mO9awtN75lG344GUq64D1cjkx1ln6hzCi/drsOB/
 ilCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=8GuX4Z8MuruzrMbLkQS7cSCk79x3cd4uTb8g9nIPerA=;
 b=D1vQqbugiRI0axCxJhXApZ4wxsK4Zyujb2ZDuilEGvlpYiRstbgpjrq6mV1hGwnk8s
 BL2MY2sGK6eMMlQTCElzKxf3EE8g3l2zb60jiBEn+5rHuQXs2V9An4tc24Dt50OiSqUu
 9fFU+6oiG691K66Sb7h6n5fnAV7TPzJGT/2Ncrgarm0flmSeKru8eQG29hYgUyTI2ooK
 EGKcbFQbW9L/zPY0cEmHFQKxgLe9hP0i/MS2uSvV1lTgBXbXTROiq87ta1oWbJXdgTvP
 SfEDjLhR9fZ7Bnl72gGxQHBHKmLAHUuPSpKBj6/d7MTGDdugSEwEIkAzide+YCz9mopp
 +cKw==
X-Gm-Message-State: AOAM533y+utV/l8YdouZSXdy8d6cfEi69DLxqMQW4CIsSgQeLmvRXdMk
 gs0qUqSuLS3n6E/IY9JcjKr8VA==
X-Google-Smtp-Source: ABdhPJwqqZ+pGlpvK53FAjVOPAtbs5sEYP2BTvKy/DTSdODRRdWQvHqgVcSmp/iAv5K7AbjtWolOog==
X-Received: by 2002:a17:902:eb53:b029:ec:ce7d:62c8 with SMTP id
 i19-20020a170902eb53b02900ecce7d62c8mr5328640pli.8.1619207816250; 
 Fri, 23 Apr 2021 12:56:56 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id x22sm5875395pgx.19.2021.04.23.12.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 12:56:55 -0700 (PDT)
Date: Fri, 23 Apr 2021 12:56:55 -0700 (PDT)
X-Google-Original-Date: Fri, 23 Apr 2021 12:56:54 PDT (-0700)
Subject: Re: [PATCH v4 0/5] Add Microchip PolarFire Soc Support
In-Reply-To: <CAOnJCUL5tLzk73GJNVXMmJmBKo_kVcAQ7OYwpi9bjKgTbabhyg@mail.gmail.com>
CC: Conor.Dooley@microchip.com, Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <Anup.Patel@wdc.com>, Atish Patra <Atish.Patra@wdc.com>,
 Daire.McNamara@microchip.com, 
 Ivan.Griffin@microchip.com, Lewis.Hanly@microchip.com, aou@eecs.berkeley.edu,
 bjorn@kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, robh+dt@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: atishp@atishpatra.org
Message-ID: <mhng-ded61de3-071d-4c2d-a0db-122765968c90@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_125657_569806_D97860A8 
X-CRM114-Status: GOOD (  48.18  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 23 Apr 2021 05:31:22 PDT (-0700), atishp@atishpatra.org wrote:
> On Fri, Apr 23, 2021 at 1:44 AM <Conor.Dooley@microchip.com> wrote:
>
>> On 23/04/2021 02:37, Palmer Dabbelt wrote:
>> > EXTERNAL EMAIL: Do not click links or open attachments unless you know
>> > the content is safe
>> >
>> > On Thu, 22 Apr 2021 15:33:39 PDT (-0700), atishp@atishpatra.org wrote:
>> >> On Sat, Apr 17, 2021 at 8:26 PM Atish Patra <atishp@atishpatra.org>
>> >> wrote:
>> >>>
>> >>> On Mon, Mar 29, 2021 at 9:17 PM Palmer Dabbelt <palmer@dabbelt.com>
>> >>> wrote:
>> >>> >
>> >>> > On Wed, 03 Mar 2021 12:02:48 PST (-0800), Atish Patra wrote:
>> >>> > > This series adds minimal support for Microchip Polar Fire Soc
>> >>> Icicle kit.
>> >>> > > It is rebased on v5.12-rc1 and depends on clock support.
>> >>> > > Only MMC and ethernet drivers are enabled via this series.
>> >>> > > The idea here is to add the foundational patches so that other
>> >>> drivers
>> >>> > > can be added to on top of this. The device tree may change based on
>> >>> > > feedback on bindings of individual driver support patches.
>> >>> > >
>> >>> > > This series has been tested on Qemu and Polar Fire Soc Icicle kit.
>> >>> > > It depends on the updated clock-series[2] and macb fix[3].
>> >>> > > The series is also tested by Lewis from Microchip.
>> >>> > >
>> >>> > > The series can also be found at.
>> >>> > >
>> >>> https://github.com/atishp04/linux/tree/polarfire_support_upstream_v4
>> >>> > >
>> >>> > > [1]
>> >>> https://lists.nongnu.org/archive/html/qemu-devel/2020-10/msg08582.html
>> >>> > > [2] https://www.spinics.net/lists/linux-clk/msg54579.html
>> >>> > >
>> >>> > > Changes from v3->v4:
>> >>> > > 1. Fixed few DT specific issues.
>> >>> > > 2. Rebased on top of new clock driver.
>> >>> > > 3. SD card functionality is verified.
>> >>> > >
>> >>> > > Changes from v2->v3:
>> >>> > > 1. Fixed a typo in dt binding.
>> >>> > > 2. Included MAINTAINERS entry for PolarFire SoC.
>> >>> > > 3. Improved the dts file by using lowercase clock names and
>> >>> keeping phy
>> >>> > >    details in board specific dts file.
>> >>> > >
>> >>> > > Changes from v1->v2:
>> >>> > > 1. Modified the DT to match the device tree in U-Boot.
>> >>> > > 2. Added both eMMC & SDcard entries in DT. However, SD card is
>> >>> only enabled
>> >>> > >    as it allows larger storage option for linux distros.
>> >>> > >
>> >>> > > Atish Patra (4):
>> >>> > > RISC-V: Add Microchip PolarFire SoC kconfig option
>> >>> > > dt-bindings: riscv: microchip: Add YAML documentation for the
>> >>> > > PolarFire SoC
>> >>> > > RISC-V: Initial DTS for Microchip ICICLE board
>> >>> > > RISC-V: Enable Microchip PolarFire ICICLE SoC
>> >>> > >
>> >>> > > Conor Dooley (1):
>> >>> > > MAINTAINERS: add microchip polarfire soc support
>> >>> > >
>> >>> > > .../devicetree/bindings/riscv/microchip.yaml  |  27 ++
>> >>> > > MAINTAINERS                                   |   8 +
>> >>> > > arch/riscv/Kconfig.socs                       |   7 +
>> >>> > > arch/riscv/boot/dts/Makefile                  |   1 +
>> >>> > > arch/riscv/boot/dts/microchip/Makefile        |   2 +
>> >>> > > .../microchip/microchip-mpfs-icicle-kit.dts   |  72 ++++
>> >>> > > .../boot/dts/microchip/microchip-mpfs.dtsi    | 329
>> >>> ++++++++++++++++++
>> >>> > > arch/riscv/configs/defconfig                  |   4 +
>> >>> > > 8 files changed, 450 insertions(+)
>> >>> > > create mode 100644
>> >>> Documentation/devicetree/bindings/riscv/microchip.yaml
>> >>> > > create mode 100644 arch/riscv/boot/dts/microchip/Makefile
>> >>> > > create mode 100644
>> >>> arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
>> >>> > > create mode 100644
>> >>> arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
>> >>> >
>> >>> > I had this left in my inbox waiting for either some reviews to
>> >>> come in or a v2,
>> >>> > but I don't see any.  Did I miss something?
>> >>> >
>> >>> Sorry for the late reply. I am on vacation until May. I think I saw
>> >>> all the patches have already been reviewed.
>> >>> Let me know if it is not the case.
>> >>>
>> >> I cross checked and all the patches are reviewed-by.
>> >> @palmer: Is it possible to take this series for 5.13 MW ?
>> >
>> > I still don't see any reviews for the mailbox driver, did it just get
>> > lost on the way to me?
>>
>> the mailbox driver has reviewed-by tags on two of the five patches (rob
>> on the dt-binding entries).
>> v6 was set on the 23rd but hasn't got any attention on the other three
>> patches yet
>> however that's not in this patch set, only depends on it
>>
>
> Thanks Conor.
>
> @palmer: This series adds the basic soc support
> for polarfire SoC. With clock driver, we can now boot.
>
> Mailbox driver series provides additional features.  Were you looking for
> reviewed-by tags for the clock driver ?

Ah, sorry.  I get this one mixed up with "Add support for the PolarFire 
SoC system controller", which I also had in my inbox because I wanted to 
make sure it didn't get dropped.  I guess I just didn't read the whole 
title and dropped this v4 because I thought the v6 was a newer version 
of the same patch set.

This is now on for-next.

Thanks!

>
>
>
>> >
>> >>
>> >>> > _______________________________________________
>> >>> > linux-riscv mailing list
>> >>> > linux-riscv@lists.infradead.org
>> >>> > http://lists.infradead.org/mailman/listinfo/linux-riscv
>> >>>
>> >>>
>> >>>
>> >>> --
>> >>> Regards,
>> >>> Atish
>>
>>
>> --
> Regards,
> Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
