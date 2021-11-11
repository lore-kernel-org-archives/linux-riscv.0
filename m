Return-Path: <SRS0=2pxE=P6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21458C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 02:21:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5FA161215
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Nov 2021 02:21:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E5FA161215
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References
	:Mime-Version:Message-Id:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=993ZDaumrDyR3byIn0sDBEtYzNnSjVIMEMBmlcjFbcY=; b=eJayPSCfUggNRr
	WH2xgdop0SCuwgZDUNK/sYOt4I/dO+EdpnX8GdVP2LZREgAxr09wKuLee7Pta7W87VXBZQbgPlRsl
	7T009ohmVmjByd9/LalboNt9OclC5QEowIBJC143tCiyTba9A8HuAdy7jRVcSd/Afhp23WE3u0aWc
	aWsHtFfGT46FVsYjKuEXSUkrzSXf33jDtNirvK4q6JMThxwPs+6+WXoN1NrRGqBQMRyIcvd4mitT/
	3g2A6VpbdWR8LprBzv4pkTcqsz3/4kWgdfo+9TLe1GuId3p7CTKvNnFbqi6GEZQwlDKz35oF8ZaVI
	nfeNFCI2HOqsq8QOXoZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkziL-006q82-G9; Thu, 11 Nov 2021 02:21:21 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkzVV-006kdc-C4
 for linux-riscv@lists.infradead.org; Thu, 11 Nov 2021 02:08:10 +0000
Received: by mail-pj1-x104a.google.com with SMTP id
 mv1-20020a17090b198100b001a67d5901d2so2244958pjb.7
 for <linux-riscv@lists.infradead.org>; Wed, 10 Nov 2021 18:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=reply-to:date:in-reply-to:message-id:mime-version:references
 :subject:from:to:cc;
 bh=mw+8kRBMaigpdPoQg441qk6T9IEU8krLENLSjCCr4zw=;
 b=SrMofVJY/GjIpbuhbq5Q0NchE90Iee1Zg/DXzrBAL+84O+9mkb6Cvy4kbuTgC9NQoK
 tBqW8VuJ90++OLutVCiS1ya3l32W+JKb2BOUzxT4CfsJTbL/puTXQsav1euvT3+gukG2
 yS7t4ZuH8QzI7fhcSd7lINxxYvVsKg3i3FXbG+Q8gteNmUbpj11OvRbe8kbh++awXIwA
 lQ4l1HocfEVizMh2041kgc72dvgbUqXNAgsThfb0ZWYRAHAJLmF2dzBFcQYmNC3B4SgG
 os87bSDOwQmR/d7G3NMYHAuPjpmsSI+LJUHPF3mp7ZDo3cMuuRvUGMBLZ8TO5A0n/acG
 yo8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:date:in-reply-to:message-id
 :mime-version:references:subject:from:to:cc;
 bh=mw+8kRBMaigpdPoQg441qk6T9IEU8krLENLSjCCr4zw=;
 b=uic0iQIsH7SyRlWS81Csj4vvI9dvDc7C1UnJRZtzFHodPfejn3qOTuoC1XKbJ9ANSO
 TVDMD4E6xuZah2abzhEu97M64ZrJAbVAASH6FfZsF8MoCgNDMGxzB8JkQqHSHdGogcyT
 2e7CMtG+rhUoPuImEIQDTz5koPQDClK5ez1nMV+hp3wYJ0+rbscms319zVkJtugRu+7I
 0Jq5z2GtFRL59SoK/gs/oMk1yeeWyFfM0Q8COaC7yDu38+ATNEgftaAaR2OfoSRm+q/c
 GLilHd7EpMa3YaqgbFemddAo9aYFg66JfDFU1xHnHaM8Sr2i9VRMU8R6by7kXlg34nHr
 ++iw==
X-Gm-Message-State: AOAM531TgyMvYiHhbG4AlpyVwgAokl/25lUL4jp7w4ZepigbFRgeiy54
 NvmOI8oYjv+mVB+vIHXKT23ZJzpAb4k=
X-Google-Smtp-Source: ABdhPJz67wmixiDyySBDTYDOJ0Ka4b7LxO+H1fUSrGnT0BW1K6fuhepd8JhPlaHMI6pEBAJMacMWw56NTRg=
X-Received: from seanjc.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e5])
 (user=seanjc job=sendgmr) by 2002:a17:902:e789:b0:140:801:1262
 with SMTP id
 cp9-20020a170902e78900b0014008011262mr4254554plb.42.1636596483663; Wed, 10
 Nov 2021 18:08:03 -0800 (PST)
Date: Thu, 11 Nov 2021 02:07:35 +0000
In-Reply-To: <20211111020738.2512932-1-seanjc@google.com>
Message-Id: <20211111020738.2512932-15-seanjc@google.com>
Mime-Version: 1.0
References: <20211111020738.2512932-1-seanjc@google.com>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
Subject: [PATCH v4 14/17] KVM: arm64: Convert to the generic perf callbacks
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
X-CRM114-CacheID: sfid-20211110_180805_452572_76D08C5D 
X-CRM114-Status: GOOD (  11.62  )
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

Drop arm64's version of the callbacks in favor of the callbacks provided
by generic KVM, which are semantically identical.

Reviewed-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/perf.c | 34 ++--------------------------------
 1 file changed, 2 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/kvm/perf.c b/arch/arm64/kvm/perf.c
index dfa9bce8559e..374c496a3f1d 100644
--- a/arch/arm64/kvm/perf.c
+++ b/arch/arm64/kvm/perf.c
@@ -13,42 +13,12 @@
 
 DEFINE_STATIC_KEY_FALSE(kvm_arm_pmu_available);
 
-static unsigned int kvm_guest_state(void)
-{
-	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
-	unsigned int state;
-
-	if (!vcpu)
-		return 0;
-
-	state = PERF_GUEST_ACTIVE;
-	if (!vcpu_mode_priv(vcpu))
-		state |= PERF_GUEST_USER;
-
-	return state;
-}
-
-static unsigned long kvm_get_guest_ip(void)
-{
-	struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
-
-	if (WARN_ON_ONCE(!vcpu))
-		return 0;
-
-	return *vcpu_pc(vcpu);
-}
-
-static struct perf_guest_info_callbacks kvm_guest_cbs = {
-	.state		= kvm_guest_state,
-	.get_ip		= kvm_get_guest_ip,
-};
-
 void kvm_perf_init(void)
 {
-	perf_register_guest_info_callbacks(&kvm_guest_cbs);
+	kvm_register_perf_callbacks(NULL);
 }
 
 void kvm_perf_teardown(void)
 {
-	perf_unregister_guest_info_callbacks(&kvm_guest_cbs);
+	kvm_unregister_perf_callbacks();
 }
-- 
2.34.0.rc0.344.g81b53c2807-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
