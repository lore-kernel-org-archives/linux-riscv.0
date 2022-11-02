Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAE3C43217
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 23:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yQIrOKCfk+WVpn3sxnOuWy72V2pB3MXWRRJxZ/iSrv0=; b=BnFi31kzvaJFJE
	srcFrfnGR+D4RV/p5l8Z0xQpzdT6DHMVyUZzuknDe2QYeEnvbhFAHWZtRC+DIpC1UB0lsjKNGdCfN
	VCm25KF4UV5bp0qXZVM7uLG9dXBjpzZ4XC54bTL6RPUOsZ1a3jhchm5pG99iNlUNzIyWnBAQ8i5fg
	5o0r33qLbVzg4cW5VPrMBPtEt84soJXCDf/MGqEn+7lAwUPw+uIJHtBFYYhSYfrZ89pOdGfeNuM0x
	9xjIDMw4ox76qD2d2PE3dk+TA01mife5osZmLVq52XQjYuZpZOho/6Q0xlkp7XkWcOV+3Lt0+KTvE
	rJtvtV/Cili0jQr3flMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqNHu-00F2ZG-PI; Wed, 02 Nov 2022 23:36:50 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN9E-00EyMF-5E
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:27:53 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id t6-20020a25b706000000b006b38040b6f7so396496ybj.6
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=/lqn4M/Too7/hLjEdNjj07wzHVUwU9le6KZacsTk8SY=;
        b=jpZ4+tq6rgM4hZWXweQJqfxuirRlrRpN+o4JwlpzpCNTf2A1sJCTA6DFTlQxCFhgbt
         sLPS4JguQacCAQKGId9cUa8Po003/wEsvkFZ2dOMw9iNk7lA7jWRoh5OFZzRfWNs6e3X
         DneEijHQrn4rLICnTKWJFk513kvZJ3K123XsKZ8FoBZdWOMtOvWDKENXD0/AJPQsCKjG
         rrWvKtMA58cnJHMchHTeytkk5Oc3RF3YtWKf69zqcXqxFh7WlsD0FI+Jf5mEVKngU/vv
         wyh2CqSaqQR9rkwiquK7nfr1sE2Ot7UFYqlBaM19WPnwV+Bbr0Tz+aWWsDk+unGGDNDW
         oUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/lqn4M/Too7/hLjEdNjj07wzHVUwU9le6KZacsTk8SY=;
        b=ll0jBxPEOGFaY0ShBmK9Rs3w+EmpzYqrYjwKY80N9/pph0cOnuIuUoN+Vm4CFDyYWB
         jtTYJGxEfu05IYL7gT9n/WwXgYJH6aJqd2vFSfhZU6PgSSX2MuLLCd/2Q3t6CjjhFISu
         9+I8h2n3aQoWzuxKHFun9eo4xD9grf6p716GvGNX4m4+UBqCu2sSgj8o/FRlr1o6Lyv+
         LC3v4YSyKSSpobTLFaPsoLl700BzrXVhqGu/D7Ul0jc3dmGoQPEM2gZcxpCDAaD/UdpG
         JeVcOmD8H7LIYhGSLThUbhiWtTuOvf/wxqyokFH3AkrW3s1xnjR/Q2zhwvEES+KdcdQJ
         0h2w==
X-Gm-Message-State: ACrzQf2QjWGC9WnLKduPiYI5qDDBCQxITPQAeGm6WTuGfwNPfqRLCAHY
	KUir1CT5vz0H/YB/415/kP8TWA1iXd4=
X-Google-Smtp-Source: AMsMyM7jpwGuIU1urFbOZ+g44WVeQ15lWGU4IrnR1FfXK34lSVgumwGfDAw7vRfyWzKVx0s/7WxU/xcerg8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:e694:0:b0:6ca:2610:76fd with SMTP id
 d142-20020a25e694000000b006ca261076fdmr171916ybh.607.1667431191239; Wed, 02
 Nov 2022 16:19:51 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:49 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-23-seanjc@google.com>
Subject: [PATCH 22/44] KVM: RISC-V: Do arch init directly in riscv_kvm_init()
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Fabiano Rosas <farosas@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Chao Gao <chao.gao@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Yuan Yao <yuan.yao@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_162752_234200_EDEE1B70 
X-CRM114-Status: UNSURE (   8.73  )
X-CRM114-Notice: Please train this message.
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Fold the guts of kvm_arch_init() into riscv_kvm_init() instead of
bouncing through kvm_init()=>kvm_arch_init().  Functionally, this is a
glorified nop as invoking kvm_arch_init() is the very first action
performed by kvm_init().

Moving setup to riscv_kvm_init(), which is tagged __init, will allow
tagging more functions and data with __init and __ro_after_init.  And
emptying kvm_arch_init() will allow dropping the hook entirely once all
architecture implementations are nops.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/kvm/main.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index a146fa0ce4d2..cb063b8a9a0f 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -66,6 +66,15 @@ void kvm_arch_hardware_disable(void)
 }
 
 int kvm_arch_init(void *opaque)
+{
+	return 0;
+}
+
+void kvm_arch_exit(void)
+{
+}
+
+static int __init riscv_kvm_init(void)
 {
 	const char *str;
 
@@ -110,15 +119,6 @@ int kvm_arch_init(void *opaque)
 
 	kvm_info("VMID %ld bits available\n", kvm_riscv_gstage_vmid_bits());
 
-	return 0;
-}
-
-void kvm_arch_exit(void)
-{
-}
-
-static int __init riscv_kvm_init(void)
-{
 	return kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
 }
 module_init(riscv_kvm_init);
-- 
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
