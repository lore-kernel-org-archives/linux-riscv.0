Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E8C606A327
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 13:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HEOElEsi;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ajjRSYjH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8L/UNzTxQ5y1tH7kcMoixQ8x4e12lS3xtk/a0PSq7Go=; b=HEOElEsixZU7wMj92NpduiiY90
	9hOf1MT88Y9cDkQJiaxDWmYtA13TjV3FXJEdIB4EqArVc5YtXL7AiMsJ4N5Udlp7++cX5YlxXPZPn
	hDczzOZ1s2Ei/c6deCewGdEW3yNwtLu5z5I7SO2ljPlNQou0PUX934KC3wXDmoDja7mnMCbRg9Xac
	BqeyFgdIt4eLzhc19hlK9sTiBIcfoV0PGwYuOZE9soQyr1ZetK1UYCCBYiHqlL3qbzpoODpL1klKO
	UpdC5+1nwu1XNskLrskRsvkOwu5OAQzKhvtXKVM1MsRfaF1ix2BqhS5tISzeWVFC6yaEhmNAe90ul
	YUpjjjmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLh0X-00000004lWh-0NjR;
	Tue, 27 Oct 2026 13:14:29 +0000
Received: from out-133.mta0.migadu.com ([2001:41d0:1004:224b::85] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLh0U-00000004lVZ-2h9J
	for linux-riscv@lists.infradead.org;
	Tue, 27 Oct 2026 13:14:28 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=m3gTecYYwq2jZUjUle1w7O+ULuPN4Q/r80sxuGVnYTA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793106864; v=1; x=1793711664;
 b=ajjRSYjHFYuNa/S1FAovfJgvU9eBuzz0cefMPjG3K5sLx+1eCR6qnER3QIEnWCDqS1CKx99k
 reeKOqTgSWJDgBMTs9yAQu1VwaENazBo9/Te9qKh6T8ezL3THGkbiwnTOa8owwaqTKpduTvZ3kO
 xmKoEt6jNwmhfg0YcmtOCC/Y=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta12.migadu.com with ESMTPS id 1793c71c60f3bc72;
	Tue, 27 Oct 2026 13:14:23 +0000
X-Mizu-Trace-ID: 1793c71c60f3bc72
X-Migadu-Flow: FLOW_OUT
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCHv7 13/18] mm: Drop fake head checks
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <auCZFckDfBMrlfxV@thinkstation>
Date: Tue, 27 Oct 2026 21:13:58 +0800
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
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
 linux-riscv@lists.infradead.org,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>
Message-Id: <070DDE5C-2183-4A8B-AC2D-891CAE15E581@linux.dev>
References: <20260227194302.274384-1-kas@kernel.org>
 <20260227194302.274384-14-kas@kernel.org>
 <ebc7bde1-f52e-4da8-b16f-822d6c0a4d74@kernel.org>
 <at_f43oDv73y-t7O@thinkstation>
 <f97a8d33-50b2-4a86-8381-ee840cdfa2f9@kernel.org>
 <20261027110028.GH2668564@noisy.programming.kicks-ass.net>
 <auCKv_omLGRc6wv2@thinkstation>
 <f3f3aca9-bdb7-4aec-9099-9fb63a60e61d@kernel.org>
 <auCZFckDfBMrlfxV@thinkstation>
To: Kiryl Shutsemau <kas@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_061427_158124_038137D9 
X-CRM114-Status: GOOD (  15.08  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> On Oct 27, 2026, at 20:31, Kiryl Shutsemau <kas@kernel.org> wrote:
> 
> On Tue, Oct 27, 2026 at 01:05:58PM +0100, David Hildenbrand (Arm) wrote:
>>> Writing this, I just realized that we have another option -- map the
>>> shared tail page writable. A failing LOCK CMPXCHG writes back the value
>>> it read, and the get never changes a zero refcount, so the race becomes
>>> harmless. The cost is the protection: the page is shared by every
>>> hugetlb folio of that order in the zone, so a stray write to any tail
>>> silently corrupts all of them instead of oopsing.
>> 
>> Right. Without HVO we would just corrupt pages in the single folio (which is
>> also not nice).
>> 
>> I'm also questioning whether we need this RO protection all the time active.
> 
> What do you have in mind? RO only under a debug option, or switching the
> tail page to RO some time after the remap?

I don't think enabling RO only on debug kernels is a good choice.

Within ByteDance, we once successfully caught memory failures using RO (because
we backported HVO, but some missing commits in memory failure caused write
operations on tail pages to persist). These operations triggered invalid writes
to shared tail pages.

Under the old HVO schema, this invalid write only corrupted one folio, but under
the new schema, it corrupts all HVOed folios. Therefore, I personally believe
that for the new schema, the value of RO is even greater.

Thanks,
Muchun

> 
> If it is the delay, a grace period alone does not close the race. We
> would need rcu_read_lock() back around the get, and then it is the old
> scheme with the wait taken off the allocation path.
> 
> -- 
>  Kiryl Shutsemau / Kirill A. Shutemov


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
