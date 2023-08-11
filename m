Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D687C001DE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Aug 2023 04:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vQb/tYnUrfTlbqxf4ZkXLZUX2Ernz2KIs9ttgcvlwEw=; b=Fd2P6pyjGHKKgdBXEb67fpz+2c
	IYDvy96XG88qyphSEcB8epjhUB1iFCnS8z1Kq8rt4jr1BUrfDlbvo4ROfNwEG50FFUJyAvBGGNPfA
	MOqsdSkjPurOXp+3A7d0hJE6gLAzdbLz+GJFYqlhiqUpKcCb0FGT5Cld9CVUDOAY7unGIh7cyjI50
	41PeepwhUD44zfxw0p5Dxx9sA3eCFf9BB+AynXEYo4zXXOZPthA7pgUSXvFgj4uevsHR8pgwlLqPp
	/4UaKC8dKvLxlKClYlKB6EC7VbjMIb08+n4IS5a5uA+WcagO90vzHHU6aufrsgA77ZLBIZZYJ3ac7
	6KlkBheg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qUK90-009Qep-19;
	Fri, 11 Aug 2023 04:53:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUK7y-009PjK-1X
	for linux-riscv@bombadil.infradead.org;
	Fri, 11 Aug 2023 04:51:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OIa9YyTqwhNrd4vOTw3RHcrRyaG5nOQ7ik48y43Y4K8=; b=GBOttilx83cFglISeq5Vcmnd59
	MdOd6kgxb/SYZ8UT4AdCsFyCn3TXqj41HLp85Ig1opQrKCjuE6aaPuSBPP6giuvy4TyEQqk6jat++
	bY/y13MilOiuxVY121ufZYW4YXCYf90G8vUZaF+IU+/LxVReK3EVERh2B1aiA5wxuFk1efP/1IUaV
	DGocw/POQ3Sm8/LhXl/l34CvIl4YM6yv3asd2FBNASuKXRO56arTyCXk8izOCAaVFUAq9d24RFu9r
	Ys6Z8zuNcsISFOSATR+C/Nmh+UbHEc//KXU++mu67N4GRGV5i2L8s9L4KXgK4E0Qb8B1+oilZ0iFq
	HhnSl2gw==;
Received: from mail-oa1-x4a.google.com ([2001:4860:4864:20::4a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qUK7t-007HYS-1d
	for linux-riscv@lists.infradead.org;
	Fri, 11 Aug 2023 04:51:57 +0000
Received: by mail-oa1-x4a.google.com with SMTP id 586e51a60fabf-1c0e84a8032so1459626fac.2
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 21:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691729504; x=1692334304;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OIa9YyTqwhNrd4vOTw3RHcrRyaG5nOQ7ik48y43Y4K8=;
        b=svuT6WkKlP0CJcBY9yHu6f0ZIVXj+TBAwFC4vkyG4qte4KX/hQhTloOdeOotpgH1+T
         DXpyYVGUloxDx92v1VAZ665bF3PzFTvuogex9H+ez+4kOcSEs1NpPoKrr5j/QVd2rwl6
         g2f9NRZm1/rbKvT/4R6+hin2d0V69Zt6Nx474DYbJlUKYFarceVSUjKNMNT4xaVAyiPS
         urZw2SxeG19jsWZAnALLEXkBB/2p9q8lAuwOxHwws4YfL9owdTZpPTLkoayBgxmdvQOR
         pgBNB6+4Kx/FfI/gTiUIZ6F5vL9QrNKLOP24qyMOVlYGOsPi0f18WfZOnb7/7uRUapaO
         9pDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691729504; x=1692334304;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OIa9YyTqwhNrd4vOTw3RHcrRyaG5nOQ7ik48y43Y4K8=;
        b=e5e0biW/Cx8fcWWknNs0eMc2H7T8lR+bLdXTUMdvhg4nOKzh+JraUjmNUWBgzJT2vV
         EjB5YDU9ZUkv4pgQ501oQ+F+jeJbGQr++J17kR9++Tt3bVQT3NUHdehqoTcpWaLC1K8z
         MlfHcgCLlr8YVLjP9czmyh3ZcejMstgVyGqkQ2aklb/0T0BKXePawQva0zGPHfWH64a8
         0xitq2ld02qXMGHRc1SRAW2AvCAcNw/El8DJKFcNMv9gYDZJRPq34Jzh8uYOHXszoYR6
         deP6RxdA3q6PaXlDBd0Oz0ShnFUn6X+SembjalzEiY4QqE1SsWYcZ6fbDdEWh9EwgsDx
         9pvA==
X-Gm-Message-State: AOJu0YzqyaN5Ok6VNavpEsYPHPAiYySXbUPdSiWTr53YOfbhR9w7Hjgl
	IB671k9I2V7yHji5B10fmnXp95teZjP9
X-Google-Smtp-Source: AGHT+IESE8XY2qQ2H+qcMtIVXtwq5XJmfXR57n+CPxM8RC3XV+4+ZlJZGDmVohMH8Hvnfx7qNufXK5PRnARF
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a05:6870:8c32:b0:1bb:7b48:32ab with SMTP
 id ec50-20020a0568708c3200b001bb7b4832abmr11929oab.7.1691729504052; Thu, 10
 Aug 2023 21:51:44 -0700 (PDT)
Date: Fri, 11 Aug 2023 04:51:21 +0000
In-Reply-To: <20230811045127.3308641-1-rananta@google.com>
Mime-Version: 1.0
References: <20230811045127.3308641-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230811045127.3308641-9-rananta@google.com>
Subject: [PATCH v9 08/14] arm64: tlb: Implement __flush_s2_tlb_range_op()
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
	kvm@vger.kernel.org, Shaoqin Huang <shahuang@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230811_055153_695057_537FE3E8 
X-CRM114-Status: UNSURE (   6.46  )
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

Define __flush_s2_tlb_range_op(), as a wrapper over
__flush_tlb_range_op(), for stage-2 specific range-based TLBI
operations that doesn't necessarily have to deal with 'asid'
and 'tlbi_user' arguments.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
---
 arch/arm64/include/asm/tlbflush.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index b9475a852d5be..93f4b397f9a12 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -340,6 +340,9 @@ do {									\
 	}								\
 } while (0)
 
+#define __flush_s2_tlb_range_op(op, start, pages, stride, tlb_level) \
+	__flush_tlb_range_op(op, start, pages, stride, 0, tlb_level, false)
+
 static inline void __flush_tlb_range(struct vm_area_struct *vma,
 				     unsigned long start, unsigned long end,
 				     unsigned long stride, bool last_level,
-- 
2.41.0.640.ga95def55d0-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
