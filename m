Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C207C54EDA
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 20:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=68PZLR87l3hppKjcmJ1YKSVUlAa0vHS9XBIIWU2J4PM=; b=3twOGbCNl9WCde
	h2lOjXpmnh4lskq8cR683YgDIQoEXdASv1VgJqnbX0zDUVpLc0PZaLm1PSJOXb8BQ5XU+Yp8V2gYu
	rf8AYoq4DqU+kA3i0BvNZae3r0jvQmiN9gx225TAHn7ttFy/NZUC8uSrB2Z6RFHZbUk+e12Op9lEz
	sYbAqyU5Csd5lhpL+M0ZoLi5pvY7svfLUx2GBRmKPahhCFMk0jXRqr27xB9nlr71Hz9InmGCm3cOR
	2XA6p2xDSHYydEQOVfUNH3W4D1xEmzQ4gzKgjnyLVTmiU/9C2HZfDXsVqpwFB0fPAiS3tER4l5+FU
	6kgPl9nX5nvmyzMQeviw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICdk-0000000289S-2gNu;
	Thu, 22 May 2025 20:35:44 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICdg-0000000285G-2ilZ
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 20:35:42 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-30572effb26so7636761a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 13:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747946140; x=1748550940; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hlpsjtQ1jfPZ6A9TfjhS6qtbiSt0LuxjR82iYs+98kk=;
        b=0cMkRC5FObMYtkyDjM64YY/KeUCC20tURmb4JZm16YvHL5zJW3f34ylw5GBmmxKYXe
         ROkgL8G+CS0L5i5bq+njAPvhJ4bN1coAv4c/qKv9xTOizdUyg4ASvF+h1mXgf5rPpwcG
         u1bHRxWA8jpNxYL8Pv4u+VwwRuOjScLqnZwm3yUGlkWZ68ehimSTbuNhbfWsbZG3buzK
         0vVt16yTUxG9PAEjc9RgiGhDhyI/8Md39ILeeZUzer2ruLj8rDKu0b2Av1IcZIWer83j
         /xW9OgolDdNXLbHBt7AwgzcOzxgsWVhECO7i4zJDMhA/5SxfxjmKdrpcaDU+M5NvAE+8
         hGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747946140; x=1748550940;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hlpsjtQ1jfPZ6A9TfjhS6qtbiSt0LuxjR82iYs+98kk=;
        b=MqFvv7Z/4bXiM5YyXQtHok4RIFMZWvxiHT2WW3lBXtpiFVsUQLgbLnrjTZ8qlroBr5
         LhOIIS4YxBgJHdmpBtPVszrJuAi4yTiuqP6nYe5kYy1f/xaZqkRkFU0ksjM1/f90kOgO
         DLdDdvAFHi8tFl1EEj5+iE6Iigo7fF6pxn/41xBXZLPqlCPrRSnO6GAQp4MWpJhqSxCe
         K4rMZarjfSS+zIEtbNT3emL3X8Mn4AUPbjBVIC6cCNTMLaa4YSyPXrbwAohH+vyKI1Kn
         ACT+e7Eu8OG3QgnBsJ9w8T12MNNUDkifr0kuRiDz6iNkTC4fD52n6iXVizyrzjdUox2s
         G/qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqGaL16o2X80aaohgB/K7sq1Hv07QO/RDKbd/bxqQIJP1lLK3Xpg9QjQ/xsSLHonM+kVV+K8fw3zknew==@lists.infradead.org
X-Gm-Message-State: AOJu0Yys8dw0IBdVwDUJceRpiGbBjplR7hkyMCFGuME7+wxzB0Zbxutr
	VpS9Q/gfZhyOP2U31gzAsEUYxPFovOTma8SHpUuG9qVlmNXIbYyD4WjpO0x6E4Lg39k=
X-Gm-Gg: ASbGnct84gEbPkwT/eTNrEA9b2JqNxAdQhASScJGl2NgWVotySO7IpKlxweQXAdbCe7
	oW9/ZAjlclmgpbR8vxvfMl3K0bX5Q2yvFR2kLbw+Xfns6LQ89MEeug1WDQj/UmEeuRLfkO6VOvs
	pP1SrFQMwuEn6Wy7jZz29S5nbf70AbmQmSB3CAfdDdXDXRrBqf02xBYYG3OOI1ne16VGW1O9Xez
	o51IrSNaYlYo91DsrZH0jO77yKqzmqTntbLG/tCm9kFK4IsitvLP1VyqKcSP3mpxafAscw0PUqs
	EwoKExqybT8e/ma2u/sXXV7xr4I7i/JMbD0X/xdjj0qEMOOSxemo3h7QtSOu1/FK
X-Google-Smtp-Source: AGHT+IGCOYKh0vp5GpK/3nS4xafj8YOx8BCMj+SatngsU14XSWFqRaCBH400PBoR5UfD0rXZqAojdA==
X-Received: by 2002:a17:90a:e706:b0:30e:5c7f:5d26 with SMTP id 98e67ed59e1d1-30e7d5aca67mr42085164a91.24.1747946139700;
        Thu, 22 May 2025 13:35:39 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365b229csm5932754a91.10.2025.05.22.13.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 13:35:39 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 13:35:27 -0700
Subject: [PATCH v2 3/5] RISC-V: KVM: Support lazy enabling of siselect and
 aia bits
MIME-Version: 1.0
Message-Id: <20250522-kvm_lazy_enable_stateen-v2-3-b7a84991f1c4@rivosinc.com>
References: <20250522-kvm_lazy_enable_stateen-v2-0-b7a84991f1c4@rivosinc.com>
In-Reply-To: <20250522-kvm_lazy_enable_stateen-v2-0-b7a84991f1c4@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_133540_693114_4178BB18 
X-CRM114-Status: GOOD (  11.22  )
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

Smstateen extension controls the SISELECT and SIPH/SIEH register
through hstateen.AIA bit (58). Add lazy enabling support for those
bits.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_aia.h | 13 ++++++++++++-
 arch/riscv/kvm/aia.c             | 34 ++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_insn.c       |  3 +++
 3 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
index 760a1aef09f7..9e39b0e15169 100644
--- a/arch/riscv/include/asm/kvm_aia.h
+++ b/arch/riscv/include/asm/kvm_aia.h
@@ -142,12 +142,23 @@ int kvm_riscv_vcpu_aia_rmw_topei(struct kvm_vcpu *vcpu,
 				 unsigned long *val,
 				 unsigned long new_val,
 				 unsigned long wr_mask);
+int kvm_riscv_vcpu_aia_hstateen_enable(struct kvm_vcpu *vcpu,
+				       unsigned int csr_num, unsigned long *val,
+				       unsigned long new_val, unsigned long wr_mask);
+int kvm_riscv_vcpu_aia_rmw_isel(struct kvm_vcpu *vcpu, unsigned int csr_num, unsigned long *val,
+				unsigned long new_val, unsigned long wr_mask);
 int kvm_riscv_vcpu_aia_rmw_ireg(struct kvm_vcpu *vcpu, unsigned int csr_num,
 				unsigned long *val, unsigned long new_val,
 				unsigned long wr_mask);
 #define KVM_RISCV_VCPU_AIA_CSR_FUNCS \
 { .base = CSR_SIREG,      .count = 1, .func = kvm_riscv_vcpu_aia_rmw_ireg }, \
-{ .base = CSR_STOPEI,     .count = 1, .func = kvm_riscv_vcpu_aia_rmw_topei },
+{ .base = CSR_SISELECT,   .count = 1, .func = kvm_riscv_vcpu_aia_rmw_isel }, \
+{ .base = CSR_STOPEI,     .count = 1, .func = kvm_riscv_vcpu_aia_rmw_topei }, \
+{ .base = CSR_STOPI,      .count = 1, .func = kvm_riscv_vcpu_aia_hstateen_enable }, \
+
+#define KVM_RISCV_VCPU_AIA_CSR_32BIT_FUNCS \
+{ .base = CSR_SIPH,	  .count = 1, .func = kvm_riscv_vcpu_aia_hstateen_enable }, \
+{ .base = CSR_SIEH,	  .count = 1, .func = kvm_riscv_vcpu_aia_hstateen_enable }, \
 
 int kvm_riscv_vcpu_aia_update(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_aia_reset(struct kvm_vcpu *vcpu);
diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 1e0d2217ade7..3dfabf51a4d2 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -235,6 +235,40 @@ int kvm_riscv_vcpu_aia_set_csr(struct kvm_vcpu *vcpu,
 	return 0;
 }
 
+int kvm_riscv_vcpu_aia_hstateen_enable(struct kvm_vcpu *vcpu,
+				       unsigned int csr_num,
+				       unsigned long *val,
+				       unsigned long new_val,
+				       unsigned long wr_mask)
+{
+	/* If AIA not available then redirect trap */
+	if (!kvm_riscv_aia_available())
+		return KVM_INSN_ILLEGAL_TRAP;
+
+	/* If AIA not initialized then forward to user space */
+	if (!kvm_riscv_aia_initialized(vcpu->kvm))
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+
+	return kvm_riscv_vcpu_hstateen_lazy_enable(vcpu, csr_num, SMSTATEEN0_AIA);
+}
+
+int kvm_riscv_vcpu_aia_rmw_isel(struct kvm_vcpu *vcpu,
+				unsigned int csr_num,
+				unsigned long *val,
+				unsigned long new_val,
+				unsigned long wr_mask)
+{
+	/* If AIA not available then redirect trap */
+	if (!kvm_riscv_aia_available())
+		return KVM_INSN_ILLEGAL_TRAP;
+
+	/* If AIA not initialized then forward to user space */
+	if (!kvm_riscv_aia_initialized(vcpu->kvm))
+		return KVM_INSN_EXIT_TO_USER_SPACE;
+
+	return kvm_riscv_vcpu_hstateen_lazy_enable(vcpu, csr_num, SMSTATEEN0_AIA_ISEL);
+}
+
 int kvm_riscv_vcpu_aia_rmw_topei(struct kvm_vcpu *vcpu,
 				 unsigned int csr_num,
 				 unsigned long *val,
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 0a7e229cfd34..ef4fcb641f1c 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -269,6 +269,9 @@ static const struct csr_func csr_funcs[] = {
 	KVM_RISCV_VCPU_AIA_CSR_FUNCS
 	KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS
 	{ .base = CSR_SEED, .count = 1, .func = seed_csr_rmw },
+#ifdef CONFIG_32BIT
+	KVM_RISCV_VCPU_AIA_CSR_32BIT_FUNCS
+#endif
 };
 
 /**

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
