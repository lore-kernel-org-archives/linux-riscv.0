Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA7FCCA482
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 17:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sJFbkwOfaxbXErk0bwy29sJURdSrarIP2syZAP5ffRE=; b=zKjyyjne2VfyMN
	0SsHljWtsfa+mYs6jzc5tg7deEjzWEKrwd/QAyo2RIt6xLfTT3b+2/Nfi9QA0PrNK9M+61mEA29cC
	+bnMaMJO9bhSPZ7lMpi5RYkAQn8f4jGTLS1uu4iSeL+pb2hAacM36lyLjZkk+2TyDLAsOdh/PvZAz
	pII0hlfqAAP7gAGeGYf+LrqIzcnI67OKPBLc75sB5IEXnb8Ywko0qmtQ6vqFBcn13yZT7TfZtqkcH
	r1uPQ8dYqAIAdbnBAXq0+/VHD02cqJhzUGF2s+orOozlR/wGvnP+wDSQRy2QtWnaNarHOad9e/akn
	/vAE4p7292Y6lBoukJbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDUBz-00Gzr1-4u; Mon, 18 Jul 2022 17:05:59 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDUBo-00GzgZ-Pi
	for linux-riscv@lists.infradead.org; Mon, 18 Jul 2022 17:05:51 +0000
Received: by mail-pj1-x102d.google.com with SMTP id t5-20020a17090a6a0500b001ef965b262eso13238856pjj.5
        for <linux-riscv@lists.infradead.org>; Mon, 18 Jul 2022 10:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yTc6DPtRL3G/t0xkTGIGozwG47F+csFvT/B18Fnd6bA=;
        b=FzhoHCa1YsaXYQ8x7nWgTmqf0KgVR4ynTwb6sSm5eIdHHC8iMhZW6RP3czhrR5n8g/
         X2JKnvYBb1H58qTMZKXWi9CM1ZQO1mXLe07lVJd/+LwRh8tfBcmzbSFcotIZJhPLOUWu
         aehAPylHZQU7yz4IYfdL02Wz2JwbZBANg72NQqo5gHm2pA6TKHd81Ze1FoShkQs4WMAt
         J+F55ANKBQ+2NGW0+hnosnafLochQp/Rt3MrI+yMQtV7Uur5M1fuFzysZl9w/7EcuczN
         G2ZkIM824pXrYATCqnGXtVd4QVts+VWdN9ZLCDXaCjhqlcydUTORkG9xZukPNK7yHSzu
         CVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yTc6DPtRL3G/t0xkTGIGozwG47F+csFvT/B18Fnd6bA=;
        b=i3+OvtNGXkicdleCn1LHm0KL9smpZycU2ygfw+ReewOtHgB81cdmExsfW4m4hoCoQC
         7XU8N6pHGHWOWNaQquI8R/6V3t/QgsWMsbWuXGAehfiCsvukdoK/6khI1xemKKGMpPin
         pppPyvJ4jBEGV/Ras4OZ0GMP48R73NVKsjQHrkeAncwc52cWK79hlxpoJ5kFoXPrEWdC
         UScrqZI8qocsqqeyltWP+j2FM62kJdUtitDcYXEYAkyYagcWaJVDD57VwW2GK6kFeG34
         9k7wuX9RM8pAuWXzmg0foxTQXwqrDWxq3Vq0xuc+6e0ctj59f5YCZCx5UL+yz9TcIAcM
         U4vQ==
X-Gm-Message-State: AJIora8A2TXj/kLXRDGxUcbkR5IqxS1vOxaWsEZK9lrSZq/bT1jOek0l
	sYyhqFEBQcxRKOKdNuqmaw3LRQ==
X-Google-Smtp-Source: AGRyM1vW5t5W2twVvakvKZTko7lrN5ufYsRsPOvNvHFZUUuebHERK+y/x9Mil/Ly2FlTRRbMLZDwYg==
X-Received: by 2002:a17:90a:ca14:b0:1f1:664a:241 with SMTP id x20-20020a17090aca1400b001f1664a0241mr17356543pjt.184.1658163947139;
        Mon, 18 Jul 2022 10:05:47 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id r10-20020a170902be0a00b0016bc947c5b7sm9733402pls.38.2022.07.18.10.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 10:05:46 -0700 (PDT)
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
Subject: [RFC  3/9] RISC-V: KVM: Define a probe function for SBI extension data structures
Date: Mon, 18 Jul 2022 10:01:59 -0700
Message-Id: <20220718170205.2972215-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718170205.2972215-1-atishp@rivosinc.com>
References: <20220718170205.2972215-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_100548_877610_299C7BB5 
X-CRM114-Status: GOOD (  14.86  )
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

c,urrently the probe function just check if an SBI extension is
registered or not. However, the extension may not want to advertise
itself depending on some other condition.
An additional extension specific probe function will allow
extensions to decide if they want to be advertised to the caller or
not. Any extension that do not require additional dependency check
does not required to implement this function.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h |  3 +++
 arch/riscv/kvm/vcpu_sbi_base.c        | 13 +++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 83d6d4d2b1df..5853a1ef71ea 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -25,6 +25,9 @@ struct kvm_vcpu_sbi_extension {
 	int (*handler)(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		       unsigned long *out_val, struct kvm_cpu_trap *utrap,
 		       bool *exit);
+
+	/* Extension specific probe function */
+	unsigned long (*probe)(unsigned long extid);
 };
 
 void kvm_riscv_vcpu_sbi_forward(struct kvm_vcpu *vcpu, struct kvm_run *run);
diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
index 48f431091cdb..14be1a819588 100644
--- a/arch/riscv/kvm/vcpu_sbi_base.c
+++ b/arch/riscv/kvm/vcpu_sbi_base.c
@@ -22,6 +22,7 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	int ret = 0;
 	struct kvm_cpu_context *cp = &vcpu->arch.guest_context;
 	struct sbiret ecall_ret;
+	const struct kvm_vcpu_sbi_extension *sbi_ext;
 
 	switch (cp->a6) {
 	case SBI_EXT_BASE_GET_SPEC_VERSION:
@@ -46,8 +47,16 @@ static int kvm_sbi_ext_base_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			 */
 			kvm_riscv_vcpu_sbi_forward(vcpu, run);
 			*exit = true;
-		} else
-			*out_val = kvm_vcpu_sbi_find_ext(cp->a0) ? 1 : 0;
+		} else {
+			sbi_ext = kvm_vcpu_sbi_find_ext(cp->a0);
+			if (sbi_ext) {
+				if (sbi_ext->probe)
+					*out_val = sbi_ext->probe(cp->a0);
+				else
+					*out_val = 1;
+			} else
+				*out_val = 0;
+		}
 		break;
 	case SBI_EXT_BASE_GET_MVENDORID:
 	case SBI_EXT_BASE_GET_MARCHID:
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
