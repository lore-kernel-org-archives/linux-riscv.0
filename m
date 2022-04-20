Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496EBC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 01:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ZuPDU7vuI1ap8ZEoup4D7UEVHdljftb8FDcAMz5IpM=; b=4NcZvhNL8vMd64
	FFU/EX8oJpWOUpdcpwhoi8EimAUKSta4tWGeCuXLERxJbAoJRP35gh/qxQF+DYYBtuAzA90xoQ+uH
	D+5A7d+/PmNKkI8P8XhMlevKmm2Huoalm/QB182lrGeU98r6a3yPbxZ94agGcsbn6/bgjg/JzZDPz
	tQUqW5re6IUGS+Sjv7jmxnAcXBPy+4PkpStjShLAy7rcoeA1I6DdNWZP3jdeH0mNOZQMCUTOTIMww
	Ku5NOXqBzZUtY8uCgWMnZYUVzjIiEQCNmoT0XYND14PcGGmyASJkZXVu60B63z6qjdkdyMSkyBgPY
	jffr5+poYmCfmOR/NU+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngzDX-006rcM-GI; Wed, 20 Apr 2022 01:33:15 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngzDS-006rYd-Oo
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 01:33:13 +0000
Received: by mail-pg1-x52a.google.com with SMTP id x191so159385pgd.4
 for <linux-riscv@lists.infradead.org>; Tue, 19 Apr 2022 18:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bQGz28Ui4S/iukqjTafR3gtWfXZeyNKknhgIBizer1w=;
 b=Ml9jMffdoy/2q7KFGepfvYHABxn+GEgv6sFYcp7cRyRu9aeoki9WAtEKAWMRAnc04b
 yEJH2yveccXmJIT0A2KILfR4/dg8uWdcp7hvfDh/vJlBov71W0uNrMeCwwIVI9EjpxK1
 fvrh9xZIKnqtiJrAaoHbfYx2E1eFlL3KCfwHzfYTZ9YR7LzBBs09DE1U5SWdV9IpfHqR
 PnJpmAllJD3NC0fYdqwcemLqg28r6Z4dErbLY2yrH5Ejcpj51TwdGju+84Up0oB0+2ak
 eF2hLnIWyphii/a1xhm8Nvs77zvRqi8ax9kGVCkMdeBRFw2H8/xHKsFa6g5UfjI0U/ST
 fR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bQGz28Ui4S/iukqjTafR3gtWfXZeyNKknhgIBizer1w=;
 b=dMGaUSY6JbSAH0DpzQVAshzFEdXgcnkIZGzVCM/u5rfLttJm1dvhTDD9gBw7c3+98U
 SkX7MflFUBUTb758iuZwfSLphStJy7ycnSb9esm5jPcQyPJmI/qTSyzyZv3ybz7+OOL2
 9X0Tp0nLVmscJp23jwe85nwOCxSYqcDiHINhQExseve/sJT0yekjSHperTwVGwpknc8f
 j96NNH52P4amsHA7PNIw/8gDaqjlXp3WQELuFwFDystBb6Em4wxeKS/nWuNnvkstudsJ
 q9oXDEuyHq8nqav0OcaYDmBhMFCBkRObpj0bAmnrub7kBjUf2Ojj40Z/aN7bJVFH3avh
 qE3g==
X-Gm-Message-State: AOAM531u5jaOZGFofewCOGe/BjPk1dZR9ioVP9xCDy83p2VzqVpWXcas
 6bOOAcRzAnszDa2F/NIM9k4Xlw==
X-Google-Smtp-Source: ABdhPJzxTpZ+2xwx1gMkeidRVI2UERYeMHLYI3TWIyQPEGUnycJdzAomsob4aGhDIn3i1GIkK78eYA==
X-Received: by 2002:a65:5286:0:b0:398:dad:c3d8 with SMTP id
 y6-20020a655286000000b003980dadc3d8mr17233342pgp.228.1650418388951; 
 Tue, 19 Apr 2022 18:33:08 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a635d0d000000b003aa482388dbsm2484863pgb.9.2022.04.19.18.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 18:33:08 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: kvm@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 kvm-riscv@lists.infradead.org
Subject: [PATCH 2/2] RISC-V: KVM: Restrict the extensions that can be disabled
Date: Tue, 19 Apr 2022 18:32:58 -0700
Message-Id: <20220420013258.3639264-3-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220420013258.3639264-1-atishp@rivosinc.com>
References: <20220420013258.3639264-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_183310_846068_7F172372 
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
index 2e25a7b83a1b..14dd801651e5 100644
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
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
