Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73B7C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 04:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P07GG9/SKQm6Za/ycbkbmzmVMCpZpfAZz4O898a7yhA=; b=K8KS+Wb4lQiEm5
	es58W5HpfO6lkL8SQxDptK/OEjwni2JW+l1G4pl9vJoVKb94hI401/y0QkdwYLEnC2DMnfy1s9waN
	mwretVSSvdzGQuydLg90kBO3y3SAQuEl4kLm2O0s7VX0b47k9vQ/r4Gnt6uONX6oJv5TGY1XXYZ0G
	rDZROEjOGqlPqoe7HEov+gcHIPEDht/3C6cm7XwUkkuZLWAwHX72QZ5gefb+qolAzZDCeGNdBUrHA
	bCZrKtXx5mkUEjCisyD5ytKxfqpg95S0mbN2u9P4WsA2kenb5rw+liOnayKZ6i+aJOvW783UpT4hU
	IJCQQXBgyvDQ48nsjfdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwy22-007mCf-0O;
	Thu, 11 May 2023 04:35:58 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwy1y-007mAs-3B
	for linux-riscv@lists.infradead.org;
	Thu, 11 May 2023 04:35:56 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-b9a6869dd3cso10514370276.2
        for <linux-riscv@lists.infradead.org>; Wed, 10 May 2023 21:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683779748; x=1686371748;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+p7cDTQzCuKi1QAFDlX+tde47HjymadRIrRiXpBnjrE=;
        b=RNxRw3AER9+L5QAQHv+p6mRvl+kLRPDjAKnUfRCQOcDelCmEsaqcsoNCZ9z6jDnrrF
         1dGvlmTRCSz6GivkNmP4B8tOGOOSq6Wt3W4n6WYv2A/10cBkSKHBqKgYZ1kIdqfRxRv2
         b6/PqCtdX4ix7yNCLa/PS5e6wv2Gw1YtT/EuoE2wpe5IJsk/tNbOekNlZ2HocnjPlgpj
         lSA1YwTzKnLyqwSgSKCOk/yYtynRYu60PUe/zpxP112dZ3XnJoa/QQJP9/l4IL72dAw3
         efPluGkJmhM0YEv05bCCm1C2B3NBAmU0VrOlKGR25w8Huvmiap7lbD8JzalsqF5imjPe
         EiGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683779748; x=1686371748;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+p7cDTQzCuKi1QAFDlX+tde47HjymadRIrRiXpBnjrE=;
        b=eyawRIDxtUSR0ORJgUPtPzl2+06P3pCecbSa4kumwqgvAGbB+4TxMvDe6Kh/a8LHX8
         Wc4RJ3KeZ/jVl9xixdCsLrS7vckOLLkqSSiTxvCPBsdFTiitwCu98w9vhrp1KN5XsUDQ
         qyOl1ntCJAOlIiVRV0eyD5/48qXDX/SJ+Nv7yIUfBl8mZoORnUxY3tpp2TI72I4wocEo
         XNAclPNyTyWBTau8+ALV0WpcrQWdUgCIpmvfVORH4aZn/4DNQ7e1mHhi8Q4iQGoQ+srl
         W2qbYBMD/OoFwdbuT92IzX+3DufqWIVsgAp07lNnNn+IK5VjDQy4CJ6VSOrbp2c3TlNw
         ufRg==
X-Gm-Message-State: AC+VfDwrVpK9YopoaxgHb8ehPqpUVKT5jOz2ivkBDZL3vy9ZaJgPYfZl
	ZPsEKdv6JwYhbELTgE7k/51+5w==
X-Google-Smtp-Source: ACHHUZ4jNGBbv4gj0OghzQ/5FaHnsUorF/gO/2yZgUAa0GVD52UTO1h980KsCPnjFH9AHSAArpdGLQ==
X-Received: by 2002:a25:4884:0:b0:b9d:fe06:1f5b with SMTP id v126-20020a254884000000b00b9dfe061f5bmr18740294yba.15.1683779748403;
        Wed, 10 May 2023 21:35:48 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id a81-20020a251a54000000b00b7767ca749esm4213494yba.59.2023.05.10.21.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 21:35:47 -0700 (PDT)
Date: Wed, 10 May 2023 21:35:44 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Matthew Wilcox <willy@infradead.org>
cc: Hugh Dickins <hughd@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
    Mike Kravetz <mike.kravetz@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
    "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
    David Hildenbrand <david@redhat.com>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Qi Zheng <zhengqi.arch@bytedance.com>, 
    Russell King <linux@armlinux.org.uk>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Greg Ungerer <gerg@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Helge Deller <deller@gmx.de>, John David Anglin <dave.anglin@bell.net>, 
    "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, 
    Michael Ellerman <mpe@ellerman.id.au>, 
    Alexandre Ghiti <alexghiti@rivosinc.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>, 
    Christian Borntraeger <borntraeger@linux.ibm.com>, 
    Claudio Imbrenda <imbrenda@linux.ibm.com>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    "David S. Miller" <davem@davemloft.net>, Chris Zankel <chris@zankel.net>, 
    Max Filippov <jcmvbkbc@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
    x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
    linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
    linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
    linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
    linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
    sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, 
    linux-mm@kvack.org
Subject: Re: [PATCH 00/23] arch: allow pte_offset_map[_lock]() to fail
In-Reply-To: <ZFs0k2rrLPH9A/UU@casper.infradead.org>
Message-ID: <d7f3c7b2-25b8-ef66-98a8-43d68f4499f@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com> <ZFs0k2rrLPH9A/UU@casper.infradead.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_213555_031589_EB735B15 
X-CRM114-Status: GOOD (  26.91  )
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

On Wed, 10 May 2023, Matthew Wilcox wrote:
> On Tue, May 09, 2023 at 09:39:13PM -0700, Hugh Dickins wrote:
> > Two: pte_offset_map() will need to do an rcu_read_lock(), with the
> > corresponding rcu_read_unlock() in pte_unmap().  But most architectures
> > never supported CONFIG_HIGHPTE, so some don't always call pte_unmap()
> > after pte_offset_map(), or have used userspace pte_offset_map() where
> > pte_offset_kernel() is more correct.  No problem in the current tree,
> > but a problem once an rcu_read_unlock() will be needed to keep balance.
> 
> Hi Hugh,
> 
> I shall have to spend some time looking at these patches, but at LSFMM
> just a few hours ago, I proposed and nobody objected to removing
> CONFIG_HIGHPTE.  I don't intend to take action on that consensus
> immediately, so I can certainly wait until your patches are applied, but
> if this information simplifies what you're doing, feel free to act on it.

Thanks a lot, Matthew: very considerate, as usual.

Yes, I did see your "Whither Highmem?" (wither highmem!) proposal on the
list, and it did make me think, better get these patches and preview out
soon, before you get to vanish pte_unmap() altogether.  HIGHMEM or not,
HIGHPTE or not, I think pte_offset_map() and pte_unmap() still have an
important role to play.

I don't really understand why you're going down a remove-CONFIG_HIGHPTE
route: I thought you were motivated by the awkardness of kmap on large
folios; but I don't see how removing HIGHPTE helps with that at all
(unless you have a "large page tables" effort in mind, but I doubt it).

But I've no investment in CONFIG_HIGHPTE if people think now is the
time to remove it: I disagree, but wouldn't miss it myself - so long
as you leave pte_offset_map() and pte_unmap() (under whatever names).

I don't think removing CONFIG_HIGHPTE will simplify what I'm doing.
For a moment it looked like it would: the PAE case is nasty (and our
data centres have not been on PAE for a long time, so it wasn't a
problem I had to face before); and knowing pmd_high must be 0 for a
page table looked like it would help, but now I'm not so sure of that
(hmm, I'm changing my mind again as I write).

Peter's pmdp_get_lockless() does rely for complete correctness on
interrupts being disabled, and I suspect that I may be forced in the
PAE case to do so briefly; but detest that notion.  For now I'm just
deferring it, hoping for a better idea before third series finalized.

I mention this (and Cc Peter) in passing: don't want this arch thread
to go down into that rabbit hole: we can start a fresh thread on it if
you wish, but right now my priority is commit messages for the second
series, rather than solving (or even detailing) the PAE problem.

Hugh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
