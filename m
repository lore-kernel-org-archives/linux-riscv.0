Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06645C77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 23:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fkqc50KTMOKsKBZFu+bvlqGVWqFEICqNJSr5Cpzj9wQ=; b=ZZsSLDGbngaF2c
	ulMpf2ZSkU/ly5q1nGTOBFHN+N3Lrwi97qpSToA/imVOqMraWgBk4SqeKn4LVUUB4vpdDFmhVAgkD
	1CRaOKzLUE6IEjfsVwUaOkBoyXO1VUbsoDvj6WddFwgBcM+hXX+P/MrIRAuEutK2TzOHRNJw05Ldq
	qMcyGfdX1ZODYYJbrOWCsqlsYlwyLpeS/+ilXaDz2mPBntIQKXvnuznB6ksabhtFKOvM0LpQmCY4+
	rYs9PU7pOrXYHSsQWxQNepfEVooHPW8s6l/mcij8/L9M1V/+eJYxoXhSxwoVs9dU/2Zbqko6rH3KB
	yoAzFu8dUxTCrorCfkuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppHG4-006eTe-1w;
	Wed, 19 Apr 2023 23:30:40 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG7M-006So6-2y
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:17:41 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1a516fb6523so5305055ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942654; x=1684534654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TviUiXCC6v39lMS4rfPLGE9Pfx0aaxYAF0PLkJZJ+44=;
        b=fw3FXTdDZVAQaqNcpqxhJ5jCbeJxZbbRCeUP7dUA0xboMzGhByaEInJPZwYw9bXQXk
         ARHWS0qP1pZrTXclentFqb6h5U2ua9sUZm6vZcXmwvDFczjrVihV2Nra1Jc2/WF5XyU2
         0JadbkEFEI0//guHLR6qxF3JNYLlwaQIZD991cfubV5PenBiFCNtb6hgKaPgRSq66vCg
         e+VFqjLE6civs190GuIRI3K+ZsW+0KEkHzSOhGggkx8qfJ2wZO5KlkmScX+zwalNjqk6
         RuMOo25mdsFietap8z25HKARP1geAiwoigenSaj60oBOp8w+6PxBWZ/NPdxHu1rx5LuB
         U5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942654; x=1684534654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TviUiXCC6v39lMS4rfPLGE9Pfx0aaxYAF0PLkJZJ+44=;
        b=leBLlvvX3eXBJF2wl5SPtWuNz1yghx4kW+klsQQKKLylK3JEklkURBj215pNaX/hMD
         8fFCQA+NgxNyU3/y4rIuYB6iVWCFmW5c7VZHadIaXKI5WhpewuZ6/5npUa1zEfrPZDqL
         tKa0+oslR35X38j2JFJX31eEF9sJD8uo9ObT/9k/2zi0APzeOdN/bQTGyQUseVXtIMsi
         yljU9L5RwWOF6DVUmMmbLo+vJOfbI/jbwXw8W0kU0j7EYaZnCECcFqOuyospFjU60GWM
         6jZAx3eZOu3tULTei4p2l4VFFg2pTQSItUFskH4v5gSJXGQo4MJsbT5u1XGPsfoqAF6m
         xpJQ==
X-Gm-Message-State: AAQBX9ddBNuoeewE4PEq/loc1+6fM32p7ZxTeDxtLiCw2nUFCP6XOkz4
	Dpr+SscS2tn3ry/9bNjd4rhTzw==
X-Google-Smtp-Source: AKy350bx72vsD2gx/qhvw+4gm1lk9ECFZlAAwd4+tDv5bxVSjJh5w7Co6h0FkmAoPJamfBpYhAs0yQ==
X-Received: by 2002:a17:902:e80a:b0:1a1:cc5a:b04 with SMTP id u10-20020a170902e80a00b001a1cc5a0b04mr8122719plg.3.1681942654045;
        Wed, 19 Apr 2023 15:17:34 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:17:33 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 02/48] RISC-V: KVM: Improve KVM error reporting to the user space
Date: Wed, 19 Apr 2023 15:16:30 -0700
Message-Id: <20230419221716.3603068-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_151737_035707_B1B3E0D3 
X-CRM114-Status: GOOD (  12.54  )
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

This patch adds RISC-V specific cause for ioctl run failure.
For now, it will be used for the below two cases:

1. Insufficient IMSIC files if VM is configured to run in HWACCEL mode
2. TSM is unable to run run_vcpu SBI call for TVMs

KVM also uses a custom scause bit(48) to distinguish this case
from regular vcpu exit causes.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr.h      | 2 ++
 arch/riscv/include/uapi/asm/kvm.h | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 3176355..e78503a 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -96,6 +96,8 @@
 #define EXC_VIRTUAL_INST_FAULT		22
 #define EXC_STORE_GUEST_PAGE_FAULT	23
 
+#define EXC_CUSTOM_KVM_COVE_RUN_FAIL	48
+
 /* PMP configuration */
 #define PMP_R			0x01
 #define PMP_W			0x02
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index b41d0e7..11440df 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -245,6 +245,10 @@ enum KVM_RISCV_SBI_EXT_ID {
 /* One single KVM irqchip, ie. the AIA */
 #define KVM_NR_IRQCHIPS			1
 
+/* run->fail_entry.hardware_entry_failure_reason codes. */
+#define KVM_EXIT_FAIL_ENTRY_IMSIC_FILE_UNAVAILABLE (1ULL << 0)
+#define KVM_EXIT_FAIL_ENTRY_COVE_RUN_VCPU          (1ULL << 1)
+
 #endif
 
 #endif /* __LINUX_KVM_RISCV_H */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
