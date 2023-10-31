Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F080DC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 14:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RgttpHn374erxByzdeuqKbu7ZcP0fBH+arALnqJuqN0=; b=mpGgN1L1nxPBqPwhU3L1Zwigcy
	e1rMLbN8Ki1Kc9Q7qXWHvVXwcjkPeC1r9uzYQMgHM9selbTu1owSEBktu9uVmrC6OR2ZLCJpN2n9z
	/+XvQgfDQzxaT6EfwewA6jSVJz2E2DmzJK6bHe3lk8KeRQGkVJ/Ww1Ii5YWp1kNUb5dmlBipRGJUh
	lAUBaUjRWImte8oDb7BX8K0VKlspSBjiySkfdst8yVT6mEi1Yi4DMAT9ZlGEcq9/WT60Saf346aCf
	nDfqfnpb+unoULI97+JvVqOhfwsD3gJKVCaDoEEWKfZJDYjU1dZ1asw+XVgem8nsRQDEjLe7ZQboe
	sfFL5NWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxpRf-005Op4-1a;
	Tue, 31 Oct 2023 14:10:15 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxpRb-005On9-2n
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 14:10:13 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5a7af53bde4so60423187b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 07:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698761410; x=1699366210; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qnQOjymnTrZBwkJL50GP/1+n+ilT5bo3LZ+viwIL69A=;
        b=dNCfNET6nZ5ncGz+msMYMug45u2Jfk8KiZiZluqYItKzSkSjjsw/m/z7FFiMnlme8n
         a3vI1ykM4G/zQyYmQbtJKBRBiPXaAqadn8nZa0N1EsDZq6aArn6kxEwz/8e53DlmUDpw
         menFAFyD6AqbxJRUntezvSUMSUyrgfZgsIYSTviBhN/8nl/+juH6zNpe0Rb6QymNzUnt
         fYfSMop+VgdDDpADO+jblKqSy03DBl6eZSCEvmFEZb4JbVSuTuDLKgdICvY8y1m9Up8d
         glccQ8nmPdluv494XIQuIftxSTOzB+cEO+C/Tyfd1ZjdGHiqOQkB0/XSR4YGfQPCExBn
         i7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698761410; x=1699366210;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qnQOjymnTrZBwkJL50GP/1+n+ilT5bo3LZ+viwIL69A=;
        b=iqn9KPeSHvuH77VdxJeHQw+SFr5yVmvS2isXbYUSTBBv27sjU+acIfM0UFcpfdr/cC
         p+/Gd/zAGer9Jk6Y9WNIkImlJZ/qNNsuNE/alre9mp0VJdPMDHOUtNqNV0jkd8gELri8
         7uL/2eMbBSk+ZNc/W7PNwnRRXZqUzmV9PrfZI1tkXOrADpmSXkWjfsmU2Sr13ChiOwyP
         8inkAX3Kn90M127OjzvpleWNNjdGP+pXJc99tNLIqInBsJMebbtgP7Bs27uWKMMwTb2F
         e3SyliRIMXxz3Efb2lGgdUsneuprJB++mpFvGLEnY0mEvAPSEt6e86t9IG/hPWkzi7G3
         kE6Q==
X-Gm-Message-State: AOJu0Yxl+NgmkKkF6iXDJoj24WaSgY1+B10zfd4l651a8zKHCcFcIKaW
	CAapozJDaCQ9x+8D26YN8D1NkiJDvS4=
X-Google-Smtp-Source: AGHT+IHZDXQi7UJsz3IrNX3ZHQxUCVwQKR+0lKBMLeJ46WZVaPkGJ08yzTLT3JODvkoGCJ0IGZA0c9r9iJw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a81:a14c:0:b0:59b:eea4:a5a6 with SMTP id
 y73-20020a81a14c000000b0059beea4a5a6mr274540ywg.0.1698761410163; Tue, 31 Oct
 2023 07:10:10 -0700 (PDT)
Date: Tue, 31 Oct 2023 07:10:08 -0700
In-Reply-To: <ZUCe/PGL2Q4OzDOX@chao-email>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <ZUCe/PGL2Q4OzDOX@chao-email>
Message-ID: <ZUEKwOQoibAEWAzU@google.com>
Subject: Re: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, kvm@vger.kernel.org, 
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
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_071011_909600_BC9D0B96 
X-CRM114-Status: GOOD (  14.97  )
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

On Tue, Oct 31, 2023, Chao Gao wrote:
> >+int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
> >+{
> >+	loff_t size = args->size;
> >+	u64 flags = args->flags;
> >+	u64 valid_flags = 0;
> >+
> >+	if (flags & ~valid_flags)
> >+		return -EINVAL;
> >+
> >+	if (size < 0 || !PAGE_ALIGNED(size))
> >+		return -EINVAL;
> 
> is size == 0 a valid case?

Nope, this is a bug.

> >+	if (!xa_empty(&gmem->bindings) &&
> >+	    xa_find(&gmem->bindings, &start, end - 1, XA_PRESENT)) {
> >+		filemap_invalidate_unlock(inode->i_mapping);
> >+		goto err;
> >+	}
> >+
> >+	/*
> >+	 * No synchronize_rcu() needed, any in-flight readers are guaranteed to
> >+	 * be see either a NULL file or this new file, no need for them to go
> >+	 * away.
> >+	 */
> >+	rcu_assign_pointer(slot->gmem.file, file);
> >+	slot->gmem.pgoff = start;
> >+
> >+	xa_store_range(&gmem->bindings, start, end - 1, slot, GFP_KERNEL);
> >+	filemap_invalidate_unlock(inode->i_mapping);
> >+
> >+	/*
> >+	 * Drop the reference to the file, even on success.  The file pins KVM,
> >+	 * not the other way 'round.  Active bindings are invalidated if the
> >+	 * file is closed before memslots are destroyed.
> >+	 */
> >+	fput(file);
> >+	return 0;
> >+
> >+err:
> >+	fput(file);
> >+	return -EINVAL;
> 
> The cleanup, i.e., filemap_invalidate_unlock() and fput(), is common. So, I think it
> may be slightly better to consolidate the common part e.g.,

I would prefer to keep this as-is.  Only goto needs the unlock, and I find it easier
to understand the success vs. error paths with explicit returns.  But it's not a
super strong preference.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
