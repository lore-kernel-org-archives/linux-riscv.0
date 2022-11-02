Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0B9C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 23:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Azo92capdqKu725pBcaa8Vt3TBRrbt+j3ENa3zHTTwk=; b=JTDigFwQUrByfB
	RidXTenC4EQEgXgyjn415RNDzF0OrgQcEJvfGqrISFMltjdoiT5TMrxndJMd4jlibwp4uVNeuNq8w
	GrC+u6Xpfbvd6HqBODoNMR2z8izvyr/4CdnKFWO5UkXb0dPVpM8e2QWVN2DqdTkuDecGSnc9jJr8z
	fBKUCQ0GhHMTGfs1Y655/3lST2Att0cpDwkawBKPEoI98tA6yxEVS+AEyFrGhI8zegL6dWZk6NAyt
	YGV/WLXGvwO0xsE0FxczVP7SN38RM8mzdtjFVsvSbOJX9aSaKK+qy26XZ8wAlWlFoDC+n/j5Yoe2r
	Ji55hUPnzh5ktM+IFQAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN2R-00EuCo-By; Wed, 02 Nov 2022 23:20:51 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN11-00Et8x-FS
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:19:26 +0000
Received: by mail-pj1-x1049.google.com with SMTP id pq17-20020a17090b3d9100b0020a4c65c3a9so26656pjb.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=c745/GhVAupZOShsaNtc5Y0Jm7uB9ydr3S2itBPefjM=;
        b=pj8ZAUMzpQAWjfpeZGv/CFSzOSSwAiDNlmMCeDtMJXA3Ia6uRvLVcV16Cymca0aHXC
         PM6wRe31jjgcVPugCvX2WsyNtqvMLIJF0v+Ys/n5Nq2k4svZOYnhn3INYaYp+USpd+G1
         514pS4WDUrP9flgT5BLdl+/qUHO2eNFQZVTslZCWnmYA53yd76i4Ah4L5OS7bjh89Kxd
         agD1FqGzCkHp/1xQ5FePUye1+JugXCV19Z37h3h0SVTeBVE4gWePoOlMN/4jX90JcqtQ
         h9Xz7vnqCR6lnYHkhGhaSKxff5kFMXnt6v8GUJMP6nlzvcT1qM4okUu+0Q4ETJu9vS+7
         8iTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c745/GhVAupZOShsaNtc5Y0Jm7uB9ydr3S2itBPefjM=;
        b=qaPBCrFBzIUbsrElSmoY6qNICU+oK0zy2/JSBvylRKRbrTo9t4/SSCg8dGGXxoyk2w
         HgAQba624G2DzPBtiOJIL50ZCt/J5MtmS7a6BGoZtf2TmS1DSyqtAhk9TjTMA20ofROt
         LuyLlOACp1uh8OzDR84e8mvXwjVKEeHPGUvfV9fYtC7dRs/PgvhCsY1ovtZLoB7Ewgng
         78QopHdwLC+GQyRvimj9sRQ5WPMSqiiEMbOqr+bkAnFq0uKTp/UWiiw8dqoAc3+N28ZX
         lVZ8fS8qS5xaW36cAIvEtNIgp/IXtKXUAC0KpZ21BiNumPRaWSeX6WbVMWXX/5qklxyj
         DttQ==
X-Gm-Message-State: ACrzQf3kxVM1wa/+kzL59f710RS7e+v1yCajRf1gtxtNPUnYVTSUBKaa
	0D87AaF3LJrtK3Eca7YtJRcuHqF1d98=
X-Google-Smtp-Source: AMsMyM50bKDX4r1Ac7K4343Hy6JzbUn/G7PmXwa6NG1xDlxuMg48/hoXRC8GNkJYnpu6i2NofBL/D0pMfb0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:8a97:b0:178:1939:c721 with SMTP id
 p23-20020a1709028a9700b001781939c721mr27564226plo.108.1667431161027; Wed, 02
 Nov 2022 16:19:21 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:31 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-5-seanjc@google.com>
Subject: [PATCH 04/44] KVM: Teardown VFIO ops earlier in kvm_exit()
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
X-CRM114-CacheID: sfid-20221102_161923_523658_7AE1168A 
X-CRM114-Status: GOOD (  13.11  )
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
---
 virt/kvm/kvm_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 8b7534cc953b..f592dd4ce8f2 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5961,6 +5961,7 @@ void kvm_exit(void)
 	for_each_possible_cpu(cpu)
 		free_cpumask_var(per_cpu(cpu_kick_mask, cpu));
 	kmem_cache_destroy(kvm_vcpu_cache);
+	kvm_vfio_ops_exit();
 	kvm_async_pf_deinit();
 	unregister_syscore_ops(&kvm_syscore_ops);
 	unregister_reboot_notifier(&kvm_reboot_notifier);
@@ -5970,7 +5971,6 @@ void kvm_exit(void)
 	free_cpumask_var(cpus_hardware_enabled);
 	kvm_arch_hardware_unsetup();
 	kvm_arch_exit();
-	kvm_vfio_ops_exit();
 }
 EXPORT_SYMBOL_GPL(kvm_exit);
 
-- 
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
