Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8747BEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 16:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=peW6N1VkUybYG1AesTS7kiSnPGM3UR+rdw451ZcTWtI=; b=vqwyqfGlE7tcFu
	LmbEvPyPPKg4+uC8Jdfr4zeBA3G/Vd3csTREtVOYJgPlKTUslso8JLFm2vKwBbgWsQ4D2xnnFZCT2
	PY5VnG+IM8xj+Q9pdJNPjaYjA7GdmdRJZ+gmdVGyX6iiZ1cOOZboqgIjZvRgaJqwMt/0vAnVM2UXK
	kEgUpnuuBnGUxGsAqpXd9Wy1TZcjImn411s32NSFDlQjncOjf7FDrZxUTxnXmQACi2dAtqh02Vz2J
	NLsHhCZaEE+HznRjhFAjTWM+hNIM6uCVRKG4312spi14V4+P+uaz5VXumehHWCvEt0xI0OF/mKrN5
	gGNixc5J5eDZ9PUmwFoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJcR9-000Tp3-23;
	Wed, 12 Jul 2023 16:11:31 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJcR5-000Tik-10
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 16:11:28 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1b8b2b60731so33359985ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 09:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1689178284; x=1691770284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gtCtF2Lqb1YygYwlUUaBy2ctB42EouI70e6s/Uz9+Cc=;
        b=EZkO2jmsowUwtRgDtIpbAptf0MaO6v+JJ4rLp6Fydhm3WGP1O6M9N26UzmspPwksWt
         A33s76ThRvy/igg9Y403/YV9StsFgmrOTRt+SSzsRHBZkSliHPdcIl1oxFONKI35UKkr
         8ySFxiJPbhgW0gFTA13HOZijL25Q8jHVyK7BopBPMovq/ajmTOUK3oxeJiecPUbe7rzi
         ZCxUmFrqpUCZUZWTQIZQ/lrrjrNB/5reJLh3GZnHICm7vO5PDsyIRD0rpwR8kmM/XrLm
         I3Ptl+6pK1xx7CgcLkx0lfK0Z8XkI/S2RlVFQWmP/jQN3eB7UF4daBbEuSvNeUDC6G/v
         lErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689178284; x=1691770284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gtCtF2Lqb1YygYwlUUaBy2ctB42EouI70e6s/Uz9+Cc=;
        b=k93THbsCBJc9sOQkx16gK3T1eT129IENKClROHYUgdGd2kK6oLxj9lMu6LCIveyFhi
         BtgqoarQ6kixi8id8In+xuvOR7NcSasLYV2UGo444axy+tUFfHyEBdC+mHRru7hq2PbH
         KePPQ8wF3kow5nAOj8o2xfQ+mRQl+52wC0nQJe0+tcLhj917SkD2BTadES3RBaoTVjHf
         KjrRhvmvYpgUb08KHKLfyNqSDzBQ84oXsSe0Ry0NyiDRpgl7B/RA8OQBL43mjA2/JmzY
         wBYN4wAJNvBM9c2kwSzRKL8lJcAVqW55jZJjkkIkkj8+xCAjD67W4D3kF7fIWS42wD4U
         mDCA==
X-Gm-Message-State: ABy/qLaaMrtxXiuwa3LbfORPvtQpHzNy1UOXy8r2kXk1kFUjUsnH9vHt
	LlCHEoZuWYZElVHUPOQgZwTG+w==
X-Google-Smtp-Source: APBJJlFvn0Tk0l05fNo16Otc3mdNQPBj68R9kqcdAv2EV8FHsvvk8krDKu/f/KUJP4LqHWd3c2A3vg==
X-Received: by 2002:a17:902:9a4b:b0:1ac:7245:ba5a with SMTP id x11-20020a1709029a4b00b001ac7245ba5amr13407006plv.61.1689178284234;
        Wed, 12 Jul 2023 09:11:24 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.82.173])
        by smtp.gmail.com with ESMTPSA id bc2-20020a170902930200b001b9f032bb3dsm3811650plb.3.2023.07.12.09.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 09:11:23 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Samuel Ortiz <sameo@rivosinc.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 6/7] RISC-V: KVM: Allow Zbc, Zbk* and Zk* extensions for Guest/VM
Date: Wed, 12 Jul 2023 21:40:46 +0530
Message-Id: <20230712161047.1764756-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230712161047.1764756-1-apatel@ventanamicro.com>
References: <20230712161047.1764756-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_091127_354218_9933A73C 
X-CRM114-Status: UNSURE (   8.66  )
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

We extend the KVM ISA extension ONE_REG interface to allow KVM
user space to detect and enable Zbc, Zbk* and Zk* extensions for
Guest/VM.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 11 +++++++++++
 arch/riscv/kvm/vcpu_onereg.c      | 22 ++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 9c35e1427f73..182e7bdfc842 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -130,6 +130,17 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_ZICSR,
 	KVM_RISCV_ISA_EXT_ZIFENCEI,
 	KVM_RISCV_ISA_EXT_ZIHPM,
+	KVM_RISCV_ISA_EXT_ZBC,
+	KVM_RISCV_ISA_EXT_ZBKB,
+	KVM_RISCV_ISA_EXT_ZBKC,
+	KVM_RISCV_ISA_EXT_ZBKX,
+	KVM_RISCV_ISA_EXT_ZKND,
+	KVM_RISCV_ISA_EXT_ZKNE,
+	KVM_RISCV_ISA_EXT_ZKNH,
+	KVM_RISCV_ISA_EXT_ZKR,
+	KVM_RISCV_ISA_EXT_ZKSED,
+	KVM_RISCV_ISA_EXT_ZKSH,
+	KVM_RISCV_ISA_EXT_ZKT,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 36871a417e69..08e077260214 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -40,6 +40,10 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(SVPBMT),
 	KVM_ISA_EXT_ARR(ZBA),
 	KVM_ISA_EXT_ARR(ZBB),
+	KVM_ISA_EXT_ARR(ZBC),
+	KVM_ISA_EXT_ARR(ZBKB),
+	KVM_ISA_EXT_ARR(ZBKC),
+	KVM_ISA_EXT_ARR(ZBKX),
 	KVM_ISA_EXT_ARR(ZBS),
 	KVM_ISA_EXT_ARR(ZICBOM),
 	KVM_ISA_EXT_ARR(ZICBOZ),
@@ -48,6 +52,13 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(ZIFENCEI),
 	KVM_ISA_EXT_ARR(ZIHINTPAUSE),
 	KVM_ISA_EXT_ARR(ZIHPM),
+	KVM_ISA_EXT_ARR(ZKND),
+	KVM_ISA_EXT_ARR(ZKNE),
+	KVM_ISA_EXT_ARR(ZKNH),
+	KVM_ISA_EXT_ARR(ZKR),
+	KVM_ISA_EXT_ARR(ZKSED),
+	KVM_ISA_EXT_ARR(ZKSH),
+	KVM_ISA_EXT_ARR(ZKT),
 };
 
 static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
@@ -89,12 +100,23 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_SVNAPOT:
 	case KVM_RISCV_ISA_EXT_ZBA:
 	case KVM_RISCV_ISA_EXT_ZBB:
+	case KVM_RISCV_ISA_EXT_ZBC:
+	case KVM_RISCV_ISA_EXT_ZBKB:
+	case KVM_RISCV_ISA_EXT_ZBKC:
+	case KVM_RISCV_ISA_EXT_ZBKX:
 	case KVM_RISCV_ISA_EXT_ZBS:
 	case KVM_RISCV_ISA_EXT_ZICNTR:
 	case KVM_RISCV_ISA_EXT_ZICSR:
 	case KVM_RISCV_ISA_EXT_ZIFENCEI:
 	case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
 	case KVM_RISCV_ISA_EXT_ZIHPM:
+	case KVM_RISCV_ISA_EXT_ZKND:
+	case KVM_RISCV_ISA_EXT_ZKNE:
+	case KVM_RISCV_ISA_EXT_ZKNH:
+	case KVM_RISCV_ISA_EXT_ZKR:
+	case KVM_RISCV_ISA_EXT_ZKSED:
+	case KVM_RISCV_ISA_EXT_ZKSH:
+	case KVM_RISCV_ISA_EXT_ZKT:
 		return false;
 	default:
 		break;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
