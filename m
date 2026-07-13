Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16223C44507
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 16:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yClTrfxYnUKC3BapxdmC5Yqu510KxUXOGEdqDzlTcro=; b=tjke9Z++nSvqhd
	sVOy974januD0UaFNFcYmhv+61mbxrubPo14B6wbztQlVSyhVodHkmTSo74zjAoohSe/aBKBH+XY4
	W0i464lLBQeLVIuGTpjxHJc1wskQmScv5kkyNLKnzjX+4eaqAt+q9PqzrnINk+l7Vx0I5gSzqqKBw
	4I2w7af/GxKOvvlGZ5d2wFQ2tUHXsqWzVODR2+Z9VETRzFjUydxwixoRds6VXbHgK5LAoq++UQnzZ
	hFg/wbX/FodNdao7SQ1Dawra6YP9Wp/Oe2BX+Oe8DiikEzkbPKfYIG2cTUL4O3SJABZL/327OSuO7
	c00zWeOcaI6SQnj+ib2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJWi-00000009ydP-1Knp;
	Mon, 13 Jul 2026 16:29:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJWg-00000009yd5-1DFD
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 16:29:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 102F941FC0;
	Mon, 13 Jul 2026 16:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA341F000E9;
	Mon, 13 Jul 2026 16:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783960141;
	bh=CFDmixcUjoeF5+PlFwCEhk46S7uxAFIdPx361f4C1CQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=AbywF//uoTfPbKUnjWCbbXRhBTXlj10/bnq8WvBoRKz3OyYZQBjkWUpVRW4sS73uQ
	 k26h8Gj3JQo6mBpxHK5SbYlTHdo6ia1xxwIQoV2vfyOvFpQHHMkcvtza1vuPhIx2Th
	 q1/04r6c9gAamcYGBJAgz97VNhNiA37XNLrNALVPnZPbKRMuhv4+ip8kcBEZUm4HmI
	 8pncJF8EFHY2ywf3pHuGLDcCAvDe3BbGzrBV249qfZcDDOPojNt/tRgKwJzP9Eg+MW
	 vlmT8ur589pf7NICrCU3ocwDci/vDhuNPoCWNLO9weFX1WdPJTdZ/b5DjtdXRv7PEO
	 WAFwsZx8xJ5dg==
Date: Mon, 13 Jul 2026 10:28:58 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>
cc: Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>, 
    David Hildenbrand <david@kernel.org>, 
    "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
    Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Vlastimil Babka <vbabka@kernel.org>, linux-kernel@vger.kernel.org, 
    linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
    Muchun Song <muchun.song@linux.dev>
Subject: Re: [PATCH v6 0/2] mm/sparse-vmemmap: flush_cache_vmap() after
 hotplugging vmemmap
In-Reply-To: <20260713-mark-after-vmemmap-populate-v6-0-b945ceba29d4@iscas.ac.cn>
Message-ID: <4bc663fc-76ae-f6a0-32e1-6f9b1610f790@kernel.org>
References: <20260713-mark-after-vmemmap-populate-v6-0-b945ceba29d4@iscas.ac.cn>
MIME-Version: 1.0
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

On Mon, 13 Jul 2026, Vivian Wang wrote:

> Patch 1 is a bit of clean up that fixes the compilation error with patch
> 2, since VMEMMAP_{START,END} is not defined when MMU=n.
> 
> The mark_new_valid_map() thing doesn't do anything useful on MMU=n
> anyway, and the new_valid_maps_cpus_check code is only used on 64BIT, so
> I just made it all of it conditional on 64BIT && MMU. I hope this is
> acceptable.

Thanks, queued for v7.2-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
