Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47221C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Mar 2022 07:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1yTCdHGVWDOaMxRow+qRAPMn5nEs4ZM5ohgALMncLco=; b=XiH3tuP5VEmAvo
	PpCFp7CaGiEmre1SBlWWUmo9voqhQEwptzdbEoy0iwWVSTaNa4t8cDK3eMSkoEJanlXZh3u/DVWiB
	h0xadB86Y4oKrRJJshKcCUcYOQBucDl41HJztIb7AZu4P+02g1GOzBP5P/w+RtUvcz6LVJsDXWH1a
	ZA74+162EsTCgwB/0/ljHtShNp4kqyRupL3sbYYoy7Bnvq5NQXxGV7el7GbFloiCXgOuBDo1FKHwi
	zJqMN69Aa5YPtgpU7Cn1KYkqL10OWFIQ8KNka9yvmWlqLgWO2WnCgsvcXVhEol42ss/BZkcAMI0l/
	ejo+9J7xQlq7qjvHIPZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ6IK-00BK7w-Hz; Tue, 29 Mar 2022 07:29:36 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ6IH-00BK4F-IL
 for linux-riscv@lists.infradead.org; Tue, 29 Mar 2022 07:29:35 +0000
Received: by mail-pl1-x635.google.com with SMTP id y6so14328468plg.2
 for <linux-riscv@lists.infradead.org>; Tue, 29 Mar 2022 00:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ppNdA/FhRD9g5++0K+Ya9WXyfU57mPy49sftAdzbp8w=;
 b=gcxsu0qkGm5afdR5CecI5Kj8Oz6i3fcQWabAOBtFVeKspQqMZnaPQbPXsIka/7QqWP
 9OQkwOZjEs6rHriQ+9z/OPi20q/Ls2Pux0FjbNwIgCvCXXYtnsgC8xiERCIKs3aauJZq
 2SkeykXVA4WYN1kV0ltpa77beaHtqiG9ZyqBK7s8kixX9iZxBVWaN9lKrwl2GqZmtUiU
 PjadOpN8iLSAn/qFU3U+L3zUGR+Q1cix9aqfgtreFrCpzQbxt772CqygJoxK1ysRSwVr
 h1bYIcV2FfMvpzAAkgIhlfwE/JWw3yyDlBi1bjfO7AdG8Ajtx8PEIbh/4N7Bjshf2yVa
 pheg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ppNdA/FhRD9g5++0K+Ya9WXyfU57mPy49sftAdzbp8w=;
 b=MEihnKs3iXVJlbUz9EZRYcP6dZiTBUIlQ0bKrF+ZKDapUB9NIybptHwXfGzFgv5Zk/
 kTn1cT3NUXTjkTp1+SB6FKigDPgN8DfBjQJTBdRmbBoBxBYqp1DLHf59We9+Fd8L1QDl
 Ps2ya3gxCupyDciclHfAJs5tZ5lL7n/fsMEW9mPYP5JoEGUzoNYWZcoS2ZCTGY16L3lh
 4Yp3S//Kz5uyUPLuvwpoXqbG/26KBE3RkVWW3iMNfgu29P4FBce/cq2S2e0l9cKSAUpy
 T4RkfRSnn/oDxK5oy+90LByC6TnsVizg2xGzyXLn8BiuEyAnXJEHEF3Nrs7HqYUIVs5I
 Ispg==
X-Gm-Message-State: AOAM530cSyIfCj2XetboWV85H2czJyE6a2wmAEI7vl5dHJ5oSW84/G9x
 TKtNwV7WovQjyZPf6twKs4YWFw==
X-Google-Smtp-Source: ABdhPJy2ncza1YsBMMpe2gT2oc1Mdzb1vOn0BTJCkEqLNqVWhS3Cu0hZ6v8Sf5pye4QquhPixMb92w==
X-Received: by 2002:a17:90b:4b83:b0:1c9:6d37:38b7 with SMTP id
 lr3-20020a17090b4b8300b001c96d3738b7mr3124696pjb.21.1648538972341; 
 Tue, 29 Mar 2022 00:29:32 -0700 (PDT)
Received: from localhost.localdomain ([122.171.166.231])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a056a00240600b004e17ab23340sm19440564pfh.177.2022.03.29.00.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 00:29:31 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 1/3] KVM: selftests: riscv: Set PTE A and D bits in VS-stage
 page table
Date: Tue, 29 Mar 2022 12:59:09 +0530
Message-Id: <20220329072911.1692766-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220329072911.1692766-1-apatel@ventanamicro.com>
References: <20220329072911.1692766-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_002933_655547_423CB7D8 
X-CRM114-Status: GOOD (  12.57  )
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

Supporting hardware updates of PTE A and D bits is optional for any
RISC-V implementation so current software strategy is to always set
these bits in both G-stage (hypervisor) and VS-stage (guest kernel).

If PTE A and D bits are not set by software (hypervisor or guest)
then RISC-V implementations not supporting hardware updates of these
bits will cause traps even for perfectly valid PTEs.

Based on above explanation, the VS-stage page table created by various
KVM selftest applications is not correct because PTE A and D bits are
not set. This patch fixes VS-stage page table programming of PTE A and
D bits for KVM selftests.

Fixes: 3e06cdf10520 ("KVM: selftests: Add initial support for RISC-V
64-bit")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 tools/testing/selftests/kvm/include/riscv/processor.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index dc284c6bdbc3..eca5c622efd2 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -101,7 +101,9 @@ static inline void set_reg(struct kvm_vm *vm, uint32_t vcpuid, uint64_t id,
 #define PGTBL_PTE_WRITE_SHIFT			2
 #define PGTBL_PTE_READ_MASK			0x0000000000000002ULL
 #define PGTBL_PTE_READ_SHIFT			1
-#define PGTBL_PTE_PERM_MASK			(PGTBL_PTE_EXECUTE_MASK | \
+#define PGTBL_PTE_PERM_MASK			(PGTBL_PTE_ACCESSED_MASK | \
+						 PGTBL_PTE_DIRTY_MASK | \
+						 PGTBL_PTE_EXECUTE_MASK | \
 						 PGTBL_PTE_WRITE_MASK | \
 						 PGTBL_PTE_READ_MASK)
 #define PGTBL_PTE_VALID_MASK			0x0000000000000001ULL
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
