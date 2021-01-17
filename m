Return-Path: <SRS0=fQ+v=GU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89856C433DB
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Jan 2021 10:12:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45B49206D6
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Jan 2021 10:12:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45B49206D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0LsXY6DtkTmo6yAtnD964OK74HDtKQY2faLc/Y2cOHo=; b=zgJ/eIqdC9LuOP9ebzPrGOmBz
	O40TljyTyGcq8B09y5bt/gzukPrVfvrDYD3/Y4VaXWAa+EalMZ2tWbWkXXqO1Zyz7osOGqxyPsgQB
	yBPODjBU/ZwLp2FASUdwwlPiZ34FTZ2w2oVJUYJya8JFFcYGQLBhcLXU+mXz7dk+Us3EpnDTTfyYy
	vRT7L15GKY+KdDgBMcdr6SIhVdGOUeuVwEZ1QHQNt/elS0v1fXA3+8hL3ScD9f/QWDoCq8u3mhp0V
	Uzi5cTljIOeLCI1O9YH0bPiYPYhRlol+m6oRI8CqK9637M7ZzisrnhPuNRUqopyoeO26z6ordlA3K
	dQjChM7SA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l152i-0005yZ-6y; Sun, 17 Jan 2021 10:12:20 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l152b-0005XX-A7; Sun, 17 Jan 2021 10:12:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ItbSYqJ0DbCe+J/gZUetRPMemBxEJIEpaxGcVk0SftY=; b=0mn8fckZlbhhwYm/aXkpvFTFQ
 Q+sWZ4yWv44x8bHqyF14DtXaRL+AIyzCR5a92GsrwEDyr2z3jWULutPT9gVEZrAZOJ8gWAlSCAua/
 8TE20ZOXND/WTK+mqe4r1P9aprwhblsuHr0gtWFKCAJ2oyxKVFN8NxdLgemTQBFAhUsdg/T24i2Qi
 rx/Ca8k8VkLqmN3ebW0dbwvr2kO1BQUAypZCOZ51rE66Hbq3kFPCTIY8vGH9HNJgpy4HwcfNABvbG
 Oqgjs7qMzjrrIwrFgfjq3J4oAZMiOFUw82nTNUD86SRF9+Agh32/q2mqL6HUHsZ83r5tFLgtRyH8j
 nlZ66ywfA==;
Received: from shell.armlinux.org.uk
 ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:49082)
 by pandora.armlinux.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <linux@armlinux.org.uk>)
 id 1l14zb-0005Mu-4k; Sun, 17 Jan 2021 10:09:07 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1l14zY-0002tT-4x; Sun, 17 Jan 2021 10:09:04 +0000
Date: Sun, 17 Jan 2021 10:09:04 +0000
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH v3 0/4] initrd: Use unified initrd reserve function in
 ARM/RISCV
Message-ID: <20210117100903.GB1551@shell.armlinux.org.uk>
References: <20210115054606.124502-1-wangkefeng.wang@huawei.com>
 <48c006a8-a352-488c-4981-768faffbe343@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <48c006a8-a352-488c-4981-768faffbe343@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210117_051213_369715_2311B46A 
X-CRM114-Status: GOOD (  13.67  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: palmerdabbelt@google.com, linux-kernel@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, guoren@kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Jan 17, 2021 at 12:57:55PM +0800, Kefeng Wang wrote:
> Correct Russell's mail address (from linux@armlinux.org.uk to
> rmk+kernel@armlinux.org.uk, should update the MAINTAINERS)

No. MAINTAINERS is correct.

> On 2021/1/15 13:46, Kefeng Wang wrote:
> > Use the same implementation of initrd reserve to avoid duplication.
> > 
> > v3:
> > - split into four patches, suggested-by Palmer Dabbelt
> > v2:
> > - fix build error found by kernel test robot
> > 
> > Kefeng Wang (4):
> >    initrd: Add the preprocessor guard in initrd.h
> >    initramfs: Provide a common initrd reserve function
> >    ARM: Covert to reserve_initrd_mem()
> >    riscv: Covert to reserve_initrd_mem()
> > 
> >   arch/arm/mm/init.c     | 43 +--------------------------------
> >   arch/riscv/mm/init.c   | 54 +-----------------------------------------
> >   include/linux/initrd.h | 11 +++++++++
> >   init/initramfs.c       | 45 +++++++++++++++++++++++++++++++++++
> >   4 files changed, 58 insertions(+), 95 deletions(-)
> > 
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
