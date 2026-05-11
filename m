Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BC4CD37AC
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 03:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QTfttkFtSNuxDxkGwWaJaaj7TXhubR3YGjzEe2MryLs=; b=A6btq5oFMp+/GY
	epQcEYg3U/FuT2xd4J5nuHS+ItxFm+AWkHcx0pzbtJI4NrjlkFuQFGXVgoMBwpnwBSnhvahwXQXu+
	g8xa4GwvEdnncvokely7V9YiBWe/GL6D9LNMi7Yh91nMFFAt+fYqGDb4Uy0HCISDoznVsBBS3MI2p
	kxkMqAHNvMXdVbCGHfntO2mj3+j3AIQY/3XeUFrUpist2OSo8lozlN0YgK4PknF1fzJn8LB6SFLK6
	FeRbXhwnw4ILYD5wdTYOSJURQ9Vfoq6mkH7n4W/mHVsNKq2eB55xjJTJeYYXrBT6WkCyruAiyd4jq
	S0nLtaR5BELu5A6GsLgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHDs-0000000CA6l-1tr9;
	Mon, 11 May 2026 03:22:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHDq-0000000CA6U-2By6
	for linux-riscv@bombadil.infradead.org;
	Mon, 11 May 2026 03:22:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=LE/4+F+CsUsIVKFjtrPVESM23HnQEEdghZta/8JF8Ek=; b=kiyhekiDygJgoe14tKyTE29VTs
	WzRTt1/ACHoNdVyyMXSFfRtsMyc3djTBAHReGX2mtiGF8TafiKYp5ouA3WVPODyCyYZ2sBnuhNxPE
	zS+ZOtB36z5yPcfulq3NLKP+BRH7XM5yBORNjO/0/pBae9q1ItLmxjaf1QOs4GDgy2AopuA9/BqHT
	1IU4ul3PVqLw3Q9p4sHYNyfa+KpudtYP4//km7M/N93QLBh/w3eHPl+aF/Lii9nbhY+QoQvzW+yPX
	eZvtgfbABtNIKN+NxE19VmuYfZAV5FeIotnpXdltW/hbcBuxJDlCgE6QXju9fY8f0XyXgxkTp0Kmb
	vHssqMvA==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMHDY-0000000AX42-3JRs
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 03:22:21 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2b9fcf7c91bso37367385ad.0
        for <linux-riscv@lists.infradead.org>; Sun, 10 May 2026 20:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778469722; x=1779074522; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LE/4+F+CsUsIVKFjtrPVESM23HnQEEdghZta/8JF8Ek=;
        b=dmhG2OI3Pg6KzxeS9k+zgrMAm8MaGSbXfmPTjpjviBOyQDL8CJCaxOI3ewjBREUQED
         IBQX3xecZDUOucANH6txebkJmTxi2QNuEvjzj6J4DipPjnQn8fJfZDB50H4Ohle880Bw
         EygJW2I2/XKVolTiNblqMKD5cP1FzeGFEzJQ0qx9HZD7gy99yXnCc+7Gd/G31OOSqn9c
         kO1hqKnddjXecqbJWxjCayM6Tf8J+8/2Mem9JX6Tjx3sbKSnZr4BsBWKsOwNQFXzAC/e
         Ks5OX8n+HvHZeqV5ax03do95J3m7GtgZynrmUEYUr0fNgfQ1RkAsYykVHvZUo3Sk3t9o
         PAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778469722; x=1779074522;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LE/4+F+CsUsIVKFjtrPVESM23HnQEEdghZta/8JF8Ek=;
        b=FbsO5EWEJaj9zo0T0pY5tBQZ9zwkQA8geF/j8FjkITUjJpz48Cm/zgbEkzsVLHAAIE
         lNdsIXAeU5gpEvkZBl+XspTwcxsa5UsipvCnBBUQpwpZeN0jRiepJcu0IWQBGXEPWhHF
         D39Pw+lVQKmqtfKVFviePW1qE103Qke+5Lm3xFhPHOCJhV8boGO6FVpoxjFGICAHcnjr
         0l4hmz1LLmhzdD/Ku2ULw4sc7/8AoWRmtHyGxoyomL1YYeZGw8p/l+HJa7PIYtMSA1V4
         00hhpgIpBQXEvh4YtZULUk7sc2IzIAHjhx3w+DqXsXFp0colMYc14EghRinJHUygWAVC
         azZA==
X-Gm-Message-State: AOJu0YygSZIUrEZinc4sdvsCp+BmpWXXGwC37kk8RQz2n+HRYq4EmlXI
	J73WnF2JYukhsRmDbm1vfLCGZceNYedImErMcuo460d5rA3FD5SplW76m8+iksTn
X-Gm-Gg: Acq92OF485zXRRZwHRAE8ajk8Krz/vxUR6OkjTvo0Nn6hGoEK5mfsDBanj6jqB6XuU+
	XBGtcxy+izss7D0nAfNTosiZqL92+5jUvJUooED2+kp9DEc/ILGdu4va6IPIfoAc0NkQa4MJfJi
	/aBPIO9pbNAVx4oycu263ZU9trzjItaB/BILSc1Y4WLrnx98alEYekxjnBZHkAgWjFYxqVa7auf
	JiaW88/REMGH1KE0PVCGrWEjQUdHYJwKlMwr6Kf06jwK76BBUs2lTLNggKWptMuYbmLNHOYraJ5
	mECxph3NTXiZ6AC/w0JoLSKIwj3TpafN1XqWPHb5bmuALrae++A2EKer4tVsacwbiGNctwrCG2i
	cvLkuEOrU2jX1UWDCFIle5Lr0Fkdi+0wl9cQamC88PWrb7i5faVu2F6hweIWDSTUX8UNYt0/xrB
	iqKs9rdnoBO2KaA9u9HosAAfSj5P+7h2jxuc9DyBSkvWZNeX0Oy19B4dW8etWrZ7eHCzIjCFPEl
	uuBSO4ml5poTjYuFxOCqH8sZgofP+VmZmVlZJBEWpGDGQ==
X-Received: by 2002:a17:903:1ab0:b0:2b2:4bf9:1766 with SMTP id d9443c01a7336-2ba7a34b378mr246513525ad.33.1778469722390;
        Sun, 10 May 2026 20:22:02 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1d269fcsm89856955ad.15.2026.05.10.20.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 20:22:01 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	kvm@vger.kernel.org (open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)),
	kvm-riscv@lists.infradead.org (open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)),
	linux-kernel@vger.kernel.org (open list),
	linux-hardening@vger.kernel.org (open list:KERNEL HARDENING (not covered by other areas):Keyword:\b__counted_by(_le|_be)?\b)
Subject: [PATCH] RISC-V: KVM: Use flexible array for APLIC IRQ state
Date: Sun, 10 May 2026 20:21:44 -0700
Message-ID: <20260511032144.361520-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_042216_809296_9BB1746F 
X-CRM114-Status: GOOD (  12.53  )
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

Store the per-source APLIC IRQ state in the APLIC allocation instead
of allocating it separately.

This ties the IRQ state lifetime directly to the APLIC state, removes a
separate allocation failure path, and lets __counted_by() describe the
array bounds.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/riscv/kvm/aia_aplic.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/kvm/aia_aplic.c b/arch/riscv/kvm/aia_aplic.c
index 3464f3351df7..748107c347d9 100644
--- a/arch/riscv/kvm/aia_aplic.c
+++ b/arch/riscv/kvm/aia_aplic.c
@@ -35,7 +35,7 @@ struct aplic {
 
 	u32 nr_irqs;
 	u32 nr_words;
-	struct aplic_irq *irqs;
+	struct aplic_irq irqs[] __counted_by(nr_irqs);
 };
 
 static u32 aplic_read_sourcecfg(struct aplic *aplic, u32 irq)
@@ -581,7 +581,7 @@ int kvm_riscv_aia_aplic_init(struct kvm *kvm)
 		return 0;
 
 	/* Allocate APLIC global state */
-	aplic = kzalloc_obj(*aplic);
+	aplic = kzalloc_flex(*aplic, irqs, kvm->arch.aia.nr_sources + 1);
 	if (!aplic)
 		return -ENOMEM;
 	kvm->arch.aia.aplic_state = aplic;
@@ -589,11 +589,6 @@ int kvm_riscv_aia_aplic_init(struct kvm *kvm)
 	/* Setup APLIC IRQs */
 	aplic->nr_irqs = kvm->arch.aia.nr_sources + 1;
 	aplic->nr_words = DIV_ROUND_UP(aplic->nr_irqs, 32);
-	aplic->irqs = kzalloc_objs(*aplic->irqs, aplic->nr_irqs);
-	if (!aplic->irqs) {
-		ret = -ENOMEM;
-		goto fail_free_aplic;
-	}
 	for (i = 0; i < aplic->nr_irqs; i++)
 		raw_spin_lock_init(&aplic->irqs[i].lock);
 
@@ -606,7 +601,7 @@ int kvm_riscv_aia_aplic_init(struct kvm *kvm)
 				      &aplic->iodev);
 	mutex_unlock(&kvm->slots_lock);
 	if (ret)
-		goto fail_free_aplic_irqs;
+		goto fail_free_aplic;
 
 	/* Setup default IRQ routing */
 	ret = kvm_riscv_setup_default_irq_routing(kvm, aplic->nr_irqs);
@@ -619,8 +614,6 @@ int kvm_riscv_aia_aplic_init(struct kvm *kvm)
 	mutex_lock(&kvm->slots_lock);
 	kvm_io_bus_unregister_dev(kvm, KVM_MMIO_BUS, &aplic->iodev);
 	mutex_unlock(&kvm->slots_lock);
-fail_free_aplic_irqs:
-	kfree(aplic->irqs);
 fail_free_aplic:
 	kvm->arch.aia.aplic_state = NULL;
 	kfree(aplic);
@@ -638,8 +631,6 @@ void kvm_riscv_aia_aplic_cleanup(struct kvm *kvm)
 	kvm_io_bus_unregister_dev(kvm, KVM_MMIO_BUS, &aplic->iodev);
 	mutex_unlock(&kvm->slots_lock);
 
-	kfree(aplic->irqs);
-
 	kvm->arch.aia.aplic_state = NULL;
 	kfree(aplic);
 }
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
