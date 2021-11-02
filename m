Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59370C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 06:04:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 207C260C4B
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 06:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 207C260C4B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4qEhmsKzIjlsA6O7UnGEfGOzbCee2fI9pQNNy1G7z4=; b=ao9Byizid6FLHj
	+B52nGLCtA9tZd6CD4VjhUlRlm+zQv8rQMRO/eE8IeHNOc4CtF9uvbqzEi8D4RI1BQRs/XsVXq8Gy
	zBG5KDZfz0nqbBVL0RGD/PITtOaSXv8A8shXs72YFChV6x/30b8LhQGQJ/pk0KqMcSGH+GvUnNJNY
	orsG2Hd/OlXO1Lduiys60QPYgE9GvQB7gb/OC8uRB6PXdnpcJDFB1N/cc5gFDlYvqrv5wznnYC1EG
	UB4G1kAxtv0/jZRC3jCSMD7zovKhCZbdPQ9+34lY3R1dnh6K/NhXaO0OHvG54pXzMlYVekj6mslcO
	T9Q10Po9VsrmplO6brqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhmuO-000cqh-6Q; Tue, 02 Nov 2021 06:04:32 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhmuL-000cpI-N0
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 06:04:30 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4400D68AFE; Tue,  2 Nov 2021 07:04:25 +0100 (CET)
Date: Tue, 2 Nov 2021 07:04:24 +0100
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
Message-ID: <20211102060424.GA27015@lst.de>
References: <20211025040607.92786-1-wefu@redhat.com>
 <20211025040607.92786-3-wefu@redhat.com> <YXZU/3/YmRGFrOXK@infradead.org>
 <CA+YCwKn1VA8=NSa=bdhP99jfpokYGHBvqVSKvZmdndQOz6UUPA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+YCwKn1VA8=NSa=bdhP99jfpokYGHBvqVSKvZmdndQOz6UUPA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_230429_909096_77E00ABC 
X-CRM114-Status: GOOD (  14.90  )
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

On Mon, Oct 25, 2021 at 10:49:11PM +0800, Wei Fu wrote:
> > > +                                             >> _PAGE_PFN_SHIFT);
> >
> > >  static inline unsigned long _pmd_pfn(pmd_t pmd)
> > >  {
> > > -     return pmd_val(pmd) >> _PAGE_PFN_SHIFT;
> > > +     return (pmd_val(pmd) & _PAGE_CHG_MASK) >> _PAGE_PFN_SHIFT;
> > >  }
> >
> > The "(pud_val(pud) & _PAGE_CHG_MASK) >> _PAGE_PFN_SHIFT" expression begs
> > for readable and well-documented helper.
> 
> How about these:
> #define _chg_of_pmd(pmd)  (pmd_val(pmd) & _PAGE_CHG_MASK)
> #define _chg_of_pud(pud)  (pud_val(pud) & _PAGE_CHG_MASK)

I'd use inline functions instead of macros if possible, but otherwise
yes.

> How about :
> 
> extern unsigned long  _svpbmt_mask
> extern unsigned long _svpbmt_mt_pma
> extern unsigned long _svpbmt_mt_nc
> extern unsigned long _svpbmt_mt_io
> 
> #define _PAGE_MT_MASK              _svpbmt_mask
> #define _PAGE_MT_PMA        _svpbmt_mt_pma
> #define _PAGE_MT_NC          _svpbmt_mt_nc
> #define _PAGE_MT_IO           _svpbmt_mt_io

Looks much better.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
