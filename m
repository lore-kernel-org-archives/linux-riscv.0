Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87543D637B2
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Dec 2025 08:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Cubj117EqzbpBjDwIqcF/Rir+3bPUOQnFzfPmRxq/hs=; b=cSIl7qT3VoIkHt
	4WIX1HiSmCMcFpHzinCKccMjURFFwQ3s1GsiPWCrJWbYFxmTFJSMv6ZlwIQtslIqn7/b/hzgCHDFh
	ABSG55lXwrGuX4x36hSCkTJcmQA92r4hgXGUHDLa1/rZEMHC8qbx7UHHGA4fbif/4d1MM6mA5cOp3
	g6YH+EL/m3MMG3lmPzyxWKlLvV05aw+82A8+xxun4FDnhiDq1g3i+uccvJ/xFahd7vCgYf6fioQTU
	OPoW9l36mK8AD+SIrV3ksMQclrvfTn+n43E+J0wrgx8ynsMxEKFEmL4cVYIvmVYM4tJxHCikRrMju
	7fXZFlz3lxYyLYLftPVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWsl2-0000000BQrH-1JoP;
	Sat, 20 Dec 2025 08:56:12 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWskx-0000000BQqJ-0v2c
	for linux-riscv@lists.infradead.org;
	Sat, 20 Dec 2025 08:56:08 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-34c7d0c5ddaso1425866a91.0
        for <linux-riscv@lists.infradead.org>; Sat, 20 Dec 2025 00:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1766220964; x=1766825764; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HXENzr5z2plkFWLtxmfbha96E8Xbo/nXRtWKuaAr4kw=;
        b=YCIlNDX6LOH/vn0XBHhuvJ5mszKrljryYib/Jlnod0SWrdSCiH0IEyjC0VIGGSFSvV
         3zEoe7QJCwZhYN9wVqzzZgWOFyPXYp7Do5TAcA6PY8J7EJIg6uIQT8FwjMuJjqg3pNmr
         0Efp7IGdcOmpDtdt0GIKp/EDSek3k9d82YuMSpfVLq40KwwxZDqk7+vBfsj3wYfqW64M
         0EqZk5g3z1LRCYAT+5/szFlQsOvRE6xWeqZBDzYMinMtakutmSVLJag5KPQCvcL6hHwj
         Pk4CdZnby9IH1q/nzHcvFh84MJnZtDSWsO3feP52zSK4tJbxNyahqf+Sjr4O3Xh04PC0
         ZDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766220964; x=1766825764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXENzr5z2plkFWLtxmfbha96E8Xbo/nXRtWKuaAr4kw=;
        b=ew0Jji6BT8xTwtFn8t3PmiQz8nj2vM2hxsFi0Yop/2rSE43P79UpocWwZVIxgpCwMK
         +bUm+9Xk8k1tJnQ9tv798rgABxkpWukJIKPCxpZsuulcpNAnyx1EUjw28o58q2Ju9zRA
         dLSW2Kr/KbNRwJRCYw+lImBqFIxFduzJ2ULmlBPZo849h0fDiV5zt30t8zNIMhhcSh4h
         yQ5E1IOi5H7unKVaKFEk1jqZ/7OGY4LFTWe+vLje7a00RogLzRbeMevC4fSjTEDndY7C
         AJ2eWEweAh7x6NC0yjJC3GtKFA0FSI0v1EjJJPGxVarnUOlEPtQ4u2hJKoiGKitbrHmm
         H8dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM2qo/VTpux0dTqqwPC8EB6hegLwA1f1NhoHXYr2+ryqCTGtzXkTOhL1O2CTYkl3f+ISImDyB//2w8sw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeoKyf80N4+QWz1n3Gg8Jpn9Wmblms1HArzXVEwkHZtxXYJ4yj
	uyct5WmxZH3t/G+ZXzRv5OjhFHOlCM08G09R8MDsHSIMSahoJ4oX4LXSkgtkjqQfGEk=
X-Gm-Gg: AY/fxX6StiSAodADSkX0zdo7Sa9byuMEzhTGCaI6MyJHM78rTLS416qTBquxevikhVW
	aL6xDpWCADCtLRfbXFyywC0CkzXAMD86tElIEjYEDqNmse1OYDFROKB984HzeueQ+zIRmOOw4ME
	ZOEB6JrdPt3NxWMkYd0qasejs0S2R12MVOm2+UF/flvJ3CQ1IS0M2CtvuKfyYsvbUtg8GVi7DoD
	nEeLgFpZCUOypBVYHSYvH1sQp+xr/yCZl32zGvqZ0MtwLmW8bMTnf5F4d9vPeihZIroCvWuIn/i
	/RRTsqqOSpB63Jt0lhEOrPy7IOjYZa+mnBdpHtZUEAzM9wrZfs1Zlz+BPm4Xkxw8hXPT32UWw0s
	wb1K7wpXB0K9CE0UCaLFr1l2KsamvC+yydUIWreDCFddxB7BrEh2H5gxCk0hFVbyrJY6173SECq
	N2g2xmy3DcvHo66U/dw/mzKvGEPlqLKoWebrWmwqd1mb1OTEGOCV8x
X-Google-Smtp-Source: AGHT+IF05noiQi3hAuPe2AeRVjxn4xsojmQL6ESiyGT6IBKYv3sJCcgsagLTeD2lo/eEy1e2Bo8hYA==
X-Received: by 2002:a17:90a:fc4c:b0:343:e692:f8d7 with SMTP id 98e67ed59e1d1-34e90dcfcb4mr4666180a91.11.1766220963620;
        Sat, 20 Dec 2025 00:56:03 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70dbcb6esm7506626a91.9.2025.12.20.00.55.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 20 Dec 2025 00:56:03 -0800 (PST)
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
Subject: [PATCH] irqchip/riscv-imsic: Adjust vs irq files num according to MMIO resources
Date: Sat, 20 Dec 2025 16:55:50 +0800
Message-ID: <20251220085550.42647-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_005607_325682_E93C3EA9 
X-CRM114-Status: GOOD (  13.57  )
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

During initialization, kernel maps the MMIO resources of IMSIC, which is
parsed from ACPI or DTS and may not strictly contains all guest
interrupt files. Page fault happens when KVM wrongly allocates an
unmapped guest interrupt file and writes it.

Thus, during initialization, we calculate the number of available guest
interrupt files according to MMIO resources and constrain the number of
guest interrupt files that can be allocated by KVM.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/kvm/aia.c                    | 2 +-
 drivers/irqchip/irq-riscv-imsic-state.c | 7 ++++++-
 include/linux/irqchip/riscv-imsic.h     | 3 +++
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index dad3181856600..7b1f6adcf22d6 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -630,7 +630,7 @@ int kvm_riscv_aia_init(void)
 	 */
 	if (gc)
 		kvm_riscv_aia_nr_hgei = min((ulong)kvm_riscv_aia_nr_hgei,
-					    BIT(gc->guest_index_bits) - 1);
+					    BIT(gc->nr_guest_files) - 1);
 	else
 		kvm_riscv_aia_nr_hgei = 0;
 
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index dc95ad856d80a..1e982ce024a47 100644
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
@@ -928,6 +929,10 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 		local->msi_pa = mmios[index].start + reloff;
 		local->msi_va = mmios_va[index] + reloff;
 
+		nr_guest_files = (resource_size(&mmios[index]) - reloff) / IMSIC_MMIO_PAGE_SZ - 1;
+		global->nr_guest_files = global->nr_guest_files > nr_guest_files ? nr_guest_files :
+					 global->nr_guest_files;
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
