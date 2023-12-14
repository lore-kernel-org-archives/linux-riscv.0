Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A88C4167D
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 10:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qNQK3fJJQl62cyZ7h0f1voOzAUmcTLEFngfNSoL/Pk0=; b=snswKxN3QFdT4j
	DL8/xtEJR2BBNnQqmSJfVM9+zMwGQXo9PRY7Kf2rsAxefa53FXOdvAWYXTH43qEy4IgQ8NRsaNgnx
	9RoLazvrHXmy5OCpJbfTqsZ6f4GziVVlpwgZBBU+DabrZjAiwfMJbQ0+JibCAWgrX5k0x+Z797LZ8
	qxkIW80Stl0znhDqZ2Uod/BQtryiMiUkiVnXCxiEEEzQorLtfRxZBIzRSVxAcPt9ZTEBLtR0/YKO1
	D8ldHz9B/KAH/RCeYytbR3Rmx7WGJTbcnJotO0jFPOY7Eq4h46NX4vQKLW27lt6RVzc8eZG7JYczP
	ONeCTfbunk3TuDOGP/pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDilM-00HRZB-07;
	Thu, 14 Dec 2023 10:16:16 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDilC-00HRJd-18
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 10:16:09 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-33642ab735dso990999f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Dec 2023 02:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702548961; x=1703153761; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6/BA021ZzKWgeNWs12dBxi4zSF5L/byI6HgH2juHwc=;
        b=WkAcIapbtL0fbk1MC37ZzNkg9OjYX+9l0xKJe8JFAeNKcZG5PpTqmNkHBYn7jvtr/z
         RRIcamwQ7P9gG1vLZP6rXEG/q5Kul7FYRrXDg/TPqfw6/WewANDVIvvlc1BHrWDpUBze
         yE3grgsSX0/u7Jcd0VlI8icGPS7sV4eFoNbqnQVZ0/8/5PnkDfd0hXf37/9EBAwPWdAC
         qDdcVOsI4BZi4oT8+FXx1pyyaxu51FcEjQ7OhyU+Y2w0pS3spjcePu24O7v8MDDERhUg
         Yy3i55/txfHK2J6kkrRw6FQxk0ca2LLdxPcAp2Fg+9xe0J+vZ/ietj2RBbKWhLS47kSa
         nqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702548961; x=1703153761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6/BA021ZzKWgeNWs12dBxi4zSF5L/byI6HgH2juHwc=;
        b=wHsz0+QdudFBSQRYXFCASTSbd6zFl3B4trvq3RGkoHiAo1g39H7tQDkSzjGcHPd5w4
         PlrjBqRFF3lavDmO5Z59Dw2p28QY+mW7suifM6Q4qjbvRPqf/rWtGGXgXHlCUsc/YBnM
         fdedY4h9h4qICezqv52CgihN44cFkZiKVaNJ904up8csnRxunY4jd/OTWAehIWBW9wX/
         zQZ0+JNF+Foa3eftlYOmJxlrlg66sVrhMeh2fWR7OFM9TpGOGZzLdzPrMMZ4hmuc07Ia
         M6NwrvzepWm8B3Qto2haLiro6NQroFDSEDbRnA6mJfqzyajRuP1poEbAxOKNe6zWbPL4
         BdCg==
X-Gm-Message-State: AOJu0YzjLIVHbzYjEOaMJtUvzi7DevAdoDQoIwK/0Crz9EnuybifGBlh
	AOl0rnHtX/gJNZRGnwLIr5v6KA==
X-Google-Smtp-Source: AGHT+IFWW1BaBAfCrJLpTyR2/xFci7LP24uJR6uiHUbj9Zh90p2KSPvpULG4OxbBAFLGSENZK5wJgg==
X-Received: by 2002:a5d:6712:0:b0:336:36b2:249a with SMTP id o18-20020a5d6712000000b0033636b2249amr772277wru.269.1702548961060;
        Thu, 14 Dec 2023 02:16:01 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id c1-20020a5d4cc1000000b0033350f5f94dsm15550808wrt.101.2023.12.14.02.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:16:00 -0800 (PST)
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
Subject: [PATCH v2 05/13] RISC-V: KVM: Add steal-update vcpu request
Date: Thu, 14 Dec 2023 11:15:57 +0100
Message-ID: <20231214101552.100721-20-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231214101552.100721-15-ajones@ventanamicro.com>
References: <20231214101552.100721-15-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231214_021606_394926_E29A0874 
X-CRM114-Status: GOOD (  12.62  )
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

Add a new vcpu request to inform a vcpu that it should record its
steal-time information. The request is made each time it has been
detected that the vcpu task was not assigned a cpu for some time,
which is easy to do by making the request from vcpu-load. The record
function is just a stub for now and will be filled in with the rest
of the steal-time support functions in following patches.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h | 3 +++
 arch/riscv/kvm/vcpu.c             | 5 +++++
 arch/riscv/kvm/vcpu_sbi_sta.c     | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 0eefd9c991ae..230b82c3118d 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -41,6 +41,7 @@
 	KVM_ARCH_REQ_FLAGS(4, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_HFENCE			\
 	KVM_ARCH_REQ_FLAGS(5, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
+#define KVM_REQ_STEAL_UPDATE		KVM_ARCH_REQ(6)
 
 enum kvm_riscv_hfence_type {
 	KVM_RISCV_HFENCE_UNKNOWN = 0,
@@ -372,4 +373,6 @@ bool kvm_riscv_vcpu_has_interrupts(struct kvm_vcpu *vcpu, u64 mask);
 void kvm_riscv_vcpu_power_off(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_power_on(struct kvm_vcpu *vcpu);
 
+void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu);
+
 #endif /* __RISCV_KVM_HOST_H__ */
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index bf3952d1a621..6995b8b641e4 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -541,6 +541,8 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 
 	kvm_riscv_vcpu_aia_load(vcpu, cpu);
 
+	kvm_make_request(KVM_REQ_STEAL_UPDATE, vcpu);
+
 	vcpu->cpu = cpu;
 }
 
@@ -614,6 +616,9 @@ static void kvm_riscv_check_vcpu_requests(struct kvm_vcpu *vcpu)
 
 		if (kvm_check_request(KVM_REQ_HFENCE, vcpu))
 			kvm_riscv_hfence_process(vcpu);
+
+		if (kvm_check_request(KVM_REQ_STEAL_UPDATE, vcpu))
+			kvm_riscv_vcpu_record_steal_time(vcpu);
 	}
 }
 
diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index 839911dcd837..e28351c9488b 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -8,6 +8,10 @@
 #include <asm/kvm_vcpu_sbi.h>
 #include <asm/sbi.h>
 
+void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
+{
+}
+
 static int kvm_sbi_sta_steal_time_set_shmem(struct kvm_vcpu *vcpu)
 {
 	return SBI_ERR_FAILURE;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
