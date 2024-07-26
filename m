Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914DEC3DA7F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jul 2024 08:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dx43pk/9TgzZNt2hZlNypg1+cF+JgIuYsvl+FnLA+XA=; b=45qmY0D1xelB2I
	mgzoXMCI78zIGd/fEFrf5L48bHuTpTna1HeYhgbfvPQPP5PQS8Z/SDnp1UlZ1U9WJo9yc11wqtoWe
	DeUN8rM7Fbj555o1oLO8ZWI8uOmpUm5qFRaGa7js+gi6Q58mxXx/XnGWDJ4bbdCBH9FnbRb2RZ8dF
	x1ytGXpbrlnMi9RRWEbrv9f6qIwYGiRmevuS2paLwpZyui2gz1cPvfTr6/yLXsvLJ8/nA2iZeEijw
	l9Yc2E2VSlnp1/CuN7JGc9nwP5U7nVx0OgzOkZA8BfbQEmhJGCZcKMcLwYHIxNVKBffmv+lat+iOA
	9giOkHyszjZZ4mQ/snMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXGeG-00000003N7K-1drF;
	Fri, 26 Jul 2024 08:50:00 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sXGeB-00000003N2E-2ADn
	for linux-riscv@lists.infradead.org;
	Fri, 26 Jul 2024 08:49:57 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7a103ac7be3so529586a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Jul 2024 01:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1721983794; x=1722588594; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=34BL/sh0DZ6mInNrtxWV/KGc2m1HMCFv7aaLw74E+qY=;
        b=E8gXEAc39B6+tc7pwbU+Nl2RO8nW+ORqVTgzz2BpUV02TtWphdpha+eOJOA+0/fZ6c
         kOZzd/kEoRViR1lOIllODhDfKADuvwFCid9NxszDNs7JkNSCJmUP84jOP3YzQn8EgNiI
         TEqXjwlyKf3CdVdhyzg7IbwnzJBJw96zZDhEQqNuvEqhOhy9Evt1x9/hOB8d0uZlfDl9
         tzVt02I86KK58AfnDhTXHzUTdwhCzvJ1yhWA8OYMMBmXCUdgYB8Wvd3kwe0fvjAn7Yx3
         2S+uCUqacrWEOUCIXvQ8R1voMJBhMr5dDR0Sv+jwZf6b1KR8HT+P3aHFSfHF2NROUitu
         +v8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721983794; x=1722588594;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=34BL/sh0DZ6mInNrtxWV/KGc2m1HMCFv7aaLw74E+qY=;
        b=NlGkiawPb7cGMzTFraMgRLFyBdrgZ5LazhJk3hJcwlqncq73AHrn1+Bj9Qij2fJcpt
         53UCnque2aD4tmQXQ6jXFYkGk9g+x0PtBh/DfnEpoCfR9znGda4i6zmHVFJMrgXydZsS
         GZ+7ipNymD5021s5xhmMqJ0Fcoa1Y2+vReZ6v3it5jl6fdg9vLISaI1aeCYxZus7e8dD
         ikkdrKz0AjqEzB0BiSlTHAl1D7RI699D69qCqDUUKAfQNWMJdd8FmwN77oOumfp9xkAB
         Bc2qbg/m2xEgbrYLkrAbFLllFle5RyEH67TuGGj/7t2a1sePk60fZWq1AGhp5aE9nwqY
         Ek5g==
X-Forwarded-Encrypted: i=1; AJvYcCVwCOZegzAxTmZjXJCX/ASCXIfiYS41YjAEP1IafgRPREFcqgbyPraLTC7KjvwsUnPxyY4RJ5o8u49BSKEkqf737KOTPb8YcZyRIGU4lDym
X-Gm-Message-State: AOJu0YxIFxFNMj50AvT1/vBmoRmewzRmQoRBeF5KMYwkwbYeolnaGc77
	CuhDVGkaZO0/BPaaW1aRuhlFFYT/G2MYueB4tMQ3u5oRftF/NFP6fLwuYATZDkQ=
X-Google-Smtp-Source: AGHT+IEsc2Lj8N3rTxeNWx9ih1V5tMTbZiHBB2CSobNOVFD8y6Tw1gE2nmjH3/iQ9cJEnLEnKggdVw==
X-Received: by 2002:a05:6a20:a115:b0:1c2:8904:14c2 with SMTP id adf61e73a8af0-1c47b2d151amr5398963637.37.1721983794278;
        Fri, 26 Jul 2024 01:49:54 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9f816db18sm2049645a12.33.2024.07.26.01.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 01:49:54 -0700 (PDT)
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
Subject: [PATCH v8 3/5] RISC-V: KVM: Add Svade and Svadu Extensions Support for Guest/VM
Date: Fri, 26 Jul 2024 16:49:28 +0800
Message-Id: <20240726084931.28924-4-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240726084931.28924-1-yongxuan.wang@sifive.com>
References: <20240726084931.28924-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240726_014955_641800_37DDEEA5 
X-CRM114-Status: GOOD (  12.83  )
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
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
 arch/riscv/include/uapi/asm/kvm.h |  2 ++
 arch/riscv/kvm/vcpu.c             |  4 ++++
 arch/riscv/kvm/vcpu_onereg.c      | 15 +++++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index e97db3296456..85bbc472989d 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -175,6 +175,8 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZCF,
 	KVM_RISCV_ISA_EXT_ZCMOP,
 	KVM_RISCV_ISA_EXT_ZAWRS,
+	KVM_RISCV_ISA_EXT_SVADE,
+	KVM_RISCV_ISA_EXT_SVADU,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 8d7d381737ee..c78061a6d68b 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -544,6 +544,10 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
 	if (riscv_isa_extension_available(isa, ZICBOZ))
 		cfg->henvcfg |= ENVCFG_CBZE;
 
+	if (riscv_isa_extension_available(isa, SVADU) &&
+	    !riscv_isa_extension_available(isa, SVADE))
+		cfg->henvcfg |= ENVCFG_ADUE;
+
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
 		cfg->hstateen0 |= SMSTATEEN0_HSENVCFG;
 		if (riscv_isa_extension_available(isa, SSAIA))
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index b319c4c13c54..b3f58908902a 100644
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
@@ -110,6 +113,12 @@ static bool kvm_riscv_vcpu_isa_enable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_SSCOFPMF:
 		/* Sscofpmf depends on interrupt filtering defined in ssaia */
 		return __riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SSAIA);
+	case KVM_RISCV_ISA_EXT_SVADU:
+		/*
+		 * The henvcfg.ADUE is read-only zero if menvcfg.ADUE is zero.
+		 * Guest OS can use Svadu only when host OS enable Svadu.
+		 */
+		return arch_has_hw_pte_young();
 	case KVM_RISCV_ISA_EXT_V:
 		return riscv_v_vstate_ctrl_user_allowed();
 	default:
@@ -181,6 +190,12 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
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
