Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC76DC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 23:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x+Pcdz6UATIYrux5DxHoH/ussDKZBfoFvGdI1KKK2Rc=; b=nJKIWnzpCfWwo/
	flJuPqgw9OV6j79XCgN45aTV4TIP8uQIZSGGWcZW7x/SNBt3x+1dKRKr2IEKslnUZwLaItTDSdW5F
	J4zjXUYty2gWgh5FR7x2YA3nrDXE0dt/82Kb1HwGjSZZIhu4WNl7hsTMD6d73reYwsWqy+KeCT20s
	HJPn3pcIgdnoZSNXI8NLBqO0M8LyoBQZuV/yl+XBQ0btQf8jNlBB3/TnqP//0kevkaID5t8kiy2Rq
	NlyTOoK9sCtJJ72lfW8iKiagtI62hdP1E73OKXdKLeB2p7JOa/55v+rN9X2s5ND7iNLwejYW9+kvc
	X6VeUq/V7lg6i2TvpzAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN7X-00ExOR-08; Wed, 02 Nov 2022 23:26:07 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN1f-00EtZF-Rd
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:20:05 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-368e6c449f2so1016477b3.5
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=mKnEtQX0QH/ggk+Ht36/d+63ROqx6WCYCltiz+Zzjv4=;
        b=SdQ/LsY4NGnVE1yE06OYtnoYVCRmFREHfZbDy+hy/qKLprusJ3oD9C3Z6OVRKqQrnE
         CInFERbmx9ZRnFYiATYzBK74mPS4+cAZJ+5ijRabgzbKKerJGVt8ZZlmJzt5Hj/aV0PA
         EGW/7VotUp9NojxVblVL/QpJZuKvGxyCajSBZEMqVRwQDUQw2wRSv4vj1QT6bcpnpc9t
         e4rP+2f3gLSJ/JJRtgPX3AbV2Tyauor4ctFIQiYJWU548K+/wXsudAS9Uik/E0jRBxNq
         qFZGa2xPRMU89uQ30BChflY3hdbUkhWTUyAN3U9JeOyLGBy95xzkfXnGKk726vF8pKbF
         n5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mKnEtQX0QH/ggk+Ht36/d+63ROqx6WCYCltiz+Zzjv4=;
        b=T+smO6FtxwsS6zmaFohiXDDVvVV6h17i1vnqzbNYtX3hGq7NlPnWo5cvtJyR+0tyuq
         Yy6V8V/JOu+zBsFyZlaglSKhGXGUnzNpOpPN+WkBe0Y1SwnlUuXnU+GFjAQlAsipBGPY
         PIVT7D9eL2piV3nNhi0ynyIuVwa1ylVPczvC9A9if0A9uvPafNmoAWAqXStW/7oPw8t3
         ZTCrsqiPhsAxywXL0pv5Col+6Tk16SW0mICupR39dxNpeGSTrJYCm+9hw25z+Uivqsc2
         DEoAT1xnp4K57O7OzOtTRI6JESD4bRM+W08XTBACNrM8bTBrpgtIX0+xejgsUL7Mzn2D
         7Apg==
X-Gm-Message-State: ACrzQf0828rIowniWSalGQTVQDU4C1N63Z/pJ362wg2uY4FiOr2V9Tm4
	xU3EY5WW4FIZ/ofeUG6O4SCzgBKy9uI=
X-Google-Smtp-Source: AMsMyM58olcArAfGw4eM2juSx6NG/cSk/6KUdGGsxOwq8NmV4ZhdhKDU4RNI0GuMTLVYYG9b0/LsdP0LTpo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:c615:0:b0:6c9:f71a:f95d with SMTP id
 k21-20020a25c615000000b006c9f71af95dmr26436245ybf.411.1667431202255; Wed, 02
 Nov 2022 16:20:02 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:55 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-29-seanjc@google.com>
Subject: [PATCH 28/44] KVM: VMX: Make VMCS configuration/capabilities structs
 read-only after init
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
X-CRM114-CacheID: sfid-20221102_162003_948846_76F7EC13 
X-CRM114-Status: UNSURE (   9.80  )
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

Tag vmcs_config and vmx_capability structs as __init, the canonical
configuration is generated during hardware_setup() and must never be
modified after that point.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/capabilities.h | 4 ++--
 arch/x86/kvm/vmx/vmx.c          | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/vmx/capabilities.h b/arch/x86/kvm/vmx/capabilities.h
index 87c4e46daf37..2aaa0fd53d08 100644
--- a/arch/x86/kvm/vmx/capabilities.h
+++ b/arch/x86/kvm/vmx/capabilities.h
@@ -68,13 +68,13 @@ struct vmcs_config {
 	u64 misc;
 	struct nested_vmx_msrs nested;
 };
-extern struct vmcs_config vmcs_config;
+extern struct vmcs_config vmcs_config __ro_after_init;
 
 struct vmx_capability {
 	u32 ept;
 	u32 vpid;
 };
-extern struct vmx_capability vmx_capability;
+extern struct vmx_capability vmx_capability __ro_after_init;
 
 static inline bool cpu_has_vmx_basic_inout(void)
 {
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 6adb60485839..81690fce0eb1 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -489,8 +489,8 @@ static DEFINE_PER_CPU(struct list_head, loaded_vmcss_on_cpu);
 static DECLARE_BITMAP(vmx_vpid_bitmap, VMX_NR_VPIDS);
 static DEFINE_SPINLOCK(vmx_vpid_lock);
 
-struct vmcs_config vmcs_config;
-struct vmx_capability vmx_capability;
+struct vmcs_config vmcs_config __ro_after_init;
+struct vmx_capability vmx_capability __ro_after_init;
 
 #define VMX_SEGMENT_FIELD(seg)					\
 	[VCPU_SREG_##seg] = {                                   \
-- 
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
