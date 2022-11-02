Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2C6C4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 23:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=djmtbdONq/ZjIXE8kEk15ZaRWwBQ5EtPjC7o9PgY+0M=; b=a0OyHx4nxnZmC3
	+njDCcQmCNo5VY2nysYwaIFBWVrMRHyjOme+SNNEIVRFMmBNpr3r+5E2wzLIKBt5AduHHf7JWCLf5
	zwf+N+OmybJMlkbGziQEA5HdTfwarkUQ+umVq1RygxRocArY2L7sNOB46ZFU7siIxXAF/krd/aCEv
	j0TwUUuQVj5KMML1cTt6aivYmbStl48ehIY1lvch0fK1/oQQo4lK5LHBx80kif0ZXT8/Yso+GUaQ7
	9XThgnwUYATlTs82DOMsvGs6v2BqwM9DDB9eTM1vwK1ko0tGF5h0x8JlSn7RtXgkCVTK8aDnUQ6y5
	NUSw6GUEwlBMYfkb54Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN67-00EwPK-Tg; Wed, 02 Nov 2022 23:24:40 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN1W-00EtRw-Nd
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:19:56 +0000
Received: by mail-pl1-x64a.google.com with SMTP id e13-20020a17090301cd00b001871e6f8714so217005plh.14
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=QZsBYUGDC2IkAwbx22iS+bX782/JjRlyYtWOGf9fm5w=;
        b=gOl3cNoBRYj8Qpc32NlIEZiSXsQpB/DCyQ/znrDYIZGa+s4IthUOkEHZQZ1ojKZDv7
         pTCluXhDLSbuLtIDsd06JUGzyqeVDBKsjduC6joRT5sGTNYRsVo9p/G6Hqiv2ugKa8LH
         rdr0QZPkDK278uG4dV/k1t11BIQxvRWGgZaRWsIg0DoysUSAp2Ijq63EEZdxc0KL4gix
         0HGUBH8kF/zweMHI/2v4mLjob8+u7zdHCmj600jDg7rYDwZddIyY/q/ZMJIgho4CGwiq
         Rf68OjR0Rg0ygAgFFNEea3lYykknrXRPiTB8JjAsW5m8iBtmAm27VPmRKJbUJVbPKnmY
         wuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZsBYUGDC2IkAwbx22iS+bX782/JjRlyYtWOGf9fm5w=;
        b=0fhGofIbsnvuY8QEUNrfkqWDy7cVq5s8lLB6L2Ux5sBJPFkzDzdpoRkzyYww6qnxYF
         yv/9wyX7c9SWGBVGxyPKwzObrEQ+6sRZk2/6An21JZ6IjwpyGeySV62QkZ1QytYip/WM
         7GFRPrajAxMbU2aGK8+WC8c0PtLsBORECgm7CM7o3j6o7BNegVziuZPQqvMmBhht2pZG
         iTPZrGQhFODdF/V86TbTcAnnNsn4zwMHbtRNZA8tEArrHx+qoRDeHT7oJluJtNi8tqqP
         alfkOvmco/nShNv/5NufTpcMbl+tWux5xqSSNQayz3YTTENY5cskTMmOp8OtI/w9dn97
         Nupg==
X-Gm-Message-State: ACrzQf1yscI+Iooy7xzx1aYqVI4fnj1G3C3sFl4rAZMEy43MO2AIZT0k
	cmnkYboFBnrfuMkMY7kOsrqxeCAYcYA=
X-Google-Smtp-Source: AMsMyM4F5G3DDnuJC2f+gpo6muVhVlP37u9Rx2CD7FgkZCjySGE+h3yA4RelKa6dFXDwgnEtjORGLCa20Ec=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:90b:384a:b0:213:2907:a528 with SMTP id
 nl10-20020a17090b384a00b002132907a528mr27758885pjb.183.1667431193502; Wed, 02
 Nov 2022 16:19:53 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:50 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-24-seanjc@google.com>
Subject: [PATCH 23/44] KVM: RISC-V: Tag init functions and data with __init, __ro_after_init
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
X-CRM114-CacheID: sfid-20221102_161954_790380_53B4BA1B 
X-CRM114-Status: GOOD (  11.23  )
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

Now that KVM setup is handled directly in riscv_kvm_init(), tag functions
and data that are used/set only during init with __init/__ro_after_init.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/riscv/include/asm/kvm_host.h |  6 +++---
 arch/riscv/kvm/mmu.c              | 12 ++++++------
 arch/riscv/kvm/vmid.c             |  4 ++--
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 8c771fc4f5d2..778ff0f282b7 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -295,11 +295,11 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
 int kvm_riscv_gstage_alloc_pgd(struct kvm *kvm);
 void kvm_riscv_gstage_free_pgd(struct kvm *kvm);
 void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu);
-void kvm_riscv_gstage_mode_detect(void);
-unsigned long kvm_riscv_gstage_mode(void);
+void __init kvm_riscv_gstage_mode_detect(void);
+unsigned long __init kvm_riscv_gstage_mode(void);
 int kvm_riscv_gstage_gpa_bits(void);
 
-void kvm_riscv_gstage_vmid_detect(void);
+void __init kvm_riscv_gstage_vmid_detect(void);
 unsigned long kvm_riscv_gstage_vmid_bits(void);
 int kvm_riscv_gstage_vmid_init(struct kvm *kvm);
 bool kvm_riscv_gstage_vmid_ver_changed(struct kvm_vmid *vmid);
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 3620ecac2fa1..f42a34c7879a 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -20,12 +20,12 @@
 #include <asm/pgtable.h>
 
 #ifdef CONFIG_64BIT
-static unsigned long gstage_mode = (HGATP_MODE_SV39X4 << HGATP_MODE_SHIFT);
-static unsigned long gstage_pgd_levels = 3;
+static unsigned long gstage_mode __ro_after_init = (HGATP_MODE_SV39X4 << HGATP_MODE_SHIFT);
+static unsigned long gstage_pgd_levels __ro_after_init = 3;
 #define gstage_index_bits	9
 #else
-static unsigned long gstage_mode = (HGATP_MODE_SV32X4 << HGATP_MODE_SHIFT);
-static unsigned long gstage_pgd_levels = 2;
+static unsigned long gstage_mode __ro_after_init = (HGATP_MODE_SV32X4 << HGATP_MODE_SHIFT);
+static unsigned long gstage_pgd_levels __ro_after_init = 2;
 #define gstage_index_bits	10
 #endif
 
@@ -760,7 +760,7 @@ void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu)
 		kvm_riscv_local_hfence_gvma_all();
 }
 
-void kvm_riscv_gstage_mode_detect(void)
+void __init kvm_riscv_gstage_mode_detect(void)
 {
 #ifdef CONFIG_64BIT
 	/* Try Sv57x4 G-stage mode */
@@ -784,7 +784,7 @@ void kvm_riscv_gstage_mode_detect(void)
 #endif
 }
 
-unsigned long kvm_riscv_gstage_mode(void)
+unsigned long __init kvm_riscv_gstage_mode(void)
 {
 	return gstage_mode >> HGATP_MODE_SHIFT;
 }
diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
index 6cd93995fb65..5246da1c9167 100644
--- a/arch/riscv/kvm/vmid.c
+++ b/arch/riscv/kvm/vmid.c
@@ -17,10 +17,10 @@
 
 static unsigned long vmid_version = 1;
 static unsigned long vmid_next;
-static unsigned long vmid_bits;
+static unsigned long vmid_bits __ro_after_init;
 static DEFINE_SPINLOCK(vmid_lock);
 
-void kvm_riscv_gstage_vmid_detect(void)
+void __init kvm_riscv_gstage_vmid_detect(void)
 {
 	unsigned long old;
 
-- 
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
