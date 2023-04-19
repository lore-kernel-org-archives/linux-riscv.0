Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 996BEC77B75
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 23:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5DEGGnAtZ4FcKGGIjBrH7ur91iScjY3HGz88dWc5tyA=; b=dBX6rz7lVyzDNC
	7c/dRIk5CAf4aGX0UEAKfmJL6o4h6hVgG5LUMFGnRYjdYaOLDOZHzU3s/oBtPc/SNf9i/J26fldDx
	VQSQHM74BoQerHkhG1vBPxdaG7U9JCuJxRyWtNx4mixaCuY1kj+q+qo5vv+yOPl7WJv/DXupl57sq
	rHJsmos200a/5NtnsUzSU3ciDppQjn4JinVsrnkf4wfGeuX5W+4mzptuOyV4OrNvpTT+xaAINs8gc
	FnwAoBLUvcYOBbdd8wu01nljB3zdUfGXaZTXRFIjxRfsuuZkoNCmXvuwHJ6sWF6UGJ5AB4YvKU0H8
	8k9HnKI6CeIDiHfvP+GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppHG8-006eXv-2G;
	Wed, 19 Apr 2023 23:30:44 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG8N-006TLQ-0z
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:18:42 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-63b7096e2e4so377285b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942716; x=1684534716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1210zPiD8zHFMhzBINzpx5nEW8Eoe5MAD0zhuCIRKc=;
        b=ANhU+J8nQWq2obESgBEJE0X9NLT82kBUBDzc1BRbSeZ1EgPeiOl0GddoyWaEPDRU8N
         vnwjEIo0UjaS9xezvAc/UGttMWlJo7ew/iqSZCawFdCpXkbeL6whYMnxnv1UE0Mkzjl9
         zxU19X9QWwNQwOpt5WP+CxQUT1ZA3xUcznURR03bnG+WcdbBRPDMOVkCCCi+rkT0f8qL
         85oGYhbbNz2xb1HJWq0YwM9QGXFDFKbWMgSuumHQ7xfEhCPnY/6ETL+ra68ruaG7yl2u
         qOhetkOJdoWKqEsNNxd/aiUVnUUF2SqhhyrAmB8w+eSk+hd8cQeWPbuaUf1XaZLgT9mw
         WXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942716; x=1684534716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1210zPiD8zHFMhzBINzpx5nEW8Eoe5MAD0zhuCIRKc=;
        b=bZvfW1QfzIjjqH2QtPCrZr64S4o6bQVtk1wYMancBdyJqNceUgR/J3dnDLGZHielSs
         mlR6rJ7GIbqFsZAyfL6tq73zR/ACI0FhMCd7eLDWdHsm4mFHI1EhhOg1tv/OdgSWzUsF
         xI24dUBwIikDNpKuwbsFIWw9P3DI6gsB7zBvpyiLO085zR3RiDKllZg3snb4ZnMIPSLJ
         hundfSZJ6mspSASMJdJsxIKe6UNgjzZCcqSDeQUIrNNupGEneVrhWVFW8gZ7xY+veA7q
         9/Au3WmRtLRQakTI0VlRz5Jp/z/t/J3KzjQX19TpVozpMek/rbGJY7Y6n5RWu77Tr5N6
         5zMw==
X-Gm-Message-State: AAQBX9eK9F66qYb5O75NzOyL05YCifzMGx/nZD0nEWR5UyfxAmRTqGhK
	w5M0M5Q6S9/o7KtfNDgQChbwVw==
X-Google-Smtp-Source: AKy350YnFYoQc/AGMgRzA7K3To1EBVIiHBUS1P/8MWh29k47wvhKo2iefk2kUhAwoVQIoToGy+/bcA==
X-Received: by 2002:a17:903:1c4:b0:1a1:ee8c:eeba with SMTP id e4-20020a17090301c400b001a1ee8ceebamr7881066plh.59.1681942715856;
        Wed, 19 Apr 2023 15:18:35 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:18:35 -0700 (PDT)
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
Subject: [RFC 30/48] RISC-V: KVM: Perform limited operations in hardware enable/disable
Date: Wed, 19 Apr 2023 15:16:58 -0700
Message-Id: <20230419221716.3603068-31-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_151839_342521_E415E331 
X-CRM114-Status: GOOD (  14.79  )
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

Hardware enable/disable path only need to perform AIA/NACL enable/disable
for TVMs. All other operations i.e. interrupt/exception delegation,
counter access must be provided by the TSM as host doesn't have control
of these operations for a TVM.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/main.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 45ee62d..842b78d 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -13,6 +13,7 @@
 #include <asm/hwcap.h>
 #include <asm/kvm_nacl.h>
 #include <asm/sbi.h>
+#include <asm/kvm_cove.h>
 
 long kvm_arch_dev_ioctl(struct file *filp,
 			unsigned int ioctl, unsigned long arg)
@@ -29,6 +30,15 @@ int kvm_arch_hardware_enable(void)
 	if (rc)
 		return rc;
 
+	/*
+	 * We just need to invoke aia enable for CoVE if host is in VS mode
+	 * However, if the host is running in HS mode, we need to initialize
+	 * other CSRs as well for legacy VMs.
+	 * TODO: Handle host in HS mode use case.
+	 */
+	if (unlikely(kvm_riscv_cove_enabled()))
+		goto enable_aia;
+
 	hedeleg = 0;
 	hedeleg |= (1UL << EXC_INST_MISALIGNED);
 	hedeleg |= (1UL << EXC_BREAKPOINT);
@@ -49,6 +59,7 @@ int kvm_arch_hardware_enable(void)
 
 	csr_write(CSR_HVIP, 0);
 
+enable_aia:
 	kvm_riscv_aia_enable();
 
 	return 0;
@@ -58,6 +69,8 @@ void kvm_arch_hardware_disable(void)
 {
 	kvm_riscv_aia_disable();
 
+	if (unlikely(kvm_riscv_cove_enabled()))
+		goto disable_nacl;
 	/*
 	 * After clearing the hideleg CSR, the host kernel will receive
 	 * spurious interrupts if hvip CSR has pending interrupts and the
@@ -69,6 +82,7 @@ void kvm_arch_hardware_disable(void)
 	csr_write(CSR_HEDELEG, 0);
 	csr_write(CSR_HIDELEG, 0);
 
+disable_nacl:
 	kvm_riscv_nacl_disable();
 }
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
