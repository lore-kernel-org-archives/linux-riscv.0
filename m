Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D252C4321E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 23:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U3v6dRN4QAAuNxNDRycskhDDTBpoviqrgwmqJctZZsQ=; b=WOikYHidXzbF89
	l1wP5H52KbY3x7tg+T7M6M/M0sL2tTCpPpt0Ig7JSJzh4SWUy6I7YLNsVN1yD1SptoYRDpxNxxAp0
	IcDB8J8FSdY0Utz9ESDmN2tQ9Lp3RwjXz/U7sOawZIE3KvcIura8XMHHR/BqMWDm8tKejVS18y32D
	kZ3BLWS96Wl9HDQJk/UK4aCpl28iyuPR5kBO2gkA8ca9f18+QnBctudK1VSWldqZ3UaSOmJZm4MwH
	MPMIfl3gLQ7sssVUrqQWq/bCkFdZ9a+bpgSKFKJH/L1jXNpHLqLC2Jzr5zv7her23v6BAMyDa10pD
	BrWh0ZX5NVYFp+DU67iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Woe-003MdQ-1B; Wed, 30 Nov 2022 23:48:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WUY-003E7h-Gk
	for linux-riscv@bombadil.infradead.org; Wed, 30 Nov 2022 23:27:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=syK6eF0z1YIhw5KnDfEJ/sqHR3QdYzGhfq3h/5i5Sas=; b=IijqZYxHETTiN7eqy/94ldX26v
	Tyvki2lWtEyYD7/RKYEM4fttvuUrl7N2oP+P59PIJcDq4QUn7qbbyOMx3AUb0lfhWmrGRIx1vTp5s
	sNkpLpRmZ9mNa3WbNekIbU1tVbvx8NXQeibMYKFDbUmDBta0w3MxZ7jXtTo5pil4qFHBL49UTCE+0
	zcn3Bsf+vUIYNDrW6wVXHh8mRwRVJuJDEev+BGcO3yIpRsZomTGue1Brf/0qlPQQmxq1d5AbH7jit
	VaYTOXrK1ib5G5eJst8UM00VBx0Vio9/8OU74BD2h1BXQpKEteMV1x5QuSkLV4qZ8m37oV7OT5xnU
	39sUaahg==;
Received: from mail-yb1-f201.google.com ([209.85.219.201])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0WDq-006BFb-87
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 23:10:37 +0000
Received: by mail-yb1-f201.google.com with SMTP id m62-20020a25d441000000b006f1ccc0feffso17172154ybf.9
        for <linux-riscv@lists.infradead.org>; Wed, 30 Nov 2022 15:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=syK6eF0z1YIhw5KnDfEJ/sqHR3QdYzGhfq3h/5i5Sas=;
        b=GVS6tfQs69HM9iPg5RyanavfgqTtstL/hP2NZwyz6ZiOn7sQ0OggFONinN3Xpq5A5O
         ROAGkLrScqRoWmoumJCapQkQLkR93EZiZmJgM/igbQR0yiEQhTM5NlbokX/zSqXnB7+r
         NTk4xoTIRJmdEYgV5XTVp3WbKa8QFND0VjYsfazhzfL9lIlQKqNHJYrNBIvwG1lwEaBo
         U+Ok61fL2GtL8yDcgFKd5TgqnT7w/4A4Fxq0CZ9SiNKAiH0owEiGaxOBRpIJfpm0capw
         Q57SZ4+/8uPzzEqCtGgs63hTCqUtPFogvCulI6jofLJAraG2Zyu8sPd3r85eKSZc1cYA
         LlTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=syK6eF0z1YIhw5KnDfEJ/sqHR3QdYzGhfq3h/5i5Sas=;
        b=lgt07DskYETnyuCo7+9kb+pyj915IKGHUgI2ajgHaJW+0y6IhskFxXloF1llaaRRDf
         pbAa0pcpsmOZ+uiW7Dh5z8+pGUPRdbFvmMRex0dnQ0a4s/DhOLMGKE5jb0bbavznOmLX
         X3yCHaIZrVn6WbJNJ9K891oCmPm3/sAU/bAhaX/IP/4tQ++RJEbvvpi/r0O7QotqzBno
         neFSsh36JrLqD5VlsIBmCAaOdFt+40K9B+H9APIec6xureYhrDxxeT/W9ePpNBT4KFRt
         C4B0lysk8B15+v8lj5izmiyQSByGPSjRDSnQy+x2UmLNIz+anq29p3E+lB3Q8I4OgG4r
         F2vw==
X-Gm-Message-State: ANoB5pnjpCiO57grqEGkJaoWexofstw/dpauXROT/sF9lI4zM51dAwzc
	WeSKWpEWdBX3clG8+OLj4+9Mnyzdtzo=
X-Google-Smtp-Source: AA0mqf6GlYmz6ao1Ocazy6XnieuesyYU9e/N0B6T5bGw3DwYIfX3lPKm+B7r5ybTp9p3YaVUKLjnuY7j4Vk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:e8b:b0:3c9:bdbf:444d with SMTP id
 cq11-20020a05690c0e8b00b003c9bdbf444dmr15670072ywb.56.1669849829390; Wed, 30
 Nov 2022 15:10:29 -0800 (PST)
Date: Wed, 30 Nov 2022 23:09:14 +0000
In-Reply-To: <20221130230934.1014142-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221130230934.1014142-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
Message-ID: <20221130230934.1014142-31-seanjc@google.com>
Subject: [PATCH v2 30/50] KVM: VMX: Make VMCS configuration/capabilities
 structs read-only after init
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yuan Yao <yuan.yao@intel.com>, 
	Cornelia Huck <cohuck@redhat.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	"=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>, Fabiano Rosas <farosas@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Kai Huang <kai.huang@intel.com>, Chao Gao <chao.gao@intel.com>, 
	Thomas Gleixner <tglx@linutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_231034_901553_4C2BB90C 
X-CRM114-Status: GOOD (  10.00  )
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
index cd2ac9536c99..45162c1bcd8f 100644
--- a/arch/x86/kvm/vmx/capabilities.h
+++ b/arch/x86/kvm/vmx/capabilities.h
@@ -66,13 +66,13 @@ struct vmcs_config {
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
index 76185a7a7ded..654d81f781da 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -488,8 +488,8 @@ static DEFINE_PER_CPU(struct list_head, loaded_vmcss_on_cpu);
 static DECLARE_BITMAP(vmx_vpid_bitmap, VMX_NR_VPIDS);
 static DEFINE_SPINLOCK(vmx_vpid_lock);
 
-struct vmcs_config vmcs_config;
-struct vmx_capability vmx_capability;
+struct vmcs_config vmcs_config __ro_after_init;
+struct vmx_capability vmx_capability __ro_after_init;
 
 #define VMX_SEGMENT_FIELD(seg)					\
 	[VCPU_SREG_##seg] = {                                   \
-- 
2.38.1.584.g0f3c55d4c2-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
