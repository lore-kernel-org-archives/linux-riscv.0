Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02ED5C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 17:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Px+GQiSUPpZxrAe4mE3h/n1pWEu9nhFUBQ1IQx0hwO4=; b=wJCgHrkz6xFq6s
	riKV3vXzf3NuXeyeMt6Ys2OTQnDRzD6E+OmMW+Xpmc7D2PZzuLVw2xWvLf60gBowl6gjFyMFN9msm
	kdTPOIGe/j/cNY6NOQHJI1JWKr3Iq0gH966V8IBoMbDCGGy4ON3U9hkB8oIEcBLG4indTOCDbjGOM
	zEbhURKj+noAhwnNb+BPecq9J9bql6zjWHM42NbSuSMmxjaQj5Q7YJpaVUelr29Z+OnGtPjfejzmb
	rns+MSvZlnzDYeCLNeWmhX4MgPRD64FU415ODZJkkfvVgWJmZ9D0aZt2zzSE6PidqJSs9BioUSWX6
	plVU0OviENFOBkVEe72w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDV1y-00HOwZ-Hb; Mon, 18 Jul 2022 17:59:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDV1u-00HOb0-CH
	for linux-riscv@bombadil.infradead.org; Mon, 18 Jul 2022 17:59:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6NyzMxmt/WAE6+0kMZIP7wK2TvVq8SGkQD4SMxCtamA=; b=JUIxpqDv48INfu36n9xYxcSuPs
	PAMY0xzLcJtXvMi3Qe1YVY1H7VomOtC2t3c1NR2LMwJXzzmfULKs9Q8H6Rt1JtGxAqNJyECk4xnBV
	JBoDtomhQMqO1fwVS9nO90053WU806C78sStACE/qEoYRtBbQVPYWXWXo4ZyEt8ImN6VxS4B+AUYm
	aMJxg4PZDodGGpJx3dX5jKmvVnvwtQeoGJf3YBeYRmT3+RHrBtmA1bVwk76yivfKlhgDrxsctKpn/
	hz1/NjMyURBQKIjNbktV7dSVRrQD5ci7XkVH86179ngQX87v8z6d+wlaUo6Y16cPrKJNWP96pODAf
	W/hIwZ/g==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDUBt-004rPf-55
	for linux-riscv@lists.infradead.org; Mon, 18 Jul 2022 17:05:55 +0000
Received: by mail-pj1-x1035.google.com with SMTP id j1-20020a17090aeb0100b001ef777a7befso13058243pjz.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Jul 2022 10:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6NyzMxmt/WAE6+0kMZIP7wK2TvVq8SGkQD4SMxCtamA=;
        b=rE2p2vnI0/LzOurYbXKj4a1dOYnbseYzbfsMdemkPv4As2iWMSTt2DB6SveWWZ83bE
         Tk9XPTQiBtGl6zi8QHUbOgHAaWFo189CV6uO9dPD2VMSxoS+PCn3rGrPakfP7DUDkotq
         kcYB4LiERhIDMCqNxqoHIZvTKepp323ApuWpGfOTSPo09TedaCwpzo5VqXF1t8psbA/h
         BYIk+vIJz+xRlek2rg4cIzEodJRQQan/1Mc/KaIisB/nVHTMfNIeW8pGXUwe3MMuKCAw
         LlCcf9/S3UkVz/oLdgk5vIIOdiDkiRq4geG4fQwQ9kVhYvFln1fahMBqkktEb1awnhh2
         RcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6NyzMxmt/WAE6+0kMZIP7wK2TvVq8SGkQD4SMxCtamA=;
        b=dlLUGiA28BTMqDuXt16JvWcdVe6LJzm3ulJ/ZRHNIsrpfAkGn71cxyNoEiwrzjez3I
         /8qUMwmvhGsMrBsLJI4f8wEi43w0+zhV/tb82DuKfJ/5+KG8o7oA/QPFvzTwNaUChHPC
         /xgNlFHAMSpg+XOfC38iZNjkZ9C8wItzNm9CvzlSalxamnhRicKbHW+DWcX2uJD23Bk1
         A1hrFGnOIPAQqPxneQZSnzhqLBff84EJaE/nyuM5jHToO9NepFVFb42v6UMEyHIZ6tpS
         1m/GCWuY6+dR2dln9f1dwM8HdKWskfOTzvXBRdREQTbEKP/cX3ydk3cozW24gfBzz2A3
         qQAA==
X-Gm-Message-State: AJIora9pI5wxpr2b0QsVmBzgdhZgv1GbKa2XXTUBiPZJY5nkdDWu6GG5
	Q3ePRqUmYWwvi9qzPUqvLSxTBQ==
X-Google-Smtp-Source: AGRyM1uH69PKvvBNxNCme8+NWvuUJNuL8CI0U/0FZX6mfAo3vPZF1+2AA8FuSPDj+/ikwZ2KkGTmsw==
X-Received: by 2002:a17:90a:c088:b0:1ef:b85c:576b with SMTP id o8-20020a17090ac08800b001efb85c576bmr39888216pjs.237.1658163950929;
        Mon, 18 Jul 2022 10:05:50 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id r10-20020a170902be0a00b0016bc947c5b7sm9733402pls.38.2022.07.18.10.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 10:05:50 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Guo Ren <guoren@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [RFC  6/9] RISC-V: KVM: Add SBI PMU extension support
Date: Mon, 18 Jul 2022 10:02:02 -0700
Message-Id: <20220718170205.2972215-7-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718170205.2972215-1-atishp@rivosinc.com>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_180553_572501_EAFC21EA 
X-CRM114-Status: GOOD (  17.51  )
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

SBI PMU extension allows KVM guests to configure/start/stop/query about
the PMU counters in virtualized enviornment as well.

In order to allow that, KVM implements the entire SBI PMU extension.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_sbi.c     | 11 +++++
 arch/riscv/kvm/vcpu_sbi_pmu.c | 81 +++++++++++++++++++++++++++++++++++
 2 files changed, 92 insertions(+)
 create mode 100644 arch/riscv/kvm/vcpu_sbi_pmu.c

diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index d45e7da3f0d3..da9f7959340e 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -50,6 +50,16 @@ extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
 extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
 
+#ifdef CONFIG_RISCV_PMU_SBI
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu;
+#else
+static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu = {
+	.extid_start = -1UL,
+	.extid_end = -1UL,
+	.handler = NULL,
+};
+#endif
+
 static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
 	&vcpu_sbi_ext_v01,
 	&vcpu_sbi_ext_base,
@@ -58,6 +68,7 @@ static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
 	&vcpu_sbi_ext_rfence,
 	&vcpu_sbi_ext_srst,
 	&vcpu_sbi_ext_hsm,
+	&vcpu_sbi_ext_pmu,
 	&vcpu_sbi_ext_experimental,
 	&vcpu_sbi_ext_vendor,
 };
diff --git a/arch/riscv/kvm/vcpu_sbi_pmu.c b/arch/riscv/kvm/vcpu_sbi_pmu.c
new file mode 100644
index 000000000000..90c51a95d4f4
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_sbi_pmu.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2022 Rivos Inc
+ *
+ * Authors:
+ *     Atish Patra <atishp@rivosinc.com>
+ */
+
+#include <linux/errno.h>
+#include <linux/err.h>
+#include <linux/kvm_host.h>
+#include <asm/csr.h>
+#include <asm/sbi.h>
+#include <asm/kvm_vcpu_sbi.h>
+
+static int kvm_sbi_ext_pmu_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
+				   unsigned long *out_val,
+				   struct kvm_cpu_trap *utrap,
+				   bool *exit)
+{
+	int ret = -EOPNOTSUPP;
+	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
+	unsigned long funcid = cp->a6;
+	uint64_t temp;
+
+	switch (funcid) {
+	case SBI_EXT_PMU_NUM_COUNTERS:
+		ret = kvm_riscv_vcpu_pmu_num_ctrs(vcpu, out_val);
+		break;
+	case SBI_EXT_PMU_COUNTER_GET_INFO:
+		ret = kvm_riscv_vcpu_pmu_ctr_info(vcpu, cp->a0, out_val);
+		break;
+	case SBI_EXT_PMU_COUNTER_CFG_MATCH:
+#if defined(CONFIG_32BIT)
+		temp = ((uint64_t)cp->a5 << 32) | cp->a4;
+#else
+		temp = cp->a4;
+#endif
+		ret = kvm_riscv_vcpu_pmu_ctr_cfg_match(vcpu, cp->a0, cp->a1, cp->a2, cp->a3, temp);
+		if (ret >= 0) {
+			*out_val = ret;
+			ret = 0;
+		}
+		break;
+	case SBI_EXT_PMU_COUNTER_START:
+#if defined(CONFIG_32BIT)
+		temp = ((uint64_t)cp->a4 << 32) | cp->a3;
+#else
+		temp = cp->a3;
+#endif
+		ret = kvm_riscv_vcpu_pmu_ctr_start(vcpu, cp->a0, cp->a1, cp->a2, temp);
+		break;
+	case SBI_EXT_PMU_COUNTER_STOP:
+		ret = kvm_riscv_vcpu_pmu_ctr_stop(vcpu, cp->a0, cp->a1, cp->a2);
+		break;
+	case SBI_EXT_PMU_COUNTER_FW_READ:
+		ret = kvm_riscv_vcpu_pmu_ctr_read(vcpu, cp->a0, out_val);
+		break;
+	default:
+		ret = -EOPNOTSUPP;
+	}
+
+	return ret;
+}
+
+unsigned long kvm_sbi_ext_pmu_probe(unsigned long extid)
+{
+	/*
+	 * PMU Extension is only available to guests if privilege mode filtering
+	 * is available. Otherwise, guest will always count events while the
+	 * execution is in hypervisor mode.
+	 */
+	return riscv_isa_extension_available(NULL, SSCOFPMF);
+}
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_pmu = {
+	.extid_start = SBI_EXT_PMU,
+	.extid_end = SBI_EXT_PMU,
+	.handler = kvm_sbi_ext_pmu_handler,
+	.probe = kvm_sbi_ext_pmu_probe,
+};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
