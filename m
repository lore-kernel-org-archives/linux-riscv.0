Return-Path: <SRS0=abkI=NS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85685C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 20:12:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45DDA2081D
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Nov 2018 20:12:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oyGGOsaQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bU9aHLcE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45DDA2081D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qbv7jNvMelduQaZaqWEumqVzQDh4mzACFvjxasRUh+k=; b=oyGGOsaQ7wv0SE
	wahNrY4eoLogUUaCgivZS7JW2MSx7hNnBsgty74xBX3K7U6KsGQO/i4BaZ+4Vu9f9gM44QYsZ5H3h
	xk6HNp1zuBAVIuGIeZ9pKUamk8+wjO/r+Iqt9xoc0LeFo/4IJay61NdgJs0M7Pii/X+18aKfVTL1B
	NEKMJPKlps13HLAxKLbrSazVoYJlQnRhGRBGpj3Wy7jene7u0E5kbmLfIYiewFbZRohjAWtytjcYk
	c6M9RDehjWF8mBl02MAloW1ugK3HTBv43QdX7DWqUbXG8u35/7LNvt1nyj2IRYyhoIRUTC1VnCd4A
	mlZm3cZhQRFNNKl0Uy6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKUBo-0003Sl-Is; Wed, 07 Nov 2018 20:12:36 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKUBe-0003Br-Ez; Wed, 07 Nov 2018 20:12:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YR+C7uYku4Vx6+s9XTW6/9/BglCmC87NsPi3dbDMCB0=; b=bU9aHLcE1XoHug8m0tlcDs+rrY
 CkB3CQrLBc92N56QYSX/jBVSBdKpN/l2VvfnN8JQgYUELCRptAB5OWZQFQB/dlyPuXCnM+D3I0b0Z
 ghNaFiDOE3/OWn0/Dao/64xG+9Oxy6FX7aIC/xC9ZeY9E7oy38A1Lyx6pTAW4i1y/uQJd51RgMbQK
 Y4a04ADG3zdi+bB7t2FJTqKe6sglDoQqzvCTICw3oZMVKVoBg5wvqSwrsl4bjkZfoYeVPjNe77Xax
 V+uR0J9CMNh9nl2COOQWGhJkySTobN5Up/V/jnQa0JZEGsWAmbhT/sFf124TWCNWEgRoJH6YWFEwZ
 kcqkbqnA==;
Received: from mail.linuxfoundation.org ([140.211.169.12])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKUBb-00027Q-LZ; Wed, 07 Nov 2018 20:12:24 +0000
Received: from akpm3.svl.corp.google.com (unknown [104.133.8.65])
 by mail.linuxfoundation.org (Postfix) with ESMTPSA id 17165AF7;
 Wed,  7 Nov 2018 20:12:09 +0000 (UTC)
Date: Wed, 7 Nov 2018 12:12:07 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Logan Gunthorpe <logang@deltatee.com>
Subject: Re: [PATCH 2/2] mm/sparse: add common helper to mark all memblocks
 present
Message-Id: <20181107121207.62cb37cf58484b7cc80a8fd8@linux-foundation.org>
In-Reply-To: <20181107173859.24096-3-logang@deltatee.com>
References: <20181107173859.24096-1-logang@deltatee.com>
 <20181107173859.24096-3-logang@deltatee.com>
X-Mailer: Sylpheed 3.6.0 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181107_151223_834417_0EC181B1 
X-CRM114-Status: GOOD (  16.58  )
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
Message-ID: <20181107201207.yCzYIP8sbHeSQ6mPa0KAJXQ1Dw2AH5k8qrbwxD-nPBI@z>

On Wed,  7 Nov 2018 10:38:59 -0700 Logan Gunthorpe <logang@deltatee.com> wrote:

> Presently the arches arm64, arm and sh have a function which loops through
> each memblock and calls memory present. riscv will require a similar
> function.
> 
> Introduce a common memblocks_present() function that can be used by
> all the arches. Subsequent patches will cleanup the arches that
> make use of this.
> 
> ...
>
> --- a/mm/sparse.c
> +++ b/mm/sparse.c
> @@ -239,6 +239,17 @@ void __init memory_present(int nid, unsigned long start, unsigned long end)
>  	}
>  }
>  
> +void __init memblocks_present(void)
> +{
> +	struct memblock_region *reg;
> +
> +	for_each_memblock(memory, reg) {
> +		memory_present(memblock_get_region_node(reg),
> +			       memblock_region_memory_base_pfn(reg),
> +			       memblock_region_memory_end_pfn(reg));
> +	}
> +}
> +

I don't like the name much.  To me, memblocks_present means "are
memblocks present" whereas this actually means "memblocks are present".
But whatever.  A little covering comment which describes what this
does and why it does it would be nice.

Acked-by: Andrew Morton <akpm@linux-foundation.org>

I can grab both patches and shall sneak them into 4.20-rcX, but feel
free to merge them into some git tree if you'd prefer.  If I see them
turn up in linux-next I shall drop my copy.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
