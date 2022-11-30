Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC7EC4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 00:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aY5iUvMQKrOueM2WlknMzFEwBwE0mZGggHmnXMeBquM=; b=D6/Zy3DgHaEyt7
	IYBPGnpRsen3xhJoifOaM6B0f6BMbvBrt+a79EwQnhSdR6S3oSSu0XTEb44PK+ap8xhm3pz9MWcR6
	cMixXSBjQNEM1VwWIExYzQg3zuKpDIC7q/EYT4vodLxkyThkTCGsOH4ANIgkogjKXKittPRLPNQfq
	dDcrtRSR4SCJoL8S/49RiqnAL8iBxuBnZOB5aPm7d3Lk4GY5iSq8ONBYw5VRcbBNTwoPRN5aDJh42
	djPdx8wcCV1VJmbN0Su45TAFVLOGYACrc7/NbYlkyUUE4Rt2dKIVVly2paK3qW+0a07Thju+e1nZJ
	qw10fjCJeVCfapBu9+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0XF6-003Ztj-67; Thu, 01 Dec 2022 00:15:56 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WD3-00362N-Kw
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:09:48 +0000
Received: by mail-pf1-x449.google.com with SMTP id cw4-20020a056a00450400b00561ec04e77aso175887pfb.12
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 15:09:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=E8JVGgtDpa1adQbcFKdjF0h5x+zc5eW3OzNDv17W+I0=;
        b=DS5tl3JZt5ENZ41z8LWoU7l/LLAZg0bKxr9NB64mArQBR7Z4xQ54gwA8E1Foi7ucUI
         WLpYLHet6DIopxUbH10y1vLmghI4adUhheVz2l+sfpolKRTogMb2+JXMX5kC+1I07F/z
         xq02cwtlNoKx8xWnfdsY/DFfLTDmRaQZCHvCCDtocOPTXWGXE+6cy/K/TTmkXZECJ1T5
         UPbbMU++Q0JdnDp6PdsJU4We1R6snVfDObMmpUXwD7SotdnLb3fRUaZHvapd0uWqxFq9
         B+vmtfzyaE3KTk8T/zN+WUL7QMUukMAgZHVrZIfnA64+0ySQ/W2zwvQkWpKfKL7fFmQx
         zvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E8JVGgtDpa1adQbcFKdjF0h5x+zc5eW3OzNDv17W+I0=;
        b=SlgxjU2IHTD8E3ufE3EpQGvuq0Xf0oZlPqA4YT/l92Ce6iX32t9G5c5cPAI04jxP6j
         rIywrNv4VUotMChEr4eqwE5gDmpnZgXdkFIDVRrg/HdWJXNND24685Nm3g22eOQCoEjB
         rpBdUSMBlUrM8vymjs6sxxW8G2yNp7o90qadVAuBClUzhLjHUvgjGhUUdnsyZFuKdsV6
         ReQHkpOhBpHEhup4IYeR3Fa9QLNK2NpFfhxD7K8Ivbum1z9USu5jytI0jVK2xDTbZz6Q
         DvICz9KxU6/6xJJLJXWoCnHHZdp28OojQ8ODYmT2PecYOE9/JSy0bKGItBtMqBNF72mV
         KK9Q==
X-Gm-Message-State: ANoB5pn6KFyI9B/IQSr1kNLMemVi5hvFJpFU0kiZpkIJ25gPOpMF8LCK
	0bN+DPyHvYpNpYhEg+syEsusT4r/dS8=
X-Google-Smtp-Source: AA0mqf6Q0BFR2rWNLKbL3PfSbJ45azh4M9K0FqaT09LmFusT3iMI987lBa2MWHLHJI40i8Y0hHfQV/M7a6M=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:e887:b0:189:1fcf:6ceb with SMTP id
 w7-20020a170902e88700b001891fcf6cebmr43466277plg.45.1669849784316; Wed, 30
 Nov 2022 15:09:44 -0800 (PST)
Date: Wed, 30 Nov 2022 23:08:48 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-5-seanjc@google.com>
Subject: [PATCH v2 04/50] KVM: Teardown VFIO ops earlier in kvm_exit()
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
X-CRM114-CacheID: sfid-20221130_150945_713321_FF188A05 
X-CRM114-Status: GOOD (  13.26  )
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

Move the call to kvm_vfio_ops_exit() further up kvm_exit() to try and
bring some amount of symmetry to the setup order in kvm_init(), and more
importantly so that the arch hooks are invoked dead last by kvm_exit().
This will allow arch code to move away from the arch hooks without any
change in ordering between arch code and common code in kvm_exit().

That kvm_vfio_ops_exit() is called last appears to be 100% arbitrary.  It
was bolted on after the fact by commit 571ee1b68598 ("kvm: vfio: fix
unregister kvm_device_ops of vfio").  The nullified kvm_device_ops_table
is also local to kvm_main.c and is used only when there are active VMs,
so unless arch code is doing something truly bizarre, nullifying the
table earlier in kvm_exit() is little more than a nop.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
---
 virt/kvm/kvm_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index ded88ad6c2d8..988f7d92db2e 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5980,6 +5980,7 @@ void kvm_exit(void)
 	for_each_possible_cpu(cpu)
 		free_cpumask_var(per_cpu(cpu_kick_mask, cpu));
 	kmem_cache_destroy(kvm_vcpu_cache);
+	kvm_vfio_ops_exit();
 	kvm_async_pf_deinit();
 	unregister_syscore_ops(&kvm_syscore_ops);
 	unregister_reboot_notifier(&kvm_reboot_notifier);
@@ -5989,7 +5990,6 @@ void kvm_exit(void)
 	free_cpumask_var(cpus_hardware_enabled);
 	kvm_arch_hardware_unsetup();
 	kvm_arch_exit();
-	kvm_vfio_ops_exit();
 }
 EXPORT_SYMBOL_GPL(kvm_exit);
 
-- 
2.38.1.584.g0f3c55d4c2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
