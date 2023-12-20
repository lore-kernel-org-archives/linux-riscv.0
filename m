Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D3AC46CD2
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Dec 2023 16:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KQMiQKzLwFiXFuHFSQOnKlYvO2lpbvK76/SpRTQU8GI=; b=gsHshCqu/+i92D
	57Eh935Azttd4zo7QmbLsSa2b6Y42h2hcQ6rjfJkJs6QbQLMOasX6NpecafnMNBk+xF56OEfQV6Yt
	XMFmgIXQ4EuuUx4zwNdqVc9IBC7Wn6Nbhq6yX6DfEb5JTNemRrXxD3P726Yw1pMAkG5WPjyKOvwha
	b3QC3sDGBBM6y9PQVesqlgYAY77lyuclcc0Yq2jUJQ60b66lbZI0S/ub0U17Y/i7VhK3dtlQEKVaj
	hadgqsA3PoygAlu0QWOtvIiDQ0DCmjoY2otzqyD/hILhtPNpF/sj8bVi7e9/SX95OAE9pfxNDFzlw
	rQjdUh5OmUwELoJ/OjKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFz00-000M7z-1f;
	Wed, 20 Dec 2023 16:00:44 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFyzp-000Luc-17
	for linux-riscv@lists.infradead.org;
	Wed, 20 Dec 2023 16:00:36 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-33664b6d6abso3544793f8f.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Dec 2023 08:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1703088030; x=1703692830; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9WZowL+tiFdWWavUDOR83U5hXyPT732YQIbLq7cwAs=;
        b=KS3tzBz9RTtJOswSud2FeZT7woTdX+gYD6Ewbh/zZokZRaEVO8ItVUqBvNn0w+CAUl
         wRpJsO9pSHRPGDBt/3zttaOHpI2zPnwKPxnoWCAN7ATmCPSs17OGBRjfD1MGIWp5a+lC
         ++AbhMMzi2XnQclSmV31XBlOsm0krB96kMMFaDzPoCmSA5LOKVObJxWjvbUrr9kIGk9d
         ICnQ9N+bVkVdJSE28HOBdmI1XnZjwlp05L8mUhiUG+mOw4QUbBJHCeMZl6agVSuDSYpX
         m8gvRiZXZ20awOP0q3304th35W+ex77N2hP9soDtF4jlFZhBGobWMQncmLoGmm2cDyHk
         w2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703088030; x=1703692830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r9WZowL+tiFdWWavUDOR83U5hXyPT732YQIbLq7cwAs=;
        b=leB57aHuumDzRpPzXJM1kT4Fxl7XnSSC2mr0v6XflK+T7ORgSWKmk7cwiGTbqSGfZH
         Ykn+cDqc/zDm0lTEcuh11Sdpm4eczdVxo6jk2L6tEeLQJ2xstmo0mH10ZmOYwQpjHiO/
         GVXEVo6mttHY6OQS27/sN+chyZwY32QVUNddoVndg6ljpzxZaUg6ohngko2Rs3l14tgd
         ExvAvcKA7YARyRY8V9XVyQ+j8cEMmq+Qf9Z75pKPjTPYQoLrWKk1zAxSPOAvzOTIdtMb
         REBMzWXxFKY7SRnBeeAEGs4zyVYJ3NZYxavk7R2r19wzOIQ/0JONpffII+WzZt/Y8HLc
         J3ZQ==
X-Gm-Message-State: AOJu0YyIFNzuSwxrSQZU7wdQiNKn5ddHuHnIIE4x4hV/aA6H00idFSql
	Y/Jk4I5h9V1OAO9bZxh+qI901w==
X-Google-Smtp-Source: AGHT+IEVa6diqsl6ZvfXSq0rGo7hhkqDRW+n7TrUzKDkkOE6cmouItUMotaPVRNMlhVQdWbIguLklw==
X-Received: by 2002:a05:6000:2ae:b0:336:7a51:5fad with SMTP id l14-20020a05600002ae00b003367a515fadmr862343wry.141.1703088030605;
        Wed, 20 Dec 2023 08:00:30 -0800 (PST)
Received: from localhost (cst-prg-16-115.cust.vodafone.cz. [46.135.16.115])
        by smtp.gmail.com with ESMTPSA id z18-20020a5d4412000000b003367a51217csm2000039wrq.34.2023.12.20.08.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 08:00:30 -0800 (PST)
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
Subject: [PATCH v4 05/13] RISC-V: KVM: Add steal-update vcpu request
Date: Wed, 20 Dec 2023 17:00:18 +0100
Message-ID: <20231220160012.40184-20-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231220160012.40184-15-ajones@ventanamicro.com>
References: <20231220160012.40184-15-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_080033_480729_60608E98 
X-CRM114-Status: GOOD (  12.67  )
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
Reviewed-by: Atish Patra <atishp@rivosinc.com>
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
