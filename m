Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A943AC0015E
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 04:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Oa6B327hMuMFxZ5ivyvDDxc+jTcSXJYXrYAB7OAYqQk=; b=yme0c2rA/TYr1LctWOt66hzXQ7
	n+ONlJdCE+0ZzoCCyYzpV5XUMyXmsAP6LJWqxhfHIxOrfkKxzscTeYB2n39hKdjciEocvlRWm8cDT
	jskYCD+HDJOjbrGDSRi7eLunX2jRL0y4zNjk9GNHjGhDAxOb922dagVgLlKrGq6QjuyUuO4njJRH5
	Au1T+XQGSAwpc3kmzCDDU5z77KbDQCOkY8T3BLNqxnxIOBKrgFwkZ4CGD1lhVyNjNjMUdoXxKeTJ+
	Q73H5lxKJQ/AV2hXi+eE4vIsStbXgmjF5oeaw138omvZJ+N2cXZBJMmID61xhFJRG2PzE3LL4XUfN
	CEl1MsXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUK8h-009QNM-0y;
	Fri, 11 Aug 2023 04:52:43 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUK7o-009Pbh-24
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 04:51:52 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-58667d06607so19956477b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 21:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691729507; x=1692334307;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oLpltBl1pXuOSkpdQMGZFCQJKBJp7Al35vzbWbo573Q=;
        b=ABgFIwVolq/6ag26A1K+kK7FXdPo3peqsgbFXc8qiwvbhPI3bZRUdLezxZ8tQik92l
         T+iaoKDZaDOv6IfoUeiWPTwxhMI85ie6LyPMFxNj8XDmursgFf3en60dEzF4dqf3h+RK
         WWx7VeXuvcWe37vd84r2WsEbYnf4b0bMiMo48syBpgvZj3Mksg0RwjMn5w1l5qhHm9a0
         rzrR9Pv0NaqoQijOdbcWJVVU6XHeWI2Lcm9tCQY3XKwKjOaLQmbXEehuzJJrIwVg3DQc
         UD1yUHkb20HLZXzkBKX91nLMJ4OeAFKhFEZgnnRUJwp6sPgDeXUVCPtkFFCTN0I7E6Kc
         DCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691729507; x=1692334307;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oLpltBl1pXuOSkpdQMGZFCQJKBJp7Al35vzbWbo573Q=;
        b=K8z8cmhcluGxo0T9Fncc9bMXbnUMnNAgyRq9HmRc5ATDZXl4jifFZQxp3LtHjEKDWS
         11TEsklV2ztp6WbDZL6P0Klai9UOfE/pI1xGccVuWtlsmHyQSDX4QybdhXzhkppZP66J
         sM+C44VX7YXmlogFXSxppAjE0QXnmbyegMV1je8L5NSsofxnr1sk7GW1Ob/3tfVXEkWe
         JQpGMObFyOJN5lFuyXxj1Jw61C+HW9Abd648lpegiWxlwF7C999tJWyaVHTbnwbnPDEZ
         FhSkz2QVyZpSastBpErDYPz2Kd8d8jt0TK45nptQJFqmcscrqA4D916boFIFTuknXgu3
         aK9w==
X-Gm-Message-State: AOJu0Yyh0envm/enjd2aYXUS/uZiWelAw6gJHS3e7ATSZlQM2EgNCgBg
	EVnfoSNUTZYLkZ2HUOFwJ1MkkiTOwGPy
X-Google-Smtp-Source: AGHT+IEO0sAyUJ6vzJq2dvhSW/1XhcAzkAPBREyGCgte4h6OEGCasNix0f17CE/S4vT/rvUZ3pDeQps2/zyR
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a81:ad51:0:b0:583:a8dc:1165 with SMTP id
 l17-20020a81ad51000000b00583a8dc1165mr13228ywk.10.1691729507118; Thu, 10 Aug
 2023 21:51:47 -0700 (PDT)
Date: Fri, 11 Aug 2023 04:51:24 +0000
In-Reply-To: <20230811045127.3308641-1-rananta@google.com>
Mime-Version: 1.0
References: <20230811045127.3308641-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230811045127.3308641-12-rananta@google.com>
Subject: [PATCH v9 11/14] KVM: arm64: Implement kvm_arch_flush_remote_tlbs_range()
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Reiji Watanabe <reijiw@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Raghavendra Rao Anata <rananta@google.com>, 
	David Matlack <dmatlack@google.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Gavin Shan <gshan@redhat.com>, Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_215148_708688_4DDFC2A5 
X-CRM114-Status: UNSURE (   7.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Implement kvm_arch_flush_remote_tlbs_range() for arm64
to invalidate the given range in the TLB.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
---
 arch/arm64/include/asm/kvm_host.h | 2 ++
 arch/arm64/kvm/mmu.c              | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 20f2ba149c70c..8f2d99eaab036 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -1113,6 +1113,8 @@ struct kvm *kvm_arch_alloc_vm(void);
 
 #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS
 
+#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
+
 static inline bool kvm_vm_is_protected(struct kvm *kvm)
 {
 	return false;
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 0ac721fa27f18..702f8715f9fe7 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -172,6 +172,14 @@ int kvm_arch_flush_remote_tlbs(struct kvm *kvm)
 	return 0;
 }
 
+int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
+				      gfn_t gfn, u64 nr_pages)
+{
+	kvm_tlb_flush_vmid_range(&kvm->arch.mmu,
+				gfn << PAGE_SHIFT, nr_pages << PAGE_SHIFT);
+	return 0;
+}
+
 static bool kvm_is_device_pfn(unsigned long pfn)
 {
 	return !pfn_is_map_memory(pfn);
-- 
2.41.0.640.ga95def55d0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
