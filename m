Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AC5C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 08:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7tYcs2LAjbU7YhQwEiQlcHoyozLswSIt/BIich+hEzE=; b=QmTyewvoDF9LGd
	UmwLjUpIpsO/A54vBYxb5g4kb8fR7ziGdYpAcgVMFgpQC7B40kbjSg4gHNRAsvOUSI2F9A9ErwI0H
	rHgROtZWpG3sC7K8C70UUyIVTYxm47Vg94UnyCScHew2K7du/GBVMWxNW2X4NUY1mNWUSM3ScjZ1k
	CX7EtsGMj25/R3vMrk3O2uekrXfDj2lpO+p5FkBs3yXeD44+nW+vsUWnRSDOEgBLypkk25NmIf4Ar
	yIwfrHj8Vx0VCe+OWrtInDsVfsMZh/vmUKNmyLeelsGmc/Oxjmn0RzqyCfYfL/XtCucdgNvcNnrcv
	PZ1M9ukXEE57UYbvltoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEoSE-00BW6w-6P; Tue, 01 Feb 2022 08:23:58 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEoSA-00BW2k-Qx
 for linux-riscv@lists.infradead.org; Tue, 01 Feb 2022 08:23:56 +0000
Received: by mail-ed1-x52e.google.com with SMTP id l5so32379227edv.3
 for <linux-riscv@lists.infradead.org>; Tue, 01 Feb 2022 00:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T8jkwpaTNUs5ESeTMvPF9Tbpyy5JKY953H6W28s28Gw=;
 b=ngcy4rQ1Tpgrp9QzjvjPpqlVgEEEjqUKlV9f6VgLlo3oZPaCeQ7cPAESbm6F2HSzDM
 paNnr/LcQOSSotljA3esNoziLPThU5dSkiW4AQT1KrCJ9zkf1JDCYAN6aKYxd8akcqcX
 jvZxUF3iKLDGyAi9OE7LyyWgCLx3i7/oiQWaRChkSaQ1gOBdS9wRWZz6Ptio+n8+qEr8
 9X1Np23oxzKTJSrFLRSmuLariV7eZqgzOOOkc4O9OgvbIc36GNjHYi4hXo/br2l0I8Aa
 y3IYbsaAGoRHvL+OFw2J90Y6uFAA+dp+NYQxTJ6hzTuVNihOXwkIQevryg1IPiuLIAC/
 Dn1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T8jkwpaTNUs5ESeTMvPF9Tbpyy5JKY953H6W28s28Gw=;
 b=T2QtWQHGJpAp+BLE69OTcY8WvFgYQTyK6wua8XOW11luB2huQET+A9BDLBcsoW9434
 Y9iekwGcUjpCWym5QDMOA8QjAJCNbCG1LmB3235/K2vHCiWfIc3C8pCXz7UbQNIzDTit
 Wog1o8h+azlXjJg9BZvLBuJNid780CCDQb331uhbYRPpIoEs+jR188pAu++Cqaik0ukB
 a9N5uyh0caLwE6TR3EYtnPgv26/g54jdBu/XOSy4dz4SwpUAUyguqtKYDd2up5A291lN
 zjzNO6PunowV4nFprV/FsO4YMhqVD9UjORgciNh1Q8k8pyHmn70iLWnc71OsTS0zw2n5
 6URQ==
X-Gm-Message-State: AOAM5329qWK/cO7pQiyfJw0K5vYSGFCGr8jw/fbMuLMAk1mZd+mFMu1Y
 qobrgiHQXAMeq+pwIW7N/L7aAQ==
X-Google-Smtp-Source: ABdhPJxMN4igBjnNAWqvjNJdPlsojVXp0jfP8pzdoErz1Lbcla7jF8s1hXlmk0ufOTGHDHY8aA6Zkg==
X-Received: by 2002:a05:6402:1774:: with SMTP id
 da20mr24004748edb.372.1643703833389; 
 Tue, 01 Feb 2022 00:23:53 -0800 (PST)
Received: from localhost.localdomain ([122.179.76.38])
 by smtp.gmail.com with ESMTPSA id w8sm14312133ejq.220.2022.02.01.00.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 00:23:52 -0800 (PST)
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
Subject: [PATCH 3/6] RISC-V: KVM: Implement SBI v0.3 SRST extension
Date: Tue,  1 Feb 2022 13:52:24 +0530
Message-Id: <20220201082227.361967-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201082227.361967-1-apatel@ventanamicro.com>
References: <20220201082227.361967-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220201_002354_919132_63A1E33D 
X-CRM114-Status: GOOD (  11.41  )
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

The SBI v0.3 specification defines SRST (System Reset) extension which
provides a standard poweroff and reboot interface. This patch implements
SRST extension for the KVM Guest.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_sbi.c         |  2 ++
 arch/riscv/kvm/vcpu_sbi_replace.c | 44 +++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 11ae4f621f0d..a09ecb97b890 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -45,6 +45,7 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_time;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
@@ -55,6 +56,7 @@ static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
 	&vcpu_sbi_ext_time,
 	&vcpu_sbi_ext_ipi,
 	&vcpu_sbi_ext_rfence,
+	&vcpu_sbi_ext_srst,
 	&vcpu_sbi_ext_hsm,
 	&vcpu_sbi_ext_experimental,
 	&vcpu_sbi_ext_vendor,
diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
index 1bc0608a5bfd..0f217365c287 100644
--- a/arch/riscv/kvm/vcpu_sbi_replace.c
+++ b/arch/riscv/kvm/vcpu_sbi_replace.c
@@ -130,3 +130,47 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence = {
 	.extid_end = SBI_EXT_RFENCE,
 	.handler = kvm_sbi_ext_rfence_handler,
 };
+
+static int kvm_sbi_ext_srst_handler(struct kvm_vcpu *vcpu,
+				    struct kvm_run *run,
+				    unsigned long *out_val,
+				    struct kvm_cpu_trap *utrap, bool *exit)
+{
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	unsigned long funcid = cp->a6;
+	u32 reason = cp->a1;
+	u32 type = cp->a0;
+	int ret = 0;
+
+	switch (funcid) {
+	case SBI_EXT_SRST_RESET:
+		switch (type) {
+		case SBI_SRST_RESET_TYPE_SHUTDOWN:
+			kvm_riscv_vcpu_sbi_system_reset(vcpu, run,
+						KVM_SYSTEM_EVENT_SHUTDOWN,
+						reason);
+			*exit = true;
+			break;
+		case SBI_SRST_RESET_TYPE_COLD_REBOOT:
+		case SBI_SRST_RESET_TYPE_WARM_REBOOT:
+			kvm_riscv_vcpu_sbi_system_reset(vcpu, run,
+						KVM_SYSTEM_EVENT_RESET,
+						reason);
+			*exit = true;
+			break;
+		default:
+			ret = -EOPNOTSUPP;
+		}
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+	}
+
+	return ret;
+}
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst = {
+	.extid_start = SBI_EXT_SRST,
+	.extid_end = SBI_EXT_SRST,
+	.handler = kvm_sbi_ext_srst_handler,
+};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
