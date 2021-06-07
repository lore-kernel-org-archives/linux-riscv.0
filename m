Return-Path: <SRS0=HNmv=LB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D359CC47082
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 08:08:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B22A610A1
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 08:08:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B22A610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mmE7MLp2yESQ8nQYBx75EqrxvVLlBQfkQi3Jab1u7lA=; b=dZ5a6bPmQgx/73
	YHQHwPF+7ojevgMO6mJQO8f0h1IrVkHmkmLLir2oLkySQMh1MWe3rc/BAMU9LyldRG9B3mxSVCObg
	vlQt6YCZeAAYJZJdTEmMwj6EJRofd38U3XmzMrFwC0GMnXMVPiDCwqGw1Crkcv7WtnNolbgMSqYxm
	4bAtDjwvicI1ej9ApG+dfp3TTgAhKP6T2rHQnoD/sKUBBfQLrVhDQaCp0F0DyRuwtuzQKlgy3RqWM
	L+czUVl5Gp7XMxGHGULxmHEPYbs+2vYz5QHsUshZzDg2mHbvf6Qnyy1LqXnaPFbkThT2Dg5sn2rXK
	8sjoclm5wKPtv6f2/jLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqAIg-002C7J-DE; Mon, 07 Jun 2021 08:07:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqAIb-002C3z-Gu
 for linux-riscv@lists.infradead.org; Mon, 07 Jun 2021 08:07:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 157CF61285
 for <linux-riscv@lists.infradead.org>; Mon,  7 Jun 2021 08:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623053273;
 bh=gwgVr5c272t593y2hbVai/Z8i5e3WgEC6rqKmwLt5gk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=D0VrrAd7gklOYFaN6ChWZc+RdjynB0Rc8D9ObxZinZUTZBbrcEhGH45cDmKBICGaO
 khCAsJvQdBK1GuWzfUrSLVeq3ixE2b15olqjfZeKa0h1SVlLrmXmedGby2wXicL9wq
 DHEI9daq2vYmTchuwi7wT5nT3iNW2MJ9+eGiAX94GnypYQFuqs4PYqjy75Tc0SeTuq
 Z7Cn4b+p2VxipC00KmOK+f4syk5YbpZPZyJicJ7Sk+OekbIfmBo5oKzUtjsjKx0E8t
 JMYXkKTtdKVb66HJrdQWMUqjSkKHwMY/mEfkDJKjsfaparAgk8x5jbXVS2+Si1/QDu
 smgygylAryUJA==
Received: by mail-lj1-f180.google.com with SMTP id d2so16796347ljj.11
 for <linux-riscv@lists.infradead.org>; Mon, 07 Jun 2021 01:07:52 -0700 (PDT)
X-Gm-Message-State: AOAM531gsC1A0aszBhiMUhaP4ZLonhx/N/ADYo1gasWBYqSQJwsIiN6R
 S1FGvlT2lXv4VngSH1o1ol/k37xdFCYDhSZJJ3A=
X-Google-Smtp-Source: ABdhPJxQwxzldkvMT2Zq76A9rwF/pw+Z7buOBHq1OvQ06vSkOjbCmmydHefXi5GC0MUf1nYm1BsIrpmiOK3ACBaRfKw=
X-Received: by 2002:a2e:8e90:: with SMTP id z16mr13480638ljk.508.1623053271241; 
 Mon, 07 Jun 2021 01:07:51 -0700 (PDT)
MIME-Version: 1.0
References: <1622970249-50770-1-git-send-email-guoren@kernel.org>
 <1622970249-50770-13-git-send-email-guoren@kernel.org>
 <20210607072434.3g3bqxdlpxjirg6k@gilmour>
In-Reply-To: <20210607072434.3g3bqxdlpxjirg6k@gilmour>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 7 Jun 2021 16:07:37 +0800
X-Gmail-Original-Message-ID: <CAJF2gTStppyEoLD-ZToeHYdnzNoFhH2+3Lhd76=M8OFKS=Syow@mail.gmail.com>
Message-ID: <CAJF2gTStppyEoLD-ZToeHYdnzNoFhH2+3Lhd76=M8OFKS=Syow@mail.gmail.com>
Subject: Re: [RFC PATCH v2 09/11] riscv: soc: Initial DTS for Allwinner D1
 NeZha board
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
X-CRM114-CacheID: sfid-20210607_010753_628396_F6C6EB69 
X-CRM114-Status: GOOD (  26.11  )
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

On Mon, Jun 7, 2021 at 3:24 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> Thanks for the patches
>
> On Sun, Jun 06, 2021 at 09:04:07AM +0000, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Add initial DTS for Allwinner D1 NeZha board having only essential
> > devices (uart, dummy, clock, reset, clint, plic, etc).
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
> >  arch/riscv/boot/dts/Makefile                       |  1 +
> >  arch/riscv/boot/dts/allwinner/Makefile             |  2 +
> >  .../boot/dts/allwinner/allwinner-d1-nezha-kit.dts  | 29 ++++++++
> >  arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi    | 84 ++++++++++++++++++++++
>
> Can you add the riscv folder to our MAINTAINERS entry as well?
Yes

>
> >  4 files changed, 116 insertions(+)
> >  create mode 100644 arch/riscv/boot/dts/allwinner/Makefile
> >  create mode 100644 arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts
> >  create mode 100644 arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi
> >
> > diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> > index fe996b8..3e7b264 100644
> > --- a/arch/riscv/boot/dts/Makefile
> > +++ b/arch/riscv/boot/dts/Makefile
> > @@ -2,5 +2,6 @@
> >  subdir-y += sifive
> >  subdir-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += canaan
> >  subdir-y += microchip
> > +subdir-y += allwinner
>
> I assume they should be ordered alphabetically?
Thx for pointing it out.

>
> >  obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
> > diff --git a/arch/riscv/boot/dts/allwinner/Makefile b/arch/riscv/boot/dts/allwinner/Makefile
> > new file mode 100644
> > index 00000000..4adbf4b
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/allwinner/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +dtb-$(CONFIG_SOC_SUNXI) += allwinner-d1-nezha-kit.dtb
> > diff --git a/arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts b/arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts
> > new file mode 100644
> > index 00000000..cd9f7c9
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/allwinner/allwinner-d1-nezha-kit.dts
> > @@ -0,0 +1,29 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +/dts-v1/;
> > +
> > +#include "allwinner-d1.dtsi"
> > +
> > +/ {
> > +     #address-cells = <2>;
> > +     #size-cells = <2>;
> > +     model = "Allwinner D1 NeZha Kit";
> > +     compatible = "allwinner,d1-nezha-kit";
> > +
> > +     chosen {
> > +             bootargs = "console=ttyS0,115200";
> > +             stdout-path = &serial0;
> > +     };
> > +
> > +     memory@40000000 {
> > +             device_type = "memory";
> > +             reg = <0x0 0x40000000 0x0 0x20000000>;
> > +     };
> > +
> > +     soc {
> > +     };
> > +};
> > +
> > +&serial0 {
> > +     status = "okay";
> > +};
> > diff --git a/arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi b/arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi
> > new file mode 100644
> > index 00000000..11cd938
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/allwinner/allwinner-d1.dtsi
> > @@ -0,0 +1,84 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +
> > +/dts-v1/;
> > +
> > +/ {
> > +     #address-cells = <2>;
> > +     #size-cells = <2>;
> > +     model = "Allwinner D1 Soc";
> > +     compatible = "allwinner,d1-nezha-kit";
> > +
> > +     chosen {
> > +     };
> > +
> > +     cpus {
> > +             #address-cells = <1>;
> > +             #size-cells = <0>;
> > +             timebase-frequency = <2400000>;
> > +             cpu@0 {
> > +                     device_type = "cpu";
> > +                     reg = <0>;
> > +                     status = "okay";
> > +                     compatible = "riscv";
> > +                     riscv,isa = "rv64imafdcv";
> > +                     mmu-type = "riscv,sv39";
> > +                     cpu0_intc: interrupt-controller {
> > +                             #interrupt-cells = <1>;
> > +                             compatible = "riscv,cpu-intc";
> > +                             interrupt-controller;
> > +                     };
> > +             };
> > +     };
> > +
> > +     soc {
> > +             #address-cells = <2>;
> > +             #size-cells = <2>;
> > +             compatible = "simple-bus";
> > +             ranges;
> > +
> > +             reset: reset-sample {
> > +                     compatible = "thead,reset-sample";
> > +                     plic-delegate = <0x0 0x101ffffc>;
> > +             };
>
> This compatible is not documented anywhere?
It used by opensbi (riscv runtime firmware), not in Linux. But I think
we should keep it.

>
> Maxime



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
