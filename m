Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E19CA0FE1
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 07:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yBxIQWb6E/4JXcuNhGGOjm0lD2BqwkpATyCKv0/SiQ8=; b=yiG+pHiYh5t5Kx
	jk25Dyyz9Vx54w513pYRQcrCubazzSnJOEbPj6l964INHpBtLhJqUMZug6lB4zKBFkBculRO4JZq6
	lnxjbbvMJhTGlv8gjxU6LkWvBvpNVMkXMaumMbKWewc/CnmBjj2ie2QRX4jKGLnWhEgo1B+a/33xx
	vcB5DUMTuhbIomdn/cxYsddopw/m12J20aGPfMWX8uvBaUK+Hs2MOsAOVUpMfZxberIc+u8Ht4qqV
	apDQ3OaqoZ9IO9R0g0hBb0YeqrtmqAxbf1hjxCw+aTcssrlgjGwgdS0F73PZM+uIOZPqkBp3qNJtP
	Czk7gjHvxRYI/BKd0+gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRzP-00000007Dlq-016j;
	Mon, 25 Aug 2025 07:51:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRPx-000000078t7-46Wu
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 07:15:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756106099;
	bh=eMGy4y29o/Xaojr66YRlL+mqETiAilNKbdnWyHcteLs=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=kK2qjz9JmVvoqJbD+9Z2wBdusaJYnGDPmASxy0tVLx+dYO/BpufQRmUxwhZILWCGY
	 XU7mzb/j2AgGn1PT4XVSPU+WLEmogXtQTIhUHJeQTMSGvGOW693yIzmaJ8fLbcQ2Zf
	 TtLcR1DvxIjOI25VfZOtzLhyh5PbZpRcJmPZA0J5UYkPteGoxeZ11nGAd3eblYsxGn
	 CDxzTf7MJZlv465pIZzrgFXb+3uRDM3YhN8OyMms1PvrN27kVTFD9rtaPOTLuGQWYG
	 GHZjSthrN1HEe05yGba1hjLeFocUYqA1NAs9tDD3OFNtWA2AqIzacsZK0dwrzg9e4S
	 3xOUmfKuPc9oQ==
Received: from [192.168.100.175] (unknown [103.151.43.82])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: usama.anjum)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 08E4B17E110D;
	Mon, 25 Aug 2025 09:14:53 +0200 (CEST)
Message-ID: <a3928ec4-8c2f-4f04-bab4-9ef5c87c57de@collabora.com>
Date: Mon, 25 Aug 2025 12:14:52 +0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@collabora.com, Shuah Khan <shuah@kernel.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Leon Romanovsky <leon@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, kevin.brodsky@arm.com, kernel@collabora.com
Subject: Re: [PATCH v3 0/8] selftests/mm: Add compiler flags and fix found
 warnings
To: Andrew Morton <akpm@linux-foundation.org>
References: <20250822082145.4145617-1-usama.anjum@collabora.com>
 <20250822174259.bf4ed76a0da7d0d6f80ba2c1@linux-foundation.org>
Content-Language: en-US
From: Muhammad Usama Anjum <usama.anjum@collabora.com>
In-Reply-To: <20250822174259.bf4ed76a0da7d0d6f80ba2c1@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_001502_202853_139D19AC 
X-CRM114-Status: GOOD (  17.68  )
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

On 8/23/25 5:42 AM, Andrew Morton wrote:
> On Fri, 22 Aug 2025 13:20:57 +0500 Muhammad Usama Anjum <usama.anjum@collabora.com> wrote:
> 
>> Recently, I reviewed a patch on the mm/kselftest mailing list about a
>> test which had obvious type mismatch fix in it. It was strange why that
>> wasn't caught during development and when patch was accepted. This led
>> me to discover that those extra compiler options to catch these warnings
>> aren't being used. When I added them, I found tens of warnings in just
>> mm suite.
>>
>> In this series, I'm adding these flags and fixing those warnings. In the
>> last try several months ago [1], I'd patches for individual tests. I've
>> made patches better by grouping the same type of fixes together. Hence
>> there is no changelog for individual patches.
> 
> I think it would be best to avoid adding warnings to selftests which
> aren't present in the main kernel code.  If only to avoid surprising
> people over what isn't permissible in selftests/.
> 
> In particular, there's an expectation that we can do
> 
> #else
> static inline int some_stub(type1 arg1, type2 arg2)
> {
> }
> #endif
> 
> without warning.  We do this extensively.

I'm only adding -Wunreachable-code -Wunused flags now. The above shouldn't
cause any warnings. I'll double check again in next series.

> 
> Also, please be aware that there's already a patch in mm-new which
> centralizes selftests' __maybe_unused definition.
> https://git.kernel.org/pub/scm/linux/kernel/git/akpm/25-new.git/tree/patches/selftests-centralise-maybe-unused-definition-in-kselftesth.patch
I'll rebase on top of it and send again.


-- 
---
Thanks,
Usama

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
