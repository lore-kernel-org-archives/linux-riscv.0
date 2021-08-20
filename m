Return-Path: <SRS0=APW5=NL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B52CC4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Aug 2021 18:07:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BF466115A
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Aug 2021 18:07:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4BF466115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7F7OSlQ7KARVh5Gjvx/h/IkpVGi3bMtlOw7/ryJOKR4=; b=0Ye9yM5/6Stof+
	xwUbIAleJcLU5FivssqsOGgEEXZXUuRZQ6C380a9MassMBMNPw0nab+642bJM+XiVPu2I1RfZ7/eY
	Nyb66ABP+qaX91M9Ye2JHW82kwAvM0FRxdp65m0WTRFm3WedpraivTiYRH4NsrMvx+wPwEbjrax3B
	L/nW4MT1a+OPup3V1z8MrnKCuibAecBbaDKibmCWMaE6nqa+415j3MMWGY0BwKhTU+Br7kbf0DnTX
	x+qtW8t8yFXMFq1msNCWm759YLjjkmTm53AZBKajPS+S1Vl0suKs4ZVERCxPSsyCK72BjWNqXd/GW
	TAsPU46rl2XbQCxPAaIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH8uc-00Bnlv-A0; Fri, 20 Aug 2021 18:06:38 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH8uZ-00BnlF-Gh
 for linux-riscv@lists.infradead.org; Fri, 20 Aug 2021 18:06:37 +0000
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by linux.microsoft.com (Postfix) with ESMTPSA id E84B720C33DB
 for <linux-riscv@lists.infradead.org>; Fri, 20 Aug 2021 11:06:33 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E84B720C33DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1629482793;
 bh=TawcIDwLw6//Gm4u2yn5lu5a4ZS6+2gDCjGqcHeuimU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=K1VJwv5ss64RbWMF/zk8eHP5BO1FsisgU3ah+UtmPELqhKukoR2Ii34ZVG6HnCupa
 oqeYkEKbI8xJEVM5S3ZCcAS+GfqTVm1a6OOYlmEFbSIF/iBRkffhJ0A59+R5ZjzbvU
 06Cip3qkCzKVyer71G4vXMb2M4HDoMGhMIMHYOig=
Received: by mail-pf1-f173.google.com with SMTP id 7so9284334pfl.10
 for <linux-riscv@lists.infradead.org>; Fri, 20 Aug 2021 11:06:33 -0700 (PDT)
X-Gm-Message-State: AOAM531DzWdkdRmQ3QapY7gE1DOTlC72wbsP/WWhtyKdPkmzxOuoMgoo
 IA1Laf541WbGJXvqmW2FYBa3Qfkllq96u2RAB5A=
X-Google-Smtp-Source: ABdhPJzm0hvDUTbm4e2ogi3DtvuLSiqfNULNbRO30kAzAIw1JVV8nb4u6QXIcKWIW++PFI2l/VFJ2Rp1Wx0M9i8WDR8=
X-Received: by 2002:aa7:9904:0:b0:3e1:a79a:222e with SMTP id
 z4-20020aa79904000000b003e1a79a222emr21030272pff.41.1629482793349; Fri, 20
 Aug 2021 11:06:33 -0700 (PDT)
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
 <CAFnufp3xjYqe_iVfbmdjz4-xN2UX_oo3GUw4Z4M_q-R38EN+uQ@mail.gmail.com>
 <87fsv4qdzm.wl-maz@kernel.org>
 <CAFnufp2T75cvDLUx+ZyPQbkaNeY_S1OJ7KTJe=2EK-qXRNkwyw@mail.gmail.com>
 <87mtpcyrdv.wl-maz@kernel.org>
 <CAFnufp0N2MzaTjF95tx9Q1D33z9f9AAK6UHbhU9rhG1ue_r1ug@mail.gmail.com>
 <87h7fkyqpv.wl-maz@kernel.org>
 <CAFnufp3HbyeTGhxB33mej4Y4G2T2Yv5swKCx_C41zfc71Kj11A@mail.gmail.com>
 <87fsv4ypfn.wl-maz@kernel.org>
 <CAFnufp2qFuhMDae20u_dV+aOPfB+zpcEK8D-=8ACE6r4kDn2rw@mail.gmail.com>
In-Reply-To: <CAFnufp2qFuhMDae20u_dV+aOPfB+zpcEK8D-=8ACE6r4kDn2rw@mail.gmail.com>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Fri, 20 Aug 2021 20:05:57 +0200
X-Gmail-Original-Message-ID: <CAFnufp3SCJLgDz5XS0K36QkPb3TFRP1io-9AdRsQp6vkvVWJSw@mail.gmail.com>
Message-ID: <CAFnufp3SCJLgDz5XS0K36QkPb3TFRP1io-9AdRsQp6vkvVWJSw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210820_110635_658312_C377A971 
X-CRM114-Status: GOOD (  44.35  )
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

On Fri, Aug 20, 2021 at 7:56 PM Matteo Croce <mcroce@linux.microsoft.com> wrote:
>
> On Fri, Aug 20, 2021 at 7:51 PM Marc Zyngier <maz@kernel.org> wrote:
> >
> > On Fri, 20 Aug 2021 18:35:45 +0100,
> > Matteo Croce <mcroce@linux.microsoft.com> wrote:
> > >
> > > On Fri, Aug 20, 2021 at 7:24 PM Marc Zyngier <maz@kernel.org> wrote:
> > > >
> > > > On Fri, 20 Aug 2021 18:14:30 +0100,
> > > > Matteo Croce <mcroce@linux.microsoft.com> wrote:
> > > > >
> > > > > On Fri, Aug 20, 2021 at 7:09 PM Marc Zyngier <maz@kernel.org> wrote:
> > > > > >
> > > > > > On Fri, 20 Aug 2021 17:38:14 +0100,
> > > > > > Matteo Croce <mcroce@linux.microsoft.com> wrote:
> > > > > > >
> > > > > > > On Fri, Aug 20, 2021 at 6:26 PM Marc Zyngier <maz@kernel.org> wrote:
> > > > > > > >
> > > > > > > > On Fri, 20 Aug 2021 11:37:03 +0100,
> > > > > > > > Matteo Croce <mcroce@linux.microsoft.com> wrote:
> > > > > > > > >
> > > > > > > > > On Thu, Aug 19, 2021 at 6:29 PM Marc Zyngier <maz@kernel.org> wrote:
> > > > > > > >
> > > > > > > > [...]
> > > > > > > >
> > > > > > > > > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> > > > > > > > > > index fcdb1d20389b..244aa6579ef4 100644
> > > > > > > > > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> > > > > > > > > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> > > > > > > > > > @@ -341,7 +341,7 @@ static inline unsigned int stmmac_rx_offset(struct stmmac_priv *priv)
> > > > > > > > > >         if (stmmac_xdp_is_enabled(priv))
> > > > > > > > > >                 return XDP_PACKET_HEADROOM + NET_IP_ALIGN;
> > > > > > > > > >
> > > > > > > > > > -       return NET_SKB_PAD + NET_IP_ALIGN;
> > > > > > > > > > +       return 8 + NET_IP_ALIGN;
> > > > > > > > > >  }
> > > > > > > > > >
> > > > > > > > > >  void stmmac_disable_rx_queue(struct stmmac_priv *priv, u32 queue);
> > > > > > > > > >
> > > > > > > > > > I don't see the system corrupting packets anymore. Is that exactly
> > > > > > > > > > what you had in mind? This really seems to point to a basic buffer
> > > > > > > > > > overflow.
> > > > > > > >
> > > > > > > > [...]
> > > > > > > >
> > > > > > > > > Sorry, I meant something like:
> > > > > > > > >
> > > > > > > > > -       return NET_SKB_PAD + NET_IP_ALIGN;
> > > > > > > > > +       return 8;
> > > > > > > > >
> > > > > > > > > I had some hardware which DMA fails if the receive buffer was not word
> > > > > > > > > aligned, but this seems not the case, as 8 + NET_IP_ALIGN = 10, and
> > > > > > > > > it's not aligned too.
> > > > > > > >
> > > > > > > > No error in that case either, as expected. Given that NET_SKB_PAD is
> > > > > > > > likely to expand to 64, it is likely a DMA buffer overflow which
> > > > > > > > probably only triggers for large-ish packets.
> > > > > > > >
> > > > > > > > Now, we're almost at -rc7, and we don't have a solution in sight.
> > > > > > > >
> > > > > > > > Can we please revert this until we have an understanding of what is
> > > > > > > > happening? I'll hopefully have more cycles to work on the issue once
> > > > > > > > 5.14 is out, and hopefully the maintainers of this driver can chime in
> > > > > > > > (they have been pretty quiet so far).
> > > > > > > >
> > > > > > > > Thanks,
> > > > > > > >
> > > > > > > >         M.
> > > > > > > >
> > > > > > > > --
> > > > > > > > Without deviation from the norm, progress is not possible.
> > > > > > >
> > > > > > > Last try, what about adding only NET_IP_ALIGN and leaving NET_SKB_PAD?
> > > > > > >
> > > > > > > -       return NET_SKB_PAD + NET_IP_ALIGN;
> > > > > > > +       return NET_IP_ALIGN;
> > > > > > >
> > > > > > > I think that alloc_skb adds another NET_SKB_PAD anyway.
> > > > > >
> > > > > > I don't see any packet corruption with this. However, this doesn't
> > > > > > prove that this is correct either. What was the rational for adding
> > > > > > NET_SKB_PAD the first place?
> > > > > >
> > > > >
> > > > > I think it's wrong. The original offset was 0, and to align it to the
> > > > > boundary we need to add just NET_IP_ALIGN, which is two.
> > > > > NET_SKB_PAD is a much bigger value, (I think 64), which is used to
> > > > > reserve space to prepend an header, e.g. with tunnels.
> > > >
> > > > How about the other adjustments that Eric mentioned regarding the size
> > > > of the buffer? Aren't they required?
> > > >
> > >
> > > I guess that if stmmac_rx_buf1_len() needed such adjustment, it would
> > > be already broken when XDP is in use.
> > > When you use XDP, stmmac_rx_offset() adds a pretty big headroom of 256
> > > byte, which would easily trigger an overflow if not accounted.
> > > Did you try attaching a simple XDP program on a stock 5.13 kernel?
> >
> > Yes, as mentioned in [1], to which you replied...
> >
> >         M.
> >
> > [1] https://lore.kernel.org/r/87wnohqty1.wl-maz@kernel.org
> >
>
> Great.
> So I doubt that the adjustment is needed.
> Does it work with all the frame size?
>

Last check, are you sure that the bpf program was loaded in the driver
and not as generic XDP?
You can force it as native with "xdpdrv":

ip link set eth xdpdrv object kernel_passall.o

-- 
per aspera ad upstream

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
