Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C614C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 23:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=thBIjd7u82JhShiIXvt17+5rx8cBuYB7TdLXCasZ03o=; b=senAHjjzYVQf2S
	b+TlhSp+U+PXUuqqcj9aJ2AuVNqWY60hBudytJS7rSLyo8ll5Ns2I6UTWMlba2vf0wEh/fPd9Y7v8
	lVn8cTthsBz4H64/8uk2sjQlD85hjQUIVyHkpPrGxsuTj7Nzb5FjEVTMK4gTRpaTqI4t4hhkWoH0M
	s4nzdSxNrJ5AM3HK+dcE96ZaKdMI4zCeixtjqc4bC78427McqWqfzk51yPRqspt1eimYV0mieA32g
	OqCzdFB9qFF5y5wbIkmnT2ApQl8paZ7UCZSYy91FRQK/uSAOOzGSsjq7UgP5+o5tXsj+r1UP7Lokm
	BgYpSl0vLEg5ooz3XrZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqNTO-00FAXd-7E; Wed, 02 Nov 2022 23:48:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqNGc-00F1m3-8p
	for linux-riscv@bombadil.infradead.org; Wed, 02 Nov 2022 23:35:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=KSp9zIzHXrxcJceHX59wYlpimn2+3DBl6/EkdM22YDo=; b=lcjkr2IPM3isoOEBDFXa+BPBsR
	oGaGo4AbbjzhlitdSsv7xbSj2sXlT7xEnV8i3ZVpn3GTjg2kA9z13UmlTwk7B6UMBPeBr8wgCEx3U
	UEvIaOb4Dn/61Uf8kgj5ZtKJE+OxeTujhv9quYrZbcH8dh3QPnChEu/RjDyGgU/TW5ONa6aZymO7L
	YmRX0X6+aX+GkXolGwZMkQfUmemt0z+dS8jBp2zLF48Uv7PP4c5tE/ZCncmla6nDr2CYTvrE1yUOy
	EjAG1A9ssgOrn86g7flP78M2pWEkSTQGgLYwPviORRWxrK3Un6TO+L1fA2kGrsVHY6rs/VGApBvV5
	MkGgs9VQ==;
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN1S-005vpB-Is
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:19:53 +0000
Received: by mail-pl1-x64a.google.com with SMTP id u8-20020a17090341c800b0018731b83fe4so210504ple.16
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=KSp9zIzHXrxcJceHX59wYlpimn2+3DBl6/EkdM22YDo=;
        b=GazJIJPM/pHmiFZ05wEIEUmIWAlYuh2ZlyTopcNekluhV4UHGi1yTDkMNANFS1jscV
         sHaoW06GH/7QoV/u1MZ9MSnC1FGAiLQO/y23W8/5eah4jm88WvvNxPaF2O5WlqNX6AA2
         8Gs4UT7UUi7/ZwHf5DCZWbM2vulQhHbwn2WtGD6rJzl/FOBfxZ8G3NM+geD74+eDAUum
         o1o3demNZa7SFz5SsAwJ7XKog0NdlraaEfYhRzZpffEE3gOpiTfLkShIIvuV3L13yEjN
         xam914sm21iReYi10+r23ej5bJnTbIKx2d2irwZwjp5ibbzs0gCmvLJoawOipg8dYos5
         2Zgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KSp9zIzHXrxcJceHX59wYlpimn2+3DBl6/EkdM22YDo=;
        b=HzrABPVnsm+LnXJWRBV5H2TyYp7xreiOGHPArJQJxF65JtY90GZU1dz4RoA9O7DJga
         cBpmQfWkrc0ziubFtbbOKVHZNgWXPleeoSAxXXyb0LtIFW5bYu0ECz5kK6/mdJiJr4Dy
         giZw7ifCjwhfgaPcMAGMseCVtdgH+hQFmg74/3XVj7khciX6aFIccGmpiegodqYy2d6W
         Lg9rdc7W2U41pEPM5TFGTUC5w/VGNCjNY1Q9w/1pna1ZtZJWPqU8022QZFiC40CeUkD4
         2ft067f3M8jSCsuaI1cyt53B2smDbiBAj3Awbd3vzm05hMxxZb9P4dNTezqNCfPEw61d
         CuBA==
X-Gm-Message-State: ACrzQf1E/cOrohfgWaAYY9lMeafiMvDIaFrfKrU1vncikD65ASwNnj7l
	mexNJQ0XTsNipDODTsUAZetXrQtqGWY=
X-Google-Smtp-Source: AMsMyM5Lv2JMFeAlRDTbvWUtcHml4s/PYrbj2uJcHSHWkZsi31gUm2Ed915QDdWGieIzAX5rFOQTrQSszmI=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:e0b:b0:56c:8c13:2a54 with SMTP id
 bq11-20020a056a000e0b00b0056c8c132a54mr27442020pfb.17.1667431182821; Wed, 02
 Nov 2022 16:19:42 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:44 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-18-seanjc@google.com>
Subject: [PATCH 17/44] KVM: arm64: Do arm/arch initialiation without bouncing
 through kvm_init()
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
X-CRM114-CacheID: sfid-20221102_231950_646919_8619C0B3 
X-CRM114-Status: GOOD (  11.36  )
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

Move arm/arch specific initialization directly in arm's module_init(),
now called kvm_arm_init(), instead of bouncing through kvm_init() to
reach kvm_arch_init().  Invoking kvm_arch_init() is the very first action
performed by kvm_init(), i.e. this is a glorified nop.

Making kvm_arch_init() a nop will allow dropping it entirely once all
other architectures follow suit.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index f400a8c029dd..bfa2dcd3db11 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2190,7 +2190,7 @@ void kvm_arch_irq_bypass_start(struct irq_bypass_consumer *cons)
 /**
  * Initialize Hyp-mode and memory mappings on all CPUs.
  */
-int kvm_arch_init(void *opaque)
+int kvm_arm_init(void)
 {
 	int err;
 	bool in_hyp_mode;
@@ -2264,6 +2264,14 @@ int kvm_arch_init(void *opaque)
 		kvm_info("Hyp mode initialized successfully\n");
 	}
 
+	/*
+	 * FIXME: Do something reasonable if kvm_init() fails after pKVM
+	 * hypervisor protection is finalized.
+	 */
+	err = kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
+	if (err)
+		goto out_subs;
+
 	return 0;
 
 out_subs:
@@ -2276,10 +2284,15 @@ int kvm_arch_init(void *opaque)
 	return err;
 }
 
+int kvm_arch_init(void *opaque)
+{
+	return 0;
+}
+
 /* NOP: Compiling as a module not supported */
 void kvm_arch_exit(void)
 {
-	kvm_unregister_perf_callbacks();
+
 }
 
 static int __init early_kvm_mode_cfg(char *arg)
@@ -2320,10 +2333,4 @@ enum kvm_mode kvm_get_mode(void)
 	return kvm_mode;
 }
 
-static int arm_init(void)
-{
-	int rc = kvm_init(NULL, sizeof(struct kvm_vcpu), 0, THIS_MODULE);
-	return rc;
-}
-
-module_init(arm_init);
+module_init(kvm_arm_init);
-- 
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
