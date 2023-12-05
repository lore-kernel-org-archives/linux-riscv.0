Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3C7C4167B
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 18:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=krZl+LS4eCoWUNcbraYFD/G1iPrW7GtEI0po1SzWviM=; b=hvD/ZGL66zUxVC
	81E6kOpRMP3yzLMnaG8TpMTqQ+SpPdgOJbvTiumrbZPpbJpvOL2bCVRbBMnasOSKzX2Did6Fe3mDy
	j/7CgA9/K2eIBMLkXGiB3hOU/kwsBtcT7qIBTqFJEMnq19iGjQLM9H6AdKv15YuGYT2GgQXGT32zv
	affzADv1qY5EJp9vNeQGbZ6EqU8HdNLbJ8FRF8TC/RwtQ6If6Oa1Iikfkl7T+a05esWTWpYTLiUwc
	ABAlbjyYnokd21/51MfxmPT5lSI0htyTzjsWClYwGADWjxGwKXkU0Q6W2Kqm38W7nX5uZ/ZKRv0+M
	8sjK8Xw8BdX8uAbszf7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZtS-0086rk-0m;
	Tue, 05 Dec 2023 18:11:38 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZtN-0086k1-0M
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 18:11:34 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a1c890f9b55so117204066b.1
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 10:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701799889; x=1702404689; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REnOHt+K++3Makx2KQUnuu8zkmaBNWfW7UtKBhZyEjc=;
        b=iCwmtuIMpRtbizQhZ8cUjbKJNBzG+CDwEpvfhYeFYtMrcxz0P/JDcPVSWQcaoNsXmn
         RJHYw+hTXGE2sF64yaaBXCSTdbYLTdFqtpjQ2QuiIGjcrwoC/Sn00otm/hw4nZAGqjaj
         7ffNXmaefPk7X/w+mEQ/XFidTqXasSpA6gFlhmTP8h7Bb8HKqK9iQ37f5UjaPZuxOQdh
         IUPRQBAFfImJ2msXdUvbgNGWZjJbLHqAVfI+E+q/xi1efHsbm1q5t1axVD9qZ5YpFge0
         Y2zSvTUduhAMezAijXiiS8T3fMoe7KmxRiyTRxrDWiTVvReFP3OR1vdiXpgYUrVnyOR3
         Dd3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701799889; x=1702404689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=REnOHt+K++3Makx2KQUnuu8zkmaBNWfW7UtKBhZyEjc=;
        b=VauVP6Ei77Y4uRIGSxhxetwE60P3WYyPhaWN17j96WrdyqaIEBoGUaFT93O2z9P+9Y
         8ICd/IAsdzTV3rPfeG/SwAmYRkIl2GUt6VgdnsGEl5FHKAez/jm6tPLi19w8iHPXuHnQ
         LP2IyobrTi6wjFeWoXlnlU+htqg3RsNc+akPC6lm1kXofhbCHlFCEc/KOQMa7uwuWXSB
         7s4mw9tRIVFKAVQbuiEbm+DeHvfkOqy27tIt57DI0gTgW2Y3+4pEPYEXHnM6UOhugciU
         FkjvlUmGVDTpZWBvWFgpL9c5p10ctKwDjyfMLVmIAwObpsF7rGohMCcDFBy6MxmahLZ0
         QM+g==
X-Gm-Message-State: AOJu0YzcjQvG/OQFy9brxzTkDZ1N0luI54U4XI22ABDbdwEQFkK6ixYt
	f51LRVKc56f1NTvxNeyCvU1j2A==
X-Google-Smtp-Source: AGHT+IGquDSixYJu18mH30sSOmuHmw/0Pl8F0wzzIkhrPp1ptns8txZD4CRCno7vFbtWaryTynxQdg==
X-Received: by 2002:a17:906:3488:b0:a19:a1ba:da71 with SMTP id g8-20020a170906348800b00a19a1bada71mr4785159ejb.152.1701799889425;
        Tue, 05 Dec 2023 10:11:29 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id wn3-20020a170907068300b00a1b7b0cc30dsm2671743ejb.7.2023.12.05.10.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 10:11:29 -0800 (PST)
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
	guoren@kernel.org
Subject: [PATCH v1 06/14] RISC-V: KVM: Add steal-update vcpu request
Date: Tue,  5 Dec 2023 19:11:26 +0100
Message-ID: <20231205181119.207204-22-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205181119.207204-16-ajones@ventanamicro.com>
References: <20231205181119.207204-16-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_101133_152254_D494DEF0 
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
index e087c809073c..b77f585879b7 100644
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
