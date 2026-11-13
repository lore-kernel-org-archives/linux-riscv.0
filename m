Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDF9606A335
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 20:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OR1yPxn3;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fSMFgLfD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=J9QyMfrHaBT2IwEO4B9SlTIPb5Oyy31gtRfJz/KMc6M=; b=OR1yPxn3t6I0CP9/fh8SSInDSG
	YZHEkPJggyq57iTM+Cvctjoj79S28py7D+fFVotO8n2Oh+BWo9UauK/muPjJU04ocLuJA8Ltd1Cu9
	SHEMuUQ1IWI4oUYg01ay/+QhA26bPhS/uBuQ6yccZ6rdBbqWM8iZhM4Ox5mAhIKCorLxnu5+Un/m5
	mbDkxQn3oiSiPDx0KMaeHoinW+Hc3HSjAI52eJBHdCoUhnU64xrMVF7CgFYlF7wwgbtJx7vx+KWfd
	SkAv/eC08Ph+xiQw6i2Vno+q12ug925efouwYDWhW+CkfOITU6bbSWchIKscp6dhD05oBZq0swM/p
	4/w1Iq2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRy22-0000000ERlx-3WKe;
	Fri, 13 Nov 2026 20:37:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRy21-0000000ERky-1kif
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 20:37:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CBE9B42B1A;
	Fri, 13 Nov 2026 20:37:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E49121F000C4;
	Fri, 13 Nov 2026 20:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794602276;
	bh=AvlalDGclbf9jbvk6fxMo0zLcUfRP1nU9XgrjQZVQsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fSMFgLfDA/Ou58ytoSDg+1mflt1C7sWfR/W+ACkbe1dn9am4k5kJZgDhqDYpp0Nt0
	 EaI5rLObsWfuzFn5sTkAdXrZTPZEOpgzZMmRyDRvvWgX5LUQ7U5rqM0s/9Lhy2n2iO
	 YWKyKRkJOYrhOtqCRb2/2i02fzf4vW8jb0PlxlNLpBkgx09vD8+B+Wt97/Ys9H+6+l
	 fX145SXiGWNPCodaqf//AhojDtXtDD6IR3aLabRjw+Ztxi0EdDViMwKG/qjkIKS5XJ
	 PU9Sx0DZki7JpzFZRqIWWzYvt8C9VphFjKVogQHq88kV0ThjxG70bvz0ukpSgbufbj
	 ChhdqKcPkXVrQ==
Date: Fri, 13 Nov 2026 20:37:49 +0000
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Carlos =?utf-8?B?TMOzcGV6?= <clopez@suse.de>
Cc: kvm@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-riscv@lists.infradead.org, seanjc@google.com, 
	pbonzini@redhat.com, akpm@linux-foundation.org, david@kernel.org, peterx@redhat.com, 
	imbrenda@linux.ibm.com, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>
Subject: Re: [PATCH v3 5/9] mm/mprotect: add MM_CP_PERM_UPGRADE
Message-ID: <avdw0O4rWi4WrTvy@gremlin>
References: <20261112142039.907090-2-clopez@suse.de>
 <20261112142039.907090-7-clopez@suse.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261112142039.907090-7-clopez@suse.de>
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

On Thu, Nov 12, 2026 at 03:20:34PM +0100, Carlos L=F3pez wrote:
> Add a change_protection() flag for changes that only add permissions,
> so that MMU notifier users can keep their mappings and fault in the new
> permissions later. mprotect() sets it when the new VMA flags only add
> read, write or execute permissions, or VM_ACCOUNT, which does not affect
> the page tables. Any other change, such as a different protection key,
> is not an upgrade.

I'm struggling to comprehend what this means.

'Add a flag for changes that only add 'permissions' (not defined) so that '=
MMU
notifier users' can keep mappings and 'fault' in 'the new permissions' late=
r.

The rest of the message just states what the code does but speaks about it =
as if
it was already what happened.

This needs to be completely rewritten...!

>
> Signed-off-by: Carlos L=F3pez <clopez@suse.de>
> ---
>  include/linux/mm.h |  2 ++
>  mm/mprotect.c      | 13 +++++++++++++
>  2 files changed, 15 insertions(+)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 6af3b7008f1a..001829a61405 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3585,6 +3585,8 @@ int get_cmdline(struct task_struct *task, char *buf=
fer, int buflen);
>  #define  MM_CP_UFFD_RWP_RESOLVE            (1UL << 5) /* resolve rwp */
>  #define  MM_CP_UFFD_RWP_ALL                (MM_CP_UFFD_RWP | \
>  					    MM_CP_UFFD_RWP_RESOLVE)
> +/* Whether this change only upgrades/adds permissions */
> +#define  MM_CP_PERM_UPGRADE                (1UL << 6)

What are 'permissions' exactly?

>
>  bool can_change_pte_writable(struct vm_area_struct *vma, unsigned long a=
ddr,
>  			     pte_t pte);
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 84bcfe0281d3..8c0fcd10f5a3 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -767,6 +767,17 @@ static const struct mm_walk_ops prot_none_walk_ops =
=3D {
>  	.walk_lock		=3D PGWALK_WRLOCK,
>  };
>
> +static bool vma_flags_is_perm_upgrade(vma_flags_t old_vma_flags,
> +				      vma_flags_t new_vma_flags)

No comment, random abbreviation (but just one word). Not ideal.

> +{
> +	vm_flags_t old =3D vma_flags_to_legacy(old_vma_flags);
> +	vm_flags_t new =3D vma_flags_to_legacy(new_vma_flags);

This is beyond appalling and a complete abuse of the VMA flags API.

You seem to have decided that you won't try to learn how the API works, so
instead you'll just write deprecated code that I have to find time to come =
and
fix up later I guess?

And we're at v3...!

> +	/* VM_ACCOUNT does not affect page tables */

What does this mean? And why are you referring to a deprecated constant?

> +	vm_flags_t mask =3D VM_READ | VM_WRITE | VM_EXEC | VM_ACCOUNT;
> +
> +	return new =3D=3D (old | (new & mask));

Ordinarily I'd try to help you use the new API, but the very fact you'd send
it like this dissuades me :/

> +}
> +
>  int
>  mprotect_fixup(struct vma_iterator *vmi, struct mmu_gather *tlb,
>  	       struct vm_area_struct *vma, struct vm_area_struct **pprev,
> @@ -847,6 +858,8 @@ mprotect_fixup(struct vma_iterator *vmi, struct mmu_g=
ather *tlb,
>  	vma_overwrite_flags(vma, new_vma_flags);
>  	if (vma_wants_manual_pte_write_upgrade(vma))
>  		mm_cp_flags |=3D MM_CP_TRY_CHANGE_WRITABLE;
> +	if (vma_flags_is_perm_upgrade(old_vma_flags, new_vma_flags))
> +		mm_cp_flags |=3D MM_CP_PERM_UPGRADE;
>  	vma_set_page_prot(vma);
>
>  	change_protection(tlb, vma, start, end, mm_cp_flags);
> --
> 2.51.0
>

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
