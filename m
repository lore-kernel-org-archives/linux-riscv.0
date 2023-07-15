Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C75E9EB64DC
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 00:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=xtYi/MYzDl5laUvk7IlV9O3Xq2oQwkBkSvtw8Jn0kA8=; b=bo+xiUfGu6hQOn0BBOC+W5VMSt
	IQWOTBNDM+BUzpPVayBjcOnKTrcKIL4NByO44ATiPMj7G5rAD/q4qErvQyDdClCUkL30XKEgNdHwO
	dcTe3Yh5uBBTsFQUoUhsQa4slnCjWRmGIfeeLrJg+RApGQ1ykl8IJg73EGuI+pRRDRnuj+TLnHOZX
	qud7k2deMl4q7PQyxj1TRrNkhbA98G7N8D60L6wTvT76FeovAnIwwnljrUFlH8FWRhkt8iDbjgZ19
	A7SWRjtO26Uma4iVDy/dK9cZ5QfidQyrxICGD4cAXtOyP+Yk8svqq5d+0E6UHBODjuqWmj8ujgMLS
	bsvptkNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKTYv-007aob-0l;
	Sat, 15 Jul 2023 00:55:05 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKTYD-007aFS-1X
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jul 2023 00:54:26 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-c6db61f7f64so2095439276.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jul 2023 17:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689382460; x=1689987260;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NQY+Dtk1XWrNNGuHSHxbkYrauldxXbZA83USiWOTL6o=;
        b=TCgWEy2z8oOGQwvnSBHn0AkAkVSlT9c37MgvWUaNlBXCNKNpJR/vOwVyuvEfVCFhZH
         75Djs6cT8vsl01b8fPqnk9tIFBiF7zvqtCVYGWLZuWsMETu/RPDzgHfQJ0N6NM5C6vOx
         hB+mAtMX3eXFTzff5OpvcbDHdQLWnoerWsIudu0SL4c3QoXFOjZqkSdjyoCJtPVXGr6W
         //LvcxbEku4U7vC3//3dhn54WTCVJcS92mQ6c7NC+uGD3MBXy3sOfSBG1WMjwOX4vcYi
         XoUh9543oJXJngnlcI/Jw0nJMM49HqIHNGb/O4YAGu77Z/SnUdDFBBfexEdSrvLeIvbz
         Ltlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689382460; x=1689987260;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NQY+Dtk1XWrNNGuHSHxbkYrauldxXbZA83USiWOTL6o=;
        b=VSiYOc8u4YBGp3876yCRnJwNCBuD5RdczTTkR/x/ptA5nJVjA+/3epf5J1u1xX/vrL
         cUBQweSB3hGOyRbNI5U2zqTP3B9J/egUU8gwsxtsfBHnGKYhqFu6DQQkCWE/tLYXncgv
         nS6dZG7A3s35NMo8kty3VK5jzbmelTOO4jnffcRzzKkEbqaekfvvSRv9AlANFUcKVI6Y
         4xxLejw/p8XkZq9j0s6qUyjIu65cAStBKk6Ys8yJ5F7OHDpkoc3w945c6T56meuqOKAa
         my63VDPLrhA8jw1ayN2TvbGo1pdKO2IZPFMB+akW2y7K/nkurUIALpMhLEYEK0e/rg94
         tBGg==
X-Gm-Message-State: ABy/qLZam/GgSEwKQTwC6r5zlb50b0vzogm5CcNbpsDPhp+rW7VyEOOa
	WHyS7eme2dWvfzI7sYyX3Yz5CVZeRTaW
X-Google-Smtp-Source: APBJJlG5n3Bft6SS+LPAWDb1hmMGpZKEdbwJGhCcCMWgOINPk2C5Y/61Tx4AtYFAIRblEEw/+bRH7gfv6I55
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a25:ab81:0:b0:c5f:85f5:a0e5 with SMTP id
 v1-20020a25ab81000000b00c5f85f5a0e5mr14207ybi.5.1689382460190; Fri, 14 Jul
 2023 17:54:20 -0700 (PDT)
Date: Sat, 15 Jul 2023 00:54:03 +0000
In-Reply-To: <20230715005405.3689586-1-rananta@google.com>
Mime-Version: 1.0
References: <20230715005405.3689586-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.455.g037347b96a-goog
Message-ID: <20230715005405.3689586-10-rananta@google.com>
Subject: [PATCH v6 09/11] KVM: arm64: Flush only the memslot after write-protect
From: Raghavendra Rao Ananta <rananta@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	James Morse <james.morse@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Jing Zhang <jingzhangos@google.com>, Colton Lewis <coltonlewis@google.com>, 
	Raghavendra Rao Anata <rananta@google.com>, David Matlack <dmatlack@google.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-mips@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Gavin Shan <gshan@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_175421_560471_8EF852A5 
X-CRM114-Status: UNSURE (   9.42  )
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

After write-protecting the region, currently KVM invalidates
the entire TLB entries using kvm_flush_remote_tlbs(). Instead,
scope the invalidation only to the targeted memslot. If
supported, the architecture would use the range-based TLBI
instructions to flush the memslot or else fallback to flushing
all of the TLBs.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
---
 arch/arm64/kvm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 387f2215fde7..985f605e2abc 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1082,7 +1082,7 @@ static void kvm_mmu_wp_memory_region(struct kvm *kvm, int slot)
 	write_lock(&kvm->mmu_lock);
 	stage2_wp_range(&kvm->arch.mmu, start, end);
 	write_unlock(&kvm->mmu_lock);
-	kvm_flush_remote_tlbs(kvm);
+	kvm_flush_remote_tlbs_memslot(kvm, memslot);
 }
 
 /**
-- 
2.41.0.455.g037347b96a-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
