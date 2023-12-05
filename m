Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BD7C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 13:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wMZmIvNaS6KSYT+cmefrMva6hPesgDGbt7bFZk4vZwY=; b=draW8RlipQ7DbI
	3CpCCB5Q4gYkC7vBw3GuywWKzDdUtsgG3C8nJOwK29zNnebDdBEz44Kqs82BT/7z1C9we+0FrJC+d
	l8lCQ3rRGVDk2eY2pFVNQqyZTkVEMa6UG2ecao5krryI7LTC6G3LitZeYINKcdxpzf7bZRaKjf979
	yTgkssGbN3QXJDAlAG43dOeh7kwLlY+SZ0csqfatQ/125Pr3wBHcE0PBr83k7iw7VKMxvE4jTFFtd
	j0cZKir4rUu2MbsIupdkVtW9hpLjcCTrJwaPSSi6sQobNAT7UiDjuq53EG0bO1QoJ7UfjGmHErNiU
	uIOtvQez1Fs9i62qebFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAVpf-007XWz-0Q;
	Tue, 05 Dec 2023 13:51:27 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAVpc-007XW0-1G
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 13:51:25 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6cb749044a2so5962628b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 05:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701784283; x=1702389083; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gWIP8Cx7D+GV9Mq+7uijTcrk0Pfg2qHA9s0FvsGVo74=;
        b=grwZHxW+AlRzPin4c8I9LlCvUm5vVkt7uOyDCCSlxyJVlOO9oHKw7LgMAJhPfLU4Hx
         rX5k/s8llJWM0Ks3Otx15F0+qTlSlb9ggAGjs1r6VgiHeEy0pgiFrOUe9n0IdXJCGgum
         9pakALwnhrxUo69019/HmK1w+tsaH8DrlLuM/r33Vnu7V3k+P5n+5ONjLmFt6f6B9VIq
         slsAmjKyF6FTZqXKx666f3RSrLW116AjqISQ05DT7Rw5n86rHFJUubqkrvkP/2QTkELg
         q1JJQsPThsCjERO7U/mikjdd9Dcun0BrJncZUHsURM0geQePsLRDC/v3CfSLSSEsqInA
         0rkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701784283; x=1702389083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gWIP8Cx7D+GV9Mq+7uijTcrk0Pfg2qHA9s0FvsGVo74=;
        b=FO0oL3xL4Vuv15qjqqfRdR8mPeiPP7hGK95FEsL+pfQhBxUj05vTfIIMLYEaEvgg8V
         ZC/VAkB6Tv2+nfZhOLWsAuS5vlqS7C2VCueizzbq0gus0+mCZYti0ZXdgNMdqZOz7mqh
         VPnny7hpEHzxR6V/VnFaUE4OIZ0t4lnLV06CzmujxdPdcBAe8fg3taV/Ehws7QLK1z8A
         mdSAt/XfKHa6Jetj1cJsQfjDbzEuaps/HbBwfzZ+Qz8l1/Kafiy/fBzD86mW/uoSxtk+
         FTqT5e8qpzstS6MrmaWDSpi00QPNBBjEJ4gDo4mBniisFOUg+p9k3tWI/J2ZWN2VWGTL
         tetA==
X-Gm-Message-State: AOJu0YwOn7B0ce0s4zli9aKUtQxH7Dw2Zgv860iIyt1L9gpfhOrjnZzm
	6u7KpbugCx3qgQwxCknJJ5fcHQ==
X-Google-Smtp-Source: AGHT+IFl6VUO3lxE+m7fVq4lH0JgDU9K0sD3DxngsxIxRWrEodduyQcrtEHmBXOHOq/B4vNQoN+evg==
X-Received: by 2002:a05:6a20:a113:b0:18f:b899:21dd with SMTP id q19-20020a056a20a11300b0018fb89921ddmr96150pzk.47.1701784257468;
        Tue, 05 Dec 2023 05:50:57 -0800 (PST)
Received: from grind.. (200-206-229-234.dsl.telesp.net.br. [200.206.229.234])
        by smtp.gmail.com with ESMTPSA id c22-20020aa78c16000000b006ce77ffcc75sm673641pfd.165.2023.12.05.05.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 05:50:57 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 3/3] RISC-V: KVM: add vector CSRs in KVM_GET_REG_LIST
Date: Tue,  5 Dec 2023 10:50:41 -0300
Message-ID: <20231205135041.2208004-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231205135041.2208004-1-dbarboza@ventanamicro.com>
References: <20231205135041.2208004-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_055124_428190_AF52893F 
X-CRM114-Status: GOOD (  11.61  )
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

Add all vector CSRs (vstart, vl, vtype, vcsr, vlenb) in get-reg-list.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index f8c9fa0c03c5..712785a8f22b 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -986,6 +986,35 @@ static int copy_sbi_ext_reg_indices(u64 __user *uindices)
 	return num_sbi_ext_regs();
 }
 
+static inline unsigned long num_vector_regs(const struct kvm_vcpu *vcpu)
+{
+	if (!riscv_isa_extension_available(vcpu->arch.isa, v))
+		return 0;
+
+	/* vstart, vl, vtype, vcsr, vlenb; */
+	return 5;
+}
+
+static int copy_vector_reg_indices(const struct kvm_vcpu *vcpu,
+				u64 __user *uindices)
+{
+	int n = num_vector_regs(vcpu);
+	u64 reg, size;
+
+	for (int i = 0; i < n; i++) {
+		size = IS_ENABLED(CONFIG_32BIT) ? KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
+		reg = KVM_REG_RISCV | size | KVM_REG_RISCV_VECTOR | i;
+
+		if (uindices) {
+			if (put_user(reg, uindices))
+				return -EFAULT;
+			uindices++;
+		}
+	}
+
+	return n;
+}
+
 /*
  * kvm_riscv_vcpu_num_regs - how many registers do we present via KVM_GET/SET_ONE_REG
  *
@@ -1001,6 +1030,7 @@ unsigned long kvm_riscv_vcpu_num_regs(struct kvm_vcpu *vcpu)
 	res += num_timer_regs();
 	res += num_fp_f_regs(vcpu);
 	res += num_fp_d_regs(vcpu);
+	res += num_vector_regs(vcpu);
 	res += num_isa_ext_regs(vcpu);
 	res += num_sbi_ext_regs();
 
@@ -1045,6 +1075,11 @@ int kvm_riscv_vcpu_copy_reg_indices(struct kvm_vcpu *vcpu,
 		return ret;
 	uindices += ret;
 
+	ret = copy_vector_reg_indices(vcpu, uindices);
+	if (ret < 0)
+		return ret;
+	uindices += ret;
+
 	ret = copy_isa_ext_reg_indices(vcpu, uindices);
 	if (ret < 0)
 		return ret;
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
