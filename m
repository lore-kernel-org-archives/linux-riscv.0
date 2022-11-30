Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E8CC4321E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 23:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A17nApn0EZ3P4gYcjb3OTLEVP76h+eSTMeOU3pGgdaI=; b=Qf/x109YDtgcGA
	28U0uhJfqSo4sTX3vwBG2oI5/QhxESeIQiTuDA+56xFibjfXa0cCIzyVAwHdgaIu8juLXqJbCMjPF
	GHMWYe9wf6wszIC0t8tc3l1wyP/IuzKkAio9GhUCTMDFtwPPGVhdY+mvehQzDJaI6H5j6JcQxV8gj
	kzcSQZDm+fs2QEm/74Jbpd5MRTNzCMsT+S9LPRGmr8L643ADKPHJtJiace+6QYUSWpD4rnqZMttAE
	cEp6j9UfacExxpvFp7nicap1ma5YxL21eIA3OS4C+/fE76Nv5oRYlmfyNz9MVtyzB7YNNyWg//RsK
	kxH0LhvmWgBe0HJAbzig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WQj-003CWV-Fg; Wed, 30 Nov 2022 23:23:53 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WJP-0039Nn-Vu
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:16:22 +0000
Received: by mail-yb1-xb49.google.com with SMTP id m62-20020a252641000000b006f16683bb4eso17887101ybm.12
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 15:16:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=8x0ZXn3EDc/IXE10wWIHQ6grwXVgVE97mHwl4hbdeQk=;
        b=svX1/fceR089wUbhSQhk/jDIM6Hb1O6OQ2qpyY/bxODwo2l21O/+lF2M/oWYVFopBL
         9iVSjpUD4ByvxHNMTLm2+Aqi3jkHju8zeyRE0QQ4MXEVtGJlbaZInZtfd0vZlRTxGrzq
         JsifAxPm+HxofD/VWF9T5VpkTs3QrcfDSrRCCx24sbFpCjTOTpcatd79jNfZI53OekTV
         PFymG/ZoNTP1yqeAIkXfkfQrmLz6NqML76C7vkqujoT5hbToc0RUrI+jh/dGR+3upHWw
         Pv5WHPynR7w4dPeVQ7wg5KdVd27yXGQS19WxO6GBAvU3VTI/56EGnkKmcDKvptaKWmKb
         82JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8x0ZXn3EDc/IXE10wWIHQ6grwXVgVE97mHwl4hbdeQk=;
        b=Qbeqd8luBFpGF2qb7pvxwGUY/ZXr5HgKl0FEN/8UlHpTBm7aMrOAzWHGjJ59Tvv0q1
         3OK0QhkfFY4OJYrt3drJWsTPuNXNFvXAyTvd7tzW7qDhvqsB9P2LmA/Q+k4fASx+UOrG
         XDsmLGupf+ed9+FtXhTFZZNH6LLerJPlirBylUTEiXTxjy1zIzT1bznhno1uA4jz+7aT
         Cw2Gxh2j4XXyYf7LkAm2dhnhweO2KpwriROPzhh+OadCX8SGcb6r9STI+vBMGxMT4hUR
         OHgTrBKbb74plTzDr3wJ9VoZ5V64nx25e44WKnD7NqeYgWVIuaJnIjEV1mD7lL0tyHu7
         nptA==
X-Gm-Message-State: ANoB5pml7W6raMmZVU/xJj5eEqmDFXBOy/S5nUyt6guWCQlecbMarBcv
	pZ/FyPYcwnm84zhLmgDUt6+Tjz2Uscs=
X-Google-Smtp-Source: AA0mqf52TAnX1cWAQ96XDuvwPCxCy8n4wLWV5o+6wUepr4pO9rnWPI1F+BmGpVuyqa0Tukjf36JFuFHSLuw=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:d40f:0:b0:6fb:a7f8:8b62 with SMTP id
 m15-20020a25d40f000000b006fba7f88b62mr1103250ybf.313.1669849864582; Wed, 30
 Nov 2022 15:11:04 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:34 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-51-seanjc@google.com>
Subject: [PATCH v2 50/50] KVM: Clean up error labels in kvm_init()
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
X-CRM114-CacheID: sfid-20221130_151620_113738_2383F5CC 
X-CRM114-Status: GOOD (  10.92  )
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

Convert the last two "out" lables to "err" labels now that the dust has
settled, i.e. now that there are no more planned changes to the order
of things in kvm_init().

Use "err" instead of "out" as it's easier to describe what failed than it
is to describe what needs to be unwound, e.g. if allocating a per-CPU kick
mask fails, KVM needs to free any masks that were allocated, and of course
needs to unwind previous operations.

Reported-by: Chao Gao <chao.gao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 6a2be96557c2..b8c6bfb46066 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5907,14 +5907,14 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 					   NULL);
 	if (!kvm_vcpu_cache) {
 		r = -ENOMEM;
-		goto out_free_3;
+		goto err_vcpu_cache;
 	}
 
 	for_each_possible_cpu(cpu) {
 		if (!alloc_cpumask_var_node(&per_cpu(cpu_kick_mask, cpu),
 					    GFP_KERNEL, cpu_to_node(cpu))) {
 			r = -ENOMEM;
-			goto out_free_4;
+			goto err_cpu_kick_mask;
 		}
 	}
 
@@ -5956,11 +5956,11 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
 err_async_pf:
 	kvm_irqfd_exit();
 err_irqfd:
-out_free_4:
+err_cpu_kick_mask:
 	for_each_possible_cpu(cpu)
 		free_cpumask_var(per_cpu(cpu_kick_mask, cpu));
 	kmem_cache_destroy(kvm_vcpu_cache);
-out_free_3:
+err_vcpu_cache:
 #ifdef CONFIG_KVM_GENERIC_HARDWARE_ENABLING
 	unregister_syscore_ops(&kvm_syscore_ops);
 	unregister_reboot_notifier(&kvm_reboot_notifier);
-- 
2.38.1.584.g0f3c55d4c2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
