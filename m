Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20E18CCFA13
	for <linux-riscv@archiver.kernel.org>; Fri,  1 May 2026 16:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YcbThHJmPDx//hZMuQGA0ARtEpHXNh9PVafru+duJJE=; b=XmBBHB3vOLPrEf
	sqabl0Ot0q91YELOeRLxPMeGhpfo0N9iqQd+7i3xYuSCqao9YU0yj2uJWCvhICO2cctGPgLr3384a
	Z6rqWhCvDue1oqGvK6exk99lzUoXa84pctT7V4jDLVf2Xr6V5YphmcJ0m2KFdyNgIUpeVk7KRcd7C
	9WpVNFs4qlC1C2BdDmYlqCxBQqkuOP8xL4CQSWeb0/BiOziOFsiZOXkpe8jdKVAaAWWvBIMkeyHsJ
	YB1XAhae6gG2x+/hny513/Nkt0OyawM8zRiTl7MLkmP+OSqB6KxV++SEA6yvFDnuKcrpXEIaonm2R
	tAO2rg9/y+9YGQWuBGTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIqNc-00000007O2W-0MZJ;
	Fri, 01 May 2026 16:06:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIqNa-00000007O2G-0zl8;
	Fri, 01 May 2026 16:06:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HCOnYxAIgiWvR0Bg9Z3oQP7NtLB+AbBygf9mhxuV9oQ=; b=WFSklIdwMHQLNKo0hSt8FUEdor
	8PWAceSimwETsGI72z85Zv4wA/tsNlycLa8f6sQG/Aw6w8RnhXi0Af5mjum18LwybDyAvb1+Uxh9f
	Eq5T7ug+O10pWFjftTfOmniisY01PyMq7+2peSvdamJ+AAvHZRIQTazUoIUXsplGALDIdW/42jR8p
	U9uUO/7PltvaGp/EEhx55GmxP2PijjP4N8jL7/SdhnE0m0apJTc1yrnAE6WrXuehMZUnK54FJ0YvF
	M5qMff6H54NLzO+TN+U51R/JiQDmY0k5rW4FXREurwavyb9AebilT1ieN2HbK2yQvGHgLvA2FHU0e
	rgYRe6xw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIqNP-000000091GR-0gTr;
	Fri, 01 May 2026 16:06:03 +0000
Date: Fri, 1 May 2026 17:06:02 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: "Barry Song (Xiaomi)" <baohua@kernel.org>, akpm@linux-foundation.org,
	linux-mm@kvack.org, david@kernel.org, liam@infradead.org,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, jack@suse.cz, pfalcato@suse.de,
	wanglian@kylinos.cn, chentao@kylinos.cn, lianux.mm@gmail.com,
	kunwu.chan@gmail.com, liyangouwen1@oppo.com, chrisl@kernel.org,
	kasong@tencent.com, shikemeng@huaweicloud.com, nphamcs@gmail.com,
	bhe@redhat.com, youngjun.park@lge.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
Message-ID: <afTPamwDbtY_tgk_@casper.infradead.org>
References: <20260430040427.4672-1-baohua@kernel.org>
 <afNM-gIqxpyJ6ro7@casper.infradead.org>
 <afTKsSj0i-ZkRZN5@lucifer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <afTKsSj0i-ZkRZN5@lucifer>
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

On Fri, May 01, 2026 at 04:52:12PM +0100, Lorenzo Stoakes wrote:
> After a brief eyeball I share Matthew's assessment, I really don't like this
> series, it's piling on complexity for what seem like niche cases.

I don't think they're niche cases ... I think it's a real problem.
While our current code performs better for this workload than the
pre-vma-lock code did, it doesn't perform as well as it could.

> We already have enough weirdness in fault code honestly.
> 
> Let's maybe discuss at LSF if you're attending?

Not only is he attending, there's a topic scheduled (currently 10:30 on
Wednesday).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
