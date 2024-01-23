Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52FECC47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 15:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6h4VlVmL6qByXHnnKBpDKFzExfijVU2KI1FUi0t4SWI=; b=QUz0iB4PDwqS+p
	Qc7aiRoFPsAgzYyGsQNvbNWQa3NU+asFNduiUSxu7pepP482k4OLy6pg0uQZgB3y2yFQXu8Kmhiwb
	cssNVBOrF3eenCamK49GfItMkJr5ujsOro2cGp+FexdpEm2oa/NL6XZfan4Qh80Hw9Aw1LIQGS3Lc
	sumiUWerprDn7A/YDgbIbDlOgmeGZvbEKxadeFeX9BHPaY66AfKIlc8h/mU/L6TXXLy+e72W37Qe3
	jF7ZB7Klf8zmuCZbtD+O+VVNkatXQSZI/mPI4x5IhqhZMMMCsoPBZ77iz+UbVRkp7iRuuvSZtSv03
	j8Qd3xqGMea6vIfe6VQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSIbT-00H1Fm-1F;
	Tue, 23 Jan 2024 15:22:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSIbJ-00H1C9-0c;
	Tue, 23 Jan 2024 15:22:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 985121FB;
	Tue, 23 Jan 2024 07:22:51 -0800 (PST)
Received: from [10.57.77.165] (unknown [10.57.77.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1AB543F5A1;
	Tue, 23 Jan 2024 07:22:01 -0800 (PST)
Message-ID: <90a9b1e5-9203-4baf-a69a-69b4f9ad73d5@arm.com>
Date: Tue, 23 Jan 2024 15:22:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/11] arm/pgtable: define PFN_PTE_SHIFT on arm and
 arm64
Content-Language: en-GB
To: Matthew Wilcox <willy@infradead.org>
Cc: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, "David S. Miller"
 <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-2-david@redhat.com>
 <fdaeb9a5-d890-499a-92c8-d171df43ad01@arm.com>
 <Za_U0kYHGFkJdSss@casper.infradead.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <Za_U0kYHGFkJdSss@casper.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_072209_279547_029E9E5E 
X-CRM114-Status: GOOD (  11.99  )
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

On 23/01/2024 15:01, Matthew Wilcox wrote:
> On Tue, Jan 23, 2024 at 10:34:21AM +0000, Ryan Roberts wrote:
>>> +#define PFN_PTE_SHIFT		PAGE_SHIFT
>>
>> I think this is buggy. And so is the arm64 implementation of set_ptes(). It
>> works fine for 48-bit output address, but for 52-bit OAs, the high bits are not
>> kept contigously, so if you happen to be setting a mapping for which the
>> physical memory block straddles bit 48, this won't work.
> 
> I'd like to see the folio allocation that can straddle bit 48 ...
> 
> agreed, it's not workable _in general_, but specifically for a memory
> allocation from a power-of-two allocator, you'd have to do a 49-bit
> allocation (half a petabyte) to care.

Hmm good point. So its a hypothetical bug, not an actual bug. Personally I'm
still inclined to "fix" it. Although its going to cost a few more instructions.
Shout if you disagree.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
