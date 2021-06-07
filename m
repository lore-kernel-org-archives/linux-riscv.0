Return-Path: <SRS0=HNmv=LB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A90EC47082
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 07:46:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2710C60FE9
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jun 2021 07:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2710C60FE9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Cki0mxwIsT6RnTb0o+i/G3vN/mnsP5h0Rbf6U6oMQI=; b=VEKnn8TLmNsI7R
	blwvGC2O0o2j/fLUaSrlWgzKiBWgCuQNfhvaTPdrgjr5/pFrTJsP2Z1+/l1Wg4xLEhzVfyG4HpYzt
	9Lyk+7XxRmiOKPRWBRmbroU2ITKio+C8QcQ64oFQ/+cWU2efvBYVCXCfJ27NbulWCKIyiPr5xEDfx
	PLmq47vgQm4hl+Pocr6v/2mejz1VBvfq3NrvHu/nkvqbKN2862VPkJXFVs6Jp8jrbyT0DBQKN9CGG
	PJPN9b3rAbCoEP/d148RcGVlfkO7cAqnAQWVrV+5RC8cCscdTHhOXQrblOD4bRDZQSn2AGNFyYXAz
	H3Ek5/3clG6UxtgNb1pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq9xx-00287Y-Li; Mon, 07 Jun 2021 07:46:33 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq9xu-00286N-48
 for linux-riscv@lists.infradead.org; Mon, 07 Jun 2021 07:46:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BB7A261246
 for <linux-riscv@lists.infradead.org>; Mon,  7 Jun 2021 07:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623051989;
 bh=2HlV8yHs2q1qjoHRDtJoVGUfxTgO4byPz6D2uYNRljQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FxmLOZM5r4Z7GtFixysiILFJTjRWbjbsEs7+jojonhIuOUMLae2X86XjlksRQ5ItZ
 Kp2HLKf3hcq7htEBpNBiljaaA0b8EQt5akMDMCJIotNGyl5UPwG+jI6yUpPh3et0b2
 Nr4zEMKyO2dzXmvFuISpk7OjS+IoUa1mw+c32lciZ1Yz69tEKRHYivY0wXJB8VvxuV
 2KACYptzrizLvKJH8Ke9yVZ7BXy3dT1r+E+my3CVoV61LYAgNUm5oWIMfGhVgRNc1l
 GDHIoWE7a8/w4ZcUjJJZHCGPyL6q7GBOTQsOP+QqXJzGgdW7CR6Ol3csV4KeLNJqw8
 aWtYQYO0/o0yg==
Received: by mail-lj1-f173.google.com with SMTP id s22so467194ljg.5
 for <linux-riscv@lists.infradead.org>; Mon, 07 Jun 2021 00:46:29 -0700 (PDT)
X-Gm-Message-State: AOAM530qvrPo9fdt4UWgDlV9G5CZfboW276NHw7zvccnu7mcQzMhuXhs
 6eWB4FuR/D80E5F0+pJiHGLw16rOH7uEhG4JH28=
X-Google-Smtp-Source: ABdhPJxL4zA7EQ2YHPHcUCPx8//5Y1q0itGfKI8bjok0Q3XogGDj6ywZVtGkP4ihvSlwi8LNJxqiz/MEyp7tBn9b04E=
X-Received: by 2002:a2e:900f:: with SMTP id h15mr12585106ljg.285.1623051988136; 
 Mon, 07 Jun 2021 00:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com>
 <20210519064435.GA3076809@x1> <20210519065352.GA31590@lst.de>
 <CAJF2gTR4FXRbp7oky-ypdVJba6btFHpp-+dPyJStRaQX_-5rzg@mail.gmail.com>
 <29733b0931d9dd6a2f0b6919067c7efe@mailhost.ics.forth.gr>
 <CAJF2gTTpSbNWS4VLHAu4XsV5-Vos=6R9MmPOx8-yzMFJu=wX4A@mail.gmail.com>
 <a8f2e68dcc1a6eb1ff3b95fcb8d0d0d2@mailhost.ics.forth.gr>
 <CAJF2gTQuQ5bE6HeGSoNaDynA0o3+KEo4snwft42YGzE=+DjKOQ@mail.gmail.com>
 <20210607062701.GB24060@lst.de>
 <CAJF2gTRZuER5YbTD=0xWLU0Np6eD8L_z3rZH0i_WXgENUD3nbQ@mail.gmail.com>
 <20210607065108.GA24872@lst.de>
In-Reply-To: <20210607065108.GA24872@lst.de>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 7 Jun 2021 15:46:16 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR2koLW2si-VsYDh5D9DCX=1e-tGvwgj=MExva94+gC4Q@mail.gmail.com>
Message-ID: <CAJF2gTR2koLW2si-VsYDh5D9DCX=1e-tGvwgj=MExva94+gC4Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210607_004630_204868_D5A16770 
X-CRM114-Status: GOOD (  14.18  )
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

On Mon, Jun 7, 2021 at 2:51 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Jun 07, 2021 at 02:41:14PM +0800, Guo Ren wrote:
> > Double/Triple the size of physical memory regions can't be accepted by
> > SOC vendors, because it wastes HW resources.
> > Some cost-down soc interconnects only have 32bit~34bit width of
> > physical address, are you sure you could force them to expand it? (I
> > can't)
> >
> > > or somewhat dynamic.
> > How can HW implement with dynamic modifying PMA? What's the granularity?
>
> I'm just stating the requirements from the Linux DMA perspective.  You
> also do not need tripple the address space, just double.

With double, you only got "strong order + non-cache" for the DMA
descriptor. How about write-combine scenario?

Even, double physical memory address space also wastes HW resources.




--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
