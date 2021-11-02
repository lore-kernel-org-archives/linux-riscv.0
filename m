Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF04DC433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 06:07:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFE64601FF
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 06:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BFE64601FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LWVrAy8jO7oqECYRl9u4nFR1zAamhKtctaiEfCxAyL8=; b=IFikqGJBHOJcJB
	M+n1GrQiuJjZxejRZM/gN0CloF7sEr2Si2mJjaLHribF+a7FwnP2Iv4PbcXdt9A+1GGqklRgidNml
	EObqRhV5cAUUtpyzcb9epNEx2NGAqWsD/1PFgPHFEvlXH5sHkLYr/2mIN4iiABQ/i3m1ydxh5nA68
	NjwSleftJDmoDIbY/5Yk1/gsMnetFz49YanC0MHIaOueOrF39HfbgSDZXnI490ueMm5vQtS5H/DqR
	WxowGNx4FenJfKRdEBmF30AdWHtpHz1siqKNgaACnft8h2vyHtd2OLYpkBMRessvsI2qK2/6nBMiU
	SRuYk4yrFbX37WB7lTLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhmxR-000dR1-U8; Tue, 02 Nov 2021 06:07:41 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhmxP-000dPm-9I
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 06:07:40 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 811A468AFE; Tue,  2 Nov 2021 07:07:34 +0100 (CET)
Date: Tue, 2 Nov 2021 07:07:34 +0100
From: Christoph Hellwig <hch@lst.de>
To: Wei Fu <wefu@redhat.com>
Cc: Christoph Hellwig <hch@infradead.org>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, guoren@kernel.org,
 christoph.muellner@vrull.eu, Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Christoph Hellwig <hch@lst.de>, Liu Shaohua <liush@allwinnertech.com>,
 Wei Wu =?utf-8?B?KOWQtOS8nyk=?= <lazyparser@gmail.com>,
 Drew Fustini <drew@beagleboard.org>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 taiten.peng@canonical.com, aniket.ponkshe@canonical.com,
 heinrich.schuchardt@canonical.com, gordan.markus@canonical.com,
 guoren@linux.alibaba.com, Arnd Bergmann <arnd@arndb.de>,
 Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Lustig <dlustig@nvidia.com>, Greg Favor <gfavor@ventanamicro.com>,
 Andrea Mondelli <andrea.mondelli@huawei.com>,
 Jonathan Behrens <behrensj@mit.edu>, Xinhaoqu <xinhaoqu@huawei.com>,
 Bill Huffman <huffman@cadence.com>, Nick Kossifidis <mick@ics.forth.gr>,
 Allen Baum <allen.baum@esperantotech.com>,
 Josh Scheid <jscheid@ventanamicro.com>,
 Richard Trauben <rtrauben@gmail.com>
Subject: Re: [RESEND PATCH V3 2/2] riscv: add RISC-V Svpbmt extension supports
Message-ID: <20211102060734.GB27015@lst.de>
References: <20211025040607.92786-1-wefu@redhat.com>
 <20211025040607.92786-3-wefu@redhat.com> <YXZU/3/YmRGFrOXK@infradead.org>
 <CA+YCwKkX64A8p9vfLJHC3+LqOWyDg99eDBR0mjfB=H45BOyJLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+YCwKkX64A8p9vfLJHC3+LqOWyDg99eDBR0mjfB=H45BOyJLQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_230739_487534_2EE23BBD 
X-CRM114-Status: GOOD (  13.63  )
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

On Mon, Oct 25, 2021 at 06:55:09PM +0800, Wei Fu wrote:
> How about this macro:
> #define _SVPBMT_PMA         0x0UL
> #define _SVPBMT_NC         BIT(61)
> #define _SVPBMT_IO         BIT(62)
> #define _SVPBMT_MASK         GENMASK(62, 61)

Personally I find these macros highly confusing. 

#define _SVPBMT_PMA	0UL
#define _SVPBMT_NC	(1UL << 61)
#define _SVPBMT_IO	(1UL << 62).
#define _SVPBMT_MASK	(_SVPBMT_NC  | _SVPBMT_IO)

is much eaier to follow.  Note that we can probably just drop
_SVPBMT_PMA entirely to make this even more readable.

> > Also why not use the standard names for these _PAGE bits used by
> > most other architectures?
> 
> Which names are you suggesting? Would you mind providing an example ?
> _PAGE_BIT_   for _PAGE_KERNEL_ ??

Use _PAGE_NOCACHE for _SVPBMT_NC, and _PAGE_IO for _SVPBMT_IO.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
