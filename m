Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB78ECAAD3
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Sep 2022 13:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A5ExPWOEYIdblJakuj8BddFowPbd1upFB8KvFJqp8vM=; b=T0hQROcUkVAplv
	G05wNSTNj9e4oZc5MmhasJxBnHlrdsuSuYcCoXT7fQ0G3TB/BNIqaCtqHwMutACoeVTrJVo6SV1HH
	1RAy3DRSmPNSvj8/kX3dphoByg7ceVEcmCRuHIQ3Q7rkBIFOcLN2xW3KUhXmHuelgtGPqnWnXeHLM
	6Z0/xl0DlGwEk3Hqeze6KDuYFCln6qUxXs5DOkEivfgVdTVq8frRp15RHbYO4m4O0+0NaZQ+Lbkru
	c8mll2/wZSSpRUKKw8AcPqoQvW1SaclV+Gy3TtApBDzYBUtJpIccXzPwSEZDg99TR6Pqe02+j+NOm
	3H67o0Ui5gbMqyY4Rkpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaGxi-00Btyj-89; Mon, 19 Sep 2022 13:37:26 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaGxf-00Btx3-4e
	for linux-riscv@lists.infradead.org; Mon, 19 Sep 2022 13:37:24 +0000
Received: by mail-ed1-x52a.google.com with SMTP id q21so41324569edc.9
        for <linux-riscv@lists.infradead.org>; Mon, 19 Sep 2022 06:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=ppfLIjxYzL5rc+S/H9knNqD42yvhK86QXUmy4drwhbA=;
        b=INFzW0vmbEhyPNzazs70pZZ0uTo79T/q2yqypvoCWURS4CbFlgTO3FJu1xDkFviQa3
         eCBmRFvcWcRgrVfoNphhZ1aHpujbnmosdvUDEoHjBYcZnw2iE77V8GxJhcRqVURnm8Bk
         7aJg+05hywIzkU132BQTTmC6dyEzaFGt0zudWx5A7MYRwDAR/EGnh1E+sS+U27VPo6eR
         SzZtJ8blsw1tSb+qeQ0ZKCwsN/vN6WMQpCtKRpORGHRZaXREoyh0oy8OFW/XvFOG/tNo
         xFZN9fDMJFe9IdVMAeai6ufYrBM8w2fkt3727UwNVw7bQBn+1mT18M0awZ0nY8H+/iMU
         fSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=ppfLIjxYzL5rc+S/H9knNqD42yvhK86QXUmy4drwhbA=;
        b=1YOB9S17uzfeIyFPNuYA3vmRiErHhPbTv3ue//sNEGH3/9q3TBhcpdcv+0IGG0p4ad
         uZp//8LO0DN0HHNYV50R9+wypWsdqnisEsb176CNMh3DiEoqzsPy+GDpU+s7LnvH1z9/
         KWebU6kFEAXF8wlSwUsCY/sw2Hc5TEVwBoyH10Jo0uHjCmJ+S0W4gfgwgfWMr+KvCA0T
         y0VSy7dNeySEV+6CTONtcKXxMe3Xn43ynZmXz+zeGJ0dCPhrJ3ft3iIS49e/dAnE69cF
         0uGINNX2msgZj35G4aEgXEOVqjr0Jr4RpPiR9XgxGolvIkl0veDmBVm5CCoq3EdC6xZy
         IP4A==
X-Gm-Message-State: ACrzQf1igMjmrgN8kxBHZDzhAGaW6/+qeM1V7R2BSJlq3zWooWKKGNJd
	ESziO9Cow368LHbHzUnDLudSUQ==
X-Google-Smtp-Source: AMsMyM4ZezYll5/dsWHSItGp0PT8HxYRAasZ/o6lu50/t5DS3t8GEPVvke7Pcm5hBF1TJKr7S4H+Ug==
X-Received: by 2002:a05:6402:b6c:b0:44e:2faf:1ba4 with SMTP id cb12-20020a0564020b6c00b0044e2faf1ba4mr15640788edb.191.1663594640685;
        Mon, 19 Sep 2022 06:37:20 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id lb6-20020a170907784600b0073d9630cbafsm4929446ejc.126.2022.09.19.06.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 06:37:20 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org
Subject: [PATCH] RISC-V: KVM: Make ISA ext mappings explicit
Date: Mon, 19 Sep 2022 15:37:19 +0200
Message-Id: <20220919133719.230337-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_063723_205419_07DA88B3 
X-CRM114-Status: GOOD (  10.92  )
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

While adding new extensions at the bottom of the array isn't hard to
do, it's a pain to review in order to ensure we're not missing any.
Also, resolving merge conflicts for multiple new ISA extensions can be
error-prone. To make adding new mappings foolproof, explicitly assign
the array elements. And, now that the order doesn't matter, we can
alphabetize the extensions, so we do that too.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---

Applies to riscv_kvm_queue

 arch/riscv/kvm/vcpu.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 0de0dd22e734..61fe1604e8ea 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -42,19 +42,22 @@ const struct kvm_stats_header kvm_vcpu_stats_header = {
 
 #define KVM_RISCV_BASE_ISA_MASK		GENMASK(25, 0)
 
+#define KVM_ISA_EXT_ARR(ext)		[KVM_RISCV_ISA_EXT_##ext] = RISCV_ISA_EXT_##ext
+
 /* Mapping between KVM ISA Extension ID & Host ISA extension ID */
 static const unsigned long kvm_isa_ext_arr[] = {
-	RISCV_ISA_EXT_a,
-	RISCV_ISA_EXT_c,
-	RISCV_ISA_EXT_d,
-	RISCV_ISA_EXT_f,
-	RISCV_ISA_EXT_h,
-	RISCV_ISA_EXT_i,
-	RISCV_ISA_EXT_m,
-	RISCV_ISA_EXT_SVPBMT,
-	RISCV_ISA_EXT_SSTC,
-	RISCV_ISA_EXT_SVINVAL,
-	RISCV_ISA_EXT_ZIHINTPAUSE,
+	[KVM_RISCV_ISA_EXT_A] = RISCV_ISA_EXT_a,
+	[KVM_RISCV_ISA_EXT_C] = RISCV_ISA_EXT_c,
+	[KVM_RISCV_ISA_EXT_D] = RISCV_ISA_EXT_d,
+	[KVM_RISCV_ISA_EXT_F] = RISCV_ISA_EXT_f,
+	[KVM_RISCV_ISA_EXT_H] = RISCV_ISA_EXT_h,
+	[KVM_RISCV_ISA_EXT_I] = RISCV_ISA_EXT_i,
+	[KVM_RISCV_ISA_EXT_M] = RISCV_ISA_EXT_m,
+
+	KVM_ISA_EXT_ARR(SSTC),
+	KVM_ISA_EXT_ARR(SVINVAL),
+	KVM_ISA_EXT_ARR(SVPBMT),
+	KVM_ISA_EXT_ARR(ZIHINTPAUSE),
 };
 
 static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
