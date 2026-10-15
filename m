Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BCECC6B2F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 07:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HKn7RN5r+trPZ/wTQeJ3ojdPAaBFwojZtNswiuhUF70=; b=fwV358ljeQh5LC
	1v5z9rawjILZ1eUXvMNcuLbDI8qRm/kwv1gqVNlVpdOzEnBnZOaAPfSwL6vyFL8L9c/TEg/7BYrI8
	d6gSdj1SaYZuGcdSzMJTgPJB9evfi7Qoap4Q6Vanim76ExMO70LHVRIFmQv2udMaC34wwg3uRfLKJ
	bVIZ3fSbXuxnz7FyCPyit0zVIBj1J50lzGA0VEpfdp4Rw4bKGYixPitdnZM5PYgBGauSOeN/Qmvcu
	zdvMYe2k/r33qJA02WL4V+EgnUnHTgyrBlqB+o7BbNngG8eyD3nsf02wCuONL8f20cCkjqLmcb23s
	qDht2QT01SHmas4j7r0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHG8J-0000000H3WR-19hJ;
	Thu, 15 Oct 2026 07:44:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHG8H-0000000H3VJ-1Pxy
	for linux-riscv@bombadil.infradead.org;
	Thu, 15 Oct 2026 07:44:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=MWnD86zYx5Fi/h60ALOJLdZBIY9AH1R0FwDBQQX0QEY=; b=e/c3y1bQgf5dkua1XfHhmvULnG
	adfL23DZOHBNdfkgREYvAEwQzCKaAw6C9C4hsEZqBNfIbEIrh/GLzU0d/3sPloO5sE0ZCDG8UPG2x
	A9IMGiejkXCgFGjcpMFbvSwm4w8uWa5IU5wJPCQ31jyx8C3u2JBrVzbwEcDiaTbW0otOg1qi0zxvc
	rkVboKrr0UZi7wM/FnVYqPJyypatE0taMWDma8D85aaIlqBp39vj7SAfr21oTzMwSRckL6w1cZUa7
	FuSkV5p8Jc3PO67gCYp3dZKD0g9q3PVOJ3eJ3yuUHl7XlB5atC4iqtO5sbhtA+5ph4jAoGe00iZOC
	VkBe7Ntg==;
Received: from mail-vk1-f182.google.com ([209.85.221.182])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHG82-0000000Hajx-1Paw
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 07:44:06 +0000
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5e948e56b9dso1511887e0c.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 00:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050232; x=1792655032;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MWnD86zYx5Fi/h60ALOJLdZBIY9AH1R0FwDBQQX0QEY=;
        b=26YK837yK3dk9dDE8NVIa3fhxjMgVtHvH3Vtqw3i6rO53cvyurfMuIQV8du4MlMpKy
         n4rv/U5IO9/tkMwJ2w5qaCALIeaH4wsi+MgSSTbtEKFY3o9Oe9d7xB7hPfYSiaFv2ucQ
         GZNLf7LosAMprTEF+WeH1QGKTeCtpC7SgDTSKBN7fjzpqnYyDYcStRDmb0lz2HYg4Iww
         xijN1cvkhUOfppjMYYuiY/LpWcfpNpIviCTp6/dleIsQdn3ztVRtvmm2zNfVg9eTmdhl
         9et9QeWC4dzub9Jix2XCWMiMOi5jl7iJWCHgNcZP0tcWVUqoULxF1RvUEqwc2lF6dEPO
         2Haw==
X-Forwarded-Encrypted: i=1; AKwUvBxPaMf3hG4hYQ/KAHi/ksvWLPm7tTMW+OCXcASYXrfaPyvq3jplWrRVWYNGUn3gzha1gr01xemQdu3gJA==@lists.infradead.org
X-Gm-Message-State: AFq9FYIhxeIQYZ6usK3j4/RdzhKhVUk7/7yGmfWo6odY0VwmJxitvV2V
	eAHnFeqFBoIb2ZtU/N8nLKu7JBj/c4wASYltyzjVtMEpyokTS1Hd/KEBTf/7nR5RA8A=
X-Gm-Gg: AYBFou3BOoQzSV8OsiP71qlwK5tOLJK4eUD1E+sy5V5HYrUKt2tofkBeUhfoQ2ZM/88
	WtoOXqa/kIE6y2+R7QPEQ3UlugTKrtT0QjmQB4L5kEZY//9LtymI8ihCtxU4lO4BHuBV1R0mm59
	+yRcZShVnUj4a4bHbVw9cF21OOoJOLgK5jmM36tG8q+qDuZ68UVhXN866llCZZnM7joH5bh4b99
	H/8ndVu19h8O31pzy+igsJF0JRZQIiJcNsJMbS4bLvITX0snxyv9cvJAfHhGu4b4Ex5jW/nJiQp
	gCxDDvbm7/h/BkCsNIwkvTrjaLUPm5ZzuHKxXYxXPqnlY28EmEz20sD4PRpf1/0SfXGq7q/Leen
	ke5brK2yND3I8Oal93zFL2mNkW/fSZ1Xg0iz1mYlZof3hVkeg4nVIqeOmMHsMY6/qxc+v49nRxQ
	V5158P6G1sjNxJWxZbct1Ojva5QS8783/UJKvjWPepcrSLq7fxbq0kZQZWbgan9+pkZdxpRPe/A
	mqFvY5SpT08g9BvU/cftddDBHwyZBuRMsobWrqpLY+r9xMZuws=
X-Received: by 2002:a05:6102:441f:b0:7bf:74c1:b606 with SMTP id ada2fe7eead31-7cb373f6b7fmr4925027137.34.1792050232026;
        Thu, 15 Oct 2026 00:43:52 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cb35471536sm12860664137.11.2026.10.15.00.43.51
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 00:43:51 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5e948e56b9dso1511884e0c.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 00:43:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByiiLP+h0QTs+IVtwjzuBDeEf2dZXBg/y4Ajdlook66aMMqEPcldsvj3kaOL5s8/s2HnpkmDxvboHvnlg==@lists.infradead.org
X-Received: by 2002:a05:6122:e227:b0:5d7:2918:c644 with SMTP id
 71dfb90a1353d-5e91f467355mr5297458e0c.7.1792050231577; Thu, 15 Oct 2026
 00:43:51 -0700 (PDT)
MIME-Version: 1.0
References: <1b1ca4208d725ae0bb834a61636e48728d79cf80.1791973171.git.geert+renesas@glider.be>
 <atAQAI0WWtwh8kvf@xhacker>
In-Reply-To: <atAQAI0WWtwh8kvf@xhacker>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 15 Oct 2026 09:43:40 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWB+Aj7HK3YaHgo8VcypBamN9Yqi-M8WYtKpRu+ZG7yFA@mail.gmail.com>
X-Gm-Features: AclHuK_NnFzMt1DDd6TB7oeGfNmK13LCeslMF3_46vtqG5udz87FbhnlGksCQmQ
Message-ID: <CAMuHMdWB+Aj7HK3YaHgo8VcypBamN9Yqi-M8WYtKpRu+ZG7yFA@mail.gmail.com>
Subject: Re: [PATCH] riscv: RISCV_ISA_SV48 and RISCV_ISA_SV57 should depend on MMU
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_084404_468406_74199F56 
X-CRM114-Status: GOOD (  25.92  )
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

Hi Jisheng,

On Thu, 15 Oct 2026 at 01:48, Jisheng Zhang <jszhang@kernel.org> wrote:
> On Wed, Oct 14, 2026 at 12:20:39PM +0200, Geert Uytterhoeven wrote:
> > These options are irreleant for nommu systems.
> >
> > Fixes: 36de74049ec8cb1a ("riscv: introduce RISCV_ISA_SV48 and RISCV_ISA_SV57")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -605,7 +605,7 @@ config RISCV_ISA_SSQOSID
> >
> >  config RISCV_ISA_SV48
> >       bool "Page-Based 48-bit Virtual-Memory System"
> > -     depends on 64BIT
> > +     depends on 64BIT && MMU
> >       default y
> >       help
> >         Add support for the Page-Based 48-bit Virtual-Memory System.
> > @@ -617,7 +617,7 @@ config RISCV_ISA_SV48
> >
> >  config RISCV_ISA_SV57
> >       bool "Page-Based 57-bit Virtual-Memory System"
> > -     depends on 64BIT
> > +     depends on 64BIT && MMU
>
> hmm, I think we also need to make RISCV_ISA_SV57 depend on
> RISCV_ISA_SV48. Otherwise, there's a case: RISCV_ISA_SV57 &&
> !RISCV_ISA_SV48. Human won't make this wrong combination, but
> the random config can.

Is that really an issue?
If I build a kernel for an SV57-system, do I really need to enable
support for SV48, too? It builds fine without...

> with that change,
> Reviewed-by: Jisheng Zhang <jszhang@kernel.org>

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
