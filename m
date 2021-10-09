Return-Path: <SRS0=s3kv=O5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E92DC433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:24:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC79F60F51
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Oct 2021 02:24:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC79F60F51
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bG3UERpWgYiB5+7E1vYEVhtwFV3TSX/4xaaxXBfCzRc=; b=qbf1kxDQ5iE5zO
	61TQv8RtYx/53F7ZJmChvc7i+ZPAY6B/lBQ5WQ19q6nUPsUzXi9DvxAHZZBTisfMRqvQEwlAECYCZ
	PEWaCloJlRmyAwTKEg8AQT5suYwoa6Pn9YHrorIE4MDDNcdmRxz2EXFQCFeH3mxazbAqQm0NU/xcW
	MY9pUHtuSX39keah6Xsm+V2yg40Kai89Um5hTEqEoWmiSkSpqS96MZjp5STgg9XzflyY5nKji91Kx
	UFP661ffUNkOHk4j4jAAC47KyzRr0HDL4rbt4cs+iq9dEV9xKaZpgvowm6j5y+2E8+j3aatf5iQ4j
	sRsGjtlb+LpqiSMMvNig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZ22J-004ZSD-8k; Sat, 09 Oct 2021 02:24:31 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZ1rS-004U4c-6A
 for linux-riscv@lists.infradead.org; Sat, 09 Oct 2021 02:13:20 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 t7-20020a258387000000b005b6d7220c79so14964867ybk.16
 for <linux-riscv@lists.infradead.org>; Fri, 08 Oct 2021 19:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=A16ghZapKabIxKpJvSoekuSQb+2m0ovUg31JfH4Wpyk=;
 b=gXKY8WPbOOd7VUk2uZNjE2h38k02X7HYo+DeTvCyrUtBDVFLTYEsOV8HSoTA+FvX50
 6RKQel33Gtt9tZeSd/S1b5Fq4WSdHPmoxsRRolUsJs1RknoixjMGUTdHEj46Nu5OvT+D
 veVzIN6kL3lune6PqMLQN/YznPFV5x8H61PddtU3baQVQe6kcDq8AGdLFfWuVrLQ8EQf
 j+yjtMDopjwkS57GjAxolElfps1MfrQZh9wMiAPKNI3vZMMMUZ0Se8uxReg+fzG8sQAm
 DKcW2fuPnHMCOALfdqBDt6VllQOh4ktUmrRkK5ZhDt5ivim69QDNok10m3K5kTH0AXbg
 hPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=A16ghZapKabIxKpJvSoekuSQb+2m0ovUg31JfH4Wpyk=;
 b=osBNzio03QOO4j0drRLeuVGXFlOq8t6ZbK8s97tlBETWl0eUQjeMujq/acEmbk0bu/
 GE4Ivo5hwkILSI2L/NuutXQeA6o+DVsyvOrk0UnwW5LMNEdDlsSHdIe77VS1JgvZyqY/
 x85RcXMcDsL4uRzJRjAGPOOId+D688lx2tGQdvft4/BWZE0mbFX5sOPw0RrgdZ9SzFBO
 GjG8Jpcu4bmads6G5HM9HTS0aqA1MNLmy8dDzPB16Bqi5V2fCIMN0zYmPOcH/gCBxtOO
 x9E6IHKXexKvtdsLGcjzIaxJ3dIZdxNlJrbUSPeaUn23+tkeoC+WsSuC04M3ueLA89QV
 SKLw==
X-Gm-Message-State: AOAM531G64TGoj3w/3cXzOVL6tkSX1o+U0Nb8cGrtMLsCsK5s9S+9wcB
 E+g5wIhg7h7iK7fNYRZ9U0XPJuNubQs=
X-Google-Smtp-Source: ABdhPJyJ+GZrMSH71hr19sRLkQaSLa+OLA+oV25ZdCvzXSyS8FSLewbkBuw4xbZrikejj+zWUKwWlVBuMgU=
X-Received: from seanjc798194.pdx.corp.google.com
 ([2620:15c:90:200:e39b:6333:b001:cb])
 (user=seanjc job=sendgmr) by 2002:a25:1d57:: with SMTP id
 d84mr8116571ybd.410.1633745596490; 
 Fri, 08 Oct 2021 19:13:16 -0700 (PDT)
Date: Fri,  8 Oct 2021 19:12:07 -0700
In-Reply-To: <20211009021236.4122790-1-seanjc@google.com>
Message-Id: <20211009021236.4122790-15-seanjc@google.com>
Mime-Version: 1.0
References: <20211009021236.4122790-1-seanjc@google.com>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
Subject: [PATCH v2 14/43] KVM: Split out a kvm_vcpu_block() helper from
 kvm_vcpu_halt()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paul Mackerras <paulus@ozlabs.org>, 
 Anup Patel <anup.patel@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Janosch Frank <frankja@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: James Morse <james.morse@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Atish Patra <atish.patra@wdc.com>, 
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>, 
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-mips@vger.kernel.org, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, 
 Oliver Upton <oupton@google.com>, Jing Zhang <jingzhangos@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_191318_288004_281A9FC6 
X-CRM114-Status: GOOD (  14.66  )
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

Factor out the "block" part of kvm_vcpu_halt() so that x86 can emulate
non-halt wait/sleep/block conditions that should not be subjected to
halt-polling.

No functional change intended.

Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
Reviewed-by: David Matlack <dmatlack@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h |  1 +
 virt/kvm/kvm_main.c      | 52 +++++++++++++++++++++++++++-------------
 2 files changed, 37 insertions(+), 16 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index c2ea4004553a..2d837e06eeec 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -968,6 +968,7 @@ void kvm_sigset_activate(struct kvm_vcpu *vcpu);
 void kvm_sigset_deactivate(struct kvm_vcpu *vcpu);
 
 void kvm_vcpu_halt(struct kvm_vcpu *vcpu);
+bool kvm_vcpu_block(struct kvm_vcpu *vcpu);
 void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu);
 void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu);
 bool kvm_vcpu_wake_up(struct kvm_vcpu *vcpu);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index c13bf3367fda..42894ff7c474 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3201,6 +3201,35 @@ static int kvm_vcpu_check_block(struct kvm_vcpu *vcpu)
 	return ret;
 }
 
+/*
+ * Block the vCPU until the vCPU is runnable, an event arrives, or a signal is
+ * pending.  This is mostly used when halting a vCPU, but may also be used
+ * directly for other vCPU non-runnable states, e.g. x86's Wait-For-SIPI.
+ */
+bool kvm_vcpu_block(struct kvm_vcpu *vcpu)
+{
+	struct rcuwait *wait = kvm_arch_vcpu_get_wait(vcpu);
+	bool waited = false;
+
+	kvm_arch_vcpu_blocking(vcpu);
+
+	prepare_to_rcuwait(wait);
+	for (;;) {
+		set_current_state(TASK_INTERRUPTIBLE);
+
+		if (kvm_vcpu_check_block(vcpu) < 0)
+			break;
+
+		waited = true;
+		schedule();
+	}
+	finish_rcuwait(wait);
+
+	kvm_arch_vcpu_unblocking(vcpu);
+
+	return waited;
+}
+
 static inline void update_halt_poll_stats(struct kvm_vcpu *vcpu, ktime_t start,
 					  ktime_t end, bool success)
 {
@@ -3223,9 +3252,14 @@ static inline void update_halt_poll_stats(struct kvm_vcpu *vcpu, ktime_t start,
 	}
 }
 
+/*
+ * Emulate a vCPU halt condition, e.g. HLT on x86, WFI on arm, etc...  If halt
+ * polling is enabled, busy wait for a short time before blocking to avoid the
+ * expensive block+unblock sequence if a wake event arrives soon after the vCPU
+ * is halted.
+ */
 void kvm_vcpu_halt(struct kvm_vcpu *vcpu)
 {
-	struct rcuwait *wait = kvm_arch_vcpu_get_wait(vcpu);
 	bool halt_poll_allowed = !kvm_arch_no_poll(vcpu);
 	bool do_halt_poll = halt_poll_allowed && vcpu->halt_poll_ns;
 	ktime_t start, cur, poll_end;
@@ -3248,21 +3282,7 @@ void kvm_vcpu_halt(struct kvm_vcpu *vcpu)
 		} while (kvm_vcpu_can_poll(cur, stop));
 	}
 
-	kvm_arch_vcpu_blocking(vcpu);
-
-	prepare_to_rcuwait(wait);
-	for (;;) {
-		set_current_state(TASK_INTERRUPTIBLE);
-
-		if (kvm_vcpu_check_block(vcpu) < 0)
-			break;
-
-		waited = true;
-		schedule();
-	}
-	finish_rcuwait(wait);
-
-	kvm_arch_vcpu_unblocking(vcpu);
+	waited = kvm_vcpu_block(vcpu);
 
 	cur = ktime_get();
 	if (waited) {
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
