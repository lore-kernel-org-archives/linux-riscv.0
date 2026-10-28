Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD88606A31A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 13:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uq6tqtvM;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NhoVazCk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=BkoJ6VhezW37LSJ5ZWZfxvgZBW5DS5sPcqish+qr+kI=; b=uq6tqtvM59fl4BRJNyGQjd2dhv
	r054zukDErp4MeSdPLhsn5Kn3TD750P7wdvmHYPg2cE7wFcJsrygMRaChQlcAtl1yFsRDelwUgqSZ
	/K4y8XzfG8gsW6r03AcGi622s1ex1yrfedV5bWh7wH46sAhynOR2mM0IdxA5ypX5qyYX+9E15SlAA
	FKDXTUm/dmO9mPZmUXfe4TkjDm+1TvpFmXSLTNa/JbgWSihKFpd9obXm/7LwfuDFUCulaV0drYMla
	0mJ/IEHMdLJDnCQk0AEmh59NpusSiDeuqkmpMAiaRcuJpOIV/nRrD+GmAd7fgS245Wt4pmpye7diw
	mmgXhcLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3Kn-000000070aq-0YjB;
	Wed, 28 Oct 2026 13:04:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM3Kl-000000070aT-48w3
	for linux-riscv@lists.infradead.org;
	Wed, 28 Oct 2026 13:04:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BB21160120;
	Wed, 28 Oct 2026 13:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D551F01825;
	Wed, 28 Oct 2026 13:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793192689;
	bh=OG80Mz0mVm49EyuyKHOkJqtYHLMvKooWxYEt+ri6Okc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NhoVazCkHOBZd/Zh8WtWlntaIO9ino1lTyefSK8Dzb4X7rZBNS7fhkNVtdGcP7Vdb
	 cGNbg6lFcEZvFjT9yMlCTwP0SqOF9qq5NhXW5cvhPl0xIwEr/6L1LkNZ/uQXf4aKoi
	 clPXr9aGTTc3EyDb+CotvlY11YlESdSO1VdrbdyIfTAyysBgktMbUkrEUpSh9IMlcM
	 ftZdaz6ql75fiVG+RctbuKjhXW5zisfa9P6A7RWIlUDFmg1y4qEYh9gGrGcv24aiMY
	 RQJ+Uor7BCdHWg/Ja0NxSTpMLPcpXq6FVL+09fkmcCDKK41pgGMTScRqAMVA7WiXTd
	 C1UvOifI78Avg==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.ams.internal (Postfix) with ESMTP id 72805198003A;
	Wed, 28 Oct 2026 09:04:41 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Wed, 28 Oct 2026 09:04:46 -0400
X-ME-Sender: <xms:6PLhamR2N2SYNNuW2COGtT0iyhIuZN4Ab6M11IdWYpzZuKhsU46euQ>
    <xme:6PLhasO4PXs2DpvcsOJdlR4DUwcFplQftBYqhk86Injx7DrJH78rj0Flf6xhD1ZCG
    9pRgr7WmxxhEKvC9jS3FNwkDCbgMXER2Q_-Oi7X5VYg422dDXLURdp2>
X-ME-Received: <xmr:6PLhalRzbQegRW9_6wGQEi1w56Rek9Y-7oRBd7AXEqBOGSgslElXkkEZ0hw>
X-ME-Proxy-Cause: dmFkZTFg4m4oPEAUf0wKUWw/Iv3SvfDuV2dwoufosxi56rG8rE3yzXkDOL9mHtdMD5t3xb
    TNtQvdWPVpliQZzMEq2j9Gt/Qeqa/rF77vTyxnTf5UOLPNJ2zUCh17VsnOcEYbxGgk6pd/
    jnrFGdaKttqtWNKjNbixKC92UE8SCbRpRx0WxGiIqSl0J0ICk0JQhy9Sr/LMCk3/IVcW/o
    bCjLH09OVr/VQlaboh+GTF0eV9P0WsRQ0NN8dvTtbJ5CULwJ3YspX58BzjPnKc4esZY0AE
    vCO/2EXsD9kJV70LTbLoWjGuNnwDImFpXgd/qrFbj8lz7uaYEYKynkoZbbntZlYoJ2cVe9
    /+rhqV/xdrC6ND9aiGvuSZn+fk+lMFKBk+CwBAGjoY66y4uTs5oqVkdwtiVpN3jnfufyiw
    mbFGB54MLhrD1QUgxn90nVffgd8oQRT4PZ2d0Cv8SF1Gpgx6GZU5qUwdlixKbbdcCnstPy
    C4OiiGs/7AHNy17plPHaquUuUuXG0T7RKsstw38S2VOjByMTyHT12LhV9xiy9nSaBbtkzo
    eBHrVxgrtsC+JoLewb5t0X58mNTZctuMyI/X+JJS417uckswZSke7odEKVKiXLKSFCGJgN
    lxiRKVDKgquvVnW9gYMK5Q2ompqZeG5/mSl+cviBwf32c/V8SUzaJThtISOA
X-ME-Proxy: <xmx:6PLhaiC6UtU4qiOKsaD5z32WpUxwn9JqWMWZSp2POMwzX3Gff5sviw>
    <xmx:6PLhau5rgYZr77ak_O9wBERlqC7gG-5MjSAFZcS46YIGK_q8Pomf4g>
    <xmx:6PLhanADBjgOZwiVxGQ_V1IaXvAzSFbWN577V2Cq37A223MQNBj2kg>
    <xmx:6PLhaicpZIf6CfrEn_5aKXq1MPBLbhnnSSAvw380Z41uC6bjcbw0yw>
    <xmx:6fLhaquilv7jS-EmMG921CB-BsfpaPFMfHQ-RZ4zKq83ZgdvbLzPWKgp>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 28 Oct 2026 09:04:39 -0400 (EDT)
Date: Wed, 28 Oct 2026 13:04:38 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Muchun Song <muchun.song@linux.dev>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
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
Message-ID: <auHxpuEHrpkvSFFi@thinkstation>
References: <f97a8d33-50b2-4a86-8381-ee840cdfa2f9@kernel.org>
 <20261027110028.GH2668564@noisy.programming.kicks-ass.net>
 <auCKv_omLGRc6wv2@thinkstation>
 <f3f3aca9-bdb7-4aec-9099-9fb63a60e61d@kernel.org>
 <auCZFckDfBMrlfxV@thinkstation>
 <070DDE5C-2183-4A8B-AC2D-891CAE15E581@linux.dev>
 <d7a634b6-8668-4753-8bfc-e9334dde705e@kernel.org>
 <4A32F5E6-977D-4720-8723-B19AFBC08FCF@linux.dev>
 <auDkbDlgSZxqlk2G@thinkstation>
 <7cb3dd91-f518-49b6-b311-9ec807b3c63b@linux.dev>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7cb3dd91-f518-49b6-b311-9ec807b3c63b@linux.dev>
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Oct 28, 2026 at 10:38:22AM +0800, Muchun Song wrote:
> > Bootmem folios optimized in early boot get their tails mapped writable
> > and write protected later.  Drop the write protect step.
> 
> For bootmem folios, I don't think the RO mapping should be removed,
> because we are in the initialization stage of struct page.
> No one should touch those pages at this point; otherwise, they could
> encounter uninitialized struct page as well. This assumes no race
> exists during early boot.
> 
> Since such a problem does not exist during the boot stage, why should
> we give up the protection that RO provides?

Agreed. Nothing does a lockless get on bootmem folios before hugetlb
takes them, so they can stay RO.

I will keep the pre-HVO write-protect and post the patch.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
