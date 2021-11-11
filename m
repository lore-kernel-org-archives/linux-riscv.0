Return-Path: <SRS0=2pxE=P6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2104C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 02:08:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC30D61073
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 02:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC30D61073
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DoxYGVBaEddMPQCRdsHGXF3ekxsK07x/JDMWwmJSiwk=; b=N4Ttd5KUTusU2Q
	1OygrwTX5B7W2jyHEjBaJRiaRD6dAIIJLY5nEe4rMlF1VG4ck1J7thB1euW4kjany+YOomKpqcNFM
	b+ozd1RsZVE+QpKCpnZ4UnIk+9tSF03CZNIaZh8XGndcYnMQL1QbQnsaEk7vJ09XAxWgCODeuV/IV
	QeSD4feLMhIYQTnkh8/HAkRo+9efl1zZOWKluck+EWcGy5ENRNJ95KH3nF+5WlGRTakeL+9dxhzw/
	XFTVV6RFOi1UTrQyYbCVemfQsM2ksaRyxorI8aue7TrPu/RnMK4y+jrBKOYTbmIjIXMFAXl6+MPYL
	JOx8W3TVDnE2EfivUQkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkzW1-006kqd-3T; Thu, 11 Nov 2021 02:08:37 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkzVB-006kNA-Qf
 for linux-riscv@lists.infradead.org; Thu, 11 Nov 2021 02:07:49 +0000
Received: by mail-pf1-x449.google.com with SMTP id
 g142-20020a625294000000b004946d789d14so3064398pfb.3
 for <linux-riscv@lists.infradead.org>; Wed, 10 Nov 2021 18:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=hK/bb2+8SYaruhoQBxjUMD9dzEtjE9dODoHgmaxXM04=;
 b=ioMgfZT9xO/74nIuEa5s079HZzqYDthukPpMRSdF0C3awDBWthDsWqAFo50b69aUgk
 Nhl7hmTYeB+KSKGuShd9pnZgSHEJ4YdF59a3n2gw+3Am+iHw8BnPD9PQEuIObPEX1zet
 XT5oCTwKFkgZjUeOaAP52YI/QxstVIlhlvJS+3cp25s9mkhbYvGe1eTarbKtvSx415JI
 ECVQms8ylbLIS/A+wF3YHJcodbwqtGvWDNxp9OhyCccF49POD6LZ1YDg80r7wc3jC1/x
 2UeOF3HXehBTuQGieAJ2PQ8fh4iSC2ZmT1gzNp9Gsi+Io2TQjCObkIi6pMuDLYQvs7JU
 qJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=hK/bb2+8SYaruhoQBxjUMD9dzEtjE9dODoHgmaxXM04=;
 b=xW8l5ZVnzvqlOImZ8iUOY6aWrOM+dd7slkXRQMI495Z+n+BwHpqh2S/xjGFnZtZwTe
 lSteFNdemowRPvi3pGc/uWQCNCgmlcNCFW9FdhrqIGbWF00znNj8dqKr0uY3oryk+oVb
 83lpuhXD7lA7ahGkgm4D6CcCaTSKuhWhK89DUqphkHA7usPzVkDqwTepbNaXKPKXhz4W
 /cYgCEitc95oHi2zRqWI2+wqqwaWRA7EKMNcLKsxaH0UEx8JF68LPct2u9Ld9l9woVJ1
 a7klvQ/QEDbGHWGyHoNRojMelC0Ov1CE1B1/B9J1dBWJJqze7Ul3RHxdi1SrE2qWXR8B
 FwHQ==
X-Gm-Message-State: AOAM530TfstqdqXXg9u7J1hcW/929lBg/rLB++ej9VVKECmWWdp3C1kj
 KZtfdXlVTn+074ULmBH8E50B6mHJ2WE=
X-Google-Smtp-Source: ABdhPJyQu0wj6xnqaOSUJnCa9iYYs/0X0i20LUCAU5FW0hNQJqyaWntSFAsP1Erw+w1uVAuo6SyrzLgxEvw=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:1822:b0:49f:c55b:6235
 with SMTP id
 y34-20020a056a00182200b0049fc55b6235mr3668521pfa.66.1636596464117; Wed, 10
 Nov 2021 18:07:44 -0800 (PST)
Date: Thu, 11 Nov 2021 02:07:23 +0000
In-Reply-To: <20211111020738.2512932-1-seanjc@google.com>
Message-Id: <20211111020738.2512932-3-seanjc@google.com>
Mime-Version: 1.0
References: <20211111020738.2512932-1-seanjc@google.com>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
Subject: [PATCH v4 02/17] KVM: x86: Register perf callbacks after calling
 vendor's hardware_setup()
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, 
 Russell King <linux@armlinux.org.uk>, Marc Zyngier <maz@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>, 
 Vincent Chen <deanbo422@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
 Juergen Gross <jgross@suse.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, 
 Namhyung Kim <namhyung@kernel.org>, James Morse <james.morse@arm.com>, 
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 "H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Wanpeng Li <wanpengli@tencent.com>, 
 Jim Mattson <jmattson@google.com>, Joerg Roedel <joro@8bytes.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.cs.columbia.edu, linux-csky@vger.kernel.org, 
 linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
 xen-devel@lists.xenproject.org, Artem Kashkanov <artem.kashkanov@intel.com>, 
 Like Xu <like.xu.linux@gmail.com>, Like Xu <like.xu@linux.intel.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211110_180745_892381_9FB7F8B2 
X-CRM114-Status: GOOD (  12.54  )
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

Wait to register perf callbacks until after doing vendor hardaware setup.
VMX's hardware_setup() configures Intel Processor Trace (PT) mode, and a
future fix to register the Intel PT guest interrupt hook if and only if
Intel PT is exposed to the guest will consume the configured PT mode.

Delaying registration to hardware setup is effectively a nop as KVM's perf
hooks all pivot on the per-CPU current_vcpu, which is non-NULL only when
KVM is handling an IRQ/NMI in a VM-Exit path.  I.e. current_vcpu will be
NULL throughout both kvm_arch_init() and kvm_arch_hardware_setup().

Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Artem Kashkanov <artem.kashkanov@intel.com>
Cc: stable@vger.kernel.org
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index c1c4e2b05a63..021b2c1ac9f0 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8567,8 +8567,6 @@ int kvm_arch_init(void *opaque)
 
 	kvm_timer_init();
 
-	perf_register_guest_info_callbacks(&kvm_guest_cbs);
-
 	if (boot_cpu_has(X86_FEATURE_XSAVE)) {
 		host_xcr0 = xgetbv(XCR_XFEATURE_ENABLED_MASK);
 		supported_xcr0 = host_xcr0 & KVM_SUPPORTED_XCR0;
@@ -8600,7 +8598,6 @@ void kvm_arch_exit(void)
 		clear_hv_tscchange_cb();
 #endif
 	kvm_lapic_exit();
-	perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
 
 	if (!boot_cpu_has(X86_FEATURE_CONSTANT_TSC))
 		cpufreq_unregister_notifier(&kvmclock_cpufreq_notifier_block,
@@ -11149,6 +11146,8 @@ int kvm_arch_hardware_setup(void *opaque)
 	memcpy(&kvm_x86_ops, ops->runtime_ops, sizeof(kvm_x86_ops));
 	kvm_ops_static_call_update();
 
+	perf_register_guest_info_callbacks(&kvm_guest_cbs);
+
 	if (!kvm_cpu_cap_has(X86_FEATURE_XSAVES))
 		supported_xss = 0;
 
@@ -11176,6 +11175,8 @@ int kvm_arch_hardware_setup(void *opaque)
 
 void kvm_arch_hardware_unsetup(void)
 {
+	perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
+
 	static_call(kvm_x86_hardware_unsetup)();
 }
 
-- 
2.34.0.rc0.344.g81b53c2807-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
