Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A450C10F05
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Dec 2023 15:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=U3qllurfj4WrFNej7lsq8DaSrb52eBPVGvsoYj1wh+0=; b=sIeVRfSVgFLhBWAN5XgCjkBMdp
	Gw7AXb825FQzXeJM+jWtTUrPcf4XKfc+1x7vvN/i7UqBfm7M8MZLs7wAynijkAvacSnqc+13RIA19
	9aIj3wWm86Q+q0j/MU4nrSnNSmMaJWK3xiNVmF8Ey7BCPK7QmCNlohSzxlf/fuIg7nLsZV3eGieD8
	q3/PsCQkDNn8SKl446a6U3D4VAnEwLKl9+oJth56cshWio/KslLCXyxIj0hNGSXavEBYIlKALuHdJ
	uKUBWPt4YcIdeSTMJ/sYQ2cSTXW7ro9IkPDff8opSPaaXG8e717Nb7Oodxxhszs6YPKBNHHJx7ics
	Vvju4hfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBGP4-00DDT0-1T;
	Thu, 07 Dec 2023 15:35:06 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBGP1-00DDOD-2P
	for linux-riscv@lists.infradead.org;
	Thu, 07 Dec 2023 15:35:05 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-286e05d9408so803582a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 07:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1701963297; x=1702568097; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxNM9WK2tvtShQbb1K2hHNFEu7MJ8bT3CozvqGIxTXw=;
        b=iRneg6sWdaC0eXg4tPwhYbLD+dUvFdNWGlYNTW1tt8jYjC8V4bK8cK0jTgLTOdoJOI
         gG3oqVoCXvP2ad+1dNxF1e8SdBw2JrHiMCw4Tc/A5Xq5Bty3S6sPYDUZhrhZ9+FwLQk4
         9rIx1qIpF0KJj/oP1177A83QUlXmuJcUFuY+NUi0tW0WV+0dcz+4qAvo1qHyudHfZfHl
         fS9kV+3F0EewA+fE2TLd9itb6taAhteH4XsYbFc+XyY5EVd+6F23zrmLmbc5RACoc6I9
         mAUDCjFA2fKp9bF7Pk3vv4W4D638xTr2VoTvF0fZVeOE2v38evVlijWsK6tbJAjOqhb/
         TzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701963297; x=1702568097;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxNM9WK2tvtShQbb1K2hHNFEu7MJ8bT3CozvqGIxTXw=;
        b=clGUh5kEI5avYxR4uUd/SZZKYcS4AjEAhnyIMFVN4e8Dp9hiHTr1BKhiSi3smuAEHu
         axoh//mjsLRhcQF6DDG8Bxi+c/h30nYqdi36wlXnXxewWHr0iIBk5mUaI23owfhRZmGq
         lNbS4/NmebaN7twFkHGsF6ECazpp7guhoWvYlbZVteyZogCxn0XPDUQ28tJ4UhRj8dcn
         fGVWeZ6t9lrf50SoJDav/r3GK7jXe/P/vGeti/HVwD4YT7uZabrL1t7ZiBrInY8wXk/B
         F5SmHkINR+Lj2FLvQS46mdfhIrwvJw0iN27+fVNErGeE7c1ak+SCI4qmrfPhBCCKsNpJ
         /kmA==
X-Gm-Message-State: AOJu0Yxgnu3+BcuiQEUE84dmCweQbGGt8fMppiHAvx61Uhi7FYY8aCWJ
	xeqogCtm+5yubjQEROBu2H+wSw==
X-Google-Smtp-Source: AGHT+IF65TZgzhTweL9gbJz3prMlwSaSPqbYrTnygSycKn7vPV8yFjNeM3gu/nqMBGL+EF94LLE7vQ==
X-Received: by 2002:a17:90b:30d7:b0:286:f3d8:de2a with SMTP id hi23-20020a17090b30d700b00286f3d8de2amr5477031pjb.45.1701963296891;
        Thu, 07 Dec 2023 07:34:56 -0800 (PST)
Received: from localhost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id ok6-20020a17090b1d4600b00286573fc6e5sm24874pjb.4.2023.12.07.07.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 07:34:55 -0800 (PST)
Date: Thu, 07 Dec 2023 07:34:55 -0800 (PST)
X-Google-Original-Date: Thu, 07 Dec 2023 07:34:53 PST (-0800)
Subject: Re: [PATCH 0/5] riscv: Use READ_ONCE()/WRITE_ONCE() for pte accesses
In-Reply-To: <20231002151031.110551-1-alexghiti@rivosinc.com>
CC: ryan.roberts@arm.com, glider@google.com, elver@google.com, dvyukov@google.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, anup@brainfault.org, atishp@atishpatra.org,
  Ard Biesheuvel <ardb@kernel.org>, ryabinin.a.a@gmail.com, andreyknvl@gmail.com, vincenzo.frascino@arm.com,
  kasan-dev@googlegroups.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-efi@vger.kernel.org, linux-mm@kvack.org,
  alexghiti@rivosinc.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexghiti@rivosinc.com
Message-ID: <mhng-079ed07b-4a53-4d32-9821-768bbb34fe58@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_073503_785656_A51402F0 
X-CRM114-Status: GOOD (  17.50  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 02 Oct 2023 08:10:26 PDT (-0700), alexghiti@rivosinc.com wrote:
> This series is a follow-up for riscv of a recent series from Ryan [1] which
> converts all direct dereferences of pte_t into a ptet_get() access.
>
> The goal here for riscv is to use READ_ONCE()/WRITE_ONCE() for all page
> table entries accesses to avoid any compiler transformation when the
> hardware can concurrently modify the page tables entries (A/D bits for
> example).
>
> I went a bit further and added pud/p4d/pgd_get() helpers as such concurrent
> modifications can happen too at those levels.
>
> [1] https://lore.kernel.org/all/20230612151545.3317766-1-ryan.roberts@arm.com/
>
> Alexandre Ghiti (5):
>   riscv: Use WRITE_ONCE() when setting page table entries
>   mm: Introduce pudp/p4dp/pgdp_get() functions
>   riscv: mm: Only compile pgtable.c if MMU
>   riscv: Suffix all page table entry pointers with 'p'
>   riscv: Use accessors to page table entries instead of direct
>     dereference
>
>  arch/riscv/include/asm/kfence.h     |   6 +-
>  arch/riscv/include/asm/kvm_host.h   |   2 +-
>  arch/riscv/include/asm/pgalloc.h    |  86 ++++++++++----------
>  arch/riscv/include/asm/pgtable-64.h |  26 +++---
>  arch/riscv/include/asm/pgtable.h    |  33 ++------
>  arch/riscv/kernel/efi.c             |   2 +-
>  arch/riscv/kvm/mmu.c                |  44 +++++-----
>  arch/riscv/mm/Makefile              |   3 +-
>  arch/riscv/mm/fault.c               |  38 ++++-----
>  arch/riscv/mm/hugetlbpage.c         |  80 +++++++++----------
>  arch/riscv/mm/init.c                |  30 +++----
>  arch/riscv/mm/kasan_init.c          | 119 ++++++++++++++--------------
>  arch/riscv/mm/pageattr.c            |  74 +++++++++--------
>  arch/riscv/mm/pgtable.c             |  71 +++++++++++------
>  include/linux/pgtable.h             |  21 +++++
>  15 files changed, 334 insertions(+), 301 deletions(-)

This has some build failures, I was just talking to Alex and he's going 
to fix them.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
