Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F4E4CAC59A
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 08:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PKZIENcH1PmerkY+5p1ra3lPgVvF2aauI9p/ebOSoqc=; b=bdK2KbZnR+zzBS
	5i+RD9yKNXRWP6cPWFmwoq/vI1bufPPQMKw/HFSQaE0PyLww//JoIWSEf1CLkySFxazqKBKHBhcHz
	ZjfINocROEkH8bwdFtQ3B8ED8qwTKk90vJia8JZdap4cIOhfIbxjGSd8Eolx/9S1iRf+uBxTNneDU
	Fqir1I300VLrN3xBXr9EjdCZmoKJAo+nArKQqeOXfCJLK7d8F4QpE5MmkhzQ6GGdVwKIXUznR+2Yt
	GtjZG1L7J5/SgSskEwXg8pSU0gbKC/FsOOLlDgRfYiCaOP6JXi4okgJNTWR3J4GYTLc7YvH4ujGgx
	AhnE2FBBd2wnpJLPa8Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWVg-00000002Fxv-1zxS;
	Fri, 19 Sep 2025 08:30:28 +0000
Received: from fra-out-005.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([63.176.194.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWVd-00000002Fwj-0K66;
	Fri, 19 Sep 2025 08:30:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1758270625; x=1789806625;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xQMfSE2j0e0kXW7iy6dzBiNtwDQyibH0F14unNsZxY0=;
  b=bY0EYUAOgNU8neiOnGZCW9itiarVu3mRPQemBlfshzRcXyujB99UGwZa
   6pxHHEEs+shzBaYDBjSE26nNsf03StCHzp2F3Prpj627F6WpY4Q5rf9ij
   rjVvDsja5+Z1nr4a29pJlVQOgEUjWJz2YEqm6My7mmAEJagB1ENiWKXSH
   f1H5kN1YqfPPRS+s9lxiP43cgDu+qFCXQi52aUErIGirA4LYfEwQxWu08
   auYnooVtZ/9Y0k4Hwgjw7+C2t4Qw4F1+m39uQS5o1y4tnaAeLTTybFh0C
   1FJDAoa6Jg5M0I6wYS4SY2alPc2xnUXKScnSdDjD5lHIU+9Upsz/9MN95
   A==;
X-CSE-ConnectionGUID: vUeZyQaIS32WfGrBH8LBqw==
X-CSE-MsgGUID: 7ubyqWN9R7CraB91GGKOuQ==
X-IronPort-AV: E=Sophos;i="6.18,277,1751241600"; 
   d="scan'208";a="2361382"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
  by internal-fra-out-005.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 08:30:09 +0000
Received: from EX19MTAEUB002.ant.amazon.com [54.240.197.232:2610]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.36.68:2525] with esmtp (Farcaster)
 id 2e1ccd73-6c97-437e-b0d8-729206f284fa; Fri, 19 Sep 2025 08:30:09 +0000 (UTC)
X-Farcaster-Flow-ID: 2e1ccd73-6c97-437e-b0d8-729206f284fa
Received: from EX19D015EUB002.ant.amazon.com (10.252.51.123) by
 EX19MTAEUB002.ant.amazon.com (10.252.51.79) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 19 Sep 2025 08:30:08 +0000
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19D015EUB002.ant.amazon.com (10.252.51.123) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 19 Sep 2025 08:30:08 +0000
Received: from EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a]) by
 EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a%3]) with mapi id
 15.02.2562.020; Fri, 19 Sep 2025 08:30:08 +0000
From: "Roy, Patrick" <roypat@amazon.co.uk>
To: "hughd@google.com" <hughd@google.com>
Subject: Re: [PATCH v6 01/11] filemap: Pass address_space mapping to
 ->free_folio()
Thread-Topic: [PATCH v6 01/11] filemap: Pass address_space mapping to
 ->free_folio()
Thread-Index: AQHcKT+bvwDzyVs1WEGX2DXFZiV07Q==
Date: Fri, 19 Sep 2025 08:30:08 +0000
Message-ID: <20250919083006.21171-1-roypat@amazon.co.uk>
References: <7c2677e1-daf7-3b49-0a04-1efdf451379a@google.com>
In-Reply-To: <7c2677e1-daf7-3b49-0a04-1efdf451379a@google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.88.180]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_013025_470984_15886E84 
X-CRM114-Status: GOOD (  22.60  )
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
Cc: "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "hubcap@omnibond.com" <hubcap@omnibond.com>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "derekmn@amazon.co.uk" <derekmn@amazon.co.uk>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "devel@lists.orangefs.org" <devel@lists.orangefs.org>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "luto@kernel.org" <luto@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "surenb@google.com" <surenb@google.com>, "brauner@kernel.org" <brauner@kernel.org>, "Cali, Marco" <xmarcalx@amazon.co.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "trondmy@kernel.org" <trondmy@kernel.org>, "martin@omnibond.com" <martin@omnibond.com>, "david@redhat.com" <david@redhat.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "song@kernel.org" <song@kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, "shuah@kernel.org" <shuah@kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "alex@ghiti.fr" <alex@ghiti.fr>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "andrii@kernel.org" <andrii@kernel.org>, "Roy, Patrick" <roypat@amazon.co.uk>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "Thomson, Jack" <jackabt@amazon.co.uk>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "pfalcato@suse.de" <pfalcato@suse.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "haoluo@google.com" <haoluo@google.com>, "seanjc@google.com" <seanjc@google.com>, "anna@kernel.org" <anna@kernel.org>, "ast@kernel.org" <ast@kernel.org>, "peterx@redhat.com" <peterx@redhat.com>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "will@kernel.org" <will@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "corbet@lwn.net" <corbet@lwn.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "willy@infradead.org" <willy@infradead.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, "bp@alien8.de" <bp@alien8.de>, "shakeel.butt@linux.dev" <shakeel.butt@linux.dev>, "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "rppt@kernel.org" <rppt@kernel.org>, "mhocko@suse.com" <mhocko@suse.com>, "jack@suse.cz" <jack@suse.cz>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, "yuanchu@google.com" <yuanchu@google.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "hpa@zytor.com" <hpa@zytor.com>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "maz@kernel.org" <maz@kernel.org>, "x86@kernel.org" <x86@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "mingo@redhat.com" <mingo@redhat.com>, "axelrasmussen@google.com" <axelrasmussen@google.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "jannh@google.com" <jannh@google.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "weixugc@google.com" <weixugc@google.com>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "martin.lau@linux.dev" <martin.lau@linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


Hi Hugh!

On Tue, 2025-09-16 at 07:23 +0100, Hugh Dickins wrote:> On Fri, 12 Sep 2025, Roy, Patrick wrote:
> 
>> From: Elliot Berman <quic_eberman@quicinc.com>
>>
>> When guest_memfd removes memory from the host kernel's direct map,
>> direct map entries must be restored before the memory is freed again. To
>> do so, ->free_folio() needs to know whether a gmem folio was direct map
>> removed in the first place though. While possible to keep track of this
>> information on each individual folio (e.g. via page flags), direct map
>> removal is an all-or-nothing property of the entire guest_memfd, so it
>> is less error prone to just check the flag stored in the gmem inode's
>> private data.  However, by the time ->free_folio() is called,
>> folio->mapping might be cleared. To still allow access to the address
>> space from which the folio was just removed, pass it in as an additional
>> argument to ->free_folio, as the mapping is well-known to all callers.
>>
>> Link: https://lore.kernel.org/all/15f665b4-2d33-41ca-ac50-fafe24ade32f@redhat.com/
>> Suggested-by: David Hildenbrand <david@redhat.com>
>> Acked-by: David Hildenbrand <david@redhat.com>
>> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
>> [patrick: rewrite shortlog for new usecase]
>> Signed-off-by: Patrick Roy <roypat@amazon.co.uk>
>> ---
>>  Documentation/filesystems/locking.rst |  2 +-
>>  fs/nfs/dir.c                          | 11 ++++++-----
>>  fs/orangefs/inode.c                   |  3 ++-
>>  include/linux/fs.h                    |  2 +-
>>  mm/filemap.c                          |  9 +++++----
>>  mm/secretmem.c                        |  3 ++-
>>  mm/vmscan.c                           |  4 ++--
>>  virt/kvm/guest_memfd.c                |  3 ++-
>>  8 files changed, 21 insertions(+), 16 deletions(-)
>>
>> diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesystems/locking.rst
>> index aa287ccdac2f..74c97287ec40 100644
>> --- a/Documentation/filesystems/locking.rst
>> +++ b/Documentation/filesystems/locking.rst
>> @@ -262,7 +262,7 @@ prototypes::
>>       sector_t (*bmap)(struct address_space *, sector_t);
>>       void (*invalidate_folio) (struct folio *, size_t start, size_t len);
>>       bool (*release_folio)(struct folio *, gfp_t);
>> -     void (*free_folio)(struct folio *);
>> +     void (*free_folio)(struct address_space *, struct folio *);
>>       int (*direct_IO)(struct kiocb *, struct iov_iter *iter);
>>       int (*migrate_folio)(struct address_space *, struct folio *dst,
>>                       struct folio *src, enum migrate_mode);
> 
> Beware, that is against the intent of free_folio().
> 
> Since its 2.6.37 origin in 6072d13c4293 ("Call the filesystem back
> whenever a page is removed from the page cache"), freepage() or
> free_folio() has intentionally NOT taken a struct address_space *mapping,
> because that structure may already be freed by the time free_folio() is
> called, if the last folio holding it has now been freed.
> 
> Maybe something has changed since then, or maybe it happens to be safe
> just in the context in which you want to use it; but it is against the
> principle of free_folio().  (Maybe an rcu_read_lock() could be added
> in __remove_mapping() to make it safe nowadays? maybe not welcome.)
> 
> See Documentation/filesystems/vfs.rst:
> free_folio is called once the folio is no longer visible in the
> page cache in order to allow the cleanup of any private data.
> Since it may be called by the memory reclaimer, it should not
> assume that the original address_space mapping still exists, and
> it should not block.
> 
> Hugh
Thanks for pointing this out! I think I can make do without this patch,
by storing the direct map state in some bit directly on the folio (in
yesterday's upstream guest_memfd call, we talked about using
->private, which guest_memfd isn't using for anything yet). Will do that
for the next iteration.

Best,
Patrick


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
