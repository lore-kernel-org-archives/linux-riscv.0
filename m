Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52727E8B396
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Feb 2026 03:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2wwbhxfNWYbsyRF9RH5Bzs5lNwdPk5Ad9sVC4mRTWVQ=; b=PfHwToOtecc+hI
	GL6fpjCoQ4XoX4FlQ2KQ+5R/JgoUeDmO/4CNh4toNqmQZD2LRR2+gLZVKIFqvo81XxqhCbbinnvnA
	6DSEhQBj8mX/THcM3pELF42nb69fjM6+LqRDbfImLjjD5+KJZo1lXi+jeknX0eIhPt5pyc98vQHqk
	T7rrg1NLUGpmNSHnjLU8od9usF4DEkcQ6voh4WelIslMs9EhkDrQimf51MX9uwJCa/0XgyMwNq2g3
	etkO1TCRFE/Km6X8Y1A1bMlb/5QR3+ETZwh0S/Q1VNgi5yJ2scOER2r7lKaVyufb1QPvrH1tl9s5c
	w8zW54jmymh9L9/+EidQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnTmo-00000007qhl-3V7r;
	Wed, 04 Feb 2026 03:42:38 +0000
Received: from out-177.mta1.migadu.com ([95.215.58.177])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnTml-00000007qLg-43F3
	for linux-riscv@lists.infradead.org;
	Wed, 04 Feb 2026 03:42:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770176430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Onih74rKhXQNkfzkcTR+Zq0Kg1PNfu8onD0zt1Z+qOs=;
	b=usqKfjbjQqGhGMX7b2myIEJwHkIgCA2hiWToeEcUL8WqIF6QvZMpKyiHrZTCEotjc/XuU5
	hrDYwyyf/mkZYKRDIdwxGzjQqypNpRQ2ezxi2dWRzE5gQ301xxUaeKxtXnz1t8CvaMPyEY
	CPkmIkZoqEon51/SAo3Y3y1+pjFyNM0=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCHv6 17/17] mm/slab: Use compound_head() in page_slab()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20260202155634.650837-18-kas@kernel.org>
Date: Wed, 4 Feb 2026 11:39:42 +0800
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
Message-Id: <69CF3AD0-F761-48FE-A7A9-20061ADA1A5C@linux.dev>
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-18-kas@kernel.org>
To: Kiryl Shutsemau <kas@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_194236_154850_E39DEB54 
X-CRM114-Status: UNSURE (   6.56  )
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
> page_slab() contained an open-coded implementation of compound_head().
> 
> Replace the duplicated code with a direct call to compound_head().
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>

Acked-by: Muchun Song <muchun.song@linux.dev>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
