Return-Path: <SRS0=APW5=NL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C88A2C4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Aug 2021 18:09:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8311761056
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Aug 2021 18:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8311761056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Subject:Cc:To:From:Message-ID:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z4kBG+Q+zsW8Z+YqVwVg8nWYTV/jtHUdWcYEzsInSXY=; b=GhfZ+FqVIV2/q8
	Je/YRPafujW40jGJLwHXSBxtR6M+7tVkm/AW/pS76m9/3jvRcgt7RP/WoC+8FjCH4FscssQ+IWZR0
	q6uL8+hlFT5DZHTuqXhf9GZpo9r1RCpDBLGYli8gYr2MuGCd00QySdsc6w3uoLiS0VX4mqYSimblq
	oc3QZP7mGwzB/zpFP1hqSud9LRHb85PlwuOgZ/e6q195uB2ZmswyhgzKxMEOSQnnwTi9Eq8a9A+dO
	AuaeBlUBnxk4Kpg3hmWRrUaKAGuB1HfXt63S2gVkHHwuDN6cd3S9TsoyJ2pXzFT8r/75EY4iwtCAG
	MNRqQxkTIT25cSsW5iPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH8x5-00Bo3Q-1M; Fri, 20 Aug 2021 18:09:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH8x1-00Bo2o-T4
 for linux-riscv@lists.infradead.org; Fri, 20 Aug 2021 18:09:09 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7787560F11;
 Fri, 20 Aug 2021 18:09:07 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64]
 helo=wait-a-minute.misterjones.org)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1mH8wz-006Ff6-Ej; Fri, 20 Aug 2021 19:09:05 +0100
Date: Fri, 20 Aug 2021 19:09:04 +0100
Message-ID: <87eeaoyon3.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Matteo Croce <mcroce@linux.microsoft.com>
Cc: Eric Dumazet <eric.dumazet@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>, netdev@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Drew Fustini <drew@beagleboard.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Jon Hunter <jonathanh@nvidia.com>,
 Will Deacon <will@kernel.org>
Subject: Re: [PATCH net-next] stmmac: align RX buffers
In-Reply-To: <CAFnufp2qFuhMDae20u_dV+aOPfB+zpcEK8D-=8ACE6r4kDn2rw@mail.gmail.com>
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
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: mcroce@linux.microsoft.com, eric.dumazet@gmail.com,
 thierry.reding@gmail.com, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, peppe.cavallaro@st.com,
 alexandre.torgue@foss.st.com, davem@davemloft.net, kuba@kernel.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, drew@beagleboard.org,
 kernel@esmil.dk, jonathanh@nvidia.com, will@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210820_110908_012084_304D7CB6 
X-CRM114-Status: GOOD (  29.39  )
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

On Fri, 20 Aug 2021 18:56:33 +0100,
Matteo Croce <mcroce@linux.microsoft.com> wrote:
> 
> On Fri, Aug 20, 2021 at 7:51 PM Marc Zyngier <maz@kernel.org> wrote:
> >
> > On Fri, 20 Aug 2021 18:35:45 +0100,
> > Matteo Croce <mcroce@linux.microsoft.com> wrote:
> > >
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

I have no idea. Honestly, you are the one who should be able to answer
these questions, given that you should have worked out how the buffer
allocations work in this particular driver.

This whole "let's try another random set of values until something
sticks" is not how things ought to be done, and doesn't fill me with
the utmost confidence that 5.14 (which apparently may well be cut in
*two days*) is going to have a solid stmmac driver.

I re-re-request that this patch gets reverted until you figure out
what is wrong with the initial patch.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
