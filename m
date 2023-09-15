Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E9E0EE643D
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 08:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=trj5l6htOFp3qM5j4Z2hYYdWQ+RPlZWoLbhp4M2YLXQ=; b=DAXyBZNyw4G4Yx
	/sY5BcSEnAkrv9GeTnBEVJwP8umaXOcr4w7EjsJpBocmtgzBWj6XCF3k/HrxjEPeIUk41NiX6p1XA
	V6PEEBnP2sh/cZxZRaeJztIAl99q0FQakUEXxkKifAhb27lhe3+ST99U4wBWgx0xJ+mdWzZ/kmIOu
	MYCo/4l3Aq+VbWsv0Eee2xF2g+Q9FDPHKMfkJ03mDRVj44iOuXgU45UbdiVftvRSDeitHTEZu5hIE
	zIJylOS5dmdoj0LYvKe9MCDHDCq1+IV9DxTrLwfTq75JNbUyoPadupiOcKw8NRAflSGnFGDl2p7vO
	fG9fsmDMP6R8WWoOcgyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qh4Ai-00A9Vq-2K;
	Fri, 15 Sep 2023 08:27:28 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qh4Ag-00A9U3-2T
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 08:27:28 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c337aeefbdso17318465ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Sep 2023 01:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1694766444; x=1695371244; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vCzI3E8aO188t/F32/cMXTqfHUINrJvH0Tp5qCpKPJc=;
        b=OhDa7G6cBuVXpZ6yGbDRXRwb+f6889GG/v41XjSg1k+aDY7LVxdhokoZCRqkRJdi0X
         lSbxEKAk+iQXwQRfAe8nLaWVrtVoyHDk/00i2tjjlaPZZWI8geJ97HAj8v6HAWd7AAQM
         UI5D7vmQxOvnDZA8utzNrvn+6CvIrDyeY8+IkkcLUENYVJhIjjaRAkSTqCrurNFqujNS
         kTA8LAPJBitEvWjkiAmDjBFJB9ImvBfWHdXxFxBcbNwWxlYJ8NI1SJ5TQbDnxuvqRRgp
         eI/wbfG+ET7RGtAnmWYXAyXIukCzQnxt5+aSgowZWcQHMtKmyYpwRFZeqEmzaXDkC++g
         WSEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694766444; x=1695371244;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vCzI3E8aO188t/F32/cMXTqfHUINrJvH0Tp5qCpKPJc=;
        b=h2y2/F80Dm+cafDiR4vI488oABbsg31vMDWkN4xrLqOT2fhdy/QsBFKrlLYGmiOrdi
         oL1XeKJQqTc1p0kz9+Gr4dHQYRDpWYviDF0/Kdoj/B6+bNU/Ep8/lfl6o2pV8msY0lyH
         wV2WfJjUMIwhELfa17tTYTDc6SpDTWizz/vH9fmwR2cKGyPR0PYdwDbwpIyWV1F8hrSE
         59LggQE16Kqsz9/3+CxPVcTyf81uQ5qidrO8uRZnv2NEaA9BP3Mlx7ubyBryXE+RVUQK
         jYzsx67o8tCFNRvc/bXBu4SeMRWZrQpZoiJTv/CdbEAYGlcv/k8l7pkzAc7jyy5sKpjF
         HXLw==
X-Gm-Message-State: AOJu0Yy1wQjmsJy4FisnbriMDmcn7S/GAQsgNrWfkaO8VnDqvv3DXxuv
	1DAALzGbZ1HotewvXgE2d/MUaS9bgw44ZOvJq/hBYpVyNeiZQ5fFJ4+Lti4Nsf0P9A44UB/35UF
	yoKYekpAj39945t0vL9MvVQnQP6ZYqz9RqqDOQpGL4wQYU4w0VLKgZQniXOqSm6VfUGtoCN1vIT
	e8v2XC3CGcmoWp6gJqzli8
X-Google-Smtp-Source: AGHT+IH1wq43BqO+fEUmA+uIVRiNalmd9lYZ4iknzz4/CvLaHWfCEV+kAVOQ50zw87BzU2Q8qcJyUg==
X-Received: by 2002:a17:902:6848:b0:1c0:e091:6a08 with SMTP id f8-20020a170902684800b001c0e0916a08mr847355pln.69.1694766443167;
        Fri, 15 Sep 2023 01:27:23 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id f4-20020a170902ab8400b001c0af36dd64sm2912806plr.162.2023.09.15.01.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 01:27:22 -0700 (PDT)
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	tjytimi@163.com,
	alex@ghiti.fr,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] RISC-V: KVM: Add Svadu Extension Support for Guest/VM
Date: Fri, 15 Sep 2023 08:26:58 +0000
Message-Id: <20230915082701.3643-3-yongxuan.wang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230915082701.3643-1-yongxuan.wang@sifive.com>
References: <20230915082701.3643-1-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_012726_803766_BEEC7C1A 
X-CRM114-Status: GOOD (  11.19  )
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

Also set the HADE bit in henvcfg CSR if Svadu extension is
available for Guest/VM.

Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
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
index 82229db1ce73..91b92a1f4e33 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -487,6 +487,9 @@ static void kvm_riscv_vcpu_update_config(const unsigned long *isa)
 	if (riscv_isa_extension_available(isa, ZICBOZ))
 		henvcfg |= ENVCFG_CBZE;
 
+	if (riscv_isa_extension_available(isa, SVADU))
+		henvcfg |= ENVCFG_HADE;
+
 	csr_write(CSR_HENVCFG, henvcfg);
 #ifdef CONFIG_32BIT
 	csr_write(CSR_HENVCFGH, henvcfg >> 32);
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 1b7e9fa265cb..211915dad677 100644
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
