Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CE95EE0212
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 01:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MvJKUASMsB0jHsRJItPSdUyDYR+W2JbyHIQGvW5A/eY=; b=TqOPPHX5lSxw8n
	hEs30FPnpnPhvJMfzJFTOB6mLzuM30JSY8oO4R8iKo+Xc7UQL3zjvVG9+DQfUHQThXl/mYaWV+SlZ
	/zsV212wZ131XlFl0Cyr+IOowVBF3sUZgW7O3RZesPxvWVMOqzaZXnYsmHruY+ad1VvJQwu3pHZhs
	0zZpoX87IktMqZBttrGE5KgBm6O4OtwVTUKCcyH0tTXB5xz2ARBB6BSh3wzWlnJeY73OhWj6p0TOd
	x1D76e/0u4nncnGsvhAMEJt4zI6PgzHsi6/ghHd6wB1O6asQBRhvGaO7JA+g7lUEfmeAjHQCsohAS
	ByeaVAOdcnIRQkoCGEAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbcK-00752w-2L;
	Thu, 14 Sep 2023 01:58:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbaX-0073IE-1z
	for linux-riscv@bombadil.infradead.org;
	Thu, 14 Sep 2023 01:56:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tmZ4Pf+Lkz5wRFy1K0dmYcmTbZlsWWC8lS02Q/mSk0M=; b=On4ma2zlYszYuLZC8yZGPYVaha
	UPGpaqUn6EsMxddzyNOiR+Sz57bqaLOpsjijuWYkJsORjJvuSNIYWHRbRwTmTZpSejtarIL8lKzoa
	WoVWeWu7Q3POTiYqE72izmWy9iOBx3oLnzVsbhhlNAasKBxLbplTxwkfYIEH8U7vrpWMIgTIqX5VA
	pHVU/51tIjkTL+PA3QzRWrKUSkWM4HsFrOeBJZYUHoGw2wXD0SK71SUFHarjkmqSc72jel7KPwsHj
	AYy/iDAzXAXprPavZ9+9qlxBH8KvwcYEgkyjlNmRfRPI5z6jinqycoAJcKfoQw4kFWfx+saH8SDZF
	ggHi19hQ==;
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbaR-007TYR-0y
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 01:56:12 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d814a1f7378so2790826276.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 18:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694656566; x=1695261366; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=tmZ4Pf+Lkz5wRFy1K0dmYcmTbZlsWWC8lS02Q/mSk0M=;
        b=mdriPzUwx2noU8IDTJ3sMfvHQoiF+TfLeSaAdkL0ZRHiMUq4k0GxvYS2vNaTR1Rora
         agOIu4k1R8E5aky5cnuVTGorBro2VUSU4n+VVWidzxwwBkVqjHD7BxSq1uiB0MYUqqiz
         9JmmR7uv/QkUBUX725pCpFCApoSIUZnBLqJg1O10WlcvJVsiN3d+QE337ZCGtrAva2t3
         W+0lFSp59tMzi3xu7eaw1fVLNiLRWfdZHtFaedDsp3LXOljBEtQbZmttD3w0MLMQ3mO5
         Ow8APvE3ncfbFhWzCqD+clNp8RGcuwv6XUiTSYJIwdsE5DQ7oshbfkULuiRtc1odBz94
         tsGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694656566; x=1695261366;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tmZ4Pf+Lkz5wRFy1K0dmYcmTbZlsWWC8lS02Q/mSk0M=;
        b=ZFM9+Iz5WoXOvMTTJFFatsSqwmtThOoCIVU5eiQa44rRkTrZHEODBNYELKJpEhX6lU
         QVkC/vnJ2pRBvND5NJB5PNzWS5Kd0N0kJUqPyolLnF3cYEvbfCEiDr46fQJlerlTyTI9
         B6kuL5Ci5QR5ptPlwH6fu5Mehi9i6pMccvorzwYMN9pTPF2aTaMRqjSn/mXDyS5gIeYt
         paNpAipkGJFCCQoxDZ6t0TYydTLL59VIkk67N23b9cES95csV+A5hy/pG9JbORbRVDKJ
         j9P97qKMKDFhrluU5HfcDli1Rt0QrLBFgKnLkLfYkh+4WKbo7oXOlhPQzN0LWgPhae/C
         I5bw==
X-Gm-Message-State: AOJu0YxRwiieOBku5KI3FaK6bRKSMBu88nu0eNEnQt0Pr3GewwuFCj4N
	ha5GdeFGS18YYuZ21RP2I0ESb7T01dE=
X-Google-Smtp-Source: AGHT+IEewm62VrPkwfcYWKCbnDgTMcslgQzN36+Ag8qFabvQ71jteqZnAdWKs/X98zA5hLrpiwS+nbPNXc8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:ab47:0:b0:d7e:78db:d264 with SMTP id
 u65-20020a25ab47000000b00d7e78dbd264mr13061ybi.5.1694656566137; Wed, 13 Sep
 2023 18:56:06 -0700 (PDT)
Date: Wed, 13 Sep 2023 18:55:13 -0700
In-Reply-To: <20230914015531.1419405-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230914015531.1419405-16-seanjc@google.com>
Subject: [RFC PATCH v12 15/33] KVM: Add transparent hugepage support for
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
	Anish Moorthy <amoorthy@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_025608_938846_A77AE69D 
X-CRM114-Status: GOOD (  17.34  )
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

TODO: writeme

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/uapi/linux/kvm.h |  2 ++
 virt/kvm/guest_mem.c     | 54 ++++++++++++++++++++++++++++++++++++----
 2 files changed, 51 insertions(+), 5 deletions(-)

diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index b6f90a273e2e..2df18796fd8e 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -2314,6 +2314,8 @@ struct kvm_memory_attributes {
 
 #define KVM_CREATE_GUEST_MEMFD	_IOWR(KVMIO,  0xd4, struct kvm_create_guest_memfd)
 
+#define KVM_GUEST_MEMFD_ALLOW_HUGEPAGE		(1ULL << 0)
+
 struct kvm_create_guest_memfd {
 	__u64 size;
 	__u64 flags;
diff --git a/virt/kvm/guest_mem.c b/virt/kvm/guest_mem.c
index 0dd3f836cf9c..a819367434e9 100644
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
-	if (IS_ERR_OR_NULL(folio))
+	if (!(flags & KVM_GUEST_MEMFD_ALLOW_HUGEPAGE))
 		return NULL;
 
+	if (filemap_range_has_page(mapping, huge_index << PAGE_SHIFT,
+				   (huge_index + HPAGE_PMD_NR - 1) << PAGE_SHIFT))
+		return NULL;
+
+	folio = filemap_alloc_folio(gfp, HPAGE_PMD_ORDER);
+	if (!folio)
+		return NULL;
+
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
+		if (IS_ERR_OR_NULL(folio))
+			return NULL;
+	}
+
 	/*
 	 * Use the up-to-date flag to track whether or not the memory has been
 	 * zeroed before being handed off to the guest.  There is no backing
@@ -323,7 +356,8 @@ static const struct inode_operations kvm_gmem_iops = {
 	.setattr	= kvm_gmem_setattr,
 };
 
-static int __kvm_gmem_create(struct kvm *kvm, loff_t size, struct vfsmount *mnt)
+static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags,
+			     struct vfsmount *mnt)
 {
 	const char *anon_name = "[kvm-gmem]";
 	const struct qstr qname = QSTR_INIT(anon_name, strlen(anon_name));
@@ -346,6 +380,7 @@ static int __kvm_gmem_create(struct kvm *kvm, loff_t size, struct vfsmount *mnt)
 	inode->i_mode |= S_IFREG;
 	inode->i_size = size;
 	mapping_set_gfp_mask(inode->i_mapping, GFP_HIGHUSER);
+	mapping_set_large_folios(inode->i_mapping);
 	mapping_set_unmovable(inode->i_mapping);
 	/* Unmovable mappings are supposed to be marked unevictable as well. */
 	WARN_ON_ONCE(!mapping_unevictable(inode->i_mapping));
@@ -396,6 +431,12 @@ static bool kvm_gmem_is_valid_size(loff_t size, u64 flags)
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
 
@@ -405,6 +446,9 @@ int kvm_gmem_create(struct kvm *kvm, struct kvm_create_guest_memfd *args)
 	u64 flags = args->flags;
 	u64 valid_flags = 0;
 
+	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
+		valid_flags |= KVM_GUEST_MEMFD_ALLOW_HUGEPAGE;
+
 	if (flags & ~valid_flags)
 		return -EINVAL;
 
-- 
2.42.0.283.g2d96d420d3-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
