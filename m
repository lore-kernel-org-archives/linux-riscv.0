Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F408ACD5BD1
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 12:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NjM+1dmdDEiPcN8Xn5nDBELkYf5hIvMkLHK1KpzTHXk=; b=3mSgygrIIYSdce
	B9JB8cFSz+SL1ib0A1F8r/yUtiUXN57jporBHjQ6uw7LVsk+ruhUhJQXRedpzKBTTtpFtLabEMDhV
	rd9Eqw00j838yfgurl38RmL0knh2GWUK2jnK548eOp0Moc1RDei6MhAYQbcPZTx3tVs+44kxK8QJU
	z88Et1Vzz7Nb3ZW5zGMB9832mBOre5yBwhlclmHCeHd286LOt1Y0gPd9kU1INdFZxAWQAwf29+cmr
	61oCKWdtGKtZjFpFx6n/6nPWe/EbJReLh09USBcFiL7C58Cw6Vkm4DyPrGdmy8fOU8VSCGtSMZBHO
	y/VoVARey2BNgQRMgreg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1kJ-0000000B7yl-48iu;
	Mon, 01 Jun 2026 12:27:55 +0000
Received: from out-183.mta1.migadu.com ([2001:41d0:203:375::b7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU1kH-0000000B7w0-0gp7
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 12:27:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780316852;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9SZo5S/dgDqG8hXBhyprQZKAwoZuXhbxuoMvMnMzdUE=;
	b=taJxZziKn4woYglDXIvNCebPtG3Ett1MjiIFDKupB8/vwlbR/030Sh3VZlm77BCTnpmoG/
	rKoPBIkFdC9v9EftiInYZUlXr+q/jFF/8okro3ZtUpL84t5w/njL0YRB0TN1eiiMzWl6HF
	ljUQhnWpMMyGxM8ydCYaS7vcjT7YQjI=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v3 4/5] loongarch/mm: drop vmemmap_check_pmd helper and
 use generic code
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <8c60f9bb-7a4a-4340-b414-9f7fbef4150c@kernel.org>
Date: Mon, 1 Jun 2026 20:26:47 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Andreas Larsson <andreas@gaisler.com>,
 "David S. Miller" <davem@davemloft.net>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org,
 Alexandre Ghiti <alex@ghiti.fr>,
 Albert Ou <aou@eecs.berkeley.edu>,
 WANG Xuerui <kernel@xen0n.name>,
 Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>
Message-Id: <0C8C9C2B-2EDA-47DB-AC54-237F2127A6A8@linux.dev>
References: <20260601084845.3792171-1-songmuchun@bytedance.com>
 <20260601084845.3792171-5-songmuchun@bytedance.com>
 <8c60f9bb-7a4a-4340-b414-9f7fbef4150c@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_052753_372465_E29BD65B 
X-CRM114-Status: UNSURE (   8.92  )
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



> On Jun 1, 2026, at 20:24, David Hildenbrand (Arm) <david@kernel.org> wrote:
> 
> On 6/1/26 10:48, Muchun Song wrote:
>> The generic implementations now suffice; remove the loongarch copies.
> 
> You are only removing a single function? So "copy"

Yes. I copied the commit message from other commit and forgot to update
accordingly.

> 
> 
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks.

> 
> -- 
> Cheers,
> 
> David


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
