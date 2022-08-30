Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48A60ECAAD1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 04:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BFu0YHJUXniOHJlul31yhXpYqImt1dRlCDRZQkrob64=; b=QLtYrz2+yE/CCB
	1ePYI3KOCrDHh4MyUiq82xi0FS8Qzp09hJp5xGiV7i4DsWoh0pDFICEldP27g51+FuLF0E/rc9HbV
	yfpwG/PGepzeiRpGWRjqfgUwiK+FhFkMZi+lFMOYNMOvtThSypf8Y6k9nXMFy0HysbUaVVEF5cUuI
	pLPgtA40wIqwSu4SSnUCOoyN1TcoiTrpDIzKgJ8VQGgfnMXHfMYyGYE9Vc6kpctrMz9WeIqBKi6CI
	qFIMbaiojqRHtTnBDYicDbqSL7H6NYgsFZAQdAh4hOC6giWu53KFa6oauydkzbCQmRFY0IhqvbZoC
	9hE/tjGTqVPs3RMVvOjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSt60-00E23m-Pp; Tue, 30 Aug 2022 04:43:28 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSt5x-00E22m-9h
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 04:43:26 +0000
Received: by mail-lf1-x131.google.com with SMTP id z25so13933939lfr.2
        for <linux-riscv@lists.infradead.org>; Mon, 29 Aug 2022 21:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=8xaCXOqGfO+vQafsuCd8VhQH7il5VLrKJWKilF4St6M=;
        b=GwXz5yPPgm9q+uJRWBAXBMfz9q2Z3LD2knKm+awIpyhrT0PxqlLIdd0R77flcUOhW2
         3CEnf4yaakjY3/a5y1FLPd7WBpEBSFOAJKKJdMsrWZVfSrM6T+GK6NBssk2f53jtws+w
         rtPF+gNYi+HMcNJNzZEW3iUkGldnNdN+JpBoQU6KUWbouwnOfqm83q+aGMj321lNitE8
         vkgqxIP8LQZihOG0buJT+jiR7cfescw9PBAu+LiREdc92V1EcblaJRUAgovQY3cF/IIS
         tVfvxQessHLqHZl2+HXkm5k3Suf4IbcVctAL7p7YZFOAL7QyJJD3RF2A55s0xJxOt3Ac
         UbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=8xaCXOqGfO+vQafsuCd8VhQH7il5VLrKJWKilF4St6M=;
        b=6Obes8TZw3g/wzFfxiBBFd/xmRNbf/rb5tbf9ioTcXe2rAkYqdSP8jb/nhB9D8BU3V
         n7KPB21vfUXpVmUDueLFE2VWZJk2gSuS8H3RU4R3VX37joF6xqa3AsJVTZFk8befElSC
         4EQAok5zqu90Emo4Oqt0/Kyz7BmqiCsZhEraQn4udowMST55+pARr77DHhjjHK7YCOE5
         CKf///rvwf0xME8g6e7Xjd4I0NEAvMuw6r8mUYVKz/yeWHTBVy1bmprE3hxoR5ob6e77
         37v3WHgUo7S/wAxogwFlrMoF35kKaezjVtdGtvOxFfLRqCvYB05aJK5hynVw6aRhMGcz
         3pdQ==
X-Gm-Message-State: ACgBeo2dNAox/53LHOV9pxykxEPbTb3YLo9ivtTa2oP0xnCk2Xl5cttQ
	xxV26z1XWIp6M+f4vMH9ztp5+B567Dpx1uE/k5T/Gw==
X-Google-Smtp-Source: AA6agR6FIH9Ge0gOMHTpvPyKFk1FkUkl+1IoM24o5dRVl1xQTe2JUeowYngO6o1DEiT2kIyUvTkO2MLvRM2Q3rTY2gk=
X-Received: by 2002:a05:6512:68f:b0:492:cbb1:c4b2 with SMTP id
 t15-20020a056512068f00b00492cbb1c4b2mr7774424lfe.130.1661834603011; Mon, 29
 Aug 2022 21:43:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220829125226.511564-1-apatel@ventanamicro.com> <f4b2daab-72f6-ab5a-5743-b41bd5e2c920@microchip.com>
In-Reply-To: <f4b2daab-72f6-ab5a-5743-b41bd5e2c920@microchip.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 30 Aug 2022 10:13:11 +0530
Message-ID: <CAK9=C2UOGR2VQao8CCJ82mRP4kL_1V=8uXyKj_vnOXW7a=Kt8A@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add PMEM support for RISC-V
To: Conor.Dooley@microchip.com
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, atishp@atishpatra.org, 
	heiko@sntech.de, anup@brainfault.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_214325_386372_CDC2BD00 
X-CRM114-Status: GOOD (  16.89  )
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

On Mon, Aug 29, 2022 at 11:11 PM <Conor.Dooley@microchip.com> wrote:
>
> On 29/08/2022 13:52, Anup Patel wrote:
> > The Linux NVDIMM PEM drivers require arch support to map and access the
> > persistent memory device. This series adds RISC-V PMEM support using
> > recently added Svpbmt and Zicbom support.
> >
> > These patches can also be found in riscv_pmem_v1 branch at:
> > https://github.com/avpatel/linux.git
>
> Hey Anup, couple build errors here:
>
> /stuff/linux/arch/riscv/mm/cacheflush.c:99:2: error: call to undeclared function 'for_each_of_cpu_node'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>         for_each_of_cpu_node(node) {
>         ^
> /stuff/linux/arch/riscv/mm/cacheflush.c:99:28: error: expected ';' after expression
>         for_each_of_cpu_node(node) {
>                                   ^
>                                   ;
> 1 warning generated.
> /stuff/linux/arch/riscv/mm/cacheflush.c:105:4: error: 'continue' statement not in loop statement
>                         continue;
>                         ^
> /stuff/linux/arch/riscv/mm/cacheflush.c:108:4: error: 'continue' statement not in loop statement
>                         continue;
>                         ^
> /stuff/linux/arch/riscv/mm/cacheflush.c:111:9: error: call to undeclared function 'of_property_read_u32'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>                 ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
>                       ^
> /stuff/linux/arch/riscv/mm/cacheflush.c:113:4: error: 'continue' statement not in loop statement
>                         continue;
>                         ^
> 6 errors generated.
>
> LKP already complained about this prior to you posting & as it has
> all the repro needed, there's not much point in me sharing my config
> etc:
> https://lore.kernel.org/all/202208272028.IwrNZ0Ur-lkp@intel.com/

Strange, I never got this email.

I will send v2 to fix this.

Regards,
Anup

>
> Thanks,
> Conor.
>
> PS: I liked the last patch, must've been a hard config option to
> find if it took two of you! ;)
>
>
> >
> > Anup Patel (4):
> >   RISC-V: Fix ioremap_cache() and ioremap_wc() for systems with Svpbmt
> >   RISC-V: Move riscv_init_cbom_blocksize() to cacheflush.c
> >   RISC-V: Implement arch specific PMEM APIs
> >   RISC-V: Enable PMEM drivers
> >
> >  arch/riscv/Kconfig                  |  1 +
> >  arch/riscv/configs/defconfig        |  1 +
> >  arch/riscv/include/asm/cacheflush.h |  2 ++
> >  arch/riscv/include/asm/io.h         | 10 ++++++++
> >  arch/riscv/include/asm/pgtable.h    |  2 ++
> >  arch/riscv/mm/Makefile              |  1 +
> >  arch/riscv/mm/cacheflush.c          | 37 +++++++++++++++++++++++++++++
> >  arch/riscv/mm/dma-noncoherent.c     | 36 ----------------------------
> >  arch/riscv/mm/pmem.c                | 21 ++++++++++++++++
> >  9 files changed, 75 insertions(+), 36 deletions(-)
> >  create mode 100644 arch/riscv/mm/pmem.c
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
