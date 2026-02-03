Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667C9E83040
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 03:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d99zJt40YrTlXNrTWA84cBDA9JWoChYBoEmWft9XDr8=; b=x1/1lnP0iT3jOM
	tuePSTGOmuQM65nVOfoAXKAMv6v17RpBNU/+x38VU1U2XFLIjie4OTBbsPHEbjwrP032b8yyXW48+
	V4jWMTq5LmYZIkdOm/oT4f72WSDbCTyhzhfwiLnqY82VtE+RBlAYcJwuBpXFh2M4+6rmXb+50GniP
	3wBO6/xwF0k5X4LG6wi3Py/8nHVZ8gv8oEZehSbjUw8It0wiRK6QMi1N88jSgMbjvIFCPdJ9zbJHG
	q/ez7lfyIS2aWAxT02NLU2a8dzmoa6pR+x6+ybk4wbcBJoWGSvUhWWTgD0Nt02S1tDa5+fBVUCxXJ
	zH93A42SLWjKR2p/O12Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn7DE-000000061Cg-0Vz7;
	Tue, 03 Feb 2026 03:36:24 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn7DA-000000061B5-3RLb
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 03:36:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770089766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KJxP6n3p44LkH03IkDqQsgS+GpBo2zU5MsWmp0JlB5A=;
	b=DhVo4INPC4Ons8xaBCpPzhhwL+sntJgmv9IgIoulLAZYf4pzz3ZpnHm6k400LdHZDLpymV
	RE4bhGg4+b+2pq+2qsmy0OYtR5wulCSX8hs4mU+edMcJEJJyb/vV+yKryUukukDMjvejJ5
	5aEU0wJ5Ls+w6TvtZLrP2w07z99oZXw=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCHv6 09/17] mm/sparse: Check memmap alignment for
 compound_info_has_mask()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260202155634.650837-10-kas@kernel.org>
Date: Tue, 3 Feb 2026 11:35:24 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>,
 Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>,
 Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 kernel-team@meta.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org
Message-Id: <C310A603-DB7F-4140-B045-7F1E3CC98C05@linux.dev>
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-10-kas@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_193621_007711_A67F20A7 
X-CRM114-Status: UNSURE (   7.18  )
X-CRM114-Notice: Please train this message.
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



> On Feb 2, 2026, at 23:56, Kiryl Shutsemau <kas@kernel.org> wrote:
> 
> If page->compound_info encodes a mask, it is expected that vmemmap to be
> naturally aligned to the maximum folio size.
> 
> Add a VM_BUG_ON() to check the alignment.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> Acked-by: Zi Yan <ziy@nvidia.com>

Reviewed-by: Muchun Song <muchun.song@linux.dev>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
