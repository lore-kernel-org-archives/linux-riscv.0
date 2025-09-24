Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560F0CAC5AE
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 15:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E7Ypr+hyBG/sVFxlwPghSWSe2h4GrseM8uhINZz8Hnw=; b=YLFib2/BJ6wbBj
	D0AMBNBLlGz32DG8E7Klk1vI87TGHG4SWmfrvKogOuJvFNsDsDcd8Pir/beO6ispY0l9LvKs4RldS
	LUa7XNFVnGLWql14FLXvs01d1svIBx1x864GQ5lTi0lgz5FVy2ARH1o3Lvbh8IRthL4N3ZL+ONM73
	95stvqqJKEXVz45urFfuCY6h+aprRPzN5nxSQ2HqWXZcMx5qVxytEdzsi/cnSlrrZhwLDFrq2bK9Z
	IzDXW/0CbhCzGJeyi4p4wSjUhFFQsL+e+p5C0/T0j+U56l0JitEuunOxXEWaFd7OGaZs2DyfwlpzU
	hNe2Vt4WMQ7QH+49JYrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RI8-00000001Ajp-2F67;
	Wed, 24 Sep 2025 15:20:24 +0000
Received: from postout2.mail.lrz.de ([129.187.255.138])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1RI4-00000001Afm-3b8E;
	Wed, 24 Sep 2025 15:20:22 +0000
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4cX0gB4hkgzyTD;
	Wed, 24 Sep 2025 17:11:34 +0200 (CEST)
Authentication-Results: postout.lrz.de (amavis); dkim=pass (2048-bit key)
 reason="pass (just generated, assumed good)" header.d=lmu.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lmu.de; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=lm-postout21; i=@campus.lmu.de; t=
	1758726694; bh=Wp7TACVDU5DtOz71qp4hjyzNeEjUGnycsxHnG+BQylo=; b=E
	RCmo7GN3cJorQyZx7veOPX1uJX526B979gcoqD9YQPNg2IlhNVxWPFsMFg+QS/q3
	L/wVNxo8mJlMHtkp/bEvKP7Hn+Gec2q7CNLyZt0EpSMka0FGzp5jCLM+/4Q4Yf9m
	bVnNe2Tm7A8+i74QMY7Y1jxU7K7i3ZBWXNk3nMdvTZsDVJlux0h/VG4Yw7pbmUSO
	RpLfSu4b6GZEIpe3sZKqyNWAaDHGBchXBCWQzjhHNdflPiUJAQ9O1DmlqkXQb9EW
	Uhe+iIn9Bv6pA0Z2aDaAYUqxTzRjd0IKO7k1GlUoiaatpmzPZUMKJctUANGLq63W
	fc7ujWT6qB0l70vnk9IVA==
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
Received: from postout2.mail.lrz.de ([127.0.0.1])
 by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavis, port 20024)
 with LMTP id bdh52MywZE5f; Wed, 24 Sep 2025 17:11:34 +0200 (CEST)
Received: from spacestation.cable.virginm.net (oxfd-27-b2-v4wan-164230-cust474.vm42.cable.virginm.net [86.22.133.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4cX0g40m58zyXY;
	Wed, 24 Sep 2025 17:11:28 +0200 (CEST)
From: Patrick Roy <patrick.roy@campus.lmu.de>
To: 
Cc: Patrick Roy <roypat@amazon.co.uk>,
	pbonzini@redhat.com,
	corbet@lwn.net,
	maz@kernel.org,
	oliver.upton@linux.dev,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	luto@kernel.org,
	peterz@infradead.org,
	willy@infradead.org,
	akpm@linux-foundation.org,
	david@redhat.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	song@kernel.org,
	jolsa@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	peterx@redhat.com,
	jannh@google.com,
	pfalcato@suse.de,
	shuah@kernel.org,
	seanjc@google.com,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	xmarcalx@amazon.co.uk,
	kalyazin@amazon.co.uk,
	jackabt@amazon.co.uk,
	derekmn@amazon.co.uk,
	tabba@google.com,
	ackerleytng@google.com,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org
Subject: [PATCH v7 01/12] arch: export set_direct_map_valid_noflush to KVM module
Date: Wed, 24 Sep 2025 16:10:41 +0100
Message-ID: <20250924151101.2225820-2-patrick.roy@campus.lmu.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250924151101.2225820-1-patrick.roy@campus.lmu.de>
References: <20250924151101.2225820-1-patrick.roy@campus.lmu.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_082021_045376_94047D55 
X-CRM114-Status: GOOD (  13.39  )
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

From: Patrick Roy <roypat@amazon.co.uk>

Use the new per-module export functionality to allow KVM (and only KVM)
access to set_direct_map_valid_noflush(). This allows guest_memfd to
remove its memory from the direct map, even if KVM is built as a module.

Direct map removal gives guest_memfd the same protection that
memfd_secret enjoys, such as hardening against Spectre-like attacks
through in-kernel gadgets.

Cc: linux-arm-kernel@lists.infradead.org
Cc: loongarch@lists.linux.dev
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Reviewed-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Patrick Roy <roypat@amazon.co.uk>
---
 arch/arm64/mm/pageattr.c     | 1 +
 arch/loongarch/mm/pageattr.c | 1 +
 arch/riscv/mm/pageattr.c     | 1 +
 arch/s390/mm/pageattr.c      | 1 +
 arch/x86/mm/pat/set_memory.c | 1 +
 5 files changed, 5 insertions(+)

diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 04d4a8f676db..4f3cddfab9b0 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -291,6 +291,7 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 
 	return set_memory_valid(addr, nr, valid);
 }
+EXPORT_SYMBOL_FOR_MODULES(set_direct_map_valid_noflush, "kvm");
 
 #ifdef CONFIG_DEBUG_PAGEALLOC
 /*
diff --git a/arch/loongarch/mm/pageattr.c b/arch/loongarch/mm/pageattr.c
index f5e910b68229..458f5ae6a89b 100644
--- a/arch/loongarch/mm/pageattr.c
+++ b/arch/loongarch/mm/pageattr.c
@@ -236,3 +236,4 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 
 	return __set_memory(addr, 1, set, clear);
 }
+EXPORT_SYMBOL_FOR_MODULES(set_direct_map_valid_noflush, "kvm");
diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 3f76db3d2769..6db31040cd66 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -400,6 +400,7 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 
 	return __set_memory((unsigned long)page_address(page), nr, set, clear);
 }
+EXPORT_SYMBOL_FOR_MODULES(set_direct_map_valid_noflush, "kvm");
 
 #ifdef CONFIG_DEBUG_PAGEALLOC
 static int debug_pagealloc_set_page(pte_t *pte, unsigned long addr, void *data)
diff --git a/arch/s390/mm/pageattr.c b/arch/s390/mm/pageattr.c
index 348e759840e7..8ffd9ef09bc6 100644
--- a/arch/s390/mm/pageattr.c
+++ b/arch/s390/mm/pageattr.c
@@ -413,6 +413,7 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 
 	return __set_memory((unsigned long)page_to_virt(page), nr, flags);
 }
+EXPORT_SYMBOL_FOR_MODULES(set_direct_map_valid_noflush, "kvm");
 
 bool kernel_page_present(struct page *page)
 {
diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
index 8834c76f91c9..87e9c7d2dcdc 100644
--- a/arch/x86/mm/pat/set_memory.c
+++ b/arch/x86/mm/pat/set_memory.c
@@ -2661,6 +2661,7 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
 
 	return __set_pages_np(page, nr);
 }
+EXPORT_SYMBOL_FOR_MODULES(set_direct_map_valid_noflush, "kvm");
 
 #ifdef CONFIG_DEBUG_PAGEALLOC
 void __kernel_map_pages(struct page *page, int numpages, int enable)
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
