Return-Path: <SRS0=06uo=ND=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B6F9C4338F
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 11:19:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B952160F91
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Aug 2021 11:19:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B952160F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xzjZ8ENJR1zDkowYiBZjKRFcJ8ewP0j3VIpiyQeHpHw=; b=qLnLG72a3TfVmtjm6GGux7iz+p
	hZP8w3UoiAdcpbfeDh5luboWLvWsntDqiDPCQzPlnFcpellbw5R6RiakbaZ7Y757vLJmytivzQ62Q
	H88nZjtnCF383iDBS81VWhTTyu3Z8z2MOQYjzsoC17I5BjmlYAEEssAUR2E5jSS0IjiVdBu8e5TUG
	kKKNYVYF6eZDu4by/l8Wf6zI8nyll5sXJUOUVoYgaz8gdNu04E4j7ymFfng66VXLlIPGuFPHhbNC/
	k1zmLfu+GHcFSU08iUu1JTWIlYr+b5kkQOb3/fpnchoHC/WZStEfRtWGkZsR6IQliilL9RLWe6E6d
	hI4LJjeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mE8kJ-009kkE-IB; Thu, 12 Aug 2021 11:19:35 +0000
Received: from linux.microsoft.com ([13.77.154.182])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mE8kF-009kik-S1
 for linux-riscv@lists.infradead.org; Thu, 12 Aug 2021 11:19:33 +0000
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by linux.microsoft.com (Postfix) with ESMTPSA id B5E7D20C13EE
 for <linux-riscv@lists.infradead.org>; Thu, 12 Aug 2021 04:19:24 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com B5E7D20C13EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1628767164;
 bh=aPwd3twlJLRiZUFCIngPiuLde0SAgrVThrDd2k35pnw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=NLcL5qWFCH2tMkNMMfxsZruq6hPtsol9tREYmHUUXNxI6AlKG+Lm/yO41KiJDCI9K
 +ZgAnCiLzaok4MlA4sSJC5iSDm89lH++Sw8CAUjmY9mIPpJgVkZJqWCNZi4qkb0Xu5
 Jw9cKFNDi2/gi/EnHxFZqJ8fUU/GNbW2MtHw8lWs=
Received: by mail-pl1-f178.google.com with SMTP id a20so6907905plm.0
 for <linux-riscv@lists.infradead.org>; Thu, 12 Aug 2021 04:19:24 -0700 (PDT)
X-Gm-Message-State: AOAM532SwC2NBXgnRYfgzvcZRNAn+EP0nuWOpnyABff7Zjuthr8N/xaf
 Or2yxfp6w4BABRavn6uCbySXVAokgpvQs21ZpmA=
X-Google-Smtp-Source: ABdhPJzWd8kEvYy9tH/IHBkyR9zciGHmNayh6FL82gI1Uy1JILOHNCqGP3dYdAvg3qXPv/SNhL/Tg+7r+zr8evrMONE=
X-Received: by 2002:a17:90a:ad85:: with SMTP id
 s5mr3758064pjq.187.1628767164221; 
 Thu, 12 Aug 2021 04:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210614022504.24458-1-mcroce@linux.microsoft.com>
 <871r71azjw.wl-maz@kernel.org> <YROmOQ+4Kqukgd6z@orome.fritz.box>
 <202417ef-f8ae-895d-4d07-1f9f3d89b4a4@gmail.com>
 <87o8a49idp.wl-maz@kernel.org>
 <fe5f99c8-5655-7fbb-a64e-b5f067c3273c@gmail.com>
 <20210812121835.405d2e37@linux.microsoft.com>
 <874kbuapod.wl-maz@kernel.org>
In-Reply-To: <874kbuapod.wl-maz@kernel.org>
From: Matteo Croce <mcroce@linux.microsoft.com>
Date: Thu, 12 Aug 2021 13:18:48 +0200
X-Gmail-Original-Message-ID: <CAFnufp2=1t2+fmxyGJ0Qu3Z+=wRwAX8faaPvrJdFpFeTS3J7Uw@mail.gmail.com>
Message-ID: <CAFnufp2=1t2+fmxyGJ0Qu3Z+=wRwAX8faaPvrJdFpFeTS3J7Uw@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="0000000000003f456b05c95ae845"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_041932_012693_ACE5209A 
X-CRM114-Status: GOOD (  35.48  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--0000000000003f456b05c95ae845
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 12, 2021 at 1:05 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 12 Aug 2021 11:18:35 +0100,
> Matteo Croce <mcroce@linux.microsoft.com> wrote:
> >
> > On Thu, 12 Aug 2021 10:48:03 +0200
> > Eric Dumazet <eric.dumazet@gmail.com> wrote:
> >
> > >
> > >
> > > On 8/11/21 4:16 PM, Marc Zyngier wrote:
> > > > On Wed, 11 Aug 2021 13:53:59 +0100,
> > > > Eric Dumazet <eric.dumazet@gmail.com> wrote:
> > > >
> > > >> Are you sure you do not need to adjust stmmac_set_bfsize(),
> > > >> stmmac_rx_buf1_len() and stmmac_rx_buf2_len() ?
> > > >>
> > > >> Presumably DEFAULT_BUFSIZE also want to be increased by NET_SKB_PAD
> > > >>
> > > >> Patch for stmmac_rx_buf1_len() :
> > > >>
> > > >> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> > > >> b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c index
> > > >> 7b8404a21544cf29668e8a14240c3971e6bce0c3..041a74e7efca3436bfe3e17f972dd156173957a9
> > > >> 100644 --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c +++
> > > >> b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c @@ -4508,12
> > > >> +4508,12 @@ static unsigned int stmmac_rx_buf1_len(struct
> > > >> stmmac_priv *priv, /* First descriptor, not last descriptor and
> > > >> not split header */ if (status & rx_not_ls)
> > > >> -               return priv->dma_buf_sz;
> > > >> +               return priv->dma_buf_sz - NET_SKB_PAD -
> > > >> NET_IP_ALIGN;
> > > >>         plen = stmmac_get_rx_frame_len(priv, p, coe);
> > > >>
> > > >>         /* First descriptor and last descriptor and not split
> > > >> header */
> > > >> -       return min_t(unsigned int, priv->dma_buf_sz, plen);
> > > >> +       return min_t(unsigned int, priv->dma_buf_sz - NET_SKB_PAD
> > > >> - NET_IP_ALIGN, plen); }
> > > >>
> > > >>  static unsigned int stmmac_rx_buf2_len(struct stmmac_priv *priv,
> > > >
> > > > Feels like a major deficiency of the original patch. Happy to test a
> > > > more complete patch if/when you have one.
> > >
> > > I wont have time in the immediate future.
> > >
> > > Matteo, if you do not work on a fix, I suggest we revert
> > >  a955318fe67ec0d962760b5ee58e74bffaf649b8 stmmac: align RX buffers
> > >
> > > before a more polished version can be submitted.
> > >
> >
> > Better to use stmmac_rx_offset() so to have the correct length when
> > using XDP. Also, when XDP is enabled, the offset was
> > XDP_PACKET_HEADROOM (i.e. 256 bytes) even before the change, so it
> > could be already broken. Mark, can you try on the Jetson TX2 by
> > attaching an XDP program and see if it works without my change?
>
> Sorry, you'll have to hold my hand here, as I know exactly nothing
> about XDP....
>

Attach the attached object with:

ip link set eth0 xdp object passall.o

This is an empty XDP program, its source:

__attribute__((section("prog"), used))
int xdp_main(struct xdp_md *ctx)
{
       return XDP_PASS;
}

Every packet will pass untouched, but the offset will be shifted from
0 to 256 bytes, which could trigger the problem anyway:

> > A possible fix, which takes in account also the XDP headroom for
> > stmmac_rx_buf1_len() only could be (only compile tested, I don't have
> > the hardware now):
>
> However, this doesn't fix my issue. I still get all sort of
> corruption. Probably stmmac_rx_buf2_len() also need adjusting (it has
> a similar logic as its buf1 counterpart...)
>
> Unless you can fix it very quickly, and given that we're towards the
> end of the cycle, I'd be more comfortable if we reverted this patch.
>

Can it be that the HW can't do DMA on an address which is not word aligned?
What if you replace NET_SKB_PAD with, let's say, 8?

Regards,
-- 
per aspera ad upstream

--0000000000003f456b05c95ae845
Content-Type: application/x-object; name="passall.o"
Content-Disposition: attachment; filename="passall.o"
Content-Transfer-Encoding: base64
Content-ID: <f_ks8tusn90>
X-Attachment-Id: f_ks8tusn90

f0VMRgIBAQAAAAAAAAAAAAEA9wABAAAAAAAAAAAAAAAAAAAAAAAAAGABAAAAAAAAAAAAAEAAAAAA
AEAACAABALcAAAACAAAAlQAAAAAAAABHUEwAAAAAABAAAAAAAAAAAXpSAAh8CwEMAAAAGAAAABgA
AAAAAAAAAAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAACwAAAAEAPH/AAAA
AAAAAAAAAAAAAAAAAAAAAAADAAMAAAAAAAAAAAAAAAAAAAAAABUAAAARAAQAAAAAAAAAAAAEAAAA
AAAAAAcAAAASAAMAAAAAAAAAAAAQAAAAAAAAABwAAAAAAAAAAQAAAAIAAAAALnRleHQAeGRwX21h
aW4AcHJvZwBfbGljZW5zZQAucmVsLmVoX2ZyYW1lAGtlcm5lbF9wYXNzYWxsLmMALnN0cnRhYgAu
c3ltdGFiAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAA9AAAAAwAAAAAAAAAAAAAAAAAAAAAAAAAQAQAAAAAAAE0AAAAAAAAA
AAAAAAAAAAABAAAAAAAAAAAAAAAAAAAAAQAAAAEAAAAGAAAAAAAAAAAAAAAAAAAAQAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAAAAAAABAAAAABAAAABgAAAAAAAAAAAAAAAAAAAEAA
AAAAAAAAEAAAAAAAAAAAAAAAAAAAAAgAAAAAAAAAAAAAAAAAAAAWAAAAAQAAAAMAAAAAAAAAAAAA
AAAAAABQAAAAAAAAAAQAAAAAAAAAAAAAAAAAAAABAAAAAAAAAAAAAAAAAAAAIgAAAAEAAAACAAAA
AAAAAAAAAAAAAAAAWAAAAAAAAAAwAAAAAAAAAAAAAAAAAAAACAAAAAAAAAAAAAAAAAAAAB4AAAAJ
AAAAAAAAAAAAAAAAAAAAAAAAAAABAAAAAAAAEAAAAAAAAAAHAAAABQAAAAgAAAAAAAAAEAAAAAAA
AABFAAAAAgAAAAAAAAAAAAAAAAAAAAAAAACIAAAAAAAAAHgAAAAAAAAAAQAAAAMAAAAIAAAAAAAA
ABgAAAAAAAAA
--0000000000003f456b05c95ae845
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--0000000000003f456b05c95ae845--

