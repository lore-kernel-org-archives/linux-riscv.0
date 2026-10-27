Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F266E606A324
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 12:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SGkT1TVi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fdlPxkHc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5YmkbHE9EtwZsX6oIjrafr3DPrKIPGRiQ45WlFvZgOU=; b=SGkT1TViKMFKQ17ADONTIdmQrl
	Lw8PQHpH/6PJJD9yO0FkfD0svG4jny6rPUxeNvoWBWyTBaaKnuCKfSx7MYY+fl7kGmkvA2XkN8EnZ
	TgYbaYZnzTys+r8WGWwxVAgJgBaecLLOfVKmeW+K29k2AkMDBwJE96WLr88FBwDPj15aHDexHBgtH
	ah+D86IpxoI9Qup3/kpOfGxdumhbEyr7xj/oF+VJdSxIXRC/ICbYflmCd4RaPVkqwrBOKpUC/FR8S
	96veOo+BbHaTzmw/cX1odaSLbSsSJLr4EG4HQX8NffhXpXN/RAimxyGf3pu3qvHfKON122uwoyssh
	DvNoNWlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgKn-00000004fOB-3pbV;
	Tue, 27 Oct 2026 12:31:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgKm-00000004fO2-17MO
	for linux-riscv@lists.infradead.org;
	Tue, 27 Oct 2026 12:31:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 621A360230;
	Tue, 27 Oct 2026 12:31:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF7461F031E2;
	Tue, 27 Oct 2026 12:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793104279;
	bh=JA8h9KUew4bMbADI2oUInBzixioja4qGJWsGZbSCJpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fdlPxkHcRWR5vIjf+FkVNVYAWLRjlXa1UA/EkgWQPWGXfy2VMgeNXe9Lx1/4Euday
	 iLMMKDcWqXlGYbQHFDvjkIFpcq6fsBp/284V+Q1rUjKACna1xKBb5gJGAfi71MW/tU
	 061+/HAODvw+LuiYUJxUSWYd6lxEjdkHVwTvKsBRB2SQw9hlibBHcJDp542t0A7yjY
	 Ltcf8+j+8exOlJAxcV303BfaafVeoTCKFYfvTy7nMMEzindwLWjVfb4X+uS2rZl/V3
	 vZ94rdcKTpHgZwHyULF7X05UQDFxmAaRBrVQg+zxrIAwF5vLagySxromZp9WwFevI/
	 b9vw+VNle52dQ==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.ams.internal (Postfix) with ESMTP id C4148198003A;
	Tue, 27 Oct 2026 08:31:11 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 27 Oct 2026 08:31:16 -0400
X-ME-Sender: <xms:j5ngal-y604h5FHG0gXKO0JmoDwIL5zzPGd4jO3XJuWRuM9_zDhsEQ>
    <xme:j5ngaqLEQk3URLOEPxRY4eI0AJ_6xo_CoZNe0tDshbQ3sAFKU8ZeVq4MgnN_XMqiK
    _ua5k2oo1SM3kSqZI-xgTWMdqdbn9L6Er4vnooBn6Kz-JqBLvYqvaY>
X-ME-Received: <xmr:j5ngakfb0U-6wSKAMAAuXWa1RyM2CZOiZ_Wxt5QsSHbi7YIDHA2V047hFnU>
X-ME-Proxy-Cause: dmFkZTFr3RumHCfbQTlQHvPlXFybAsM2kuRamaLK+DcsHGJnUk2aCjGXXyr6NKWi0kroSr
    Oe85i3AcnkoxYUwKMUsCnYv3ol8I9M8cSn01GHV9AOTm5NfBjd+kCIjHiud1PAPzD5uXXl
    fN+b6rTVdtgXXvR1Z8eNRwhKI9yHxfQGGUEg7jRZegVt2fzj4kjjkHnB7T87ApQJ/YAHeu
    jWBHnlmzJHluxF9tAeEQxnoK263SXj0iYueuHFhGeOpOuCn6b2DvTIZwBEgN/+EwunXjB8
    CwEWM/ocJ/P7R/h2BXkq5SQ2kHartw+7bNjA0Gxa9vs0WmUsZFcGkZnIAoPCICn1WzThUZ
    qOz0AVGhp67x0YgaM1Ydxlnbw0N39OED89qvX5lcwiSM/HqWSxoVFWvTjUWcewSd7SviP7
    dQ04WcBrJE49hc8irsEuh6Xa8qmKhTv5+27sFoWEYs8ENR5FLW6D7hiRnsGUpkMI5MQceB
    UY8D9iJZ2kbY+0kfGnpFDbFzlSAgxEsNQH68IGiYsMcu566/hZL7hfXo0u3QYxpuXTE7Lf
    O/lVEviaducfFiifqy28iVecFxFVMJPrtttgxyJ2XsNCKh4pSCNIqqAiDWXSVimljJQasr
    nahIdUaatb5eDNRDlsczlK7MH5d2+R1Yg4ux3pWMJw8eTuDTZQQKwN8030Jg
X-ME-Proxy: <xmx:j5ngapdOe2vVgT2grTZ7td90xi5lIyt5aieIkbjFwmg3Etw7YEqT1g>
    <xmx:j5ngapmM3_rgC-TQdk-_fUW-n1fySSsx-acomwLSyc5CSAwThQykbQ>
    <xmx:j5ngaj-OF73Yr5lXoFTaJVTKBEidGV6F9smn42IfhmEA7VgztmdNDQ>
    <xmx:j5ngako9ZmvbpYbK1nNMAg6ZB9VOY2L_aR-L52n-Vgzbty7vHU_EIg>
    <xmx:j5ngapKn1Nv8aWmgJR2WTfb1wwuHd2q0Y6X_2YiP6_nGWPlBzweQOT1p>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Oct 2026 08:31:10 -0400 (EDT)
Date: Tue, 27 Oct 2026 12:31:09 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Muchun Song <muchun.song@linux.dev>, 
	Matthew Wilcox <willy@infradead.org>, Usama Arif <usamaarif642@gmail.com>, 
	Frank van der Linden <fvdl@google.com>, Oscar Salvador <osalvador@suse.de>, 
	Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, 
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, Dave Hansen <dave.hansen@linux.intel.com>, 
	Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCHv7 13/18] mm: Drop fake head checks
Message-ID: <auCZFckDfBMrlfxV@thinkstation>
References: <20260227194302.274384-1-kas@kernel.org>
 <20260227194302.274384-14-kas@kernel.org>
 <ebc7bde1-f52e-4da8-b16f-822d6c0a4d74@kernel.org>
 <at_f43oDv73y-t7O@thinkstation>
 <f97a8d33-50b2-4a86-8381-ee840cdfa2f9@kernel.org>
 <20261027110028.GH2668564@noisy.programming.kicks-ass.net>
 <auCKv_omLGRc6wv2@thinkstation>
 <f3f3aca9-bdb7-4aec-9099-9fb63a60e61d@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f3f3aca9-bdb7-4aec-9099-9fb63a60e61d@kernel.org>
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

On Tue, Oct 27, 2026 at 01:05:58PM +0100, David Hildenbrand (Arm) wrote:
> > Writing this, I just realized that we have another option -- map the
> > shared tail page writable. A failing LOCK CMPXCHG writes back the value
> > it read, and the get never changes a zero refcount, so the race becomes
> > harmless. The cost is the protection: the page is shared by every
> > hugetlb folio of that order in the zone, so a stray write to any tail
> > silently corrupts all of them instead of oopsing.
> 
> Right. Without HVO we would just corrupt pages in the single folio (which is
> also not nice).
> 
> I'm also questioning whether we need this RO protection all the time active.

What do you have in mind? RO only under a debug option, or switching the
tail page to RO some time after the remap?

If it is the delay, a grace period alone does not close the race. We
would need rcu_read_lock() back around the get, and then it is the old
scheme with the wait taken off the allocation path.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
