Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A20C2BA4C
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jan 2022 11:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t756EFHcxRp4WtyknbjMHoY+mGCNXk4fH+/XIwuJn3w=; b=hXTrzz5QlKLmkj
	tnx7TwUQivUiXFwhefnV1xHYIm7VsrJ1Hsif7rmRKf6JCFfUX4SJXsoy57HCQjNYmiUkE7FXbLxUi
	FUJkdJtqNGqUkE92VZQUeF0mCYuxYo9ZpndAFSigq2APsDuzLc3VkZD8+hevUjNkatE9e8ff1Sq+a
	cR09a+ekBE52n4N12r7U2c+wDZLJBip2AFsWFk+2IRHmHR3qEBosJgY+PZRpLPE1l8msRwiYoRUN/
	1jA95kWYS19Eqdz9j7WSdcNqud968VePAgIEMkAYQZRXXUOA7WU7JUu0DuPclJ273ewOcoTA/qNVN
	iwOJqrOIrr20fhmAN87w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCgle-00BYbm-CF; Wed, 26 Jan 2022 11:47:14 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCgk4-00BXtE-Un
 for linux-riscv@lists.infradead.org; Wed, 26 Jan 2022 11:45:38 +0000
Received: by mail-pl1-x62f.google.com with SMTP id b15so7592115plg.3
 for <linux-riscv@lists.infradead.org>; Wed, 26 Jan 2022 03:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lyNDT6gMUVd7XADlZEueFFVmp7iqGlnv4um7W4NGQTo=;
 b=X/glJO/YXqUfegb4WPXVEs5tC0FQx5MOWhX8pyx+pqRXQiUOisuqU2dVXA01T5DC9c
 SDfhm5o7uSL9nxx4sr+5SPwCINVjHNsrdr142Jx4eYcd76Zqx8SWFZD8nNPEUvueYkAB
 AP9YiDlNKPWFur9wtrGmfKHrjiV+AYVdXRosdP2jsYeQqGJk/MjG19qyujAC9IltGfvS
 /1CLgmqFazoZ6/GjjdgLOowm5JSzoGLeCOqhMvH4dlfGl0EOVcmxHGz9xKhoBy7sW/5i
 OZ2wETRk1posLrUmU9fPqV17/10aUaaOGkit6zhYSs0CHDlv2NXZ3D7twGJaO6Jw3MY5
 B2Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lyNDT6gMUVd7XADlZEueFFVmp7iqGlnv4um7W4NGQTo=;
 b=b2u/NtRj0uqzp0rC9g1Bl59TCqBL9YOcVUjIiBPp4oVpGsKcywf/e9+wnCkVmYmkie
 kFHeqGRSCgcHI7vBkTHDHIG+sW6kfgVnhwThPSSNzO1RPa75R6CnaXgmy7KuiXqgpqSb
 3s+Zx3aem7j7uK9hsL8PDgZnzq2EXBHIi7opV0N4k+FWx4jq5jH32RooZf8+ITmYWgzY
 QCQ0gApSXQmiQTsHgBFH5Cj+thCODV4D7CH+ELXhfwXhFPzDXHvzrtgaqXtbWTMmBZwx
 kzbAygSX/3NcDEbKGh/uo1UmbsxQsTGxyvEwYnDEVCKXVP3hsfNhtCfxlucK36I02k4Z
 bYiw==
X-Gm-Message-State: AOAM530rb2UN8Em7XgaYfZjVgH2gj2T7v4Ne7x9W0+44wD+ZukO9Xzbt
 aU0v58OGpW50BuoE8ST6dtof/w==
X-Google-Smtp-Source: ABdhPJzar3JqtFOygpsMZMlMib3kuQuQ5BO1QD+6o2GkOnwRAIT8zA+tjj+e5DF9gaRHipW3gQZ1pw==
X-Received: by 2002:a17:90a:c901:: with SMTP id
 v1mr8224362pjt.203.1643197536474; 
 Wed, 26 Jan 2022 03:45:36 -0800 (PST)
Received: from localhost.localdomain ([122.167.221.23])
 by smtp.gmail.com with ESMTPSA id nn2sm2994976pjb.35.2022.01.26.03.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 03:45:35 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>
Cc: Sandeep Tripathy <milun.tripathy@gmail.com>,
 Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Liush <liush@allwinnertech.com>, Anup Patel <anup@brainfault.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvm-riscv@lists.infradead.org,
 Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v10 4/8] RISC-V: Add SBI HSM suspend related defines
Date: Wed, 26 Jan 2022 17:14:48 +0530
Message-Id: <20220126114452.692512-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220126114452.692512-1-apatel@ventanamicro.com>
References: <20220126114452.692512-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_034537_039549_54E642B4 
X-CRM114-Status: GOOD (  13.60  )
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

From: Anup Patel <anup.patel@wdc.com>

We add defines related to SBI HSM suspend call and also
update HSM states naming as-per latest SBI specification.

Signed-off-by: Anup Patel <anup.patel@wdc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/sbi.h    | 27 ++++++++++++++++++++++-----
 arch/riscv/kernel/cpu_ops_sbi.c |  2 +-
 arch/riscv/kvm/vcpu_sbi_hsm.c   |  4 ++--
 3 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index d1c37479d828..06133b4f8e20 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -71,15 +71,32 @@ enum sbi_ext_hsm_fid {
 	SBI_EXT_HSM_HART_START = 0,
 	SBI_EXT_HSM_HART_STOP,
 	SBI_EXT_HSM_HART_STATUS,
+	SBI_EXT_HSM_HART_SUSPEND,
 };
 
-enum sbi_hsm_hart_status {
-	SBI_HSM_HART_STATUS_STARTED = 0,
-	SBI_HSM_HART_STATUS_STOPPED,
-	SBI_HSM_HART_STATUS_START_PENDING,
-	SBI_HSM_HART_STATUS_STOP_PENDING,
+enum sbi_hsm_hart_state {
+	SBI_HSM_STATE_STARTED = 0,
+	SBI_HSM_STATE_STOPPED,
+	SBI_HSM_STATE_START_PENDING,
+	SBI_HSM_STATE_STOP_PENDING,
+	SBI_HSM_STATE_SUSPENDED,
+	SBI_HSM_STATE_SUSPEND_PENDING,
+	SBI_HSM_STATE_RESUME_PENDING,
 };
 
+#define SBI_HSM_SUSP_BASE_MASK			0x7fffffff
+#define SBI_HSM_SUSP_NON_RET_BIT		0x80000000
+#define SBI_HSM_SUSP_PLAT_BASE			0x10000000
+
+#define SBI_HSM_SUSPEND_RET_DEFAULT		0x00000000
+#define SBI_HSM_SUSPEND_RET_PLATFORM		SBI_HSM_SUSP_PLAT_BASE
+#define SBI_HSM_SUSPEND_RET_LAST		SBI_HSM_SUSP_BASE_MASK
+#define SBI_HSM_SUSPEND_NON_RET_DEFAULT		SBI_HSM_SUSP_NON_RET_BIT
+#define SBI_HSM_SUSPEND_NON_RET_PLATFORM	(SBI_HSM_SUSP_NON_RET_BIT | \
+						 SBI_HSM_SUSP_PLAT_BASE)
+#define SBI_HSM_SUSPEND_NON_RET_LAST		(SBI_HSM_SUSP_NON_RET_BIT | \
+						 SBI_HSM_SUSP_BASE_MASK)
+
 enum sbi_ext_srst_fid {
 	SBI_EXT_SRST_RESET = 0,
 };
diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
index dae29cbfe550..2e16f6732cdf 100644
--- a/arch/riscv/kernel/cpu_ops_sbi.c
+++ b/arch/riscv/kernel/cpu_ops_sbi.c
@@ -111,7 +111,7 @@ static int sbi_cpu_is_stopped(unsigned int cpuid)
 
 	rc = sbi_hsm_hart_get_status(hartid);
 
-	if (rc == SBI_HSM_HART_STATUS_STOPPED)
+	if (rc == SBI_HSM_STATE_STOPPED)
 		return 0;
 	return rc;
 }
diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
index 2e383687fa48..1ac4b2e8e4ec 100644
--- a/arch/riscv/kvm/vcpu_sbi_hsm.c
+++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
@@ -60,9 +60,9 @@ static int kvm_sbi_hsm_vcpu_get_status(struct kvm_vcpu *vcpu)
 	if (!target_vcpu)
 		return -EINVAL;
 	if (!target_vcpu->arch.power_off)
-		return SBI_HSM_HART_STATUS_STARTED;
+		return SBI_HSM_STATE_STARTED;
 	else
-		return SBI_HSM_HART_STATUS_STOPPED;
+		return SBI_HSM_STATE_STOPPED;
 }
 
 static int kvm_sbi_ext_hsm_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
