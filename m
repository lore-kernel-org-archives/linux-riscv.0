Return-Path: <SRS0=APW5=NL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF203C432BE
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Aug 2021 17:36:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C8976115A
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Aug 2021 17:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8C8976115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v/xDYvR3QmYiWudKaWAgT3hNFy+MbuL508FQuKLLP90=; b=BNi06tKuAVZO5s
	2kiYGkAVw3wV4S33FTc/B78VTdnrVq+APH1vp6Bsfuilz9nv7dtFgNtsBkXx5XMjGXfuRWbFM6WGv
	p8pLmACNgYnI29h9JR/PaHah9auPmjuD6YrRESvNBtoYXdmgmfBC1q73qxEO02WjCe8ypv5XDE+aK
	50CnCjTLGk9QN/g1fkTpeiLMOatcurFemqR5sDsdDc8OoVwpcA0PG3qYk87g5YvWks2wXa/fe6lAk
	//PiPdOHnEEG1lm3x+AX+YeYgT4bhGvIn5ueH+25sz1+K+hOycrCQdHgxGH1JjFUjrdDIasYI80Hh
	vF88EfLf3odgmXkUIlvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH8RN-00BkWq-3M; Fri, 20 Aug 2021 17:36:25 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH8RK-00BkWN-IN
 for linux-riscv@lists.infradead.org; Fri, 20 Aug 2021 17:36:24 +0000
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by linux.microsoft.com (Postfix) with ESMTPSA id E014320C33D6
 for <linux-riscv@lists.infradead.org>; Fri, 20 Aug 2021 10:36:21 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E014320C33D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1629480981;
 bh=dkfEmMb69UrtMjAtZDzM024/xNYhw2xqJs/2HMtdXmc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fKJaNRe8+MCJB0KJLYLvuDKp8miNx/jC+Jp6ZFrZ/FSt75nUdzW7vqaje/ZCxEddS
 X1RCR3Q0xhrifCeUBjS8HIIGUazF5dt53FF+RHgPhOhZShRZ/Vtn8JJ0xnojFiss25
 j5aeXUNKAwvg/MfJ61hfAyj8lo1T6rLcfqiYLK3I=
Received: by mail-pf1-f179.google.com with SMTP id k19so9230626pfc.11
 for <linux-riscv@lists.infradead.org>; Fri, 20 Aug 2021 10:36:21 -0700 (PDT)
X-Gm-Message-State: AOAM530lMveB3xvBuNVue2JxGatXqzBdJmlos/A4DAmxZf7oVTq0YkNb
 xLoVQxH1ef2jEMqsSFIzK7Vr41IWy81uqLBI5do=
X-Google-Smtp-Source: ABdhPJwDqdmiMWbW301B7gj3cCHgzAv37q1C8TWjN54+gM1cNuz47Xk/ccxokkdxTMTsLiOUgggFMTvJ67uWm/H0mzM=
X-Received: by 2002:a63:fe41:: with SMTP id x1mr19382794pgj.272.1629480981404; 
 Fri, 20 Aug 2021 10:36:21 -0700 (PDT)
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
In-Reply-To: <87h7fkyqpv.wl-maz@kernel.org>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Fri, 20 Aug 2021 19:35:45 +0200
X-Gmail-Original-Message-ID: <CAFnufp3HbyeTGhxB33mej4Y4G2T2Yv5swKCx_C41zfc71Kj11A@mail.gmail.com>
Message-ID: <CAFnufp3HbyeTGhxB33mej4Y4G2T2Yv5swKCx_C41zfc71Kj11A@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210820_103622_699296_2BBD8A59 
X-CRM114-Status: GOOD (  38.68  )
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

On Fri, Aug 20, 2021 at 7:24 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 20 Aug 2021 18:14:30 +0100,
> Matteo Croce <mcroce@linux.microsoft.com> wrote:
> >
> > On Fri, Aug 20, 2021 at 7:09 PM Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Fri, 20 Aug 2021 17:38:14 +0100,
> > > Matteo Croce <mcroce@linux.microsoft.com> wrote:
> > > >
> > > > On Fri, Aug 20, 2021 at 6:26 PM Marc Zyngier <maz@kernel.org> wrote:
> > > > >
> > > > > On Fri, 20 Aug 2021 11:37:03 +0100,
> > > > > Matteo Croce <mcroce@linux.microsoft.com> wrote:
> > > > > >
> > > > > > On Thu, Aug 19, 2021 at 6:29 PM Marc Zyngier <maz@kernel.org> wrote:
> > > > >
> > > > > [...]
> > > > >
> > > > > > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> > > > > > > index fcdb1d20389b..244aa6579ef4 100644
> > > > > > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> > > > > > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> > > > > > > @@ -341,7 +341,7 @@ static inline unsigned int stmmac_rx_offset(struct stmmac_priv *priv)
> > > > > > >         if (stmmac_xdp_is_enabled(priv))
> > > > > > >                 return XDP_PACKET_HEADROOM + NET_IP_ALIGN;
> > > > > > >
> > > > > > > -       return NET_SKB_PAD + NET_IP_ALIGN;
> > > > > > > +       return 8 + NET_IP_ALIGN;
> > > > > > >  }
> > > > > > >
> > > > > > >  void stmmac_disable_rx_queue(struct stmmac_priv *priv, u32 queue);
> > > > > > >
> > > > > > > I don't see the system corrupting packets anymore. Is that exactly
> > > > > > > what you had in mind? This really seems to point to a basic buffer
> > > > > > > overflow.
> > > > >
> > > > > [...]
> > > > >
> > > > > > Sorry, I meant something like:
> > > > > >
> > > > > > -       return NET_SKB_PAD + NET_IP_ALIGN;
> > > > > > +       return 8;
> > > > > >
> > > > > > I had some hardware which DMA fails if the receive buffer was not word
> > > > > > aligned, but this seems not the case, as 8 + NET_IP_ALIGN = 10, and
> > > > > > it's not aligned too.
> > > > >
> > > > > No error in that case either, as expected. Given that NET_SKB_PAD is
> > > > > likely to expand to 64, it is likely a DMA buffer overflow which
> > > > > probably only triggers for large-ish packets.
> > > > >
> > > > > Now, we're almost at -rc7, and we don't have a solution in sight.
> > > > >
> > > > > Can we please revert this until we have an understanding of what is
> > > > > happening? I'll hopefully have more cycles to work on the issue once
> > > > > 5.14 is out, and hopefully the maintainers of this driver can chime in
> > > > > (they have been pretty quiet so far).
> > > > >
> > > > > Thanks,
> > > > >
> > > > >         M.
> > > > >
> > > > > --
> > > > > Without deviation from the norm, progress is not possible.
> > > >
> > > > Last try, what about adding only NET_IP_ALIGN and leaving NET_SKB_PAD?
> > > >
> > > > -       return NET_SKB_PAD + NET_IP_ALIGN;
> > > > +       return NET_IP_ALIGN;
> > > >
> > > > I think that alloc_skb adds another NET_SKB_PAD anyway.
> > >
> > > I don't see any packet corruption with this. However, this doesn't
> > > prove that this is correct either. What was the rational for adding
> > > NET_SKB_PAD the first place?
> > >
> >
> > I think it's wrong. The original offset was 0, and to align it to the
> > boundary we need to add just NET_IP_ALIGN, which is two.
> > NET_SKB_PAD is a much bigger value, (I think 64), which is used to
> > reserve space to prepend an header, e.g. with tunnels.
>
> How about the other adjustments that Eric mentioned regarding the size
> of the buffer? Aren't they required?
>

I guess that if stmmac_rx_buf1_len() needed such adjustment, it would
be already broken when XDP is in use.
When you use XDP, stmmac_rx_offset() adds a pretty big headroom of 256
byte, which would easily trigger an overflow if not accounted.
Did you try attaching a simple XDP program on a stock 5.13 kernel?

-- 
per aspera ad upstream

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
