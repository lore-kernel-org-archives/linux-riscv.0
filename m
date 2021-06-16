Return-Path: <SRS0=JO3K=LK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC0CC48BE6
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 22:56:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B713A60FE6
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jun 2021 22:56:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B713A60FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8KgOpKpx1L63n+M8GWPfQcVXCiXKuYhWVDLaVhgg+WQ=; b=BaCnYj0ZLnq56y
	M2J205XsOMFCMPi38fPgkCvhuWVasv45CURNVlhTYNtSq2Uluanyca40HWEKlfFBu1gvLlax4QuFI
	cOpYpJ7wrAVkyYUMjL0h4AH+piwAp++y5hFHrq2cylz5b9YmmWzsQnKjA8TBYWF8ACsFLKsgWJtMW
	G1z+BxobydGscwhMNIRkMkUmna9MrQhw5dYYWxrJCLaNttJ7jIn+9AXdgsnAsp4h5E9OhLxNfw0SA
	Sziwh+Pd96PbmaBuiK18PxkKYgCQNa/YZkk+JNcreAr9YJFA58Bi9Xd1OVgYmKWZW4iyZQmlsnx3F
	/G6NUnhhs3B6bckP8qRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lteSM-007x51-TJ; Wed, 16 Jun 2021 22:56:22 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lteSK-007x4A-2G
 for linux-riscv@lists.infradead.org; Wed, 16 Jun 2021 22:56:21 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id q21so5345426ybg.8
 for <linux-riscv@lists.infradead.org>; Wed, 16 Jun 2021 15:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1ktzrciVp8PDUDyfHCUWiDdgZR3bBYVG0fuSDVfTYG0=;
 b=qKOD10Tgu4BRblFOlZbhaFW8lYbpgeWnzioSB3cfKLCk1QQxWR0r774hpSmbGWafHU
 5O6hR7JijyPFHeyIK4QbOX1EQrTcNs7F7UPMv4X0Lr61la5R1lMlkosh9L1qRqv8RaW7
 JJRSCxMHgLVYrkRC0i+0apZT7KNQy8afKnvH2ZymKlehT+Bs1hvm8+8YMnGOvNbgvcx3
 H3zweqdOJke4rT5iSW7mXpdDDSuS5JUapjcq83M2LL5TC8i65qsTJd/rOli0yC5HYeFN
 IyOQ7Kq/E75TiHH6nQFZxzbSchiGG5KFhmw6ppI555KMdYPlozEdW5REX1ALnr1WF9xx
 3h4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ktzrciVp8PDUDyfHCUWiDdgZR3bBYVG0fuSDVfTYG0=;
 b=DhseyKacVJBrvQ7sUURZ7C3gMXetGrCdCJd+Yq7eInxRAw6COBHsirEwAPd56x1yzV
 6AoA8XPU/5Y/k8uQNU9LoBNkc81kiwrEVJlZfkNO+VnQ8cY3ubIhp7aYBYWNAY3ZUiIW
 1JXtaJgCYdM6YSfTJho/VWflFcYeqx4eFbFnClWfd09BXs8bTSVCu8/iXsABDJNPoUAK
 hp4SGbSnf4FCDEKbXD9CN/StEkIfia/FdvNYPMRlt0BLa07+Q6T6uO37eEFC4egAdjqM
 TkJSOn8NFZZMK9LXwxpAM4+D6zrAlCXFlv1+XTsbMOhxoKDucFv1drcpOUjtIbhBRenP
 8tDg==
X-Gm-Message-State: AOAM533Uz55/vuigMs6D+T4jIYkndJr0ElLwxVcKXqnILLXTxsPZqGZm
 UgiEHdfJCMg+WC6X15ke4VBlI7gP2nnEDEOqC7o=
X-Google-Smtp-Source: ABdhPJy2bYjcw+GuihyRCyKaLF4ubMehx74EDGkm1MsIat5q4cEpt8wfuO31nYmDN5SMlLzYIE7y12qKOEMMqbKltO4=
X-Received: by 2002:a25:cf8f:: with SMTP id f137mr1995862ybg.314.1623884178196; 
 Wed, 16 Jun 2021 15:56:18 -0700 (PDT)
MIME-Version: 1.0
References: <1592308864-30205-1-git-send-email-yash.shah@sifive.com>
 <1592308864-30205-3-git-send-email-yash.shah@sifive.com>
 <CAEUhbmXKdukBwd0OL2ApOD67aQ9ytSPns3z=COtXTSP_mm3wvQ@mail.gmail.com>
 <CAEn-LToZODMPLpsbKJcJXpksJSxTk0WSNpaR9N7uMekNriC+bg@mail.gmail.com>
In-Reply-To: <CAEn-LToZODMPLpsbKJcJXpksJSxTk0WSNpaR9N7uMekNriC+bg@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 17 Jun 2021 06:56:06 +0800
Message-ID: <CAEUhbmUUCprZ20rUUsiM4YWgH=WKsUh_WqnxXbyB7jQqdQB9Hw@mail.gmail.com>
Subject: Re: [PATCH 2/3] riscv: dts: fu540-c000: define hart clocks
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
Cc: Yash Shah <yash.shah@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, 
 Sachin Ghadi <sachin.ghadi@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Green Wan <green.wan@sifive.com>, Atish Patra <atish.patra@wdc.com>, 
 Anup Patel <anup@brainfault.org>, Alistair Francis <alistair.francis@wdc.com>,
 lollivier@baylibre.com, deepa.kernel@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_155620_147234_35D1B9B9 
X-CRM114-Status: GOOD (  18.64  )
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

On Wed, Jun 16, 2021 at 11:14 PM David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:
>
> On Wed, Jun 16, 2021 at 6:17 AM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > On Tue, Jun 16, 2020 at 8:01 PM Yash Shah <yash.shah@sifive.com> wrote:
> > >
> > > Declare that each hart defined in the FU540 DT data is clocked by the
> > > COREPLL. This is in preparation for enabling CPUFreq for the
> > > FU540-C000 SoC on the HiFive Unleashed board.
> > >
> > > Signed-off-by: Yash Shah <yash.shah@sifive.com>
> > > ---
> > >  arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > >
> >
> > Any idea of why this patch was not applied?
>
> There was a decision not to upstream CPUFreq stuff for Unleashed thus
> the whole series probably was abandoned. Not all Unleashed can operate
> in a stable way at 1.4GHz. IIRC other issues could exist. See Palmer
> reply for the whole series.

Thanks, but the DT change is still valid, and should be upstreamed.

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
