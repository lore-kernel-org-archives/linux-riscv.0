Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6137C77B7C
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 11:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2PDayMNURdB9Us2tOxdurIBXxQRyuEqmTHXdNCCKVQA=; b=uRgvn7610bfDTq
	S0RzhNpwVSma3zm1AuLq0v+g4OUbClbTEHaY117//sr+l0MucVnZ0syW9sSbo5zG91qs1ZUaNa2Ev
	w5SR/SrftEI81/KUsV7PplyYWCK/o4m3o7cQc6C/qWqo4D53mqTBnXdk/bu87alL30MtpSYcwJJke
	L7EBbnKSUQYUk6EfwyhzL/3uZxQLFIxw1htuIdwwYzK9b7g23iKo+T1LJwOisy6varHGKry7naShj
	BhK6x71T5DxSDih5/YIhIfsWmVuwWjPrIvoQSj6jA4I+mWTRmUR8B8Y+uSJEnyyV06gxzzExjuYbG
	vV2wOLm4wWTlavZ90MUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poNIQ-00G1NV-2Y;
	Mon, 17 Apr 2023 11:45:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poMBo-00FkuU-2b
	for linux-riscv@bombadil.infradead.org;
	Mon, 17 Apr 2023 10:34:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=prz1AC+KjXVu9C1J4LoVGoWqX4f+2T6wwCtF9Bg6zJo=; b=D9lfffqh3R9S2vGrGQ3ZlVFP8c
	dsUMwVBC1DoahnIfQ9H0EQa579W/raL1mXuavvQOYlcsn3SwtLLXhzeBaxm+1mNWFK5BlgdiWoziH
	DGUG14C13HHDl2eZKOAoydVi9CpJoV5G28Hou76FL5W8reVK2y1G4fDmwFDnalhy3apinLPcxhfFE
	/GtqXdR/K/BBZz8JsmM+jbQcTAr6FR90MZktbr6wZVEXQ0GRLCboj1dGM2o4+1AFqX+wAduX5njAe
	oObwiKpcrlPNX62e8pUgJJjsHbW/8Vx8vUg6FGR1EAC6VfWu03m86KQhEQHTq5ze2rempHOubSLtH
	czaiNTPQ==;
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poMBi-00HICT-1T
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 10:34:26 +0000
Received: by mail-ej1-x636.google.com with SMTP id dx24so18772829ejb.11
        for <linux-riscv@lists.infradead.org>; Mon, 17 Apr 2023 03:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1681727658; x=1684319658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=prz1AC+KjXVu9C1J4LoVGoWqX4f+2T6wwCtF9Bg6zJo=;
        b=iH6pPhxzhbWYfN4OO88H4uf5mekLjqDzleD4cNDPy1LcLjZmdRPu5Hsn21aZahC8Rv
         eQmTgnYk21KRbzNB+G5R0SR0s5yNxw3wTGtJD72GNEaDs0GJb0jVcmHTYBXeUAACJbGZ
         vSfawsSdb/VKplDALtzEo0YymQQhVSqOh1Chtr2DX0XU3RNAnEC/gxM0+q6ejaSVYqUE
         oKfRv7bfF1nFS+b9nVPtyb/oo040bPCQSTXpNGw1IBrZCol8IxCnMD0fXgNzYuRYOdWv
         T8Jac7xDVgq1Wt22YdDKz1h1Q3/ZOIG+ibfyejlfAdSabPSVauz4adQ+VdyO2ZCiIWY1
         +gkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681727658; x=1684319658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=prz1AC+KjXVu9C1J4LoVGoWqX4f+2T6wwCtF9Bg6zJo=;
        b=AjV8zvufQXsQqPdFvsiZ+qVS2fjft4J24vmx+azfVnbWdLYLCIphgcHQ9O9jFDel71
         AEjAlipgpmM/jZ4POoohsACuU618UJBITiBs56GZqKHzFIcAejakcGqTG+Jfj+O2xei7
         G0keA8ESuU/qyGhXJ4zwzke+o3eKo6I7gkyvqqqtAgKvmiGEB9ys7dWLPz/6E8MvMHza
         Kn3o9PInXhv7TfpNdXw8rVRSdrfqfQp1b2EkhZqDUexyfScibkkgU4JCNluzeU6bpPgd
         hWfHsRLjqg0vmhdWhwIVbhO0oZA49whIuDBj9LwHfZ8x7SP6aScGHRa9sC47VTvu/vIb
         x5Zw==
X-Gm-Message-State: AAQBX9eMKIPumMs+BvTOa3BQPZPQh/RdYqDfUrNZu42D/nO2Mhfjw7Kl
	kGexgsUd0SUTbqmbZE6vZG3kJA==
X-Google-Smtp-Source: AKy350axG2H4ZQOir4sYhEiVuMXMgwSRWYjdzgly5A5pSS4LGeUmauiQDFhA0+8tMQlu9eemSPmuvw==
X-Received: by 2002:a17:906:7d6:b0:94e:1764:b0b5 with SMTP id m22-20020a17090607d600b0094e1764b0b5mr6480884ejc.69.1681727658194;
        Mon, 17 Apr 2023 03:34:18 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id r7-20020a170906958700b0094efdfe60dcsm4187126ejx.206.2023.04.17.03.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 03:34:17 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: 'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paolo Bonzini ' <pbonzini@redhat.com>,
	'Juergen Gross ' <jgross@suse.com>,
	"'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>
Subject: [RFC PATCH 07/14] RISC-V: KVM: Add SBI STA info to vcpu_arch
Date: Mon, 17 Apr 2023 12:33:55 +0200
Message-Id: <20230417103402.798596-8-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417103402.798596-1-ajones@ventanamicro.com>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_113422_648000_9C1C9F51 
X-CRM114-Status: GOOD (  12.23  )
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

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h | 6 ++++++
 arch/riscv/kvm/vcpu.c             | 2 ++
 arch/riscv/kvm/vcpu_sbi_sta.c     | 4 ++++
 3 files changed, 12 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index d6c78750f7f2..918efb303e00 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -233,6 +233,12 @@ struct kvm_vcpu_arch {
 
 	/* Performance monitoring context */
 	struct kvm_pmu pmu_context;
+
+	/* SBI steal-time accounting */
+	struct {
+		gpa_t shmem;
+		u64 last_steal;
+	} sta;
 };
 
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 733d87a13d42..72b4b3ef6ab3 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -146,6 +146,8 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 	vcpu->arch.hfence_tail = 0;
 	memset(vcpu->arch.hfence_queue, 0, sizeof(vcpu->arch.hfence_queue));
 
+	vcpu->arch.sta.shmem = INVALID_GPA;
+
 	/* Reset the guest CSRs for hotplug usecase */
 	if (loaded)
 		kvm_arch_vcpu_load(vcpu, smp_processor_id());
diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index 40de9cc13cbf..ecf679082007 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -10,6 +10,10 @@
 
 void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
 {
+	gpa_t shmem = vcpu->arch.sta.shmem;
+
+	if (shmem == INVALID_GPA)
+		return;
 }
 
 static int kvm_sbi_sta_set_steal_time_shmem(struct kvm_vcpu *vcpu)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
