Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CAFC04A94
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 23:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=O0hoHRhD0KGM6MEob9aSO5v1y51eXnBowhvcQWOKO9k=; b=zd4K+sokfL+N4r7FR8HEKal3Bg
	XdCcNAmje7pnLn4P2yNVvQDDzEXPPNGeOqCJ7FbR7zwjWY61PhKOWJbVbMCM5sw3zOPpMELi4NUVR
	aysegf5VOHtou6FzrgOVMbu3ngxwrqFIXacLBMOQs1mse/WZ0WcxnCpDhc/DgV9AfD1IaQ1xQIs5w
	x8ahOqx2HkknaSbke9LJo9LWLC/A66KNYX3RjQBHiZaVaHYRUk5frriwPdU0wOrlmUY9Fj4K9o47T
	pZfpb0toEVoWvNMS0/PQ/e7dDKlxLgW97OE/mh0WSzYJRMyseWZ9IMcwvU2BxL3d3/ihsGaLLMCRo
	wqcGi0Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTVtt-003dXY-0f;
	Tue, 08 Aug 2023 23:14:05 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTVtc-003dDR-2d
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 23:13:51 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-c6dd0e46a52so6936639276.2
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 16:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691536427; x=1692141227;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DdFQXc9QjMOj4pMVD7mddwddfJwM0E/FVNI1wIxPkhk=;
        b=GGya4r79Fypy7MpijHUr6lRrKbN2KwgnqmepmFHyoEm6JOw0RI4BnR26D52ypMST14
         qMrhS6uMP+X/P+04iY+CFJYP/yfNgW/oQiRxmX4L8KUMTb9SHE2leuL53nL+lEy8UfWN
         H6Gme/iQnweVgHOIz203N5vFFXqVCtC2ViqgYkIHf1XrsCct05bcsmV1KcRfn0mKeymj
         ESMAAwstxX9ujJZpbixig2EzSNSrlwlq3HWLXEyApK1JC0D3VIjPeG/oYEmpo68kYHS8
         /95jhR/N+ADW8Wt9ABI0Q1X51ZWQY4WgE96INI5uDk8QgBXuW/N36eA7E8a9TtSBew8R
         8+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691536427; x=1692141227;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DdFQXc9QjMOj4pMVD7mddwddfJwM0E/FVNI1wIxPkhk=;
        b=I7dnVycGaJ1K/5I1gWxzdpNIhDtamAXIjU0CNbI9MNBMwzR3SzrLpwRdCuEuItJYhE
         oL7QWireOAsdnZy9rowhlR2OGw9r3U+qmHmmrAyvQZffG1eDpOOXiEeZVrhDoJ7eNW+Z
         rGNYi5np+M5JyptdcBYzhHVUZFompkeRMI5+FiAqRoTymGaoRQ2IRIxVMSRLrHWsgJmB
         tFAPwOhN8av6zT/oty24KJF1RqlX5t81yeAohoIANe2CW4bbT48PNRGYTGRbfFaVpWJV
         4BYmrx4hgHAzuryGZnYXZJZJFCJq0dmzwj4jpb+BCvSZcrhLaxbAv1p/9geQKbnjtnXc
         cb6A==
X-Gm-Message-State: AOJu0YxKFDyqEm0+nFl2cDO5IO1g0keFvcbpD8wxTO2WSD0zWGPWGbmZ
	2pg1MruUQR6NxtQ6vZLY362MOCq/QC2X
X-Google-Smtp-Source: AGHT+IHtVpA0B67cdmlCLqrTRdBRqOLFjvFy7tyIxoiuO5XwsAt9fDPTNialdcxuGgrd+oEKUp81U6/MqqgQ
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a25:ac09:0:b0:d0c:1f08:5fef with SMTP id
 w9-20020a25ac09000000b00d0c1f085fefmr19514ybi.12.1691536427532; Tue, 08 Aug
 2023 16:13:47 -0700 (PDT)
Date: Tue,  8 Aug 2023 23:13:28 +0000
In-Reply-To: <20230808231330.3855936-1-rananta@google.com>
Mime-Version: 1.0
References: <20230808231330.3855936-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230808231330.3855936-13-rananta@google.com>
Subject: [PATCH v8 12/14] KVM: arm64: Flush only the memslot after write-protect
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
X-CRM114-CacheID: sfid-20230808_161348_871795_A1E3F9E3 
X-CRM114-Status: GOOD (  10.27  )
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
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
---
 arch/arm64/kvm/mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 294078ce16349..95ca2b86aa2cd 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1083,7 +1083,7 @@ static void kvm_mmu_wp_memory_region(struct kvm *kvm, int slot)
 	write_lock(&kvm->mmu_lock);
 	stage2_wp_range(&kvm->arch.mmu, start, end);
 	write_unlock(&kvm->mmu_lock);
-	kvm_flush_remote_tlbs(kvm);
+	kvm_flush_remote_tlbs_memslot(kvm, memslot);
 }
 
 /**
-- 
2.41.0.640.ga95def55d0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
