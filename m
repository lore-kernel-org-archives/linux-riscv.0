Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F69CCD185
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 00:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OFPKVcGEIPf2Tbcv20R5CAx5bJ6/QlWKLTu1Q4FnOfY=; b=Sve37tBvpgFqmF
	MLzNoxSTkqGHqMt/RGq5dYZJ/6A/dCLcb2WHkWm+V+U2dg23WzBTAysuDPuTTB97m1DsT5jxKlUeC
	vtl3KT90lOkon/fB2t+z+C0hVLlRfDJ/UYX0Yshd7vqebnE2wZV66Iy++GJ++oC3RmXSRvID1Ot9q
	MG+3cZMj1ZSfuLCCwWSFnfUF3K1nflvilCtbp4WQuaokxcjk9pBe+iL0N652BPGetcutR/RVYxSII
	YZWvCvsiVB0owjjlX1NFnt+cMmXTLHlpDcV/+JpVfawwnXS8MYyHL+ozarLQQtTs9NkpWkqAVwokT
	3I0NJfYhC8L17BEQS+0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9BgF-000000038Ms-2tHb;
	Thu, 16 Oct 2025 00:17:20 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9BgD-000000038M4-0fjP
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 00:17:18 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b6093f8f71dso59617a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 17:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760573836; x=1761178636; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bwptj4G5KoYvNAhjikL6LhizMbH7cKsoQglRkksgDsw=;
        b=QpXI75rgVyrbeDoQk9EVgYONBF/7hQeKw12z/iiVqkq2OEOvCtmLmNxXSG3RROoEtK
         uVST0R24gAR1oVzotvJASWFvPcEUk8lYeWQe3W0mMDQNdEoJ2NLxmOMuxxFy1hpFCzYF
         9Pt7AZRsAYxo85wFnrtYgenImXxo8f18UcxnXYq0Zi+XWvwckoaaEhs8fTlo4gQJHblo
         15hg+HGo9AGsfEEeGDA3cM0fIRskVBl9MLrQTnYG+30f92mHkW3sfD5PWdG0DWRdgPvl
         pAa0yHMoxSzOvMtCD/4rj/laDkOVzUKpzY4emX0TH3o7iA+HgXhd4A7hS20jzeqGkNGy
         niSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760573836; x=1761178636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bwptj4G5KoYvNAhjikL6LhizMbH7cKsoQglRkksgDsw=;
        b=MepvOl8ZMmhbBdM5nIYm7h+LCe0EWfP0gCJE0Ilyd4g1mGg0riROZ1AW/lb7X/E9v8
         5hCQmEfP2+WXgo67Z/t5ZJA6ttQn3MggHVfE7qQI9AssoIyDUmqMwyO1nid8qSaWjEZr
         bzggz+mNf5OW2hwqTCQHNpuaUXnWgVRjBHWK03VhJjif1rcRxbCF5v7qsrb953HzxVuz
         46ryZyO5bL7D7AGDa8PUb+UYQWZjBDraEJuXuZidv2Us0jL5u0tiiZXGoaso6Ec7VMZx
         4fhXDiD/dzAETJ8ryau3Ct0tGudTz6lddekbdL/Hpkv0dtOWefA1ffxYBPA3Y1sIBkBz
         Ypgw==
X-Forwarded-Encrypted: i=1; AJvYcCW4j3cxruDld2HvBkxD1uigDApD0I0w9fEfzAF+xVebP9sZWKwdYDJ4R5tusxp6Ned6yh2bkcymRv/gUA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx04C0Yj1NKEThkyWJKl5PaTGHFaC5FYkAiNCu9Vcis3LnxYGey
	mtuLwB1Vlhkq9dHEJmJ1i0AjQGOYz06ppZLpt86gqSAdvdeshtvHGh3FuUjo/c7xtEg=
X-Gm-Gg: ASbGnctmhLhLOFv9MK2vbH6GYHkPA9YLLD0NnFgRbNmS/LcMK2Dyq55fq2X1mRqVHVY
	2IfqII5z8TzSRvnkMa1zbV9mjjMaH+nKU+5oul1X0shHu16O5rUHSktNUDChy5Yc/p2YpqqtpjD
	XrReWx5J/jylaXrzDOOTyytvrtdXozS3E8BMWG9Ca3yo0cnWo67cW1siix1+kM/6sXO8tAGuYDc
	R1dSoDvGI3fHlMX+lp1xDVo+CL5GoFPZoqLmUpbeDAZQ0s7PT000q2jC+barDiDaY6TcFDVdjL+
	Bt2Yq3UKAS9/Iee6yIYJdsOvaZ4h++PhpmXzRy0cp1lvWiq3zjQEOF6iYA6JZ7hXiQ0AwU3G3Po
	BiDGHHGf4H4zmrEcwfcalayYBg2mqpcTo/qBefAhhvOlg/ORN+0CmBq4KmEnwQQb/cd1a4GjMeY
	uOaxBnC+YzrbrkaiaSsw1Afw==
X-Google-Smtp-Source: AGHT+IF8Txz7jrNpsSTJjE/JSeJk6k3fgDPYMzVbvQKqjcn0cbcXxdsvxtPavIzWrNBmcH4D/9ElyQ==
X-Received: by 2002:a17:903:2381:b0:275:c1e7:c7e with SMTP id d9443c01a7336-29027356a08mr313186275ad.4.1760573836372;
        Wed, 15 Oct 2025 17:17:16 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099afbdb5sm8484645ad.104.2025.10.15.17.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 17:17:15 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] RISC-V: KVM: Fix check for local interrupts on riscv32
Date: Wed, 15 Oct 2025 17:17:09 -0700
Message-ID: <20251016001714.3889380-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_171717_225616_54B6FF4F 
X-CRM114-Status: UNSURE (   9.77  )
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

To set all 64 bits in the mask on a 32-bit system, the constant must
have type `unsigned long long`.

Fixes: 6b1e8ba4bac4 ("RISC-V: KVM: Use bitmap for irqs_pending and irqs_pending_mask")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kvm/vcpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index bccb919ca615..5ce35aba6069 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -212,7 +212,7 @@ int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
 
 int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu)
 {
-	return (kvm_riscv_vcpu_has_interrupts(vcpu, -1UL) &&
+	return (kvm_riscv_vcpu_has_interrupts(vcpu, -1ULL) &&
 		!kvm_riscv_vcpu_stopped(vcpu) && !vcpu->arch.pause);
 }
 
-- 
2.47.2

base-commit: 5a6f65d1502551f84c158789e5d89299c78907c7
branch: up/kvm-aia-fix

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
