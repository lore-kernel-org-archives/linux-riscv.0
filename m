Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 550D9C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Oct 2022 09:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q6O9sDWjRXpxubOzTahKzDrLsN29y+3oSshiAPjtYu8=; b=yulPclKqEAh59k
	w5QdwLWV/ImXUxMqm8Y/03IP7z082G1au+k1IdsZDB491xQhvabPmzFFOjNtgErXYlsTkGWW98gdA
	N3wgG2jx9hqF6oG7lNwSKC0Q5/YpMh9xP2HpwAywES7KHPlbKjG3B7C2lMMusBtClTyhdJJ2PxCgA
	oQ2n4rFtSXARZ0+HWGSnsP1a9P8e6HuVaDXgav+2+dzKWYNLtQyzMCc/PErckIJVAP4tSb8xcEo8R
	EWFiiO6JEkmwNouxfbqc4+EJp1n97W1w8ESCvreIV980dJ7El6jTFuNypA35DUyWONFGXPQEC9tyZ
	UpMpV00cYFXQopw5H9Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohpH3-000E3g-La; Mon, 10 Oct 2022 09:40:37 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohpH1-000E2d-BF
	for linux-riscv@lists.infradead.org; Mon, 10 Oct 2022 09:40:36 +0000
Received: by mail-ej1-x62a.google.com with SMTP id k2so23689183ejr.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Oct 2022 02:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EztsOSQl+RP5h9qvRRtX/Sl3F/U13v06BprEdGYn6Uw=;
        b=n3cHjPncU7MGLxL+FC98NknGaviIvNl9RjSovDf7NmxyWSB/16PDa8Yl0yx4oNiqr0
         01d0pWV7dMx9a20UxPHGV3o4gQgJhBkjnYdhi4N79JGsMPZLd+jU1Bb9m2DVgkPIIPzD
         mSymyd6TKUUPxa0cmZrEq35eijkXvKZOVa4+dCFxLy0L1NJNXLF16hBSdBGHf5xrP/HE
         Pbm0Ottkcm/px49kS0e0AJBCIKRhOCjBoVGSJw8zs5GXP3dCnswKKV0yhjpcyyBofYwN
         GwxJRlaca6bDktlj2QRMq/Gwgk5/hzFAT1ucHnHeitLFn0UhVzZVACJNp8fDfszMoP+a
         3WXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EztsOSQl+RP5h9qvRRtX/Sl3F/U13v06BprEdGYn6Uw=;
        b=jvv7ivkDbcmEIHFljaai5PMBa3/cIBcAbrdPtVTIuCr1co51tCLfOd9oGn6BOQwgkm
         GfAD2J5o0ArtWMJSbp4SH3Ksbn8tRupLiLb6H7pOEKx1654g6DHt8BSgwDen1uv1x1vO
         SKXIaVNp1iEIk4gkl/ocQ/oaRK4dt8a6ATvvxxdild5+q4TmNI9mgXRgYHrXv/OMTbql
         yy2V9LMTLQRchTy0jUo80Ou1ybLquxyWRrTuz1gW6sc8goXy62eKXRBYzoblCyTQg+wf
         WqISA3p1N5i3kUyytAk9AH5wkwwC9N7M980Dx1LhHGR+l/pA4w3lA0s3O+uvWDw7oPGW
         9DRA==
X-Gm-Message-State: ACrzQf2a4uy8sBkqonKLGqMHUKS0y5EgiWwKaWt03kNdc/bSkSsoGllc
	Iy73Ks+L+CcPVoAJaVBmrK/zYQ==
X-Google-Smtp-Source: AMsMyM5bDAh23gvtCq3eJ3vrxaolcXZ5O4jBciUewwG9MxTZYN8yr39HQv+f1p2dUtApQlU1ZbJvmg==
X-Received: by 2002:a17:907:6eac:b0:78d:3862:4440 with SMTP id sh44-20020a1709076eac00b0078d38624440mr14154722ejc.427.1665394830863;
        Mon, 10 Oct 2022 02:40:30 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id e15-20020a50fb8f000000b00459f4974128sm6825179edq.50.2022.10.10.02.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 02:40:30 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	conor.dooley@microchip.com,
	vernon2gm@gmail.com,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] RISC-V: KVM: Fix compilation without RISCV_ISA_ZICBOM
Date: Mon, 10 Oct 2022 11:40:29 +0200
Message-Id: <20221010094029.1579672-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_024035_390374_853E5B16 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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

Fix undefined reference of riscv_cbom_block_size when compiling KVM
without RISCV_ISA_ZICBOM. Note, RISCV_ISA_ZICBOM is a sufficient
guard as it selects RISCV_DMA_NONCOHERENT, which is needed to compile
dma-noncoherent.c (which is the file where riscv_cbom_block_size and
its initializer live).

Fixes: afd5dde9a186 ("RISC-V: KVM: Provide UAPI for Zicbom block size")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index a032c4f0d600..e4453caba728 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -265,11 +265,13 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
 	case KVM_REG_RISCV_CONFIG_REG(isa):
 		reg_val = vcpu->arch.isa[0] & KVM_RISCV_BASE_ISA_MASK;
 		break;
+#ifdef CONFIG_RISCV_ISA_ZICBOM
 	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
 		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOM))
 			return -EINVAL;
 		reg_val = riscv_cbom_block_size;
 		break;
+#endif
 	default:
 		return -EINVAL;
 	}
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
