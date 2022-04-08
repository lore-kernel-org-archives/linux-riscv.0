Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14BCC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 08:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vS4VMcVFnLNYmAEi80Kfjm7WE6550bar7AUxlSpFL8M=; b=hCu2jlo4CHc0Jj
	EgBZZuxnGlcU2iG8AWITDdgRWFnYNE6qU59pTy1oU272n6mE88IGrOugU64XKeNg94PuTmfHUh4YN
	j+uHB2f3PrKGuMGOAHA4GJb0tUeEQdAqTc/kzkVJnQBOyXLELqQmOXTeu50P13z//lGMnN65MsppE
	CC5d5wk6Rjssjry9gY7+w1IDdU6dvE5JMQwWHcT8bOQNZuUuCX2GHgBVIncXdKEU0CM2rkQQWoKBn
	qQ2+LHjs8ap3cM2V30rX827tF0RLYbFg8PbIRKWJBceif9ZYchaqfIKDsJ/BgkpAhOTyUqbG8bOo9
	ZS4WX4W/wjTT+7+eM71A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncjel-00FjaN-Is; Fri, 08 Apr 2022 08:07:47 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncjah-00FhcQ-9F
 for linux-riscv@lists.infradead.org; Fri, 08 Apr 2022 08:03:36 +0000
Received: by mail-lf1-x12c.google.com with SMTP id x17so4576815lfa.10
 for <linux-riscv@lists.infradead.org>; Fri, 08 Apr 2022 01:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=J1QVpP3nerTWKa1cyXGMgzBZ9LJVJEdqC7pjfww4Eh0=;
 b=IeHertmL2Qe+vuZ8bL1egILsY7UVK9i7WmMVBevq7VhIsjazs1pJ+Ube2AyCXTxyLx
 kPIMhbh0ndj9+nSc9CyU7BM9LpmGocVAs1rADnKyDy8c6JuYZ+cKpmbwwLq3sIQjW4xG
 2WqhW5ZdCysAjQZtB6lo1phb0nqgzgv6uVjFnREhiOttLuIKWNk1mSvSPx061KIJJgVQ
 9JDvEoyEJV5+YdTQPoficS4rT+6Rsd9Llr2uKJ7lwes/Nir2gNcr5XPsU8rc94bWOCHQ
 4NSR1q6+Tenym6U0iGBZigdZPrnYdalm9sEJUnagjyHXi+oocrTVrRqx3TRq2Gkq/bSZ
 gEuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=J1QVpP3nerTWKa1cyXGMgzBZ9LJVJEdqC7pjfww4Eh0=;
 b=Mq9zkxyEQkFmq8xWoI3BFxxMz+soQSRldczd8ioRaP/4ORF3SNIRHS1fq3crNLd4A8
 N1R1q9QgFxV8QBkZaHlr8v2NDW8vvSA5Q95jBkIliI28VsXfgZxz+MnwzRrlKNd+d+9J
 0ARKyIAWzOVwNMCWke6j5ha2A87tjVkPmCuwQBXiKf1QTvPc0SpCY8KriGubWcKPIiac
 0SdfBRmt+tscZ86wAMCy4Z6JTMra6Uw46OHp0HVB8Q/kNKcZ9YTGd/gHt2xirtPtFYcZ
 /v5QRYPu8P5t1v4k5E/2Er5tAccmf6hNpQ1/WCST/AUhCKb0zt2r7oMDfnFav9aXBQqS
 yWbw==
X-Gm-Message-State: AOAM530loi1I5yhtn3jT5JfoEjKshtrYXin+ZocxDFUxqCt9mtF8QlPc
 Yl8rHGJCWmJoJXGKJgYMHdN7Q6fJlnWgwsH0OciPiQ==
X-Google-Smtp-Source: ABdhPJytOGV4FV7cxGl9JWBImAtlMB4k8mvHiIAddgBXq11/Fmeb9upmp/zsxOMs5V3rbsnaBv4P8xhZXt/X//ewaMk=
X-Received: by 2002:ac2:4834:0:b0:45d:519d:933 with SMTP id
 20-20020ac24834000000b0045d519d0933mr12035301lft.5.1649405012705; Fri, 08 Apr
 2022 01:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1648461096.git.zong.li@sifive.com>
 <mhng-6ddf988e-9f86-4f3e-8b6a-6be65f384829@palmer-ri-x1c9>
 <YkU6dPFNPkD0Jay+@matsya>
In-Reply-To: <YkU6dPFNPkD0Jay+@matsya>
From: Zong Li <zong.li@sifive.com>
Date: Fri, 8 Apr 2022 16:03:22 +0800
Message-ID: <CANXhq0oz_zNHJEaWxk9QFy=sDf1cKmrJROn3pEfQWo0AF2Cetw@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] Determine the number of DMA channels by
 'dma-channels' property
To: Vinod Koul <vkoul@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Bin Meng <bin.meng@windriver.com>, Green Wan <green.wan@sifive.com>, 
 dmaengine <dmaengine@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_010335_391340_D206AFBC 
X-CRM114-Status: GOOD (  24.73  )
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

On Thu, Mar 31, 2022 at 1:22 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 30-03-22, 20:15, Palmer Dabbelt wrote:
> > On Mon, 28 Mar 2022 02:52:21 PDT (-0700), zong.li@sifive.com wrote:
> > > The PDMA driver currently assumes there are four channels by default, it
> > > might cause the error if there is actually less than four channels.
> > > Change that by getting number of channel dynamically from device tree.
> > > For backwards-compatible, it uses the default value (i.e. 4) when there
> > > is no 'dma-channels' information in dts.
> > >
> > > This patch set contains the dts and dt-bindings change.
> > >
> > > Changed in v8:
> > >  - Rebase on master
> > >  - Remove modification of microchip-mpfs.dtsi
> > >  - Rename DMA node name of fu540-c000.dtsi
> > >
> > > Changed in v7:
> > >  - Rebase on tag v5.17-rc7
> > >  - Modify the subject of patch
> > >
> > > Changed in v6:
> > >  - Rebase on tag v5.17-rc6
> > >  - Change sf_pdma.chans[] to a flexible array member.
> > >
> > > Changed in v5:
> > >  - Rebase on tag v5.17-rc3
> > >  - Fix typo in dt-bindings and commit message
> > >  - Add PDMA versioning scheme for compatible
> > >
> > > Changed in v4:
> > >  - Remove cflags of debug use reported-by: kernel test robot <lkp@intel.com>
> > >
> > > Changed in v3:
> > >  - Fix allocating wrong size
> > >  - Return error if 'dma-channels' is larger than maximum
> > >
> > > Changed in v2:
> > >  - Rebase on tag v5.16
> > >  - Use 4 as default value of dma-channels
> > >
> > > Zong Li (4):
> > >   dt-bindings: dma-engine: sifive,fu540: Add dma-channels property and
> > >     modify compatible
> > >   riscv: dts: Add dma-channels property and modify compatible
> > >   riscv: dts: rename the node name of dma
> > >   dmaengine: sf-pdma: Get number of channel by device tree
> > >
> > >  .../bindings/dma/sifive,fu540-c000-pdma.yaml  | 19 +++++++++++++--
> > >  arch/riscv/boot/dts/sifive/fu540-c000.dtsi    |  5 ++--
> > >  drivers/dma/sf-pdma/sf-pdma.c                 | 24 ++++++++++++-------
> > >  drivers/dma/sf-pdma/sf-pdma.h                 |  8 ++-----
> > >  4 files changed, 38 insertions(+), 18 deletions(-)
> >
> > Thanks, these are on for-next.
>
> The drivers/dma/ should go thru dmaengine tree. During merge window I
> dont apply the patches
>
> --
> ~Vinod

Hi Vinod,
Many thanks for considering this patchset :)  Could I know if there is
an opportunity to pick this into the following few -rc kernels?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
