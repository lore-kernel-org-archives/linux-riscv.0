Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25397C46CA2
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 20:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lKLcNcVBMAHeaV9MS5OLRUBZRpUf3N0FGzN+mHOcAfA=; b=np/DRVt0F2/Gju
	bArwc5HwVH4RDvNBs2MyvO/Yr7I2nZYhDAHYcgmpgJA0ulPio5kKWh4znDfC0QV19AQvDObpnGnHG
	3tZH22EVwym6fM34a52rJuY/FMMTqhRmQJGA+76952nY0ROGnkDB0PjN/frOk6ZwYVTgKdaKA5Pfx
	Pp5PBlwX101DofzRcq6cYrHGGg2poefrLyRQkA5YFs2KZc+MMHgtt1xfncKM/utlbW1OxDfO2daux
	T5SffXC1XN12RaNCsh3P2j334uuMASi/xs23oicbyAOEQMLdtPeoyA5vD4/HAIaoIt6L2fUnjPYOO
	rhVYKdh4qDTfMgQCDgzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rExwJ-008Q6D-3D;
	Sun, 17 Dec 2023 20:40:44 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rExwF-008Q16-2B
	for linux-riscv@lists.infradead.org;
	Sun, 17 Dec 2023 20:40:41 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-552231d9c1dso3165501a12.0
        for <linux-riscv@lists.infradead.org>; Sun, 17 Dec 2023 12:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702845638; x=1703450438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wSoHYNOgfqU5+c8x6IeudkotxUSJD6YLApsHwAAqgOM=;
        b=Q+v9sqoCDt74s0lTOvE0D3OT0ITrU1NIjs2Sfht005F5LA2/ZZK2MLcUfTO2beG1nG
         BBS81Nds/V6P6YOTh/EKXoBnl6uBST/ZxTMK7AygV3MvfJKMhia2mL4keFTpdsg6Ay6e
         GT2FYDYeWAvYi+yupNBus+bkkRZVPLkHG0fFhIcMiNme8utRR9f8q++l++KxXorrzfT5
         phwhlX5LeKC3XXbybR6COaKLsSqtirhZHoonRBAjJcAoEPYmZ9G/ZGlPYnWelDrbi+Be
         Jg12nCwAi/qFlE4e8nKv7wAo/VHfSwCDgbmcj0adNRTP9Spz6UTb1Hv3ppJ0bjctgHD+
         ooyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702845638; x=1703450438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wSoHYNOgfqU5+c8x6IeudkotxUSJD6YLApsHwAAqgOM=;
        b=RG0Jvuem5eWDo3ezn8bbPSYIsq056VEQVfTgdKhnFizm1XuQidE2qznCg7Tv//dPNb
         8c7amZiQXDiAg4GhTSXOhe4iVtZEjon/z2h/e5qpUB2Ky9oJ9w2ZhnOOFGTdGSB5w2TT
         EIZEJw+xZcJu2jErQJuIgQnVWEVqnlW/ebjyX4WuVs8DbVeMeZAEXz7iIc1kJ4DZdjCt
         NxosxNFcRTX5Q+Q8F0iBR9NJFp8mxFjxtwqkSyDpsHRThPGq6GkeQAj/VThnCmwcPp0j
         BunALOzWHCE9jKNxW1zAljzq4o1suMlsmVQPIELS1GjaX1yMn10QRpKHFitgTsWCAJgp
         RULw==
X-Gm-Message-State: AOJu0YxOkRM2qiTNW49B8lvPzewkBJO+FlLerUvguxkPbyypAvFJlpX6
	fAwWC9h8MOhmhrtFDReNOO5sSQ==
X-Google-Smtp-Source: AGHT+IFE5RF/SHXnJzGGw3wICaxYmcL1l5BAUO47j5YWQTpa+0J6ApMFhpsBULpgQvfhkW22Oeq7dg==
X-Received: by 2002:a17:906:dfd0:b0:a19:a1ba:da41 with SMTP id jt16-20020a170906dfd000b00a19a1bada41mr8077173ejc.104.1702845637696;
        Sun, 17 Dec 2023 12:40:37 -0800 (PST)
Received: from localhost (cst-prg-88-42.cust.vodafone.cz. [46.135.88.42])
        by smtp.gmail.com with ESMTPSA id ld4-20020a1709079c0400b00a1df88cc7c0sm13219047ejc.182.2023.12.17.12.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 12:40:37 -0800 (PST)
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
Subject: [PATCH v3 05/13] RISC-V: KVM: Add steal-update vcpu request
Date: Sun, 17 Dec 2023 21:40:25 +0100
Message-ID: <20231217204019.36492-20-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231217204019.36492-15-ajones@ventanamicro.com>
References: <20231217204019.36492-15-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231217_124039_713410_B335BA5D 
X-CRM114-Status: GOOD (  12.38  )
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

Reviewed-by: Anup Patel <anup@brainfault.org>
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
