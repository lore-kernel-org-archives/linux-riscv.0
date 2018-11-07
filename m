Return-Path: <SRS0=abkI=NS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DAEC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 20:56:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF0C42086C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 20:56:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SHNb7PZo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF0C42086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4qAX/3iCtup3Lxs1WR9txRsGhY/1dgYBrgMmLBbkxvc=; b=SHNb7PZoQBNEkT
	qWJMgKWiwKBcG05r68Xj1ffkEBK7Nu+R8kcJ7vrzz3c+x325p6mDOsbRucty9HWqezRVwXh3Na9tI
	FJrvvaKK/63t5Wbc0aArUcenXGuVn11jDOXJfj4FCahyJknXrulzhJpIxLVaSNQnfsnqFVvxv8WS5
	QHhu5uhFhNlVgDJN2pzlJcQqTlKyucMA2oiErPa0SXsMSYFwjmsZvLDg2UhIQnxlJkFXFBZdaxN5m
	IgL5Fuo/AtYU+/EbZX+ru6r9NnDWIcUP9FmBf58jLZs+vZKTStp3uml0j3Nsa4PTHFptRJf3XBlOP
	r593L58BE7W1SR/ZjFew==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKUsU-0001Hr-St; Wed, 07 Nov 2018 20:56:42 +0000
Received: from galois.linutronix.de ([2a01:7a0:2:106d:700::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKUsS-0001GQ-4n; Wed, 07 Nov 2018 20:56:41 +0000
Received: from p4fea46ac.dip0.t-ipconnect.de ([79.234.70.172]
 helo=nanos.glx-home)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1gKUs9-0008T8-VQ; Wed, 07 Nov 2018 21:56:22 +0100
Date: Wed, 7 Nov 2018 21:56:21 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 2/2] mm/sparse: add common helper to mark all memblocks
 present
In-Reply-To: <20181107123838.1b7234c98a87dec5a2b25e67@linux-foundation.org>
Message-ID: <alpine.DEB.2.21.1811072153590.1666@nanos.tec.linutronix.de>
References: <20181107173859.24096-1-logang@deltatee.com>
 <20181107173859.24096-3-logang@deltatee.com>
 <20181107121207.62cb37cf58484b7cc80a8fd8@linux-foundation.org>
 <724be9bb-59b6-33f3-7b59-3ca644d59bf7@deltatee.com>
 <alpine.DEB.2.21.1811072125280.1666@nanos.tec.linutronix.de>
 <b1cc442e-7314-4a8e-3eec-9adc200d7582@deltatee.com>
 <20181107123838.1b7234c98a87dec5a2b25e67@linux-foundation.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181107_125640_323902_455789FC 
X-CRM114-Status: GOOD (  16.46  )
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
Cc: linux-arch@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-kernel@vger.kernel.org,
 Stephen Bates <sbates@raithlin.com>, linux-mm@kvack.org,
 Michal Hocko <mhocko@suse.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-riscv@lists.infradead.org, Logan Gunthorpe <logang@deltatee.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181107205621.MwHo-nkH89HQU6_5yv75svtlxmzDUTnb534cyT0iALk@z>

On Wed, 7 Nov 2018, Andrew Morton wrote:
> On Wed, 7 Nov 2018 13:36:34 -0700 Logan Gunthorpe <logang@deltatee.com> wrote:
> 
> > > Actually if both names suck, then there also is the option to rename both
> > > instead of adding a comment to explain the suckage.
> > 
> > Ok, well, I wasn't expecting to take on a big rename like that as it
> > would create a patch touching a bunch of arches and mm files... But if
> > we can come to some agreement on a better name and someone is willing to
> > take that patch without significant delay then I'd be happy to create
> > the patch and add it to the start of my series.
> 
> Some other time ;)

More precise: Manjana. You live way too close to Mexico :)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
