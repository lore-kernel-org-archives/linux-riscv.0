Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BBD4C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 11:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lj/0xIHeuEDcmWGFGW8LAK3p5RYb677Er2Lo15CbZ1I=; b=fsczPAOdeT1P44
	XOf4bXvhAIV9ctZoXtQUu4Lf8sD7IVtCY5iM5gsQHsUCj2kbCRAcdlPj2RCIaIvZtJMHIMw8vLGO3
	TuXUo7A8K061e5dLieJiGxq1EboWJo4of6jb/NQOBB6W62+LG3lwhIB1GTTd3AomgncFF9Ajksgk4
	XWBmTT2aGqLPCpHKQyiRK8gwvnF+jpiYM9p8XCBzzpBtue7stFZy2PnXF9hKpjs5ByjuNGmfd2ko9
	3MF+c9aJoXBf24RDCtSOEs1ogF9sNpLn8OjArRWZUP3tiTe7QH6glv6Q0j+njEkULHpmvMXWiToT2
	1UCjFyL4KiMQZCBirIpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nh8SR-008kd5-QO; Wed, 20 Apr 2022 11:25:15 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nh8SN-008kaC-G9
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 11:25:12 +0000
Received: by mail-pf1-x42e.google.com with SMTP id p8so1644313pfh.8
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 04:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TPHPVEhymfv8oSdQwn6KZ7VGPONNXumfRuRVQxny474=;
 b=PAgsii84VgeZ/Q2oKSCovvB872ig347wVkn4dZtpPKF7+4mn6c/HRZpP4/hStmf1ys
 T7LVGobfgoMFGbYfMGlLNiU26A0EjUVf7TBM1D4uUq8fUtnZ7cGJDBOhnPhnxVllcU8U
 45QLawAPuR++SGIfj0ocQyV259l2+NhuJ5HUKagx4sBBd2EvxtvxNxR+DY6De8T70+Nm
 6+e4rDRHYm1u7+Kyw8yrA9DiCG3qz+3E2IkIalzQRqz+h+p+YsbhfLjtzAEZK7UCPTAo
 AyQItG5Wqq3QpZIHx5QTwdpHWc6XZ0Z120bW/WuYMO2Jq04oY8moZuS6TiTrIoE+dyvb
 KP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TPHPVEhymfv8oSdQwn6KZ7VGPONNXumfRuRVQxny474=;
 b=cgCY7mmIn72Gl9AtiT/MddKkbXtnDefwKYkT5Ce/tphmH4asH5phx0Xv1iZ1WvRBLQ
 lFaBEeYAQrFF1G2QkNkpZFPKV1dapdnbjGPWnxzfFb+yZOxiMnYcLYejwxDAfZ93pVku
 zuPJI8PBmF4reDhBMvLnRh5JKeuEpIIua9KSaNpyGVw1rkY0X5O7iagXBjLwhU5zK48T
 f2KcALpEw1zoAJyKtqtY6i8be+DkcX3XUrzgugjOiUOkLPXgMgOWU3ZcGax8MYCGillV
 ZK+7Ix+ejfl5IPUItoRXAXxLEycrl9Y7SNgqkVQ8yLiAeRCM9yLWyFhuqZ0/EQalGKJT
 bjkA==
X-Gm-Message-State: AOAM533nBjN71/PElIF15uPTVpe0kL2ODKlJplXnhuuGfu+YGxoHpjpC
 LwfjOU6wk/sOUZrrsEgz1tmM9A==
X-Google-Smtp-Source: ABdhPJzJy+ngC76UER8GeFIwNmkd0eADoMpR8Xk4oDzv3I0PBEHDsejwpsx1pE0ajWmahbSPcXwk3g==
X-Received: by 2002:a05:6a00:9a2:b0:505:974f:9fd6 with SMTP id
 u34-20020a056a0009a200b00505974f9fd6mr22641638pfg.12.1650453910832; 
 Wed, 20 Apr 2022 04:25:10 -0700 (PDT)
Received: from localhost.localdomain ([122.167.88.101])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a17090a890c00b001b8efcf8e48sm22529274pjn.14.2022.04.20.04.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 04:25:10 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 2/7] RISC-V: KVM: Add Sv57x4 mode support for G-stage
Date: Wed, 20 Apr 2022 16:54:45 +0530
Message-Id: <20220420112450.155624-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420112450.155624-1-apatel@ventanamicro.com>
References: <20220420112450.155624-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_042511_623241_6A88B8DC 
X-CRM114-Status: GOOD (  12.90  )
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

Latest QEMU supports G-stage Sv57x4 mode so this patch extends KVM
RISC-V G-stage handling to detect and use Sv57x4 mode when available.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/csr.h |  1 +
 arch/riscv/kvm/main.c        |  3 +++
 arch/riscv/kvm/mmu.c         | 11 ++++++++++-
 3 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index e935f27b10fd..cc40521e438b 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -117,6 +117,7 @@
 #define HGATP_MODE_SV32X4	_AC(1, UL)
 #define HGATP_MODE_SV39X4	_AC(8, UL)
 #define HGATP_MODE_SV48X4	_AC(9, UL)
+#define HGATP_MODE_SV57X4	_AC(10, UL)
 
 #define HGATP32_MODE_SHIFT	31
 #define HGATP32_VMID_SHIFT	22
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index c374dad82eee..1549205fe5fe 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -105,6 +105,9 @@ int kvm_arch_init(void *opaque)
 	case HGATP_MODE_SV48X4:
 		str = "Sv48x4";
 		break;
+	case HGATP_MODE_SV57X4:
+		str = "Sv57x4";
+		break;
 	default:
 		return -ENODEV;
 	}
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index dc0520792e31..8823eb32dcde 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -751,14 +751,23 @@ void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu)
 void kvm_riscv_gstage_mode_detect(void)
 {
 #ifdef CONFIG_64BIT
+	/* Try Sv57x4 G-stage mode */
+	csr_write(CSR_HGATP, HGATP_MODE_SV57X4 << HGATP_MODE_SHIFT);
+	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV57X4) {
+		gstage_mode = (HGATP_MODE_SV57X4 << HGATP_MODE_SHIFT);
+		gstage_pgd_levels = 5;
+		goto skip_sv48x4_test;
+	}
+
 	/* Try Sv48x4 G-stage mode */
 	csr_write(CSR_HGATP, HGATP_MODE_SV48X4 << HGATP_MODE_SHIFT);
 	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV48X4) {
 		gstage_mode = (HGATP_MODE_SV48X4 << HGATP_MODE_SHIFT);
 		gstage_pgd_levels = 4;
 	}
-	csr_write(CSR_HGATP, 0);
+skip_sv48x4_test:
 
+	csr_write(CSR_HGATP, 0);
 	__kvm_riscv_hfence_gvma_all();
 #endif
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
