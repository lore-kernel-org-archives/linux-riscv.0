Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F08C606A332
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 20:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=psPpnzM6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Kt6+iD3k
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4piQnGlnTMsejo4Pdq98n1XQceK77n0DnbwfjDwaa3U=; b=psPpnzM6iOHzsSjA4gvpk7giKy
	1p2hnMe9wMAkiSsjCs4QodUqsaTRLh/LBMf2SYPntj4CeaEPxVXO2ODR3/1/JWdvroGhLa8LI9djR
	LC7RSFHHANBmndXtDYKGbLDFGbEQQUVC06Rguo1jOhuVWhGMetFgFQBRKG33mtHayjn90jgFUzN8v
	vmlk1zhm6oXXX00k4Sekn+3g+eTXIEY8/NHBo+TV01OMEHIVw3STHnxvugHATdyJIG54P4hRRstdF
	d2GIpIPEtNQvY/Olhlzq0jTKDht4N1K2jyum4OlpfzaV5A6zXQmqcgi8ioNd/eyTd9lIDjQ0y+7IR
	fnbXAOyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyAy-0000000ETz4-3Ffq;
	Fri, 13 Nov 2026 20:47:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRyAw-0000000ETyl-30ck
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 20:47:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 48D1A44750;
	Fri, 13 Nov 2026 20:47:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D781F000C4;
	Fri, 13 Nov 2026 20:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794602830;
	bh=kpuCbiqHWI22jSKEai65DFEmOF/zcUZ3fQHI3h+jGcY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Kt6+iD3kp33fAUiGtW76c1GSpii1p1VDfXhRdlDU3CsFPxJAsgoPl0sBkAqvej0I+
	 ohh1q/Rtzqd5XQ8L4QZhuZDHwSj9xEZlSnPEHenDFWwufhl2aw3NE6nZaI2MziW2Nx
	 9Y6/YI808p2Yh/KlQvrxkzUSfSUA/Ia6b1GvttzhslG9fZ6Qj4GPnNYS+07c7K0wNU
	 8kkzMUs3yw6GTu2bp7DMAIABUCS8aPaUrGuemktnBP8+/z2Zd0AffjGkS4l7bivqNn
	 /78CICqNX9bQ5gtxyE1N5u2o6u6dDb7bzZdRqWVegNlwCj4shP7odI+5R4w3A3uIax
	 a2hQAGC5UypPg==
Date: Fri, 13 Nov 2026 20:47:03 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Carlos =?utf-8?B?TMOzcGV6?= <clopez@suse.de>
Cc: kvm@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org, seanjc@google.com, 
	pbonzini@redhat.com, akpm@linux-foundation.org, david@kernel.org, peterx@redhat.com, 
	imbrenda@linux.ibm.com, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Peter Feiner <pfeiner@google.com>
Subject: Re: [PATCH v3 1/9] mm: fix eager write-bit restore for
 write-notified shared mappings
Message-ID: <avd12eMWaTl87uL0@gremlin>
References: <20261112142039.907090-2-clopez@suse.de>
 <20261112142039.907090-3-clopez@suse.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261112142039.907090-3-clopez@suse.de>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 12, 2026 at 03:20:30PM +0100, Carlos L=F3pez wrote:
> change_protection() applies vma->vm_page_prot, which lacks the write bit
> for CoW and write-notified mappings. Callers set
> MM_CP_TRY_CHANGE_WRITABLE when vma_wants_manual_pte_write_upgrade()
> returns true, so that entries that can be written without a fault, such
> as dirty PTEs in a shared mapping, are made writable right away.
>
> For shared mappings, that function passes vma->vm_page_prot to
> vma_wants_writenotify(). Once writenotify is enabled, this protection
> lacks the write bit, while the vma_pgprot_modify() result it is compared
> against adds it back. The two never match, so vma_wants_writenotify()
> returns false before checking for soft-dirty, uffd-wp and writeback.
>
> As a result, write-notified shmem mappings never get
> MM_CP_TRY_CHANGE_WRITABLE. For example, commit 931298e103c2
> ("mm/userfaultfd: rely on vma->vm_page_prot in uffd_wp_range()") made
> uffd-wp unprotect set the flag so that dirty shmem PTEs become writable
> again, but this never takes effect. Unprotecting N dirty shmem pages
> still leads to N faults that only set the write bit.
>
> This dates back to the commit in the Fixes tag, which moved the
> equivalent check in mprotect_fixup() before vma_set_page_prot().
>
> Fix this by passing the protection recomputed from the VMA flags, as
> vma_set_page_prot() does.
>
> Note: this only affects performance, as the next write fault restores
> the write bit anyway.
>
> Fixes: 64e455079e1b ("mm: softdirty: enable write notifications on VMAs a=
fter VM_SOFTDIRTY cleared")
> Signed-off-by: Carlos L=F3pez <clopez@suse.de>
> ---
>  mm/vma.h | 23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/mm/vma.h b/mm/vma.h
> index 3fc3b47a954b..e83700e248e4 100644
> --- a/mm/vma.h
> +++ b/mm/vma.h
> @@ -589,6 +589,14 @@ int split_vma(struct vma_iterator *vmi, struct vm_ar=
ea_struct *vma,
>  	      unsigned long addr, int new_below);
>  #endif
>
> +#ifdef CONFIG_MMU
> +static inline pgprot_t vma_pgprot_modify(pgprot_t oldprot, vma_flags_t v=
ma_flags)
> +{
> +	const pgprot_t prot =3D vma_flags_to_page_prot(vma_flags);
> +
> +	return pgprot_modify(oldprot, prot);
> +}
> +
>  static inline bool vma_wants_manual_pte_write_upgrade(struct vm_area_str=
uct *vma)
>  {
>  	/*
> @@ -596,19 +604,16 @@ static inline bool vma_wants_manual_pte_write_upgra=
de(struct vm_area_struct *vma
>  	 * if we can't do that automatically for all PTEs in a mapping. For
>  	 * private mappings, that's always the case when we have write
>  	 * permissions as we properly have to handle COW.
> +	 *
> +	 * vma->vm_page_prot lacks the write bit if writenotify is already
> +	 * enabled, so pass it with the bits restored, as vma_set_page_prot()
> +	 * does.

We don't write code in comments.

>  	 */
>  	if (vma->vm_flags & VM_SHARED)
> -		return vma_wants_writenotify(vma, vma->vm_page_prot);
> +		return vma_wants_writenotify(vma,
> +		       vma_pgprot_modify(vma->vm_page_prot, vma->flags));

You mention vma_set_page_prot() but then implement it differently from ther=
e and
make no effort to abstract it?

And so both callers now do the same thing, and both open code it... you sho=
uld
abstract that.

>  	return !!(vma->vm_flags & VM_WRITE);
>  }
> -
> -#ifdef CONFIG_MMU
> -static inline pgprot_t vma_pgprot_modify(pgprot_t oldprot, vma_flags_t v=
ma_flags)
> -{
> -	const pgprot_t prot =3D vma_flags_to_page_prot(vma_flags);
> -
> -	return pgprot_modify(oldprot, prot);
> -}
>  #endif
>
>  static inline struct vm_area_struct *vma_prev_limit(struct vma_iterator =
*vmi,
> --
> 2.51.0
>

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
