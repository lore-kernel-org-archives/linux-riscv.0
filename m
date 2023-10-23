Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 491B5C25B41
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Oct 2023 08:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/MoE5DawG/oz1HpT0S8jQR+4EIXK6eC4KV/wdNxp8ZY=; b=FRriEvLQ6DSNML
	82XodiPM+YsA/NE4TwJAvgS8sf00r+RJMyxyIZIUzo0gx5mDmVzNyRLOniEhGuXiIwNh+po1sM8Ja
	jT6kp1aEO00Pa7eXjGAz9rult/aSuuIPX9DOOkmMX5jwV8krf2aBpqN9TWHgxAlXxVnAbPdBVKZj9
	f8VnUTYrfxVYrbW5+ZeiZwlJkAt0g6JqpQytNWIN419zZbiiOnJ9QD+KFjQKWVlt7HtCHxFQtfRss
	K+Pq6V4XUV7tjqVggRA6K9AwuEzEprUdQFyz4SFOtpY+xHtu4QPmjOUqbWpdficgazLdyUOu5ChWV
	EyIW8k949kKEgqGQQHvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quqJv-006l4i-1z;
	Mon, 23 Oct 2023 08:29:55 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quqJs-006l1t-1F
	for linux-riscv@lists.infradead.org;
	Mon, 23 Oct 2023 08:29:53 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1bdf4752c3cso15992655ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Oct 2023 01:29:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1698049789; x=1698654589; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4WLOSQOA5Tm0Adw6Ut8ujQkn4XXYrNjbdXHKCGaB3LM=;
        b=MzCZPuLXMvd+nGO85zng0yKUML8RkiunMimT2sA0QZGYs3LL2SMlR73FZm3MAT+Cb4
         yY67oXLZoWnc4hVf5wCmmuDqhqBh+nKowl+jZnTx2cUZrlqL7DqPvPKEc5J9S+8wPftD
         J59dZRxsaRX/MvVb8kG/AepMuftaWRxui6+GfsUdp4gJ6HrQfa9aJTFfKVGsX+I1UYwt
         1f6cz3FlcWo6gu+4rocIa9qFdHXxrZbNWnu+CM7ShH6Y38JcYvmLfva7deECp0o/y64z
         txs55bIA+ni0AKVzAfqiDdj5HEBqH/eKBSk/yUxIPiRlHSH0qHcfIO/DfKwQH+37inKW
         rvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698049789; x=1698654589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WLOSQOA5Tm0Adw6Ut8ujQkn4XXYrNjbdXHKCGaB3LM=;
        b=V53zWPrgxVperzdYvroWe8rIbyJK6ljB/zuhCkYCmRF+XcB+BPULO00btPcsW8/+0t
         IliJV1sRNkYlMrIo1/N6kX07Ry6GessqJ+j9eGKAtSJWGhe+88AH1nrYlOho6Ge3YuiP
         0AQ4yn8MVY2CNiQmp+QjlyB3idB94QmXKG5UAfCZhpN8jyRkHQHT+8nEEpDwPL2dJJcg
         B+U+DjHExQdyPduoNVDmyVl726QEA4gjOqUTeEzXixiwlo9CZXGnINz1lJYzjOuQgUQq
         5C/31D1pekj1Pi86jdUh6my9sBMDk+dIkJA8CBkjV7daTNWeRGeDIzOTlNDyVV1ZzO3K
         La8Q==
X-Gm-Message-State: AOJu0Yws4R4Mm3MjZYVRzbuiaBsBTlPcRqc0GWiHf2MOsLFS/Qc//tW9
	HHkb5H8efhZ9eiJEVv3mW8ozUA==
X-Google-Smtp-Source: AGHT+IHnm6GiYKkee1BBGlEg9/2GVy9OXofYG3BGHLaj+6z7TyuT5to3Ev1GjwdsT/XgsL2yDJJgGg==
X-Received: by 2002:a17:902:e548:b0:1c9:b187:4d84 with SMTP id n8-20020a170902e54800b001c9b1874d84mr8674687plf.14.1698049789506;
        Mon, 23 Oct 2023 01:29:49 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([203.208.167.147])
        by smtp.gmail.com with ESMTPSA id d15-20020a170903230f00b001b8b07bc600sm5415805plh.186.2023.10.23.01.29.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Oct 2023 01:29:49 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	tglx@linutronix.de,
	maz@kernel.org,
	anup@brainfault.org,
	atishp@atishpatra.org
Cc: dengliang.1214@bytedance.com,
	liyu.yukiteru@bytedance.com,
	sunjiadong.lff@bytedance.com,
	xieyongji@bytedance.com,
	lihangjing@bytedance.com,
	chaiwen.cc@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC 05/12] riscv: kvm: Switch back to CSR_STATUS masking when entering guest
Date: Mon, 23 Oct 2023 16:29:04 +0800
Message-Id: <20231023082911.23242-6-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-145)
In-Reply-To: <20231023082911.23242-1-luxu.kernel@bytedance.com>
References: <20231023082911.23242-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_012952_424950_382D4C35 
X-CRM114-Status: GOOD (  10.27  )
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

When kvm enters vcpu, it first disables local irqs before preparing vcpu
context and uses SRET instruction to enter guest mode after vcpu context
is ready, which automatically restores guest's irq status. However, after
we switch to CSR_IE masking for interrupt disabling, the SRET instruction
itself can not restore guest's irq status correctly as interrupts are
still masked by CSR_IE.

This commit handles this special case by switching to traditional
CSR_STATUS way to disable irqs before entering guest mode.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/irqflags.h |  3 +++
 arch/riscv/kvm/vcpu.c             | 18 +++++++++++++-----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/irqflags.h b/arch/riscv/include/asm/irqflags.h
index e0ff37315178..60c19f8b57f0 100644
--- a/arch/riscv/include/asm/irqflags.h
+++ b/arch/riscv/include/asm/irqflags.h
@@ -64,6 +64,9 @@ static inline void arch_local_irq_restore(unsigned long flags)
 	csr_write(CSR_IE, flags);
 }
 
+#define local_irq_enable_vcpu_run		local_irq_switch_on
+#define local_irq_disable_vcpu_run		local_irq_switch_off
+
 #else /* CONFIG_RISCV_PSEUDO_NMI */
 
 /* read interrupt enabled status */
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 82229db1ce73..233408247da7 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -621,6 +621,14 @@ static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu)
 	guest_state_exit_irqoff();
 }
 
+#ifndef local_irq_enable_vcpu_run
+#define local_irq_enable_vcpu_run		local_irq_enable
+#endif
+
+#ifndef local_irq_disable_vcpu_run
+#define local_irq_disable_vcpu_run		local_irq_disable
+#endif
+
 int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 {
 	int ret;
@@ -685,7 +693,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 			continue;
 		}
 
-		local_irq_disable();
+		local_irq_disable_vcpu_run();
 
 		/*
 		 * Ensure we set mode to IN_GUEST_MODE after we disable
@@ -712,7 +720,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		    kvm_request_pending(vcpu) ||
 		    xfer_to_guest_mode_work_pending()) {
 			vcpu->mode = OUTSIDE_GUEST_MODE;
-			local_irq_enable();
+			local_irq_enable_vcpu_run();
 			preempt_enable();
 			kvm_vcpu_srcu_read_lock(vcpu);
 			continue;
@@ -757,12 +765,12 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		 * recognised, so we just hope that the CPU takes any pending
 		 * interrupts between the enable and disable.
 		 */
-		local_irq_enable();
-		local_irq_disable();
+		local_irq_enable_vcpu_run();
+		local_irq_disable_vcpu_run();
 
 		guest_timing_exit_irqoff();
 
-		local_irq_enable();
+		local_irq_enable_vcpu_run();
 
 		preempt_enable();
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
