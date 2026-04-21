Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751FDF94CB1
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 21:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LADdW5hIJr3VEUu/WBQ4B+xgRY/PZ4frN7fVEhafJ/s=; b=CcKYdPtlTdfG5lRMEHcKNy4sHt
	SI+zVs1q1PKFZ7VHTzsfD47+t/fs8BWGpDVCP+4PjqIosJVZ/WAwULbmK67245ra4ZOLzFTviz+uQ
	CvqE4ElUdukqu2EZPhlmAMNjkn6HXCiSJ3UWvQN75FyFaUg7SIy9GxTYWEKk5rFFF7NM6/M5AVy4L
	oLNXH7W+Mb573ZIiGWbzWAELOYFCzgOP7qSym9u/Fhlqnb4P+dWY20DAkSZwlsLsWjMmBMO52uCH1
	KtbXlhnJIjYaNa+nEkX6oFTsO4XFAE/zT01JiypvSKY/0gYHoMion6/vPUNqAlicyyoQdqV0IUlMy
	pSr/Gs0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFID9-000000099mP-1zzk;
	Tue, 21 Apr 2026 21:00:47 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFE0F-00000008uf5-06SN
	for linux-riscv@lists.infradead.org;
	Tue, 21 Apr 2026 16:31:12 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-82fa5ecd760so1848071b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 Apr 2026 09:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776789069; x=1777393869; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rjgkwxA0RLtfuWNBMEJF4TxxPjAXkNJh9XTaeAVjQ5Q=;
        b=d3+QgKiL38+LFEKcnEIGl5kAEY8ynZYt2zYYsF2VUm9z2imSOKjoQysaieF1ORmxce
         pxJSTgcjEwlV3VXujttv580SL00qwEwKtj7qxbgQGe7epoLyQaVoH91RJ783imeWs/Yy
         rL7gDz/hu+CsUB1chA8M6dOm06cERnJjGIMYGwBCfDt0dtNfFNAqqGfxvW/uQbWamTBs
         wcQnSSJuh4bnlNRFpRN4/pTpLiepURj1Uq88ka/gEZKMpgrue277Sv8+nTXo5enXi/at
         7kCiyzuzlu6Qordi3hZhgoGqmmVDATHerNL57M98g+ygpQgAqGHhMIhRxFNhxuz/ydND
         1qdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776789069; x=1777393869;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rjgkwxA0RLtfuWNBMEJF4TxxPjAXkNJh9XTaeAVjQ5Q=;
        b=GzSiizhJcf28YnYlOUXBPPLsRVW6UeIEiKM/wxlPU4Jhyjky19D9jm/35VKlToR4yQ
         iHzuafk+yRqT4Lsmy1YiJpVomI27T9XHa6wZvhLR52fvCc3omB2D6ZyA+Lk1fP3ImSIl
         7B3lytBwtFRPwbMPAB808JIBC7Ihzzb7zgtCVcKIL1SY78lc+/FCiAHN4anL5lHOKhM6
         sdcFvJTVcCALfrcwFOAUfh6TrCCpp7tH1tkgC2f2xBzr3nJH1UbU24RqyDZgtqWsnUt0
         IumB0Oa02ADWiqcNSm4smNLlFNGgb4KzAMCktSUBDsCxU0kFJ7m5CQrOjZs3MRpioCn3
         1U7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+7qOBEM2+uz/0y3cJd0GdKtz4XQdRjLl2n5uN4LoczLFvC7ff03DrLyKHJkFsPmzCo67RemcMSRIWLwA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwX4DPFJL8s3DnBW3hTeFuf93OzeByZVtsQ8b1yjSxJ6W8Hs7h4
	eBgu+ZsW5mbfmPz8MjESaIwKtXpM/P2RbCd/5LvVdYe4sDlSM38X4w3xqTUX8I/D2r0Tz5F/bNR
	MvMwDbA==
X-Received: from pfbhk7.prod.google.com ([2002:a05:6a00:8787:b0:82f:f2d:5b4d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2d8d:b0:82c:1cd0:2f5e
 with SMTP id d2e1a72fcca58-82f8c96eb30mr20038023b3a.44.1776789068848; Tue, 21
 Apr 2026 09:31:08 -0700 (PDT)
Date: Tue, 21 Apr 2026 09:31:07 -0700
In-Reply-To: <20260410151746.61150-11-kalyazin@amazon.com>
Mime-Version: 1.0
References: <20260410151746.61150-1-kalyazin@amazon.com> <20260410151746.61150-11-kalyazin@amazon.com>
Message-ID: <aeemS2wm38Cm4qAf@google.com>
Subject: Re: [PATCH v12 10/16] KVM: guest_memfd: Add flag to remove from
 direct map
From: Sean Christopherson <seanjc@google.com>
To: Nikita Kalyazin <kalyazin@amazon.co.uk>
Cc: "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "corbet@lwn.net" <corbet@lwn.net>, "maz@kernel.org" <maz@kernel.org>, "oupton@kernel.org" <oupton@kernel.org>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>, "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>, "bp@alien8.de" <bp@alien8.de>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>, "luto@kernel.org" <luto@kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "willy@infradead.org" <willy@infradead.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "david@kernel.org" <david@kernel.org>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "vbabka@kernel.org" <vbabka@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>, "mhocko@suse.com" <mhocko@suse.com>, "ast@kernel.org" <ast@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "andrii@kernel.org" <andrii@kernel.org>, "martin.lau@linux.dev" <martin.lau@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "song@kernel.org" <song@kernel.org>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "haoluo@google.com" <haoluo@google.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "peterx@redhat.com" <peterx@redhat.com>, "jannh@google.com" <jannh@google.com>, "pfalcato@suse.de" <pfalcato@suse.de>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "riel@surriel.com" <riel@surriel.com>, "ryan.roberts@arm.com" <ryan.roberts@arm.com>, "jgross@suse.com" <jgross@suse.com>, "yu-cheng.yu@intel.com" <yu-cheng.yu@intel.com>, "kas@kernel.org" <kas@kernel.org>, "coxu@redhat.com" <coxu@redhat.com>, "ackerleytng@google.com" <ackerleytng@google.com>, "yosry@kernel.org" <yosry@kernel.org>, "ajones@ventanamicro.com" <ajones@ventanamicro.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>, "tabba@google.com" <tabba@google.com>, "prsampat@amd.com" <prsampat@amd.com>, "wu.fei9@sanechips.com.cn" <wu.fei9@sanechips.com.cn>, "mlevitsk@redhat.com" <mlevitsk@redhat.com>, "jmattson@google.com" <jmattson@google.com>, "jthoughton@google.com" <jthoughton@google.com>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "alex@ghiti.fr" <alex@ghiti.fr>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>, "dev.jain@arm.com" <dev.jain@arm.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "pjw@kernel.org" <pjw@kernel.org>, "shijie@os.amperecomputing.com" <shijie@os.amperecomputing.com>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "thuth@redhat.com" <thuth@redhat.com>, "yang@os.amperecomputing.com" <yang@os.amperecomputing.com>, 
 "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "urezki@gmail.com" <urezki@gmail.com>, "zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, "jiayuan.chen@shopee.com" <jiayuan.chen@shopee.com>, "lenb@kernel.org" <lenb@kernel.org>, "pavel@kernel.org" <pavel@kernel.org>, "rafael@kernel.org" <rafael@kernel.org>, "yangyicong@hisilicon.com" <yangyicong@hisilicon.com>, "vannapurve@google.com" <vannapurve@google.com>, "jackmanb@google.com" <jackmanb@google.com>, "patrick.roy@linux.dev" <patrick.roy@linux.dev>, Jack Thomson <jackabt@amazon.co.uk>, Takahiro Itazuri <itazur@amazon.co.uk>, Derek Manwaring <derekmn@amazon.com>, Nikita Kalyazin <nikita.kalyazin@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_093111_073579_3079B793 
X-CRM114-Status: GOOD (  26.41  )
X-Mailman-Approved-At: Tue, 21 Apr 2026 14:00:45 -0700
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

On Fri, Apr 10, 2026, Nikita Kalyazin wrote:
> From: Patrick Roy <patrick.roy@linux.dev>
> 
> Add GUEST_MEMFD_FLAG_NO_DIRECT_MAP flag for KVM_CREATE_GUEST_MEMFD()
> ioctl. When set, guest_memfd folios will be removed from the direct map
> after preparation, with direct map entries only restored when the folios
> are freed.
> 
> To ensure these folios do not end up in places where the kernel cannot
> deal with them, set AS_NO_DIRECT_MAP on the guest_memfd's struct
> address_space if GUEST_MEMFD_FLAG_NO_DIRECT_MAP is requested.
> 
> Note that this flag causes removal of direct map entries for all
> guest_memfd folios independent of whether they are "shared" or "private"
> (although current guest_memfd only supports either all folios in the
> "shared" state, or all folios in the "private" state if
> GUEST_MEMFD_FLAG_MMAP is not set). The usecase for removing direct map
> entries of also the shared parts of guest_memfd are a special type of
> non-CoCo VM where, host userspace is trusted to have access to all of
> guest memory, but where Spectre-style transient execution attacks
> through the host kernel's direct map should still be mitigated.  In this
> setup, KVM retains access to guest memory via userspace mappings of
> guest_memfd, which are reflected back into KVM's memslots via
> userspace_addr. This is needed for things like MMIO emulation on x86_64
> to work.
> 
> Direct map entries are zapped right before guest or userspace mappings
> of gmem folios are set up, e.g. in kvm_gmem_fault_user_mapping() or
> kvm_gmem_get_pfn() [called from the KVM MMU code].

...

> +#define KVM_GMEM_FOLIO_NO_DIRECT_MAP BIT(0)
> +
> +static bool kvm_gmem_folio_no_direct_map(struct folio *folio)
> +{
> +	return ((u64)folio->private) & KVM_GMEM_FOLIO_NO_DIRECT_MAP;
> +}
> +
> +static int kvm_gmem_folio_zap_direct_map(struct folio *folio)
> +{
> +	int r = 0;
> +
> +	VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
> +
> +	if (WARN_ON_ONCE(!(GMEM_I(folio_inode(folio))->flags & GUEST_MEMFD_FLAG_NO_DIRECT_MAP)))
> +		return -EINVAL;
> +
> +	if (kvm_gmem_folio_no_direct_map(folio))
> +		goto out;
> +
> +	r = folio_zap_direct_map(folio);
> +	if (!r)
> +		folio->private = (void *)((u64)folio->private | KVM_GMEM_FOLIO_NO_DIRECT_MAP);
> +
> +out:
> +	return r;
> +}
> +
> +static void kvm_gmem_folio_restore_direct_map(struct folio *folio)
> +{
> +	folio_restore_direct_map(folio);
> +	folio->private = (void *)((u64)folio->private & ~KVM_GMEM_FOLIO_NO_DIRECT_MAP);
> +}

Making guest_memfd responsible for zapping and restoring the direct map on a per-
folio basis feels wrong given the addition of AS_NO_DIRECT_MAP.  I especially don't
like that the "rules" for when an AS_NO_DIRECT_MAP folio has a direct map will vary
based on the owner, and even within an owner (e.g. guest_memfd) will be ad hoc.

E.g. as per the series to add guest_memfd write() support[*]:

  When direct map removal is implemented [2]
   - write() will not be allowed to access pages that have already
     been removed from direct map
   - on completion, write() will remove the populated pages from
     direct map

That's pretty gross ABI, because with KVM_GMEM_FOLIO_NO_DIRECT_MAP, userspace can
write() exactly once.  To re-write memory, I assume userspace would need to do a
PUNCH_HOLE or truncate.

What's preventing us from handling this automagically in e.g. filemap_add_folio()
and filemap_remove_folio()?  Then the usage rules are pretty straightforward: the
kernel must *always* assume the direct map is invalid for folios from
AS_NO_DIRECT_MAP mappings.

Then if KVM needs to utilize a kernel mapping, e.g. in kvm_gmem_populate(), KVM
could use dedicated variants of kmap_local_xxx() to deal with a local mapping for
a folio/page without a direct map.  Or, KVM could simply disallow the specific
sequence that would require KVM to do the memcpy (I'm pretty sure we can do that
with in-place shared=>private conversion support).

I realize that could throw a big wrench into write() performance, but IMO, before
merging either series, we need a complete story for exactly how this will all fit
together, in a maintainable fashion and with sane ABI.

[*] https://lore.kernel.org/all/20251114151828.98165-1-kalyazin@amazon.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
