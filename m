Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE19606A323
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 14:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EjXALHcx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B/eyQH3z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AnWfxIWFMGVMM726WTxIseUrjU2jRuBh4m8/MdDtf0A=; b=EjXALHcxPF8eVBwjmY20QvCysb
	uYcTlOd2ig1SZsJMYFQa3Uo0Y8Vtewss6+wMSPw7D7yR2J5wLIaS9c5mbKyVNe+4FyC5Q7719tGk7
	ATd0knzleoqlXAvBtiPTV4xlgrsUlr9o5F3xtPwbue96pZbACgjy8Kn99uMxQhPgn5X+Db+HA2RtV
	g/I+apkPbDV7WGStwU6hBm8ovi4bYvImWjYNtCGIXM5rahPCmx9ft+21EqpVC5Qit2tk8GpqTozh4
	72TrBBktmjM6dD7kgVw0kGVGxuq6CSdqo6kRRJW+yUaCHV/QJhBuZjht3H5gG7PfTNjI/BUS8EKtx
	L3I5swTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSy5L-00000002wf9-2zdd;
	Mon, 16 Nov 2026 14:53:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSy5K-00000002wec-0DBT
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 14:53:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C992340E02;
	Mon, 16 Nov 2026 14:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F0281F000C4;
	Mon, 16 Nov 2026 14:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794840809;
	bh=OSKH6DGTrkopNq4tA3GSj5EKxZJjQuu22esfVd2A0Tw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=B/eyQH3zoFS8eSMcrtMgxdf11YLokLJ0YHyV5wYnj24qRK5FEAFgjIf8GQ3SAtS3m
	 TeOtZMqmunJFTeq81KdGSP7pzcUYmJhggZHXxpT4w/Eo6Yi17USoOfrsMGatoI7t8X
	 nikwVLMgeiQyItJ4QQR6t6Dvxzeeg3sW8vpq7U1eXgwb7ZWNCTqQpAUXd3bsfBDqbk
	 EOoEXitHtOfu8t76WpxEEAF7dy8RSTuisIMNNBXZkopQTvRRfseu+QhDPg7ipNB43h
	 mc+VDH4nZvyAtNzrVB8ZomBs/1h7a+McMNOuO+O3DQ3T4nhtjoI/GlGieCtgYfAo/I
	 B295pKewLrqvw==
Date: Mon, 16 Nov 2026 14:53:22 +0000
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
Message-ID: <avsY22UYKI_Z3OUk@gremlin>
References: <20261112142039.907090-2-clopez@suse.de>
 <20261112142039.907090-7-clopez@suse.de>
 <avdw0O4rWi4WrTvy@gremlin>
 <079c15fb-8b41-472d-b9f2-d88826e27286@suse.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <079c15fb-8b41-472d-b9f2-d88826e27286@suse.de>
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Nov 15, 2026 at 11:01:52PM +0100, Carlos L=F3pez wrote:
> On 11/13/26 9:37 PM, Lorenzo Stoakes (ARM) wrote:
> > On Thu, Nov 12, 2026 at 03:20:34PM +0100, Carlos L=F3pez wrote:
> >> Add a change_protection() flag for changes that only add permissions,
> >> so that MMU notifier users can keep their mappings and fault in the new
> >> permissions later. mprotect() sets it when the new VMA flags only add
> >> read, write or execute permissions, or VM_ACCOUNT, which does not affe=
ct
> >> the page tables. Any other change, such as a different protection key,
> >> is not an upgrade.
> >
> > I'm struggling to comprehend what this means.
> >
> > 'Add a flag for changes that only add 'permissions' (not defined) so th=
at 'MMU
> > notifier users' can keep mappings and 'fault' in 'the new permissions' =
later.
> >
> > The rest of the message just states what the code does but speaks about=
 it as if
> > it was already what happened.
> >
> > This needs to be completely rewritten...!
>
> I'll rewrite it. By permissions I mean the access granted by the
> protection bits in the page table entries.
>
> > [...]
> >> +/* Whether this change only upgrades/adds permissions */
> >> +#define  MM_CP_PERM_UPGRADE                (1UL << 6)
> >
> > What are 'permissions' exactly?
>
> See above
>
> > [...]
> >> +static bool vma_flags_is_perm_upgrade(vma_flags_t old_vma_flags,
> >> +				      vma_flags_t new_vma_flags)
> >
> > No comment, random abbreviation (but just one word). Not ideal.
>
> I'll rename. As David noted, the name I chose is not really correct.
>
> >> +{
> >> +	vm_flags_t old =3D vma_flags_to_legacy(old_vma_flags);
> >> +	vm_flags_t new =3D vma_flags_to_legacy(new_vma_flags);
> >
> > This is beyond appalling and a complete abuse of the VMA flags API.
> >
> > You seem to have decided that you won't try to learn how the API works,=
 so
> > instead you'll just write deprecated code that I have to find time to c=
ome and
> > fix up later I guess?
>
> Sorry, I'll rewrite the helper with the vma_flags_t API, using
> VMA_ACCESS_FLAGS and VMA_ACCOUNT_BIT, and document it.
>
> > And we're at v3...!
> >
> >> +	/* VM_ACCOUNT does not affect page tables */
> >
> > What does this mean? And why are you referring to a deprecated constant?
>
> I meant that setting VM_ACCOUNT does not affect the protection bits of
> an entry, so it should not prevent the new flag from being set.
> mprotect() sets VM_ACCOUNT when a private mapping becomes writable,
> which is the case I wanted to cover. I'll explain this better.

Thanks for all! :)

--
Cheers, Lorenzo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
