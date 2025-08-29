Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD2DCA0EED
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Aug 2025 00:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n+3VdxjUywOPpUFlYaYP6s8QQ/gP3wOxs6rqWJjGNQo=; b=v2+vV6z4KTzIxh
	BpHQ6eR+n62ukW5Z+uHjCNwrkMhnNBeuyT2q8g8QcT34oJT4ZYEQa+B5EA6pxNDsAYxxJmea5v79g
	hIkKMgWAJDTE3TUrSgmsyjWFQ/JINImcugCFeSenhDvjeUNZbE8zi/r+nz8301QlaGuIIK/btccIU
	NnY8iR7L6a7X+poWrW00eCikca8qwL+IkyYh0+C1kUJIWTjlVZvraWxlrtBPHBMjGFRRpmUVM5xn9
	JVuCEjoVoz75gOumd3L7HmZlBFOy37WwrKAJZ4fYYjEgZFaL4VxpGhxejIw1iAgGa7ZXpnNlGfrHG
	+GZ6V/janx0Wb3GNGb7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urmyc-00000003rF6-1Ht1;
	Fri, 29 Aug 2025 00:28:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urmvs-00000003qoF-3PSb;
	Fri, 29 Aug 2025 00:25:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BA50844450;
	Fri, 29 Aug 2025 00:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12DD3C4CEEB;
	Fri, 29 Aug 2025 00:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756427131;
	bh=mcyLCjBm9bl4ZY6mSMuRJ2uZCphNIYGX7Xvto/pbXbA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u/oWKLrG9w8tVTD1fZ8iHMCTnvOpAvWDeHA6QKVbOxI5z3EsWkKOYpx+/EqygyXxT
	 JfsI9TgIRVHKumF8STASk0xFgWojfw7Ae2CzWwD/2Q2uuHXJXzQ2WP0cdMy2yD417H
	 CsBjZQp1WYO2XyxCtl17k56mMmCMHv9CfhW9EaopZS9VGhmJpwlMecnpjR6PhtJ/fj
	 GrN7kYbeVhnoRdeSLtAXW1b3kHoiS9DAKmAaknHskX5SZxQCo9ZS9tNyBpYomI4Vyl
	 stc7Srggmoj/YULxsLdMf7tTageVur4W6TC/Wx9ff7SP+zxWQrvIoTZdLNEPK/uv1q
	 9GQe8IoL25fMw==
Message-ID: <423566a0-5967-488d-a62a-4f825ae6f227@kernel.org>
Date: Fri, 29 Aug 2025 09:22:30 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 24/36] ata: libata-eh: drop nth_page() usage within SG
 entry
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, Niklas Cassel <cassel@kernel.org>,
 Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Jens Axboe <axboe@kernel.dk>,
 Johannes Weiner <hannes@cmpxchg.org>, John Hubbard <jhubbard@nvidia.com>,
 kasan-dev@googlegroups.com, kvm@vger.kernel.org,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Marco Elver <elver@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Muchun Song <muchun.song@linux.dev>,
 netdev@vger.kernel.org, Oscar Salvador <osalvador@suse.de>,
 Peter Xu <peterx@redhat.com>, Robin Murphy <robin.murphy@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Tejun Heo <tj@kernel.org>,
 virtualization@lists.linux.dev, Vlastimil Babka <vbabka@suse.cz>,
 wireguard@lists.zx2c4.com, x86@kernel.org, Zi Yan <ziy@nvidia.com>
References: <20250827220141.262669-1-david@redhat.com>
 <20250827220141.262669-25-david@redhat.com>
 <7612fdc2-97ff-4b89-a532-90c5de56acdc@lucifer.local>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <7612fdc2-97ff-4b89-a532-90c5de56acdc@lucifer.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_172532_878043_0D71719E 
X-CRM114-Status: UNSURE (   8.46  )
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

On 8/29/25 2:53 AM, Lorenzo Stoakes wrote:
> On Thu, Aug 28, 2025 at 12:01:28AM +0200, David Hildenbrand wrote:
>> It's no longer required to use nth_page() when iterating pages within a
>> single SG entry, so let's drop the nth_page() usage.
>>
>> Cc: Damien Le Moal <dlemoal@kernel.org>
>> Cc: Niklas Cassel <cassel@kernel.org>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> LGTM, so:
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Just noticed this:

s/libata-eh/libata-sff

in the commit title please.

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
