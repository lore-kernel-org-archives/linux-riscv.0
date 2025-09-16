Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E321CAC599
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Sep 2025 06:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gt7McASdUKbd4AHW25ZjYun+BJwzWco4SRjGAY6FpHE=; b=C74z5Y9y20KVKq
	vyddUFAxap7HoEekyubLjBQD4FmSb/v+zZvYns1bnjCiJ3HzzEOTgbhhJC6KigASmdU3txGouvvjL
	ZncfzfCjCuTl2ZDa8OqrWtKZMknadL0UrY8ZfbIBsaoX5uWC4Aozl1AMV3+YhvmKJKJz83Zea+Jx7
	0C/ZjXy0xOYh5PfDZwX2XxCCwBgDTEHw2yrpo0taU/fRlnlk1/gSgHksrluQtguzz54R0v0wDfzCw
	VHKax/JdrlsyrucF2x7nFBHRxCt9g+YJRKk9E41Hi5CJuKmMOL6wY6rb7Hyke0+SVs6AURolN5QjI
	xjl6vN0HB8iV8SGsbzZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyP69-00000006uKh-2iu5;
	Tue, 16 Sep 2025 06:23:29 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyP67-00000006uJF-0TU1
	for linux-riscv@lists.infradead.org;
	Tue, 16 Sep 2025 06:23:28 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-72e565bf2f0so39002867b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Sep 2025 23:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758003806; x=1758608606; darn=lists.infradead.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jzwxSCgUK/3UElXn+qMCVZOXd6lLimgLpQ+KrGfwqaU=;
        b=UKyKFLAsAwhyhT/QrcHfPl+H/Cfo9OXRuy6QSpm+u099hfovqFbFDwRcfb7HfCkLl6
         VW1bBrxrQ1uO/RSKTIHpkse71ro36XFScrNKxIRWPQAZ+ak/d0mrqi+Z+TAawmHYBGZo
         NPAivOM6IhNm0pJDtbCBnbP52vRbFp+x03SSaGUqSBAxAmOOIiMR8ofCpO2ItCFNWYWn
         K7m+jMAMtZlnYPgCeSBF55xuJ970Bxmqx3fL0T+fI50plKUfqzamsXVCjahAPz2jRSQw
         fn0NRo26oYzJ2ceLM7Yr8Iqucd65fpET1TAZuIRzrw3EmeT/0XekdTb/CkwmnWIBHdRy
         tKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758003806; x=1758608606;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jzwxSCgUK/3UElXn+qMCVZOXd6lLimgLpQ+KrGfwqaU=;
        b=k1AuxPFIUVUqvu2s3nnHO3bbHhlUlrkG5mzamuYBomUDZdPksa2F/KnBrmBkPprAb6
         Ue61r1vSgYQS8zAZI63gxGcqez2kakk0ZHEG/GnVRWc1EFk/3f+GKpnxTesFmjfLxBp0
         TsPnzKyy0MSGD5Zrqq/SS7euFeVfeFjNo3uo09u0O9wf+QD3TkW4fECWIujwnuGpSEDc
         jCyCEK+iTcCET35V1vVetN/ZdW4OOIHKN0aGvxEnRkQUrRflaAtRkYySEGgGqgAAZ6EF
         nXKg3PdIDs0OcpJKXtNKbdRwUabzDB50l1WCj47ran9RAVjUIocXUgMPTR2qmngaicks
         3+mw==
X-Forwarded-Encrypted: i=1; AJvYcCUfBCoH28D72UO1KGf0Owuy3OhfbrEzvVZCGWqOdfUFzUoMNMnvW7u7f3OcH5jkisw6pWcisgQE31BVaw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8mjsIhLVdJpZsFGz0B8Iup+TuqsLuCJLHqaFlTSSRX6UgU52W
	/NwYeeBoCECL2xXmR1CBEPSf64m/VOlAF6pSFiLjqyFH9WrCkJQNGkIbVdDETNwhbg==
X-Gm-Gg: ASbGncspaySRCr9evnbS2A6jvno41xuKhi7aNTISGXMcjQqLPYnvMGGF3FLEaWSlod/
	hUmjkSJVq50eiGmZaBmY+qS3eyc5BqUWJAKxF42vLz4nzUdueBtbzvpIilcGbBk8NyzMNpxIR2r
	78UvHMennKuggc5vzt/Zd0q8tahaz7Qj/3lISXQyuYGo2fS9Cf3/HY6CQQaUcnHlwuiSqKfWRq7
	5xmWljuOVZxztRbpdirdhWwYe1I7tHuH/fjQeNvzHlWA4kGnm/4HLuPa47aMn5llDQrLJ4JPR+p
	BhqvXnfE8guh4GlBsTLERDkTKmUgGXVrmr1u8A4OLqPlwYH45e5dR5c6ni/cu4RObe5EPev9q0J
	/GBRzj/88X8DRxDHa8gu/YkD4dPvWAZwcXxgbesiS3ZRVxixh1f1gb4WEKlUJ2JhPLulTJdtJbX
	sLBjgcdLZqnq2/gA==
X-Google-Smtp-Source: AGHT+IFYH7nKR98YSl0bgd4j6elLmVBr5qc5bTleI6LMDXL64/KgQAEWWcRI4ClTxXA+31LnE3T7pA==
X-Received: by 2002:a05:690c:b13:b0:71f:eb2b:83e0 with SMTP id 00721157ae682-73062ca43c8mr138095197b3.13.1758003805348;
        Mon, 15 Sep 2025 23:23:25 -0700 (PDT)
Received: from darker.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-72f7683148dsm38488107b3.23.2025.09.15.23.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 23:23:24 -0700 (PDT)
Date: Mon, 15 Sep 2025 23:23:17 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: "Roy, Patrick" <roypat@amazon.co.uk>
Subject: Re: [PATCH v6 01/11] filemap: Pass address_space mapping to
 ->free_folio()
In-Reply-To: <20250912091708.17502-2-roypat@amazon.co.uk>
Message-ID: <7c2677e1-daf7-3b49-0a04-1efdf451379a@google.com>
References: <20250912091708.17502-1-roypat@amazon.co.uk> <20250912091708.17502-2-roypat@amazon.co.uk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_232327_242110_720CF343 
X-CRM114-Status: GOOD (  23.90  )
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
Cc: "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "hubcap@omnibond.com" <hubcap@omnibond.com>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "derekmn@amazon.co.uk" <derekmn@amazon.co.uk>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "devel@lists.orangefs.org" <devel@lists.orangefs.org>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "luto@kernel.org" <luto@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "surenb@google.com" <surenb@google.com>, "brauner@kernel.org" <brauner@kernel.org>, "Cali, Marco" <xmarcalx@amazon.co.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "trondmy@kernel.org" <trondmy@kernel.org>, "martin@omnibond.com" <martin@omnibond.com>, "david@redhat.com" <david@redhat.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "song@kernel.org" <song@kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, "shuah@kernel.org" <shuah@kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "alex@ghiti.fr" <alex@ghiti.fr>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "andrii@kernel.org" <andrii@kernel.org>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "Thomson, Jack" <jackabt@amazon.co.uk>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "pfalcato@suse.de" <pfalcato@suse.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "haoluo@google.com" <haoluo@google.com>, "seanjc@google.com" <seanjc@google.com>, "anna@kernel.org" <anna@kernel.org>, "ast@kernel.org" <ast@kernel.org>, "peterx@redhat.com" <peterx@redhat.com>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "will@kernel.org" <will@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "corbet@lwn.net" <corbet@lwn.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "willy@infradead.org" <willy@infradead.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, "bp@alien8.de" <bp@alien8.de>, "shakeel.butt@linux.dev" <shakeel.butt@linux.dev>, "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "rppt@kernel.org" <rppt@kernel.org>, "mhocko@suse.com" <mhocko@suse.com>, "jack@suse.cz" <jack@suse.cz>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, "yuanchu@google.com" <yuanchu@google.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "hpa@zytor.com" <hpa@zytor.com>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "maz@kernel.org" <maz@kernel.org>, "x86@kernel.org" <x86@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "mingo@redhat.com" <mingo@redhat.com>, "axelrasmussen@google.com" <axelrasmussen@google.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "jannh@google.com" <jannh@google.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "weixugc@google.com" <weixugc@google.com>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "martin.lau@linux.dev" <martin.lau@linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 12 Sep 2025, Roy, Patrick wrote:

> From: Elliot Berman <quic_eberman@quicinc.com>
> 
> When guest_memfd removes memory from the host kernel's direct map,
> direct map entries must be restored before the memory is freed again. To
> do so, ->free_folio() needs to know whether a gmem folio was direct map
> removed in the first place though. While possible to keep track of this
> information on each individual folio (e.g. via page flags), direct map
> removal is an all-or-nothing property of the entire guest_memfd, so it
> is less error prone to just check the flag stored in the gmem inode's
> private data.  However, by the time ->free_folio() is called,
> folio->mapping might be cleared. To still allow access to the address
> space from which the folio was just removed, pass it in as an additional
> argument to ->free_folio, as the mapping is well-known to all callers.
> 
> Link: https://lore.kernel.org/all/15f665b4-2d33-41ca-ac50-fafe24ade32f@redhat.com/
> Suggested-by: David Hildenbrand <david@redhat.com>
> Acked-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> [patrick: rewrite shortlog for new usecase]
> Signed-off-by: Patrick Roy <roypat@amazon.co.uk>
> ---
>  Documentation/filesystems/locking.rst |  2 +-
>  fs/nfs/dir.c                          | 11 ++++++-----
>  fs/orangefs/inode.c                   |  3 ++-
>  include/linux/fs.h                    |  2 +-
>  mm/filemap.c                          |  9 +++++----
>  mm/secretmem.c                        |  3 ++-
>  mm/vmscan.c                           |  4 ++--
>  virt/kvm/guest_memfd.c                |  3 ++-
>  8 files changed, 21 insertions(+), 16 deletions(-)
> 
> diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesystems/locking.rst
> index aa287ccdac2f..74c97287ec40 100644
> --- a/Documentation/filesystems/locking.rst
> +++ b/Documentation/filesystems/locking.rst
> @@ -262,7 +262,7 @@ prototypes::
>  	sector_t (*bmap)(struct address_space *, sector_t);
>  	void (*invalidate_folio) (struct folio *, size_t start, size_t len);
>  	bool (*release_folio)(struct folio *, gfp_t);
> -	void (*free_folio)(struct folio *);
> +	void (*free_folio)(struct address_space *, struct folio *);
>  	int (*direct_IO)(struct kiocb *, struct iov_iter *iter);
>  	int (*migrate_folio)(struct address_space *, struct folio *dst,
>  			struct folio *src, enum migrate_mode);

Beware, that is against the intent of free_folio().

Since its 2.6.37 origin in 6072d13c4293 ("Call the filesystem back
whenever a page is removed from the page cache"), freepage() or
free_folio() has intentionally NOT taken a struct address_space *mapping,
because that structure may already be freed by the time free_folio() is
called, if the last folio holding it has now been freed.

Maybe something has changed since then, or maybe it happens to be safe
just in the context in which you want to use it; but it is against the
principle of free_folio().  (Maybe an rcu_read_lock() could be added
in __remove_mapping() to make it safe nowadays? maybe not welcome.)

See Documentation/filesystems/vfs.rst:
free_folio is called once the folio is no longer visible in the
page cache in order to allow the cleanup of any private data.
Since it may be called by the memory reclaimer, it should not
assume that the original address_space mapping still exists, and
it should not block.

Hugh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
