Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F2AEC2BD09
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jul 2024 08:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5F8yo5RWJIc3EcbokBdeExzzrVTbmfOyJHk30QwXkqU=; b=wyGgDmL4WwUj0h
	c4wxjNKCHeXiERisdKzqYUCBHO3zaAo0eBLhdPdrGfVPgbD4ay1ouGfy6MIZoRNeJMLGlCiObu5v+
	sr+NT6FWEcuJAawTPlrozSKz58KBrq3ICedBTtxNfdO/2NgTUPSxfJNl27KSgHnHIrWmdR6qE2HeA
	1y6thlueGM8O/b5lNv6N0JB7D3xSRrG4IIFeqxzfROaSvuTk92tL+GBI2dFn9T174h4U1taoQSQSb
	iw0XvE5+cKWu5B9BgEc2ay4iF2Wk6ypEx9psF2tF+e8e+nyFMLpUY9UU9q8AFjo5dOoE2c2PeHkwP
	bFwVqpgxN3l8NV7HKmSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSBoH-0000000Gvnm-0q6G;
	Fri, 12 Jul 2024 08:39:21 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSBoD-0000000GvkP-1S4q
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jul 2024 08:39:20 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-70af2b1a35aso1430823b3a.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jul 2024 01:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1720773556; x=1721378356; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qOZOdNqYBv8WGomeUEUfCET+0Nz9/2nmPAIIjSAFF/o=;
        b=UAQrLHQ6BhDVDO1GC49Y+uI/6mHvVTg3sKpYNtiWnuUTalj1ma4EvAzlvnm5GbLFgO
         BfKVnL/rhNadDCm77XAUEewDltgHFtpoU6kAgOWISWrEIrIgEUL29uBS/40YjVyjq8WS
         tVXdF6tpFz9S6dMaGtIUYvbiAvtJkX6YtP7mpBPvQganLYSFQSywLnPUKPMgN6WQiQqX
         8v6SFJ0pwl2Ii8cbi2bgxkg6trdp+tEbRVgv2vO8Q7J8trXOmacIFElIGx0Q6otL7J0J
         WYnb8h0kmiHfcltU0MqWy+LglVBje2jCzEq99VipvLUNE/YMeCpSUh6IP+XX3tvZV/xg
         M7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720773556; x=1721378356;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qOZOdNqYBv8WGomeUEUfCET+0Nz9/2nmPAIIjSAFF/o=;
        b=L+m9RBxbXHX1dWoxDeac6yT3y6dukIhYu4DB2ZORm+Z0NN+Cax9iCCa1wO+XTF2ytg
         SUMYwnKfDa8pB76vZZiM4r2l9KABFAOKOfGBIcmq7xfI5ktmNfoHM62+LKZUpvFKEnyA
         WHehA4siJL9D3UowDXpNtjhWBZMH5jA70E9sZ1YHrGLEtgSyT3jt6mvvyx8yNK1xukb/
         gibGDKjwhAPBnIGpy2Em67AOVPBVTWHtidhbDYBxSTo5FytwhgtEqx05SbUQul3P99i3
         /0okUWSIB0OtDOt9dnPj6M5dFYbfWqc+xqReVBi+CXGPBKO2Y5+mf/arGdT8quiAXCFI
         fPbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzgzAmvIgJaA+LUckl4rmG4g+26IcCmqviXOqenL7KVyZ0ujYV3XUOsOx1iMhIkt29LKizQ7Cp0Pb6BnDV75eg89k72i01CwAo4ja1pqK0
X-Gm-Message-State: AOJu0Yxgy5IyGj6Pb44Hd16y+RhJZ1764Z5EYwL8A1A0H16VgDIObii7
	8Bvbwp/EM7yDXaewMXVNA+wNLAi1R6DFVFYOLZI6zMJ5//TsZBSfUNsYgzjYPFM=
X-Google-Smtp-Source: AGHT+IFUgJGXqGz1rR6VQacB/sQPEJI/kBTqgZjcalyfvrrbdgNBckvS4WIfC6u8yM9C/ItjyrZEtw==
X-Received: by 2002:a05:6a00:3392:b0:706:348a:528a with SMTP id d2e1a72fcca58-70b4355854fmr11327085b3a.10.1720773556295;
        Fri, 12 Jul 2024 01:39:16 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b438c7099sm6894194b3a.84.2024.07.12.01.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 01:39:16 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v7 3/4] RISC-V: KVM: Add Svade and Svadu Extensions Support for Guest/VM
Date: Fri, 12 Jul 2024 16:38:47 +0800
Message-Id: <20240712083850.4242-4-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240712083850.4242-1-yongxuan.wang@sifive.com>
References: <20240712083850.4242-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240712_013917_597358_4015F015 
X-CRM114-Status: GOOD (  12.41  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

We extend the KVM ISA extension ONE_REG interface to allow VMM tools to
detect and enable Svade and Svadu extensions for Guest/VM. Since the
henvcfg.ADUE is read-only zero if the menvcfg.ADUE is zero, the Svadu
extension is available for Guest/VM and the Svade extension is allowed
to disabledonly when arch_has_hw_pte_young() is true.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h |  2 ++
 arch/riscv/kvm/vcpu.c             |  3 +++
 arch/riscv/kvm/vcpu_onereg.c      | 15 +++++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index e878e7cc3978..a5e0c35d7e9a 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -168,6 +168,8 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZTSO,
 	KVM_RISCV_ISA_EXT_ZACAS,
 	KVM_RISCV_ISA_EXT_SSCOFPMF,
+	KVM_RISCV_ISA_EXT_SVADE,
+	KVM_RISCV_ISA_EXT_SVADU,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 17e21df36cc1..64a15af459e0 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -540,6 +540,9 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
 	if (riscv_isa_extension_available(isa, ZICBOZ))
 		cfg->henvcfg |= ENVCFG_CBZE;
 
+	if (riscv_isa_extension_available(isa, SVADU))
+		cfg->henvcfg |= ENVCFG_ADUE;
+
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
 		cfg->hstateen0 |= SMSTATEEN0_HSENVCFG;
 		if (riscv_isa_extension_available(isa, SSAIA))
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 62874fbca29f..474fdeafe9fe 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -15,6 +15,7 @@
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
 #include <asm/kvm_vcpu_vector.h>
+#include <asm/pgtable.h>
 #include <asm/vector.h>
 
 #define KVM_RISCV_BASE_ISA_MASK		GENMASK(25, 0)
@@ -38,6 +39,8 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(SSAIA),
 	KVM_ISA_EXT_ARR(SSCOFPMF),
 	KVM_ISA_EXT_ARR(SSTC),
+	KVM_ISA_EXT_ARR(SVADE),
+	KVM_ISA_EXT_ARR(SVADU),
 	KVM_ISA_EXT_ARR(SVINVAL),
 	KVM_ISA_EXT_ARR(SVNAPOT),
 	KVM_ISA_EXT_ARR(SVPBMT),
@@ -105,6 +108,12 @@ static bool kvm_riscv_vcpu_isa_enable_allowed(unsigned long ext)
 		return __riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SSAIA);
 	case KVM_RISCV_ISA_EXT_V:
 		return riscv_v_vstate_ctrl_user_allowed();
+	case KVM_RISCV_ISA_EXT_SVADU:
+		/*
+		 * The henvcfg.ADUE is read-only zero if menvcfg.ADUE is zero.
+		 * Guest OS can use Svadu only when host os enable Svadu.
+		 */
+		return arch_has_hw_pte_young();
 	default:
 		break;
 	}
@@ -167,6 +176,12 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	/* Extensions which can be disabled using Smstateen */
 	case KVM_RISCV_ISA_EXT_SSAIA:
 		return riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN);
+	case KVM_RISCV_ISA_EXT_SVADE:
+		/*
+		 * The henvcfg.ADUE is read-only zero if menvcfg.ADUE is zero.
+		 * Svade is not allowed to disable when the platform use Svade.
+		 */
+		return arch_has_hw_pte_young();
 	default:
 		break;
 	}
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
