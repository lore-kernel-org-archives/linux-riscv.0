Return-Path: <SRS0=HNmv=LB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E681EC47082
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 06:41:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3267611CE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 06:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3267611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vM5zdkqSwZahVnGLUZqz1Hrj3lAj+qa8S+5fSkUfbjs=; b=nrJctYYFnYI+xv
	BC7cD4LG+rS0kDUVqsyGZEWTAPXnYlgRc/Z24tgIuJToNTVL+Ji+huI48ePrcO2O08pKNuoi/NhHh
	8hYcJ9tYRQChvadQsH7T5QuBGv0m65fawf8BroK4U4kkuOdxS+YI1DPzXdexUotUZ+3cAtg/pT6bh
	iyTwFFEFoFAohc01rZFSQkhoKm6DSkMce9tJqfFK/GEdmtXsMqqXxPRnv9MT81mhYkET00POJV338
	dMJTcjRhrkhskjJUo8jB2YfPmUD/g6mAeKQfqFwV/HFpoWEt36uO2fJNfIXLWf4D/E1ovZlYtLgIp
	K6iGD0bd7JQi06yWNHyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq8x1-001lh7-Mh; Mon, 07 Jun 2021 06:41:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq8wy-001lf4-5D
 for linux-riscv@lists.infradead.org; Mon, 07 Jun 2021 06:41:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B6E5D61244
 for <linux-riscv@lists.infradead.org>; Mon,  7 Jun 2021 06:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623048087;
 bh=WJHQdy4sxhvqgS0MC5lUqEPV39/gM84OpLAauZzAMsQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=miti1pGf4X8JSTw+5bAKnmC6J/Oj62GADAh/qU5LGizT3e/mguJHZYM/HqQjB9JIC
 kYOIigfg/o2c0kby0ih2HYmQpm24HYwopDiL3sUY0tLTvmmNznCaAsgxm9GLV4Mbis
 mZqLvmGJc7YlE5ocLu7KjJC0SKVop1urwUZyAaQHglZKXQnQTyz1DsATFehEIwFyv3
 UjfoQ5iT8ItqzGwLGejyyPOHpU5BdHQGHEMs4OdvfqtyUQhg/N/R4GEYNMQJGqzZjk
 6UyPivlChb4tunck8+dpZSp+s8/dW/A9h/CokwsPzzfa40Gn2ysp0dFXDHvrn2f+dr
 8QEa7lrAA4jAA==
Received: by mail-lf1-f48.google.com with SMTP id r5so24490250lfr.5
 for <linux-riscv@lists.infradead.org>; Sun, 06 Jun 2021 23:41:27 -0700 (PDT)
X-Gm-Message-State: AOAM532fxNDJQL6raBo9CTbZxymYOw1qsbEKkKvmJ3Nh3IaCwppnE1gR
 4Ej2CNQ9tNaeYFgzkLIocFJ3xE7CKCnX3N0JjKQ=
X-Google-Smtp-Source: ABdhPJzQw6LHnGrCaA99WogkWxVtNvLnTm9mlFy3domKzPtpc2G5ul39vIh3zn+wlblu5LdVLL4Gofw9oNvf17vVTj0=
X-Received: by 2002:a05:6512:987:: with SMTP id
 w7mr10846468lft.41.1623048085938; 
 Sun, 06 Jun 2021 23:41:25 -0700 (PDT)
MIME-Version: 1.0
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de>
 <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com>
 <20210519064435.GA3076809@x1> <20210519065352.GA31590@lst.de>
 <CAJF2gTR4FXRbp7oky-ypdVJba6btFHpp-+dPyJStRaQX_-5rzg@mail.gmail.com>
 <29733b0931d9dd6a2f0b6919067c7efe@mailhost.ics.forth.gr>
 <CAJF2gTTpSbNWS4VLHAu4XsV5-Vos=6R9MmPOx8-yzMFJu=wX4A@mail.gmail.com>
 <a8f2e68dcc1a6eb1ff3b95fcb8d0d0d2@mailhost.ics.forth.gr>
 <CAJF2gTQuQ5bE6HeGSoNaDynA0o3+KEo4snwft42YGzE=+DjKOQ@mail.gmail.com>
 <20210607062701.GB24060@lst.de>
In-Reply-To: <20210607062701.GB24060@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 7 Jun 2021 14:41:14 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRZuER5YbTD=0xWLU0Np6eD8L_z3rZH0i_WXgENUD3nbQ@mail.gmail.com>
Message-ID: <CAJF2gTRZuER5YbTD=0xWLU0Np6eD8L_z3rZH0i_WXgENUD3nbQ@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
To: Christoph Hellwig <hch@lst.de>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Drew Fustini <drew@beagleboard.org>, 
 Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 wefu@redhat.com, =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Benjamin Koch <snowball@c3pb.de>, 
 Matteo Croce <mcroce@linux.microsoft.com>, Wei Fu <tekkamanninja@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_234128_270103_BCC048A8 
X-CRM114-Status: GOOD (  14.71  )
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

On Mon, Jun 7, 2021 at 2:27 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Jun 07, 2021 at 11:19:03AM +0800, Guo Ren wrote:
> > >From Linux non-coherency view, we need:
> >  - Non-cache + Strong Order PTE attributes to deal with drivers' DMA descriptors
> >  - Non-cache + weak order to deal with framebuffer drivers
> >  - CMO dma_sync to sync cache with DMA devices
>
> This is not strictly true.  At the very minimum you only need cache
> invalidation and writeback instructions.  For example early parisc
> CPUs and some m68knommu SOCs have no support for uncached areas at all,
> and Linux works.  But to be fair this is very painful and supports only
> very limited periphals.  So for modern full Linux support some uncahed
> memory is advisable.  But that doesn't have to be using PTE attributes.
> It could also be physical memory regions that are either totally fixed
Double/Triple the size of physical memory regions can't be accepted by
SOC vendors, because it wastes HW resources.
Some cost-down soc interconnects only have 32bit~34bit width of
physical address, are you sure you could force them to expand it? (I
can't)

> or somewhat dynamic.
How can HW implement with dynamic modifying PMA? What's the granularity?



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
