Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C62FDC04AAA
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 15:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EGM7G35MMWay/OInYs5fXfqYmrzqp0KiUZ9MnuSVNfs=; b=z1XTbkIcYG8AVa
	pBOZjmv7yQdlji2BofDdwC7GfVhklKvKiO7XwMpQQO6QQctCjjteOHGGIVkbaR5kLRxWSGfmhh1Wd
	w3elvTRWUbzdLqvYSZJ3WeHajgJHgsNQfmpug/MLDfMDyqzoC/0ITu9QKs9wquar/dbnSgi6pGJus
	x2PuzIF0zB4UfT7voeEkhN+5XivlME2dCw4AYCr6HyrlgLW2D/hS23015etDdr3sGRKj90JFXksp7
	sTShh6UJdXrHk5ixw1FopCS5ZTTSeZ0SWDixCFIzCJW0qY5yVSbXCSELLRxPATIs52VOK+egQFOKI
	Bmc59d8AJd5kP8zYuRPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qizPV-003XtH-2X;
	Wed, 20 Sep 2023 15:46:41 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qizPS-003Xp0-1z
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 15:46:40 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1bf5c314a57so52228895ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 08:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695224796; x=1695829596; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2F/KgrFF+qMw0t/vo/nHoae6ojEjBo+38MWpMzETGM=;
        b=En8yRqsmMtfMe6aTEbFDbO6MXGOfc0Ex3oi0OeUQyRGdXUGqU5SK5VPSrX5VkrGYKx
         1NpGo6AjpPMgSWSFopGb0BzyfXZJHk4xneV6Hw8Ef1kYFluZ/FQY5Snk5nk0fzf3BcVP
         3KHTPP5K8QHOZIaIysrTbGPWcD1P0JGYmNfpU/vK6UpweSVGbw7QkXCT4fXZCUsGbo+7
         agSsbWB1ProJPWcGir8mkGOw0SZqHxG2qLRtarU8z/NpnD7OmnuzRQ/lyaMPcpXNCL9k
         jCRilqyFMwqFOZWEddHhNNle5zA+8FlwDqV6MVdWnUpzUTTyaZ9Zvc8jJ2RypvnMP4gK
         7bGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695224796; x=1695829596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2F/KgrFF+qMw0t/vo/nHoae6ojEjBo+38MWpMzETGM=;
        b=p89RyYdROtcAddJCllChl7U5hekSL7S5BUpvs6/nW6RcqhmfeR6r7U9vaQvCeyMXk6
         AiVQGX9SarO3+UECmFXFi9D1F7Ra6fVGe5ARgbnLTL0NEPPsdrLBrc8SGOHaxmOByzbt
         BrYjOtg9bPOnfiWuyGUZNv/z0uCNlntSr41hpL++eeNALH3IqsqcEjexr2AZPJT9j3VI
         Z3dFrh34DYp2wHrkGhmXvZjbaXUiH75MWOUSKpl7vdRx9LMGfG+ljJNdfptRfx/MMzzQ
         /pr8MtmNGX0rCChIhKQa9n0HM4o5Kiga5YV6xBiop7ExVpV66bG31WESE4Y65ZqhRad+
         pb0A==
X-Gm-Message-State: AOJu0YwiDTBiWh8Jgxy/k4cnS977pMxZBFTlXt30a1oMbF1exFXm3vTm
	mJx6vPPzdAVOfitvJtWao+4rUA==
X-Google-Smtp-Source: AGHT+IH9dE6XgdEjbTHz0tN9LTknxHD8yqClu0FhyBqM2fR5f+soDqQA7pdOMREOsEb4mM857vnN/Q==
X-Received: by 2002:a17:902:e5cd:b0:1b8:8b72:fa28 with SMTP id u13-20020a170902e5cd00b001b88b72fa28mr3370588plf.58.1695224796022;
        Wed, 20 Sep 2023 08:46:36 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.109])
        by smtp.gmail.com with ESMTPSA id m7-20020a170902db0700b001c0de73564dsm11995153plx.205.2023.09.20.08.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 08:46:35 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 3/4] KVM: riscv: selftests: Fix ISA_EXT register handling in get-reg-list
Date: Wed, 20 Sep 2023 21:16:07 +0530
Message-Id: <20230920154608.1447057-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230920154608.1447057-1-apatel@ventanamicro.com>
References: <20230920154608.1447057-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_084638_672386_F531FF08 
X-CRM114-Status: GOOD (  12.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Same set of ISA_EXT registers are not present on all host because
ISA_EXT registers are visible to the KVM user space based on the
ISA extensions available on the host. Also, disabling an ISA
extension using corresponding ISA_EXT register does not affect
the visibility of the ISA_EXT register itself.

Based on the above, we should filter-out all ISA_EXT registers.

Fixes: 477069398ed6 ("KVM: riscv: selftests: Add get-reg-list test")
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../selftests/kvm/riscv/get-reg-list.c        | 35 +++++++++++--------
 1 file changed, 21 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index d8ecacd03ecf..76c0ad11e423 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -14,17 +14,33 @@
 
 bool filter_reg(__u64 reg)
 {
+	switch (reg & ~REG_MASK) {
 	/*
-	 * Some ISA extensions are optional and not present on all host,
-	 * but they can't be disabled through ISA_EXT registers when present.
-	 * So, to make life easy, just filtering out these kind of registers.
+	 * Same set of ISA_EXT registers are not present on all host because
+	 * ISA_EXT registers are visible to the KVM user space based on the
+	 * ISA extensions available on the host. Also, disabling an ISA
+	 * extension using corresponding ISA_EXT register does not affect
+	 * the visibility of the ISA_EXT register itself.
+	 *
+	 * Based on above, we should filter-out all ISA_EXT registers.
 	 */
-	switch (reg & ~REG_MASK) {
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_A:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_C:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_D:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_F:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_H:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_I:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_M:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVPBMT:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSTC:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOM:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOZ:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBB:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SSAIA:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_V:
+	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVNAPOT:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBA:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBS:
 	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICNTR:
@@ -50,12 +66,7 @@ static inline bool vcpu_has_ext(struct kvm_vcpu *vcpu, int ext)
 	unsigned long value;
 
 	ret = __vcpu_get_reg(vcpu, RISCV_ISA_EXT_REG(ext), &value);
-	if (ret) {
-		printf("Failed to get ext %d", ext);
-		return false;
-	}
-
-	return !!value;
+	return (ret) ? false : !!value;
 }
 
 void finalize_vcpu(struct kvm_vcpu *vcpu, struct vcpu_reg_list *c)
@@ -506,10 +517,6 @@ static __u64 base_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(time),
 	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(compare),
 	KVM_REG_RISCV | KVM_REG_SIZE_U64 | KVM_REG_RISCV_TIMER | KVM_REG_RISCV_TIMER_REG(state),
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_A,
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_C,
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_I,
-	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_M,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_V01,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_TIME,
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_EXT | KVM_REG_RISCV_SBI_SINGLE | KVM_RISCV_SBI_EXT_IPI,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
