Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 517F3CAC593
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 09:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:From:Reply-To:To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=niWma8nnuaJKOrCozZMy4bLuDKi2YXt2liyPUTTyb4A=; b=u8zAIHfl3+eGmJ
	wuKo2CbuUL2LZVNcXzEluIU576HaLLpHuoupVgm8w9XCGXq0i+DGYEZC/5Iq9mJ/8r3UiWtkplHpD
	BnI7o8ImzkwOyty0gmTaeIgf04KhXtjNNjjGDW7Lz0+XS0lmpwmhaKtVFw3bS9my+GAAUaBlolXZJ
	jQvEEZvnBoOdGZ0pmpmCI70dapzYIB/fZ+vLvsNMQ7xqWg9wiYiMTlnhsieBfOn4zYp9XxcYK/zSo
	Tls0ZrZ+ZeMiRL6xQaxRVUXu7wIyR5aLFjB8yHcuotpG1tW+gqIDch3zqnBKNhs2rW/hdpwDoYyfR
	y8gI1P3GetxukqV+aumw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzum-00000008Byy-1gPB;
	Fri, 12 Sep 2025 09:17:56 +0000
Received: from fra-out-002.esa.eu-central-1.outbound.mail-perimeter.amazon.com ([3.65.3.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwzui-00000008BvC-3TJh;
	Fri, 12 Sep 2025 09:17:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
  s=amazoncorp2; t=1757668672; x=1789204672;
  h=from:cc:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=L6MGuHLofg/UQ6j3od6DFBlP6h40d9oLh3k2QL5DRKE=;
  b=FdaJr20E21+uNAO0S/jm1rxCZ1ZWsMHDVLMhU79Knu+Y289xlkUEw0v3
   AlJluZbKQ5eMOACidkrYUO7vszY1WAHOwXttJ9MttCpck5nB7v+bangBy
   NqLCrMcumaWlL5Jgbf9ezgLlY7dfzHdd1CBsqRYlxCuZ4WSE4aHIiqI7o
   +J2BwOaVz/JZNBgS8zYy9oSYbd35bfmmWgZpeFuyIRH+rqNwGrI1xJUl2
   sZwUGpT5jFi/20RWcLsIkNB1swO4zIw1hGsj6sLY/AolqxZhHxJHmtYJC
   KVa6tLl7Bo3agp+ITNTyvZAljwUEheX3ESTxFJFiUN+4Ed08i5UjIh0DH
   g==;
X-CSE-ConnectionGUID: cI7j6VGMR7Gv8uvIQ36e9A==
X-CSE-MsgGUID: MCGMwWEZT+SLHHcXUqXwxg==
X-IronPort-AV: E=Sophos;i="6.18,259,1751241600"; 
   d="scan'208";a="2009525"
Received: from ip-10-6-6-97.eu-central-1.compute.internal (HELO smtpout.naws.eu-central-1.prod.farcaster.email.amazon.dev) ([10.6.6.97])
  by internal-fra-out-002.esa.eu-central-1.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2025 09:17:33 +0000
Received: from EX19MTAEUC002.ant.amazon.com [54.240.197.228:12545]
 by smtpin.naws.eu-central-1.prod.farcaster.email.amazon.dev [10.0.20.211:2525] with esmtp (Farcaster)
 id 01a2f483-7280-4d83-8886-4614fd54f9f9; Fri, 12 Sep 2025 09:17:33 +0000 (UTC)
X-Farcaster-Flow-ID: 01a2f483-7280-4d83-8886-4614fd54f9f9
Received: from EX19D022EUA004.ant.amazon.com (10.252.50.82) by
 EX19MTAEUC002.ant.amazon.com (10.252.51.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 12 Sep 2025 09:17:31 +0000
Received: from EX19D015EUB004.ant.amazon.com (10.252.51.13) by
 EX19D022EUA004.ant.amazon.com (10.252.50.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.20;
 Fri, 12 Sep 2025 09:17:31 +0000
Received: from EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a]) by
 EX19D015EUB004.ant.amazon.com ([fe80::2dc9:7aa9:9cd3:fc8a%3]) with mapi id
 15.02.2562.020; Fri, 12 Sep 2025 09:17:31 +0000
From: "Roy, Patrick" <roypat@amazon.co.uk>
Subject: [PATCH v6 01/11] filemap: Pass address_space mapping to
 ->free_folio()
Thread-Topic: [PATCH v6 01/11] filemap: Pass address_space mapping to
 ->free_folio()
Thread-Index: AQHcI8YRV4VfKNensEyd8J0XmS1q6g==
Date: Fri, 12 Sep 2025 09:17:31 +0000
Message-ID: <20250912091708.17502-2-roypat@amazon.co.uk>
References: <20250912091708.17502-1-roypat@amazon.co.uk>
In-Reply-To: <20250912091708.17502-1-roypat@amazon.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.19.88.180]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_021753_317250_CCD0A1AD 
X-CRM114-Status: GOOD (  12.41  )
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
Cc: "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "yonghong.song@linux.dev" <yonghong.song@linux.dev>, "agordeev@linux.ibm.com" <agordeev@linux.ibm.com>, "hubcap@omnibond.com" <hubcap@omnibond.com>, "lorenzo.stoakes@oracle.com" <lorenzo.stoakes@oracle.com>, "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "derekmn@amazon.co.uk" <derekmn@amazon.co.uk>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>, "devel@lists.orangefs.org" <devel@lists.orangefs.org>, "jhubbard@nvidia.com" <jhubbard@nvidia.com>, "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>, "luto@kernel.org" <luto@kernel.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "surenb@google.com" <surenb@google.com>, "brauner@kernel.org" <brauner@kernel.org>, "Cali, Marco" <xmarcalx@amazon.co.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "svens@linux.ibm.com" <svens@linux.ibm.com>, "jolsa@kernel.org" <jolsa@kernel.org>, "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "trondmy@kernel.org" <trondmy@kernel.org>, "martin@omnibond.com" <martin@omnibond.com>, "david@redhat.com" <david@redhat.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "joey.gouly@arm.com" <joey.gouly@arm.com>, "song@kernel.org" <song@kernel.org>, "kernel@xen0n.name" <kernel@xen0n.name>, "shuah@kernel.org" <shuah@kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "alex@ghiti.fr" <alex@ghiti.fr>, "john.fastabend@gmail.com" <john.fastabend@gmail.com>, "andrii@kernel.org" <andrii@kernel.org>, "Roy,
 Patrick" <roypat@amazon.co.uk>, "gor@linux.ibm.com" <gor@linux.ibm.com>, "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>, "Thomson, Jack" <jackabt@amazon.co.uk>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>, "pfalcato@suse.de" <pfalcato@suse.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "haoluo@google.com" <haoluo@google.com>, "seanjc@google.com" <seanjc@google.com>, "anna@kernel.org" <anna@kernel.org>, "ast@kernel.org" <ast@kernel.org>, "peterx@redhat.com" <peterx@redhat.com>, "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>, "will@kernel.org" <will@kernel.org>, "daniel@iogearbox.net" <daniel@iogearbox.net>, "corbet@lwn.net" <corbet@lwn.net>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "willy@infradead.org" <willy@infradead.org>, "sdf@fomichev.me" <sdf@fomichev.me>, "yuzenghui@huawei.com" <yuzenghui@huawei.com>, "gerald.schaefer@linux.ibm.com" <gerald.schaefer@linux.ibm.com>, "bp@alien8.de" <bp@alien8.de>, "shakeel.butt@linux.dev" <shakeel.butt@linux.dev>, "linux-nfs@vger.kernel.org" <linux-nfs@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "rppt@kernel.org" <rppt@kernel.org>, "mhocko@suse.com" <mhocko@suse.com>, "jack@suse.cz" <jack@suse.cz>, "kvm@vger.kernel.org" <kvm@vger.kernel.org>, "peterz@infradead.org" <peterz@infradead.org>, "kpsingh@kernel.org" <kpsingh@kernel.org>, "zhengqi.arch@bytedance.com" <zhengqi.arch@bytedance.com>, "yuanchu@google.com" <yuanchu@google.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "hpa@zytor.com" <hpa@zytor.com>, "Kalyazin, Nikita" <kalyazin@amazon.co.uk>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "maz@kernel.org" <maz@kernel.org>, "x86@kernel.org" <x86@kernel.org>, "jgg@ziepe.ca" <jgg@ziepe.ca>, "mingo@redhat.com" <mingo@redhat.com>, "axelrasmussen@google.com" <axelrasmussen@google.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>, "jannh@google.com" <jannh@google.com>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "Liam.Howlett@oracle.com" <Liam.Howlett@oracle.com>, "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "vbabka@suse.cz" <vbabka@suse.cz>, "weixugc@google.com" <weixugc@google.com>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>, "eddyz87@gmail.com" <eddyz87@gmail.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "hannes@cmpxchg.org" <hannes@cmpxchg.org>, "pbonzini@redhat.com" <pbonzini@redhat.com>, "martin.lau@linux.dev" <martin.lau@linux.dev>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Elliot Berman <quic_eberman@quicinc.com>

When guest_memfd removes memory from the host kernel's direct map,
direct map entries must be restored before the memory is freed again. To
do so, ->free_folio() needs to know whether a gmem folio was direct map
removed in the first place though. While possible to keep track of this
information on each individual folio (e.g. via page flags), direct map
removal is an all-or-nothing property of the entire guest_memfd, so it
is less error prone to just check the flag stored in the gmem inode's
private data.  However, by the time ->free_folio() is called,
folio->mapping might be cleared. To still allow access to the address
space from which the folio was just removed, pass it in as an additional
argument to ->free_folio, as the mapping is well-known to all callers.

Link: https://lore.kernel.org/all/15f665b4-2d33-41ca-ac50-fafe24ade32f@redhat.com/
Suggested-by: David Hildenbrand <david@redhat.com>
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
[patrick: rewrite shortlog for new usecase]
Signed-off-by: Patrick Roy <roypat@amazon.co.uk>
---
 Documentation/filesystems/locking.rst |  2 +-
 fs/nfs/dir.c                          | 11 ++++++-----
 fs/orangefs/inode.c                   |  3 ++-
 include/linux/fs.h                    |  2 +-
 mm/filemap.c                          |  9 +++++----
 mm/secretmem.c                        |  3 ++-
 mm/vmscan.c                           |  4 ++--
 virt/kvm/guest_memfd.c                |  3 ++-
 8 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/Documentation/filesystems/locking.rst b/Documentation/filesystems/locking.rst
index aa287ccdac2f..74c97287ec40 100644
--- a/Documentation/filesystems/locking.rst
+++ b/Documentation/filesystems/locking.rst
@@ -262,7 +262,7 @@ prototypes::
 	sector_t (*bmap)(struct address_space *, sector_t);
 	void (*invalidate_folio) (struct folio *, size_t start, size_t len);
 	bool (*release_folio)(struct folio *, gfp_t);
-	void (*free_folio)(struct folio *);
+	void (*free_folio)(struct address_space *, struct folio *);
 	int (*direct_IO)(struct kiocb *, struct iov_iter *iter);
 	int (*migrate_folio)(struct address_space *, struct folio *dst,
 			struct folio *src, enum migrate_mode);
diff --git a/fs/nfs/dir.c b/fs/nfs/dir.c
index d81217923936..644bd54e052c 100644
--- a/fs/nfs/dir.c
+++ b/fs/nfs/dir.c
@@ -55,7 +55,7 @@ static int nfs_closedir(struct inode *, struct file *);
 static int nfs_readdir(struct file *, struct dir_context *);
 static int nfs_fsync_dir(struct file *, loff_t, loff_t, int);
 static loff_t nfs_llseek_dir(struct file *, loff_t, int);
-static void nfs_readdir_clear_array(struct folio *);
+static void nfs_readdir_clear_array(struct address_space *, struct folio *);
 static int nfs_do_create(struct inode *dir, struct dentry *dentry,
 			 umode_t mode, int open_flags);
 
@@ -218,7 +218,8 @@ static void nfs_readdir_folio_init_array(struct folio *folio, u64 last_cookie,
 /*
  * we are freeing strings created by nfs_add_to_readdir_array()
  */
-static void nfs_readdir_clear_array(struct folio *folio)
+static void nfs_readdir_clear_array(struct address_space *mapping,
+				    struct folio *folio)
 {
 	struct nfs_cache_array *array;
 	unsigned int i;
@@ -233,7 +234,7 @@ static void nfs_readdir_clear_array(struct folio *folio)
 static void nfs_readdir_folio_reinit_array(struct folio *folio, u64 last_cookie,
 					   u64 change_attr)
 {
-	nfs_readdir_clear_array(folio);
+	nfs_readdir_clear_array(folio->mapping, folio);
 	nfs_readdir_folio_init_array(folio, last_cookie, change_attr);
 }
 
@@ -249,7 +250,7 @@ nfs_readdir_folio_array_alloc(u64 last_cookie, gfp_t gfp_flags)
 static void nfs_readdir_folio_array_free(struct folio *folio)
 {
 	if (folio) {
-		nfs_readdir_clear_array(folio);
+		nfs_readdir_clear_array(folio->mapping, folio);
 		folio_put(folio);
 	}
 }
@@ -391,7 +392,7 @@ static void nfs_readdir_folio_init_and_validate(struct folio *folio, u64 cookie,
 	if (folio_test_uptodate(folio)) {
 		if (nfs_readdir_folio_validate(folio, cookie, change_attr))
 			return;
-		nfs_readdir_clear_array(folio);
+		nfs_readdir_clear_array(folio->mapping, folio);
 	}
 	nfs_readdir_folio_init_array(folio, cookie, change_attr);
 	folio_mark_uptodate(folio);
diff --git a/fs/orangefs/inode.c b/fs/orangefs/inode.c
index a01400cd41fd..37227ba71593 100644
--- a/fs/orangefs/inode.c
+++ b/fs/orangefs/inode.c
@@ -452,7 +452,8 @@ static bool orangefs_release_folio(struct folio *folio, gfp_t foo)
 	return !folio_test_private(folio);
 }
 
-static void orangefs_free_folio(struct folio *folio)
+static void orangefs_free_folio(struct address_space *mapping,
+				struct folio *folio)
 {
 	kfree(folio_detach_private(folio));
 }
diff --git a/include/linux/fs.h b/include/linux/fs.h
index d7ab4f96d705..afb0748ffda6 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -457,7 +457,7 @@ struct address_space_operations {
 	sector_t (*bmap)(struct address_space *, sector_t);
 	void (*invalidate_folio) (struct folio *, size_t offset, size_t len);
 	bool (*release_folio)(struct folio *, gfp_t);
-	void (*free_folio)(struct folio *folio);
+	void (*free_folio)(struct address_space *, struct folio *folio);
 	ssize_t (*direct_IO)(struct kiocb *, struct iov_iter *iter);
 	/*
 	 * migrate the contents of a folio to the specified target. If
diff --git a/mm/filemap.c b/mm/filemap.c
index 751838ef05e5..3dd8ad922d80 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -226,11 +226,11 @@ void __filemap_remove_folio(struct folio *folio, void *shadow)
 
 void filemap_free_folio(struct address_space *mapping, struct folio *folio)
 {
-	void (*free_folio)(struct folio *);
+	void (*free_folio)(struct address_space *, struct folio *);
 
 	free_folio = mapping->a_ops->free_folio;
 	if (free_folio)
-		free_folio(folio);
+		free_folio(mapping, folio);
 
 	folio_put_refs(folio, folio_nr_pages(folio));
 }
@@ -820,7 +820,8 @@ EXPORT_SYMBOL(file_write_and_wait_range);
 void replace_page_cache_folio(struct folio *old, struct folio *new)
 {
 	struct address_space *mapping = old->mapping;
-	void (*free_folio)(struct folio *) = mapping->a_ops->free_folio;
+	void (*free_folio)(struct address_space *, struct folio *) =
+		mapping->a_ops->free_folio;
 	pgoff_t offset = old->index;
 	XA_STATE(xas, &mapping->i_pages, offset);
 
@@ -849,7 +850,7 @@ void replace_page_cache_folio(struct folio *old, struct folio *new)
 		__lruvec_stat_add_folio(new, NR_SHMEM);
 	xas_unlock_irq(&xas);
 	if (free_folio)
-		free_folio(old);
+		free_folio(mapping, old);
 	folio_put(old);
 }
 EXPORT_SYMBOL_GPL(replace_page_cache_folio);
diff --git a/mm/secretmem.c b/mm/secretmem.c
index 60137305bc20..422dcaa32506 100644
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@ -150,7 +150,8 @@ static int secretmem_migrate_folio(struct address_space *mapping,
 	return -EBUSY;
 }
 
-static void secretmem_free_folio(struct folio *folio)
+static void secretmem_free_folio(struct address_space *mapping,
+				 struct folio *folio)
 {
 	set_direct_map_default_noflush(folio_page(folio, 0));
 	folio_zero_segment(folio, 0, folio_size(folio));
diff --git a/mm/vmscan.c b/mm/vmscan.c
index a48aec8bfd92..559bd6ac965c 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -788,7 +788,7 @@ static int __remove_mapping(struct address_space *mapping, struct folio *folio,
 		xa_unlock_irq(&mapping->i_pages);
 		put_swap_folio(folio, swap);
 	} else {
-		void (*free_folio)(struct folio *);
+		void (*free_folio)(struct address_space *, struct folio *);
 
 		free_folio = mapping->a_ops->free_folio;
 		/*
@@ -817,7 +817,7 @@ static int __remove_mapping(struct address_space *mapping, struct folio *folio,
 		spin_unlock(&mapping->host->i_lock);
 
 		if (free_folio)
-			free_folio(folio);
+			free_folio(mapping, folio);
 	}
 
 	return 1;
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 08a6bc7d25b6..9ec4c45e3cf2 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -430,7 +430,8 @@ static int kvm_gmem_error_folio(struct address_space *mapping, struct folio *fol
 }
 
 #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_INVALIDATE
-static void kvm_gmem_free_folio(struct folio *folio)
+static void kvm_gmem_free_folio(struct address_space *mapping,
+				struct folio *folio)
 {
 	struct page *page = folio_page(folio, 0);
 	kvm_pfn_t pfn = page_to_pfn(page);
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
