Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2450C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Mar 2022 20:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ze3Gf2PbALfA6HGsyRQyIjxpUAYQrmzMV36jllx+n44=; b=mRBSDRqB/ywjjG
	0Y17sCCllkKQ3m6CVoBcri8Gax22vhofX5iOzvmzMf1T9wSaU2LSNSFpC0MiDwn7zG9quxgcx9jwC
	RgAOw7PESxasWcwwUnWSsK7C8iJUUzYzKw4aDhTOJhHivHEmwOkDLANQesGYUzBwABQMg0WQIa2Lm
	xqUbimtk3nofbyNOdj8baRTRL2JGFCphAyblw7KE+bNuCBwjaRZWlx8QlKIwyaCYR/Wn/fuZhrOGb
	7/wEZ+ThVdoaql2VjaoA05g7EjEwqkHkD/yhNy952p9cmyUFd2IsvUQ4c1OmYSek7ridhqB8FehF1
	qi1uP36KUTIGLlQ4I8YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQEGT-00BtNk-Iv; Fri, 04 Mar 2022 20:11:01 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQEGG-00BtBw-NG
 for linux-riscv@lists.infradead.org; Fri, 04 Mar 2022 20:10:51 +0000
Received: by mail-qk1-x72d.google.com with SMTP id j78so7349263qke.2
 for <linux-riscv@lists.infradead.org>; Fri, 04 Mar 2022 12:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VGU3lDVBq59QqjYsyRxQH4/VHY2UtoMa8BpyGMZ/FLo=;
 b=ogou+8r1Nf1Cv1Sqo2avgI+ufHZcUQqdvKyABGfz/Jgc+M/SCWUFQ0E9dIfKtMXMSR
 2NCi9Iv5Kpn5fzA3h8CIk/bNHWE8Pd3sJFOVKnlj7MJz78TxbTRnE5g4Mcc+97U5oUKg
 YsSPgos3H5hG5PVLOeekfix7+oR8CaU/8TXW+4p6m9nrW0hwiLMccODAxdIO5ktxqlRZ
 bq+2ViShK8qFFgqxSRwbWKq9b342rrny35pRQuSHIYK6CthnEhj/yd246vKtmYptSbkn
 jGrrst+bhQetTjyhauFJIwklZA6Do1cl2pH1QzrR0SQexPffkJrEqVl0xMQN+lqPhZUb
 C3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VGU3lDVBq59QqjYsyRxQH4/VHY2UtoMa8BpyGMZ/FLo=;
 b=I7RZS5ePq4O4vlWXE2ssQ+v72MOlbUhSxjtcnCrB2cDDu9GZ9CnQ6HxUNsf/VqAoW7
 Z3HytUEV8PvBrfGwmKPrEkV8QkQ9OjuH3xuDHsnWuKiK4p0I4OinVX5k3frI13KDxztG
 DgdhuXMMhXP63RUWDKQO4+F6HJGfzmmhTtKYGY7Z7XZxFiKDbm86Z+4yD2pDUMtP/hMo
 E5KWW1UIgp76wHcVlCrRZa5nNLmobUQM5NxUoFSG0idKY4bsmoZGhT2QMEtZ1ApQS43S
 FuAjSk7kVvnrG3eW/vuHtXfu7yvB3XeplkcX3aNhg4Dq2NySG9DiVeUKbrXa/zzRP726
 MMxA==
X-Gm-Message-State: AOAM533U7vzHoeNJETKS+l/d86AaTOlcKwCum4qe5aS9BRWj/0YtLHnY
 VP554Yw5rjjCjJYtiyTmkE/TxA==
X-Google-Smtp-Source: ABdhPJziAT+GkcoKPwD8VK1mQG+Q81feZ7J2fFcV4cs55xPUicqo70tLtaLMRp0qMRbF9AiUkgGugw==
X-Received: by 2002:a37:c06:0:b0:49b:7a31:cd54 with SMTP id
 6-20020a370c06000000b0049b7a31cd54mr230310qkm.358.1646424647390; 
 Fri, 04 Mar 2022 12:10:47 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 20-20020ac84e94000000b002de8f564305sm4605481qtp.1.2022.03.04.12.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 12:10:46 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH v2 5/7] RISC-V: KVM: Restrict the extensions that can be
 disabled
Date: Fri,  4 Mar 2022 12:10:18 -0800
Message-Id: <20220304201020.810380-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304201020.810380-1-atishp@rivosinc.com>
References: <20220304201020.810380-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_121048_832524_12155A2B 
X-CRM114-Status: GOOD (  12.66  )
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

Currently, the config reg register allows to disable all allowed
single letter ISA extensions. It shouldn't be the case as vmm
shouldn't be able disable base extensions (imac).
These extensions should always be enabled as long as they are enabled
in the host ISA.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 3ae545e7b398..388e83857ced 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -38,12 +38,16 @@ const struct kvm_stats_header kvm_vcpu_stats_header = {
 		       sizeof(kvm_vcpu_stats_desc),
 };
 
-#define KVM_RISCV_ISA_ALLOWED	(riscv_isa_extension_mask(a) | \
-				 riscv_isa_extension_mask(c) | \
-				 riscv_isa_extension_mask(d) | \
-				 riscv_isa_extension_mask(f) | \
-				 riscv_isa_extension_mask(i) | \
-				 riscv_isa_extension_mask(m))
+#define KVM_RISCV_ISA_DISABLE_ALLOWED	(riscv_isa_extension_mask(d) | \
+					riscv_isa_extension_mask(f))
+
+#define KVM_RISCV_ISA_DISABLE_NOT_ALLOWED	(riscv_isa_extension_mask(a) | \
+						riscv_isa_extension_mask(c) | \
+						riscv_isa_extension_mask(i) | \
+						riscv_isa_extension_mask(m))
+
+#define KVM_RISCV_ISA_ALLOWED (KVM_RISCV_ISA_DISABLE_ALLOWED | \
+			       KVM_RISCV_ISA_DISABLE_NOT_ALLOWED)
 
 static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 {
@@ -217,9 +221,10 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
 	switch (reg_num) {
 	case KVM_REG_RISCV_CONFIG_REG(isa):
 		if (!vcpu->arch.ran_atleast_once) {
-			vcpu->arch.isa = reg_val;
+			/* Ignore the disable request for these extensions */
+			vcpu->arch.isa = reg_val | KVM_RISCV_ISA_DISABLE_NOT_ALLOWED;
 			vcpu->arch.isa &= riscv_isa_extension_base(NULL);
-			vcpu->arch.isa &= KVM_RISCV_ISA_ALLOWED;
+			vcpu->arch.isa &= KVM_RISCV_ISA_DISABLE_ALLOWED;
 			kvm_riscv_vcpu_fp_reset(vcpu);
 		} else {
 			return -EOPNOTSUPP;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
