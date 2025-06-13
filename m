Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1760BC71135
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 06:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g8ornIrHn5J6cNC8xlH/VOJtkecEu5DXfhTejjMPyLg=; b=YCFvN8Fi2Hy25v
	tA6cbc89JNthefIlRxfJl/FuGgMVkFZke2Sxh8ywLXPXN/bjTm8YS3O27/MHCcvwy4Zujd8sKU+VN
	PU5JS5eeGcWnDflgOhSk+TEbLU0mMNJIgK9kZm1hUL0Dy1WzX38xf3KHPypf0u3RI9Z1nFGqIbeOq
	ulYi6CVjt3M1kmIEhRBvhcwaAM8oRDLM4z7YXTQX2t3x9c8fR4KnxO5N97a05bZ/wDhggIVkayIhM
	NulxP0o8wJwxPsVMaB88bHGXQyAGT64AUf5zaJqY+3ZkO3th9AYCctU1ILuw5d1oNkmf4IidYddqi
	ZF32HEw9JQcdvSCgY/QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyMZ-0000000FXIW-0JDG;
	Fri, 13 Jun 2025 06:58:07 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyMW-0000000FXGp-2npg
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 06:58:05 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2350fc2591dso17296885ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 23:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749797884; x=1750402684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bKQfZHKenjLPRqEIi0Ln2Cx1EmVsnnUE8sKaMZB78eg=;
        b=mZdbOXEtLITuIh58Abm3E2WpQYFLUVTmOkoYfaYtQlXBmTKwZ12D86h72tkPbR8oI2
         ofJjBXGaWAworBy8zmj/PTo+hLq5fPAqZ6epurho4u8oZqNgZzcXfEIOJjJkf3l6TxMp
         icbiohR7d3XwfOsK0zQZqgF2PMIOwMYer6MyOyXM6ZwOUGT9vlSnqNueUH2Tvu5uthrL
         Kb2APgs8kGrOv7dZ1DeYx8tshK4XjfrMluLqeUBP7ho698SpGkFJZRAXN8zhY5u+NlAW
         DmsBecp2HMExXhEwA77owJ2ZPoKAJsr1/Dcv6pHC65elxjfHdk/o+SmoWcoyycnvF9mx
         WoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749797884; x=1750402684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bKQfZHKenjLPRqEIi0Ln2Cx1EmVsnnUE8sKaMZB78eg=;
        b=v2BIl4iLZkdpPdPQggIwc7VtQjwgo8jP+mjhm4mSNMwvxmL0gBG1lg1atTyIcKyL6W
         P6cMINs09vnCDFvX/jqbVYhByRYa9Nv/dyLuBsXcGLuKDGnnaSOLiPfcPP1jkQKSgvwH
         NoNV+lGS8fEFVrxNoW1Gc54ekrdvyiUTURKHV6hLdgvdqamG7BepWD1Th319Q0lXtUtr
         WhJl9DR9V3Qe2L5j8UDrm0NLtnbre6ztdRsOG9iB0qafeVOA5CXzzIMzb2ACyJvL5G1m
         nLoiJAc61CZGXuAH3WPY2vshsODQDO/DXTfdZO1iReumeJWN/4vc1YeEtXgpZgnK6mpM
         D/mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLpt/xjMbanYuO+xT+6U/ENYVhnwxu3dVFzK93UNgpEuZCzNRkacaHrx3CCFCto9/mrVKNmwEngMbztA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9FMot0SF20p/Jhf9UPrPCLOZJeH3Ip4czdga9EJo5RP3UCJqh
	PuxXeGBQPPxQU7hycVFpONKgKRkwD52ilvvCytR9brVY/OWx/5gq6zmi3sFWUxXRfQA=
X-Gm-Gg: ASbGnctPJc4MTJRKJuAz7Sz5N01buaxvG8ZHZItUrS5XejLdqzwy3zDC2wEDD+NSI6U
	3+GUcv6tNZO+uJltcptxDNSYKYECj0mJVFoMhkbvjey4FQdGnsG+pushJO8n2cW5Mk7A3X3FEUf
	Hye8Rb89Xw+uc5IO+jK3CyC7TgJh/3nDEt26YnxNikSaZsUYepRRagG1nT6mlu+/qWnZtVoIq8h
	LN8AR1AddFd9xafDw0WXqTx+uq5rmS1Fk6owtfDDc4DxBfYA+amnNqy46MZ/lQ3+VH2KLp6uq53
	YehsyWw4JOeYtAyGnPup8m+LyulwBKuoj0CgRYs9U+FPe+0Ka07MrOx+OiYFTCfJ54Sh8tFiAZQ
	x6njfL5fGAeGMiKZV4zE=
X-Google-Smtp-Source: AGHT+IG1oIFmYmo4nzolmhFmjeasCs1i1bS0vqnVVHiUcmyimhpiT1WD26mREN2ygRQRC/I3Yp7nzA==
X-Received: by 2002:a17:902:f647:b0:234:595d:a58e with SMTP id d9443c01a7336-2365fb73e68mr22915165ad.25.1749797883849;
        Thu, 12 Jun 2025 23:58:03 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b49b7fsm2653022a91.24.2025.06.12.23.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 23:58:03 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Nutty Liu <liujingqi@lanxincomputing.com>
Subject: [PATCH v2 02/12] RISC-V: KVM: Drop the return value of kvm_riscv_vcpu_aia_init()
Date: Fri, 13 Jun 2025 12:27:33 +0530
Message-ID: <20250613065743.737102-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613065743.737102-1-apatel@ventanamicro.com>
References: <20250613065743.737102-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_235804_708275_50993305 
X-CRM114-Status: GOOD (  11.47  )
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

The kvm_riscv_vcpu_aia_init() does not return any failure so drop
the return value which is always zero.

Reviewed-by: Nutty Liu<liujingqi@lanxincomputing.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_aia.h | 2 +-
 arch/riscv/kvm/aia_device.c      | 6 ++----
 arch/riscv/kvm/vcpu.c            | 4 +---
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
index 3b643b9efc07..0a0f12496f00 100644
--- a/arch/riscv/include/asm/kvm_aia.h
+++ b/arch/riscv/include/asm/kvm_aia.h
@@ -147,7 +147,7 @@ int kvm_riscv_vcpu_aia_rmw_ireg(struct kvm_vcpu *vcpu, unsigned int csr_num,
 
 int kvm_riscv_vcpu_aia_update(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_aia_reset(struct kvm_vcpu *vcpu);
-int kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_aia_deinit(struct kvm_vcpu *vcpu);
 
 int kvm_riscv_aia_inject_msi_by_id(struct kvm *kvm, u32 hart_index,
diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index 806c41931cde..b195a93add1c 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -509,12 +509,12 @@ void kvm_riscv_vcpu_aia_reset(struct kvm_vcpu *vcpu)
 	kvm_riscv_vcpu_aia_imsic_reset(vcpu);
 }
 
-int kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu)
+void kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vcpu_aia *vaia = &vcpu->arch.aia_context;
 
 	if (!kvm_riscv_aia_available())
-		return 0;
+		return;
 
 	/*
 	 * We don't do any memory allocations over here because these
@@ -526,8 +526,6 @@ int kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu)
 	/* Initialize default values in AIA vcpu context */
 	vaia->imsic_addr = KVM_RISCV_AIA_UNDEF_ADDR;
 	vaia->hart_index = vcpu->vcpu_idx;
-
-	return 0;
 }
 
 void kvm_riscv_vcpu_aia_deinit(struct kvm_vcpu *vcpu)
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index b467dc1f4c7f..f9fb3dbbe0c3 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -159,9 +159,7 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	kvm_riscv_vcpu_pmu_init(vcpu);
 
 	/* Setup VCPU AIA */
-	rc = kvm_riscv_vcpu_aia_init(vcpu);
-	if (rc)
-		return rc;
+	kvm_riscv_vcpu_aia_init(vcpu);
 
 	/*
 	 * Setup SBI extensions
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
