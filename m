Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82AADC77B78
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 11:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d49nGvQ14kLa9bOcr1ATrhmOUPBTvCUMUyECrxkw0x0=; b=xO7bHeD1+cEZrS
	9Iq0InN3uyNWRTY66n1PFcNzuzo0V8pHtOl1rd57+4zGZiTdW0RAZj+Sc4LIN9s0lxakDOunTK2Tk
	ZDBy9zPWQfbK2Q3P4H1POC3Z8RcPg+/Za04FfuVc76iJsjIdiWdV0jDmdaPxdmk1FyqHTWpNlSbct
	cLAp70P5Coao2tmWfbV8oIW8EJhx8QLyrDp9bBOgrryinOqtOWn04LQtmgq/q6kiqwKUdW27x7lPJ
	kGLa+c527mr2JZ2JizWkO198gP7xFdjLaYt1MB9NJPLpgW/apwmGuhmsb0UMuxaf9sBe9a9G6MzKR
	asHsBD3cUQUeQNSoZyiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poNIO-00G1Ki-0Q;
	Mon, 17 Apr 2023 11:45:20 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poMBf-00FklS-2Z
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 10:34:24 +0000
Received: by mail-ej1-x633.google.com with SMTP id dm2so62905405ejc.8
        for <linux-riscv@lists.infradead.org>; Mon, 17 Apr 2023 03:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1681727657; x=1684319657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JuKvZAXaTuOlMLTwrKLa+0MWIG30e8w/LYfDFQnpQxk=;
        b=pjSVoamXI9cPfPxdwcCKkm243NaYUPEx0DtC8eGLJUMYt0WQEIy/CNapHamZrKM2qm
         gaedbQzCWwWISSjEuFaJ4joUVI/gMWxiLzWPPJdgi9RkD8Zdr/h6hVRlhwC+s6PiJiXh
         5QuooW7ujptO2Nkjq7SCxQAm3LsJOmyf4IwHBc7fIokHi1ht3pCWbtSy0PJgphOg1nqi
         7Nar5HuCGfXR8tTRG354cJVr+U1tH33FNsWe/W9ijVE8i8ygdDmF6/spnUZ36MbN5wBR
         m820BANgAEqGJOy4g15wacqfi9n91GuUTiuEVXWpJ8q6vKCS4r7mGF83MPhbl1QZ2b4/
         nSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681727657; x=1684319657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JuKvZAXaTuOlMLTwrKLa+0MWIG30e8w/LYfDFQnpQxk=;
        b=Qmgy9vVbcSysH8gFuHECXtP77mkPzgx9nkLrCU6fBPNrHFGqq8zM2at1u4U/cvnvhz
         O9McRPyAlhtdpj9UWrDVRnS1tMWqO71hMmUtJ+6IOPdNKucwHdhO6Ba5h7qdQnIZWIaR
         X4uuJk2XA9kJi/LWSaUZwDvunEGTuWy8qvff0wLVzvEquMc6QsRQFvv/GVrq8wFfe1AH
         y/U63zAeCpwebLQAu6unwo/Awsj73hoyHXOWPVCNE4IEoqTk+ER1fua5DQ+t2B1jhQ7l
         7SoJad7vbt5y7MU0EKeyK2xzYTKKZMFYA1DYcI2iWEkuwoRhf0cml5Psxz0ej4XBUSma
         FbUQ==
X-Gm-Message-State: AAQBX9cSpRBIMFIeH7wWfSaObc48h9OB1eaCDbqYqtx1rzSBg0EuuYVf
	SXiYq9Hefu7MRm9ODNLU9lbvxg==
X-Google-Smtp-Source: AKy350aJMz8l9J5rYyHunxHRqXp3WbghX6XkKExRJiCh5FRYMM+g/fZK+Qq9XE+XkNRwSZ+NvDQR/g==
X-Received: by 2002:a17:906:53d1:b0:932:20a5:5b with SMTP id p17-20020a17090653d100b0093220a5005bmr6238055ejo.23.1681727656940;
        Mon, 17 Apr 2023 03:34:16 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id bi24-20020a170906a25800b0092f38a6d082sm6314705ejb.209.2023.04.17.03.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 03:34:16 -0700 (PDT)
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
Subject: [RFC PATCH 06/14] RISC-V: KVM: Add steal-update vcpu request
Date: Mon, 17 Apr 2023 12:33:54 +0200
Message-Id: <20230417103402.798596-7-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230417103402.798596-1-ajones@ventanamicro.com>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_033419_877949_7E04DB08 
X-CRM114-Status: GOOD (  12.87  )
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
index cc7da66ee0c0..d6c78750f7f2 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -37,6 +37,7 @@
 	KVM_ARCH_REQ_FLAGS(4, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_HFENCE			\
 	KVM_ARCH_REQ_FLAGS(5, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
+#define KVM_REQ_STEAL_UPDATE		KVM_ARCH_REQ(6)
 
 enum kvm_riscv_hfence_type {
 	KVM_RISCV_HFENCE_UNKNOWN = 0,
@@ -331,4 +332,6 @@ bool kvm_riscv_vcpu_has_interrupts(struct kvm_vcpu *vcpu, unsigned long mask);
 void kvm_riscv_vcpu_power_off(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_power_on(struct kvm_vcpu *vcpu);
 
+void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu);
+
 #endif /* __RISCV_KVM_HOST_H__ */
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 02b49cb94561..733d87a13d42 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -901,6 +901,8 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	kvm_riscv_vcpu_guest_fp_restore(&vcpu->arch.guest_context,
 					vcpu->arch.isa);
 
+	kvm_make_request(KVM_REQ_STEAL_UPDATE, vcpu);
+
 	vcpu->cpu = cpu;
 }
 
@@ -969,6 +971,9 @@ static void kvm_riscv_check_vcpu_requests(struct kvm_vcpu *vcpu)
 
 		if (kvm_check_request(KVM_REQ_HFENCE, vcpu))
 			kvm_riscv_hfence_process(vcpu);
+
+		if (kvm_check_request(KVM_REQ_STEAL_UPDATE, vcpu))
+			kvm_riscv_vcpu_record_steal_time(vcpu);
 	}
 }
 
diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index de9ad7b7d010..40de9cc13cbf 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -8,6 +8,10 @@
 #include <asm/kvm_vcpu_sbi.h>
 #include <asm/sbi.h>
 
+void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
+{
+}
+
 static int kvm_sbi_sta_set_steal_time_shmem(struct kvm_vcpu *vcpu)
 {
 	return SBI_ERR_FAILURE;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
