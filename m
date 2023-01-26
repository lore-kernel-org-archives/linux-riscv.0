Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0032FC54EAA
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 19:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LAXCtPfUwQ8BZ0RySYscGutdYF3mob4FuyID+p92H7U=; b=t+ArFKAwy2HgJWE2LBwA++sc1B
	8Om4ST6qBx85vPr+NXHi4TbBboX336O3jQpALaFqpMmRhRBlnInGds1CG21XtMIf5qpprI22qEF0e
	TAmMdPl3jCc4jFvaSMzuHrGrxWjkPDMPnqumS3BzFi1hpIzpfFmOep645Vz+RIPv5Vs8ETEdKApc+
	XnWbtf6dRnBLrD7amLT17QG5aphIcM4A37RUKdycp0CzUpzOBGVgSqFeG7l3Mr91Tupil3znNTaTt
	uPJeWb9PaONtCp1Ou34PnRCyDFb9CEcNrKAV1CcbsXfx4rU73y1wjPe8v/jCtOM8AKHpj0b8dutOv
	+8TEQ3/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL8Et-00CNrb-F5; Thu, 26 Jan 2023 19:48:51 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL7B1-00CAXT-4x
	for linux-riscv@lists.infradead.org; Thu, 26 Jan 2023 18:40:51 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id w70-20020a25df49000000b00803e799d7b1so2803676ybg.10
        for <linux-riscv@lists.infradead.org>; Thu, 26 Jan 2023 10:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oU7ZUJurLYW9x4bI+Kv9L/ycv+6RmeYBTA8gNQPNdxA=;
        b=ohWzxXZXsPNzIlyvbd2s071SX35P1VzikIV3cViCxs5y1YHT/pXpmwUq69QUARfOwl
         5xpWEPV3frrTxbrENM94ILfJNgZrXEL2IjmpWp1DxNwI9qrLO4dKQuRk9PzwDWImtPyR
         Lk3f6aRh4odIMYbsNnLv2UD3/TnGwSDwS2AI+1V+TxrxS87O96yqM/hYTby0ynaKJd6O
         L7HVsqOMlTVY4A2GM7lHg4/A08IsUEWDci+BGqQ/3831Lo00XtjCZ6nJ+s8atP/kXqV+
         ohnH/yDepl7Ib/4UcjUjvOIaSPVNLjRcPDpZJ9CfqQXTqu9euBWqOxllWJYH4e/mfSPT
         rVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oU7ZUJurLYW9x4bI+Kv9L/ycv+6RmeYBTA8gNQPNdxA=;
        b=xfbhqm9tpcDE9er9vOW6IeX9904PoNY2hPFr6vImN5GL0JqXOkuQXzj8c5lJkibAZH
         Ll8hXjWfqnzBWHzof+AKy37BMRl1qFuQfXV6ieBz0kSAgp5EofWFfLlHc83YntaHh9wy
         wUSOCgMxzFfgu0D5ajGIP4eq76C/ZCyYOJdAl5OyfP88Fe8T84RgQ70MCCqnrUk4pMWR
         64sL+u8M8+IGqgo9GZhtUvFcbrSTqL966IOoBXceerU96f1FnVcvvEyE629ttCNiEYCl
         JRuPO71oxyLZy3zQ5paHIcWsjj1zKZrp50sjfmSoEoDCT6TumALIVe1Kl8kIDVb9Mup0
         xuRg==
X-Gm-Message-State: AFqh2ko+q4NLOT8lLlRA4gP+WfU6O/Bqau4jMPiBLd7TnUtdtzf9MOhS
	OU8UhbChlZaMsTnomnS/G0ikQ3JxGgjV8Q==
X-Google-Smtp-Source: AMrXdXu5cLu4gFuBX1mnOKYjOBTz2sSt6Jx7ftPu6Qft6goAkZI+WSVaQSuC1LB3Rt3uakEq2UJXO3GeP/tSSg==
X-Received: from dmatlack-n2d-128.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:1309])
 (user=dmatlack job=sendgmr) by 2002:a25:c057:0:b0:802:898f:6e73 with SMTP id
 c84-20020a25c057000000b00802898f6e73mr2703455ybf.411.1674758445572; Thu, 26
 Jan 2023 10:40:45 -0800 (PST)
Date: Thu, 26 Jan 2023 10:40:21 -0800
In-Reply-To: <20230126184025.2294823-1-dmatlack@google.com>
Mime-Version: 1.0
References: <20230126184025.2294823-1-dmatlack@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230126184025.2294823-4-dmatlack@google.com>
Subject: [PATCH v2 3/7] KVM: x86/mmu: Collapse kvm_flush_remote_tlbs_with_{range,address}()
 together
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>, Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
	linux-mips@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	David Matlack <dmatlack@google.com>, Raghavendra Rao Ananta <rananta@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_104047_460990_BDAAF6DF 
X-CRM114-Status: UNSURE (   9.80  )
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

Collapse kvm_flush_remote_tlbs_with_range() and
kvm_flush_remote_tlbs_with_address() into a single function. This
eliminates some lines of code and a useless NULL check on the range
struct.

Opportunistically switch from ENOTSUPP to EOPNOTSUPP to make checkpatch
happy.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index c91ee2927dd7..b257f937d8a4 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -247,27 +247,20 @@ static inline bool kvm_available_flush_tlb_with_range(void)
 	return kvm_x86_ops.tlb_remote_flush_with_range;
 }
 
-static void kvm_flush_remote_tlbs_with_range(struct kvm *kvm,
-		struct kvm_tlb_range *range)
-{
-	int ret = -ENOTSUPP;
-
-	if (range && kvm_x86_ops.tlb_remote_flush_with_range)
-		ret = static_call(kvm_x86_tlb_remote_flush_with_range)(kvm, range);
-
-	if (ret)
-		kvm_flush_remote_tlbs(kvm);
-}
-
 void kvm_flush_remote_tlbs_with_address(struct kvm *kvm,
 		u64 start_gfn, u64 pages)
 {
 	struct kvm_tlb_range range;
+	int ret = -EOPNOTSUPP;
 
 	range.start_gfn = start_gfn;
 	range.pages = pages;
 
-	kvm_flush_remote_tlbs_with_range(kvm, &range);
+	if (kvm_x86_ops.tlb_remote_flush_with_range)
+		ret = static_call(kvm_x86_tlb_remote_flush_with_range)(kvm, &range);
+
+	if (ret)
+		kvm_flush_remote_tlbs(kvm);
 }
 
 static gfn_t kvm_mmu_page_get_gfn(struct kvm_mmu_page *sp, int index);
-- 
2.39.1.456.gfc5497dd1b-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
