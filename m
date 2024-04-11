Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962F0CD128A
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 09:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=joXSjHxj130oY7MFB3XKTtbhIOn0OzOgnCaZWhaFwHU=; b=vhtofx0r5fzS4+
	ZSPqbQlmklsqDK3S1ESlkqVT2lqhjKaL2MxtoHyrTZu3/1DLVL8W6uyjyOY+RqBRdE2kqWiOQcOby
	J3jCIToLtfAyXS56zAQet7BVgL53zM4HOx5YK1/awYr16NQRzQtO2ePbgkJhB6Sw0QeIum6cEHvLe
	0mFOi8xG+nfpw5OWOjPqNCt3AW0BUtBdAtd7VwA0gR5vgOL3XyIdeiBwUAh8Ki0MGQTs229K4d2FL
	//chH9CdfTCAYOHyZCufF93CDmtrZXOn2mtNC/v3RqKTrnJ0ubhWlSNdP02x7VD7Ix2Zi3lWLo2Xk
	8kY8+mpC9/eu3KjZVz1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruqOg-0000000BF81-3ONG;
	Thu, 11 Apr 2024 09:07:06 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruqOb-0000000BF0r-00qf
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 09:07:03 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6ed691fb83eso2898681b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2024 02:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1712826416; x=1713431216; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXD3qtP3CDUjevrxBmZTbJq+qLx3zHWdB21VYaybQbQ=;
        b=A7C0M03PneI1v1GUsJbmfi2dCC8/dv6zP1l6eO9kxpuqifuL4IT+darg9czq46siDB
         kw3xbmoLsPidJLg9lguPPnZTd4Z4pcluV1l8nQfxoUbB/aUZPxID8zIsmC7xJEbFKZr6
         7H2h0a785vvzjLJIC2r3GWokaOIidHreiy8hz0QVy8CwNuUtTRwUHlkKKsBKy56Wx7bg
         eTu0/jxDUM7sNJSNSv5CGbsiV0mfSSJkLDQqm/lMhpoNXQXcFWMK7tnFYcP5yph1B6+m
         atEcWEPUz8OByg0GQ5UUI4HZAvmlZoeI9ziqaBXMbGkxbKk4QeQg3314hR/iboqci+Kp
         5Fog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712826416; x=1713431216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CXD3qtP3CDUjevrxBmZTbJq+qLx3zHWdB21VYaybQbQ=;
        b=dVpZMmfw0re6G9DBBKSYuK7l3fzZNP3VXwWa3/qWMmJG6CvSdEsCAGE1gp9ogQhK9j
         m83TuRsl9TE5MwDAB/OPfsbShfybZQUbH/HfDUKk7u5d5BA+d9V+Rv/l3ijACIl9u5yf
         tCW6rNU8LmkxawvyjI+2whVh4ehPn8lWkRBUoyh3SfSTnO8WaCbLO+qvW7tdlN1RK6r6
         uDD1uL/rGifqK6ixQHiEEafi+QfKDZNoYvw26DmIOLesptz6htmHXz9rrMmQ1c6OcVqi
         mDuXPWxaoMcE1Mt+HFm7R6A4eFUe/x+HJpirQYLdDW7UO0lNsSpPmfrKOakURgp0Fqrz
         DOQA==
X-Forwarded-Encrypted: i=1; AJvYcCVUnNEyq1WkfCU8NIX01XmnSWsjtImPOWLO+1bac7MKf153nr5bCwNbL/Umr5rvJG11R96iuMynRNgBzlmM9TXAaF3fjdZKUphKTdS5AzSl
X-Gm-Message-State: AOJu0YyT/zLKCyDg6nWNJAihziFZaaSkP1mXtKwcp+x7M06t6ap4Qm3K
	6HqPiOs02BFANFG6Nr0rCtS5XuqjeRW3l0EHbNq5AxLgAVksAKYnTseF5mg0fB8=
X-Google-Smtp-Source: AGHT+IGX6O8bt1yPLmnfze8p06yu78d6f+V9zy0fus6DLrMlig86+tMSW5Fnv40gEVzwp+6iihayww==
X-Received: by 2002:a05:6a00:181b:b0:6ea:950f:7d29 with SMTP id y27-20020a056a00181b00b006ea950f7d29mr5252624pfa.20.1712826416364;
        Thu, 11 Apr 2024 02:06:56 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.82.118])
        by smtp.gmail.com with ESMTPSA id e21-20020aa78c55000000b006e729dd12d5sm816738pfd.48.2024.04.11.02.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 02:06:55 -0700 (PDT)
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
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/2] RISC-V: KVM: Use IMSIC guest files when available
Date: Thu, 11 Apr 2024 14:36:39 +0530
Message-Id: <20240411090639.237119-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411090639.237119-1-apatel@ventanamicro.com>
References: <20240411090639.237119-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_020701_052960_8C76096D 
X-CRM114-Status: GOOD (  14.89  )
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

Let us discover and use IMSIC guest files from the IMSIC global
config provided by the IMSIC irqchip driver.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/aia.c | 33 ++++++++++++++++++++-------------
 1 file changed, 20 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 8ea51a791371..596209f1a6ff 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -394,6 +394,8 @@ int kvm_riscv_aia_alloc_hgei(int cpu, struct kvm_vcpu *owner,
 {
 	int ret = -ENOENT;
 	unsigned long flags;
+	const struct imsic_global_config *gc;
+	const struct imsic_local_config *lc;
 	struct aia_hgei_control *hgctrl = per_cpu_ptr(&aia_hgei, cpu);
 
 	if (!kvm_riscv_aia_available() || !hgctrl)
@@ -409,11 +411,14 @@ int kvm_riscv_aia_alloc_hgei(int cpu, struct kvm_vcpu *owner,
 
 	raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
 
-	/* TODO: To be updated later by AIA IMSIC HW guest file support */
-	if (hgei_va)
-		*hgei_va = NULL;
-	if (hgei_pa)
-		*hgei_pa = 0;
+	gc = imsic_get_global_config();
+	lc = (gc) ? per_cpu_ptr(gc->local, cpu) : NULL;
+	if (lc && ret > 0) {
+		if (hgei_va)
+			*hgei_va = lc->msi_va + (ret * IMSIC_MMIO_PAGE_SZ);
+		if (hgei_pa)
+			*hgei_pa = lc->msi_pa + (ret * IMSIC_MMIO_PAGE_SZ);
+	}
 
 	return ret;
 }
@@ -600,9 +605,11 @@ void kvm_riscv_aia_disable(void)
 int kvm_riscv_aia_init(void)
 {
 	int rc;
+	const struct imsic_global_config *gc;
 
 	if (!riscv_isa_extension_available(NULL, SxAIA))
 		return -ENODEV;
+	gc = imsic_get_global_config();
 
 	/* Figure-out number of bits in HGEIE */
 	csr_write(CSR_HGEIE, -1UL);
@@ -614,17 +621,17 @@ int kvm_riscv_aia_init(void)
 	/*
 	 * Number of usable HGEI lines should be minimum of per-HART
 	 * IMSIC guest files and number of bits in HGEIE
-	 *
-	 * TODO: To be updated later by AIA IMSIC HW guest file support
 	 */
-	kvm_riscv_aia_nr_hgei = 0;
+	if (gc)
+		kvm_riscv_aia_nr_hgei = min((ulong)kvm_riscv_aia_nr_hgei,
+					    BIT(gc->guest_index_bits) - 1);
+	else
+		kvm_riscv_aia_nr_hgei = 0;
 
-	/*
-	 * Find number of guest MSI IDs
-	 *
-	 * TODO: To be updated later by AIA IMSIC HW guest file support
-	 */
+	/* Find number of guest MSI IDs */
 	kvm_riscv_aia_max_ids = IMSIC_MAX_ID;
+	if (gc && kvm_riscv_aia_nr_hgei)
+		kvm_riscv_aia_max_ids = gc->nr_guest_ids + 1;
 
 	/* Initialize guest external interrupt line management */
 	rc = aia_hgei_init();
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
