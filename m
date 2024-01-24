Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06362C47422
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jan 2024 05:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qt2a9X+s5YQZiRoPvlGCdEYLd1D1W5rKbqz96nujDaI=; b=32bZDnC02l7ZsR
	Gy9zczHi6QncMuS0375IVHS9YvoXrPPTDcWKlpI+bLP+XXkpTLogDz+EyI/Mb1DZoDeGVE0a5qIrr
	afY2lRNIFUUDXrWNkwwQdoa+VBzA7IOpcJNUOprAElqeaAC27PRaKUw8SC19ywtBPCfY6geIaV8KS
	3frxC3a85D/0jl2arouvctUpuux4jGaq+P81l/WKDsTvRyStOvnj22oPtpDsnfi+21jcFnfPpUOdS
	uZYlPr+p4K4m7rZHC3X4MdFUuLf1plcJ0ZgLYO9ZJDURmTMYufsdnUDgW3/410gEzSzhyvYulNt7B
	IP2UePjnyevumgmTnKxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSW5x-001dAH-2w;
	Wed, 24 Jan 2024 05:46:41 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSW5u-001d8x-2h;
	Wed, 24 Jan 2024 05:46:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6F5B6CE29A9;
	Wed, 24 Jan 2024 05:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75644C433F1;
	Wed, 24 Jan 2024 05:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706075195;
	bh=LhesHwoZXRdX5jfbi0laKsTDlPHkqd2QNDhd5PA0n64=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SgqZYUETYp0U/lExF64JKpfQ4QQzjrtotn/ONStmemo8UuEWx22RNGcCPysz/GGdH
	 wF4/0iVnvQm3wM0s4Ag4Pkguroe5zo7K7nKVaDa3YhK1ow6WyrrQ0jGg/jh0nlfdU+
	 f9jiSYnPlhA+oQTs1xwIrXNokUtNwZ94UcVY9oqXd8lQQbttaFJlpF0H4Hptl0pH0W
	 L6Si/Ez2ZPcSiKG/jTqZNA1RfHBeGdDrwVDOodIiOjh9BxNSAwCbUb8UnpBbsGqMmX
	 Fry6owvnHK5HB/4QPvBt/16sEl5jOidoL18vHxJm0dea3fi94NjlvWmuxijOXq/zBL
	 NkyRrt3sGxNQg==
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: David Hildenbrand <david@redhat.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Ryan Roberts <ryan.roberts@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
	"sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>
Subject: Re: [PATCH v1 01/11] arm/pgtable: define PFN_PTE_SHIFT on arm and
 arm64
In-Reply-To: <3a970289-a72f-418e-b43c-89f67f0d5283@redhat.com>
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-2-david@redhat.com>
 <fdaeb9a5-d890-499a-92c8-d171df43ad01@arm.com>
 <46080ac1-7789-499b-b7f3-0231d7bd6de7@redhat.com>
 <6703b648-10ab-4fea-b7f1-75421319465b@arm.com>
 <ae3d826f-758f-4738-b72a-e99f098bb2b3@csgroup.eu>
 <3a970289-a72f-418e-b43c-89f67f0d5283@redhat.com>
Date: Wed, 24 Jan 2024 11:16:23 +0530
Message-ID: <87zfwvp9lc.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_214639_214926_AB93C015 
X-CRM114-Status: GOOD (  12.85  )
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

David Hildenbrand <david@redhat.com> writes:

>>>
>>>> If high bits are used for
>>>> something else, then we might produce a garbage PTE on overflow, but that
>>>> shouldn't really matter I concluded for folio_pte_batch() purposes, we'd not
>>>> detect "belongs to this folio batch" either way.
>>>
>>> Exactly.
>>>
>>>>
>>>> Maybe it's likely cleaner to also have a custom pte_next_pfn() on ppc, I just
>>>> hope that we don't lose any other arbitrary PTE bits by doing the pte_pgprot().
>>>
>>> I don't see the need for ppc to implement pte_next_pfn().
>> 
>> Agreed.
>
> So likely we should then do on top for powerpc (whitespace damage):
>
> diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
> index a04ae4449a025..549a440ed7f65 100644
> --- a/arch/powerpc/mm/pgtable.c
> +++ b/arch/powerpc/mm/pgtable.c
> @@ -220,10 +220,7 @@ void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
>                          break;
>                  ptep++;
>                  addr += PAGE_SIZE;
> -               /*
> -                * increment the pfn.
> -                */
> -               pte = pfn_pte(pte_pfn(pte) + 1, pte_pgprot((pte)));
> +               pte = pte_next_pfn(pte);
>          }
>   }

Agreed.

-aneesh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
