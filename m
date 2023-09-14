Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765A8EE021B
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Sep 2023 01:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WsTEk8aDp5GdnLr/7G5Zcs+O44U3kaJBnzlbyzZ2x1A=; b=2FQH2Jo7gBWxRu
	4aYhXdx/0gHW0gEpwkP50ZvCAeqPTore/a73drCpRqLQ3EZ5GihsdIiZbxh67ZGPREKad7XcsbpHN
	kXy8hO59oopS4KfUnyEBKdnO4vD2MZr4UAPPa6k0DZAFZe0/LTqQUUn/JJpNm2H0IdXIZVS42dkPq
	MebYiHAQGUTjklbhRuKkw23pUc/W/TpXU2iNxuBUqLyoOwtRtKyCPm5hCe02i7u8DOfjkUPUtR10C
	55u94ktVQTH2te8WDYezjc3IV95Bebp8pLqfMec+6jcYJvF+1S1afOS4Mzfk1A2wRv+nOfDdOAWJr
	lhsoHUgNtQKsmaYyaNCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbdK-00764i-2j;
	Thu, 14 Sep 2023 01:59:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbau-0073hH-0N
	for linux-riscv@bombadil.infradead.org;
	Thu, 14 Sep 2023 01:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UjBddbZXLqwDqs/dRSKLKY4HwUhf6Ai3WxLtYL+KxyQ=; b=FfYil/pPNLZiuipBUINYrllqYI
	yCnnPYgweIfthuoeTy5pPcWQbBPonmA5MT6evrF6fj4ANrmBroQNzkL0HXd6103vcKCG86GCqLKI3
	yhU3LMRwVMClS5qpFgdiNMsbPHRmcJxaTVLNeKmLlHpCCO0s6VWfWj/bejwisUEADGM1yIy7aSUgv
	+jcGmIQIk7wKZA/+Ola38kqFqWFTCne6DL1YW+j0gKoSeQjjuG7kE4yPlHsXaHd1EP69rWDF4Sozk
	sk+sKKVr96fHbBSp6wWYl+x9FJ1EzcC0+sL0qG7qcsK14596hNKb1RtbR/7OjDJ1x5EIXFmDxB5GQ
	CCwwftxg==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgbao-007TgS-17
	for linux-riscv@lists.infradead.org;
	Thu, 14 Sep 2023 01:56:33 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-59224c40275so6512377b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 18:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694656588; x=1695261388; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=UjBddbZXLqwDqs/dRSKLKY4HwUhf6Ai3WxLtYL+KxyQ=;
        b=QLOrSiFKVBBCVyzycKQZRMqvzI/UHu6NZ8Tl0te7u20XBaYi7XZDyrL92/Mg8iFOky
         xWV+m9weaJxWStTI1NIzYHI0pLIjxl4x9tFlBhhrMyjtGh5OosQxYfYjXEkLtWKi4BKM
         EWyVFyld+2T4HtFqM5xUIIdl9UrIgRhivUPF5vMjcE6rY/GaHHawfrPpa6wxVS54FLVY
         KfTis5O6h8THti1GPqgKdOn0hHEJmJ+gHv+QCbhXwsw5Dqva9jQmUyxDZw9Opbnq1saa
         s7lm0x/tyAO3m5GcmgilVinRds4egjD/hX90IXzQSFbrwo8aYzXMtccMUk/o7lEeikN4
         IOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694656588; x=1695261388;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UjBddbZXLqwDqs/dRSKLKY4HwUhf6Ai3WxLtYL+KxyQ=;
        b=w8FQ7qh6qyL2gLrUlvvqx19YMVqa2f9tRcAOZ9DaXFlbt/oiT8oCKlfIE1aSkV0VDn
         oJAOiwpNoaD/DmBIZfSp7ElsuHbIAkX26igTSDq6Vt1iwIDdio3ykAeBmAtcLWW7T74m
         e0PbuQTlIeF2w9Ln+K3IAN7fj0yZJIbxr8glQa3ZPC6jyrX4TfgoZNBJzEfhVXrL+EjS
         LpH7UiLU6lVLTHZtOscPsvjNWMEpowmj1UVDJAfpiNE2n+DKDEkzlTvTn1nfOWyTmr5J
         kYinZYZRkigI95YIdV3pn9Lf/YXOhyGx6NHdxV7Hk2btt6lyuoEggyLOtk+JKnHM+Oo0
         ll8g==
X-Gm-Message-State: AOJu0Yws//vICPvuoxWvK9EtdOWF55Dvzv/yDhfp5N/gLi6AF0P1cvJb
	Suce4f/4GZclOPV8m0XrVCyNgQqGoV8=
X-Google-Smtp-Source: AGHT+IH0gGeX6zOzLjc3uszP5L1cVBy/yaTsK9vfF/9VEoisKrc6F33BJumlmtJCwJ85BnFPZfgq0s7SPdg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:2e05:b0:59b:e1db:5633 with SMTP id
 et5-20020a05690c2e0500b0059be1db5633mr53066ywb.1.1694656588217; Wed, 13 Sep
 2023 18:56:28 -0700 (PDT)
Date: Wed, 13 Sep 2023 18:55:24 -0700
In-Reply-To: <20230914015531.1419405-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230914015531.1419405-1-seanjc@google.com>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
Message-ID: <20230914015531.1419405-27-seanjc@google.com>
Subject: [RFC PATCH v12 26/33] KVM: selftests: Add helpers to do
 KVM_HC_MAP_GPA_RANGE hypercalls (x86)
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
X-CRM114-CacheID: sfid-20230914_025632_051233_53EB0FD9 
X-CRM114-Status: UNSURE (   8.21  )
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
index 4fd042112526..1911c12d5bad 100644
--- a/tools/testing/selftests/kvm/include/x86_64/processor.h
+++ b/tools/testing/selftests/kvm/include/x86_64/processor.h
@@ -15,6 +15,7 @@
 #include <asm/msr-index.h>
 #include <asm/prctl.h>
 
+#include <linux/kvm_para.h>
 #include <linux/stringify.h>
 
 #include "../kvm_util.h"
@@ -1171,6 +1172,20 @@ uint64_t kvm_hypercall(uint64_t nr, uint64_t a0, uint64_t a1, uint64_t a2,
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
2.42.0.283.g2d96d420d3-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
