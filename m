Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33797C47089
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 00:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jgR0W9cH8mAFIZ8D/bvKI+JNQT3TXHF2ZgygVYcJEBM=; b=DeOcJFIZQq+8Nq
	0a02/dCep35LdLa2/+Kb8A1QxjzS/rATXHIjPbjTLeA2uaXAPC8i4n/yn1JKbaomQEawyyNMrQHMY
	zctQQk0XmVaxRsMHegpVlGhyLFwhDas3wR44Z7x0cXNVtnkbid6vkfLYcq1iGl+3C3MtHYVxs47kV
	qoxCucYEyIk+T+//M5+94nQU+wIqIYXQwgo8cU1VMN1aVlzVZaw1L+OkuD83E5Dk+LjgFLPra1Xfe
	RGVlvoIv8VndLrBRVeXhqvW8zvQ+lM7YVOiK3W2kMYWmObP9Gl8F2QnlftJoku1y1d4Rt4a0YTtFL
	udJXYTzoBe8LhX7IfQ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0XEz-003ZqW-Et; Thu, 01 Dec 2022 00:15:49 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WD3-00365W-30
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:09:47 +0000
Received: by mail-pj1-x1049.google.com with SMTP id my9-20020a17090b4c8900b002130d29fd7cso3779747pjb.7
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 15:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=kawSfeiAQQiBaQdAeCS12WX5tLp3dBMfNzsm6MZMVDM=;
        b=FuPyDk5HrtCF5qsfcl43lYyhvkgSpcbbsM90YW/3vO3HUB6l7+MBsntxd3/q8gIxoj
         rdKuy8tsa4qXKw46UszgYe7A8/TdMyQmeCoF+YYW9dIEj0dViDiBTtgxBOSRXDRa96/f
         KliWaD9EYRQHMZlNfki4Q8T7/+zZVlwydZoPGCadpemWGxJB7IFN8q6Q93mpMbE0d+Tv
         Gf+jRZICWLnpxC3g1kbOTurVfxPkN8C+UYy/6R3UIEQErk2k3Er1Jkq5UmKt+OcBkjXI
         DwaZ1o75hI5oxdTAgGbi6NECIv+ulAm+Z4MzH2VhP/t3nIxcOzScSD0PtVDNJOMhMUZG
         LZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kawSfeiAQQiBaQdAeCS12WX5tLp3dBMfNzsm6MZMVDM=;
        b=2aY9S78rsIaWmRfoATp5Je+U96Mv2d3mIDAruIPAB2+pQl8cfjnrV/HmYvQWPMK57t
         wniXlUK+GQU0eWsMV0BQHEOJ911Rm6/eqQD8nkcJURdBfKw4JOrONZwhKXegm1jdmGTV
         GSeH2vkrcmFg0SmLyTYl0QANw+icaWdkxoCfxgaHkC5c7Tfq2B2Eq9w/nNTIDphCsQr6
         F5zJ95cGIKaIELujU9YGGbHuOT8qARDJH1cqnAzz4EqA1WnmPUA/FO8E46Goj7nV7kxq
         V3sK50/Yow9Ws2xkkgQK/62baFB18koOzGNhmAqXlvnq/dU1RdRKdezKYN4eKhvSt+xP
         0HmA==
X-Gm-Message-State: ANoB5pknwAQtrn0x/4EOcuKi+xkAO/66n7e4RHJLbaxIFiIHfQPNEv1a
	69MX59W8/6pNMZsz+npQxWNEleIPNyU=
X-Google-Smtp-Source: AA0mqf6wj4HWNV+5cP60rIX6ofADo44xPOiR/JXYf/UmKFCdE5+oZoM8ajSF5PuZFF+kh92E+ZGoi4VvFjg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a62:82c7:0:b0:575:398:468c with SMTP id
 w190-20020a6282c7000000b005750398468cmr21072041pfd.23.1669849782508; Wed, 30
 Nov 2022 15:09:42 -0800 (PST)
Date: Wed, 30 Nov 2022 23:08:47 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-4-seanjc@google.com>
Subject: [PATCH v2 03/50] KVM: Allocate cpus_hardware_enabled after arch
 hardware setup
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yuan Yao <yuan.yao@intel.com>, 
	Cornelia Huck <cohuck@redhat.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Kai Huang <kai.huang@intel.com>, Chao Gao <chao.gao@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_150945_174676_75150A94 
X-CRM114-Status: GOOD (  11.36  )
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

Allocate cpus_hardware_enabled after arch hardware setup so that arch
"init" and "hardware setup" are called back-to-back and thus can be
combined in a future patch.  cpus_hardware_enabled is never used before
kvm_create_vm(), i.e. doesn't have a dependency with hardware setup and
only needs to be allocated before /dev/kvm is exposed to userspace.

Free the object before the arch hooks are invoked to maintain symmetry,
and so that arch code can move away from the hooks without having to
worry about ordering changes.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Yuan Yao <yuan.yao@intel.com>
---
 virt/kvm/kvm_main.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 43e2e4f38151..ded88ad6c2d8 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5862,15 +5862,15 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 	if (r)
 		return r;
 
+	r = kvm_arch_hardware_setup(opaque);
+	if (r < 0)
+		goto err_hw_setup;
+
 	if (!zalloc_cpumask_var(&cpus_hardware_enabled, GFP_KERNEL)) {
 		r = -ENOMEM;
 		goto err_hw_enabled;
 	}
 
-	r = kvm_arch_hardware_setup(opaque);
-	if (r < 0)
-		goto out_free_1;
-
 	c.ret = &r;
 	c.opaque = opaque;
 	for_each_online_cpu(cpu) {
@@ -5956,10 +5956,10 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 	unregister_reboot_notifier(&kvm_reboot_notifier);
 	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_STARTING);
 out_free_2:
-	kvm_arch_hardware_unsetup();
-out_free_1:
 	free_cpumask_var(cpus_hardware_enabled);
 err_hw_enabled:
+	kvm_arch_hardware_unsetup();
+err_hw_setup:
 	kvm_arch_exit();
 	return r;
 }
@@ -5986,9 +5986,9 @@ void kvm_exit(void)
 	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_STARTING);
 	on_each_cpu(hardware_disable_nolock, NULL, 1);
 	kvm_irqfd_exit();
+	free_cpumask_var(cpus_hardware_enabled);
 	kvm_arch_hardware_unsetup();
 	kvm_arch_exit();
-	free_cpumask_var(cpus_hardware_enabled);
 	kvm_vfio_ops_exit();
 }
 EXPORT_SYMBOL_GPL(kvm_exit);
-- 
2.38.1.584.g0f3c55d4c2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
