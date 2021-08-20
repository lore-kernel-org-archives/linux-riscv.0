Return-Path: <SRS0=APW5=NL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC1C7C4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Aug 2021 18:15:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70F7D61101
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Aug 2021 18:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 70F7D61101
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H9hhz9ikNWk+xqJOB70Kbz3A1+S4+jyuE4RPudInkec=; b=WyKuZ8t+COOR6j
	iZApUbZnmdtccnZTETQqjf/d1ID5Xp0TNjtk2OOvGcBS3Jc/iXl7Fju9ja8ImEGfxIEuN9RlkrfCs
	ueh8jaHKjYQk+fo4B34pb+yJUj2ajnehh2uXBz4BOK5Ib2VLNV/ZZlEyEMtgbzL05oK9mQH2+3Ino
	Z/avmMPkNUMu8yk59S0du4iklFn87B4P28kMM91mMXAPSoWeM3SuUI8b5t5RCp5wXSwmGZreYYOy0
	YKzPUygB7+RRIUivwXHcTo5aRqMOlnwOwQ6gjeiNPY5RkvMe2e0JCd+gi6D3Zkk0zazBo2NSqrp+P
	QXW49TxYWY8JaeXO6Gyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mH92k-00BoMU-JT; Fri, 20 Aug 2021 18:15:02 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mH92h-00BoLh-UR
 for linux-riscv@lists.infradead.org; Fri, 20 Aug 2021 18:15:01 +0000
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by linux.microsoft.com (Postfix) with ESMTPSA id 3442E20C33D5
 for <linux-riscv@lists.infradead.org>; Fri, 20 Aug 2021 11:14:59 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 3442E20C33D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1629483299;
 bh=UW5TElFP/RTBb2KKkUeXBfbuUlBUxtX/AtHK8rIv3Q4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aNmfrAPThbvUKjB9EGI1zxxmKNepmRru9jyeoYK8nXHg6Q2RedfVl5EcB1xemLSaq
 DbQTnbHXVHXWwEAQY9Q4/D8tVgWkuQDpi7Uyf4x+9DFulxTyFoOuFttTVtjWhiebGj
 oIxl9oP+FT3euE8AmTTye79Si6UnS8W8HqK37XuM=
Received: by mail-pg1-f173.google.com with SMTP id y23so9971779pgi.7
 for <linux-riscv@lists.infradead.org>; Fri, 20 Aug 2021 11:14:59 -0700 (PDT)
X-Gm-Message-State: AOAM532LXQqV0WCGtLJbMywfLX88VSUq66cnYEeoqD6ZyVf6CUnuw74G
 Tv9nPQXFS/yyUYf577MkFfqjg8BdeynbW83tMj4=
X-Google-Smtp-Source: ABdhPJxNyaoyJdeQdc0Du7UXqISNDylKZ5mZPUA04QcpgA8wWE4WpdOtzpukf9L0Qf4T9l50VfZH0RRUbWQzCTuSvZ0=
X-Received: by 2002:a05:6a00:225c:b0:3e1:a127:dd96 with SMTP id
 i28-20020a056a00225c00b003e1a127dd96mr21298632pfu.0.1629483298725; Fri, 20
 Aug 2021 11:14:58 -0700 (PDT)
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
 <87eeaoyon3.wl-maz@kernel.org>
In-Reply-To: <87eeaoyon3.wl-maz@kernel.org>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Fri, 20 Aug 2021 20:14:22 +0200
X-Gmail-Original-Message-ID: <CAFnufp22=M0NRvaAcXgfUVzA2HNFLwxO6Bwp+GZk56S3ycLbNQ@mail.gmail.com>
Message-ID: <CAFnufp22=M0NRvaAcXgfUVzA2HNFLwxO6Bwp+GZk56S3ycLbNQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210820_111500_073033_EF08F140 
X-CRM114-Status: GOOD (  30.20  )
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

On Fri, Aug 20, 2021 at 8:09 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Fri, 20 Aug 2021 18:56:33 +0100,
> Matteo Croce <mcroce@linux.microsoft.com> wrote:
> >
> > On Fri, Aug 20, 2021 at 7:51 PM Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Fri, 20 Aug 2021 18:35:45 +0100,
> > > Matteo Croce <mcroce@linux.microsoft.com> wrote:
> > > >
> > > > > > I think it's wrong. The original offset was 0, and to align it to the
> > > > > > boundary we need to add just NET_IP_ALIGN, which is two.
> > > > > > NET_SKB_PAD is a much bigger value, (I think 64), which is used to
> > > > > > reserve space to prepend an header, e.g. with tunnels.
> > > > >
> > > > > How about the other adjustments that Eric mentioned regarding the size
> > > > > of the buffer? Aren't they required?
> > > > >
> > > >
> > > > I guess that if stmmac_rx_buf1_len() needed such adjustment, it would
> > > > be already broken when XDP is in use.
> > > > When you use XDP, stmmac_rx_offset() adds a pretty big headroom of 256
> > > > byte, which would easily trigger an overflow if not accounted.
> > > > Did you try attaching a simple XDP program on a stock 5.13 kernel?
> > >
> > > Yes, as mentioned in [1], to which you replied...
> > >
> > >         M.
> > >
> > > [1] https://lore.kernel.org/r/87wnohqty1.wl-maz@kernel.org
> > >
> >
> > Great.
> > So I doubt that the adjustment is needed.
> > Does it work with all the frame size?
>
> I have no idea. Honestly, you are the one who should be able to answer
> these questions, given that you should have worked out how the buffer
> allocations work in this particular driver.
>
> This whole "let's try another random set of values until something
> sticks" is not how things ought to be done, and doesn't fill me with
> the utmost confidence that 5.14 (which apparently may well be cut in
> *two days*) is going to have a solid stmmac driver.
>
> I re-re-request that this patch gets reverted until you figure out
> what is wrong with the initial patch.
>
> Thanks,
>

I would have done it, but I'll not have the hardware until next week at least,
otherwise I'd have tried all these tests myself.

I'm sure that NET_SKB_PAD doesn't need to be there, if just removing
it fixes the problem, consider applying it and put a Fixes tag.

-- 
per aspera ad upstream

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
