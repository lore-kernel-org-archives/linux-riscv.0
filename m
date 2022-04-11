Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65148C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 11:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0+rw3eTbDsnLTnK5Q2fSOiyLFGe0cxn2IiAPqW9ZDZk=; b=2FkP/ukTpHMK83
	4Qc5IXD2Msgk92QrYry9ZSW9vseuvpoYjk9jQi/OF5FjU2Ucb9aNRzCDWcfTRT+amuE6SEg37bdP2
	49SkQS2opIZn5T60ZArMLUVznzoUmYovSS+4RyW9hPBwd2p8xp8LCisRcNfl8tiYIx5XuS7obPU54
	zy4dVKiADtiJujG3n8xxFNGvYzob7PG+2UT11I3/6WvnlH3Nu6mOeIeF0MXq2or3Q6ULPvlWYBwbB
	ahe/9yhJS33zNuH+ZNb8pYaLigrKGsx9t6stTBJNDVbmmeCtotsMEEEmUzNFO0lI/l3YHQ69Qh4I0
	GUqmdYM1ZAZesefXe3mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndsSW-008l5g-TP; Mon, 11 Apr 2022 11:43:52 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndsSU-008l4n-Ga
 for linux-riscv@lists.infradead.org; Mon, 11 Apr 2022 11:43:51 +0000
Received: by mail-lj1-x22e.google.com with SMTP id bn33so19722161ljb.6
 for <linux-riscv@lists.infradead.org>; Mon, 11 Apr 2022 04:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vdw4ZXHCV2Uqoc9GaWxbHE5SGjw8cSMUbAVvs7T22GI=;
 b=F20AJPCK1CUmmC/89HjK7NO6rVKSVy3xpQV7B137WtPj4PvbxYCWh7ZeWsyzMSxphb
 OSORHdz36qT/dybt+JqjzG125vybXdvRrnHsaEItWGI7ONrwjpdvqLsObj8g052BsYW2
 setyyqMFpM6YDU58chmeHDeXOS9hDx0narpJk/2lt0jLQ3Q7qUcU4OUy+Jhy2R+SX/U5
 dg/cZzI1tTxHa3Vl8N2wMEkp+s+986jop1ipS1pwaXcRr80ONdbU/B6Ve3KkC84CIWPk
 PZMMcbboGv6Jsu3PNaq3HwfXQ42oXfDKDmnJ+RQQe5vtaLv58+uzZJr/GO1G/wQ65Oa4
 /1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vdw4ZXHCV2Uqoc9GaWxbHE5SGjw8cSMUbAVvs7T22GI=;
 b=PoMkXtFiJeM5saouvAIwJLlwtzPASj8eY5pj2whd9jrnOIt5BWQecqM27r1bSx+Td3
 mc8NKAyAmmmu1Y7IR4fOqIjXUc4L+14z6rNQ0Lk96fpHc4mmqO6RIsLLZZb864Ds2/4e
 RzCpIF3J7OWHgyW/r5i2jYanVkn53R5vdNkpwlVfBQ45PE0gyp72I0DNjeyBumItRkio
 Gpqqg7nitszvgfQXX1+clMHDbd6hCHlfV4RRrNUHjjm12UiD52i6cp3Rt2xyPQg7JaF+
 Wjd8j+KxKsSB1+37SSBreuk8KcqmnyAC8Yj6FFxObyRkviuJcOAdXzTev0IW4eU02NqN
 jHHw==
X-Gm-Message-State: AOAM530d91Rlnek6MPbzkxqh9XLN+J/pdDJZASSh9ZY2Wh5NpYJZXyoE
 xM5LWcKqeX/6hZ8BAFzKebfxs6c+DGBQgocPmCYmh8JMn7Q=
X-Google-Smtp-Source: ABdhPJzd1j57QPZdoje//KcP9Tuy/PNpiFrQTI71gFTl5ZTAYthKpmeyoPyuscLcK59MdNdaagW07TWeRFQm8huBV9w=
X-Received: by 2002:a2e:b742:0:b0:24b:6370:1e00 with SMTP id
 k2-20020a2eb742000000b0024b63701e00mr2899689ljo.71.1649677427312; Mon, 11 Apr
 2022 04:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1648461096.git.zong.li@sifive.com> <YlA1DwdIMoQ1dXZS@matsya>
 <CANXhq0ramPvr=CL2oPsPAnWiF9X0eYVt8HGAVWPE9mZ5PfhG7A@mail.gmail.com>
 <YlQHkeZhHvC/n0G5@matsya>
In-Reply-To: <YlQHkeZhHvC/n0G5@matsya>
From: Zong Li <zong.li@sifive.com>
Date: Mon, 11 Apr 2022 19:43:35 +0800
Message-ID: <CANXhq0r15Z9NZj+xr7K_2Tt5VbK2r4+f7Fpg-f9BY98ufgKxcw@mail.gmail.com>
Subject: Re: [PATCH v8 0/4] Determine the number of DMA channels by
 'dma-channels' property
To: Vinod Koul <vkoul@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Bin Meng <bin.meng@windriver.com>, Green Wan <green.wan@sifive.com>, 
 dmaengine <dmaengine@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_044350_638926_6ED51C39 
X-CRM114-Status: GOOD (  16.31  )
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

On Mon, Apr 11, 2022 at 6:48 PM Vinod Koul <vkoul@kernel.org> wrote:
>
> On 11-04-22, 10:51, Zong Li wrote:
> > On Fri, Apr 8, 2022 at 9:13 PM Vinod Koul <vkoul@kernel.org> wrote:
> > >
> > > On 28-03-22, 17:52, Zong Li wrote:
> > > > The PDMA driver currently assumes there are four channels by default, it
> > > > might cause the error if there is actually less than four channels.
> > > > Change that by getting number of channel dynamically from device tree.
> > > > For backwards-compatible, it uses the default value (i.e. 4) when there
> > > > is no 'dma-channels' information in dts.
> > >
> > > Applied patch 1 & 4 to dmaengine-next, thanks
> >
> > Hi Vinod,
> > Thanks for your help and review. For patch 2 and 3, does it mean that
> > we should go through the riscv tree?
>
> Yes
>

Hi Palmer,
Could you please help me to pick up the patch 2 and 3. Thanks :)

> --
> ~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
