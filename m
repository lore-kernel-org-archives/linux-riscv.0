Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F743EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 21:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dcuwOkrQDoxnQc3Eqa1kZrSVzIK79c9miaf1nXUdGjs=; b=XIDtyDoI7txx4b
	uvRPBOX+IJsrY444kq881E5LxN6RJxCjkLLIQWMqyNakMFvEWmGcpN+ShxvEabhS5/bLNxmZ6txC2
	+GM0oLQ97d88u7BJZLzouHvqM847/5jYje3hGc9cn4sCe+CjbB1L6laYRTd6h0oSwbCQfv+JKoN3n
	iyUqMaBjvmVCRAOnxTDEFzKrdoazXixic3sRKE2NTc8Cwci/RJH4jiYv7dTeUfhsBiYtQYRIbziCy
	lBYXEIuKTyy4gk++KJ0OLp2h9P2xVEwJiGc7r3gTHRlF7For99N68Zx+reKWFl0WxTU7xwyZH0mY6
	HcsvRkXPycqMSVrPO1iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMbC3-00CFg8-1a;
	Thu, 20 Jul 2023 21:28:15 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMbC0-00CFcZ-0M;
	Thu, 20 Jul 2023 21:28:13 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-66872d4a141so892230b3a.1;
        Thu, 20 Jul 2023 14:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689888489; x=1690493289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9Hy/9zTVZrlg7bbFpxkjr0lhxcNTNGSKdXmN/n9YFLY=;
        b=nXxLfgmBt92XEDE8OP3OcE0nisAlc/Gi9Zse4iq73APm5A373sb6ySF1KTfOUa+QuX
         ia3Xy59KQUF7gIB0hPoPjhSopV94TeiwDt/LztWRB6Qyz1jHNY1OozvVaE5RMQ9UdGw5
         PMMWNQSNpVIxaxHNS4LWKSkQHzq5Z3SDiNLSXhdgHAc7DXvTGgH+4VKo2M8xFGbIHCXh
         337Ve685ARtbWN8k2WWVvoDis4FS9zWIZ1LrAJA1fxWvbDhCuW9Dnu/E9PeGYaOXlPVE
         kd4H7n4i3GLSfis0TrFmdjayzB65DGsbK8pheZGzu8z8qpliVRrp9gRaSAXgpDekRLO2
         A4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689888489; x=1690493289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Hy/9zTVZrlg7bbFpxkjr0lhxcNTNGSKdXmN/n9YFLY=;
        b=aP571Upra3c7/FqSLMDIojn8qXCNNr/JLv1ObXnvmjTsP8EQDoGg/SE13oy+8g/Bz8
         Bl0LJ0ulNVNyH27FfVWThQc4W7qwca9YMANum3n/HIaFo2PqevrfQper1EInmu3y2SOc
         dG/iq6Mhs+LTSDcyLRKLCpB5Uq7giObL+xpb9uq3cjkkbxyjvSYOUfODbgzPmO/qT10x
         ciYZ6CSr2c7Nqc9po7LsbiXAxO1NnKaT5/YI1UXUlaHs8e2OfuKesKBfFqkKCj6L7M0r
         JGlRGKmhy9//8yR0VxSX3GipF3U6hMM+iOIKZ5M4G8llGD8kBsjmqF0ANb3OwKFx7+QX
         PI2Q==
X-Gm-Message-State: ABy/qLaSPs7hkNfIzzqca6IjW4M4h9HwUkMX45uNO3ZT4c8jw/JTzAVH
	i5I5/y/3sEf6E5yO+8+lIqs=
X-Google-Smtp-Source: APBJJlG/e53j4EpED5Jwtfn4LkeoExV6FWkBmpJOuNFRNxz/SI2h0UOe64NVRwIQoof3O2DGaGflqQ==
X-Received: by 2002:a05:6a20:2583:b0:135:10fd:31b0 with SMTP id k3-20020a056a20258300b0013510fd31b0mr109795pzd.15.1689888488716;
        Thu, 20 Jul 2023 14:28:08 -0700 (PDT)
Received: from localhost ([192.55.54.50])
        by smtp.gmail.com with ESMTPSA id n2-20020a62e502000000b006826df9e286sm1637942pff.143.2023.07.20.14.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 14:28:08 -0700 (PDT)
Date: Thu, 20 Jul 2023 14:28:06 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org,
	Chao Peng <chao.p.peng@linux.intel.com>,
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>,
	Yu Zhang <yu.c.zhang@linux.intel.com>,
	Vishal Annapurve <vannapurve@google.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Maciej Szmigiero <mail@maciej.szmigiero.name>,
	Vlastimil Babka <vbabka@suse.cz>,
	David Hildenbrand <david@redhat.com>,
	Quentin Perret <qperret@google.com>,
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>,
	Liam Merwick <liam.merwick@oracle.com>,
	Isaku Yamahata <isaku.yamahata@gmail.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl()
 for guest-specific backing memory
Message-ID: <20230720212806.GG25699@ls.amr.corp.intel.com>
References: <20230718234512.1690985-1-seanjc@google.com>
 <20230718234512.1690985-13-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230718234512.1690985-13-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_142812_196685_88242DFC 
X-CRM114-Status: GOOD (  21.78  )
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

On Tue, Jul 18, 2023 at 04:44:55PM -0700,
Sean Christopherson <seanjc@google.com> wrote:

> +static int kvm_gmem_release(struct inode *inode, struct file *file)
> +{
> +	struct kvm_gmem *gmem = file->private_data;
> +	struct kvm_memory_slot *slot;
> +	struct kvm *kvm = gmem->kvm;
> +	unsigned long index;
> +
> +	filemap_invalidate_lock(inode->i_mapping);
> +
> +	/*
> +	 * Prevent concurrent attempts to *unbind* a memslot.  This is the last
> +	 * reference to the file and thus no new bindings can be created, but
> +	 * dereferencing the slot for existing bindings needs to be protected
> +	 * against memslot updates, specifically so that unbind doesn't race
> +	 * and free the memslot (kvm_gmem_get_file() will return NULL).
> +	 */
> +	mutex_lock(&kvm->slots_lock);
> +
> +	xa_for_each(&gmem->bindings, index, slot)
> +		rcu_assign_pointer(slot->gmem.file, NULL);
> +
> +	synchronize_rcu();
> +
> +	/*
> +	 * All in-flight operations are gone and new bindings can be created.
> +	 * Zap all SPTEs pointed at by this file.  Do not free the backing
> +	 * memory, as its lifetime is associated with the inode, not the file.
> +	 */
> +	kvm_gmem_invalidate_begin(gmem, 0, -1ul);
> +	kvm_gmem_invalidate_end(gmem, 0, -1ul);
> +
> +	mutex_unlock(&kvm->slots_lock);
> +
> +	list_del(&gmem->entry);
> +
> +	filemap_invalidate_unlock(inode->i_mapping);
> +
> +	xa_destroy(&gmem->bindings);
> +	kfree(gmem);
> +
> +	kvm_put_kvm(kvm);
> +
> +	return 0;
> +}

The lockdep complains with the filemapping lock and the kvm slot lock.


From bc45eb084a761f93a87ba1f6d3a9949c17adeb31 Mon Sep 17 00:00:00 2001
Message-Id: <bc45eb084a761f93a87ba1f6d3a9949c17adeb31.1689888438.git.isaku.yamahata@intel.com>
From: Isaku Yamahata <isaku.yamahata@intel.com>
Date: Thu, 20 Jul 2023 14:16:21 -0700
Subject: [PATCH] KVM/gmem: Fix locking ordering in kvm_gmem_release()

The lockdep complains the locking order.  Fix kvm_gmem_release()

VM destruction:
- fput()
   ...
   \-kvm_gmem_release()
     \-filemap_invalidate_lock(inode->i_mapping);
       lock(&kvm->slots_lock);

slot creation:
kvm_set_memory_region()
   mutex_lock(&kvm->slots_lock);
   __kvm_set_memory_region(kvm, mem);
    \-kvm_gmem_bind()
      \-filemap_invalidate_lock(inode->i_mapping);

======================================================
WARNING: possible circular locking dependency detected
------------------------------------------------------
...

the existing dependency chain (in reverse order) is:

-> #1 (mapping.invalidate_lock#4){+.+.}-{4:4}:
       ...
       down_write+0x40/0xe0
       kvm_gmem_bind+0xd9/0x1b0 [kvm]
       __kvm_set_memory_region.part.0+0x4fc/0x620 [kvm]
       __kvm_set_memory_region+0x6b/0x90 [kvm]
       kvm_vm_ioctl+0x350/0xa00 [kvm]
       __x64_sys_ioctl+0x95/0xd0
       do_syscall_64+0x39/0x90
       entry_SYSCALL_64_after_hwframe+0x6e/0xd8

-> #0 (&kvm->slots_lock){+.+.}-{4:4}:
       ...
       mutex_lock_nested+0x1b/0x30
       kvm_gmem_release+0x56/0x1b0 [kvm]
       __fput+0x115/0x2e0
       ____fput+0xe/0x20
       task_work_run+0x5e/0xb0
       do_exit+0x2dd/0x5b0
       do_group_exit+0x3b/0xb0
       __x64_sys_exit_group+0x18/0x20
       do_syscall_64+0x39/0x90
       entry_SYSCALL_64_after_hwframe+0x6e/0xd8

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(mapping.invalidate_lock#4);
                               lock(&kvm->slots_lock);
                               lock(mapping.invalidate_lock#4);
  lock(&kvm->slots_lock);

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
---
 virt/kvm/guest_mem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/virt/kvm/guest_mem.c b/virt/kvm/guest_mem.c
index ab91e972e699..772e4631fcd9 100644
--- a/virt/kvm/guest_mem.c
+++ b/virt/kvm/guest_mem.c
@@ -274,8 +274,6 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
 	struct kvm *kvm = gmem->kvm;
 	unsigned long index;
 
-	filemap_invalidate_lock(inode->i_mapping);
-
 	/*
 	 * Prevent concurrent attempts to *unbind* a memslot.  This is the last
 	 * reference to the file and thus no new bindings can be created, but
@@ -285,6 +283,8 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
 	 */
 	mutex_lock(&kvm->slots_lock);
 
+	filemap_invalidate_lock(inode->i_mapping);
+
 	xa_for_each(&gmem->bindings, index, slot)
 		rcu_assign_pointer(slot->gmem.file, NULL);
 
@@ -299,12 +299,12 @@ static int kvm_gmem_release(struct inode *inode, struct file *file)
 	kvm_gmem_issue_arch_invalidate(gmem->kvm, file_inode(file), 0, -1ul);
 	kvm_gmem_invalidate_end(gmem, 0, -1ul);
 
-	mutex_unlock(&kvm->slots_lock);
-
 	list_del(&gmem->entry);
 
 	filemap_invalidate_unlock(inode->i_mapping);
 
+	mutex_unlock(&kvm->slots_lock);
+
 	xa_destroy(&gmem->bindings);
 	kfree(gmem);
 
-- 
2.25.1



-- 
Isaku Yamahata <isaku.yamahata@gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
