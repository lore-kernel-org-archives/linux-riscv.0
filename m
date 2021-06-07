Return-Path: <SRS0=HNmv=LB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55D0FC47082
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 07:43:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B6D56121F
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 07:43:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B6D56121F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uaeEjbwY5br1HhwMje4ptIY6XiBF59jNxz9QFbrs6r8=; b=ZBtQhaarfbqA6A
	0c+PDTfUHeQxPZQP9LQasEdnmUoA/NQZ6sGrpbUYtSjSInxKg5bk24qhodYEg0pF3OUUvEJslJKLu
	zFJtEAAmqh97NVl62/xnhbtMUQfEShmHWRBxLdP7XhuF9eVQt7KLZQQggSmzTAJOw38kNguLWboDc
	nwkmXfT6qnitEglr6ZWR8NeiQUGHjriYHUx9FQ+eeXcphyEDVgfh3mXplCm1uDATzuzF5FHbjaLup
	/FijD+9KZnb9Y4G/fMTSBrpSlCjJjSVEQJ2A0aHcFH/6teqtIutJGGyEPOCS9re3JOiF7mwkAkcHC
	/F2MS5Y57DEssjIWKmYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq9uq-0027Mw-30; Mon, 07 Jun 2021 07:43:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq9un-0027M6-7V
 for linux-riscv@lists.infradead.org; Mon, 07 Jun 2021 07:43:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DE7EB6121F
 for <linux-riscv@lists.infradead.org>; Mon,  7 Jun 2021 07:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623051796;
 bh=hTteHEOJ6fuVn0bUEkVjfhKcTXY/fr6KaN9hPRGCRE8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XcJ16yKwRTtjOEHZTmO5sqG2EgpLlLKApCRuWSa2uNKExqjlmP6pIcZB+LR9vHoUJ
 DlEePW9oLiXKXzeH9L9F0Wk5IlIzHnk8S8cF7e+14d2grrjRGj2z3RllwrC9qvMzWa
 Scz54HCXmSpiKFvI9ZwujG1MOGPfRBgKd+8j2eRJwMFJcoO716/e4aO83B1Ftd1YQe
 V/pq06VNseHS37q5seU5IeYEitCUWKFx5Ql+VG32hohITtzAdxsSYTxN01aKBmqN5n
 3CGVqHhcrZFZq8mZbNc4pEcTK5PgFy6OsZjWB1rcYhYD4mddESSUsRyaHx2+w/2mo5
 1OJ4M8CSeddjQ==
Received: by mail-lj1-f179.google.com with SMTP id c11so20884882ljd.6
 for <linux-riscv@lists.infradead.org>; Mon, 07 Jun 2021 00:43:16 -0700 (PDT)
X-Gm-Message-State: AOAM530u3gT+WCCuWwri71UWdc3Km+9puz7eMpy+jiqyzgODPUALzeuO
 h2B9Ys/0NnurQPB+qKzM5M0D6sFoE/CQkEspOZM=
X-Google-Smtp-Source: ABdhPJyKxzhukXaYzHu0eSbGrCR3t7tIBy0TIpuvAKNAzu0/rYsPgtX7UElk34zL12D4zBA67MfFr81fmeJmAptKvvA=
X-Received: by 2002:a05:651c:502:: with SMTP id
 o2mr13824567ljp.105.1623051795168; 
 Mon, 07 Jun 2021 00:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
 <1622970249-50770-14-git-send-email-guoren@kernel.org>
 <20210607071916.kwdbtafbqp3icgia@gilmour>
In-Reply-To: <20210607071916.kwdbtafbqp3icgia@gilmour>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 7 Jun 2021 15:43:03 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT=aLNpwuQmOPw=L8eoezwX8DmGOunmPx0H_WzbaOpO+g@mail.gmail.com>
Message-ID: <CAJF2gTT=aLNpwuQmOPw=L8eoezwX8DmGOunmPx0H_WzbaOpO+g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 10/11] riscv: soc: Add Allwinner SoC kconfig option
To: Maxime Ripard <maxime@cerno.tech>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 Arnd Bergmann <arnd@arndb.de>, Chen-Yu Tsai <wens@csie.org>,
 Drew Fustini <drew@beagleboard.org>, liush@allwinnertech.com,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 wefu@redhat.com, linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
 Atish Patra <atish.patra@wdc.com>, Christoph Hellwig <hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_004317_319773_A98F70B5 
X-CRM114-Status: GOOD (  22.14  )
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

On Mon, Jun 7, 2021 at 3:19 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Sun, Jun 06, 2021 at 09:04:08AM +0000, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Add Allwinner kconfig option which selects SoC specific and common
> > drivers that is required for this SoC.
> >
> > Allwinner D1 uses custom PTE attributes to solve non-coherency SOC
> > interconnect issues for dma synchronization, so we set the default
> > value when SOC_SUNXI selected.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Co-Developed-by: Liu Shaohua <liush@allwinnertech.com>
> > Signed-off-by: Liu Shaohua <liush@allwinnertech.com>
> > Cc: Anup Patel <anup.patel@wdc.com>
> > Cc: Atish Patra <atish.patra@wdc.com>
> > Cc: Christoph Hellwig <hch@lst.de>
> > Cc: Chen-Yu Tsai <wens@csie.org>
> > Cc: Drew Fustini <drew@beagleboard.org>
> > Cc: Maxime Ripard <maxime@cerno.tech>
> > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> > Cc: Wei Fu <wefu@redhat.com>
> > Cc: Wei Wu <lazyparser@gmail.com>
> > ---
> >  arch/riscv/Kconfig.socs      | 12 ++++++++++++
> >  arch/riscv/configs/defconfig |  1 +
> >  2 files changed, 13 insertions(+)
> >
> > diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> > index ed96376..055fb3e 100644
> > --- a/arch/riscv/Kconfig.socs
> > +++ b/arch/riscv/Kconfig.socs
> > @@ -69,4 +69,16 @@ config SOC_CANAAN_K210_DTB_SOURCE
> >
> >  endif
> >
> > +config SOC_SUNXI
> > +     bool "Allwinner SoCs"
> > +     depends on MMU
> > +     select DWMAC_GENERIC
> > +     select SERIAL_8250
> > +     select SERIAL_8250_CONSOLE
> > +     select SERIAL_8250_DW
> > +     select SIFIVE_PLIC
> > +     select STMMAC_ETH
> > +     help
> > +       This enables support for Allwinner SoC platforms like the D1.
> > +
>
> We probably don't want to select DWMAC, STMMAC_ETH and the 8250 options,
> looks good otherwise.
>
> Maxime
Remove DWMAC, STMMAC_ETH is okay.

But I think we still need:
select SERIAL_8250_DW if SERIAL_8250
-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
