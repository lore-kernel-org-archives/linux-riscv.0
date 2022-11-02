Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4652FC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 23:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ujaEIk97PJT8j13momPQvkhbR/AIB3PvUAwh1MY3To8=; b=MxVVxLoZ2/Cdnc
	PLY+9Iz0DYmrSr4ZLuocTD4LN27cpAJjuVwOjjucCv6MV+DSP7Rmq0zTIjk9RUwU4XJqY6SbrBsPE
	mVNPx3I6FS47hOx6kxWJx8RGh/yqG40tjnlNdrWGwNjznqmpB9YIGsYXVpwn7aDlNd6G88LX9uFCE
	opnAismLNShZqtjTq0L6qjhLytph8CoCmAgQUnUMFTVfA/ofJ7UztS+UebVbDQuSVwzx0klEzxFYq
	3TLpqOLL+1FUv6IkxbdlWUh0LlqQK81VhO7bQ47RNWg58xBgzRCV6xZkD+GCr9awa1DBKsrqAW/Ph
	YtdDyJgkHiH7Tqbm+DUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN1A-00EtGH-Sf; Wed, 02 Nov 2022 23:19:32 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN0x-00Et3Y-GP
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:19:21 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-36b1a68bfa6so471227b3.22
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=J4baT2gCaqaG+hAt/mJp+w8Lapt4XhULv2rUZ1lbod8=;
        b=Y/LgcbOSvwbnzJXRGal3Ep3KB7/0yCP9cU65YkQert5+3hLyHHSjjMao2/UuV8Y1pm
         rxtzoLchmx+Mfw2uDAT2cc7aUI/oVviLkjgjK/axQ+ux0UramBaUfpMh7qr3oHRIrkbM
         g29/HkiYkyDP9zLb6T5zYBFWjCRhk7uodXh+YwW0fknC8LCiXKsmBrjDcUEU31+Wr1aB
         IkpbU9xq9Vh5sCGgS87jUUdeWGvPSndSpQtpQaJwtmMAXoArYlfZq/YuY0lzlwpeE7m/
         iktR7kaNiirOlR+WEM+Xzua+uL8FsQlW7DYdB778CLiAWY7J4Sab6pQ6XIRdRfFvya7C
         dqQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J4baT2gCaqaG+hAt/mJp+w8Lapt4XhULv2rUZ1lbod8=;
        b=b1GfyWU7xzqq8XwjwVKIof02DwVnA7tNhpA/DR71e782NbkOltAxf/ooH+0XBEAFWW
         /gcGMi3bBRrDSnDrMz+MIfEPWFV1Z6p1IxiDrSnmE+MlwODnyKS7ROWH8L1SFiOwlfM/
         3mLhXTkzacRyzw8XMhBmA3NJlaCld8g3DWH/7ivWIdyKJ0yStItk/GtMJuOzkanpodeQ
         tFmwV6x6ZQYoa0JTH6Y1tXqCRbaEUFoxI/1xEcrUKwSMamCEBT05Fa8O/KUTn8xypCqJ
         2QcP6p9bEKNURtzfxzBVeE+COqEn4+iFsD/P8YXpbmir487GOpz5c1KbiztAiO3nYdXD
         qANA==
X-Gm-Message-State: ACrzQf2wX6sAHMkUWm/iYLP3MnYUZK/X27CcDco2DHVfMLByFPtO1iu8
	0YStSf1O4mai0Fbka2dPn9RxVG+bBdg=
X-Google-Smtp-Source: AMsMyM5o6mEhEhiYREiqHX2O6l5zHbOoOJ5LkmkQQCrMnpzWAr9BhETh9np1j3huSYRmzTw5GjJ2jYjKldE=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:f451:0:b0:6cc:aeeb:8fed with SMTP id
 p17-20020a25f451000000b006ccaeeb8fedmr15718187ybe.11.1667431156834; Wed, 02
 Nov 2022 16:19:16 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:28 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-2-seanjc@google.com>
Subject: [PATCH 01/44] KVM: Register /dev/kvm as the _very_ last thing during initialization
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
X-CRM114-CacheID: sfid-20221102_161919_573708_948041D7 
X-CRM114-Status: GOOD (  11.46  )
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

Register /dev/kvm, i.e. expose KVM to userspace, only after all other
setup has completed.  Once /dev/kvm is exposed, userspace can start
invoking KVM ioctls, creating VMs, etc...  If userspace creates a VM
before KVM is done with its configuration, bad things may happen, e.g.
KVM will fail to properly migrate vCPU state if a VM is created before
KVM has registered preemption notifiers.

Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index f1df24c2bc84..a188d27f78af 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5900,12 +5900,6 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 
 	kvm_chardev_ops.owner = module;
 
-	r = misc_register(&kvm_dev);
-	if (r) {
-		pr_err("kvm: misc device register failed\n");
-		goto out_unreg;
-	}
-
 	register_syscore_ops(&kvm_syscore_ops);
 
 	kvm_preempt_ops.sched_in = kvm_sched_in;
@@ -5914,11 +5908,24 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
 	kvm_init_debug();
 
 	r = kvm_vfio_ops_init();
-	WARN_ON(r);
+	if (WARN_ON_ONCE(r))
+		goto err_vfio;
+
+	/*
+	 * Registration _must_ be the very last thing done, as this exposes
+	 * /dev/kvm to userspace, i.e. all infrastructure must be setup!
+	 */
+	r = misc_register(&kvm_dev);
+	if (r) {
+		pr_err("kvm: misc device register failed\n");
+		goto err_register;
+	}
 
 	return 0;
 
-out_unreg:
+err_register:
+	kvm_vfio_ops_exit();
+err_vfio:
 	kvm_async_pf_deinit();
 out_free_4:
 	for_each_possible_cpu(cpu)
@@ -5944,8 +5951,14 @@ void kvm_exit(void)
 {
 	int cpu;
 
-	debugfs_remove_recursive(kvm_debugfs_dir);
+	/*
+	 * Note, unregistering /dev/kvm doesn't strictly need to come first,
+	 * fops_get(), a.k.a. try_module_get(), prevents acquiring references
+	 * to KVM while the module is being stopped.
+	 */
 	misc_deregister(&kvm_dev);
+
+	debugfs_remove_recursive(kvm_debugfs_dir);
 	for_each_possible_cpu(cpu)
 		free_cpumask_var(per_cpu(cpu_kick_mask, cpu));
 	kmem_cache_destroy(kvm_vcpu_cache);
-- 
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
