Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3071EC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 23:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bxlz5kTWpFflvVfeRqx8R/EzY6SJlad7QB5L9rij8RM=; b=icUbXOUPr8wg9V
	4in2ytxCehmUpbvnU+tgn0BvvmzFh9hUgAfTX6ulyTg+zIo5XrwjujToyItK5bq+duP4kYIrxiXXg
	CKLgTKlPSMZCGTYHukdG4+NMN1imSKZd1gNELoKEbW572e0dn1CWPAPdgvj3D+V9jZGos/zHZbIRL
	jx7fdSuBgN001kvtvqh4TH0BCiHYd7U33BlLcNLXrHrL/yZHVlSP896roH2FP8YcGLjVUAP9c3qlm
	JKPFtPVDyXX0/PnA5SqCmOa/ExPj4f/pq2m1w7VNQUij72oXe8LF2917XTVJR+V72HeFsEiG21Kjy
	sD+ZO7JSltyOa8zo89lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN31-00EubL-TH; Wed, 02 Nov 2022 23:21:27 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN12-00EtAq-0G
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:19:27 +0000
Received: by mail-pj1-x1049.google.com with SMTP id mh8-20020a17090b4ac800b0021348e084a0so2476848pjb.8
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=61+uc/Y9XgqKqIqJKklgZKwyXFi4EpAveqLf+gzND20=;
        b=Utw2bIoFpd0OsW8gcFI5XrC8r/opoeV6PzEujs3E4Mr9+St+h1iGz7I0t2dfS8UClh
         tAtUjqK55zt6/KkvBXOzqfYjfHXVvlGdNUDx6aXeRWpNBB/SzUU3M7O4hGxRvmfcP7Dv
         H7xUVWjzIm9fOWFawnQ+tUiBa9aTdqs3xjhRiHy7QmZH5iQmDFc0LC68bjVk8Tk76MUY
         okNb1d05tSvdlxWMqm8WJt1KJ94gRKBpU/aaJyEkAN3CmyDtunrNwjuXsVAB9MDK12T5
         qP1tSiadBS2lzWdtmS7wbdVgSkTUTO1m/e38yDr5/ydciJMTwj/jwYNum8ez3aI14Ekv
         m1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=61+uc/Y9XgqKqIqJKklgZKwyXFi4EpAveqLf+gzND20=;
        b=qCcAadyvMXYJuDIKcKqCpygfqkAIBxhwus8m0l0m2XsgDFNWcAB9F3O+hrUiXoalKb
         ktqqae/IzJPkOFXvv+nhCBeRaN0Ivo6HAKQbavcorL3q/XDFNzScgvgkDG/eugqZAG3a
         Qjwm6Ndq3JLGMyBx5tEiLABCJIEeGnKyG/dGjokiHBEhilvcc9lb421ScZd74FKX1kU9
         D/Z6hC5IV82W44eWIZfVNcZDrbfb2RvHvw8DQLmQAWTgheJOFAj7SzCWf7DvT+Nud3hS
         JrZ4Xno7XuPW/6ZXv92Huq08NL1PLcJAJ/kQVCtWtp3LStlsS+f8rqShcB9VwuFqTnf/
         WpmA==
X-Gm-Message-State: ACrzQf1kZlWOOfv9KFhzUi90RJc0i2JODUiZf45N1dpv8FZYY09Eg53S
	2ubK6pL1wAGXa29yQaVBMIk4ANAqijo=
X-Google-Smtp-Source: AMsMyM69CxKgcSWgM1vAnwvZeDyLX7/AeVTRbrDaM9LXBznOzPR+Ikthjk94S3wZJoe6s5YkzQYZMQYdPec=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:38cd:b0:214:184f:4007 with SMTP id
 nn13-20020a17090b38cd00b00214184f4007mr9764899pjb.82.1667431162802; Wed, 02
 Nov 2022 16:19:22 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:32 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-6-seanjc@google.com>
Subject: [PATCH 05/44] KVM: s390: Unwind kvm_arch_init() piece-by-piece() if a
 step fails
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
X-CRM114-CacheID: sfid-20221102_161924_122420_BE9EF5C4 
X-CRM114-Status: GOOD (  11.29  )
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

In preparation for folding kvm_arch_hardware_setup() into kvm_arch_init(),
unwind initialization one step at a time instead of simply calling
kvm_arch_exit().  Using kvm_arch_exit() regardless of which initialization
step failed relies on all affected state playing nice with being undone
even if said state wasn't first setup.  That holds true for state that is
currently configured by kvm_arch_init(), but not for state that's handled
by kvm_arch_hardware_setup(), e.g. calling gmap_unregister_pte_notifier()
without first registering a notifier would result in list corruption due
to attempting to delete an entry that was never added to the list.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kvm/kvm-s390.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 45d4b8182b07..8395433a79b2 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -490,11 +490,11 @@ int kvm_arch_init(void *opaque)
 
 	kvm_s390_dbf_uv = debug_register("kvm-uv", 32, 1, 7 * sizeof(long));
 	if (!kvm_s390_dbf_uv)
-		goto out;
+		goto err_kvm_uv;
 
 	if (debug_register_view(kvm_s390_dbf, &debug_sprintf_view) ||
 	    debug_register_view(kvm_s390_dbf_uv, &debug_sprintf_view))
-		goto out;
+		goto err_debug_view;
 
 	kvm_s390_cpu_feat_init();
 
@@ -502,25 +502,32 @@ int kvm_arch_init(void *opaque)
 	rc = kvm_register_device_ops(&kvm_flic_ops, KVM_DEV_TYPE_FLIC);
 	if (rc) {
 		pr_err("A FLIC registration call failed with rc=%d\n", rc);
-		goto out;
+		goto err_flic;
 	}
 
 	if (IS_ENABLED(CONFIG_VFIO_PCI_ZDEV_KVM)) {
 		rc = kvm_s390_pci_init();
 		if (rc) {
 			pr_err("Unable to allocate AIFT for PCI\n");
-			goto out;
+			goto err_pci;
 		}
 	}
 
 	rc = kvm_s390_gib_init(GAL_ISC);
 	if (rc)
-		goto out;
+		goto err_gib;
 
 	return 0;
 
-out:
-	kvm_arch_exit();
+err_gib:
+	if (IS_ENABLED(CONFIG_VFIO_PCI_ZDEV_KVM))
+		kvm_s390_pci_exit();
+err_pci:
+err_flic:
+err_debug_view:
+	debug_unregister(kvm_s390_dbf_uv);
+err_kvm_uv:
+	debug_unregister(kvm_s390_dbf);
 	return rc;
 }
 
-- 
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
