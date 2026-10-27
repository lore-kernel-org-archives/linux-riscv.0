Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B181606A329
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 14:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BDeP9q35;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JVpSAE7s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5OSEY1Vs715+FM/9EPL1cYoJFzM30bjkEfoWbKlmNL4=; b=BDeP9q35/1z+oYAEt3LhTx3hYf
	Xh2rj0b3+hLL6I5iMuV1PlGMK+JU4+p/uryRElkzFSn5Fy7RokD0LLhfiuV0GKgYMdSe6aAEtbiDF
	CwwtIctFo7/jLTbBb9XvgNvC/LibuulVSJig/0VQILM+F3u3ssTDSCd4Vsll8A2buJkNMdn2kwqVZ
	wa2dUMq9VuvH9BuH9VMHjg2/5Qo0qDWdq47oPHMWc+AZOkuJjMvNUh0R30uOM1dUsMYm5NiAAfI5v
	12TvVhy78KMJZFGqXaV0JyDvcUCkXMBck1ZeVL8MhuMgVlQs72l/FeR60wQeheRNiDqv3QKUMJ1XI
	lfNmficQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhmt-00000004ykx-35N5;
	Tue, 27 Oct 2026 14:04:27 +0000
Received: from out-163.mta1.migadu.com ([95.215.58.163] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhmq-00000004ykL-3rZp
	for linux-riscv@lists.infradead.org;
	Tue, 27 Oct 2026 14:04:26 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=6EV0y0rZNOrxKdLbmUoelWmdjOtw2TON5MFmaUpTBGs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793109862; v=1; x=1793714662;
 b=JVpSAE7sa/CBBarlh3S+abLMqE64/O5GkAFR6jFVMMd1YPsboVvsspq0Iqqumk4aGOJjzy4D
 DUjBLrBmcg6VGTf9Tq2EpIcDEdEcR1JKYSpIBDwOiHlcDvyWfVdL9y1Gj58CxhQH7rdh2K7LNdk
 PYf9iCvGMGj2cOyqnqyV7n2E=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta11.migadu.com with ESMTPS id 094579383d15bde2;
	Tue, 27 Oct 2026 14:04:21 +0000
X-Mizu-Trace-ID: 094579383d15bde2
X-Migadu-Flow: FLOW_OUT
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCHv7 13/18] mm: Drop fake head checks
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <d7a634b6-8668-4753-8bfc-e9334dde705e@kernel.org>
Date: Tue, 27 Oct 2026 22:03:54 +0800
Cc: Kiryl Shutsemau <kas@kernel.org>,
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
Message-Id: <4A32F5E6-977D-4720-8723-B19AFBC08FCF@linux.dev>
References: <20260227194302.274384-1-kas@kernel.org>
 <20260227194302.274384-14-kas@kernel.org>
 <ebc7bde1-f52e-4da8-b16f-822d6c0a4d74@kernel.org>
 <at_f43oDv73y-t7O@thinkstation>
 <f97a8d33-50b2-4a86-8381-ee840cdfa2f9@kernel.org>
 <20261027110028.GH2668564@noisy.programming.kicks-ass.net>
 <auCKv_omLGRc6wv2@thinkstation>
 <f3f3aca9-bdb7-4aec-9099-9fb63a60e61d@kernel.org>
 <auCZFckDfBMrlfxV@thinkstation>
 <070DDE5C-2183-4A8B-AC2D-891CAE15E581@linux.dev>
 <d7a634b6-8668-4753-8bfc-e9334dde705e@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_070425_196409_84769284 
X-CRM114-Status: GOOD (  16.44  )
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



> On Oct 27, 2026, at 21:35, David Hildenbrand (Arm) <david@kernel.org> wrote:
> 
> On 10/27/26 14:13, Muchun Song wrote:
>> 
>> 
>>> On Oct 27, 2026, at 20:31, Kiryl Shutsemau <kas@kernel.org> wrote:
>>> 
>>> On Tue, Oct 27, 2026 at 01:05:58PM +0100, David Hildenbrand (Arm) wrote:
>>>> 
>>>> Right. Without HVO we would just corrupt pages in the single folio (which is
>>>> also not nice).
>>>> 
>>>> I'm also questioning whether we need this RO protection all the time active.
>>> 
>>> What do you have in mind? RO only under a debug option, or switching the
>>> tail page to RO some time after the remap?
>> 
>> I don't think enabling RO only on debug kernels is a good choice.
>> 
>> Within ByteDance, we once successfully caught memory failures using RO (because
>> we backported HVO, but some missing commits in memory failure caused write
>> operations on tail pages to persist). These operations triggered invalid writes
>> to shared tail pages.
> 
> But would you have caught it with debug setting on in initial rollout / experiments?

Possibly, but we indeed didn't catch it during the testing phase.

The likely reason is that we hadn't anticipated issues in a corner
case like a memory failure. Also, it's worth noting that during our
test and verification phases, actual memory failures simply didn't
occur.

> 
>> 
>> Under the old HVO schema, this invalid write only corrupted one folio, but under
>> the new schema, it corrupts all HVOed folios. Therefore, I personally believe
>> that for the new schema, the value of RO is even greater.
> But doesn't that mean that you would find serious bugs faster one way or the other?
> 

Good question.

> Silent corruption of any folio state is not good.
> 

Under the new schema, an invalid write causes massive corruption,
which would likely result in an immediate and noticeable failure
(like a crash or oops). From a developer's perspective, this
definitely helps us "fail fast" and find the bug quickly.

So, let me think about what we actually lose without RO.

I believe the main difference is the debuggability of the crash context.
With RO, the hardware intercepts the write immediately and throws
a clear page fault with a call trace. Without RO, an invalid write
silently corrupts memory, and we might only find out later with no
clue where it happened.

Of course, losing this debuggability doesn't seem like a critical
issue after all. Thinking about it this way, restoring RW permissions
to fix this race condition seems like an acceptable trade-off.

Therefore, I am kind of leaning towards removing the RO protection
and restoring RW permissions to solve the race.

Thanks,
Muchun

> -- 
> Cheers,
> 
> David


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
