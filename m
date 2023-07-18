Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A93EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 05:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U4HPd5CwIYiC6WKPDXsz39gsJOb1MVQI4n/A8ptN6fA=; b=Az7mOaBZBzprB7
	8Q1L5tO5tXoLChX8YKTphr9z/G6ADn7ymOk+jdNc67JqRqxaD8p56lDou8MPSfWQ+S2ft/8b4k5Hi
	Etq2gVXeAxXiF6ift/kXOvGqy2j0GeGhWc17J2LNuT9MlnVY47gBO8KiuAC+OmFEpha3th5IZU91T
	/9FSQEEJ9xwihymyDCaFY5SO8XNGlEjxgincl7rQrcbByWkSpgSX/UZBVmzHL7mHOhxpx0n7V1pQ7
	N+5KiofmjZEpErQGhFr+B0rZgzlcYksSFmAj5pS7694k4FzgHUQTZD52aW3Thb7fwKv4WZkybSQQb
	qVfyCfPPRWE4rP3L7fBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzdf-005FUQ-0P;
	Wed, 19 Jul 2023 05:22:15 +0000
Received: from casper.infradead.org ([90.155.50.34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzbs-005Dg5-2y
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:20:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/pt3Q2tpoxQxXn1tLyyE1UR18jbz9QzeXCmKj/ev2NM=; b=QVqVLOeXLEyAGp7QXy2BDcdUKm
	LXUHYT0IVNYQQUsfuyn/C71fXBGQq+c0jjRtCOamMCoJk9bv4y5iyKkWfXyThrqxsMeaegHgi/HRi
	REiXhpB3lUJT9Ibk5lF5ovEl+AkLq3QKlx1EwpZWAzxzud9ssNKn5tVHb8kQZ8RYXPVhwD+xmsG2v
	UuFkx7PiDGjmxg/EeXGKvLcq+xJPeYz0voXXexRM+iqJzFuQBlEzH4kNY853QofJ2s/MvGy+4jnTy
	nQPqCDKAIw7u0HMOSUnWYe3tJ6XX4sqUg+yQkDnSJbf9oG/CtTOqMW2GioNNsIRrb8V2KzStTqRcT
	qtM7UQ3g==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qLuS9-005QjY-Re
	for linux-riscv@lists.infradead.org; Tue, 18 Jul 2023 23:50:04 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1b8b30f781cso32251565ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 16:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689724137; x=1692316137;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=/pt3Q2tpoxQxXn1tLyyE1UR18jbz9QzeXCmKj/ev2NM=;
        b=vxUR1tuj/vcGsaOe3o3Dg3+dBjjNSQ1vNUqJnA915YLta3qnEHtgJJmhnuBEvMSvuO
         PeQ54yO76QkRq4Poh7gfw5EibjHULF6szcbTO++R7xTLcTVHQgaEtb3O2GkE8TOOgrPj
         j+skKU6AKAL/CHeOI2fWZhtH2+GBhR8GFXcSgy+S791M68OMvBR8fw1sghKrAfPeG39D
         aPhvXxFMYa/vphJO2xprgh5gp8hbsuB9tPxNTIVm7fk+E06HBzO4G4hjTZ+UFpjlD7u9
         AiVs2GVbO1nSDvgFw3EWZlgv0q++Q9CJ07oUOhmTcF8UoY6sdZ1aY/fD8Yp9QaPi1uiy
         5yig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689724137; x=1692316137;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/pt3Q2tpoxQxXn1tLyyE1UR18jbz9QzeXCmKj/ev2NM=;
        b=PasgVl1QO653GUe/BuOkRjY6v9KVp0wWO8uujC57rmAlzVWeMIcPzKit/w1PmpJTjd
         IasDU6xqN6heJ4CXLOhNq6bFmh+nArSWjhAzVAPoQhzHdhzB8opIIY/DDRFA0yBw4uAL
         T7gs3pODAjjwnT9PqMLazm5EsUvW4kqXUy9SnaArJ24zitL3VdDQQrHeJJN/3BaGv4JQ
         ZU6fArPejvVyBnEPWSUdRNaDXwaNjH7e1HmThD6SgjYdjjWlLWJWMOe0edjAv81kHz1L
         XFpMSVxJbBI5cN3cto8O8PclT6lG7C5rO1WFJUVOefRXeaEpwYp+krjV3XCHNY/jZx0S
         U/jQ==
X-Gm-Message-State: ABy/qLa5tAwMyDhdS98stbkXuMwU6tJAJqJ1sxTZ15LnIrY9LsBaOCT4
	N6/4D02pfSn/YMs62PNb/6UpyAwcIoU=
X-Google-Smtp-Source: APBJJlFIKaKNLayUXkm9YIdNhY8NWw+bGGk4UkSeGDFPqrXqT1vlGljtzz/Lr2RncRF8zUbyrReIDSYCDDk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:ce88:b0:1ab:18eb:17c8 with SMTP id
 f8-20020a170902ce8800b001ab18eb17c8mr7987plg.2.1689724136690; Tue, 18 Jul
 2023 16:48:56 -0700 (PDT)
Date: Tue, 18 Jul 2023 16:44:56 -0700
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230718234512.1690985-14-seanjc@google.com>
Subject: [RFC PATCH v11 13/29] KVM: Add transparent hugepage support for
 dedicated guest memory
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_005001_914726_2478A861 
X-CRM114-Status: GOOD (  13.30  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/uapi/linux/kvm.h |  2 ++
 virt/kvm/guest_mem.c     | 52 ++++++++++++++++++++++++++++++++++++----
 2 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 9b344fc98598..17b12ee8b70e 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -2290,6 +2290,8 @@ struct kvm_memory_attributes {
 
 #define KVM_CREATE_GUEST_MEMFD	_IOWR(KVMIO,  0xd4, struct kvm_create_guest_memfd)
 
+#define KVM_GUEST_MEMFD_ALLOW_HUGEPAGE		(1ULL << 0)
+
 struct kvm_create_guest_memfd {
 	__u64 size;
 	__u64 flags;
diff --git a/virt/kvm/guest_mem.c b/virt/kvm/guest_mem.c
index 1b705fd63fa8..384671a55b41 100644
--- a/virt/kvm/guest_mem.c
+++ b/virt/kvm/guest_mem.c
@@ -17,15 +17,48 @@ struct kvm_gmem {
 	struct list_head entry;
 };
 
-static struct folio *kvm_gmem_get_folio(struct file *file, pgoff_t index)
+static struct folio *kvm_gmem_get_huge_folio(struct inode *inode, pgoff_t index)
 {
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+	unsigned long huge_index = round_down(index, HPAGE_PMD_NR);
+	unsigned long flags = (unsigned long)inode->i_private;
+	struct address_space *mapping  = inode->i_mapping;
+	gfp_t gfp = mapping_gfp_mask(mapping);
 	struct folio *folio;
 
-	/* TODO: Support huge pages. */
-	folio = filemap_grab_folio(file->f_mapping, index);
+	if (!(flags & KVM_GUEST_MEMFD_ALLOW_HUGEPAGE))
+		return NULL;
+
+	if (filemap_range_has_page(mapping, huge_index << PAGE_SHIFT,
+				   (huge_index + HPAGE_PMD_NR - 1) << PAGE_SHIFT))
+		return NULL;
+
+	folio = filemap_alloc_folio(gfp, HPAGE_PMD_ORDER);
 	if (!folio)
 		return NULL;
 
+	if (filemap_add_folio(mapping, folio, huge_index, gfp)) {
+		folio_put(folio);
+		return NULL;
+	}
+
+	return folio;
+#else
+	return NULL;
+#endif
+}
+
+static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
+{
+	struct folio *folio;
+
+	folio = kvm_gmem_get_huge_folio(inode, index);
+	if (!folio) {
+		folio = filemap_grab_folio(inode->i_mapping, index);
+		if (!folio)
+			return NULL;
+	}
+
 	/*
 	 * Use the up-to-date flag to track whether or not the memory has been
 	 * zeroed before being handed off to the guest.  There is no backing
@@ -332,7 +365,8 @@ static const struct inode_operations kvm_gmem_iops = {
 	.setattr	= kvm_gmem_setattr,
 };
 
-static int __kvm_gmem_create(struct kvm *kvm, loff_t size, struct vfsmount *mnt)
+static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags,
+			     struct vfsmount *mnt)
 {
 	const char *anon_name = "[kvm-gmem]";
 	const struct qstr qname = QSTR_INIT(anon_name, strlen(anon_name));
@@ -355,6 +389,7 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, struct vfsmount *mnt)
 	inode->i_mode |= S_IFREG;
 	inode->i_size = size;
 	mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
+	mapping_set_large_folios(inode->i_mapping);
 	mapping_set_unevictable(inode->i_mapping);
 	mapping_set_unmovable(inode->i_mapping);
 
@@ -404,6 +439,12 @@ static bool kvm_gmem_is_valid_size(loff_t size, u64 flags)
 	if (size < 0 || !PAGE_ALIGNED(size))
 		return false;
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+	if ((flags & KVM_GUEST_MEMFD_ALLOW_HUGEPAGE) &&
+	    !IS_ALIGNED(size, HPAGE_PMD_SIZE))
+		return false;
+#endif
+
 	return true;
 }
 
@@ -413,6 +454,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
 	u64 flags = args->flags;
 	u64 valid_flags = 0;
 
+	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
+		valid_flags |= KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
+
 	if (flags & ~valid_flags)
 		return -EINVAL;
 
-- 
2.41.0.255.g8b1d071c50-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
