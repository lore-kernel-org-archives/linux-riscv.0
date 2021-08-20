Return-Path: <SRS0=APW5=NL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D01C4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Aug 2021 10:38:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 535506056C
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Aug 2021 10:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 535506056C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vL4yy9Q+gHnqBoQpVNKkl5IdcPFwTrWBo+9SJg/3+H8=; b=0aBt6EOp3zIKE2
	JaQy+dUF8BVk2yBkTr5UDi3wPA01PRFQmyZP6EPlYjuvW+z6ffO8w5zFoUNZqOvZrZLGxLopxDet5
	Y+8YrBWj4FwnwGl1BYyNvd2iWygW87jzbt1hSuL7o14QwIwaMm97R5O7x6Lp6tpPKl9TvsmQZdkMu
	yspk7JXCqgqUDyDDrqlzZv7fA16jwK3sShWJwOgS1JXW3EPmWhG6EhBjOKlO+u2qjDPcGRlC945CH
	Fquxqqml5XcL1MGLsCcL2Ynr0GfTX2uDAP3AAeLxvsVmHeTiNY4tnW4FIluq0dtz7L2wcGDglzxCb
	3+TaCj1RJaT3LQ1+UCHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH1uD-00AhwH-8x; Fri, 20 Aug 2021 10:37:45 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH1uA-00AhvM-Ei
 for linux-riscv@lists.infradead.org; Fri, 20 Aug 2021 10:37:44 +0000
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
 [209.85.216.50])
 by linux.microsoft.com (Postfix) with ESMTPSA id 9B4A720C3396
 for <linux-riscv@lists.infradead.org>; Fri, 20 Aug 2021 03:37:39 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 9B4A720C3396
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1629455859;
 bh=iZCuOLADbbT0RFS8G7uJNKKtYP+HH+o4bNtsW00FGJ0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=mSOgJE8smxwaE9vG5d4E8Fekp43ctCKD8sFTOFnKNfzZyaRConcmUjNjAdnRC0HVk
 N7r64P+EcCSC/wfMMLQ0uaAdl1Nm/DhrAGd2VjpemsBPwzrh+GpNVvVFPXZbJ/T5XP
 N/DTAfvgiP1lBoiFj/7DemMsJDh0eh+Usx/Q7ff8=
Received: by mail-pj1-f50.google.com with SMTP id mq3so6996036pjb.5
 for <linux-riscv@lists.infradead.org>; Fri, 20 Aug 2021 03:37:39 -0700 (PDT)
X-Gm-Message-State: AOAM533sDhhecAabPhM5qVzojPh9nlh2hfxpsB5yrMk08qt0ZUSp/i0N
 8Iqi/wcjjQzww5Y8nvZgfZ4NLJWGy9O+u2q14AI=
X-Google-Smtp-Source: ABdhPJyzdRc+FIVwfLSPCZCE1K/bGkGNbPCFuO7BPwZm5dc/PmNHPKsmvy994saRreKZsDdKndQkWHmeI8U48eO5tLI=
X-Received: by 2002:a17:903:4095:b029:12d:315e:5f0d with SMTP id
 z21-20020a1709034095b029012d315e5f0dmr15804610plc.19.1629455859101; Fri, 20
 Aug 2021 03:37:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210614022504.24458-1-mcroce@linux.microsoft.com>
 <871r71azjw.wl-maz@kernel.org> <YROmOQ+4Kqukgd6z@orome.fritz.box>
 <202417ef-f8ae-895d-4d07-1f9f3d89b4a4@gmail.com>
 <87o8a49idp.wl-maz@kernel.org>
 <fe5f99c8-5655-7fbb-a64e-b5f067c3273c@gmail.com>
 <20210812121835.405d2e37@linux.microsoft.com>
 <874kbuapod.wl-maz@kernel.org>
 <CAFnufp2=1t2+fmxyGJ0Qu3Z+=wRwAX8faaPvrJdFpFeTS3J7Uw@mail.gmail.com>
 <87wnohqty1.wl-maz@kernel.org>
In-Reply-To: <87wnohqty1.wl-maz@kernel.org>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Fri, 20 Aug 2021 12:37:03 +0200
X-Gmail-Original-Message-ID: <CAFnufp3xjYqe_iVfbmdjz4-xN2UX_oo3GUw4Z4M_q-R38EN+uQ@mail.gmail.com>
Message-ID: <CAFnufp3xjYqe_iVfbmdjz4-xN2UX_oo3GUw4Z4M_q-R38EN+uQ@mail.gmail.com>
Subject: Re: [PATCH net-next] stmmac: align RX buffers
To: Marc Zyngier <maz@kernel.org>
Cc: Eric Dumazet <eric.dumazet@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, netdev@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Drew Fustini <drew@beagleboard.org>, Emil Renner Berthing <kernel@esmil.dk>, 
 Jon Hunter <jonathanh@nvidia.com>, Will Deacon <will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_033742_634295_870E53DE 
X-CRM114-Status: GOOD (  48.41  )
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

On Thu, Aug 19, 2021 at 6:29 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 12 Aug 2021 12:18:48 +0100,
> Matteo Croce <mcroce@linux.microsoft.com> wrote:
> >
> > [1  <text/plain; UTF-8 (7bit)>]
> > On Thu, Aug 12, 2021 at 1:05 PM Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Thu, 12 Aug 2021 11:18:35 +0100,
> > > Matteo Croce <mcroce@linux.microsoft.com> wrote:
> > > >
> > > > On Thu, 12 Aug 2021 10:48:03 +0200
> > > > Eric Dumazet <eric.dumazet@gmail.com> wrote:
> > > >
> > > > >
> > > > >
> > > > > On 8/11/21 4:16 PM, Marc Zyngier wrote:
> > > > > > On Wed, 11 Aug 2021 13:53:59 +0100,
> > > > > > Eric Dumazet <eric.dumazet@gmail.com> wrote:
> > > > > >
> > > > > >> Are you sure you do not need to adjust stmmac_set_bfsize(),
> > > > > >> stmmac_rx_buf1_len() and stmmac_rx_buf2_len() ?
> > > > > >>
> > > > > >> Presumably DEFAULT_BUFSIZE also want to be increased by NET_SKB_PAD
> > > > > >>
> > > > > >> Patch for stmmac_rx_buf1_len() :
> > > > > >>
> > > > > >> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > > > >> b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c index
> > > > > >> 7b8404a21544cf29668e8a14240c3971e6bce0c3..041a74e7efca3436bfe3e17f972dd156173957a9
> > > > > >> 100644 --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c +++
> > > > > >> b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c @@ -4508,12
> > > > > >> +4508,12 @@ static unsigned int stmmac_rx_buf1_len(struct
> > > > > >> stmmac_priv *priv, /* First descriptor, not last descriptor and
> > > > > >> not split header */ if (status & rx_not_ls)
> > > > > >> -               return priv->dma_buf_sz;
> > > > > >> +               return priv->dma_buf_sz - NET_SKB_PAD -
> > > > > >> NET_IP_ALIGN;
> > > > > >>         plen = stmmac_get_rx_frame_len(priv, p, coe);
> > > > > >>
> > > > > >>         /* First descriptor and last descriptor and not split
> > > > > >> header */
> > > > > >> -       return min_t(unsigned int, priv->dma_buf_sz, plen);
> > > > > >> +       return min_t(unsigned int, priv->dma_buf_sz - NET_SKB_PAD
> > > > > >> - NET_IP_ALIGN, plen); }
> > > > > >>
> > > > > >>  static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
> > > > > >
> > > > > > Feels like a major deficiency of the original patch. Happy to test a
> > > > > > more complete patch if/when you have one.
> > > > >
> > > > > I wont have time in the immediate future.
> > > > >
> > > > > Matteo, if you do not work on a fix, I suggest we revert
> > > > >  a955318fe67ec0d962760b5ee58e74bffaf649b8 stmmac: align RX buffers
> > > > >
> > > > > before a more polished version can be submitted.
> > > > >
> > > >
> > > > Better to use stmmac_rx_offset() so to have the correct length when
> > > > using XDP. Also, when XDP is enabled, the offset was
> > > > XDP_PACKET_HEADROOM (i.e. 256 bytes) even before the change, so it
> > > > could be already broken. Mark, can you try on the Jetson TX2 by
> > > > attaching an XDP program and see if it works without my change?
> > >
> > > Sorry, you'll have to hold my hand here, as I know exactly nothing
> > > about XDP....
> > >
> >
> > Attach the attached object with:
> >
> > ip link set eth0 xdp object passall.o
> >
> > This is an empty XDP program, its source:
> >
> > __attribute__((section("prog"), used))
> > int xdp_main(struct xdp_md *ctx)
> > {
> >        return XDP_PASS;
> > }
> >
> > Every packet will pass untouched, but the offset will be shifted from
> > 0 to 256 bytes, which could trigger the problem anyway:
>
> Nope. On 5.13, which doesn't have the issue, adding this payload
> doesn't result in any problem and the whole thing is rock solid.
>
> >
> > > > A possible fix, which takes in account also the XDP headroom for
> > > > stmmac_rx_buf1_len() only could be (only compile tested, I don't have
> > > > the hardware now):
> > >
> > > However, this doesn't fix my issue. I still get all sort of
> > > corruption. Probably stmmac_rx_buf2_len() also need adjusting (it has
> > > a similar logic as its buf1 counterpart...)
> > >
> > > Unless you can fix it very quickly, and given that we're towards the
> > > end of the cycle, I'd be more comfortable if we reverted this patch.
> > >
> >
> > Can it be that the HW can't do DMA on an address which is not word aligned?
> > What if you replace NET_SKB_PAD with, let's say, 8?
>
> With this:
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index fcdb1d20389b..244aa6579ef4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -341,7 +341,7 @@ static inline unsigned int stmmac_rx_offset(struct stmmac_priv *priv)
>         if (stmmac_xdp_is_enabled(priv))
>                 return XDP_PACKET_HEADROOM + NET_IP_ALIGN;
>
> -       return NET_SKB_PAD + NET_IP_ALIGN;
> +       return 8 + NET_IP_ALIGN;
>  }
>
>  void stmmac_disable_rx_queue(struct stmmac_priv *priv, u32 queue);
>
> I don't see the system corrupting packets anymore. Is that exactly
> what you had in mind? This really seems to point to a basic buffer
> overflow.
>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

Sorry, I meant something like:

-       return NET_SKB_PAD + NET_IP_ALIGN;
+       return 8;

I had some hardware which DMA fails if the receive buffer was not word
aligned, but this seems not the case, as 8 + NET_IP_ALIGN = 10, and
it's not aligned too.

-- 
per aspera ad upstream

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
