Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCE3C10F05
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 17:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EkvhbvBn+0f1oZPypMoa6ehi7Qb5BUBj7eWyQJLIGT0=; b=nYfy0Lz5ZR6ki+
	Jr4R/frcn0l0c9YiuNuYqFjAwRBcHX5ZmzwvRnJVBlJQ4ol2Un99l0Mgt/pXdC3yLSV+pDeEYijFu
	s749bxddpVoZHHhsuw4SdZN0YpnzeX3cHMkXE6aMebccbZbFwg1qJJ6sPkBpvxknxehIfHMs5OmBj
	nF/d/4oEIIJTG94wIB1sKDGoYPdv4pBjXoK8JdQs1jZXY7FudJIHVpN8YRw+mvV0XwTQrQWNFQk4E
	mGpS9B8TUubgl6I/TgYVQ8Uyyi3cjwzjvkZxXkh62u6rp3ZOzFMFDAJQvtbSBzSkfwnsy1Rh8Q8eX
	K2Kjjoks3+enjo17o3yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZUI-0083u4-1K;
	Tue, 05 Dec 2023 17:45:38 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZUG-0083rZ-0u
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 17:45:37 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1d0b0334ffcso19055485ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 09:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701798333; x=1702403133; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xh660VR+cynL5ByMmnyvYALQkVg9X3nzQmC84j+D7MQ=;
        b=YdtGdQ4UizM9e7fAeOXbilUP/Y1Hhe5IE8c4hbCWjhLHEVUWwACVmngViYcdE546GA
         sTLvZx+DFey7xooVrP0VxAbjM7EjAZ889QRMcdD10siabQ44tCY11BmWCDuoih3imqEK
         gk0bt3iAww6i3oQ4RlTaKmd5qHZ2/UBYDHZrREsuEctzg6tAuiFvZQFOTvbhDDJFrwVP
         UfaDEaXJSXt/FtJMH9+UB2Tvld1nf78UxmdXlELoBt2rzage/Ut7R7WfAO3D5boCyyto
         ffZyDdh46cPubPU+BvbetmZSqWZItBGRDXeypo9lr/q9gai1efuzqSBKDpJlLIV8ftTV
         8E1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701798333; x=1702403133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xh660VR+cynL5ByMmnyvYALQkVg9X3nzQmC84j+D7MQ=;
        b=QuW76ZoUld6TkZvYBE43oSARAJtET4FZlpjjJ3QdFMfHZ8FfR03ydbB1EA/d4zVIp+
         FfPbiCzHoRiRAnWRwIbvliqYQCMty6qTOnZ1kdSDrqkLx6EEi9Cf7Mk+3PMsUNdxCmk5
         EG43Qmx/nPsGdcVkCHiSP+moraL4jVoHfug9tSk0x1EDGi4LnI3dhSPfzGoKziwkqEBz
         nestNYK3SR/VKbZNjSEYNCTRic69q5GDe8T//1xM3J2X+KFwVcCzfqf8MIO22JLajPun
         MkRzHNk6Z9vcTQXPQp/2j55xeNyOHaHHPWK1f4rcnJfh7LdE7shyzwB66zOy3Gn27Nh9
         e1YQ==
X-Gm-Message-State: AOJu0YzeevVPsw2GXftE6YQfixMy8L+XsdeX2jvE3yAVThQHG8NnTbIr
	TnZHfiY9rssyiXnUJHnX/5WhYw==
X-Google-Smtp-Source: AGHT+IHmxq3UYJ5ZQx5exhCrZrdLX5Q8e34CNi9nSp70tBpb4whX5/If4GYuXq2EXsnqnTsBq5YwzQ==
X-Received: by 2002:a17:903:1c7:b0:1d0:9c53:9cca with SMTP id e7-20020a17090301c700b001d09c539ccamr4076817plh.96.1701798333325;
        Tue, 05 Dec 2023 09:45:33 -0800 (PST)
Received: from grind.. ([152.234.124.8])
        by smtp.gmail.com with ESMTPSA id j20-20020a170902759400b001c74df14e6fsm10465705pll.284.2023.12.05.09.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 09:45:32 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v3 3/3] RISC-V: KVM: add vector CSRs in KVM_GET_REG_LIST
Date: Tue,  5 Dec 2023 14:45:09 -0300
Message-ID: <20231205174509.2238870-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231205174509.2238870-1-dbarboza@ventanamicro.com>
References: <20231205174509.2238870-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_094536_319064_FDB9EFD4 
X-CRM114-Status: GOOD (  14.06  )
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
 arch/riscv/kvm/vcpu_onereg.c | 55 ++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index f8c9fa0c03c5..2eb4980295ae 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -986,6 +986,55 @@ static int copy_sbi_ext_reg_indices(u64 __user *uindices)
 	return num_sbi_ext_regs();
 }
 
+static inline unsigned long num_vector_regs(const struct kvm_vcpu *vcpu)
+{
+	if (!riscv_isa_extension_available(vcpu->arch.isa, v))
+		return 0;
+
+	/* vstart, vl, vtype, vcsr, vlenb and 32 vector regs */
+	return 37;
+}
+
+static int copy_vector_reg_indices(const struct kvm_vcpu *vcpu,
+				u64 __user *uindices)
+{
+	const struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+	int n = num_vector_regs(vcpu);
+	u64 reg, size;
+	int i;
+
+	if (n == 0)
+		return 0;
+
+	/* copy vstart, vl, vtype, vcsr and vlenb */
+	size = IS_ENABLED(CONFIG_32BIT) ? KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
+	for (i = 0; i < 5; i++) {
+		reg = KVM_REG_RISCV | size | KVM_REG_RISCV_VECTOR | i;
+
+		if (uindices) {
+			if (put_user(reg, uindices))
+				return -EFAULT;
+			uindices++;
+		}
+	}
+
+	/* vector_regs have a variable 'vlenb' size */
+	size = __builtin_ctzl(cntx->vector.vlenb);
+	size <<= KVM_REG_SIZE_SHIFT;
+	for (i = 0; i < 32; i++) {
+		reg = KVM_REG_RISCV | KVM_REG_RISCV_VECTOR | size |
+			KVM_REG_RISCV_VECTOR_REG(i);
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
@@ -1001,6 +1050,7 @@ unsigned long kvm_riscv_vcpu_num_regs(struct kvm_vcpu *vcpu)
 	res += num_timer_regs();
 	res += num_fp_f_regs(vcpu);
 	res += num_fp_d_regs(vcpu);
+	res += num_vector_regs(vcpu);
 	res += num_isa_ext_regs(vcpu);
 	res += num_sbi_ext_regs();
 
@@ -1045,6 +1095,11 @@ int kvm_riscv_vcpu_copy_reg_indices(struct kvm_vcpu *vcpu,
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
