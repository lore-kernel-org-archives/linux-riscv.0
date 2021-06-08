Return-Path: <SRS0=YeFR=LC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A9FAC47082
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jun 2021 15:32:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1DDB261263
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jun 2021 15:32:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1DDB261263
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HbkP6Oa6DR/QiqmEpPbJn4mT/bKaYQoUY///O4/GZSQ=; b=e72kgnl98yJn2Y
	TbcAewKAGvyeJkwHozMQdUUk9JJXu+PrctAR6WiUaBQfkrWtjv0ZmKIiPo5ZTwqYKlu2VBDJpkC4h
	5eho2QzUGz2s7g+c8BmG3zwRauTmAb8Mv/eVhX6XjRbqAwssen9hXcnTjLqUmqFqY5c7YJ9NyCtE1
	7icFbUoUTnthwltd4GQJ914UQz6RdkHRhTp31CR06goE/pUDgv7I1vhp2vG/6i9LiKAzy8LTVgla5
	j5Ovz76cBYX7wHyCo3uPlifk+++yPU4WPQp1ofES5ulh5fgZCJo36BHLU2NDRaBR6CGrfQaI5/RFG
	3YHx5CPaD1ELaeNIXpOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqdi7-009EbX-MU; Tue, 08 Jun 2021 15:32:11 +0000
Received: from verein.lst.de ([213.95.11.211])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqdi4-009EZN-LO
 for linux-riscv@lists.infradead.org; Tue, 08 Jun 2021 15:32:10 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 7F6FC68B05; Tue,  8 Jun 2021 17:32:03 +0200 (CEST)
Date: Tue, 8 Jun 2021 17:32:03 +0200
From: 'Christoph Hellwig' <hch@lst.de>
To: David Laight <David.Laight@ACULAB.COM>
Cc: 'Christoph Hellwig' <hch@lst.de>, Guo Ren <guoren@kernel.org>,
 Nick Kossifidis <mick@ics.forth.gr>, Drew Fustini <drew@beagleboard.org>,
 Anup Patel <anup.patel@wdc.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
 "wefu@redhat.com" <wefu@redhat.com>,
 Wei Wu =?utf-8?B?KOWQtOS8nyk=?= <lazyparser@gmail.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>,
 Guo Ren <guoren@linux.alibaba.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Benjamin Koch <snowball@c3pb.de>,
 Matteo Croce <mcroce@linux.microsoft.com>, Wei Fu <tekkamanninja@gmail.com>
Subject: Re: [PATCH RFC 0/3] riscv: Add DMA_COHERENT support
Message-ID: <20210608153203.GA6802@lst.de>
References: <CAJF2gTTjwB4U-NxCtfgMA5aR2HzoQtA8a51W5UM1LHGRbjz9pg@mail.gmail.com>
 <20210519064435.GA3076809@x1> <20210519065352.GA31590@lst.de>
 <CAJF2gTR4FXRbp7oky-ypdVJba6btFHpp-+dPyJStRaQX_-5rzg@mail.gmail.com>
 <29733b0931d9dd6a2f0b6919067c7efe@mailhost.ics.forth.gr>
 <CAJF2gTTpSbNWS4VLHAu4XsV5-Vos=6R9MmPOx8-yzMFJu=wX4A@mail.gmail.com>
 <a8f2e68dcc1a6eb1ff3b95fcb8d0d0d2@mailhost.ics.forth.gr>
 <CAJF2gTQuQ5bE6HeGSoNaDynA0o3+KEo4snwft42YGzE=+DjKOQ@mail.gmail.com>
 <20210607062701.GB24060@lst.de>
 <2db975b5f24149b19191120b9f0f506b@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2db975b5f24149b19191120b9f0f506b@AcuMS.aculab.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_083208_873200_46E5DED9 
X-CRM114-Status: GOOD (  11.64  )
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

On Tue, Jun 08, 2021 at 03:00:17PM +0000, David Laight wrote:
> It is almost impossible to interface to many ethernet chips without
> either coherent or uncached memory for the descriptor rings.
> The status bits on the transmit ring are particularly problematic.
> 
> The receive ring can be done with writeback+invalidate provided you
> fill a cache line at a time.

It is horrible, but it has been done.  Take a look at:

drivers/net/ethernet/i825xx/lasi_82596.c and
drivers/net/ethernet/seeq/sgiseeq.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
