Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32945C001DF
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 16:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JHU3zUrybZhx3eZQ52iJ7w2SC2Gvi+ogonhF2uNsOKo=; b=TYytD1WqWLh47+
	MtY/dAlWG9p6wbl06sKgqrjk0atYUpCN0mDaI4towpCPiCw6iU47Xq13ZIUfH9A4rFTii4N6cP4vP
	/0uToTX8PzQ1WM8xPYnnwXbJR0zjLaqO6+spdcU3Cze5lQrBlSKtCSSjdQFuYW+xpzDYARGFXtb2F
	feHlIFbewH3Wa+tppLQbsUswfUUmtI179j0bds86mxbiJb1qAgIxQssJuyZbjSsonj1yjePWTX2Rj
	qX5F1LLqO9Egbg28X3BN8FSDDoNsb7bwFGNYtZXW4bFCbTCCFD/EE5gFtD1vG0S0S5lWU6qTUkMmG
	KYzzVH+oAACuz5bceNQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRbGZ-00AKnq-2X;
	Thu, 03 Aug 2023 16:33:35 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRbGV-00AKg4-2b
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 16:33:33 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-1bf0c4489feso835056fac.0
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 09:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691080410; x=1691685210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uu7FCUVMhVtaI44cD7BULzw6bJMgB622Gr+5DTVj+Bo=;
        b=e12fuyl/YeJW953kPJERxGswpaMryJfjjQq5sl9Yem3wu5CKheDWM4PHRd9wrva1/v
         4sYjysYxyTzeleQoRLmGAoIrz6i53KB+5pN6QEBvd8YGCnmqAOwXRvk5TL1Fzvrad8NZ
         ztbHG14xtJX9GlwW/5i12PKzkbjbEq6nfInqEgx6E5fd48liIlI8S4OdfhvWCBR67rYq
         MWhWNtPXtZXtA/bHvzvlxSHgdSLNJZvV2LUCzFG+I+clFEb0kwbpKgzJN/DPJDsR77G9
         b5Yhc+yuvmgyx8fhHM1LNsOkHTADyBKnOe0cxx1yCnmadGe/wMkfpiLrk4uVmD2WGAQh
         vwCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691080410; x=1691685210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uu7FCUVMhVtaI44cD7BULzw6bJMgB622Gr+5DTVj+Bo=;
        b=LsViza2UEtdb5ySBmU/ibWpD5QPq2FDGle4H+E+gg5PLT1O0dO1e1Upc8wZq2O5vt8
         uiUVuQ9j9ka26qTk0i+EOr5cUfahcj9IWPgaT/2+ZOH/RBRfudBcSolTIWGTJS9Dyqmc
         ottey1Z5Lnu4b1n960YQuI+9wa3+E7FGI2BGxd5v+dFb6cNJ/zxi2GHZtYuyLmDLsU89
         RKjoBJCyVY9IxIa99hcfl6BDdKSEvSObdYk9b0W347yTh8ruJ+zg/N/TBJYgeHH48hqt
         NNOV94HGPHC+pozFwxy0bpfl2pkVB6/O0iBU/CY74rE2VYEyIykFeib0vaqPJOAvxpFx
         K3Bg==
X-Gm-Message-State: ABy/qLbD0z6WvNzcUAmbKfaDUwHBd9hS842I+t8SHQaLVD/vycBInPwt
	OUiY/EvjBHYos87SutOScoYIbQ==
X-Google-Smtp-Source: APBJJlGwoCOFRPCchOHL4r61LhHvmGfZ6gIxkUR9qlClLMHYy95T1Eeoqxo6LJktGRsLHTWo1iCCLg==
X-Received: by 2002:a05:6871:283:b0:1bb:5af8:701f with SMTP id i3-20020a056871028300b001bb5af8701fmr17924948oae.23.1691080409822;
        Thu, 03 Aug 2023 09:33:29 -0700 (PDT)
Received: from grind.. ([187.11.154.63])
        by smtp.gmail.com with ESMTPSA id y5-20020a056870428500b001bb71264dccsm152929oah.8.2023.08.03.09.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 09:33:29 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH v4 08/10] RISC-V: KVM: avoid EBUSY when writing the same isa_ext val
Date: Thu,  3 Aug 2023 13:33:00 -0300
Message-ID: <20230803163302.445167-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803163302.445167-1-dbarboza@ventanamicro.com>
References: <20230803163302.445167-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_093331_889367_D76246CD 
X-CRM114-Status: GOOD (  10.45  )
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

riscv_vcpu_set_isa_ext_single() will prevent any write of isa_ext regs
if the vcpu already started spinning.

But if there's no extension state (enabled/disabled) made by the
userspace, there's no need to -EBUSY out - we can treat the operation as
a no-op.

zicbom/zicboz_block_size, ISA config reg and mvendorid/march/mimpid
already works in a more permissive manner w.r.t userspace writes being a
no-op, so let's do the same with isa_ext writes.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_onereg.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 81cb6b2784db..989ea32dbcbe 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -482,6 +482,9 @@ static int riscv_vcpu_set_isa_ext_single(struct kvm_vcpu *vcpu,
 	if (!__riscv_isa_extension_available(NULL, host_isa_ext))
 		return -ENOENT;
 
+	if (reg_val == test_bit(host_isa_ext, vcpu->arch.isa))
+		return 0;
+
 	if (!vcpu->arch.ran_atleast_once) {
 		/*
 		 * All multi-letter extension and a few single letter
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
