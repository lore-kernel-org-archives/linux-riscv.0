Return-Path: <SRS0=APW5=NL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE12C4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Aug 2021 16:39:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0F6861130
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Aug 2021 16:39:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B0F6861130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DzLLOLBqjzwRt/q9Qlz7e8jQRUdlgZwMrWxKLMd1zUw=; b=Fcnjnt5VzuBLTy
	MrIQ23YGz4o9xUiwZcc9GTkWmU7bnq4PKON+l3OYRs09P3HFB6RH9x8csfamnwY3jD7GqQnwRkn19
	AxPOYdWPITvHY1dpDOPhcs6QFlI9YXNaIHrsxghdyguw57SjyECC/neCu6AD6iPSnP1GF9pOG+DQ4
	C9s59V+JV7H36vTClUm/XN70ofCFlLNRDPx7n0x/P6ToVDUd/1fcZyq5TYhSPyjd6UPQWhbGvrfz+
	9p2cFbvwKOgEEGeqDToQMlLtxHSj6S9CEckthF8pbY/pfky62IUXXxXRfwno90bm/1WYcbmLhdpUm
	1uHWt/GwA+VvQv/gBwYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH7Xj-00BeaA-Fe; Fri, 20 Aug 2021 16:38:55 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH7Xg-00BeZa-SM
 for linux-riscv@lists.infradead.org; Fri, 20 Aug 2021 16:38:54 +0000
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by linux.microsoft.com (Postfix) with ESMTPSA id 312AC20C33D5
 for <linux-riscv@lists.infradead.org>; Fri, 20 Aug 2021 09:38:51 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 312AC20C33D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1629477531;
 bh=WaK5G/evZ18+jqtp1X6uZFuicVOVUnSl34NTPmE/jIc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=eYmin74tZXjXnVDwQL3iH5Eaw5f/w7gQT7W/KU38DOtTsgd2G5d1u5Wthggk5RarQ
 z/iWL/PT4rXm+b4YsDV6UYHIDqYl5ahnIDmZHXGMDuQt5aK6SpqZKhiz5zudBiVGMS
 uO13TbWtoDrh2RSHx77oe+pIl8wmdMbpKXK7GBn4=
Received: by mail-pg1-f176.google.com with SMTP id q2so9691537pgt.6
 for <linux-riscv@lists.infradead.org>; Fri, 20 Aug 2021 09:38:51 -0700 (PDT)
X-Gm-Message-State: AOAM53113gTEYAh9vEgeEtDmEjzHvAgI2Fh3B6iwm7LdQoOV+bg+ZGVs
 NmMTQ+JWWr6PkzB0BNrwg0tSTlcQLGaC0khvml0=
X-Google-Smtp-Source: ABdhPJx3t4f1Aul2iRUkWWLv3zwPwQq7eYRa/ej0J4paFUQ0VObfABymqJHmf3UIvGM0woTmJGTNFo/Db/gQBzQO+1c=
X-Received: by 2002:a63:1422:: with SMTP id u34mr1216269pgl.326.1629477530715; 
 Fri, 20 Aug 2021 09:38:50 -0700 (PDT)
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
In-Reply-To: <87fsv4qdzm.wl-maz@kernel.org>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Fri, 20 Aug 2021 18:38:14 +0200
X-Gmail-Original-Message-ID: <CAFnufp2T75cvDLUx+ZyPQbkaNeY_S1OJ7KTJe=2EK-qXRNkwyw@mail.gmail.com>
Message-ID: <CAFnufp2T75cvDLUx+ZyPQbkaNeY_S1OJ7KTJe=2EK-qXRNkwyw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210820_093853_013577_4AC6DD00 
X-CRM114-Status: GOOD (  27.94  )
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

On Fri, Aug 20, 2021 at 6:26 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 20 Aug 2021 11:37:03 +0100,
> Matteo Croce <mcroce@linux.microsoft.com> wrote:
> >
> > On Thu, Aug 19, 2021 at 6:29 PM Marc Zyngier <maz@kernel.org> wrote:
>
> [...]
>
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> > > index fcdb1d20389b..244aa6579ef4 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> > > @@ -341,7 +341,7 @@ static inline unsigned int stmmac_rx_offset(struct stmmac_priv *priv)
> > >         if (stmmac_xdp_is_enabled(priv))
> > >                 return XDP_PACKET_HEADROOM + NET_IP_ALIGN;
> > >
> > > -       return NET_SKB_PAD + NET_IP_ALIGN;
> > > +       return 8 + NET_IP_ALIGN;
> > >  }
> > >
> > >  void stmmac_disable_rx_queue(struct stmmac_priv *priv, u32 queue);
> > >
> > > I don't see the system corrupting packets anymore. Is that exactly
> > > what you had in mind? This really seems to point to a basic buffer
> > > overflow.
>
> [...]
>
> > Sorry, I meant something like:
> >
> > -       return NET_SKB_PAD + NET_IP_ALIGN;
> > +       return 8;
> >
> > I had some hardware which DMA fails if the receive buffer was not word
> > aligned, but this seems not the case, as 8 + NET_IP_ALIGN = 10, and
> > it's not aligned too.
>
> No error in that case either, as expected. Given that NET_SKB_PAD is
> likely to expand to 64, it is likely a DMA buffer overflow which
> probably only triggers for large-ish packets.
>
> Now, we're almost at -rc7, and we don't have a solution in sight.
>
> Can we please revert this until we have an understanding of what is
> happening? I'll hopefully have more cycles to work on the issue once
> 5.14 is out, and hopefully the maintainers of this driver can chime in
> (they have been pretty quiet so far).
>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

Last try, what about adding only NET_IP_ALIGN and leaving NET_SKB_PAD?

-       return NET_SKB_PAD + NET_IP_ALIGN;
+       return NET_IP_ALIGN;

I think that alloc_skb adds another NET_SKB_PAD anyway.

-- 
per aspera ad upstream

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
