Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF40AC04A94
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 23:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pVMDbBaaRGyavkypgesKT8yAo/Z1XBlrGtvr8xSO/00=; b=ad/d5T6TJBGcI2iOWVdD6iVr1c
	YPZ7zOIMhR0HYxgZO9+2unmZuEaRXyjSG8+pUdCmHmx11jMNMnHJ/S+V86lxrq5E9i+PobhX+7c7J
	RrkRHZBdEZfndLlh2kUFOTPjQcvVAH6qr9ZUmN0SK1M6RKfyRZrDL2ZJP9VEDVLDmo4Nq5UcXQEEX
	loc01k2ygIJktszii1jF8bpD++CU6iT404LqNKVe1kDqHPgbnykjSprqH3Le3f2oXcw5ytHfspinb
	HlS8+wtjikSR4X04VW7AZZieTASSYDgrjg72YXJicUfqbjicgR9SUnVXOIPIXexs6fwQHiII1JhjB
	3VVyQpuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTVtl-003dO9-17;
	Tue, 08 Aug 2023 23:13:57 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTVtY-003d9g-37
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 23:13:47 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-d4ddbcbbaacso2554206276.1
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 16:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1691536423; x=1692141223;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8aS9+bqGGIGJd4osXg0UNYpwpvIxhiWvvz+QMPQ0Ulo=;
        b=r5BfuQMefAg0Tnr2FQaEIivjC4JzNAMuw4qxGVtci6+U9djSIpA11Hdl+rJc6en91J
         y/h+YDs0QAA5xFNhoGQE0fza9XyovVTAf2+ZIQj9pZdiciK8WN7z5vHDkRS5bze2JrvX
         1Pi0zGoodsu607T4DyfgYeotzEFP9OFg33WWk/J6RT4OzDi2b1Fi3JqRQ6HpyZZ+gywn
         +UZCzVUhZNvWuqdnzNxXM4bRsJeE1eSS8tnxOTUMx2/t6MN7k2idS2QWNmkVWa/w66NG
         yQ/AVA1aDJm/DL0O+01cjluCupsA1erg2PPaJFd5MY5BuRKvpf3vdiz+yo1bLlWRTbiY
         xCRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691536423; x=1692141223;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8aS9+bqGGIGJd4osXg0UNYpwpvIxhiWvvz+QMPQ0Ulo=;
        b=TsB/CNtH6Y4+MVMccd9jf+JHtyAmfzNeOXUiTKV+/VWSxeG7smRd7hK0QlJQgV+Z6x
         z751RsCiQpKg/DQUtZ43FWADpJe5Vgvs751s/3kHH9DTI+1BWeaqTziK2b1tfJ3L8e8T
         1TnedbfRvCHFoyXZkjdBsQJTpk7L6RGOC6cdcqIHFhxPDPlVe33P93iNdYeSLvLaJcrf
         KogL8diKxCy+i9dQFjGmPwzMs7KlZPOaIgkw9dvA+fyG7E6mNHrd9lElyDSL81hPvNIc
         P97eeQxqmM0fIzD37xSBLX75ZdDIQSGOOT/VUtWFoyg190iPndyCMvJrqrDyAkxhsHuB
         bbLA==
X-Gm-Message-State: AOJu0YzKroBu9aU+CDrSO7xVUOIgCpGKf9dX2PCeAPcjrcSgv7L9zbtF
	UhAUuVTEHgxMZQKZaNhsB7jS2rehT56g
X-Google-Smtp-Source: AGHT+IGN6Wyp+xgEmWlEdpiyTqEz05f+ph0g541H8xJPxC5yzYpq7Xwg2KskI5Za7Uo8sgiAN3njNrOwDHIy
X-Received: from rananta-linux.c.googlers.com ([fda3:e722:ac3:cc00:2b:ff92:c0a8:22b5])
 (user=rananta job=sendgmr) by 2002:a5b:890:0:b0:d10:dd00:385 with SMTP id
 e16-20020a5b0890000000b00d10dd000385mr25024ybq.0.1691536423557; Tue, 08 Aug
 2023 16:13:43 -0700 (PDT)
Date: Tue,  8 Aug 2023 23:13:24 +0000
In-Reply-To: <20230808231330.3855936-1-rananta@google.com>
Mime-Version: 1.0
References: <20230808231330.3855936-1-rananta@google.com>
X-Mailer: git-send-email 2.41.0.640.ga95def55d0-goog
Message-ID: <20230808231330.3855936-9-rananta@google.com>
Subject: [PATCH v8 08/14] arm64: tlb: Implement __flush_s2_tlb_range_op()
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
	kvm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_161345_039812_EA697401 
X-CRM114-Status: UNSURE (   7.35  )
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
