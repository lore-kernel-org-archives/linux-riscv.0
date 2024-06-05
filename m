Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040ACC27C5E
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jun 2024 12:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dSDsT6Og68l+KX3be7z7VSvwqeIloHF7arOvS+2YUj0=; b=V26bhnkmuadSSW
	XKhWsg6kNj/YgfJ4U8BW9YFqJUVB4QTdDmv/5gYA6GLx77SuUTrHYkBX+MUvAycHyz1Q6/gyolMJi
	l68gFhL5kFRFtsYJK4uaZBjuKqet/oaBEHQA2NvcW42zj5i/zpnPIr0IzmIBNXVMlmfBchMuymE8r
	ArcHVHLtJo0k1M/jpFVf6fTLK0f7JUuTzbL7rP/K2euNLRUHCqjptUjHVWI5+bVSR9vtePWHS0o40
	Il0zL6I/AsiMzfvbZna4Up7YdpJb6hyB42D0K4RgxLHQeAcz6mSh5BKBTnXrR0QhJQKPjM/PU+V4s
	cVqOWxSr3pRHcnA4tC0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEpYb-00000005vWy-2A4N;
	Wed, 05 Jun 2024 12:15:57 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEpYW-00000005vRx-3CJx
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jun 2024 12:15:54 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-702442afa7dso4559780b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jun 2024 05:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1717589750; x=1718194550; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C9yGW+vb+251DuCHvQ6eWHokjrDaPZ1CHdh15Wr7+D4=;
        b=ANpy/DNcwHuh9fmJlrodz5DKCQraq/PQhWG6FFQUe76ePToxZDNSc1+bStStSj6FWk
         TSvTknFGjVTd9ZNxcYk5Tn9II146qiMBK457IjtpLbWvvAf1oAfAZ3T11pKZHLKu6WDH
         JTTEJqi6iuUBwdyiqkXjP0VvuVmvQDfzfYOm3/D1s3w5OAJVyKj47qUoMxC4kjAn0tXn
         xKp1MpvtI7nFMs7Olmh2zvWiQyvrmpWcwPR6bA9UI9IGkeQK81HRbujYHmxq42BnMZjA
         XMw/SgxNyP+LKCLXDq2eRzDaWOpmdZ8KknjGL8ITOhOZiRLgfvFnmWl8A4zFejOFio7W
         2D4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717589750; x=1718194550;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C9yGW+vb+251DuCHvQ6eWHokjrDaPZ1CHdh15Wr7+D4=;
        b=QUzaiCtkK2KsznyQYcjjhLPMAo594G3H3MJZVCnWKWyDs4SJL3V5qZREMoui6FQtSE
         HAjrFKul+wBqSpPWGGSCbwwJGPOGq7lnIcoxpB9OdQnziFcjn9J4ku79QDWKktKNuo5I
         0XCBcDOH2KEHWA8xaEu5pSerQ4EyOSAHMCg2bHj+h7HnWeqxRuRzMx3S/2Gcp6IOPCS+
         awbdfE0Gsp5ChKx1HOnL8jmTvXjWtqxPmLg+VYOdsv97itPEu/iZqyMTC3Env6isgKrf
         XNaqMLmepPscM4l4AEO8hfJcXzpakXAdQxKeZ40oJpaFegnSqJWW4kGAHIbyEPAVNiSw
         krlA==
X-Forwarded-Encrypted: i=1; AJvYcCUGtatuxPDwjoZQWH27wW9RQSCWTHhx0Md38ru9ujik5/IlzMJ2vUM+XLVuxYi92rM0MXE5FHWDCqQKT582utmvvjlBK2KcfxTpAUyszR2A
X-Gm-Message-State: AOJu0Yx25xEBK3zwS+pWjAmoQKheW9hwI/xAlwCbEYM2vCzI1tYjzbyj
	HtDYIDae4jKdA4IjLc61uLZHF/FRz5ws+sjv7iT5394dBkUDBRHSph8nq3mQQQ4=
X-Google-Smtp-Source: AGHT+IHuMhXVgloS9T7u/eogW1nwS9cEhCJiBxA9pyATWrWX01kMIqq28iggOkL5AgJrH0kuilEjvg==
X-Received: by 2002:a05:6a00:18a0:b0:6e6:98bf:7b62 with SMTP id d2e1a72fcca58-703e594abe7mr2644243b3a.8.1717589749923;
        Wed, 05 Jun 2024 05:15:49 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-703ee672fb3sm885379b3a.216.2024.06.05.05.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 05:15:49 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: apatel@ventanamicro.com,
	alex@ghiti.fr,
	ajones@ventanamicro.com,
	greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v5 3/4] RISC-V: KVM: Add Svade and Svadu Extensions Support for Guest/VM
Date: Wed,  5 Jun 2024 20:15:09 +0800
Message-Id: <20240605121512.32083-4-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240605121512.32083-1-yongxuan.wang@sifive.com>
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_051552_809884_0624D069 
X-CRM114-Status: GOOD (  10.99  )
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
extension is available for Guest/VM only when arch_has_hw_pte_young()
is true.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 2 ++
 arch/riscv/kvm/vcpu.c             | 6 ++++++
 arch/riscv/kvm/vcpu_onereg.c      | 6 ++++++
 3 files changed, 14 insertions(+)

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
index 17e21df36cc1..21edd60c4756 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -540,6 +540,12 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
 	if (riscv_isa_extension_available(isa, ZICBOZ))
 		cfg->henvcfg |= ENVCFG_CBZE;
 
+	if (riscv_isa_extension_available(isa, SVADU))
+		cfg->henvcfg |= ENVCFG_ADUE;
+
+	if (riscv_isa_extension_available(isa, SVADE))
+		cfg->henvcfg &= ~ENVCFG_ADUE;
+
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
 		cfg->hstateen0 |= SMSTATEEN0_HSENVCFG;
 		if (riscv_isa_extension_available(isa, SSAIA))
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index c676275ea0a0..06e930f1e206 100644
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
@@ -105,6 +108,9 @@ static bool kvm_riscv_vcpu_isa_enable_allowed(unsigned long ext)
 		return __riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SSAIA);
 	case KVM_RISCV_ISA_EXT_V:
 		return riscv_v_vstate_ctrl_user_allowed();
+	case KVM_RISCV_ISA_EXT_SVADU:
+		/* The henvcfg.ADUE is read-only zero if menvcfg.ADUE is zero. */
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
