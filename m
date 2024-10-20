Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67064D3C92A
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Oct 2024 19:48:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bqYCeQYG0/A71EvGPX9QeOWJs7FDsDIKRALJzY1gd7M=; b=glbC8dGURThcDB
	xmWQ1Xh3xbTI+Nr6YYsvFPsjQQyR2hyC0XfjqYGxE0jvHomvQ5UAE0ELijOeNk8yT+Wg7zxnHgyvN
	1xSi6z5hGOfAa8BA3N5jkL60Ddlcsvw29SWiyFrZADzw1GoR5rdj1mTMwg8kCI3AXJdEbVSebroop
	Ha9B/Q04kbD7BIZqjLOF6U8jAi+6MFTyyPXMWybxXCIrQzbOcp2FQe+pmxyDoTZrDnMWLV2Ia2rZA
	QzD38EynmyBHeUldaft0+7+EoCbKV7d2eHjnbdudQLk68wjB9nLe6wdYMYPe/i6Q98a9kmMShUW9C
	gaHnaZAkKd7MD0EUMsUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2buN-00000005Mxh-0gyW;
	Sun, 20 Oct 2024 19:48:11 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2bu7-00000005Min-170h
	for linux-riscv@lists.infradead.org;
	Sun, 20 Oct 2024 19:47:57 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2e2cc469c62so2535512a91.2
        for <linux-riscv@lists.infradead.org>; Sun, 20 Oct 2024 12:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1729453674; x=1730058474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QEedsq2JUKhoGmqZGJYyzFicNOwkAdZlkiaTwr3TF/o=;
        b=jnanJc9sK9SLjl7CA9JYVAw8sPcJ1UZJb1IrQbrEhVhD9dL4FADB819VW/DZLbbY5n
         W9haFjsCSeJeVqtwWQjIzkhQHdQOGNJy5wKhkqLvMtXh+8s/8+BnO7WjwGehIfhPF34P
         ai2P28e5A+HYKfwRlN1nqBx+HhWyojxAuV2XgcX5Y0+victIfbe5Pma/Dm8DWv4ATKx6
         iqSmRAu5Tgbxg6Re+e1ogBolzexl9J/jXqVeYE/9aT9B2S9IudDOBvFoOO4h/iQ+N8Tq
         uCRaXpfO8Mbnkzj8IocBkqUJJoQHXs2x+lqBVRYENTxe1sIezAKin1sJakBWtpOA3ZtC
         9K+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729453674; x=1730058474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QEedsq2JUKhoGmqZGJYyzFicNOwkAdZlkiaTwr3TF/o=;
        b=ej/PqsyAVNdPNzuXrx6WZm/B7X5CoiAkVSyfcDQRKnr/AZgRnzggDSnrOnoB4xZuf1
         hSO5ZeI1zGbAuUDh5aHuVdoYrU+WuWkv8f7FeNR7PlCr5Zm5xyz8k7P2LHLfCD3EkKYU
         n3x5X6xCYfoY299FKVcFC1gatd9Xyn6xYPW1mG7HLb4Eyp5zi9FGJyb7kJ3QeTON0VKG
         g/c32/Me7cvrCBaRJTQ9Gmzo2d8fk2RtcSJcAMhNmuJk7HzMdoyT7PWcxLHy+Y+dz1zM
         mf4jruOfGGbntS/OuFV9lK/MH1ck2elvLFyDce+hR+LJdlL3n5YmKuJXZ1GdT8Daznv8
         GLRA==
X-Forwarded-Encrypted: i=1; AJvYcCVKXGOqKxHMhiVXyM2f3Hq/meI8zRE90SPDX6bTq+7g8Atvh+47L5gJNLmdeKLNg45QrY0lbXxNKRMalQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFelGBn0F331ejSE0RBdErG5266MFKLKI2WSJ82M/evDUgVbRh
	EjNv2FudEV6ghVzkgvYw8mT0Rh4ObgqxXrU2qdKWdvnrNRB9zhjbaZg6YNJrk4k=
X-Google-Smtp-Source: AGHT+IE/fRzVoS+fVEWIeoAKQcgXW0+uJTsQHmeBuYcXiEzRwc7/fSmVJvcmrtukYOBuAWj6RtlBvg==
X-Received: by 2002:a17:90a:a586:b0:2e2:cd22:b083 with SMTP id 98e67ed59e1d1-2e5614e5da3mr10891971a91.0.1729453673108;
        Sun, 20 Oct 2024 12:47:53 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([50.238.223.131])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad365d4dsm1933188a91.14.2024.10.20.12.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 12:47:52 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 05/13] RISC-V: KVM: Replace aia_set_hvictl() with aia_hvictl_value()
Date: Mon, 21 Oct 2024 01:17:26 +0530
Message-ID: <20241020194734.58686-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241020194734.58686-1-apatel@ventanamicro.com>
References: <20241020194734.58686-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_124755_462261_2626A975 
X-CRM114-Status: GOOD (  10.67  )
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

The aia_set_hvictl() internally writes the HVICTL CSR which makes
it difficult to optimize the CSR write using SBI NACL extension for
kvm_riscv_vcpu_aia_update_hvip() function so replace aia_set_hvictl()
with new aia_hvictl_value() which only computes the HVICTL value.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/aia.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 2967d305c442..17ae4a7c0e94 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -51,7 +51,7 @@ static int aia_find_hgei(struct kvm_vcpu *owner)
 	return hgei;
 }
 
-static void aia_set_hvictl(bool ext_irq_pending)
+static inline unsigned long aia_hvictl_value(bool ext_irq_pending)
 {
 	unsigned long hvictl;
 
@@ -62,7 +62,7 @@ static void aia_set_hvictl(bool ext_irq_pending)
 
 	hvictl = (IRQ_S_EXT << HVICTL_IID_SHIFT) & HVICTL_IID;
 	hvictl |= ext_irq_pending;
-	csr_write(CSR_HVICTL, hvictl);
+	return hvictl;
 }
 
 #ifdef CONFIG_32BIT
@@ -130,7 +130,7 @@ void kvm_riscv_vcpu_aia_update_hvip(struct kvm_vcpu *vcpu)
 #ifdef CONFIG_32BIT
 	csr_write(CSR_HVIPH, vcpu->arch.aia_context.guest_csr.hviph);
 #endif
-	aia_set_hvictl(!!(csr->hvip & BIT(IRQ_VS_EXT)));
+	csr_write(CSR_HVICTL, aia_hvictl_value(!!(csr->hvip & BIT(IRQ_VS_EXT))));
 }
 
 void kvm_riscv_vcpu_aia_load(struct kvm_vcpu *vcpu, int cpu)
@@ -536,7 +536,7 @@ void kvm_riscv_aia_enable(void)
 	if (!kvm_riscv_aia_available())
 		return;
 
-	aia_set_hvictl(false);
+	csr_write(CSR_HVICTL, aia_hvictl_value(false));
 	csr_write(CSR_HVIPRIO1, 0x0);
 	csr_write(CSR_HVIPRIO2, 0x0);
 #ifdef CONFIG_32BIT
@@ -572,7 +572,7 @@ void kvm_riscv_aia_disable(void)
 	csr_clear(CSR_HIE, BIT(IRQ_S_GEXT));
 	disable_percpu_irq(hgei_parent_irq);
 
-	aia_set_hvictl(false);
+	csr_write(CSR_HVICTL, aia_hvictl_value(false));
 
 	raw_spin_lock_irqsave(&hgctrl->lock, flags);
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
