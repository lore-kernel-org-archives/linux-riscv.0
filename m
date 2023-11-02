Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7037CC4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 12:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ltnph7rXAdhnVHj0nphE/NS6QaKXLbp6gxwzB6KUJ0U=; b=I75Ej4Hv4EOibR
	XOJNA8SQ7Dkk+bAIx8xXbaWoPDTMVnG39A9o8qNe8OrUYcTEKaxMoRe2sN508HwzSQjfnUG+qmHlQ
	Ed/s034QVvUV+46DGMs6PHQkAXuMcfUhcpP2PmPRkdMgVd1JClkhpul+uYZJnzvFavb4n2znQAVil
	2S3wvccHczZD3R/V3FyFIhWiGIBo883NDX029agN+/NJkRCfIKcey4CQJXswq5h9lt3can8FLUIun
	kZm8cZekyQ4HqShucRGN/9Pwg2grCAu81nnMFk9oKKNmE02N9grbcKnL09lhP70eOBC6teqNjmt4P
	ehLgraTq18s1YhJsLakQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyWOi-009PMY-2O;
	Thu, 02 Nov 2023 12:02:04 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyWOf-009PIP-14
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 12:02:02 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1cc5b705769so7342455ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Nov 2023 05:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1698926518; x=1699531318; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KoS5Yzc43oJ/fOlEyyLAOhYHKPtTN8IraB0rRBs3MmU=;
        b=L2VAfvSLLtMnRCNRTBrXG4WSoXc/61vvWxKLZPvFl67i0a3PgF9U9Y+MofwM7er6WN
         dPaXQfWppLg8aiUcY6vXnxfiEAl9EjwIRpoRCW+sUon0oF7OdgE4jRdysZMuiWjWvy7r
         xoV4lCW3X5O1EMCeVbUKcBPD6X5dpkoJZ9fLYW6mtl53LXoB8wBtRDj7jCKh8g1Pl2Fj
         GA0CgR4/g5RFm8QJABihmjAZhBxnDVSmO1BFI+X6wox50T5G4go4mshd9xfqArNSx4YS
         OBsmBCFHJrbFBzZbFz/9vYTItrAZGn6N2IGiPurNqd2F/mKpYuWqVCQIDX5i0aBqBGDs
         k8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698926518; x=1699531318;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KoS5Yzc43oJ/fOlEyyLAOhYHKPtTN8IraB0rRBs3MmU=;
        b=u5Gg4ToHRXZcru44TRuLEHVN7Y6z3DEoRVzsFuaoy5pfeYdqXiyubh8zJLV+pv5b2s
         tBxuS68XFoihPrYDY1NGoyVVpqd7+ZeNrZLRbgppTu6qiT59CO/qOT/NTX/JqnhrA5Xn
         a6501GMAwZROS5gObDTvU1LNKC+296AYrqnSF6ogt9XZgMMwOBo1kcei5W5kXZNPDqx3
         JbgoqpfC7eqz7KFjZFoskUHg2T9IC9GE5UjY29thenDrF02c7VH2KlRklMVDyFzbCl+W
         3VMLPG1wV2A0FLZ2x0eVdyLbTOtMUFu6uofgWQzbtHnTmquRM8NmN9WixuPEWjfoUBJZ
         v26w==
X-Gm-Message-State: AOJu0YzWcjalA031TTAbl6Lr1xyAqRey1UfW3ReQffaVHcesA0913ljQ
	I8vis9w6XH6nNEYMS5rQ4ae/4hp/a+wn6lBxG01p2Jj1FEsyFnqJFwbyfDMyGgSgxzdxuLkdv90
	m2FyAqIofknF4DO22Dqp4s3q+G1f2FH+Adfx8+ZC4KNlzuG+ljSV4u22ve5FbrxiRu/ISOZoLI2
	EM2dO9bNWwL7ngMedcnw==
X-Google-Smtp-Source: AGHT+IE6nEv56zM0QCxqMU8kUXvOQDH9qhvdkxo16VJLcIXw6R7KqMseiu/2jgHWmzTZVVw8yrOyzQ==
X-Received: by 2002:a17:902:e80f:b0:1cc:7af4:d12c with SMTP id u15-20020a170902e80f00b001cc7af4d12cmr4685399plg.62.1698926517886;
        Thu, 02 Nov 2023 05:01:57 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id l12-20020a170902f68c00b001cc0f6028b8sm2969008plg.106.2023.11.02.05.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 05:01:56 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	tjytimi@163.com,
	alex@ghiti.fr,
	conor.dooley@microchip.com,
	ajones@ventanamicro.com,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] RISC-V: KVM: Add Svadu Extension Support for Guest/VM
Date: Thu,  2 Nov 2023 12:01:24 +0000
Message-Id: <20231102120129.11261-4-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231102120129.11261-1-yongxuan.wang@sifive.com>
References: <20231102120129.11261-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231102_050201_372480_DA2A0A5C 
X-CRM114-Status: GOOD (  11.14  )
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

We extend the KVM ISA extension ONE_REG interface to allow VMM
tools  to detect and enable Svadu extension for Guest/VM.

Also set the ADUE bit in henvcfg CSR if Svadu extension is
available for Guest/VM.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu.c             | 3 +++
 arch/riscv/kvm/vcpu_onereg.c      | 1 +
 3 files changed, 5 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 992c5e407104..3c7a6c762d0f 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -131,6 +131,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZICSR,
 	KVM_RISCV_ISA_EXT_ZIFENCEI,
 	KVM_RISCV_ISA_EXT_ZIHPM,
+	KVM_RISCV_ISA_EXT_SVADU,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 82229db1ce73..c95a3447eb50 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -487,6 +487,9 @@ static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
 	if (riscv_isa_extension_available(isa, ZICBOZ))
 		henvcfg |= ENVCFG_CBZE;
 
+	if (riscv_isa_extension_available(isa, SVADU))
+		henvcfg |= ENVCFG_ADUE;
+
 	csr_write(CSR_HENVCFG, henvcfg);
 #ifdef CONFIG_32BIT
 	csr_write(CSR_HENVCFGH, henvcfg >> 32);
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index b7e0e03c69b1..2b7c7592e273 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -36,6 +36,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	/* Multi letter extensions (alphabetically sorted) */
 	KVM_ISA_EXT_ARR(SSAIA),
 	KVM_ISA_EXT_ARR(SSTC),
+	KVM_ISA_EXT_ARR(SVADU),
 	KVM_ISA_EXT_ARR(SVINVAL),
 	KVM_ISA_EXT_ARR(SVNAPOT),
 	KVM_ISA_EXT_ARR(SVPBMT),
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
