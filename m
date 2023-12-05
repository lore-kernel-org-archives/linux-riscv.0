Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB17C07E97
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8V2ONYWk6BfBa3IkcU0FydOlGd16n/3zhH2oC16ZAjY=; b=BzXkGzHDqE4460
	IaJSmpGuFc0nQQcF26FzVOdDbObGYHSF4LecHQZKEDTCwH0d1NCzIO2YVlc+bp4VaRL+vqJEfcsZm
	rkKV31/iC/AiN1vvijs/ia5RcX5vIY5CEkxDghWJjV1jQD75/zibdQfAhpUowlrGlpfhiHx77BP33
	6Un+OVWVXELGtjM2nqFz9onWHxx1HT74XzdqzhfULZD4TY52SJz46El15W1vdu2aKdB2rmJDuNoMn
	rKWJc3yYcZWqA+UuuwGmMpcxZfZ6n7g+YuHkfpUpbAMHWfUAZYm+UAz9FGlvXJlbdUTqsmPS9NKfU
	K8Q8uszDs4aW3Yxta0AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAVpC-007XLX-2G;
	Tue, 05 Dec 2023 13:50:58 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAVp9-007XIw-27
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 13:50:56 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-5c1f8b0c149so2283666a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 05:50:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701784254; x=1702389054; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDmx5prnNC5GcsIkGu5R3qOSAEa8hCYanFPPTHn90qw=;
        b=GntKl2v+Zm+k+zp2q+vN5X0r3Y7Aks9DnKKm8t5Vi9Y1K+b0LLw2VfFYVz8nbDCPPF
         97+pAMReI8gJOampodRU/+xIEYfHryhBkfzZtZjXtGhsSMWzZ0zTMkkV8cI2SxlRimA4
         DsJNp6GCJY5dCeHCybi/GDsNljWLPW4wI20Fej3uxNkJnh8ptgLMw7YaArWOsilgNGQL
         cIVXsOZ4rX0EMAjS3rsac0Y9HhlSjDQtWNGpvW5jw0rEP7tdB1UhXOPqJRPWbkNubjjf
         Rp2zVGIrngx1onw3r//3GB7gaucNSkaxfTQJtjIrF8NfRyhTjNNmwdk0Q+Iefu22CxKU
         Xw9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701784254; x=1702389054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDmx5prnNC5GcsIkGu5R3qOSAEa8hCYanFPPTHn90qw=;
        b=SvVE6uhw7uWAT7R9lssqee2hyK2W1wpLrIHiuYqyJ6aEDAFpmnE1sk0WgLnC2NxgL8
         ezeUATJSna27D9OMu+NwJ8wbK1j5s5/xJqGbPqk/6PNfM+c9zCjeeFwl54o5NAP6VKAC
         SwO3YcnBSaHQKy8zmYv6W+f2VujbKVdJqOtoWpRXWrHoYfRKCtdNZqkfTpg9twuD/5E5
         fQsy6eZjrfQkZyg8MkTwkal6nNPqlrGbbM0/b+0098K++SHc8ldftrRJzSUs4oEabQ/N
         PrRiIB/8Ouhc78ya1IAO/ya8kMKXYYHE090Mnq+tAc5WB7QENAZvz/OQJc/2Z1QNkLbH
         MTYg==
X-Gm-Message-State: AOJu0YxS5yJA40G94/1brE6kc0zij/Q4s56kNfLF+tgTOH7hGdL8VVxp
	NFRURR7KLvRpFnfOrBFO5fDGmw==
X-Google-Smtp-Source: AGHT+IFFofEjDPFCygGTkPI8Pv4OsjhRCek6+h6rFjjhHBJGn6KCZVf8+gVKPxrIKPeuKD+6UPO0Dw==
X-Received: by 2002:a05:6a20:3950:b0:18f:1df2:356 with SMTP id r16-20020a056a20395000b0018f1df20356mr3471659pzg.96.1701784254595;
        Tue, 05 Dec 2023 05:50:54 -0800 (PST)
Received: from grind.. (200-206-229-234.dsl.telesp.net.br. [200.206.229.234])
        by smtp.gmail.com with ESMTPSA id c22-20020aa78c16000000b006ce77ffcc75sm673641pfd.165.2023.12.05.05.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 05:50:54 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v2 2/3] RISC-V: KVM: add 'vlenb' Vector CSR
Date: Tue,  5 Dec 2023 10:50:40 -0300
Message-ID: <20231205135041.2208004-3-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231205135041.2208004-1-dbarboza@ventanamicro.com>
References: <20231205135041.2208004-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_055055_700965_1F832CE8 
X-CRM114-Status: UNSURE (   9.88  )
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

Userspace requires 'vlenb' to be able to encode it in reg ID. Otherwise
it is not possible to retrieve any vector reg since we're returning
EINVAL if reg_size isn't vlenb (see kvm_riscv_vcpu_vreg_addr()).

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_vector.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index 530e49c588d6..d92d1348045c 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -116,6 +116,9 @@ static int kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
 		case KVM_REG_RISCV_VECTOR_CSR_REG(vcsr):
 			*reg_addr = &cntx->vector.vcsr;
 			break;
+		case KVM_REG_RISCV_VECTOR_CSR_REG(vlenb):
+			*reg_addr = &cntx->vector.vlenb;
+			break;
 		case KVM_REG_RISCV_VECTOR_CSR_REG(datap):
 		default:
 			return -ENOENT;
@@ -174,6 +177,18 @@ int kvm_riscv_vcpu_set_reg_vector(struct kvm_vcpu *vcpu,
 	if (!riscv_isa_extension_available(isa, v))
 		return -ENOENT;
 
+	if (reg_num == KVM_REG_RISCV_VECTOR_CSR_REG(vlenb)) {
+		struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+		unsigned long reg_val;
+
+		if (copy_from_user(&reg_val, uaddr, reg_size))
+			return -EFAULT;
+		if (reg_val != cntx->vector.vlenb)
+			return -EINVAL;
+
+		return 0;
+	}
+
 	rc = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size, &reg_addr);
 	if (rc)
 		return rc;
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
