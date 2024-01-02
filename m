Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B742C47073
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 06:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8LSpWoAkBEC68BUgkbBC62KAdeWyZ7nr8LrULXnjgJk=; b=p81fd707d1xSWD
	QbPPgRIND+uTYlZ9m6U/2EIV8dEEK5MJ7rZcR4hsKrO9DifpeXaERpEEUUVs5xSizp+CLb6xtBU1P
	5fUpECdHmRjit7wCLgHVZZ2rcHnL/Hxs047QRS/NAMsnXWZD7n1DGMGOws5jJDd5VGdCJNYAWR+H8
	EtJftOsnR2oxn43IhG9L9Ie1w0GE+/STrRYdv22LMTmnasw8sw30ZcmgJJGI9n5N1dwf6USLuxVim
	8oKS1dKqGcq2J0i/0epyPA6ya+eXTTPXEExBbvcAAsmoO7F1+ERr6BDD+JMobqEAXaRa8SCvjJP/J
	ZXgQB9UY0cH9QTbnmKUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKYIi-007B4m-35;
	Tue, 02 Jan 2024 06:30:56 +0000
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKYIe-007B0j-1y;
	Tue, 02 Jan 2024 06:30:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1704177036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jogtFHqhtts+BmygiI65vHy3Sj9utOue/9xvsVCOd+4=;
	b=qmR26i0D49H8PdwABxnbTA/6T904fWdmEzd6KXl0wQjHSIy3X5dP4pqW+94RX26mni1cHM
	zLdOEu9mc1bcFwLhhpZo4RoOBAfeSKwJqgOB6pBH35ufB+EB7ejL7hIrrJnPQxw9YsHs3+
	RCHR/4odGFPxiCJ2mnjlJCWZAb9aI3E=
Mime-Version: 1.0
Subject: Re: [PATCH 05/13] mm: Introduce vma_pgtable_walk_{begin|end}()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <ZZOhlB-KK4hF3PgY@x1n>
Date: Tue, 2 Jan 2024 14:29:56 +0800
Cc: LKML <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>,
 Matthew Wilcox <willy@infradead.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Lorenzo Stoakes <lstoakes@gmail.com>,
 David Hildenbrand <david@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 Mike Rapoport <rppt@kernel.org>,
 Christoph Hellwig <hch@infradead.org>,
 John Hubbard <jhubbard@nvidia.com>,
 Andrew Jones <andrew.jones@linux.dev>,
 linux-arm-kernel@lists.infradead.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 linuxppc-dev@lists.ozlabs.org,
 Rik van Riel <riel@surriel.com>,
 linux-riscv@lists.infradead.org,
 Yang Shi <shy828301@gmail.com>,
 James Houghton <jthoughton@google.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Andrea Arcangeli <aarcange@redhat.com>,
 Axel Rasmussen <axelrasmussen@google.com>
Message-Id: <B82206E4-2C43-40EE-8337-0DC9FF37F7E9@linux.dev>
References: <20231219075538.414708-1-peterx@redhat.com>
 <20231219075538.414708-6-peterx@redhat.com>
 <0D9E28F4-AFA8-479C-8311-093DAFD9DF41@linux.dev> <ZZOhlB-KK4hF3PgY@x1n>
To: Peter Xu <peterx@redhat.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240101_223052_792965_4A25AD23 
X-CRM114-Status: UNSURE (   8.65  )
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



> On Jan 2, 2024, at 13:39, Peter Xu <peterx@redhat.com> wrote:
> 
> On Mon, Dec 25, 2023 at 02:34:48PM +0800, Muchun Song wrote:
>> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> 
> You're using the old email address here.  Do you want me to also use the
> linux.dev one that you suggested me to use?

Either is OK for the RB tag.

> 
> -- 
> Peter Xu
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
