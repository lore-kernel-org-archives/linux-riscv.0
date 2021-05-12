Return-Path: <SRS0=yFtJ=KH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E64B7C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 12 May 2021 12:06:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DB29613EE
	for <linux-riscv@archiver.kernel.org>; Wed, 12 May 2021 12:06:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DB29613EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tJ2ne/w8snCilM+wyqENlr3Z4Kit2ah1jOE5KQTr38Q=; b=iamCwoPKtgYcO8HaZoUNccBrD
	oJEEzwbE+aJUMhBnsWJSCCPHFvqXU3nnjrH7n/6CmQ9asBhFafT1/oE4HC7T0+vsYs9FPQFkf2ufa
	yTpTJ4By7z8cmjHK0lOO86HLouWk+JzplZRC7ureJyGCYsRyrQje+nAzltG+XoLn+ziSmde8fFFty
	O8Cp8+YLQUQgVslK4Xku8+ejvLwkseuqWTjOvIKIxnuw6Yxrq44q5b4pr3A8NaMUjqZKm67oE2g/0
	E7KDc7u+SiReXGClxmqQZQ3ceBEhan9ZIr7FUDKJAM2FTg1ZggdVXAsBB1hlGFcx6MOi7MWAjeJ+8
	TCVJSJ64Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgndK-002gIK-Fz; Wed, 12 May 2021 12:06:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgnd7-002gGM-Mo; Wed, 12 May 2021 12:06:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=saV8qHE7GDgvsCJb76Kid34fqbkGNeJooDWFGTTLQqU=; b=pRWTtfbQb6Pv/3VQxPKTA7Eqqh
 30SyHqYhWzpUc33YGrZ8LJ9UKUb5NCB8RPA0Z6ZKKuGrYddz2gkDPx+himyL71xKfERauxMX4n60m
 /emj+5YOhjWOvyRmaH0PjE19B2g/e0d4nyV+TVO8xh5/zmmhmJn8T3n627hzBhfkMSxlFANPXDpaW
 2QNe3y1JPstrRJWl48Ndl0i6FBtWoygtbO56HsHbqTKrNn+xQHV7+LHCZQkqyDoUt83Yvw9V+Kjkn
 L2QJUEycK67mS12djYIwP+8TGztA8gUab7XESrg9602I9ZHZTQDK/jCEQdnKjC8gPu9yAtoVLWSdt
 BqOdQIUw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgnd4-00AKNC-P7; Wed, 12 May 2021 12:06:20 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3CB7561403;
 Wed, 12 May 2021 12:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1620821177;
 bh=AtszGnmv+mTFcNm2ERPbG7WIHAhG6jxQCBij84CLFdM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r6w4bQUu9wMMwJP+sZjszQ5ZOhmY9vBlAzAybojQ7W49bbpVpctrfAWfPvSeGBGtB
 s98qHhnDFqsGlJWC78tHp7JJX35rbkKhsYjaNVnONQXmNia2/jzoBZN1kCuSY2dqf3
 u1fhj3H+DdHYfFX9NRIcgPCmGYDDb4s6tc7r5+/0=
Date: Wed, 12 May 2021 14:06:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Jing Xiangfeng <jingxiangfeng@huawei.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 rppt@kernel.org, lorenzo.pieralisi@arm.com, guohanjun@huawei.com,
 sudeep.holla@arm.com, rjw@rjwysocki.net, lenb@kernel.org,
 song.bao.hua@hisilicon.com, ardb@kernel.org,
 anshuman.khandual@arm.com, bhelgaas@google.com, guro@fb.com,
 robh+dt@kernel.org, stable@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, frowand.list@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH stable v5.10 0/7] arm64: Default to 32-bit wide ZONE_DMA
Message-ID: <YJvEt9wgVAQLmiLp@kroah.com>
References: <20210303073319.2215839-1-jingxiangfeng@huawei.com>
 <YEDkmj6cchMPAq2h@kroah.com>
 <9bc396116372de5b538d71d8f9ae9c3259f1002e.camel@suse.de>
 <YEDr/lYZHew88/Ip@kroah.com>
 <827b317d7f5da6e048806922098291faacdb19f9.camel@suse.de>
 <YETwL6QGWFyJTAzk@kroah.com> <604597E3.5000605@huawei.com>
 <YEX1OcbVNSqwwusF@kroah.com>
 <31cd8432-2466-555d-7617-ae48cbcd4244@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <31cd8432-2466-555d-7617-ae48cbcd4244@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_050618_920432_77698D08 
X-CRM114-Status: GOOD (  22.12  )
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

On Tue, May 11, 2021 at 08:35:47PM +0800, Kefeng Wang wrote:
> 
> 
> On 2021/3/8 17:58, Greg KH wrote:
> > On Mon, Mar 08, 2021 at 11:20:03AM +0800, Jing Xiangfeng wrote:
> > > 
> > > 
> > > On 2021/3/7 23:24, Greg KH wrote:
> > > > On Thu, Mar 04, 2021 at 04:09:28PM +0100, Nicolas Saenz Julienne wrote:
> > > > > On Thu, 2021-03-04 at 15:17 +0100, Greg KH wrote:
> > > > > > On Thu, Mar 04, 2021 at 03:05:32PM +0100, Nicolas Saenz Julienne wrote:
> > > > > > > Hi Greg.
> > > > > > > 
> > > > > > > On Thu, 2021-03-04 at 14:46 +0100, Greg KH wrote:
> > > > > > > > On Wed, Mar 03, 2021 at 03:33:12PM +0800, Jing Xiangfeng wrote:
> > > > > > > > > Using two distinct DMA zones turned out to be problematic. Here's an
> > > > > > > > > attempt go back to a saner default.
> > > > > > > > What problem does this solve?  How does this fit into the stable kernel
> > > > > > > > rules?
> > > > > > > We changed the way we setup memory zones in arm64 in order to cater for
> > > > > > > Raspberry Pi 4's weird DMA constraints: ZONE_DMA spans the lower 1GB of memory
> > > > > > > and ZONE_DMA32 the rest of the 32bit address space. Since you can't allocate
> > > > > > > memory that crosses zone boundaries, this broke crashkernel allocations on big
> > > > > > > machines. This series fixes all this by parsing the HW description and checking
> > > > > > > for DMA constrained buses. When not found, the unnecessary zone creation is
> > > > > > > skipped.
> > > > > > What kernel/commit caused this "breakage"?
> > > > > 1a8e1cef7603 arm64: use both ZONE_DMA and ZONE_DMA32
> > > > Thanks for the info, all now queued up.
> > > There is a fix in 5.11. Please consider applying the following commit to
> > > 5.10.y:
> > > 
> > > aed5041ef9a3 of: unittest: Fix build on architectures without
> > > CONFIG_OF_ADDRES
> > 
> > Thanks, now queued up.
> 
> Hi Grep, another commit d78050ee3544 "arm64: Remove arm64_dma32_phys_limit
> and its uses" should be involved, thanks.
> 
> "Prior to this patch, disabling CONFIG_ZONE_DMA32 leads to CMA
> allocation from the whole RAM as arm64_dma32_phys_limit becomes
> PHYS_MASK+1." from Catalin, see more from the link
> https://www.spinics.net/lists/arm-kernel/msg867356.html

Ok, now queued up.

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
