Return-Path: <SRS0=2pxE=P6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D47AC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 02:08:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2542761260
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 02:08:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2542761260
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3ipki2b4M3EQggY9wn2z6hi+jT1b5k28nuB0jee4W7E=; b=qNSsN7nHiRwYFh
	thdQiWgRLAKGtBdTXOFN5mxhvmrDSmBvJiTTNX0B48NtKcFUW8J9nG+N3HV0HIA1rrLvgUQArh3Q3
	oxgAqpSY2ZG3sRTusLyys0HHwr4zdK79A8dNa6g4rCDpmx2H/fhnBT3O0ds1KZHxf92RZQ/E7umej
	5Y3D+z4rzl4T3smJ0mZZNMfWJ50Q0Hsk4jjBUMDIKz97Q8Sg56Cs6q5P5Gzr6TVRiu4H7tm6i3w2O
	LaI1B091t3in+KNHnVWz7SKeECCxqgi4X61/KHXHVrUe2vQro0ip/eOlNhPq/8wjGqu5XjfcoCvjk
	GR+3VJZNhmX3ckM1MNPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkzW2-006kr9-Ty; Thu, 11 Nov 2021 02:08:38 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkzVD-006kOv-2V
 for linux-riscv@lists.infradead.org; Thu, 11 Nov 2021 02:07:50 +0000
Received: by mail-pf1-x44a.google.com with SMTP id
 c140-20020a624e92000000b0044d3de98438so3024154pfb.14
 for <linux-riscv@lists.infradead.org>; Wed, 10 Nov 2021 18:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=tzJkfgYHxl8Hqcg8u/5VLHhx3ygcDPf8C0WC2uGyae4=;
 b=sjwIGmNp+e7ADiI1VXuubIUgu7aakWxokn5rB+ZXv/1RKcxJo0o+ayoDqiv1vnmU2t
 y2g+ZGXPL98vD4HTszBT5NRpN6L6QYFfwaOz8SsRcU24JWfcj+LuqRS8WgvoHC3za9ex
 /WUdT0ZunZhSDYaVW9smKXDN8o/rDjmZw2Zm/endCBONkKIwSw23ApNwOZ+5pgK8N8KV
 6QBkHEV8MfWgf59bzLEJ5lyULrdtdjpxQCmIJ8B33Y3VIDQ9nqa1x+eCFwljaNkGWYLU
 jZBt32p8QqA2UeEWF+MxoGjTtfhFzLLo/q8TUyg2rzIUbCtuHlm4371DX81vuqZl9UQ1
 DFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=tzJkfgYHxl8Hqcg8u/5VLHhx3ygcDPf8C0WC2uGyae4=;
 b=W9WOCJ/vmlQc3CAyPFZPL0Op9IL7vtfnmZqZz1cjV2qaDHuYzkrWOkb6ywEhOgOaPD
 uDPWBQvtWVuxJUiOHbSKwl+n3lrxp0tIVLSteXRjau16XeWjrhGB8xaq9sg1e+mEzBX9
 BogzgU2hZHYd6AATxPXKNmrGnvlKq8M7LnDcsnrASt/v9TY6v8M4wU85RZySOqXLHFrD
 XQSu60kJOXyE0MyR2DVS8OHeQkJ0zCDAz622JAKhKdkfRmDEHVwAaOwCoQmlEFUYJJXJ
 BmWmAs8XJMMmn5IIWk7n9j6e+7meb55I/w2c14m2ZOOQHFAwgv3PrqLqGUG7A3JhegtU
 GamA==
X-Gm-Message-State: AOAM530unVUT6afbMle/tAtzM63Xom4KeRJmaBI7Hfh7YeUFxKq7NqbM
 ifM3XMyC5SRp1ctAIsSZVebncIZ7hM0=
X-Google-Smtp-Source: ABdhPJyeqxRmsuvvw74Iqn1NTFV8lezNbZne36vOAMPd5Dm0FM3Hs8a4MEZrVV1SljCNALtWfHjY5EGOjlQ=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:902:6acb:b0:142:76c3:d35f
 with SMTP id
 i11-20020a1709026acb00b0014276c3d35fmr4088456plt.89.1636596466113; Wed, 10
 Nov 2021 18:07:46 -0800 (PST)
Date: Thu, 11 Nov 2021 02:07:24 +0000
In-Reply-To: <20211111020738.2512932-1-seanjc@google.com>
Message-Id: <20211111020738.2512932-4-seanjc@google.com>
Mime-Version: 1.0
References: <20211111020738.2512932-1-seanjc@google.com>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
Subject: [PATCH v4 03/17] KVM: x86: Register Processor Trace interrupt hook
 iff PT enabled in guest
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
X-CRM114-CacheID: sfid-20211110_180747_167769_0FC5EDFE 
X-CRM114-Status: GOOD (  15.46  )
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

Override the Processor Trace (PT) interrupt handler for guest mode if and
only if PT is configured for host+guest mode, i.e. is being used
independently by both host and guest.  If PT is configured for system
mode, the host fully controls PT and must handle all events.

Fixes: 8479e04e7d6b ("KVM: x86: Inject PMI for KVM guest")
Cc: stable@vger.kernel.org
Cc: Like Xu <like.xu.linux@gmail.com>
Reported-by: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Reported-by: Artem Kashkanov <artem.kashkanov@intel.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/include/asm/kvm_host.h | 1 +
 arch/x86/kvm/vmx/vmx.c          | 1 +
 arch/x86/kvm/x86.c              | 5 ++++-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 2acf37cc1991..bf0a9ce53750 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1514,6 +1514,7 @@ struct kvm_x86_init_ops {
 	int (*disabled_by_bios)(void);
 	int (*check_processor_compatibility)(void);
 	int (*hardware_setup)(void);
+	bool (*intel_pt_intr_in_guest)(void);
 
 	struct kvm_x86_ops *runtime_ops;
 };
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 76861b66bbcf..0927d07b2efb 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -7918,6 +7918,7 @@ static struct kvm_x86_init_ops vmx_init_ops __initdata = {
 	.disabled_by_bios = vmx_disabled_by_bios,
 	.check_processor_compatibility = vmx_check_processor_compat,
 	.hardware_setup = hardware_setup,
+	.intel_pt_intr_in_guest = vmx_pt_mode_is_host_guest,
 
 	.runtime_ops = &vmx_x86_ops,
 };
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 021b2c1ac9f0..021d3f5364b2 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -8451,7 +8451,7 @@ static struct perf_guest_info_callbacks kvm_guest_cbs = {
 	.is_in_guest		= kvm_is_in_guest,
 	.is_user_mode		= kvm_is_user_mode,
 	.get_guest_ip		= kvm_get_guest_ip,
-	.handle_intel_pt_intr	= kvm_handle_intel_pt_intr,
+	.handle_intel_pt_intr	= NULL,
 };
 
 #ifdef CONFIG_X86_64
@@ -11146,6 +11146,8 @@ int kvm_arch_hardware_setup(void *opaque)
 	memcpy(&kvm_x86_ops, ops->runtime_ops, sizeof(kvm_x86_ops));
 	kvm_ops_static_call_update();
 
+	if (ops->intel_pt_intr_in_guest && ops->intel_pt_intr_in_guest())
+		kvm_guest_cbs.handle_intel_pt_intr = kvm_handle_intel_pt_intr;
 	perf_register_guest_info_callbacks(&kvm_guest_cbs);
 
 	if (!kvm_cpu_cap_has(X86_FEATURE_XSAVES))
@@ -11176,6 +11178,7 @@ int kvm_arch_hardware_setup(void *opaque)
 void kvm_arch_hardware_unsetup(void)
 {
 	perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
+	kvm_guest_cbs.handle_intel_pt_intr = NULL;
 
 	static_call(kvm_x86_hardware_unsetup)();
 }
-- 
2.34.0.rc0.344.g81b53c2807-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
