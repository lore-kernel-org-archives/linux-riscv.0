Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B2FC77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g8ornIrHn5J6cNC8xlH/VOJtkecEu5DXfhTejjMPyLg=; b=bIoS5fu4cZ0Gn3
	wxtPTcRLKMiAnC78khoFvNL/Q3OEJ7ZDB4d7Pu/q9sV9gHl0E4kHJCuhRRCv6dfOJhJajZg8L8JOy
	uIe/31/051+eq5gyLNkLisLhGvwbqAuBle5K32ptcIUFmO6h+yxKD5FxFLzSUyC3rJ3COetjpnocL
	1/zOmsImL/kWSy5llKvAzqnR2tGrvWu7zR7wIbAWNTBBxbrGpl7VLbgO/95FtNTP3OY3XlGTDR+ll
	zGvUTAqKrcWvpH5+GZRWw8CuynuQhXlvBFwF9S/t/zHu8u/OB/pLcTZrLDu+E1dG9W8Zj8enKkuZy
	azxUXV/yQmNSt0MaeqZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsWj-0000000AEZV-3zyj;
	Wed, 18 Jun 2025 13:08:29 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRr59-00000009xeb-1vCD
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 11:35:56 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-235ef62066eso103164455ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 04:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750246555; x=1750851355; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKQfZHKenjLPRqEIi0Ln2Cx1EmVsnnUE8sKaMZB78eg=;
        b=E8bP/IXvHVZltbcCQpMU+FeIcQfT7ze8RrES9xk+VtBWtRBfl+oR9Zvr4fCujEIWYx
         7O3YYCPqp6/yKj/qWQ3kNOI92t5qHm0UkaMv6THMG7QG4/qui2vcYbEvRJUHO6fNXaWV
         2a68mQW4s9vzW2sSZkjvXGWth23x/PQGRKTufFQSC8X423IhH5jD1FhjzQ9NYjxphffL
         smXsZNQ6LsAJGv2cQZzBpAwjNgTj0BG0ZehaklNSN1CltMmRiHhYTJby7LFHsihUW8M4
         m3QKxVETTIOZ2xf6xXAse7KjGByHEPUEEUCNNBH+zO5Z9QLw9sgr5uU+ZbD90MZiBTap
         zqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246555; x=1750851355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bKQfZHKenjLPRqEIi0Ln2Cx1EmVsnnUE8sKaMZB78eg=;
        b=iJQh/9M+WloGepe6+qppNimzAa5G/2hmnlPUz5v27lqS7qbjdQTxIFsYfSrmEhP6jJ
         sKF977v9S4DkPlhUYrLI+AseEQ4wM90WEZ35+ZAWxxRwN8M7Dh2OS8kw6eD4JBIeWIDv
         2XHQPNU71Dm82QkoL30KHS2GAGcysXAIuGGPLux4+jh6aq2DV+RCgI66JVcqOOOLosYn
         FofcxtiouYeWwF+eYkTDPeNGaj4fOSPVIQD70gCv/Y/y3bXNj9oftq/ZNcJqUD1Y1n4V
         9aS7wNBeAhbe48EQZfM6UXbGSd3Vxz4X6Bmtl2pjC323IxLve9y8+JWnLwJEBM9VcILl
         Ytxg==
X-Forwarded-Encrypted: i=1; AJvYcCVacMR2WUocC5eYzotxFLDxhJPOTDL2XKNj6S/GxR2NLbQcaQtkzyLNOPzflCbqFhADrVa5sHDH9nkX2Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWyaiY1WT5474SC/5/asvs+tPZOWSSaFJqrcr2P1My7tBbxgcz
	hH49fJyjTRdm7VjbM9+mIXWSgYhseFuB7vTKeOKDinHc4DzbyrOKqNaIRjdK2E6PM+k=
X-Gm-Gg: ASbGncvhjbQ2FC94IzTzrqOm68ufjY+wlRwoG7YFASVQ6rDtPtIJuIBQ1Apmn4PodUG
	MLFpi5dv31UcG6hz8xI1tDmd0jPeBj0XlkJM/u+9P1/4z0zQ8T9nUGyVsFK6D5hsiSub39vJXDX
	IVq4Br1dwTvlZYwpm4lJwXbBRYDiH3awBIeLDRna4w6ugVo2IH8dK5jQEI3p6LfG4ZvdjYSq9kF
	cDEDWkU3XcZtDvDZ5gh4EKVlNAkOfPR1VABJQJ5kRx/6j+84oOVMH3gDJi4YiUwGiGVqanzfzkm
	/BEBrL9vktZhbx0epqcj24eNdP0LNtq0eRMGBlI3JnITCvQINjy3iF3JX5F3I91m0RTSc/K4lv4
	kwDSBBYr80iNbP9XhRQ==
X-Google-Smtp-Source: AGHT+IGDxSM7ATGEf8luR6FsHBoP9Rz03O76JFYYcytYYgv6CqHzBB2u3MegIdGDixYFe2vIN2X5yg==
X-Received: by 2002:a17:902:dad1:b0:235:e9fe:83c0 with SMTP id d9443c01a7336-2366b3de5damr236240735ad.27.1750246554649;
        Wed, 18 Jun 2025 04:35:54 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237c57c63efsm9112475ad.172.2025.06.18.04.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:35:53 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>
Subject: [PATCH v3 02/12] RISC-V: KVM: Drop the return value of kvm_riscv_vcpu_aia_init()
Date: Wed, 18 Jun 2025 17:05:22 +0530
Message-ID: <20250618113532.471448-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618113532.471448-1-apatel@ventanamicro.com>
References: <20250618113532.471448-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_043555_496752_C9D5A921 
X-CRM114-Status: GOOD (  11.22  )
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

The kvm_riscv_vcpu_aia_init() does not return any failure so drop
the return value which is always zero.

Reviewed-by: Nutty Liu<liujingqi@lanxincomputing.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_aia.h | 2 +-
 arch/riscv/kvm/aia_device.c      | 6 ++----
 arch/riscv/kvm/vcpu.c            | 4 +---
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
index 3b643b9efc07..0a0f12496f00 100644
--- a/arch/riscv/include/asm/kvm_aia.h
+++ b/arch/riscv/include/asm/kvm_aia.h
@@ -147,7 +147,7 @@ int kvm_riscv_vcpu_aia_rmw_ireg(struct kvm_vcpu *vcpu, unsigned int csr_num,
 
 int kvm_riscv_vcpu_aia_update(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_aia_reset(struct kvm_vcpu *vcpu);
-int kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_aia_deinit(struct kvm_vcpu *vcpu);
 
 int kvm_riscv_aia_inject_msi_by_id(struct kvm *kvm, u32 hart_index,
diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index 806c41931cde..b195a93add1c 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -509,12 +509,12 @@ void kvm_riscv_vcpu_aia_reset(struct kvm_vcpu *vcpu)
 	kvm_riscv_vcpu_aia_imsic_reset(vcpu);
 }
 
-int kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu)
+void kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vcpu_aia *vaia = &vcpu->arch.aia_context;
 
 	if (!kvm_riscv_aia_available())
-		return 0;
+		return;
 
 	/*
 	 * We don't do any memory allocations over here because these
@@ -526,8 +526,6 @@ int kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu)
 	/* Initialize default values in AIA vcpu context */
 	vaia->imsic_addr = KVM_RISCV_AIA_UNDEF_ADDR;
 	vaia->hart_index = vcpu->vcpu_idx;
-
-	return 0;
 }
 
 void kvm_riscv_vcpu_aia_deinit(struct kvm_vcpu *vcpu)
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index b467dc1f4c7f..f9fb3dbbe0c3 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -159,9 +159,7 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	kvm_riscv_vcpu_pmu_init(vcpu);
 
 	/* Setup VCPU AIA */
-	rc = kvm_riscv_vcpu_aia_init(vcpu);
-	if (rc)
-		return rc;
+	kvm_riscv_vcpu_aia_init(vcpu);
 
 	/*
 	 * Setup SBI extensions
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
