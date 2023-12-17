Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 704EAC3DA6E
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 20:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fb2P6la1CxrlNM7//VjG4UxLrvHu1U3q6BddSmpUmcg=; b=thyogmcT8pu5QO
	ovtmdfSG/GVyWuPO7V0ZDJ8T2MmNyrEweGoe5NZtTktizaBWOtg7EeZ/res5A/x5NdR9w8N2n3vXF
	x+jBjFhgCDccDnn6Q/qyY4hZpqOhqy1yf1uIPoaT8Wk2pdzJXnJOtvBPCBb2RTeqeQ3j1pgOV25JU
	CeCTepI7r4S3RinU7ru+nFgtSRed1jgSSAD0F1KWpBm3jMaeurb4kHsdhcpbQJUYI92TY4AApciza
	dBPBJ+WyJcLq0E7ult0uUcB4muyK/I+RU1t9objR7lvBZpasQkBIx6sDXPSudQcMIanvOKIBSbRIT
	+xf5S70WCW2DO8GKwTSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rExwO-008QAV-0X;
	Sun, 17 Dec 2023 20:40:48 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rExwI-008Q3Z-2Z
	for linux-riscv@lists.infradead.org;
	Sun, 17 Dec 2023 20:40:44 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-54c70c70952so2809670a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 17 Dec 2023 12:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702845640; x=1703450440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/JsdsBfwTQ+WtoE+ZqPAArqtl47MKSL1wHIgI3qALc=;
        b=HvG2oLSlF9fFKVZCuUHkFueFtjAwWPbuKgFnP9fdHveL0JMlWUKcBnm+t57PN8OTJ4
         lqrM/19xKJJORyM1Qua3lbigu+DKf9AqmndF0jdlUzF+Q8aHqkb4G1m4bXVgSwxWw4zq
         gBZCn4o5hdoTVjmD1iNbAcpgkccYg2F9EWJQBZXPzOf28AGJZEn5715jvJmz30UabzUa
         qQw/hPvEFzJvVBKdCKrpyW49D2WAD4u8LrvUpOEt1tA8Sa1Etz7Xx9YVL1hTzdTvhr8z
         MDw4y5K+NxBtIKSooG/RCGPtzS2uwhLEtB7M70Y37RirK6PSH6Z7x4vpKCJI2cC0d/uS
         MaKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702845640; x=1703450440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e/JsdsBfwTQ+WtoE+ZqPAArqtl47MKSL1wHIgI3qALc=;
        b=NBBiaIhtRkedrW9XhBTYxpu788HNoG3gH13tAHEEIiyUTsDgTkna9jumjdlScdMQ8n
         rUVjr2DkFQJUEvDHK1ragV7+SOn5SEacNtIfbWWbHnbtjwmb/SmFdjm5a+Puq8J0aR1r
         amYD9o9Jo7i3g7rxMr6Ik83Zovpn0XNZ558k0D6g1EoFp0TQ4PD9OdBzLgts7kKvERAI
         4a0SYQIVFERs6QRH3vzv2pcrHfnt3bHHYxdqrJFW5Gk/a5d1fRame4cP33rnVbU7NJuc
         BeIr4IcdwZCqQEe0eG4ANxKTH9u0/BgeaOBKxkhXjrO5HOx98n34mZvwq7GDUhoHBHOt
         rbMw==
X-Gm-Message-State: AOJu0YxR+V/5G9mD97WV993yWNUC+tqjomCb63/FLaHkc20LXp8T4gFt
	1dY+IU6tBgoVOahCbiJ5sA5Lew==
X-Google-Smtp-Source: AGHT+IFR1J9OT5X4e0axZZpDP0qQuLSOAw+65TiLvqTzqYi3kfqjSPifUFVpqKX1wfG6EKURYOYfHQ==
X-Received: by 2002:a50:d0cd:0:b0:553:432f:d46f with SMTP id g13-20020a50d0cd000000b00553432fd46fmr388919edf.95.1702845640693;
        Sun, 17 Dec 2023 12:40:40 -0800 (PST)
Received: from localhost (cst-prg-88-42.cust.vodafone.cz. [46.135.88.42])
        by smtp.gmail.com with ESMTPSA id en18-20020a056402529200b00552666f4745sm3884263edb.22.2023.12.17.12.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 12:40:40 -0800 (PST)
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
	conor.dooley@microchip.com
Subject: [PATCH v3 06/13] RISC-V: KVM: Add SBI STA info to vcpu_arch
Date: Sun, 17 Dec 2023 21:40:26 +0100
Message-ID: <20231217204019.36492-21-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231217204019.36492-15-ajones@ventanamicro.com>
References: <20231217204019.36492-15-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_124042_964891_646A7176 
X-CRM114-Status: GOOD (  13.00  )
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
