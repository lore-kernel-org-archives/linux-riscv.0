Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27247C25B6F
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 19:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ZYfFZLyh1BgUq5Ki/YGB3ZLHn18NPg45vte2WNEP+c=; b=KPBGb80mWp5A0j
	VlGFx9YKlhKUIfcy1CYEibpPbwifQdVTD5JYkAwtplrT0B/fMJsrR9YnKQhO96npRw01HUM1/0o4/
	ZEw2vXn7WcRV+M3ZJghDJ4pXhTxKh6LJVnRzOyOHhTZ5xtn+bFvPgKnnJ5Nv7t7ubCV7jeE3OABrc
	girQMAN32KCPR+zLT2VEf7m4mQo20iatdOyDTvVwCR5v1PLSlsNy0R+nr6MakiQgH5rGFtaJsS9F9
	e549a6lMbmxH5VXemlZJAK0zwPS4Mx2glL5aVCB/ULPvl52UiAF2WXOXC14fhkx+ouIXfe4EodYXs
	P7Srm/pSFhl6JOHinefg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwSXo-00H5KH-0A;
	Fri, 27 Oct 2023 19:30:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRTk-00GwsY-1e
	for linux-riscv@bombadil.infradead.org;
	Fri, 27 Oct 2023 18:22:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QjG+iTAl+MysAoCDX0shLrWGCG7e9aCGlo9+qs2tVnE=; b=KInSf+oATlBEOpZpQQFxabVY2y
	XpZZPZKKT0/Rtyh1pX91QYE6stCV0e6tBrHg86tzfRsasrPdJ+x2rYP/9U9xrsRao4LCO5085XJ1n
	VCLWvAlionSyxrnQSKm89eUsKgEpv0LopiSTpjYcCPxhGMhSNfh0v4kz1msQ0RxysaE+78J2e2vav
	ehfcHbUwr7WOcvGErQNaBSQtfnHKq6VtDMWzfPLH7M0/Ydzvbkr9PpfV6Aylzua2NOoP+X9I4pHey
	Md1XkjTqB1t2aDtQlkmXfIPfxvveQaDeYlUIYD6dnNwn9Jr7fABysTs9/9AO7PCWx0pvu0IsQymNu
	5Ex8sOWQ==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRTg-000uT5-2v
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 18:22:39 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5b053454aeeso2262137b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 11:22:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698430953; x=1699035753; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=QjG+iTAl+MysAoCDX0shLrWGCG7e9aCGlo9+qs2tVnE=;
        b=dxOVMbCDl9g25wVioTBYtDL97jXaioqbdrQIr7skwbQExg5gSOdbOmhzDoV5W/k2S1
         61JBb87xFvbSEkOIefRAfu34pLGs2lWJBQVzmporomI5srS9sgMNF7cesAehjs2vzmNZ
         nBnpmQYwOlHPI0sJ9fsixobbOGWE7s1Jffv7aQijZrf7QZWA0F1A/tZ5cKspPgyxM5J8
         TJIya2UhjxEVnH+rCbx0hu40xebOWyDeLhB2f0Z2ze27gvJu2E/A1cVkrCN4q2q28aW2
         sAT59SGFS7blpdhun+nW3HOc/wr2QXuemiwKFALjUrfLFQvOIkPtgGek4bozKjQhKhDb
         YNNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698430953; x=1699035753;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QjG+iTAl+MysAoCDX0shLrWGCG7e9aCGlo9+qs2tVnE=;
        b=H78NIAA0w/tp71YfFm+/H6h6VVN/WQNx9POjoQed+P3u4TP1Lvz0F5SSSapzKDJGzL
         hEywOGvQM7WGwY0Yj+4o/LMbmLblZ+GE0Ikmog9AzlIOSKcKkI6vXAAtSfCFcnHOSvwQ
         aYRQZzAzSwD6vy3SpwsqnOnp81HMlEbRsbAKUvwgQfaSKLeUDivel5WcV0F9houuplXI
         1Iz59/C7vZGH+R9kUwKb5Ysc3VR0ria7a/MLSjZIvyYnBHVGmiOzfoxI0x/VXgTEKYl4
         9tXvtdDz0GBWQhBbZu1hzC5Qr2gyv7G89e3jkCRluW9uj7fNJS19PMOYjZ1Votn8G2EW
         7uCw==
X-Gm-Message-State: AOJu0YxfngRye8vxfFKtTHBrUnZs+QabH3ypqN/XFREy2wb/xBVfefjL
	kkjFMm1yWEUyhzO4MsHL/VikjaAwYpc=
X-Google-Smtp-Source: AGHT+IFjdgmBdyxBQ0zr6Phdzdc3NhfRHFKE/+Wea1IZiVOT7T4IBQHOPkTpo2hU6PU86u42a7hH74NJYwo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1083:b0:da0:567d:f819 with SMTP id
 v3-20020a056902108300b00da0567df819mr78680ybu.10.1698430953673; Fri, 27 Oct
 2023 11:22:33 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:21:46 -0700
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027182217.3615211-5-seanjc@google.com>
Subject: [PATCH v13 04/35] KVM: WARN if there are dangling MMU invalidations
 at VM destruction
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Xu Yilun <yilun.xu@intel.com>, 
	Chao Peng <chao.p.peng@linux.intel.com>, Fuad Tabba <tabba@google.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Anish Moorthy <amoorthy@google.com>, 
	David Matlack <dmatlack@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, 
	Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, Vlastimil Babka <vbabka@suse.cz>, 
	Vishal Annapurve <vannapurve@google.com>, Ackerley Tng <ackerleytng@google.com>, 
	Maciej Szmigiero <mail@maciej.szmigiero.name>, David Hildenbrand <david@redhat.com>, 
	Quentin Perret <qperret@google.com>, Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_192237_041878_EE839ED6 
X-CRM114-Status: GOOD (  11.52  )
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

Add an assertion that there are no in-progress MMU invalidations when a
VM is being destroyed, with the exception of the scenario where KVM
unregisters its MMU notifier between an .invalidate_range_start() call and
the corresponding .invalidate_range_end().

KVM can't detect unpaired calls from the mmu_notifier due to the above
exception waiver, but the assertion can detect KVM bugs, e.g. such as the
bug that *almost* escaped initial guest_memfd development.

Link: https://lore.kernel.org/all/e397d30c-c6af-e68f-d18e-b4e3739c5389@linux.intel.com
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 1a577a25de47..4dba682586ee 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1356,9 +1356,16 @@ static void kvm_destroy_vm(struct kvm *kvm)
 	 * No threads can be waiting in kvm_swap_active_memslots() as the
 	 * last reference on KVM has been dropped, but freeing
 	 * memslots would deadlock without this manual intervention.
+	 *
+	 * If the count isn't unbalanced, i.e. KVM did NOT unregister its MMU
+	 * notifier between a start() and end(), then there shouldn't be any
+	 * in-progress invalidations.
 	 */
 	WARN_ON(rcuwait_active(&kvm->mn_memslots_update_rcuwait));
-	kvm->mn_active_invalidate_count = 0;
+	if (kvm->mn_active_invalidate_count)
+		kvm->mn_active_invalidate_count = 0;
+	else
+		WARN_ON(kvm->mmu_invalidate_in_progress);
 #else
 	kvm_flush_shadow_all(kvm);
 #endif
-- 
2.42.0.820.g83a721a137-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
