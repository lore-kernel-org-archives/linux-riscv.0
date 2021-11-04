Return-Path: <SRS0=Owia=PX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAD44C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 16:41:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB06661213
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Nov 2021 16:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB06661213
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UTBzlPcPoRb1DXanwX3rhxg6TpOSjACRYcDYMU/2QHI=; b=d+y1P7QXo+UXSY
	XKvXq1cz0cWh86ZV9XyoV3KbDUefEdGXGCeOj0li4rLiTKTqV1VpSy5BXslQP3lq9V39wAgDBTzT8
	PKkpLWaA0EJkzNk/SwCHhU/vRkvrRQ66oXRwX4MaIaO4VRRoXkWyBc9q52UJj2k4vJBLbDhBP/U91
	8+rzvaO7F5ZVCayM+phzUjDSJx42xLRXvbVYcQ8Ioild/4vN3tmL7EWja3FP+GyuV0kVAL80Dwd/u
	oAlshGrN9upZOZv5HEKxAwTogjohuEdRZcba/yqaJU+8qfEP0x0RJpjo0maFSeFxZFje+ShgreG3L
	lRGRrpuGaU+ymWnqXqjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mifnn-009VpO-Sd; Thu, 04 Nov 2021 16:41:23 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mifnj-009Vlt-GK
 for linux-riscv@lists.infradead.org; Thu, 04 Nov 2021 16:41:21 +0000
Received: by mail-pf1-x449.google.com with SMTP id
 m26-20020a62a21a000000b0041361973ba7so4204866pff.15
 for <linux-riscv@lists.infradead.org>; Thu, 04 Nov 2021 09:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=BLpO0fOkHXhU49HszP9J7IBUy0ZTyjUC3dOvZNy0mdE=;
 b=TCwN7LDAPJdrI3JQ0PhC2yCcI5yLMhPl7ApX+9DhRmXyfPHERawX2DwxsXfzQpe9j7
 aiStPhF6p6Nc0rQj0cQ6Mr+Q2jbguwuqGoltihH6LYnjeNZb1UignEIOlPkm8hFbdlgN
 yVynl+h5lLQhr4jXpCj1CaYf7Rkv4LndwkROKDmusS+uaL/A6tmofBzuYAEpvgY3MF+w
 6pOCDVv8jBPc3PnWz2YdpXTN+WHrksH3DawZW7qu7EHw0YH3LzXmKSA2r4O46Hfslcwg
 adnajvryDs/Nm5UcX0GdIbmqjM7LYEUxG51G5Dy6nlYavqc2vn+hQO5BP+l8Bw+wIvLC
 LD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=BLpO0fOkHXhU49HszP9J7IBUy0ZTyjUC3dOvZNy0mdE=;
 b=IlE3OMFlr1ztCFHUB6LBCeeSLISbDtv8FyVYV6d6LDUp0t4NzBI7Z7e2bMy/jC7afw
 J9Xp4fSnzKp4dk+mNyOq0VrQ4gY9CiDcteu+XCwREzObxym7CXV8yZyC8+poI0qybul6
 P/t73WNWlR4rH7+Q5tT4ZauvwjpPsPpGeeKXXUe6Ym7wc4IgnHvymOKOQpcAK0HZXks8
 Iv/+73S180OGT+PeCNly0b6HiQc90liGu+DO6PHib9Fl0K4wCjlaUqcQEe0/dfPM4CxY
 lXVALe4ARIMLnBVcUOWwsQJ6nPX7/+MQlYoC4lvG4Rl0x6HElUEeO/dHIaknXZJe0Xrb
 jgnQ==
X-Gm-Message-State: AOAM531Hm5+oA2yqKj5v0huNBwdHE3p+vKYH41aPtqT1NW6nUBrt4Y6Y
 Yq1tvZjOgYdxG9PMnBxsSeyJyALsm+s=
X-Google-Smtp-Source: ABdhPJxBUNyqMmxEzIJpo0JuZDNZmWIY5euPfVSkwAjseNfVPNvFjkbOibNRD+fI58d1ZSdMDQWSia9J8WI=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:902:a50b:b0:141:dc7b:b2dc
 with SMTP id
 s11-20020a170902a50b00b00141dc7bb2dcmr29202914plq.4.1636044076879; Thu, 04
 Nov 2021 09:41:16 -0700 (PDT)
Date: Thu,  4 Nov 2021 16:41:06 +0000
In-Reply-To: <20211104164107.1291793-1-seanjc@google.com>
Message-Id: <20211104164107.1291793-2-seanjc@google.com>
Mime-Version: 1.0
References: <20211104164107.1291793-1-seanjc@google.com>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
Subject: [PATCH 1/2] KVM: RISC-V: Unmap stage2 mapping when deleting/moving a
 memslot
From: Sean Christopherson <seanjc@google.com>
To: Anup Patel <anup.patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@wdc.com>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211104_094119_552569_9429A33C 
X-CRM114-Status: UNSURE (   7.45  )
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

Unmap stage2 page tables when a memslot is being deleted or moved.  It's
the architectures' responsibility to ensure existing mappings are removed
when kvm_arch_flush_shadow_memslot() returns.

Fixes: 99cdc6c18c2d ("RISC-V: Add initial skeletal KVM support")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/kvm/mmu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index d81bae8eb55e..fc058ff5f4b6 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -453,6 +453,12 @@ void kvm_arch_flush_shadow_all(struct kvm *kvm)
 void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 				   struct kvm_memory_slot *slot)
 {
+	gpa_t gpa = slot->base_gfn << PAGE_SHIFT;
+	phys_addr_t size = slot->npages << PAGE_SHIFT;
+
+	spin_lock(&kvm->mmu_lock);
+	stage2_unmap_range(kvm, gpa, size, false);
+	spin_unlock(&kvm->mmu_lock);
 }
 
 void kvm_arch_commit_memory_region(struct kvm *kvm,
-- 
2.34.0.rc0.344.g81b53c2807-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
