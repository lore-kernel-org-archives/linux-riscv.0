Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00522C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 08:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zn7xV80s87dQwzWoTLQn/qltFp8j3RV4/oSbqozLu6A=; b=hQggGMEpX4jp2O
	+beTPtudDgevmyhYEszQx1ll1Eg+ST4rn1UZKRr8C6oXAhMX9Fn6z4dwf3X3WWERQEKXMQ5gREPey
	MitER6ir3rs/ZrxWGcD8kDlozwHhsTDf0zw8ixkYb0W5fenGtrZJpjVcgm8beLjiGjfvLHVDu/PZ4
	R859mQqsa9bQzBIr7W9+kdmaOT91Kok4sp+IWluA+EwzuOq7KcgKWlnbv6BKQFYmYUvLvYvzAfkOs
	rSrNHFgErIXP3EiEAgeaQ5XfGA7l28tXWIGnKodjiUSbQPd6Jv7LKIFHQche5sttBkvoJgj8ZJcoT
	lT9ZdU8Ore/cDqdlLU7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEoSI-00BWB0-Vi; Tue, 01 Feb 2022 08:24:02 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEoSF-00BW7w-WE
 for linux-riscv@lists.infradead.org; Tue, 01 Feb 2022 08:24:01 +0000
Received: by mail-ej1-x634.google.com with SMTP id k25so51272008ejp.5
 for <linux-riscv@lists.infradead.org>; Tue, 01 Feb 2022 00:23:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zwd/8cqd/uyZjzuw2VQObQyskOR01to1ElscGOXTIT4=;
 b=eC4DiGIz7XiaA9N2mXQL7I9xjW9v59lcMo3xOM1zS2qqTt/VkyB+tuaweSHrA5kejn
 5RU1BDgKui2WEL+B2hxVm1uW7QYKdSwgtNyoXUAMRjAKUd4dZ40F+QJQOFFybxqyq8vj
 2dg4BMMDM9vVVSpON2vnjF6NN/QnuJg/Bh2JYpa+cF1HLxl2nRkF8ylog15N/wqvvMGt
 EjvaWUF7iui9SmZVdHL4VFa3LeHay3Y2Fk7rHK8a9nTLxvSQ4pOhVSvOMms4Y6JcCHNr
 T+15e7UQ3Usi38CmXaVnBjrFS4wbDNAAZzku4LCT7OLl7seLooxbJWmh7HSVGaUkWiuq
 uxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zwd/8cqd/uyZjzuw2VQObQyskOR01to1ElscGOXTIT4=;
 b=jTwTjCOENwXfJn360AdpHFE0LZwTm9z/6lKYN75TTh4qLFAGZmpEQTAQ7HlT8fU9kK
 3zhWmvWaURKAbUNuRsK+u42AdIThzHldg0QXuUh/oCa3CWGL9JDZbd9w7rrPrEVZgW9z
 OJ3sR4FrcVJXqykFI0zj137BBwG7xZhFfWQzreqQ/dst5mxX68zyHXNOpEyHgFy1mnP4
 ZtBc+X8C1kx4cndJ6LPWZGUVqJ1/OrLsRk7eTQYQaT4jyreit7rhQhjuNfYOKdqY7vVi
 aX60f6VYS2atmxJi7szuLLPWYRYi823xi3tKOBhfANiLsiXHdpe1cydCk+FBVOsp9HwL
 T81Q==
X-Gm-Message-State: AOAM530NQESAutAv30+pcclJxGxdXNCmL+xOg473N0fmRhn7RTSGNqJO
 KdK7+om6dOyf4PDqUtayl6pO/Q==
X-Google-Smtp-Source: ABdhPJy31giTDwE4wqN8u2biPEhaGB3Em2a9I6VCEGluXT0OlIBYWCHXDm+THh+U/KZhqQ92c9Ew+Q==
X-Received: by 2002:a17:907:6ea0:: with SMTP id
 sh32mr21034992ejc.460.1643703838800; 
 Tue, 01 Feb 2022 00:23:58 -0800 (PST)
Received: from localhost.localdomain ([122.179.76.38])
 by smtp.gmail.com with ESMTPSA id w8sm14312133ejq.220.2022.02.01.00.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 00:23:58 -0800 (PST)
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
Subject: [PATCH 4/6] RISC-V: Add SBI HSM suspend related defines
Date: Tue,  1 Feb 2022 13:52:25 +0530
Message-Id: <20220201082227.361967-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201082227.361967-1-apatel@ventanamicro.com>
References: <20220201082227.361967-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_002400_090084_4D8AF32E 
X-CRM114-Status: GOOD (  12.99  )
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

We add defines related to SBI HSM suspend call and also update HSM states
naming as-per the latest SBI specification.

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
