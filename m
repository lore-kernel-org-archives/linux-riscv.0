Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38D0C2BBCA
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 09:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5F8yo5RWJIc3EcbokBdeExzzrVTbmfOyJHk30QwXkqU=; b=x+9Yd+B6ILTmtd
	6J1OwbLyPfPp6zTMnMaNu3Tdvv5sIVxrF+9SA6QK4NJmE6lzinLrQCMXtNqWGwoaNjjkorC7b/52Q
	pazP85tLIdnl2DRFz5fRknbPNlyOtI0MOddNgMLjDgsXDoqiCb06GBcM+Pp1BTc3goOsk9RVoNaDh
	Q5c6wBAa4/qaoHLjNXDKRP+SSKIs9lp9TF8Rbarus5wV6iPEP4vauomMatuOUydj64GFGL0b69g0b
	bTIJBenudTm4F1ROGiHicdQRm06EWfPGWn32GGSapM3thxVNTeQWYBSEMZpi6+wArMTuzm2anG2Mw
	soXTZIYPPurL2F2r/6jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN83z-0000000DHpA-3Swn;
	Fri, 28 Jun 2024 09:38:39 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sN83Y-0000000DHXQ-0uZ8
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 09:38:14 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1fa9ecfb321so2236295ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 28 Jun 2024 02:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719567491; x=1720172291; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qOZOdNqYBv8WGomeUEUfCET+0Nz9/2nmPAIIjSAFF/o=;
        b=AYGz36Otew5Vo3GR6CX/ND2drI1SYFSK/XNK/8eU5alJ7R4auUgwQ1Z3Ptu230fupv
         VLAJ7GB9jwAzfSFxpvgZ+D3fSTqTNpnnYJL2eX1zYf8SWEEdlyDXnMFHdEl6k6ob4Ngm
         X17pJPkVP0hfiavrERSGro6Yjodxf+BM6LpDkgUl/nT2+xLdHDhAV7omy5IHt5MGltL+
         9KJhe3V37cLc2vq8lg4j1GDfeRpN9Y2mCeZx+/Df7ODI9D4XXl8liHSd8snLeuUylTvQ
         sLVSxmYTIcPdgtnyw7hFo6cvciDEl5Yk7G5woK9Fj69Q/FIlLzdfQfQ0fVavWi4QM4cj
         yblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719567491; x=1720172291;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qOZOdNqYBv8WGomeUEUfCET+0Nz9/2nmPAIIjSAFF/o=;
        b=TH0gdDshJc7gOgG0MxjjEdnNAi0DXwAN+2zRJqBHCAmgkoSEW7wOUPf3dQOzVkU2mV
         fLgyOe8g8pGk5IjdvHS37KKdSInsFDpNilIaHrsRpT0nFqqyMfKY4efUMy6FlRIjpBOX
         gn0YYC5r/vHmI8JKXJI/605BHRnZZuhJf+V0IR9JgRPVxKxT2S9nUPsGmw9jBu9780lD
         pK4Yd8mcDi2wX9HHXJf7g2/x7837OZEQINCdp4/xb6awQ8d5WMlsP/1F6mFwSNNN5nqv
         PhykNbN+D2rJxxs6YFwYv0jvLs5Gk0zwcmKzHLXYAWCU/qyqEhFZBvuVALU2cmnA13gY
         7iDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBVSSgWE4HFGUrpRYsTv9uFnlNQorYHokbLLAvwt3fRpHaCVa3+0C7TQudoOi1q0VcDyV3+zR7Hu9+z0p6jDgUMBJ5rTy37EAfZZXH3CQj
X-Gm-Message-State: AOJu0YxnZBbfyaC2T7qvbRahRxRyrjVxFc5t1spYGLVJUdaSpwfWOnoz
	67+z1z/uaSv2sOQpzCZHjBPzcT+cVz6fI++90hGgdWUagh36MuekG7I5dcKZd+tLAol7TZQiIxZ
	K
X-Google-Smtp-Source: AGHT+IHJemzKEqsK4QPwmDux/9zJJPho19aSvba61TOUwNSisECiHK7vsJX8ZHqMBWD3kWK4cZyMOw==
X-Received: by 2002:a17:903:18d:b0:1fa:2001:d8ff with SMTP id d9443c01a7336-1fa2001dad7mr178136225ad.52.1719567491232;
        Fri, 28 Jun 2024 02:38:11 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10c6c8dsm11087155ad.26.2024.06.28.02.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 02:38:10 -0700 (PDT)
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
Subject: [PATCH v6 3/4] RISC-V: KVM: Add Svade and Svadu Extensions Support for Guest/VM
Date: Fri, 28 Jun 2024 17:37:07 +0800
Message-Id: <20240628093711.11716-4-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240628093711.11716-1-yongxuan.wang@sifive.com>
References: <20240628093711.11716-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240628_023812_325648_9D358069 
X-CRM114-Status: GOOD (  12.48  )
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
