Return-Path: <SRS0=ksV6=Q2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E10D3C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Feb 2019 15:18:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B284520700
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Feb 2019 15:18:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TXeL0pyA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B284520700
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F5U79iBJXaC0pGPC5md2yJEF4N/e569iYZJAF8PBlBE=; b=TXeL0pyA+tb8+I
	0w1ecOjl8zn6ebSTo4IhJdT57WUPTMCttFlE69hl9UmL0u663450W7hTuQENim1rbVPngw+jRKPEd
	9WyW8gAkdIT7MAkKYxV0+d1FnRKo11gU71Rkq/SOe5QRp9OQgSnVT+leD/MUul1YLHCHAmCsR9zkm
	H3N8R8MlWEQV8QvOpmZWATDKA2CX0LC67dASn0bGWSfHysAUYokDQBVc4MEObQVIG/DMegWC/fe1M
	z2G4vitN980ReRR9B9mB96S7Me5/17Y6M/J6FStXSl79dw6cnEiiok0rNDjYMSHB6DMU3x9kAYEGt
	uzIdwGz0RkgkSATPirow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gw79o-0006j3-AU; Tue, 19 Feb 2019 15:18:04 +0000
Received: from verein.lst.de ([213.95.11.211] helo=newverein.lst.de)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gw79k-0006iQ-LW
 for linux-riscv@lists.infradead.org; Tue, 19 Feb 2019 15:18:02 +0000
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 592F268CEC; Tue, 19 Feb 2019 16:17:59 +0100 (CET)
Date: Tue, 19 Feb 2019 16:17:59 +0100
From: Christoph Hellwig <hch@lst.de>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 02/11] riscv: remove the HAVE_KPROBES option
Message-ID: <20190219151759.GD4121@lst.de>
References: <20190213174005.28785-1-hch@lst.de>
 <20190213174005.28785-3-hch@lst.de>
 <CAK7LNAQFSQN=42X1dqt5io+gOG8mUpwXhLmspqryvmzakUCSWw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK7LNAQFSQN=42X1dqt5io+gOG8mUpwXhLmspqryvmzakUCSWw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190219_071800_897523_F84B571B 
X-CRM114-Status: GOOD (  10.45  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-xtensa@linux-xtensa.org,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-riscv@lists.infradead.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Feb 15, 2019 at 06:32:07PM +0900, Masahiro Yamada wrote:
> On Thu, Feb 14, 2019 at 2:40 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > HAVE_KPROBES is defined genericly in arch/Kconfig and architectures
> > should just select it if supported.
> >
> > Signed-off-by: Christoph Hellwig <hch@lst.de>
> 
> Do you want this patch picked up by me?
> 
> Or, by Palmer?

Given that I don't think I'll have the rest of this series respun in time
for this merge window:  Palmer, can you pick it up?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
