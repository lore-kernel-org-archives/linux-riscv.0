Return-Path: <SRS0=83+V=KP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26AF8C433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 20 May 2021 01:59:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 768B0611AE
	for <linux-riscv@archiver.kernel.org>; Thu, 20 May 2021 01:59:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 768B0611AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=350NmyEn5dsbL2s5Rjp/6+v0jccu1Mt+7+VZoPBQHbE=; b=LibkZUj0qBdZT/Rp44y8x+vk2
	mQhTzzKl00+JCooERly/04aEOjUG0BFHRAH5CrBEYK+PHdxiLQnr/9Wnyp84Sp1ndaDmuMcWJQqFt
	WhtbTUpQZdEGpnbMx1tmHar5ihLmtBQIUz3troWdFULbrXKRb0qnDHBDF9MWRVArP/cNKM7waCk/T
	X4yeBdU94Wke1EHywAXWF91QryHnrNQY5UbXNYTaNbNKd7kEHXp0LmC0UdXVChogPrg9Jqy+anmTC
	B0S2XbM3SsXG3/MINH2ZPTx9AJdMn/DcrKSbmlCZI28S7Kp366lihadCYj+G7v5rZbAB5rEinLZhC
	LrohYr7Qw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljXy7-005bvo-J4; Thu, 20 May 2021 01:59:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljXy5-005bvZ-4E
 for linux-riscv@desiato.infradead.org; Thu, 20 May 2021 01:59:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=tUv3rVPeSWDnF3GAjcJBgmsDqPM8xlWqUZ0ePXqSqfE=; b=I4fCczEV6LpjPM334tzJdu+bga
 RVCP0t9fu2xWkN8TpoS1iu84AkpxT/R7c9AFNKGStdkWGQ1jrFo9h+W299hggK50ralp/c5eAxlXu
 t9l/8oXhQUmcQvpBSn+jUBcdxUworB2mzKwPJp3YLLKyja9dXwKEJE52/byfPnE8MaVyAfEZYDQ+4
 dkA3ccXAsBSb80UmP5CsRVJcqO4mR2Tksi0T2AfcrsvIegBdaVLFuDQOVlwH+OcOkAML5o53tBS4P
 S6NstHAaWPIQhe7uIMRge8kY1UdOjHU3v0mAzoUuS8QtA49R9A3eUaqvcif/OtmSFz41GYegcMgLi
 aqRaVh7g==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljXy1-00Ft7M-Te
 for linux-riscv@lists.infradead.org; Thu, 20 May 2021 01:59:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5706C61355
 for <linux-riscv@lists.infradead.org>; Thu, 20 May 2021 01:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621475957;
 bh=JdmBtI/nybX20LTYzwdeu3sRM7FFnENPxyFNjn3PhTc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aQy9ccJsdFmRayoAiTGj43uqjruUasRMW3XaC7Y51U6ChraF+gd4VnB5Mm47kDzoF
 YtOxGgjcaqZept35IaUQW0QVaeAhwRn2ILFnGyv9rjSwh+marLBoRCyIbJ/p6xFnft
 V2MQ4C4f2aWrFpBp6vD41RmLBy5yWatN4r39rw8hffgO+MRPVrijETmZN5SYhNHtC6
 ZJtWFpbhBZRS9NwBEwEiN3/i/Yw67Xq4F7h1bfNd9n9SMfgpmkqUqZG/X5yLoUNN5J
 KR0y8HJp7SkFTsys/rn8aSejDiLFMkfizOeXOFWduU2BGIsxKMnNxfTzGVg9KmA8yw
 9magqsOUmrp8A==
Received: by mail-lf1-f46.google.com with SMTP id z13so22021034lft.1
 for <linux-riscv@lists.infradead.org>; Wed, 19 May 2021 18:59:17 -0700 (PDT)
X-Gm-Message-State: AOAM533o+rbaKeDXBwfpSb2K3tW9HVXqIhqUjYuMorQQXsRSPw0Hip6o
 OfxZluBJpIlD+cqZ2KH/AOKKBQdp3FK7Hbt7AbE=
X-Google-Smtp-Source: ABdhPJx4Yk2C9GqxDVxay2oozMIz1ibiukYQwG5GLFDi0mjK8VBRld1CDnMtfMIba/K4AMweT0lkvN1tYYTAfnwELo4=
X-Received: by 2002:ac2:5493:: with SMTP id t19mr1678843lfk.346.1621475955570; 
 Wed, 19 May 2021 18:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
 <20210519052048.GA24853@lst.de>
 <CAJF2gTR5838=Uwc5P6Xs=G7vk80k0yqWcSsNe0OFcwc9sDBBHg@mail.gmail.com>
 <20210519060617.GA28397@lst.de> <20210519065431.GB3076809@x1>
 <CAAhSdy3C1owsbY_9gkxkhWfCXnL_noow7F4t=5+j7q+AJO3pZQ@mail.gmail.com>
 <CAJF2gTQKqce_6cmGQnfLOX8uXvOUWUR-pQT4yOMioMcFAPfBjQ@mail.gmail.com>
In-Reply-To: <CAJF2gTQKqce_6cmGQnfLOX8uXvOUWUR-pQT4yOMioMcFAPfBjQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 20 May 2021 09:59:04 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR2gWETwiszV0n4otjHxu0hGXDp1TT9n=8hX8UHVZY3tw@mail.gmail.com>
Message-ID: <CAJF2gTR2gWETwiszV0n4otjHxu0hGXDp1TT9n=8hX8UHVZY3tw@mail.gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
To: Anup Patel <anup@brainfault.org>
Cc: Drew Fustini <drew@beagleboard.org>, Christoph Hellwig <hch@lst.de>,
 Anup Patel <anup.patel@wdc.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>, wefu@redhat.com, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, 
 linux-sunxi@lists.linux.dev, Guo Ren <guoren@linux.alibaba.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_185918_014208_2720C469 
X-CRM114-Status: GOOD (  29.00  )
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

On Thu, May 20, 2021 at 9:47 AM Guo Ren <guoren@kernel.org> wrote:
>
> On Wed, May 19, 2021 at 3:15 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Wed, May 19, 2021 at 12:24 PM Drew Fustini <drew@beagleboard.org> wrote:
> > >
> > > On Wed, May 19, 2021 at 08:06:17AM +0200, Christoph Hellwig wrote:
> > > > On Wed, May 19, 2021 at 02:05:00PM +0800, Guo Ren wrote:
> > > > > Since the existing RISC-V ISA cannot solve this problem, it is better
> > > > > to provide some configuration for the SOC vendor to customize.
> > > >
> > > > We've been talking about this problem for close to five years.  So no,
> > > > if you don't manage to get the feature into the ISA it can't be
> > > > supported.
> > >
> > > Isn't it a good goal for Linux to support the capabilities present in
> > > the SoC that a currently being fab'd?
> > >
> > > I believe the CMO group only started last year [1] so the RV64GC SoCs
> > > that are going into mass production this year would not have had the
> > > opporuntiy of utilizing any RISC-V ISA extension for handling cache
> > > management.
> >
> > The current Linux RISC-V policy is to only accept patches for frozen or
> > ratified ISA specs.
> > (Refer, Documentation/riscv/patch-acceptance.rst)
> >
> > This means even if emulate CMO instructions in OpenSBI, the Linux
I think it's CBO now.
https://github.com/riscv/riscv-CMOs/blob/master/discussion-files/RISC_V_range_CMOs_bad_v1.00.pdf

> > patches won't be taken by Palmer because CMO specification is
> > still in draft stage.
> How do you think about
> sbi_ecall(SBI_EXT_DMA, SBI_DMA_SYNC, start, size, dir, 0, 0, 0);
> ? thx
CBO insn trap is okay for me ;-)

> >
> > Also, we all know how much time it takes for RISCV international
> > to freeze some spec. Judging by that we are looking at another
> > 3-4 years at minimum.
> >
> > Regards,
> > Anup
>
>
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
