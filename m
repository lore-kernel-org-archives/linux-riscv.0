Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BE0C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Feb 2022 05:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gFji8Gxb4IoLPAUMUMucC5Y8pHMyrjWp7VUj9Kiv6FY=; b=rKhO60Z4Rp1Zge
	YLnZ7OrwKw4R0suQQnSBdbKGj6phFa0DyhZr5m+x1kM1bnjNznf6Nty9QTvcUhw+O5DURT0kj/4IE
	fUVu3KG3bw4I9xyCW4a9MHHwddGFKu+3g7CqzXh1vecFnWYmhldsaGIeB2vv7/tXwrJ4f0mKJXGWg
	XLep+zpyWmvWEPzCURbtAivP/5y4McnQN0jqyGQXYrliInZ4RSVLbWPH7v3fvOyNBQUzRGoj27Ycg
	kM8XTBtcRN9eYM+xE4Kv+OEIg8mbxPkMLpzKgKhNhihbj8iaCjauWzovOceiF0r/oqEH8ZuhmnXuC
	RWQnnwogeeZ8aYU6jgoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI2O5-002gQj-UP; Thu, 10 Feb 2022 05:53:02 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI2Lx-002fJ3-Ms
 for linux-riscv@lists.infradead.org; Thu, 10 Feb 2022 05:50:58 +0000
Received: by mail-pf1-x436.google.com with SMTP id i21so6862226pfd.13
 for <linux-riscv@lists.infradead.org>; Wed, 09 Feb 2022 21:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RbvOPUcLpvqCpDEgUwp7Yqen+HCi3dzKW44QNXe2v/0=;
 b=EkhUcuQP/+JTS1cQ2q+tnOKt050BXpMH/T+CaXd1A6AukxglZ1k3GQTRmQLyAXkb9n
 L33FxlGdidW+kIP2H2iGXs7No+kwhpNAAGeIiQPi94UsWTA8JAbWjMmvRyPPqQ06LAhT
 a0wUbtTmwG/7rdy4OugFU0KOs67YgrcXMNlFzKarFyxe4I1PlsMj7hl8hOotUkfzTK+T
 uOTLrZf4kUBkfIyX7PrDre9a5pw//10LEahoOm3ZnLecOQwMQLnDkqep5AqNsOomd7lU
 IRE96yyOynMEYuXNjaGu6JzZBqx8U1Zk1ZSS8uFObD2Wm35O58DJ4PM2wXcloRKJzZPx
 Tdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RbvOPUcLpvqCpDEgUwp7Yqen+HCi3dzKW44QNXe2v/0=;
 b=qVxP6eQNhPzUB4RqyaXgyV019S3fqtOL3O7dEHqzb6n5FCn9ozsI3MdJ5y4NlCyFRG
 0eo//VfOnBAaBER9qIwQU5z9Lf0unDWf+B62b2IkuE/xVQyGQuNP0K+xQcYFEdc161If
 qlhhxunhpb2+2uMjCSzbNpVEtB4ag8F75GD+4sGuSShbfm9xjVXq4UrTc5+pxRdYYZeW
 hqTVM5UDRZKksCjt1dg5hls/Hsr7kwsH9dp6FTh6CPbgA7s7b0e4iPP0pIQmqy6IjpMI
 5vv/FdaDuudDMhV3RVhupZjnjltRr/lrGUzNUWJv7+f0eRknT06vI2+RuXUbuMJSmkJo
 /ykg==
X-Gm-Message-State: AOAM532KY6hyP7SQssGbEgq8SaSbx5pjRc+3yUKkvBdi6YSli76CFvVX
 KVnJRNNEdrHp9/l11ge0IHWa3A==
X-Google-Smtp-Source: ABdhPJwBMBWkkMlRUSlyISasqv3zZPVy9czF7dmMvG04SwiB++wLBTXc52nNOTMRfIei5Vqsf4gn/g==
X-Received: by 2002:a63:9044:: with SMTP id a65mr4847997pge.507.1644472248830; 
 Wed, 09 Feb 2022 21:50:48 -0800 (PST)
Received: from localhost.localdomain ([122.179.114.46])
 by smtp.gmail.com with ESMTPSA id s32sm15192270pfw.80.2022.02.09.21.50.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 21:50:48 -0800 (PST)
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
 Anup Patel <apatel@ventanamicro.com>, Guo Ren <guoren@kernel.org>
Subject: [PATCH v11 4/8] RISC-V: Add SBI HSM suspend related defines
Date: Thu, 10 Feb 2022 11:19:43 +0530
Message-Id: <20220210054947.170134-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220210054947.170134-1-apatel@ventanamicro.com>
References: <20220210054947.170134-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220209_215049_842920_E710606C 
X-CRM114-Status: GOOD (  13.07  )
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
Reviewed-by: Guo Ren <guoren@kernel.org>
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
