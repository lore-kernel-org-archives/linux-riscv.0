Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4C1C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Nov 2022 16:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iUJ55sfIVhHvNBiolriL3bEckvt5+dEps+gFReHSRfY=; b=ldFG2wU8gXFtfD
	18csifrYzwcoN5lyAwyv6zCZZSRK/LXKprJOPLwcIcKbWWuRZn72rqmgb2OmxMWFjTi2SOI3juhZ2
	HiMa5h1FTPK2D0wrdPw5SjCHQTu22r1Z+xNAXh32Q+mEw7dK239vbDe9iOYA4byrM/p16IWrCf22j
	G3gHWp7Yw+KGDywldUHKkFdWBl8CQCE2o9hQG9AH+tV3GPqo2APdnkq7XCTMDYF4KWTkNxoyjDDi4
	qGtr4iX2ucpyKqGbnd+dT5JX6XniekwCZga3ygVqFpkJ0OS4Ys/sCtOJWf+P4vsm8af6QDaN/zQXb
	AFWCktjSpKZL3fiLBx9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otAFc-0076Bt-Jb; Thu, 10 Nov 2022 16:18:00 +0000
Received: from mail-qt1-f172.google.com ([209.85.160.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otAFW-00766q-PF
	for linux-riscv@lists.infradead.org; Thu, 10 Nov 2022 16:17:59 +0000
Received: by mail-qt1-f172.google.com with SMTP id a27so1171758qtw.10
        for <linux-riscv@lists.infradead.org>; Thu, 10 Nov 2022 08:17:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6MJ9qt3ttdnADO10aIiv9hXi2PKgV5UbNwkReeDt/YY=;
        b=p1T2vqMClQWp8A8q9L0GUySHACGziZiYGepej+XIcdat4pEB1awiD1oTFljC7bQ7lH
         mwO2Qe4/My3yDovR7QR2mV+FOoczS+Cx0wM6SD+bcJjzePcW6wzBwig/31+oVBAdXP9V
         cwgJGaN2Znf0uYKdaESxIpgwqkfLorchIEeJyAlEPs1+YTRvWwCybGaCjtgRJgiM1faH
         5qm3xW7Cy9htLEdAbYeBfP943OByx6qWM3bNsOPbdX9JA7h0oIx48qCfaCJHBWotOHaL
         L9wdQ7jS92xOL2T5aL72SQ4gI4xUVzSKl9l+ZQvNNvp/sWV2tkWmRS0TE+wBYWuO8qKQ
         HANg==
X-Gm-Message-State: ACrzQf1VEZA4kZQRP7i7wC7kSJHhUimqvxuyYJDqyuZxQqx9q6BlQBsA
	iQk0hMN3w67w3UtIK0XQ9H2ArJzpuVhNVQ==
X-Google-Smtp-Source: AMsMyM5iZZ/TorWnTqdbJOlecKjnifa+9R5TXEqNRjvacEFLH3RoKXKevnQoN0VSNgQ/Xl5JxHWdyQ==
X-Received: by 2002:a05:622a:5810:b0:3a5:1fa1:f2 with SMTP id fg16-20020a05622a581000b003a51fa100f2mr1366337qtb.91.1668097063044;
        Thu, 10 Nov 2022 08:17:43 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id a185-20020ae9e8c2000000b006fa0d98a037sm12934500qkg.87.2022.11.10.08.17.41
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 08:17:41 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id e68so58073ybh.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Nov 2022 08:17:41 -0800 (PST)
X-Received: by 2002:a25:6b07:0:b0:6cd:3a43:bfe5 with SMTP id
 g7-20020a256b07000000b006cd3a43bfe5mr52209529ybc.89.1668097061150; Thu, 10
 Nov 2022 08:17:41 -0800 (PST)
MIME-Version: 1.0
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <mhng-563fb6cf-4505-4137-8da1-13f631e1c74f@palmer-ri-x1c9a> <Y2wZvZLAENWh6qvs@spud>
In-Reply-To: <Y2wZvZLAENWh6qvs@spud>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 10 Nov 2022 17:17:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXtq67krGy++7y+x7jOTerZYpCfcJEY+nMpW=otGx8bSQ@mail.gmail.com>
Message-ID: <CAMuHMdXtq67krGy++7y+x7jOTerZYpCfcJEY+nMpW=otGx8bSQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] Add support for Renesas RZ/Five SoC
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, prabhakar.csengg@gmail.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, magnus.damm@gmail.com, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de, 
	Conor Dooley <conor.dooley@microchip.com>, guoren@kernel.org, anup@brainfault.org, 
	Atish Patra <atishp@rivosinc.com>, heinrich.schuchardt@canonical.com, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_081754_843128_77BF643E 
X-CRM114-Status: GOOD (  32.10  )
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

Hi Conor,

On Wed, Nov 9, 2022 at 10:21 PM Conor Dooley <conor@kernel.org> wrote:
> On Wed, Nov 09, 2022 at 11:55:24AM -0800, Palmer Dabbelt wrote:
> > On Fri, 28 Oct 2022 09:59:14 PDT (-0700), prabhakar.csengg@gmail.com wrote:
> > > Lad Prabhakar (7):
> > >   dt-bindings: riscv: Sort the CPU core list alphabetically
> > >   dt-bindings: riscv: Add Andes AX45MP core to the list
> > >   riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option
> > >   riscv: dts: renesas: Add initial devicetree for Renesas RZ/Five SoC
> > >   riscv: dts: renesas: Add minimal DTS for Renesas RZ/Five SMARC EVK
> > >   MAINTAINERS: Add entry for Renesas RISC-V
> > >   riscv: configs: defconfig: Enable Renesas RZ/Five SoC
>
> > Geert was mentioning taking these though one of his trees, that works for me
> > so
> >
> > Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Series queued in renesas-devel for v6.2, spread across a few existing
and new branches to be pulled by soc, taking into account dependencies.

> > Happy to do a shared tag or whatever, but I think we can just skip that
> > here.  The only conflicts would be defconfig and Kconfig.socs, but I don't
> > think anything big is in the works for either -- unless Conor was planning
> > on re-spinning that Kconfig.socs rework?
>
> Uh, nah. I've got a wee bit (the removal of selects) that is "ready" but
> there's zero urgency so it can wait for after v6.2-rc1. I don't think
> it'd conflict anyway. The rest of it I need to sort out a v1 of, but I've
> been distracted. Should be safe to take the defconfig & Kconfig.socs stuff
> in terms of me doing anything.
>
> Geert, would you be able to apply the first two patches on top of
> v6.1-rc1 just in case, as you mentioned previously, it needs to become
> part of a shared branch? Seems unlikely at this point in the cycle
> though.

The bindings are in the existing renesas-dt-bindings-for-v6.2 branch,
which is based on v6.1-rc1, and only had RZ/Five related commits anyway.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
