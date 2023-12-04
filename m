Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F4F4C10DC1
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 18:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gD15Ry/VjV4Qn6es9l1c3ytoApkH2sZlO4FBbH/+1IU=; b=SNGWO4pSnJAqJS
	MeFVuu3Xf3PyRJsLhuMAyvVuyCBIujbt7sQPveZZFFa9CvtDyCqxvEPIOtMlPlfVVDtcysWU6XKdS
	QZiDJ9wfd7BYDM4cDwYPCxAaBUkADbkkiAkDvAgV8Gy16dsLhnu3FVS9UZ3BWzg8Qc6jOwM8vdO38
	vvN4bQP9vPkM6SoB59ORP8sxCQL4r29XKU+I1lkVgBX718o82eMbb/vzaxjGYPYbGFZAe65abej3y
	4MqshNLE594DhfbLaNb8gP/YGSPigPeZp3DWsqJK8mYhpsSGxIEu5qTKHfbed1Mp2b40LL9mlVTsB
	1rDGnm3Rl9HQGQ4HOALw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rADh5-005JPw-20;
	Mon, 04 Dec 2023 18:29:23 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rADh2-005JNl-1H
	for linux-riscv@lists.infradead.org;
	Mon, 04 Dec 2023 18:29:21 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6cdd214bce1so5078607b3a.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Dec 2023 10:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701714559; x=1702319359; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mGBD600RHtXFtkPU4SOmbidKDzxeJ3jBcLp4jGcjDdY=;
        b=hgPrX1EyehTmTdvTmmPI/WCLHPOdqjbFd/4f9h2mnYXWT4ziFSXXFBFFDhsnoM/8bz
         Ub8DOnevaYYdDj2MM0GOb3YRogECRK96kL235ARGNAgHl33y5v3R/XR5zjhtbYMUExWD
         2PwmM8XHfU3Kc7RhjS3Eg6DZXUm6rRFiVQRu6OlMDdaRQr0yVA2i0TrK0HlYJHxDjpPp
         dQRMIPZFQ1DRSxvxRSU8cs674sNj9TanR9js4a8XHKc8OH0gsIXABO8YCsq2prqFiH2c
         6adbiJwEJu5ucP3fiR6XQ8kMJ3lagn1XKlZ5AHBPJATxKmqnA7Y6Dwbe4VffvMDrVlLq
         CISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701714559; x=1702319359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mGBD600RHtXFtkPU4SOmbidKDzxeJ3jBcLp4jGcjDdY=;
        b=ZP7owT8cbPVb+H8kA42dEArVDzaTWCx2twSDJxLVCAFtVtmGPAkxMn2gtlMuPk7wT/
         B0XTHXP8Af64S2EWrbGczSJs5gPklFp57m4+nPWMJ6ep3GU+wN3Z8j8QHnJ0GntkaD+8
         maErPil8JZuFy2dyT9XMCwUIX7aqlEkZBdO/3pM1XqxeFN9zW4OPzErzBUKCQBShhFaT
         KldglJ9qcOfQQ30fyUdJJl4I92ixpm6YXfAAc4ZWPAjWMmcb6TvYq0pheE1czsK8NLWF
         A5fwVxfWdKlp+unruQ+X4HRUCHwl7UYHGj/5VK8x2Ghauat7dyQ8/IuZWRqgTDh8f58J
         SW3A==
X-Gm-Message-State: AOJu0YyHSnAIjOLg7B1V0W/muUVK607vs4jp/tbdyM9myCadpIH0Hb6j
	RkxJcqNDmb5MtcMNGxMOp2tJdA==
X-Google-Smtp-Source: AGHT+IESIwZmOWM6eeY2+i7bqfBNcq8SQrottFDB8R8T+zVBCK33v9JZ4EZonX0hxRihd6tmXKie+w==
X-Received: by 2002:a05:6a00:2d0d:b0:6be:314c:16cb with SMTP id fa13-20020a056a002d0d00b006be314c16cbmr4797997pfb.10.1701714559101;
        Mon, 04 Dec 2023 10:29:19 -0800 (PST)
Received: from grind.. (200-206-229-234.dsl.telesp.net.br. [200.206.229.234])
        by smtp.gmail.com with ESMTPSA id it19-20020a056a00459300b006cdce7c69d9sm1806224pfb.91.2023.12.04.10.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 10:29:18 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 3/3] RISC-V: KVM: add vector CSRs in KVM_GET_REG_LIST
Date: Mon,  4 Dec 2023 15:29:04 -0300
Message-ID: <20231204182905.2163676-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231204182905.2163676-1-dbarboza@ventanamicro.com>
References: <20231204182905.2163676-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231204_102920_436444_A7EDF451 
X-CRM114-Status: GOOD (  12.09  )
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
 arch/riscv/kvm/vcpu_onereg.c | 37 ++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index f8c9fa0c03c5..1c91615f47cc 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -986,6 +986,37 @@ static int copy_sbi_ext_reg_indices(u64 __user *uindices)
 	return num_sbi_ext_regs();
 }
 
+static inline unsigned long num_vector_regs(const struct kvm_vcpu *vcpu)
+{
+	const struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+
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
@@ -1001,6 +1032,7 @@ unsigned long kvm_riscv_vcpu_num_regs(struct kvm_vcpu *vcpu)
 	res += num_timer_regs();
 	res += num_fp_f_regs(vcpu);
 	res += num_fp_d_regs(vcpu);
+	res += num_vector_regs(vcpu);
 	res += num_isa_ext_regs(vcpu);
 	res += num_sbi_ext_regs();
 
@@ -1045,6 +1077,11 @@ int kvm_riscv_vcpu_copy_reg_indices(struct kvm_vcpu *vcpu,
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
