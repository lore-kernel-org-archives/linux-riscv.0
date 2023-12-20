Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E38C46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 16:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aT5NTmgeAq0JsUiWUagcIKdrSlBtWCQzZvsLViQvqkQ=; b=m7113e6aA32H3S
	TvfkSLD4ksDSFnhKDGRFBGnB7qoxp8Xi94aRXkle0H/aYTLG5/s2aqt0GrpBTqxug2jOqfrjiYGQp
	Qvhx/h2f+sxvDAgQHwqoYnuDuvnKCDjt7Ehms+PI9KUAESjSBpurrZhmlizdcEoT70XA75IXu9g84
	lfQJ620Q9GrR/zY5Soj8qvsTJSLEhETMBjuPIeXVeRheclJf9ocWbjKHzVM3R89kA6Sq+FZ15KnDh
	rM7K6wBHFRWNO2Tp+BJkdYa4TL4rcKx1pzL0xkppS08PKqwMe0FGXBCHjrl7O2ma+N/qygprcAOMZ
	oI7Vlzw0CmQY8NGgdbRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFz09-000MHl-1L;
	Wed, 20 Dec 2023 16:00:53 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyzq-000LxS-2W
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 16:00:36 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40c38e292c8so5828795e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 08:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703088033; x=1703692833; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VzYdl48Qu5esNXPbSwOP+CU6JD+JcYH87so17FZbvqA=;
        b=aNCtCG3Lkwr7lJ6Qitt1txa6J+mSo/QlIrp/GVqciilsEFnYTxAfpbGtFJbfJT6RAx
         ORzag9CIgF/m0Xe00hqDHgtItM/OlBv4lzkUfzVXtBOb1ElZPZs+pWByjgknV8GnrvHb
         aM2D4iou9GPkKooib9hglRghBB8zJgxwNq7gsnAXk9mUaTWJ4WEsc35+Iwe1LZo/9wG+
         Zj+5eArAWFuOH4nABxm7SWhoBf+zuD6Hk6RbuFLB9CneRYcOYISMJw4lLKL5r/clEdsH
         mYafHplWeMHDbwNuviCVK6mW78IxSjY6OzMU8vy7BY9lBT+i4Sy0BYUq4T9PFgwtMJXb
         X4Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703088033; x=1703692833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VzYdl48Qu5esNXPbSwOP+CU6JD+JcYH87so17FZbvqA=;
        b=Y1YKIhTgLDvFPZuE5txa7vJpFCT3cHqw3GjOR/W9cCbISpmxhV2Gq0U4MnyS307pIC
         C5FeBJ5oU8/qaT4PfVO0IgFnJ6CdZBcJPFadivpvr4cqTM3qtJtID1hx0d/nz4hHJEXV
         S5MunK/kTzOFv80HTOKqlvUr2sKi4j7SQ84WFC1pJbyc7KdDYXPySK3l4ZGSfiB79Rsv
         G5batToR0GkNdBr5qhELY3SUeQs3gHU8pPtCoI/MwEE1AW0l5IYNqXnxmpj0eq8/gXuP
         zbdvvahR7VDyehF8pTzjqvsfX9R9WFQUsdxzbZivdFa9oKsWf////l1kBaRdwZhkvrnS
         zVxQ==
X-Gm-Message-State: AOJu0Yx3uR+OBHt5vzG4/USHSrjtZATno9BY0UjdpIF8M4KcIAo/HWmx
	kS2MyVj3NUCEWFwAwwfOi+HfjenT1YeIYQ==
X-Google-Smtp-Source: AGHT+IE2QaQuI9sTDEwmQ5L0J8v/ZOAqNOWfssdYwo0NHGA5EvJQcP/ys+t3hMIZlKA61rdHjaH6Kw==
X-Received: by 2002:a05:600c:3514:b0:40c:28ce:5d4 with SMTP id h20-20020a05600c351400b0040c28ce05d4mr1584057wmq.8.1703088033363;
        Wed, 20 Dec 2023 08:00:33 -0800 (PST)
Received: from localhost (cst-prg-16-115.cust.vodafone.cz. [46.135.16.115])
        by smtp.gmail.com with ESMTPSA id e18-20020adffc52000000b003366b15ddfasm7271251wrs.82.2023.12.20.08.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 08:00:32 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	pbonzini@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgross@suse.com,
	srivatsa@csail.mit.edu,
	guoren@kernel.org,
	conor.dooley@microchip.com,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v4 06/13] RISC-V: KVM: Add SBI STA info to vcpu_arch
Date: Wed, 20 Dec 2023 17:00:19 +0100
Message-ID: <20231220160012.40184-21-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220160012.40184-15-ajones@ventanamicro.com>
References: <20231220160012.40184-15-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_080035_109706_49A601AE 
X-CRM114-Status: GOOD (  13.25  )
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

KVM's implementation of SBI STA needs to track the address of each
VCPU's steal-time shared memory region as well as the amount of
stolen time. Add a structure to vcpu_arch to contain this state
and make sure that the address is always set to INVALID_GPA on
vcpu reset. And, of course, ensure KVM won't try to update steal-
time when the shared memory address is invalid.

Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h |  7 +++++++
 arch/riscv/kvm/vcpu.c             |  2 ++
 arch/riscv/kvm/vcpu_sbi_sta.c     | 10 ++++++++++
 3 files changed, 19 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 230b82c3118d..525cba63e0c5 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -263,6 +263,12 @@ struct kvm_vcpu_arch {
 
 	/* 'static' configurations which are set only once */
 	struct kvm_vcpu_config cfg;
+
+	/* SBI steal-time accounting */
+	struct {
+		gpa_t shmem;
+		u64 last_steal;
+	} sta;
 };
 
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
@@ -373,6 +379,7 @@ bool kvm_riscv_vcpu_has_interrupts(struct kvm_vcpu *vcpu, u64 mask);
 void kvm_riscv_vcpu_power_off(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_power_on(struct kvm_vcpu *vcpu);
 
+void kvm_riscv_vcpu_sbi_sta_reset(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu);
 
 #endif /* __RISCV_KVM_HOST_H__ */
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 6995b8b641e4..b5ca9f2e98ac 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -83,6 +83,8 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 	vcpu->arch.hfence_tail = 0;
 	memset(vcpu->arch.hfence_queue, 0, sizeof(vcpu->arch.hfence_queue));
 
+	kvm_riscv_vcpu_sbi_sta_reset(vcpu);
+
 	/* Reset the guest CSRs for hotplug usecase */
 	if (loaded)
 		kvm_arch_vcpu_load(vcpu, smp_processor_id());
diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index e28351c9488b..6592d287fc4e 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -8,8 +8,18 @@
 #include <asm/kvm_vcpu_sbi.h>
 #include <asm/sbi.h>
 
+void kvm_riscv_vcpu_sbi_sta_reset(struct kvm_vcpu *vcpu)
+{
+	vcpu->arch.sta.shmem = INVALID_GPA;
+	vcpu->arch.sta.last_steal = 0;
+}
+
 void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
 {
+	gpa_t shmem = vcpu->arch.sta.shmem;
+
+	if (shmem == INVALID_GPA)
+		return;
 }
 
 static int kvm_sbi_sta_steal_time_set_shmem(struct kvm_vcpu *vcpu)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
