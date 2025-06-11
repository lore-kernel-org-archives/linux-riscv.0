Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 511E2C677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 00:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PGXsNi9i4I/kU88owxkvuKt2h/dGaW7c/piTqiqNJMQ=; b=uk+g3Vn4MYMLa+
	dWBQsVn8SDBnbkggNzO488FN6bjGDoCVLnvmo2PMBTe4FSeEmz435I/12f4Hb5/QLl0zXZWQLlWt7
	SEyPODgznBS2yD7qSZnMuuFdoUlNFPBX8KQRUOpy2eOrPFJXHZ/yBXZuNksSu4IBRTAQD9H8BOLEk
	wlsN/BBA2/7FI/jBJYifgVpIPUmz9M8mwgZzuHPAyqJMIAdw+Yqg4Y5x4TaBRa69EA9FMA12lKnGj
	TbjXzaRFOiIFu+jvKdMl9E2z5BaXErfPBgPlnXuaDZXD4FGWRMtJfMJylEo31xV91WvwZCFLKktU8
	yCjVDIDYooYH9mJhEahA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP99i-00000008T3s-1LJa;
	Wed, 11 Jun 2025 00:17:26 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP93L-00000008SAC-0Na2
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 00:10:52 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-3138f5e8ff5so2369165a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 17:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749600649; x=1750205449; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=6JPxC6M/8C78oUmZk1MgMr9DeqlObfjqst+28w3sGNI=;
        b=GtvNxwstXsRLgfrtRtQ1ajrnybbKV0oXBX5V/IHUANdof2xmaaYTcIsv7qjn5r4q/H
         iSK6po3KJwIZfP8QGF1qw5YWLRme/WSkUO39+jZYB4acXUZtrhf9VSrNJ5hBYDklqZR7
         fDIVg1yMFBqe1lonM8ppahagdgfsC3NPdoXmcZ/WrrBVtIk6Qv6miXS836lZpLlOUyuh
         F46+oSbD8zJ/fq1DM6QtLkNE69n/onR6Bjg+H0S7xaJYjXekEoCjeEU9CD4HoK+sQYpZ
         3yJzyOGRVVagvOcODr9oDuN8DuYgCzMANROTWCDM8ufXX5aGqpZXtevaYNhDNyHZSxL3
         iFig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749600649; x=1750205449;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6JPxC6M/8C78oUmZk1MgMr9DeqlObfjqst+28w3sGNI=;
        b=olavjQmh68RQCOMCBNAUe3SoCIRHwx/xIxHXmYgjk0yVhf8ERmDw0QWeZXLEvjFgfc
         9v98mK6jrrbCfiYIoEz0pKgO4EYhZvSl9iWcof8jQzNcS/IIpJGSU06wqF6AnW6oj8/i
         5MKZ0wIJeEXDcVl6E255+sdpwUTylEy5fZuDc/5quhlnbh1c4urIhHJ+WkC7qJls3aJ2
         rUPX++8yZ+IUhpSmWSu1igoVww4e9BMj+Stfv99xAEVlg3aVXf1YYqVyHC5yt5I65zHj
         BLcw6jXrZIRtY2E/iWV7FYLzg9WByEYZOprwO7H9HC3ENO28tbPjsQMX6ypgWIsu8lFR
         KEKg==
X-Forwarded-Encrypted: i=1; AJvYcCUVc0aaBf9evKrrFnTzS2sBNhdQ1FOvmThtZXJNbQc/GPuz94AfnrdxhcqUqVBgW744Caw7NVBhv0P8Tw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGEL3mnTgr5yLtVYmpW3Mhg6pJZrSiJWXqSZQGHMZMxfg/ONG4
	HCJ/vzUQ4VX/rlHL0jd1h/s90UpssCRhVbnI29pMMjP0JFvTNZrSRagLEqHzQiYiFtInM7L5KfX
	l4g0ZaA==
X-Google-Smtp-Source: AGHT+IH8G3icYEi+L3rUhxMgi7kY7xVjk4t0ltvPAXoSgaLu6NXS+iOsy9Z0A/wrYNq1F2Q9c5lqhoRbAbQ=
X-Received: from pjbsm18.prod.google.com ([2002:a17:90b:2e52:b0:311:c7f9:ca1c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:52:b0:311:b0ec:1360
 with SMTP id 98e67ed59e1d1-313b1ff8de6mr923707a91.29.1749600648794; Tue, 10
 Jun 2025 17:10:48 -0700 (PDT)
Date: Tue, 10 Jun 2025 17:10:36 -0700
In-Reply-To: <20250611001042.170501-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250611001042.170501-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250611001042.170501-3-seanjc@google.com>
Subject: [PATCH 2/8] KVM: arm64: Include KVM headers to get forward declarations
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Anish Ghulati <aghulati@google.com>, Colton Lewis <coltonlewis@google.com>, 
	Thomas Huth <thuth@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_171051_120450_B977804C 
X-CRM114-Status: UNSURE (   7.94  )
X-CRM114-Notice: Please train this message.
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

Include include/uapi/linux/kvm.h and include/linux/kvm_types.h in ARM's
public arm_arch_timer.h and arm_pmu.h headers to get forward declarations
of things like "struct kvm_vcpu" and "struct kvm_device_attr", which are
referenced but never declared (neither file includes *any* KVM headers).

The missing includes don't currently cause problems because of the order
of includes in parent files, but that order is largely arbitrary and is
subject to change, e.g. a future commit will move the ARM specific headers
to arch/arm64/include/asm and reorder parent includes to maintain
alphabetic ordering.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/kvm/arm_arch_timer.h | 2 ++
 include/kvm/arm_pmu.h        | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/include/kvm/arm_arch_timer.h b/include/kvm/arm_arch_timer.h
index 681cf0c8b9df..22cce6843e9a 100644
--- a/include/kvm/arm_arch_timer.h
+++ b/include/kvm/arm_arch_timer.h
@@ -7,6 +7,8 @@
 #ifndef __ASM_ARM_KVM_ARCH_TIMER_H
 #define __ASM_ARM_KVM_ARCH_TIMER_H
 
+#include <linux/kvm.h>
+#include <linux/kvm_types.h>
 #include <linux/clocksource.h>
 #include <linux/hrtimer.h>
 
diff --git a/include/kvm/arm_pmu.h b/include/kvm/arm_pmu.h
index 96754b51b411..baf028d19dfc 100644
--- a/include/kvm/arm_pmu.h
+++ b/include/kvm/arm_pmu.h
@@ -7,6 +7,8 @@
 #ifndef __ASM_ARM_KVM_PMU_H
 #define __ASM_ARM_KVM_PMU_H
 
+#include <linux/kvm.h>
+#include <linux/kvm_types.h>
 #include <linux/perf_event.h>
 #include <linux/perf/arm_pmuv3.h>
 
-- 
2.50.0.rc0.642.g800a2b2222-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
