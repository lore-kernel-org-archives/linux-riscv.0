Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667C9C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 16:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/4UeIWCjkHSYgRy/UTCfE8Zr2b/zOXuLt1Gm31pUw3g=; b=tMnaa5YLiYijuE
	oGycQq98RR+DS4rKbQ0+zwFgb4Y1A4UUo/tz3N4AyUhCWJtVEtcouEEb5jd1GIjj5YOFdwmMnrFb5
	tThbR2907XdTuj5GElyMVSw3btfrFHMUVR5jLdzzIh01yhdpKYbNMpD2QhSj4Jxc3fB0T8XSJ0LRu
	G2ZduRWCrf1OgwUVsPHlByq/r0HVKHAvWANqlY79PNhU4wWk/QjSC7C/aCqtnqMkxq8Es8/EDznVU
	k28oGxkEVILVafnVpzDk3YBHMJmSjAgmxZxpkdSQ3tkWN6ZzgBxIApsk/4i2/m+VJe44vDrMRJNJe
	KcK2Jy4zl0gIsCqBiMcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgmZ-002j4P-B5; Mon, 28 Nov 2022 16:14:59 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozgmU-002iyq-Kz
	for linux-riscv@lists.infradead.org; Mon, 28 Nov 2022 16:14:56 +0000
Received: by mail-pf1-x435.google.com with SMTP id a16so10534502pfg.4
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 08:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NydSuZRA0dQJSw5CpEPlhY7ambuW6DYL2PJN724q2rI=;
        b=AVabAj97DTRMDHk26gRQuTTvqQGRoIDt2H/tGtRwd8LHgE1VEctsODHZScQIhJkXYN
         E0Q5igJWPbdFexk1mtJJfhVtldDVKyXylDiKWPpzJwgCUWR8VotqizkG0gRjy6dBWXmr
         tUXyyg0cpn/OrwFExlEBj5gt7vMuR4MBNbYnE21OEAyhKvyHCToWXJsstFTI17y0Bwl2
         Z4i4NbmR8QAdxRhzMRr30V9dBUvW+RI1+0eFo9jfBOknZoUfazzUD74HPDxwOUVjMSj1
         DoBDubwRU1TQhiAP5lhcLkA4+Km9UT/0dOD27oFlWZvFr8pkN9LlxPKvsXsAIqo447Z6
         UOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NydSuZRA0dQJSw5CpEPlhY7ambuW6DYL2PJN724q2rI=;
        b=XlSOOQEH+cWZddUd6l41rhUC4xiQOoImgGcfTJXLNegBqS0ellAME8uZkW71PRwqdH
         14oRTU2grGAIHV9pwW2ljDanGFM7VrbBOooRSBV5SGB7TLR8T6q58aJa+5CGgJ0bNYUd
         3iZClWPLdW+zdFnUwL4UApyx7tfC+AK6+GV2fg3OdiojKMNtw9qQQl/N07PMUgKOut/C
         fxoCVs8RUFpSmZXP7Rv1OKqLp5CxthnF+XWkAIHfLQaG4rAhaqTZnhOFy3FO2P45PPom
         f7f9oemSKxCrlOI9Ke7Mo429AhopJiRfAfnc4oI5l3jU80Gv3bgRuOBbYFNrdabnUr07
         yweQ==
X-Gm-Message-State: ANoB5pnw91CGj7Y+OAn5A7HmLLBYnzaIKHdcAw87pLbwDw3nPBnZ4jja
	mNYrmJP8b3CuHTifCIYM7tpGvA==
X-Google-Smtp-Source: AA0mqf4p10ZMWAzeqgtd0+xVNsa9fT5Xes0NR7/AU5l0dqEK0XcOVjDvxuhH8ACyPhvnJBlmgYcabg==
X-Received: by 2002:a65:5a4c:0:b0:477:ba9d:ef8 with SMTP id z12-20020a655a4c000000b00477ba9d0ef8mr23807987pgs.98.1669652091114;
        Mon, 28 Nov 2022 08:14:51 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.0])
        by smtp.gmail.com with ESMTPSA id k145-20020a628497000000b0056246403534sm8210805pfd.88.2022.11.28.08.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 08:14:50 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 4/9] RISC-V: KVM: Use switch-case in kvm_riscv_vcpu_set/get_reg()
Date: Mon, 28 Nov 2022 21:44:19 +0530
Message-Id: <20221128161424.608889-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221128161424.608889-1-apatel@ventanamicro.com>
References: <20221128161424.608889-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_081454_733017_A9D3482F 
X-CRM114-Status: UNSURE (   7.98  )
X-CRM114-Notice: Please train this message.
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

We should use switch-case in kvm_riscv_vcpu_set/get_reg() functions
because the else-if ladder is quite big now.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu.c | 36 ++++++++++++++++++++++--------------
 1 file changed, 22 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 982a3f5e7130..68c86f632d37 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -544,22 +544,26 @@ static int kvm_riscv_vcpu_set_reg_isa_ext(struct kvm_vcpu *vcpu,
 static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 				  const struct kvm_one_reg *reg)
 {
-	if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CONFIG)
+	switch (reg->id & KVM_REG_RISCV_TYPE_MASK) {
+	case KVM_REG_RISCV_CONFIG:
 		return kvm_riscv_vcpu_set_reg_config(vcpu, reg);
-	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CORE)
+	case KVM_REG_RISCV_CORE:
 		return kvm_riscv_vcpu_set_reg_core(vcpu, reg);
-	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CSR)
+	case KVM_REG_RISCV_CSR:
 		return kvm_riscv_vcpu_set_reg_csr(vcpu, reg);
-	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_TIMER)
+	case KVM_REG_RISCV_TIMER:
 		return kvm_riscv_vcpu_set_reg_timer(vcpu, reg);
-	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_F)
+	case KVM_REG_RISCV_FP_F:
 		return kvm_riscv_vcpu_set_reg_fp(vcpu, reg,
 						 KVM_REG_RISCV_FP_F);
-	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_D)
+	case KVM_REG_RISCV_FP_D:
 		return kvm_riscv_vcpu_set_reg_fp(vcpu, reg,
 						 KVM_REG_RISCV_FP_D);
-	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_ISA_EXT)
+	case KVM_REG_RISCV_ISA_EXT:
 		return kvm_riscv_vcpu_set_reg_isa_ext(vcpu, reg);
+	default:
+		break;
+	}
 
 	return -EINVAL;
 }
@@ -567,22 +571,26 @@ static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 static int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,
 				  const struct kvm_one_reg *reg)
 {
-	if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CONFIG)
+	switch (reg->id & KVM_REG_RISCV_TYPE_MASK) {
+	case KVM_REG_RISCV_CONFIG:
 		return kvm_riscv_vcpu_get_reg_config(vcpu, reg);
-	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CORE)
+	case KVM_REG_RISCV_CORE:
 		return kvm_riscv_vcpu_get_reg_core(vcpu, reg);
-	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_CSR)
+	case KVM_REG_RISCV_CSR:
 		return kvm_riscv_vcpu_get_reg_csr(vcpu, reg);
-	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_TIMER)
+	case KVM_REG_RISCV_TIMER:
 		return kvm_riscv_vcpu_get_reg_timer(vcpu, reg);
-	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_F)
+	case KVM_REG_RISCV_FP_F:
 		return kvm_riscv_vcpu_get_reg_fp(vcpu, reg,
 						 KVM_REG_RISCV_FP_F);
-	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_D)
+	case KVM_REG_RISCV_FP_D:
 		return kvm_riscv_vcpu_get_reg_fp(vcpu, reg,
 						 KVM_REG_RISCV_FP_D);
-	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_ISA_EXT)
+	case KVM_REG_RISCV_ISA_EXT:
 		return kvm_riscv_vcpu_get_reg_isa_ext(vcpu, reg);
+	default:
+		break;
+	}
 
 	return -EINVAL;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
