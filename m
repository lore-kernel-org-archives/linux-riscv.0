Return-Path: <SRS0=Qta6=KR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16AC2C2B9F2
	for <linux-riscv@archiver.kernel.org>; Sat, 22 May 2021 09:09:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47F0661183
	for <linux-riscv@archiver.kernel.org>; Sat, 22 May 2021 09:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47F0661183
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ioAZT2iSq9dE9pvhqIm3qlOso3D1DYWdb+nW0Odim7A=; b=lUUcV3Xngssfhspmr69pf8NaN9
	N/RA9nFHs1DcXkaam8wHZBJCaz0bFeOgymy4ITxGA5fbES1xlHPz01DWdizrdcL5pBV9mtOWg62GD
	W1I4cNwygo2KepN0fatSrcwGyF8CaYHjRBynBofy1ueZ0vvEtpQ6ehTmOvX0UFncBgZ8PQh2o8uIv
	r/588k3bWhJ61X55A1H0QP0Sjs+NTJKlVvS2OmvMz/H5HIY2Cq2q6LI5MecHOeph6SC31etaD73oO
	moQcX4JNNzur1nw6/i2ZSA45jZZ8luhAbg0Hab788NoKNXVPKa2p2W7nDn47Q15w/8+5ZZ/eIVhN/
	0itLd12Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkNd3-002B1s-3x; Sat, 22 May 2021 09:09:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkNcy-002B1Y-Jg
 for linux-riscv@desiato.infradead.org; Sat, 22 May 2021 09:09:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Sjhn9KsqMSp1BoKveCdWGhZPcyNCbVQ54hN/N+Flmz8=; b=fmsOIY//oFFONMr1H7+nmx+v7G
 k1WQZpiX5VRA78RWF3WQHAQtxsldjfswTBTumlwMRRlnBnzQ1rQ1m1xIm8K8tU5mOiO27vJ3Y3DKP
 UE8/aPVcbeEYOSuHSynpeqhEaoygD83qvayOxH3EDelQhnN922nH6pHjtKMLbGy+sMJ2L0YNSeRIR
 mm6+JQvGIDNBnU9au6AKiHZcyC7F05XxD+sB1BZZOUjJdwNRvuoqYhzWFkhj1/ccrOeIZFBHpl+ar
 i0SJfoww6HCDpeNCwhl0/3xEgAjj7FAOF4yiA9PyOc3a4nzuFX+S0fZupknShsUrESdd5q+qoleAz
 Tj12J8gQ==;
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkNcv-0003hv-Km
 for linux-riscv@lists.infradead.org; Sat, 22 May 2021 09:08:59 +0000
Received: by mail-lf1-x12d.google.com with SMTP id q7so31878719lfr.6
 for <linux-riscv@lists.infradead.org>; Sat, 22 May 2021 02:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Sjhn9KsqMSp1BoKveCdWGhZPcyNCbVQ54hN/N+Flmz8=;
 b=Sp0qZmPnH8CTgJ33JEdEZblBCd762zWSPeMta+JqnDSwHTZwla5JVt+t3WoM1BWw4a
 s9zPlv5ZbbBGPCLnFv48+SbcNwbAMU5v7QftrPcvTSRA8zH3YC8XRur+zaowkQiOIxDm
 blfo/xTPCgGjfYTfe2tsRVTMbb6u2Evs0eiT7U9MsU87tY9TgO+8LGqf5s1nMaVANKH4
 +9OYVp0EOS293bLowRM0pqFr1c2DDiVTQtXQoCSH37ZAcZnPDeuQRqNoP9+Nmd5mGq5F
 6GqjUPW2qVwRvMIcZu/i3p1FfVGUI7qJUq5ejvbvsCb3lfhEcc54hXW2/xQWJ+9x8Ubc
 WdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Sjhn9KsqMSp1BoKveCdWGhZPcyNCbVQ54hN/N+Flmz8=;
 b=VrQ6l3WvvoqQE0MN5N3c+QXZQvCv6Kj8OOgUTMuu2+50Z6gINp0nqMZLfERCz9vF4I
 XmtB2DgQFNeR++lDJ5yEHoEmELkrDtaUCB6AGivTCSRJpnsB97kxj1nhxWoYm/oe6dn0
 JQncggkMmu6vKg1q17R6ej0jiVT5eNnlJGkuouzCdUzX7SUQvicFGen87puIXTVNqfkI
 A+KwBEfFgHLCtpv8Tk8NufASPUVipmvg2c2zCFUprpkINTX+V7FBF0B+gBOV81mSHt2I
 exncFYKwDo1kUVEd4IGzbfMR+x76h1exaSTjD8sSAWtRVPs12r3RJyljnWvSWlO+zV3m
 4yTQ==
X-Gm-Message-State: AOAM533DL7OKlgf5/+RgwMUnXiLh/SnsVFdzWBjmTHNPo1et9VCV8f07
 obI5CewF8qId/8Ca+Jiv0cXC0+r69IGMyOeTm23fdQ==
X-Google-Smtp-Source: ABdhPJxtrujQjxgEQxMgSJcfpFacOYFoG42OqCexmsfy+Er336j/5/HgPfJblbT/bkMk+PuNS27xV+SMGqj60TM1/Fg=
X-Received: by 2002:ac2:5459:: with SMTP id d25mr4999478lfn.560.1621674534622; 
 Sat, 22 May 2021 02:08:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210521124859.101012-1-zong.li@sifive.com>
 <b4088995-605e-85ca-2f07-47d2654ac2c8@gmail.com>
In-Reply-To: <b4088995-605e-85ca-2f07-47d2654ac2c8@gmail.com>
From: Zong Li <zong.li@sifive.com>
Date: Sat, 22 May 2021 17:08:44 +0800
Message-ID: <CANXhq0rQqeGO_LM233bB8Kg5XD_Q7xrtOhVrYeuCxXj29N3+Rg@mail.gmail.com>
Subject: Re: [PATCH] net: macb: ensure the device is available before
 accessing GEMGXL control registers
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: nicolas.ferre@microchip.com, claudiu.beznea@microchip.com, 
 davem@davemloft.net, kuba@kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Andreas Schwab <schwab@linux-m68k.org>, 
 Stephen Boyd <sboyd@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 Michael Turquette <mturquette@baylibre.com>, geert@linux-m68k.org, 
 Yixun Lan <yixun.lan@gmail.com>, netdev@vger.kernel.org, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210522_020857_731813_E9D73037 
X-CRM114-Status: GOOD (  21.27  )
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

On Sat, May 22, 2021 at 12:51 AM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
>
>
> On 5/21/2021 5:48 AM, Zong Li wrote:
> > If runtime power menagement is enabled, the gigabit ethernet PLL would
> > be disabled after macb_probe(). During this period of time, the system
> > would hang up if we try to access GEMGXL control registers.
> >
> > We can't put runtime_pm_get/runtime_pm_put/ there due to the issue of
> > sleep inside atomic section (7fa2955ff70ce453 ("sh_eth: Fix sleeping
> > function called from invalid context"). Add the similar flag to ensure
> > the device is available before accessing GEMGXL device.
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
> >  drivers/net/ethernet/cadence/macb.h      | 2 ++
> >  drivers/net/ethernet/cadence/macb_main.c | 7 +++++++
> >  2 files changed, 9 insertions(+)
> >
> > diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
> > index d8d87213697c..acf5242ce715 100644
> > --- a/drivers/net/ethernet/cadence/macb.h
> > +++ b/drivers/net/ethernet/cadence/macb.h
> > @@ -1309,6 +1309,8 @@ struct macb {
> >
> >       u32     rx_intr_mask;
> >
> > +     unsigned int is_opened;
> > +
> >       struct macb_pm_data pm_data;
> >       const struct macb_usrio_config *usrio;
> >  };
> > diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
> > index 6bc7d41d519b..e079ed10ad91 100644
> > --- a/drivers/net/ethernet/cadence/macb_main.c
> > +++ b/drivers/net/ethernet/cadence/macb_main.c
> > @@ -2781,6 +2781,8 @@ static int macb_open(struct net_device *dev)
> >       if (bp->ptp_info)
> >               bp->ptp_info->ptp_init(dev);
> >
> > +     bp->is_opened = 1;
> > +
> >       return 0;
> >
> >  reset_hw:
> > @@ -2818,6 +2820,8 @@ static int macb_close(struct net_device *dev)
> >       if (bp->ptp_info)
> >               bp->ptp_info->ptp_remove(dev);
> >
> > +     bp->is_opened = 0;
> > +
> >       pm_runtime_put(&bp->pdev->dev);
> >
> >       return 0;
> > @@ -2867,6 +2871,9 @@ static struct net_device_stats *gem_get_stats(struct macb *bp)
> >       struct gem_stats *hwstat = &bp->hw_stats.gem;
> >       struct net_device_stats *nstat = &bp->dev->stats;
> >
> > +     if (!bp->is_opened)
> > +             return nstat;
>
> The canonical way to do this check is to use netif_running(), and not
> open code a boolean tracking whether a network device is opened or not.

Yes, I have tried this and it worked. Let me change it in the next version.

> --
> Florian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
