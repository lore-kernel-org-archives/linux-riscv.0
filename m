Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECA0C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Nov 2022 00:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q9PG+83BswN19jKQYB9mMVI+k3J0DA46Vj0LF9I76mo=; b=oiBZ0EY5CIScYB
	33vFCoX1IgzBUm7kHdVuf8gn67idMJH4ojEoMzQffhEkHWDJFGuEMdJ/NEp7Q1VwPCFXKTiKs1gke
	jbSOsK3uNXees3eER4JSJjNCt4xAdzR85vq5Nql0eUeT5nIEcWvN4MxbURsvbF/R+8eXFD7sAiSP7
	5JH7JHEXmv+eTrcnJdWrD0F1ftu729rzSGoO2i/p81P/cM+fHvRkzGFsfXQhjyA1QB0jEobxWg1d2
	3Hc/u1guSWrBpxQQM2xApM2gYbAMfYIiq3anIhX1+DrlM+MeWGeJHWNL1eWbYCK2vGMwWkMXn5yVS
	D9noZcRoNScyEvfpR2tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqO5d-00FJEB-VS; Thu, 03 Nov 2022 00:28:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqO5a-00FJ6v-M7
	for linux-riscv@bombadil.infradead.org; Thu, 03 Nov 2022 00:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=7o9E6ByEEHcjl3SJug2mMi0pvOLBLqCZLDtYGdzM9zU=; b=bNVEhrjswcJe+ExbCsmIgtYw24
	HItjKx1IC7MJfEjUkoUQjQDvU6UtLzf5GP8qcDyIxDbaQcERDeYOR2qXgOK6Wn1xDqKphkrqXbBG7
	YhHu2kv/fBU0CR0fPpcr1S1HpdbGqOzMKELxz4nh6XNC4jsPFj7cpOkeFGjQjXwEFYwdKfxCgIy2Z
	fNpA5/dFVJuVVsxrkQCeulmpvHqlKP2mPpuD95n0ooRcOw3RjtFij8Beu7OMg7NLpNYjejrP9ngd/
	0T6DrkQ152sRwWyeNyFSDjiwOh8eZjdy00SgC+KB+fZ2iuqKVgCLey4t5pB407DdeOfCtuvuldX/1
	PkSe65jA==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN1z-008Wta-Mi
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:20:25 +0000
Received: by mail-pl1-x649.google.com with SMTP id c1-20020a170902d48100b0018723580343so217118plg.15
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=7o9E6ByEEHcjl3SJug2mMi0pvOLBLqCZLDtYGdzM9zU=;
        b=igGQ2Ishg8aW6R16oe+upaVPlGZAayIzpaWDE8opgJQMS6iOjhkUCLTlEhQKtzbBll
         IdlAKyPdahqXXt0dn4MTEFgukQG0ZCIqNyG5cI01/hw0JIAYQcoPp2BpnzUD0jxS7Ya/
         +nFRYynF3Dt5MSnjg1t4pKoFk0Qf9803yI4SDdLZfxDyQop67DTJX+MNPzB4mGdTHTI/
         UetXl5t7icKMI/ai8krB+aFqS3nK2vJC9U3C1mIJKmfCvYut3D46hBaxcevJzvvlHDGm
         CTwO6YCLjzVqPj4Wwm3tv83DTC33l/N5jui9O7iqtMw8SKOspotJDO5ne6iRoF09KXOw
         O2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7o9E6ByEEHcjl3SJug2mMi0pvOLBLqCZLDtYGdzM9zU=;
        b=1eStRV/nFL3+1I5DvHc9Uib6HXpo7LI5qr0k+G01pVgbVazLQd5NMXIYL9nkLa9yAS
         mWyHW6YwkZVwdnNYHaC71rxUAi61gDqoBJJBHzW8As0kdYmZXdPHNRYiS9rIlMxoeQjN
         H6RI943hKU9rfCAkJ700kedOQEmNRvuKvqqfQ3YdeezaMr4ogQY3JezhZgjS60W6QEt5
         e0AlPn9fcs0YUjDjz+cag+R1s5aqz/AFVDQktujz6n6zwmICUk3MN7PbnyLbTqIJEPoI
         A0WIBQPV2Lt5MYISOYwlRu3WO3e14TkfYJ0Bq5P59wcBUiV068bvvBzJjffG5Es+1doD
         41qA==
X-Gm-Message-State: ACrzQf0QQ2ikymCyagZimxhimhUpvWgR1lm5I/+wOeA+FQP+SijxGTsA
	wzhcBsjTlSCwXOzBMY7r6hn9LEggQxo=
X-Google-Smtp-Source: AMsMyM6niBK+tgCsXQRPRS+/qtLS7kuATd90vG4p7xHoZHYxFybBPWfrbfk513VrCr/GCHaNPNf0pglufE4=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:c7c4:b0:186:5ebe:38e with SMTP id
 r4-20020a170902c7c400b001865ebe038emr27249054pla.33.1667431222881; Wed, 02
 Nov 2022 16:20:22 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:19:07 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-41-seanjc@google.com>
Subject: [PATCH 40/44] KVM: Remove on_each_cpu(hardware_disable_nolock) in kvm_exit()
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
X-CRM114-CacheID: sfid-20221102_232023_861483_9323E038 
X-CRM114-Status: GOOD (  11.13  )
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

From: Isaku Yamahata <isaku.yamahata@intel.com>

Drop the superfluous invocation of hardware_disable_nolock() during
kvm_exit(), as it's nothing more than a glorified nop.

KVM automatically disables hardware on all CPUs when the last VM is
destroyed, and kvm_exit() cannot be called until the last VM goes
away as the calling module is pinned by an elevated refcount of the fops
associated with /dev/kvm.  This holds true even on x86, where the caller
of kvm_exit() is not kvm.ko, but is instead a dependent module, kvm_amd.ko
or kvm_intel.ko, as kvm_chardev_ops.owner is set to the module that calls
kvm_init(), not hardcoded to the base kvm.ko module.

Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
[sean: rework changelog]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index c8d92e6c3922..4a42b78bfb0e 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5966,7 +5966,6 @@ void kvm_exit(void)
 	unregister_syscore_ops(&kvm_syscore_ops);
 	unregister_reboot_notifier(&kvm_reboot_notifier);
 	cpuhp_remove_state_nocalls(CPUHP_AP_KVM_ONLINE);
-	on_each_cpu(hardware_disable_nolock, NULL, 1);
 	kvm_irqfd_exit();
 	free_cpumask_var(cpus_hardware_enabled);
 }
-- 
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
