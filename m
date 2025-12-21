Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E28E66886
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Dec 2025 07:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:Message-ID:Date:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gKyqNxEpaGszeRSrBG15iOST7DOy9NeDnmyDEm9cHHY=; b=KPjX9y5RviL5LC
	QT2pPmUUyoZXiub1BqDRlN06Fin1CpXr+0hfIFkWvKQP4DfjKDSjION0j0HQ1mID4xaC6HO7yhWqI
	Nj0rUL6vspY+uibCCYhjP12gZE+J60fRnuv0F0bM5B/PUohigMQdU1s3kLbitRcZcLwKyGlwGFcRa
	YA8xEl1QFT59F9GGraGh14rSdr8ySgzRoO79cWnXZcRGwu/uW+2zp+wz3u/bQDXxjU+q9X1Ttk08M
	jZFbUyCWrC9rzub6LgbC03uUfapwBwwCT4ZaP0K2/6h4VKJi3oHsJdF6LNCVR0MUMAx+gu58GQLx9
	hrGwIokTTROsQUqJLIYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXDc0-0000000CCdC-1H4n;
	Sun, 21 Dec 2025 07:12:16 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXDby-0000000CCcj-0KfM
	for linux-riscv@lists.infradead.org;
	Sun, 21 Dec 2025 07:12:15 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2a0d0788adaso26590305ad.3
        for <linux-riscv@lists.infradead.org>; Sat, 20 Dec 2025 23:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766301133; x=1766905933; darn=lists.infradead.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qzCtCXPpJksCwKOWKXvWbqXbkA87udvkBHpHfw0vp1Y=;
        b=HHw8qZgdxaFBab8831V+KkD5fPZA70rDjJd7X9XiEKh6JzxHb8daPlfAWPq0GcipnS
         tTuC0E9LHsZlqbMRPv7wmWAuaPG531DGWHrL7xMDJ5NOkktRef4pqLYc7XihMGB4Nxdc
         CPZuZB0/B7IwiSnzUF99mQ3Yp2DTR8uAYCz6UiuMpHdMLcUbMeZxZSDV0u5XGfFNYtag
         uo/l/J1O+1mhXN0oSiZuswNaReKhJ3VcaEZ7JMg7Dp3lQDORtlf234d/DhMAYOulZN/J
         aMt7ow35OW9sRmIMF79Ox7pJCstzsa7NtlAZkVONB5nIP66J9jW4i9iM7jxdmPS0n9/y
         MpsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766301133; x=1766905933;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qzCtCXPpJksCwKOWKXvWbqXbkA87udvkBHpHfw0vp1Y=;
        b=RNUqcKHWbEe/bHdOTEpfW1Nz1elsoMXTAuvZpJblozVH207jt0+58lWz+Ouu4Wm7Qw
         E1cfVqLKkq4KmyM8HhA8Ojhf3cquDB2TuIlMsG84LHAA76eCc0ToShU7+oT+1iMw5IQd
         DSXxAG4J9xganxOmpRXgCUOjF4XG8Fv1QezKygM/AFQPt+jQjCBVEC2nvY89fMv4Pha6
         q8SoWha38srvBsnqO6k/Bnoh+SdiP5kkYpyhfneCLrqbhM5K68xRhA8h4UHLpDhDDV1O
         AyIjjVG63Y3kUpHwma2SMP/xnCeP47MSCKzJmtr84d794ORQH5oaRkAVWDaxbjqR4JpW
         dgDg==
X-Forwarded-Encrypted: i=1; AJvYcCVS0k9OQCxDVu20as2mJ+h+6VGCwXMWA7FePy4Sfgcs4ub86TW8nROe3la1UJuBggtL6Uf3dg5D6SmE2A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzinECQEPgs4isHHlNOUpkG+o/O7RlbM3KOTKjuKhyVqOioBIyy
	sAt85m8/MunK1MKuqZkPwDSNilB9bIXKUEy58AiV42OrmF5W+9pvyWfn
X-Gm-Gg: AY/fxX7T8uKEa8SkxHdA3ZrYe+9G24fPbXbk45Bx7W/QlbdVebld+5LOedO/ikUCqYS
	VJquK61e+aTDAQGKUS8JBiZhAlekhDahyyB2rnnlRtYx4rbx0ZChMs7MQaMu+LhU33OyJNDR369
	qo+p2MiikXMIbAUywiVh8CSXwukWQH34uC+Dx2KrJJ3zovSHsSELOYPqDuk0ST9nLsTfRFaMNfG
	K3fwszlf8ktpzakC/oKAxzDUoN9V/+ickfDmff313jWwNIBhG2bWtj8dMbaLzBgDlAYNFf/HjOB
	Vt/oFt4DU22IbYTn5RjXkFU13mOHIhvXr7Lj/nys/NZkiho4UtMumRaaQ+ZuBoX9Fmp6cqgBPYd
	WzVVCIBA3lletxy7RFRN1LTK1Y3YMAJZlZ5OMi8gTNL6I2ICsf1ILzd7p0/4zZhadVfhDQHqVBD
	W6KhEy
X-Google-Smtp-Source: AGHT+IGIPYFeedEPq4NHjeRfIrATjm+rPLqP/z//FB66WtSOi9nspDfl3x3TE/ddBevIS7cWXjTI7Q==
X-Received: by 2002:a17:902:d488:b0:2a0:9b4f:5ebd with SMTP id d9443c01a7336-2a2f2229d26mr67255515ad.15.1766301132600;
        Sat, 20 Dec 2025 23:12:12 -0800 (PST)
Received: from dw-tp ([171.76.81.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c828dbsm63727595ad.22.2025.12.20.23.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 23:12:11 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@alien8.de>, Christophe Leroy <christophe.leroy@csgroup.eu>, Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>, linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, x86@kernel.org, linux-riscv@lists.infradead.org, "David Hildenbrand (Red Hat)" <david@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] mm/hugetlb: ignore hugepage kernel args if hugepages are unsupported
In-Reply-To: <20251221053611.441251-1-sourabhjain@linux.ibm.com>
Date: Sun, 21 Dec 2025 11:29:25 +0530
Message-ID: <87a4zcml36.ritesh.list@gmail.com>
References: <20251221053611.441251-1-sourabhjain@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_231214_121887_13FF0BD2 
X-CRM114-Status: GOOD (  29.65  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


Hi Sourabh,

Sourabh Jain <sourabhjain@linux.ibm.com> writes:

> Skip processing hugepage kernel arguments (hugepagesz, hugepages, and
> default_hugepagesz) when hugepages are not supported by the
> architecture.
>
> Some architectures may need to disable hugepages based on conditions
> discovered during kernel boot. The hugepages_supported() helper allows
> architecture code to advertise whether hugepages are supported.
>
> Currently, normal hugepage allocation is guarded by
> hugepages_supported(), but gigantic hugepages are allocated regardless
> of this check. This causes problems on powerpc for fadump (firmware-
> assisted dump).
>
> In the fadump (firmware-assisted dump) scenario, a production kernel
> crash causes the system to boot into a special kernel whose sole
> purpose is to collect the memory dump and reboot. Features such as
> hugepages are not required in this environment and should be
> disabled.
>
> For example, when the fadump kernel boots with the following kernel
> arguments:
> default_hugepagesz=1GB hugepagesz=1GB hugepages=200
>
> Before this patch, the kernel prints the following logs:
>
> HugeTLB: allocating 200 of page size 1.00 GiB failed.  Only allocated 58 hugepages.
> HugeTLB support is disabled!
> HugeTLB: huge pages not supported, ignoring associated command-line parameters
> hugetlbfs: disabling because there are no supported hugepage sizes
>
> Even though the logs state that HugeTLB support is disabled, gigantic
> hugepages are still allocated. This causes the fadump kernel to run out
> of memory during boot.
>
> After this patch is applied, the kernel prints the following logs for
> the same command line:
>
> HugeTLB: hugepages unsupported, ignoring default_hugepagesz=1GB cmdline
> HugeTLB: hugepages unsupported, ignoring hugepagesz=1GB cmdline
> HugeTLB: hugepages unsupported, ignoring hugepages=200 cmdline
> HugeTLB support is disabled!
> hugetlbfs: disabling because there are no supported hugepage sizes
>
> To fix the issue, gigantic hugepage allocation should be guarded by
> hugepages_supported().
>
> Previously, two approaches were proposed to bring gigantic hugepage
> allocation under hugepages_supported():
>
> [1] Check hugepages_supported() in the generic code before allocating
> gigantic hugepages
> [2] Make arch_hugetlb_valid_size() return false for all hugetlb sizes
>
> Approach [2] has two minor issues:
> 1. It prints misleading logs about invalid hugepage sizes
> 2. The kernel still processes hugepage kernel arguments unnecessarily
>
> To control gigantic hugepage allocation, skip processing hugepage kernel
> arguments (default_hugepagesz, hugepagesz and hugepages) when
> hugepages_supported() returns false.
>
> Link: https://lore.kernel.org/all/20250121150419.1342794-1-sourabhjain@linux.ibm.com/ [1]
> Link: https://lore.kernel.org/all/20250128043358.163372-1-sourabhjain@linux.ibm.com/ [2]
> Fixes: c2833a5bf75b ("hugetlbfs: fix changes to command line processing")


I appreciate our proactiveness to respond quickly on mailing list, but I
suggest we give enough time to folks before sending the next version
please ;).

Your email from last night [1] says that we will use this fixes tag but
you haven't even given us 24hrs to respond to that email thread :). Now
we've sent this v6, with Acked-by of David and Reviewed-by of mine,
which seems like everything was agreed upon, but that isn't the case
actually.

My main concern was - 
A fixes tag means it might get auto backported to stable kernels too,
which means if the fixes tag is incorrect it could even break stable
kernels then. 

[1]: https://lore.kernel.org/linuxppc-dev/041352df-41ce-4898-8535-d6b7fd74a52b@linux.ibm.com/T/#m6e16738c03b2b2a8d09717f6291e46207033507a


Anyways,
Coming back to the fixes tag. I did mention a bit of a history [2] of
whatever I could find while reviewing this patch. I am not sure whether
you have looked into the links shared in that email or not. Here [2]: 

[2]: https://lore.kernel.org/linuxppc-dev/875xa3ksz9.ritesh.list@gmail.com/

Where I am coming from is.. The current patch is acutally a partial
revert of the patch mentioned in the fixes tag. That means if this patch
gets applied to the older stable kernels, it would end up bringing the
same problem back, which the "Fixes" tagged patch is fixing in the 1st
place, isnt' it? See this discussion [3]...

[3]: https://lore.kernel.org/all/b1f04f9f-fa46-c2a0-7693-4a0679d2a1ee@oracle.com/T/#m0eee87b458d93559426b8b0e78dc6ebcd26ad3ae

... So, IMO - the right fixes tag, if we have to add, it should be the
patch which moved the hpage_shift initialization to happen early i.e. in
mmu_early_init_devtree. That would be this patch [4]:  

[4]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2354ad252b66695be02f4acd18e37bf6264f0464

Now, it's not really that the patch [4] had any issue as such. But it
seems like, that the current fix can only be applied after patch [4] is
taken.

Do we agree? 

<...>
> Acked-by: David Hildenbrand (Red Hat) <david@kernel.org>
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
> Changelog:
>
<...>
> v6:
>  - Updated commit message with additional logs and tags
>  - No functional changes
> ---
>  mm/hugetlb.c | 16 ++++++++++++++++
>  1

-ritesh

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
