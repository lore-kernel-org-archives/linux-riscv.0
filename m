Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F36AFC2A062
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jan 2026 13:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jSg5j1E4ohxcGOZqSX96pGWwbzfzVctLJ2Jd7i56GvU=; b=0aWzhFDk6XwSeT
	r0Q/q+rjE36ypXwFJuea3HVPZCKSvjKShlwL49N7zXcXA/l9ZEtVb7sapi5OtTKXr7b/CZVWKFncF
	OOnAKKI6eyiMyo82mEYhlD8mFRj9mT7trbVTApxEpaGT0CtBZ/ReAld5GD00RFIWTnebQkxdpqJfF
	la6+clvtoTNaMNctB1Hv6ALtKh6D/xYiv1ACbb7NsrUh4ZCEKxVwH2g/RqF9GoOyI6Fg6iilR1/za
	YILn0hdXflxzmGaTlZE16UeL8a+By6obeCRcL5y4BPmr2OAworCCxgITRTv3mBGEAICqSxLjHfmnq
	c7B9R7pDpLbH3QTVLBZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcOGR-0000000AGBX-09E1;
	Sun, 04 Jan 2026 13:35:23 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcOGO-0000000AG9y-0E5b
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jan 2026 13:35:21 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2a110548cdeso178808895ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 04 Jan 2026 05:35:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1767533714; x=1768138514; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JvZUDpxx2/TZemLMHA7g/NjnGnb9ciURwwd/us/xC4Y=;
        b=IxBvH7H/I18/0rmU+2Am0dbMbsH8wsRv3+VXfg0pGLSdSOHa4QEf9fLKKKiY6wEWj8
         cvU6cn8gMv/fgQYmNEnrrWEY63GnFhCBjNvDw116jzKlbOaTd5dovk6pNEEv98/X9XTz
         UO2hD3uk+NY+HRF0mV7V8aPtgZtfVGEINqKGJQlfDq9Ny6eQn7DhI1z2zuGDG2D6/yyx
         mAtDYZ7ooWjszFGHz9kaB2SOCX5+6Sx9oHQttwonrzJt8LD58lGY7XOn0uBBdrPpBKoN
         DJJdPkjHpU1DCksV8K65rjQ29zqpApoWoX+DpaFahTFvgnr4pK8nA32yosJlKdE35jvU
         2dVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767533714; x=1768138514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvZUDpxx2/TZemLMHA7g/NjnGnb9ciURwwd/us/xC4Y=;
        b=vOT5PU2cziiL6Ls9J+KZzbwDRp2P5bikw/xO5rKzmb9O4ljKQ4Lp7SmRN5LZKNDaiH
         6tnr5TVbXkZAK4velQ2ZTGIjwpCUS2ZjAp+nvszY0J6GIze8/uiIdi4cNrWvz3TSjsxb
         ssbE5Rrpt8Ic3fyOx1rCL4Q84Kp0lbHqJrDZMkCIU65i39II0uwb23er2YSjnvnlivOV
         AOK5lmtM+29PuFWlO9AbAAqYpGda6s7o/tn+2DUO9je/LVXpPt+H1fZM/bvQZa1UnJdW
         7VNgAY2uoTT+ga01uUK7gX3z6YYjk+WCJCbWSUh/Vr72B8Ow3FDa6AI7ZD8e4WrBTdmI
         hzzw==
X-Forwarded-Encrypted: i=1; AJvYcCUhsc2jc58bPl1YXqUsjebqOhgkX+vrYrMJ5Nx31snFhBUbSrncS4rOtylWxu5AktRmeKwUKj3QXWaglA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb5EzwiYRVpuBM58dtMd3AJXXCewASleOWoCImb3B+tMDmos6h
	sPaWG7s6bdDsCZedOdnf2v3jo8uaPAmGoL/WcSxRq1vuPcby86WgVxvMu9UyDTbMPSk=
X-Gm-Gg: AY/fxX6J3hcLEq5OkbfDlsVZyS04VB5RYJm2+U8U2HwtebsIpa5RoJxKiGH4BCvaE6b
	tHJ/Qfn159mPNSoBnui6iAwsFtJcDeknvH0z7YlhmwyUkdDrbftfeeWpUVW/34spFiP2FGOS7hM
	3hs0e0CHK02VwEZUoAXLBMcTy8t8hyJ9KQG/vI0xehZQNZ7ADrFhWYnbk5E8uI8DMleUCbqm+Hw
	8iTTPUme0pfJMyyAD9RcrmjunV1NH+RIv1i4e1Dh2SbEn01Zj5lOl7lTdgjkHx2e9l3a2yLqtSP
	YCiDw3P3zdcfZCqZid5O5VRw69lUhBui8tIYgslVt5R1pf1QO9ogLxVTZXjIybTW0CQGXkbCxYI
	NMYDFf3BirtclSskSe/PzhPSzq6Os9Jx6/rz5IMmKtQgHzOsvq6XaioWiJ1Ln2P63YoEQtlhR5o
	NmvHmzqp1sgYNZHlNHhxOtP2XkAMxW2vn6rR82oRKHedlAzQdlVEv2rwhNqFE+CbYFuAMMBkMmv
	w==
X-Google-Smtp-Source: AGHT+IF6pqf+xAoe4xEDhrknYrrwm/vNFvihqgaZg1GfeAvx7Byc3K7yYVMaT/2jX/ci+jocfmEzpg==
X-Received: by 2002:a17:903:b8b:b0:2a1:1074:4199 with SMTP id d9443c01a7336-2a2f2830f89mr406839395ad.32.1767533707326;
        Sun, 04 Jan 2026 05:35:07 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3c949fb63sm30428785ad.53.2026.01.04.05.35.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Jan 2026 05:35:06 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@linutronix.de
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v5] irqchip/riscv-imsic: Adjust the number of available guest irq files
Date: Sun,  4 Jan 2026 21:34:57 +0800
Message-ID: <20260104133457.57742-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_053520_448143_9CA6AC3C 
X-CRM114-Status: GOOD (  16.02  )
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

Currently, KVM assumes the minimum of implemented HGEIE bits and
"BIT(gc->guest_index_bits) - 1" as the number of guest files available
across all CPUs. This will not work when CPUs have different number
of guest files because KVM may incorrectly allocate a guest file on a
CPU with fewer guest files.

To address above, during initialization, calculate the number of
available guest interrupt files according to MMIO resources and
constrain the number of guest interrupt files that can be allocated
by KVM.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/kvm/aia.c                    |  2 +-
 drivers/irqchip/irq-riscv-imsic-state.c | 12 +++++++++++-
 include/linux/irqchip/riscv-imsic.h     |  3 +++
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index dad3181856600..cac3c2b51d724 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -630,7 +630,7 @@ int kvm_riscv_aia_init(void)
 	 */
 	if (gc)
 		kvm_riscv_aia_nr_hgei = min((ulong)kvm_riscv_aia_nr_hgei,
-					    BIT(gc->guest_index_bits) - 1);
+					    gc->nr_guest_files);
 	else
 		kvm_riscv_aia_nr_hgei = 0;
 
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index dc95ad856d80a..e8f20efb028be 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -794,7 +794,7 @@ static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
 
 int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 {
-	u32 i, j, index, nr_parent_irqs, nr_mmios, nr_handlers = 0;
+	u32 i, j, index, nr_parent_irqs, nr_mmios, nr_guest_files, nr_handlers = 0;
 	struct imsic_global_config *global;
 	struct imsic_local_config *local;
 	void __iomem **mmios_va = NULL;
@@ -888,6 +888,7 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 	}
 
 	/* Configure handlers for target CPUs */
+	global->nr_guest_files = BIT(global->guest_index_bits) - 1;
 	for (i = 0; i < nr_parent_irqs; i++) {
 		rc = imsic_get_parent_hartid(fwnode, i, &hartid);
 		if (rc) {
@@ -928,6 +929,15 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 		local->msi_pa = mmios[index].start + reloff;
 		local->msi_va = mmios_va[index] + reloff;
 
+		/*
+		 * KVM uses global->nr_guest_files to determine the available guest
+		 * interrupt files on each CPU. Take the minimum number of guest
+		 * interrupt files across all CPUs to avoid KVM incorrectly allocating
+		 * an unexisted or unmapped guest interrupt file on some CPUs.
+		 */
+		nr_guest_files = (resource_size(&mmios[index]) - reloff) / IMSIC_MMIO_PAGE_SZ - 1;
+		global->nr_guest_files = min(global->nr_guest_files, nr_guest_files);
+
 		nr_handlers++;
 	}
 
diff --git a/include/linux/irqchip/riscv-imsic.h b/include/linux/irqchip/riscv-imsic.h
index 7494952c55187..43aed52385008 100644
--- a/include/linux/irqchip/riscv-imsic.h
+++ b/include/linux/irqchip/riscv-imsic.h
@@ -69,6 +69,9 @@ struct imsic_global_config {
 	/* Number of guest interrupt identities */
 	u32					nr_guest_ids;
 
+	/* Number of guest interrupt files per core */
+	u32					nr_guest_files;
+
 	/* Per-CPU IMSIC addresses */
 	struct imsic_local_config __percpu	*local;
 };
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
