Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F99C25B70
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 18:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/0iCabgH/8mQX19xUSldx/T2M2r+KiJ554P06qFGw0=; b=oPyfCqucJj1NTw
	pKcIQu+rH7as3CVSmTaBPQAromoB7U7QznHCvVJYNw1Fd1U1UPbej5Q9Mr3U3kr7TQQW1ryxFEToi
	w8O5oRgxwn/jPzPSG7aBBUnVmnTXUhZJ+gc7OILRXLy6dU961uTaGNMZBwYdwIFXevZ8UnrURjKba
	M0be7LnveQoRuoDFDnzZnDxW6TrPPFbroj6iA39PTuVFkmB97Qbt3e0foOMJhuGR+7/WZDTlMpPnh
	8LVA/bk1P0lUV8rLtIcuKDhd9MjHaPp47lGX9RclB0yPPp29QrlOg0qiY/sLCOojTF6PP2Z0BL5a7
	8TEjLBVzaOWeVamsVQwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRXD-00Gzk3-2E;
	Fri, 27 Oct 2023 18:26:15 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwRUQ-00Gxba-1O
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 18:23:31 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5a7af69a4baso20633617b3.0
        for <linux-riscv@lists.infradead.org>; Fri, 27 Oct 2023 11:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698431001; x=1699035801; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Xz8kt0PqFUxEdWsVGTpKhvh/0bAOqOlDGpUeOhSMn4Y=;
        b=EsVYmDc78DY6Pgix8fAcm39A6FiJWjVjwma0jJ574vquFfW9qT72WI6g1Yf4GqYIUv
         7uzE9Zcrwg3HA0zz1vzeySnRKXWFeIi0liVNC4bY+4q5XP6mNXU+0MMI6895xjcNTv9n
         TxtOi9rF3h/MMFqQQPy/Q8SaOIlH8JO6QTkUR+rBYktpl01QgrTnCcbmFTrXQu3Gyi3J
         B20X4fqNiZhE/I9LtlbSpJoZO9SfMi1zvmHkaj4DizyQIf5j4BO47RxTAXZCjFdIsEr4
         GXf3am5NQ9csRNXwGWeLzdCWbkOhGw7cwmBi6rK2OP+ytzE1bbRWMRjIgnpDw10k2eJn
         hCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698431001; x=1699035801;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xz8kt0PqFUxEdWsVGTpKhvh/0bAOqOlDGpUeOhSMn4Y=;
        b=tRtPgRpf0/YuSkYYEvj/R6ytlTCJ8OQlYXpxCCFkV9N6Yga1ONPJQ0sZj62kPn/Art
         U6Waom0J9dKY4+5ZrtsaunQI1NRO8iq3KuXwP3gw9WjHWuIAvpiDTV2YicZhTYNmPgGr
         znBDbKeMMjX4NCx/GH/lCtX/7FsJqVdoMATNPr82ZQkevIr+U8h96H2xhS44t6Ebc8sM
         oGwjR2nDv+MzVEbBiizNpCtuNZoyL2mZEgIlcAa11O0Rmtto3UXddEbPKJmPrQoHZ7zR
         RftxudQhUW+xRNXVhn9/UKtkNWJSpOadMc7Wb8AoZ2YQ5jWcI1v4i+gnA9xBVyW8e00U
         CErw==
X-Gm-Message-State: AOJu0YyE1UL92UB6u5lsFzNAs67WXmtwo6LEuUaTRKzcIi63kpdep29Q
	ZsDja6E93yLWH83AaLgFSDSxPJCacyM=
X-Google-Smtp-Source: AGHT+IElp9q5EmMXm2ScJmYLrQOoQHqoyljn7k2kapIAuiZd/nyrTEs2J8MXUI1aCi13+9HebXd80A1xuUo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a0d:e653:0:b0:5a7:be10:461d with SMTP id
 p80-20020a0de653000000b005a7be10461dmr68754ywe.2.1698431001067; Fri, 27 Oct
 2023 11:23:21 -0700 (PDT)
Date: Fri, 27 Oct 2023 11:22:10 -0700
In-Reply-To: <20231027182217.3615211-1-seanjc@google.com>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
Message-ID: <20231027182217.3615211-29-seanjc@google.com>
Subject: [PATCH v13 28/35] KVM: selftests: Add helpers to do
 KVM_HC_MAP_GPA_RANGE hypercalls (x86)
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
X-CRM114-CacheID: sfid-20231027_112322_514243_0C351119 
X-CRM114-Status: UNSURE (   8.19  )
X-CRM114-Notice: Please train this message.
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

From: Vishal Annapurve <vannapurve@google.com>

Add helpers for x86 guests to invoke the KVM_HC_MAP_GPA_RANGE hypercall,
which KVM will forward to userspace and thus can be used by tests to
coordinate private<=>shared conversions between host userspace code and
guest code.

Signed-off-by: Vishal Annapurve <vannapurve@google.com>
[sean: drop shared/private helpers (let tests specify flags)]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/include/x86_64/processor.h      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/x86_64/processor.h b/tools/testing/selftests/kvm/include/x86_64/processor.h
index 25bc61dac5fb..a84863503fcb 100644
--- a/tools/testing/selftests/kvm/include/x86_64/processor.h
+++ b/tools/testing/selftests/kvm/include/x86_64/processor.h
@@ -15,6 +15,7 @@
 #include <asm/msr-index.h>
 #include <asm/prctl.h>
 
+#include <linux/kvm_para.h>
 #include <linux/stringify.h>
 
 #include "../kvm_util.h"
@@ -1194,6 +1195,20 @@ uint64_t kvm_hypercall(uint64_t nr, uint64_t a0, uint64_t a1, uint64_t a2,
 uint64_t __xen_hypercall(uint64_t nr, uint64_t a0, void *a1);
 void xen_hypercall(uint64_t nr, uint64_t a0, void *a1);
 
+static inline uint64_t __kvm_hypercall_map_gpa_range(uint64_t gpa,
+						     uint64_t size, uint64_t flags)
+{
+	return kvm_hypercall(KVM_HC_MAP_GPA_RANGE, gpa, size >> PAGE_SHIFT, flags, 0);
+}
+
+static inline void kvm_hypercall_map_gpa_range(uint64_t gpa, uint64_t size,
+					       uint64_t flags)
+{
+	uint64_t ret = __kvm_hypercall_map_gpa_range(gpa, size, flags);
+
+	GUEST_ASSERT(!ret);
+}
+
 void __vm_xsave_require_permission(uint64_t xfeature, const char *name);
 
 #define vm_xsave_require_permission(xfeature)	\
-- 
2.42.0.820.g83a721a137-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
