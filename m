Return-Path: <SRS0=gWek=OQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F8BC64EB1
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 19:59:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E0D220868
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  7 Dec 2018 19:59:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IDG0v/QM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E0D220868
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4PqE5C0V8JA17gwujGqw3N30FERufvkAJHwnv0Axl2s=; b=IDG0v/QMea6Wyz
	UZdkJeVHyD2qW+FGjWhsOlLG2OslxsGRCl5lPRB1CP7siNSSMGZPoPa1WZKLj3A3bj3dqLkIfPeH/
	2KSOejy/9MTIsOwez7n171ro8kvZeINsQW+mnHvpjx7M0GbHRMXA1OFIaDXecV4aeenk2aJHOkqPa
	elLOqVnZZUL1jsraVFoqhgd8beCdNmQykcJ2yVmfJo64qQ4mxRkddbEm6cMCUiA/6teW9GAhDU4S3
	xMh4S2xp1EDEEGnZZnzEfKKZQFBAnRG7TNkiHfNj5T+ydO2wttHdCV6V1cNSF1Jj6CApTQYKQMhjY
	g+T8hzkcKwjtlCqvZuFg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVMHm-0003uI-Gr; Fri, 07 Dec 2018 19:59:42 +0000
Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVMHc-0003j3-Kc; Fri, 07 Dec 2018 19:59:33 +0000
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id C0002BAF;
 Fri,  7 Dec 2018 19:56:27 +0000 (UTC)
Date: Fri, 7 Dec 2018 11:56:26 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH 2/2] mm/sparse: add common helper to mark all memblocks
 present
Message-Id: <20181207115626.dd578402f407e3df798aad0c@linux-foundation.org>
In-Reply-To: <71168447-7470-d2ba-d30e-200ff6202b35@deltatee.com>
References: <20181107173859.24096-1-logang@deltatee.com>
 <20181107173859.24096-3-logang@deltatee.com>
 <20181107121207.62cb37cf58484b7cc80a8fd8@linux-foundation.org>
 <71168447-7470-d2ba-d30e-200ff6202b35@deltatee.com>
X-Mailer: Sylpheed 3.6.0 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_115932_690955_246BF451 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org, Oscar Salvador <osalvador@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, 6 Dec 2018 10:40:31 -0700 Logan Gunthorpe <logang@deltatee.com> wrote:

> Hey Andrew,
> 
> On 2018-11-07 1:12 p.m., Andrew Morton wrote:
> > Acked-by: Andrew Morton <akpm@linux-foundation.org>
> > 
> > I can grab both patches and shall sneak them into 4.20-rcX, but feel
> > free to merge them into some git tree if you'd prefer.  If I see them
> > turn up in linux-next I shall drop my copy.
> 
> Just wanted to check if you are still planning to get these patches into
> 4.20-rcX. It would really help us if you can do this seeing we then
> won't have to delay a cycle and can target the riscv sparsemem code for
> 4.21.
> 

Ah, OK, I assumed that it would be merged via an arm tree.

I moved 

mm-introduce-common-struct_page_max_shift-define.patch
mm-sparse-add-common-helper-to-mark-all-memblocks-present.patch

to head-of-queue.  Shall send to Linus next week.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
