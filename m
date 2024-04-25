Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DC25C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Apr 2024 16:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Z0ER6g9VSurAU5VhwtkgRN5LFXFKfs+/s5No6eJr5WQ=; b=hkooG8HXbyBjJUHWcmIii3unP5
	J24NIyoXrxQg72RjjRe2V51vFbd0vPhfnRf3faNgB2Kyetw9Lm+AO2ehoSFCK2X7fltXiYC131ayB
	lJ10eb96a+CzKrqaBG96lO9WInVWNYbnHSwr8Wuz7vJsyhgsJ26WktOMP9kvYjd6rGj3vYuvMxY32
	8GNmf9hxKH/0ad5vqYuSD/clqt8BkIThyyd/O07PQAUoruDdnERCcpvZQcPmXxDCl6d9WlA4w2bio
	iO08luht0RXxzsjAprireJSy2heMR36+16HXNMlPouQnFA5Bh3rdWH4TT8K79cqQ1I2mT97nl9JW0
	5Sv/LA2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s01lz-00000009K99-0hxu;
	Thu, 25 Apr 2024 16:16:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s00jX-000000092sC-25Mi
	for linux-riscv@bombadil.infradead.org;
	Thu, 25 Apr 2024 15:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=m1qzGW4ycfJBkwOtQag42BpB9F1dgLw6AsC1TpSQ/BE=; b=GVpb1nLUm1d7L3rDPQsbPHgbKI
	C4T0vVd6n2Hsj0Ki8d4EOtZ4aTxy3R+ELXhzORqJSuu0nN7MI83uQLTVZIgdkbffe7i6ZVyXtdxI2
	fZkl34/oLnsTUZAH57AXYfGhtTy7scjk/eMmL1r0mQmvH43DUoQ9C9gfGJKZurDMXfLxlhTpYZVYF
	1XwGE5N2tbDAqE7apMocnj9w/mL6WHeI3VvwQU96pV9XEnRQZ8+80ty86y0MAjjfhDBi25PsObrO4
	e9+v5aXHEK8t0F535fYttyzOhj5cAWehTzxYlIArfG5vjUWGw48B8e8EpuHDFGOmGU/p3E5xm3zqI
	RDYf2Zsw==;
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s00jR-0000000Ey5x-3wQl
	for linux-riscv@lists.infradead.org;
	Thu, 25 Apr 2024 15:09:57 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-de59d580f61so472196276.3
        for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2024 08:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1714057791; x=1714662591; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=m1qzGW4ycfJBkwOtQag42BpB9F1dgLw6AsC1TpSQ/BE=;
        b=zc6MIkx0YEgbzXDtW9JVikMN8kHgpnHRmsugzSuHGry5f5Jqcoc6PziZFzAwUWwaZD
         MCFss9k/TCiJ0JGdFc8gwVeBBUZHb6/kEbXQeLwRkeH8/E10Ki7mNk5W6aw7iYkxElbd
         uFqtxwMoUseea3HK0nXWN9A0QsEN+MdhJZKXx1sOUBnpwn+0o+h4vD07RMyyPunNtddF
         q/OzhYtz98kqfTFkEuZ7Dy6OjyY2k3dWAK9EXM/oWlR1aIRgUzcekVJwyoWxOALrF9ti
         qeT2ipLFLQqcClgf2ORB8s6z881F1RWbmbbNLxCQ+1QrTtR6GwAxAOU5+hnLw5qsOSwn
         Fmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714057791; x=1714662591;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m1qzGW4ycfJBkwOtQag42BpB9F1dgLw6AsC1TpSQ/BE=;
        b=wHZhkEbEyv3ahneR8N3QlZy+ZF3zKJfle8vwaYkOgdUxsV9bIwm1RyuG1xVz3wZgm9
         y8nTgwmnnAUhc/yWMnPthuxUoADC4CqF0CqrO8uPHIMK7+VgwE3z1KQdZL0STfngID9b
         aqJ08kHIG8UjIQcRjNq2UG0+rAfIUa+mHbwOakUrBzrWzXqMbs5H46AnY+7FPtEJLDbW
         2k2lBfWgBz5uOvanuk2/XtN55edVvM7hZpbU9tGmLusMHfeGJfRbomXyeZ8zFv2yYH4J
         y6/VluWu7U/RNcsE1GLAt2K64l+kEyWIuuZw5sPi1J3k797JGlLnFKYnoEMRbJPuGZvS
         UTEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVo4YG6Kl/Chh2p2DWf610RPVChmlYqWxoSZrpWCa98YvUqE72tearhIB5zXFKeQC62r/a7rly3vvOROS0T0Q16uFWs541dzASkWhNkHVsX
X-Gm-Message-State: AOJu0YzsZF+w66GewxgCj2+PQ0tyIv7i3714M4AyRvKucd7q4svMDHPN
	J7UxumrhltH+9sXd+mHgT4Mn0v/WpPWYXWMQFeGrygOXc/GwulgOHa1R6fbE2Rxt1TSDEc3xYrD
	XSA==
X-Google-Smtp-Source: AGHT+IESJpACVh541xxXAQ9OLoBU3w6/mlBcJ1Y0e41i9MN7u+mraz/pMXzsHrFUz1aVf7/+mBldg/ztHFs=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:698a:0:b0:de4:c2d4:e14f with SMTP id
 e132-20020a25698a000000b00de4c2d4e14fmr1617703ybc.11.1714057790783; Thu, 25
 Apr 2024 08:09:50 -0700 (PDT)
Date: Thu, 25 Apr 2024 08:09:49 -0700
In-Reply-To: <3848a9ad-07aa-48da-a2b7-264c4a990b5b@linuxfoundation.org>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-26-seanjc@google.com>
 <69ae0694-8ca3-402c-b864-99b500b24f5d@moroto.mountain> <3848a9ad-07aa-48da-a2b7-264c4a990b5b@linuxfoundation.org>
Message-ID: <ZipyPYR8Nv_usoU4@google.com>
Subject: Re: [PATCH v13 25/35] KVM: selftests: Convert lib's mem regions to KVM_SET_USER_MEMORY_REGION2
From: Sean Christopherson <seanjc@google.com>
To: Shuah Khan <skhan@linuxfoundation.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Shuah Khan <shuah@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Xiaoyao Li <xiaoyao.li@intel.com>, 
	Xu Yilun <yilun.xu@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Anish Moorthy <amoorthy@google.com>, David Matlack <dmatlack@google.com>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?=" <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, 
	Naresh Kamboju <naresh.kamboju@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Benjamin Copeland <ben.copeland@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_160954_094979_C28AF875 
X-CRM114-Status: GOOD (  20.12  )
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

On Thu, Apr 25, 2024, Shuah Khan wrote:
> On 4/25/24 08:12, Dan Carpenter wrote:
> > On Fri, Oct 27, 2023 at 11:22:07AM -0700, Sean Christopherson wrote:
> > > Use KVM_SET_USER_MEMORY_REGION2 throughout KVM's selftests library so that
> > > support for guest private memory can be added without needing an entirely
> > > separate set of helpers.
> > > 
> > > Note, this obviously makes selftests backwards-incompatible with older KVM
> >    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > versions from this point forward.
> >    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > 
> > Is there a way we could disable the tests on older kernels instead of
> > making them fail?  Check uname or something?  There is probably a
> > standard way to do this...  It's these tests which fail.
> 
> They shouldn't fail - the tests should be skipped on older kernels.

Ah, that makes sense.  Except for a few outliers that aren't all that interesting,
all KVM selftests create memslots, so I'm tempted to just make it a hard requirement
to spare us headache, e.g.

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index b2262b5fad9e..4b2038b1f11f 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -2306,6 +2306,9 @@ void __attribute((constructor)) kvm_selftest_init(void)
        /* Tell stdout not to buffer its content. */
        setbuf(stdout, NULL);
 
+       __TEST_REQUIRE(kvm_has_cap(KVM_CAP_USER_MEMORY2),
+                      "KVM selftests from v6.8+ require KVM_SET_USER_MEMORY_REGION2");
+
        kvm_selftest_arch_init();
 }

--

but it's also easy enough to be more precise and skip only those that actually
create memslots.

diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
index b2262b5fad9e..b21152adf448 100644
--- a/tools/testing/selftests/kvm/lib/kvm_util.c
+++ b/tools/testing/selftests/kvm/lib/kvm_util.c
@@ -944,6 +944,9 @@ int __vm_set_user_memory_region2(struct kvm_vm *vm, uint32_t slot, uint32_t flag
                .guest_memfd_offset = guest_memfd_offset,
        };
 
+       __TEST_REQUIRE(kvm_has_cap(KVM_CAP_USER_MEMORY2),
+                      "KVM selftests from v6.8+ require KVM_SET_USER_MEMORY_REGION2");
+
        return ioctl(vm->fd, KVM_SET_USER_MEMORY_REGION2, &region);
 }
 
@@ -970,6 +973,9 @@ void vm_mem_add(struct kvm_vm *vm, enum vm_mem_backing_src_type src_type,
        size_t mem_size = npages * vm->page_size;
        size_t alignment;
 
+       __TEST_REQUIRE(kvm_has_cap(KVM_CAP_USER_MEMORY2),
+                      "KVM selftests from v6.8+ require KVM_SET_USER_MEMORY_REGION2");
+
        TEST_ASSERT(vm_adjust_num_guest_pages(vm->mode, npages) == npages,
                "Number of guest pages is not compatible with the host. "
                "Try npages=%d", vm_adjust_num_guest_pages(vm->mode, npages));
--

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
