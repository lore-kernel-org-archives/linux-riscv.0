Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5DAC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 23:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ew0ZlbH73wsce6FaWf7K5WRXnaIvprau+3xRgth01kk=; b=iVY7gLWBL3bHSJ
	IZnjNGBYlE9DgsAvgLqUGekhD6p0fDdkqMsJtLxIdZPVxJaiHqyPUbxaqJ+8dyJDJGALzRw3ta1ui
	2aAecXndh+y/Mf8f780w0UaW8R0sVwZ3Dqn/dsmLRem/4prVDz8ZYT49P69kppukrnzoL9f8iG57Y
	Ma7Q5OWXUT8z1JZmu/CWSAFbRrH8iohcPk3fvAdj4qCJVbIJMk2hvSrFt5En7qc7imMRv1WI/L04i
	63EliE6vmNs16du2UUsBARjbtyZdtJ6acFW16Nhu1ke7VZemeZr6HiBEpKWB6OHVU8PLH5LGQvJNx
	iQ9UAnsf7KxKRTzo+oYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqNHg-00F2P5-Fs; Wed, 02 Nov 2022 23:36:36 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN7W-00ExNh-AB
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:26:07 +0000
Received: by mail-pl1-x64a.google.com with SMTP id p5-20020a170902e74500b001884ba979f8so222629plf.17
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=s9AuxTlRjBrfjYkcaQi28he/RkCYbCa6yMT59uzOKa0=;
        b=ddAfxHTlEUHw0qawyyn7Bns3LOyks9re4MtMC6FAIFAvlDf6eK/nu/+/9Fi10x1R6n
         WWJsCNbWaFv5FoXY2JkfL2gPHfmH7n5Ig/c/8vgYFwan9v+I5VkTcY5cAcyMIsF0YYgl
         ayeymXyuzlb1ZK6RywTZFK6M2TrYNtbmp52NtBkrAW3CizVOcP2GK1YSKNk0hRzbGX/H
         t6V+7QqjJlqd98Pv08NBqx2q5El2vxmRcwGZXuIwYC0OoPXag/D+TlMulKYngdYVLuGi
         IcUk8i0bIt121WR3Ua8dNN2eN53mKcAGIC6t4monNq6evoAdLql3aLFHNiEvl7F6ATwg
         1KbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9AuxTlRjBrfjYkcaQi28he/RkCYbCa6yMT59uzOKa0=;
        b=W5e95Ot5Mc2G5gNSkRJt1rIH1m6cFNqAvaS/T/DQ1DkluLQ45M2/2LVT5SVm8N7R30
         UuucyyPMpuJiqOt552HmVwgm2DSm3J1CE9Fd7JgdLrZdwMGvjBnEhdcXyI02LclVVfa0
         lAa/Vq5fBWKC7fd0SOfEFFmm103xVX08qUnF0yQGFjhZNvRIFzhrIWdL+6wb0bWEaH4P
         t+4apCG21L2IgHIn4IeRysnrlJwU9LKmgBWrXrSIYualXAwRUBCjxjzIf0pFtt6xEy5/
         seGAJx/6Ydj0U6Db4W8n1Ms8CEI4VI2QqstbBD/RkTrelcuu6do3nlO+RqnL74gJUY5q
         Om5Q==
X-Gm-Message-State: ACrzQf3We9zqLyoc1/glWPIFy104yYRKbVYw75iePFKAE4EjcPYy+/ns
	t3lyszRae9vbcgpGJ6vVFfp8JicFF9E=
X-Google-Smtp-Source: AMsMyM4Aj3fLciSdgeuMbOdggWgonn7AFJaBAotEN5fF2aTBDAVACdmSaSGC1ByL/Xgyuk/Z8cG2B3zdT14=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:903:240a:b0:183:6555:7a89 with SMTP id
 e10-20020a170903240a00b0018365557a89mr27116619plo.68.1667431189462; Wed, 02
 Nov 2022 16:19:49 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:48 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-22-seanjc@google.com>
Subject: [PATCH 21/44] KVM: MIPS: Register die notifier prior to kvm_init()
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
X-CRM114-CacheID: sfid-20221102_162606_386661_4DB3FEA4 
X-CRM114-Status: GOOD (  10.24  )
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

Call kvm_init() only after _all_ setup is complete, as kvm_init() exposes
/dev/kvm to userspace and thus allows userspace to create VMs (and call
other ioctls).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/mips/kvm/mips.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 75681281e2df..ae7a24342fdf 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -1640,16 +1640,17 @@ static int __init kvm_mips_init(void)
 	if (ret)
 		return ret;
 
-	ret = kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
-
-	if (ret)
-		return ret;
 
 	if (boot_cpu_type() == CPU_LOONGSON64)
 		kvm_priority_to_irq = kvm_loongson3_priority_to_irq;
 
 	register_die_notifier(&kvm_mips_csr_die_notifier);
 
+	ret = kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
+	if (ret) {
+		unregister_die_notifier(&kvm_mips_csr_die_notifier);
+		return ret;
+	}
 	return 0;
 }
 
-- 
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
