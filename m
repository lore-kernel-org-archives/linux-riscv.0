Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EBEFC433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 06:10:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34D3D611AD
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 06:10:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 34D3D611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uGxdzwI1RrS64R4bnYQQ5USmb7mB+Hl12PrS+PUJkUc=; b=bv9TUj4sat7bfZIb1Vdyiqcc2
	iO+SkdgKFytCYHlWmQ3kJ2FDX5ILK9P/pbxN140quw+A9UtDXKwJjefhxUQVn0L4wQViESq2Kx8K+
	G4QjpcCS6JvIIlI/TsBvgfwOTqNOilS7HDLeE0GF/jpPrmD4+PiL3hvrTi4kw70hnCArT16C0dQ0o
	WSBwICzEMrW9K160Xkj64+DgI4wjkjCzTQxppNScOaNxjkLyyFqGIAkgYT0ZWt/FTWoBU788uyx8T
	5TQNR8VcU8SgPrPo4Ea8QJPipsTwykrH8LXLbRlSB+8DHy0BeXHZfxlUIj51EUbDi1oyfqPZkLLQK
	i2VtokIMA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljFOi-002x2D-O9; Wed, 19 May 2021 06:09:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljFOg-002x1y-8A
 for linux-riscv@desiato.infradead.org; Wed, 19 May 2021 06:09:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=hqs8pRWA20UAuK9raWBKCXI50meZ7lJJdzrTG1SEBtA=; b=pycIDtBbY65QAa5+Du7iI5spLo
 lJIWAUdT/XXaBkncdrAKffiDcx82IuCqta4cGNTwAT0GaiJYVm6DFIkbacyXgctagXQSOvyhNWF10
 vy0rLU+Q0zVW0Suv0ncXCysBHDUfzVFIUGv9HPSzriyqbiLt6p060ECim2ziDl0LTT3/KasNH6HI3
 po9VKn9kiP2tRSfXGMHO4AhznL183s9fopcDY1BR1i3+KbPI3IaB6lGjBJeZuvuQfVP4D41oNdhwv
 vVLdvKxjV1wDuk6Ro1TYXkr/TLpNg1K3fIGjdOTiwZlTSGomurikW7XK2GJn8Q7yjdyxksIidISzu
 K3sPqhMg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljFOd-00FAjS-II
 for linux-riscv@lists.infradead.org; Wed, 19 May 2021 06:09:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01E57613B0
 for <linux-riscv@lists.infradead.org>; Wed, 19 May 2021 06:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621404571;
 bh=+tng9KOkJ4vGrdnFxKm0TZVfhTzW5k68odPKowCsvhg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=uIFcOBsrOPaOvn2n6HLWrG+RAKH5xzptUoATriDXNQfa/02/ENtvWdaSu9rOiF5N1
 +k2R5oQrAgs3HF5e7SKOncFWi5nhVxR5BXYPQ6yPcLjpR7yj8heIO/d8Q35i/g4NAI
 KvcOnf3FI0yuBWQC5qBFFGCBe+2rWumYiZo2mvF2lHCDPQKbF8zkwmQQGGMqmSM0VM
 bBYqhyCuVt+UtTd4uZ3Z9WHzcLGN0qiJ9pTyK2IiRxrelP0OJHaYGvxMCr4tWxrUaI
 82SUAJ/G8SBrlul2epNghxGFdlMslJ08hdiYwv7LtWSAzdQWM9FRWwxqYULt/3JKJj
 7vKPlTe7DOX3A==
Received: by mail-lj1-f181.google.com with SMTP id v5so14186691ljg.12
 for <linux-riscv@lists.infradead.org>; Tue, 18 May 2021 23:09:30 -0700 (PDT)
X-Gm-Message-State: AOAM533r30GwY+VbyZ6Tbp7SAvOoMrLxqAhEU7Z5hATtbJdmVEo4Ego9
 PfTMgPnd/FSX4m2+DcUpsidMoA/xnL/l2S/cef0=
X-Google-Smtp-Source: ABdhPJxCD9AU161BNjQRQBYs1nLF1LGkl0Ty6pHsGbdXuhweqLk1xlX6xD5rGyODMFf4KqToUL2wB7X/Dnv9SWicVUo=
X-Received: by 2002:a2e:9d82:: with SMTP id c2mr7361177ljj.508.1621404569271; 
 Tue, 18 May 2021 23:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de>
 <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com>
 <20210519055555.GA27451@lst.de>
In-Reply-To: <20210519055555.GA27451@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 19 May 2021 14:09:17 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSg0TqAzmdzf7B_xASXLO-z4yVvCDnaUV4brP7tCpCdvQ@mail.gmail.com>
Message-ID: <CAJF2gTSg0TqAzmdzf7B_xASXLO-z4yVvCDnaUV4brP7tCpCdvQ@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
To: Christoph Hellwig <hch@lst.de>
Cc: Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 drew@beagleboard.org, wefu@redhat.com, lazyparser@gmail.com, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_230931_648581_E28EA16F 
X-CRM114-Status: GOOD (  12.78  )
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

On Wed, May 19, 2021 at 1:55 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, May 19, 2021 at 01:48:23PM +0800, Guo Ren wrote:
> > The patchset just leaves a configuration chance for vendors. Before
> > RISC-V ISA fixes it, we should give the chance to let vendor solve
> > their real chip issues.
>
> No.  The vendors need to work to get a feature standardized before
> implementing it.  There is other way to have a sane kernel build that
> supports all the different SOCs.

I've said the patchset doesn't define any features, It just leaves the
chance for vendors.

It's not in conflict with any standardized riscv ISA.


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
