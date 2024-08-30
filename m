Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1878BCA0EDF
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Aug 2024 04:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4AP0FUVZSg3N6x5gcFvIgVuXiww2V7Rwt9/kN6/jHKk=; b=33Q34HpkIz/d8l
	wMxI4qpuJWiWJG5wwKjLm1jUSY6TKsUT0xv/rkFBAhrUwuRetC8jw1pJJe0NVcQ8cuxoNkgMyOYRR
	XuPWY0DbWMDmZRZ1QPbqcu1cEgMiM0j6ULanYPaCnU3SBXYmnsUKDqODIsjADZ3AXEkXqyeItFSDS
	nDKf3X6gm0EGfFEXkAq0gcgjbKs9MrSuK7lOXEDBld4sMqxKtltAmEH5ITADW/T1zFz5Xv0kmS8+w
	r3tb/bIYzWS84cFOUX+BpB0HDFSK2czusSY5uSlatzEjPhdpezmc507wDlKmftNeHIuPRyATztiq3
	4CixeRBQTLkpM9pKcwIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjtT5-00000004hXc-0vQ1;
	Fri, 30 Aug 2024 04:42:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjtN4-00000004fvF-0bnn
	for linux-riscv@bombadil.infradead.org;
	Fri, 30 Aug 2024 04:36:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=k204YuuBNkPIQSpU0QhI7EvnHBfhBz5F6jzs/OiMdls=; b=qAdOqGm2WKyaFItVwHD8LNd0u4
	REiAfHuOekjKUBd9O7vWZRnwS16XUcmYtGCcr7Z1z4xJ5X4vngLqcKHHkDYN6w/xC4xcEoHevg0pL
	p7o/FUZwyOf5jfRA5LQ+a50cHurdczS6SOQaeWKwx58+L9tSopVF6FC3b/yblQLup/NDbHDd0lxug
	YiL7oRdSGq2TaCGcOOqaqQUMGBH3fKdzv5SsXRxxMksQk3muxoExLWwW2yJu/60cpv/n5AlAYb7fv
	AtnUrSf9ele9JZxRO5H5Wm+jkZsHPD3UXjWcpLC9xbI5pXgWS6+KfUGGj0WRLheWGi8Kcn4D+NJvb
	7sjvVorQ==;
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjtN0-0000000BYex-2fzp
	for linux-riscv@lists.infradead.org;
	Fri, 30 Aug 2024 04:36:24 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6b44f75f886so27911737b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 29 Aug 2024 21:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724992581; x=1725597381; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=k204YuuBNkPIQSpU0QhI7EvnHBfhBz5F6jzs/OiMdls=;
        b=4D33Jke9HvJx2wZAxItEo+TL+9L4+raUHKAxX2pkIv7MPGLU62KhRwKkiSoHD5/NQP
         LphELKeUTrIMhrd8HH4BtR6enOh/gtn1/rIv0xaLknGmH8yUHko2abMSu9Izj4FlE5Rw
         pyqoK0cTXPFgg/WUZ9Q8MspotVHk3zZupXszD2h3KJIw6Wi4eBytGiFSvT+GLAiHK/Ey
         IEUEP189XKoAeFSglXs1xWvR4TWATBZF3+2sErFdTCRoFfSfiwSLN8lai5V6JlYmZLBH
         2sXRmUY9OvrY68Zi8lLqn32LUCoznaMM3Uxu0YiLrPo8E73H7cQqUYXK2kZu1l6aH2YP
         elvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724992581; x=1725597381;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k204YuuBNkPIQSpU0QhI7EvnHBfhBz5F6jzs/OiMdls=;
        b=OmpTa0pF5ji/Ox6RO6bMmZkEE8rdKRHki+gCE3Ei1jLzGk2I1sPjJLAxcoZtaWApgQ
         oDtD3Pi2tAiRBC+12k18hsw9+V5fAlTmVxuv023JAKuq+8BRLu4BWw3u1rTU4YcrgOPq
         SoNcvqmSsWC82IUlI7CQBUaz7VjlYNhf3ntL5WW+nAd+gWuMHT3ivnO5+EH2d0c2CyQL
         hsI8q9/DR8a+kVzt4Oy36wFb8bHpj/ESyl3rNu9tDNje4RAs7+yceUATfpXGyNTHDiYD
         5keHjLQsqu3qBZKCahkNsjVyqcJA98n/2qrCmN4ug4JwpcybEd/ia+KmD34qiNIEgPc3
         INHg==
X-Forwarded-Encrypted: i=1; AJvYcCUmqMXx46c47bi1I1Gflra2INRpIV30FL6rLA5PqiuP7stwcZzU9SS8vmL7COmX4SWbpzoD4+4/WXNz2g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0l5+2LPAsPGn9h5PKaTVxwLJ2ITlPlUGMdmLMGf2IKouc3qHy
	p1othY2oKEpTs4TODddU6fsi9PZkmaQR0HGwBeGS/3G7y9RvwJkr3E7WsKOcsdIMZrYNomVO+RF
	ImA==
X-Google-Smtp-Source: AGHT+IH7doeLworevO5q5a0Cpx/I2Hf/rkCrWJ1Q/dDQPDqM64XFN6CvEdH2toTw5kd6ygYMiJVKDoge7UM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:e1f:b0:650:93e3:fe73 with SMTP id
 00721157ae682-6d41000b45bmr405537b3.5.1724992580739; Thu, 29 Aug 2024
 21:36:20 -0700 (PDT)
Date: Thu, 29 Aug 2024 21:35:58 -0700
In-Reply-To: <20240830043600.127750-1-seanjc@google.com>
Mime-Version: 1.0
References: <20240830043600.127750-1-seanjc@google.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
Message-ID: <20240830043600.127750-9-seanjc@google.com>
Subject: [PATCH v4 08/10] KVM: Add arch hooks for enabling/disabling virtualization
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Chao Gao <chao.gao@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Farrah Chen <farrah.chen@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_053622_886801_0B4B9B73 
X-CRM114-Status: GOOD (  13.21  )
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

Add arch hooks that are invoked when KVM enables/disable virtualization.
x86 will use the hooks to register an "emergency disable" callback, which
is essentially an x86-specific shutdown notifier that is used when the
kernel is doing an emergency reboot/shutdown/kexec.

Add comments for the declarations to help arch code understand exactly
when the callbacks are invoked.  Alternatively, the APIs themselves could
communicate most of the same info, but kvm_arch_pre_enable_virtualization()
and kvm_arch_post_disable_virtualization() are a bit cumbersome, and make
it a bit less obvious that they are intended to be implemented as a pair.

Reviewed-by: Chao Gao <chao.gao@intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Acked-by: Kai Huang <kai.huang@intel.com>
Tested-by: Farrah Chen <farrah.chen@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 14 ++++++++++++++
 virt/kvm/kvm_main.c      | 14 ++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 63e46a5f3812..50ace701d468 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1514,6 +1514,20 @@ static inline void kvm_create_vcpu_debugfs(struct kvm_vcpu *vcpu) {}
 #endif
 
 #ifdef CONFIG_KVM_GENERIC_HARDWARE_ENABLING
+/*
+ * kvm_arch_{enable,disable}_virtualization() are called on one CPU, under
+ * kvm_usage_lock, immediately after/before 0=>1 and 1=>0 transitions of
+ * kvm_usage_count, i.e. at the beginning of the generic hardware enabling
+ * sequence, and at the end of the generic hardware disabling sequence.
+ */
+void kvm_arch_enable_virtualization(void);
+void kvm_arch_disable_virtualization(void);
+/*
+ * kvm_arch_{enable,disable}_virtualization_cpu() are called on "every" CPU to
+ * do the actual twiddling of hardware bits.  The hooks are called on all
+ * online CPUs when KVM enables/disabled virtualization, and on a single CPU
+ * when that CPU is onlined/offlined (including for Resume/Suspend).
+ */
 int kvm_arch_enable_virtualization_cpu(void);
 void kvm_arch_disable_virtualization_cpu(void);
 #endif
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 55779fbb37ec..9ae4bd8a3712 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -5582,6 +5582,16 @@ static DEFINE_PER_CPU(bool, virtualization_enabled);
 static DEFINE_MUTEX(kvm_usage_lock);
 static int kvm_usage_count;
 
+__weak void kvm_arch_enable_virtualization(void)
+{
+
+}
+
+__weak void kvm_arch_disable_virtualization(void)
+{
+
+}
+
 static int kvm_enable_virtualization_cpu(void)
 {
 	if (__this_cpu_read(virtualization_enabled))
@@ -5681,6 +5691,8 @@ static int kvm_enable_virtualization(void)
 	if (kvm_usage_count++)
 		return 0;
 
+	kvm_arch_enable_virtualization();
+
 	r = cpuhp_setup_state(CPUHP_AP_KVM_ONLINE, "kvm/cpu:online",
 			      kvm_online_cpu, kvm_offline_cpu);
 	if (r)
@@ -5711,6 +5723,7 @@ static int kvm_enable_virtualization(void)
 	unregister_syscore_ops(&kvm_syscore_ops);
 	cpuhp_remove_state(CPUHP_AP_KVM_ONLINE);
 err_cpuhp:
+	kvm_arch_disable_virtualization();
 	--kvm_usage_count;
 	return r;
 }
@@ -5724,6 +5737,7 @@ static void kvm_disable_virtualization(void)
 
 	unregister_syscore_ops(&kvm_syscore_ops);
 	cpuhp_remove_state(CPUHP_AP_KVM_ONLINE);
+	kvm_arch_disable_virtualization();
 }
 
 static int kvm_init_virtualization(void)
-- 
2.46.0.469.g59c65b2a67-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
