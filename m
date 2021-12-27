Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FE2C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Dec 2021 03:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kLVChY6dsq0l+uWziXcaMn11CaBXgmT8XcNtJPjer54=; b=o1hImdBsRYqXrR
	/1KPhlLlWvKGrxP4TFXYgfRDMAljcMhUss8ugxIj4rdn5UzkUbphiha6dLfFj9c+n68YqPoC/cjRg
	QezbJbvTxU2yFrB+PpSgqxoU7Wtoumdhe5qiDtZQ7GEYT1ZsG4MoFl440GgNJgEOQFiSJhIP6/xuu
	Vwbr5/DM+79Qnc1wfPan0yxCkRA/MO7enZnSVT7uHKdovzejN4FEL15tzLyxkg9f/GGkYkzdVSAf7
	QBulGRavcuAbwwDV73WuNiTBLRJtEfY+XpdkBNF54u1FtU6STYS8Vcuw9BZ07jMzFyIYWKEmL2WFT
	kd7t9GO5O4gwYnqYFMPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n1gKO-00G3kg-Mb; Mon, 27 Dec 2021 03:05:36 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n1gKL-00G3k7-Ut
 for linux-riscv@lists.infradead.org; Mon, 27 Dec 2021 03:05:35 +0000
Received: by mail-pf1-x434.google.com with SMTP id c2so12598425pfc.1
 for <linux-riscv@lists.infradead.org>; Sun, 26 Dec 2021 19:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=dGqwsw/SIIdqWvaKeKwu/tVA9A1cy1/HMgE5QohgKlU=;
 b=Kl9q2qVKSrylxgD0urqVHCWFl3B8NzwKjCXYywt+moEF6EXD/nIFuioHvvrjZ74dq4
 COyilWJHHpo2PTntECJylnDQUpLNi0uC7dEPEfgfYs4J94ZGcnWPHtANxnJOR6bK+ZPD
 fX8mQFQGFgKRgySvkzw0xs3FRowwgd9aF1mrTOqiXPFtj+cPE50GyDlOgNrBelN7esFS
 843ooQz7wvle/IZJe3eHMOy7wjN8L/NmiJJby6/44yro8owB8wyhiCF5uqZtcfu3BtNc
 tAOWpVQvSzkv1Z6AVnb1VFyLURI4mptK2uZwM7aO2jkPVHUKYUDwmDXlHHYqVJnHUXN5
 tFLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=dGqwsw/SIIdqWvaKeKwu/tVA9A1cy1/HMgE5QohgKlU=;
 b=fI+nQ+3PhaJeIZ9F/fPHzz93Z9gJpnTJOsfyt218fmWik/1RFIeovFRgYIM+BGHKKe
 7hZdMmAib7Y30uWX4dpUqNwz4klBItQCZbDfOMtFxK5Hw4ILPGfxdzm0YarSWtDsjbrn
 97DBEzbH9XPOGRSOUIvSLDp954TFMj+H3vPelcJSPxu1I6dP90yW8ZJvOpN5nfnh3OS8
 xpDGkWvvs93ZOE3OG9oVEcW3OH9SqvUCm8tYdC6jrAiywleY250hR98aFUCTT2Oh+1rd
 5PRdHJm1A6sPns5c9PmU8msdUpCnxgRZLgbU/Aio2+x4Aj0dDSZfGqBQaLFGsqJo3+3B
 AMcQ==
X-Gm-Message-State: AOAM532v54I2/AtMSI9NHGW1GwA1NUtlEdAhsxJDrkQrn4tMOWn7KEkY
 5oVQrJPRj+wyMmHiZtqaHpYbUw==
X-Google-Smtp-Source: ABdhPJz/JwlWWdFL4Jpz/lZX4PtnvXc+0OjTxMyF4j9YepvyHlXwG6prmSxMMLgq/8ne80iSJ/I4BQ==
X-Received: by 2002:a63:cd58:: with SMTP id a24mr13919898pgj.15.1640574333060; 
 Sun, 26 Dec 2021 19:05:33 -0800 (PST)
Received: from VincentChen-ThinkPad-T480s.internal.sifive.com
 (36-226-186-250.dynamic-ip.hinet.net. [36.226.186.250])
 by smtp.gmail.com with ESMTPSA id n14sm12818917pgd.80.2021.12.26.19.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 19:05:32 -0800 (PST)
From: Vincent Chen <vincent.chen@sifive.com>
To: anup.patel@wdc.com,
	atish.patra@wdc.com
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH v2] KVM: RISC-V: Avoid spurious virtual interrupts after
 clearing hideleg CSR
Date: Mon, 27 Dec 2021 11:05:14 +0800
Message-Id: <20211227030514.1426-1-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211226_190534_045698_BE4D728D 
X-CRM114-Status: UNSURE (   7.51  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

When the last VM is terminated, the host kernel will invoke function
hardware_disable_nolock() on each CPU to disable the related virtualization
functions. Here, RISC-V currently only clears hideleg CSR and hedeleg CSR.
This behavior will cause the host kernel to receive spurious interrupts if
hvip CSR has pending interrupts and the corresponding enable bits in vsie
CSR are asserted. To avoid it, hvip CSR and vsie CSR must be cleared
before clearing hideleg CSR.

Fixes: 99cdc6c18c2d ("RISC-V: Add initial skeletal KVM support")
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Reviewed-by: Anup Patel <anup.patel@wdc.com>
---
 arch/riscv/kvm/main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 421ecf4e6360..18e7a979740c 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -58,6 +58,14 @@ int kvm_arch_hardware_enable(void)
 
 void kvm_arch_hardware_disable(void)
 {
+	/*
+	 * After clearing the hideleg CSR, the host kernel will receive spurious
+	 * interrupts if hvip CSR has pending interrupts and the corresponding
+	 * enable bits in vsie CSR are asserted. To avoid it, hvip CSR and
+	 * vsie CSR must be cleared before clearing hideleg CSR.
+	 */
+	csr_write(CSR_VSIE, 0);
+	csr_write(CSR_HVIP, 0);
 	csr_write(CSR_HEDELEG, 0);
 	csr_write(CSR_HIDELEG, 0);
 }
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
