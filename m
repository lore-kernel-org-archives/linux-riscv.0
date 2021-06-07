Return-Path: <SRS0=HNmv=LB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73F05C4743F
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 07:29:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41B6E61185
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 07:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41B6E61185
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E0pXKOCnH0szffjh0i+9ft+ncAPm1+P1ac4CVp5Ocqc=; b=MideDDHPcQmveI
	lKPPTUEnlMXJ2WfnfJAT89qITZxaeqKbcfayu7A5RsWnzFTPmbLwRV8ynULGDP7AsA1olvm3ZSqLa
	t7xpw7IlMgpFFAXfWf1ocfsKr/xbcrthxz9j+znhLbdnGvIdkfzD3DQCo9vecYErEOD4wT5I+Sne3
	KW69JY2ow/Vyi1QXz2rwLEr/MGy5S+ATx11IkTTk2xW/blKOT4WlL9PXrVyuvxb5eCSMFrkiI4VgO
	MSzX6Gms1ugmTXM9v1b2s1HelmOnW4S0G/vH+rwBP2JhvwYnAeuIQz9kjpQyvmJ1p1xnoRaQlYJAs
	NrUs+sWZryYK+jPUuSow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq9hD-0024Pi-Mi; Mon, 07 Jun 2021 07:29:15 +0000
Received: from mout.kundenserver.de ([217.72.192.73])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq9h8-0024MM-RR
 for linux-riscv@lists.infradead.org; Mon, 07 Jun 2021 07:29:14 +0000
Received: from mail-wm1-f48.google.com ([209.85.128.48]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MBDzc-1ledNi1QeU-00CkFy for <linux-riscv@lists.infradead.org>; Mon, 07
 Jun 2021 09:29:08 +0200
Received: by mail-wm1-f48.google.com with SMTP id f17so9338129wmf.2
 for <linux-riscv@lists.infradead.org>; Mon, 07 Jun 2021 00:29:08 -0700 (PDT)
X-Gm-Message-State: AOAM530pF/nrLrQdaR71t8SXkYrUL2ASYLdhWqxaubmvONyoUYkylrI8
 CcU06uNpQWABFToH1FYDEfIf2UjoFSRdpdArr0c=
X-Google-Smtp-Source: ABdhPJx1sZM7+jb/Er05kwck+NjL97VzTgij1Tl9s8181a57Xul7USu5v5ud860aYtGnhwYz/l+yS+/2ilFrTbwmUPQ=
X-Received: by 2002:a1c:c90f:: with SMTP id f15mr15633427wmb.142.1623050947892; 
 Mon, 07 Jun 2021 00:29:07 -0700 (PDT)
MIME-Version: 1.0
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
 <1622970249-50770-14-git-send-email-guoren@kernel.org>
 <20210607071916.kwdbtafbqp3icgia@gilmour>
In-Reply-To: <20210607071916.kwdbtafbqp3icgia@gilmour>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 7 Jun 2021 09:27:19 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0YVh5T8MmUcAAjhxGBhNm_OeZq9S=rwAsZVMJNAttyOw@mail.gmail.com>
Message-ID: <CAK8P3a0YVh5T8MmUcAAjhxGBhNm_OeZq9S=rwAsZVMJNAttyOw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 10/11] riscv: soc: Add Allwinner SoC kconfig option
To: Maxime Ripard <maxime@cerno.tech>
Cc: Guo Ren <guoren@kernel.org>, Anup Patel <anup.patel@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, Chen-Yu Tsai <wens@csie.org>, 
 Drew Fustini <drew@beagleboard.org>, liush@allwinnertech.com,
 lazyparser@gmail.com, 
 wefu@redhat.com, linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
 Atish Patra <atish.patra@wdc.com>, Christoph Hellwig <hch@lst.de>
X-Provags-ID: V03:K1:AqSBZ0RuCSz5s1oitSkKxm8bkMJ67g9YTYjbkvPD2hmPmb+Q2No
 AuFPOH0wfJbevQLUxt0ERHrUZpA0ouAg0o+8bozHwX8MCpQRW5B/UprnQIV5flXrvO8Nzof
 qDTH2vSeMzdD9wk/4d07Sewr2h+qK/YeXMqyinbuf6FMjCIYiHvBG2fux8LuH8Ex4zaGHkA
 CBI33PMJZ7elaYSsTNzGg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:DoTVD2WLfgc=:0VhHegNE1fl99pao+M/s1g
 g+eh3wr7mXhJ359bnuWOuyAMv37nXo/zIrpFvSdjODUVZ9sqv5eHSy23zPLbUONnFLc/hLLyn
 vqMqAOpABEvU1PZPlCTnavyrPzFIdGlzguDyLekAlVNjghpdCSvGN+QfYJ3gDLqfZjvWdbg82
 WQxe2bdpdSonIyLsShBtGmTLAkqiMIy9HcpNzgxsfzIhaZm+z2iORL64xaXNIfPynHJyDA/Ru
 vGsJL50FmEcHw6rLDUfqa35dSSW09JPCQ26yagsZx+f1KLuGKLoNdSQGenDP5VA3SW8ZK4vIf
 AidOwvoG6/Ple4I61j0fkWHHBS8urfTqobaSaca85vDgHOoG1i4ADmgxYo+C88gnAplOkaSYR
 Chcr9XGDG9Pyi/GxxOrRPuYByaA9f11BCF8CvP0yqSZdvCzJisnZpRPlnE/vxWv4xJ9CCzztF
 8si+7+aiuLFfUmCcnvl6UsXIFmM7UA7x8/sSmvrseKD/ta/gl5LZrg6Gq8C0ID4D8DOQTTm2E
 Rn+AQ0lfZsQcMn4QCLbkguXFd0UkXZltRCz3xrPssAD9eOjdHQ3IK8D+NbtO8874z1UxzKniL
 0jJgCYbLoh1c26xj7BYiAtIjGTqAgb3uF0ctXQQqWjxTVJlc+70rxLePOM3/o80FSIMt8f2+N
 qSu0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_002911_232393_343EBDCE 
X-CRM114-Status: GOOD (  15.88  )
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

On Mon, Jun 7, 2021 at 9:20 AM Maxime Ripard <maxime@cerno.tech> wrote:
> On Sun, Jun 06, 2021 at 09:04:08AM +0000, guoren@kernel.org wrote:

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

Correct: those subsystems may be completely disabled, which would lead to a
build failure, and a platform should not force-enable drivers or
subsystems unless
those are build time dependencies.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
