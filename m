Return-Path: <SRS0=jumX=K5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED119C47082
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jun 2021 04:14:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABBD8613B4
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Jun 2021 04:14:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ABBD8613B4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:
	In-Reply-To:Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=uPcTvPto5OQXDxTD5b7SQbYr/ZHSjc9GAPlwrSJnybQ=; b=nTYK+IVwM7JkSR
	Oxhrs2fR3Q64wq5AMTixeDr21KCXCItcQtpl3Fb/vuJ2AP+KWeYknoybEeWXykQeUCtsOxYbvpfwm
	qPi4VO8ZsSmFvJJJN6SeWxZpagLa0+N0vyGpR0slt+9Rg1zH+BGuVV94sytCtrM0sU1Y/47vTmv6H
	Ku5fTzVMH+cduUTOh33divnOaVGjSgTLYRYLwaDqmKkKTW8G/LrlPZA4wYty0r9uUmh0IJZqg6M7e
	zpA2uwnshOVO+3jwZGeNnMmsh8oN24cXItFHg/HEVeMZxzcRPEiIFnHOBaladcvmfg/R4GNHDLs3I
	aEFp/L/QoXvtoYJLbfPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loekc-00748F-Nk; Thu, 03 Jun 2021 04:14:34 +0000
Received: from mail-pj1-f44.google.com ([209.85.216.44])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loekZ-00746z-QU
 for linux-riscv@lists.infradead.org; Thu, 03 Jun 2021 04:14:33 +0000
Received: by mail-pj1-f44.google.com with SMTP id
 d5-20020a17090ab305b02901675357c371so4374330pjr.1
 for <linux-riscv@lists.infradead.org>; Wed, 02 Jun 2021 21:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id;
 bh=mdQe7rcfBv/z++/4DywE65Kjg4R/h0ApRxAanaCZhPk=;
 b=fd+ibb1AZny+F8WluQ/jIE1zbUfUvf9P+Lnr32S0iD+PghCPDh2X2uqJSxvmZ8/1IL
 n8ROE/oO/fe7kZsF+WyG14vqVqE3FZjp2VMnXhWXkiwq53p5wObdEI9f2GQHH61kr7Ie
 ax3ZmpAh6zdQhXyVC6/Niw8nCnJowg9RJKGvsXnhE9tpbJpPLwtKHopnBaA5fVrLzRcg
 WDkUDJclcaCJG2p+mMuvw9hYxL+RpnNlSbJXa0vyEwAiSDyX+tsHniubp2yoQHhv60+F
 6xY345bBCAf9+NDh9wSJBGz2MulrXgBdpGs6hkhoO+jKkNw968xbek1hakK9GopdyEsb
 OCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id;
 bh=mdQe7rcfBv/z++/4DywE65Kjg4R/h0ApRxAanaCZhPk=;
 b=uhi/8WWC28/CnfnZi1MvsuuLXU7snZrgCuDsxfkVvro9u1nTHkdpVSWCMtwOOOdR2w
 rvrF0vwvoahEOoDjy8vkeeTdUkHTgfICu9M+EZNNlNpYMwm3klY52UctvJ5rewQXHrDc
 ruLjURh6QgdFoXLJWyFMLkd/xxPE3yfXk3FvWHfPr1gbxlBB99fCDGFvtS2vF5D33wsQ
 KQGVFY3m78UmuejkSy6HodYt9aExIX0C9yY1UHQNQ5JMQXaLOYv5m4/ph50pD+4TzAsj
 jtgzw1gB7zaRb6zVZVZ+wbgzTDyQA/1MnTUxSU3w4ZzBRvu9qtvvuqGrtvtDzqottJ7R
 Nc9w==
X-Gm-Message-State: AOAM531tEWkSJekfi9BrcA/w2Guu7TEzQNr52om7V5FLykU3YGqLheYc
 0vhKffQFDcls7kwQg3JV4DhpEnUEKWVB9lyy
X-Google-Smtp-Source: ABdhPJyhCDbdVRbt5r/8ORm86+o6k/4hlsjsYyPQRuc0fTEcbN0So+HCQlNKs9itq7iVgl7kUmYVmg==
X-Received: by 2002:a17:902:eac1:b029:108:4a7c:ff2d with SMTP id
 p1-20020a170902eac1b02901084a7cff2dmr11472514pld.62.1622693608838; 
 Wed, 02 Jun 2021 21:13:28 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q21sm934029pfn.81.2021.06.02.21.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 21:13:28 -0700 (PDT)
Date: Wed, 02 Jun 2021 21:13:28 -0700 (PDT)
X-Google-Original-Date: Wed, 02 Jun 2021 21:11:20 PDT (-0700)
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
In-Reply-To: <mhng-a5f8374f-350b-4c13-86e8-c6aa5e697454@palmerdabbelt-glaptop>
CC: anup@brainfault.org, drew@beagleboard.org, Christoph Hellwig <hch@lst.de>, 
 Anup Patel <Anup.Patel@wdc.com>, wefu@redhat.com, lazyparser@gmail.com,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-sunxi@lists.linux.dev, 
 guoren@linux.alibaba.com, Paul Walmsley <paul.walmsley@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: guoren@kernel.org
Message-ID: <mhng-c0406cea-776b-49d2-a223-13a83d3a7433@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_211431_939615_B9061549 
X-CRM114-Status: GOOD (  59.01  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, 29 May 2021 17:30:18 PDT (-0700), Palmer Dabbelt wrote:
> On Fri, 21 May 2021 17:36:08 PDT (-0700), guoren@kernel.org wrote:
>> On Wed, May 19, 2021 at 3:15 PM Anup Patel <anup@brainfault.org> wrote:
>>>
>>> On Wed, May 19, 2021 at 12:24 PM Drew Fustini <drew@beagleboard.org> wrote:
>>> >
>>> > On Wed, May 19, 2021 at 08:06:17AM +0200, Christoph Hellwig wrote:
>>> > > On Wed, May 19, 2021 at 02:05:00PM +0800, Guo Ren wrote:
>>> > > > Since the existing RISC-V ISA cannot solve this problem, it is better
>>> > > > to provide some configuration for the SOC vendor to customize.
>>> > >
>>> > > We've been talking about this problem for close to five years.  So no,
>>> > > if you don't manage to get the feature into the ISA it can't be
>>> > > supported.
>>> >
>>> > Isn't it a good goal for Linux to support the capabilities present in
>>> > the SoC that a currently being fab'd?
>>> >
>>> > I believe the CMO group only started last year [1] so the RV64GC SoCs
>>> > that are going into mass production this year would not have had the
>>> > opporuntiy of utilizing any RISC-V ISA extension for handling cache
>>> > management.
>>>
>>> The current Linux RISC-V policy is to only accept patches for frozen or
>>> ratified ISA specs.
>>> (Refer, Documentation/riscv/patch-acceptance.rst)
>>>
>>> This means even if emulate CMO instructions in OpenSBI, the Linux
>>> patches won't be taken by Palmer because CMO specification is
>>> still in draft stage.
>> Before CMO specification release, could we use a sbi_ecall to solve
>> the current problem? This is not against the specification, when CMO
>> is ready we could let users choose to use the new CMO in Linux.
>>
>> From a tech view, CMO trap emulation is the same as sbi_ecall.
>>
>>>
>>> Also, we all know how much time it takes for RISCV international
>>> to freeze some spec. Judging by that we are looking at another
>>> 3-4 years at minimum.
>
> Sorry for being slow here, this thread got buried.
>
> I've been trying to work with a handful of folks at the RISC-V
> foundation to try and get a subset of the various in-development
> specifications (some simple CMOs, something about non-caching in the
> page tables, and some way to prevent speculative accesse from generating
> coherence traffic that will break non-coherent systems).  I'm not sure
> we can get this together quickly, but I'd prefer to at least try before
> we jump to taking vendor-specificed behavior here.  It's obviously an
> up-hill battle to try and get specifications through the process and I'm
> certainly not going to promise it will work, but I'm hoping that the
> impending need to avoid forking the ISA will be sufficient to get people
> behind producing some specifications in a timely fashion.
>
> I wasn't aware than this chip had non-coherent devices until I saw this
> thread, so we'd been mostly focused on the Beagle V chip.  That was in a
> sense an easier problem because the SiFive IP in it was never designed
> to have non-coherent devices so we'd have to make anything work via a
> series of slow workarounds, which would make emulating the eventually
> standardized behavior reasonable in terms of performance (ie, everything
> would be super slow so who really cares).
>
> I don't think relying on some sort of SBI call for the CMOs whould be
> such a performance hit that it would prevent these systems from being
> viable, but assuming you have reasonable performance on your non-cached
> accesses then that's probably not going to be viable to trap and
> emulate.  At that point it really just becomes silly to pretend that
> we're still making things work by emulating the eventually ratified
> behavior, as anyone who actually tries to use this thing to do IO would
> need out of tree patches.  I'm not sure exactly what the plan is for the
> page table bits in the specification right now, but if you can give me a
> pointer to some documentation then I'm happy to try and push for
> something compatible.
>
> If we can't make the process work at the foundation then I'd be strongly
> in favor of just biting the bullet and starting to take vendor-specific
> code that's been implemented in hardware and is necessarry to make
> things work acceptably.  That's obviously a sub-optimal solution as
> it'll lead to a bunch of ISA fragmentation, but at least we'll be able
> to keep the software stack together.
>
> Can you tell us when these will be in the hands of users?  That's pretty
> important here, as I don't want to be blocking real users from having
> their hardware work.  IIRC there were some plans to distribute early
> boards, but it looks like the foundation got involved and I guess I lost
> the thread at that point.
>
> Sorry this is all such a headache, but hopefully we can get things
> sorted out.

I talked with some of the RISC-V foundation folks, we're not going to 
have an ISA specification for the non-coherent stuff any time soon.  I 
took a look at this code and I definately don't want to take it as is, 
but I'm not opposed to taking something that makes the hardware work as 
long as it's a lot cleaner.  We've already got two of these non-coherent 
chips, I'm sure more will come, and I'd rather have the extra headaches 
than make everyone fork the software stack.

After talking to Atish it looks like there's likely to be an SBI 
extension to handle the CMOs, which should let us avoid the bulk of the 
vendor-specific behavior in the kernel.  I know some people are worried 
about adding to the SBI surface.  I'm worried about that too, but that's 
way better than sticking a bunch of vendor-specific instructions into 
the kernel.  The SBI extension should make for a straight-forward cache 
flush implementation in Linux, so let's just plan on that getting 
through quickly (as has been done before).

Unfortunately we've yet to come up with a way to handle the 
non-cacheable mappings without introducing a degree of vendor-specific 
behavior or seriously impacting performance (mark them as not valid and 
deal with them in the trap handler).  I'm not really sure it counts as 
supporting the hardware if it's massively slow, so that really leaves us 
with vendor-specific mappings as the only option to make these chips 
work.

This implementation, which adds some Kconfig entries that control page 
table bits, definately isn't suitable for upstream.  Allowing users to 
set arbitrary page table bits will eventually conflict with the 
standard, and is just going to be a mess.  It'll also lead to kernels 
that are only compatible with specific designs, which we're trying very 
hard to avoid.  At a bare minimum we'll need some way to detect systems 
with these page table bits before setting them, and some description of 
what the bits actually do so we can reason about them.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
